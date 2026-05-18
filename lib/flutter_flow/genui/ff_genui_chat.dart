// Auto-generated shared GenUI Chat Widget
// This widget is parameterized and reused by all GenUI chat instances in the project.
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:genui/genui.dart';


/// Common system prompt for GenUI surface management.
/// This is combined with user-specific prompts at runtime.
const String kGenUISurfaceManagementPrompt = '''
## Response Strategy: UI-First Approach

**ALWAYS prefer rendering UI components over sending text messages.**

Follow this decision tree for every response:

1. **Can a UI component fulfill the request?**
   - YES → Render the UI component ONLY. Do NOT add a text message.
   - NO → Continue to step 2.

2. **Does the UI component need explanation or context?**
   - YES → Render the UI component AND send a brief text message to explain.
   - NO → Just render the UI component.

3. **Is there no suitable UI component available?**
   - YES → Send a text message as a fallback.

**Key Principles:**
- If showing a UI component is sufficient, DO NOT send any text message.
- Only send text messages when they add value (explanations, clarifications, or when no UI component applies).
- Never duplicate information - if the UI shows it, don't repeat it in text.
- When in doubt, prefer UI over text.

## Controlling the UI

Use the provided tools to build and manage the user interface in response to
user requests. To display or update a UI:

1. Call `surfaceUpdate` to define all necessary components
2. Call `beginRendering` to specify the root component to display
3. Call `provideFinalOutput` to end your turn and give control back to the user

**CRITICAL: Once you add or update a surface and are waiting for user input,
the conversation turn is COMPLETE. You MUST call `provideFinalOutput` to end
your turn. Do NOT continue generating or calling more tools after this.**

Guidelines:
- Adding surfaces: Add new surfaces for new content
- Updating surfaces: Update existing surfaces during iterative flows
- ONE response per turn: Generate the UI you need, call `provideFinalOutput`,
  and STOP. Do not try to add more content or make additional updates.

## CRITICAL: Component Usage Rules

**You can ONLY use components that are explicitly listed in the "Available Components" section above.**

1. **No other components exist** - Do NOT try to use Column, Row, Container, or any other widget not listed.
2. **Each component is self-contained** - Components cannot be nested inside each other as children.
3. **One component per surface** - Each surface displays exactly ONE component as the root.
4. **All required parameters MUST be provided** - Never pass empty objects `{}` for components. Every required parameter must have a valid value.
5. **For multiple items of the same type** - Use a component that accepts a List parameter (e.g., TransactionList with a list of transactions), rather than trying to create multiple separate components.

**WRONG (do NOT do this):**
```json
{"component": {"MyComponent": {}}, "id": "surface1"}  // Empty object - INVALID, must provide all required parameters
```

**CORRECT:**
```json
{"component": {"MyComponent": {"requiredParam1": "value", "requiredParam2": 123}}, "id": "surface1"}  // All required parameters provided
```

## IMPORTANT REMINDERS

1. PREFER UI components over text messages - render UI first, text only when needed
2. After creating or updating a surface, ALWAYS call `provideFinalOutput`
3. Do NOT continue generating after calling `provideFinalOutput`
4. Wait for user input before making more changes
5. One surface per response is usually sufficient
6. ONLY use components from the "Available Components" list - no others exist
7. ALWAYS provide all required parameters - never use empty objects
''';

/// Builds the complete system prompt by combining user prompt with common instructions.
String buildGenUISystemPrompt(
    String userPrompt, String componentDocs, String functionDocs,
    {String appEventDocs = ''}) {
  final functionSection = functionDocs.isEmpty
      ? ''
      : '''

## Available Functions

You have access to these functions to retrieve data:

$functionDocs
''';

  final appEventSection = appEventDocs.isEmpty
      ? ''
      : '''

## App Event Context

This conversation receives context from app events. When an app event fires, a context message will be injected into the conversation history. Use this information to provide relevant, proactive assistance.

$appEventDocs
''';

  return '''
# Instructions

$userPrompt

## Available Components

You have access to these UI components to build the user interface:

$componentDocs
$functionSection$appEventSection
$kGenUISurfaceManagementPrompt
''';
}

/// Configuration for the GenUI chat backend.
/// Takes user prompt and component docs separately, builds full prompt internally.
class FFGenUIChatConfig {
  FFGenUIChatConfig({
    required this.userPrompt,
    required this.componentDocs,
    this.functionDocs = '',
    this.appEventDocs = '',
    required this.catalog,
    required this.contentGeneratorFactory,
    this.headerTitle,
    this.showHeader = true,
    this.showAvatars = true,
    this.avatarSize = 32.0,
    this.backgroundColor,
    this.borderRadius,
    this.scrollAnimationMs = 300,
    this.inputPlaceholder = 'Type a message...',
    this.thinkingMessage = 'Thinking...',
    this.onStatusChange,
    // Lifecycle callbacks for app event integration
    this.onConversationReady,
    this.onDispose,
    // Bubble styling
    this.userBubbleColor,
    this.userBubbleTextColor,
    this.userBubbleBorderRadius,
    this.aiBubbleColor,
    this.aiBubbleTextColor,
    this.aiBubbleBorderRadius,
    // Send button
    this.sendButtonIconColor,
    this.sendButtonBackgroundColor,
    // Welcome message
    this.showWelcome = true,
    this.welcomeTitle,
    this.welcomeSubtitle,
    // Padding & spacing
    this.contentPadding,
    this.messageSpacing = 8.0,
    this.maxContentWidth,
    // Input area styling
    this.inputAreaBackgroundColor,
    this.inputAreaBorderRadius,
    this.inputAreaPadding,
    // Header colors
    this.headerBackgroundColor,
    this.headerTextColor,
    // Avatar images
    this.userAvatarUrl,
    this.aiAvatarUrl,
    // Auto-scroll
    this.autoScroll = true,
  }) : systemPrompt = buildGenUISystemPrompt(
            userPrompt, componentDocs, functionDocs,
            appEventDocs: appEventDocs);

  /// The user-defined prompt (specific to each widget instance).
  final String userPrompt;

  /// Documentation for available components (specific to each widget instance).
  final String componentDocs;

  /// Documentation for available functions/tools (specific to each widget instance).
  final String functionDocs;

  /// Documentation for app events this widget listens to (specific to each widget instance).
  final String appEventDocs;

  /// The full system prompt (built from userPrompt + componentDocs + functionDocs + appEventDocs + common instructions).
  final String systemPrompt;

  final Catalog catalog;
  final ContentGenerator Function(
    Catalog catalog,
    String systemPrompt,
    BuildContext context, {
    void Function(String? status)? onStatusChange,
  }) contentGeneratorFactory;
  final String? headerTitle;
  final bool showHeader;
  final bool showAvatars;
  final double avatarSize;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final int scrollAnimationMs;
  final String inputPlaceholder;

  /// Message shown when AI is processing (before any function is called).
  final String thinkingMessage;

  /// Callback invoked when status changes. Used to propagate status to UI.
  final void Function(String? status)? onStatusChange;

  /// Called when the conversation is initialized and ready.
  /// Provides the conversation instance and a function to queue pending context messages.
  final void Function(GenUiConversation conversation,
          void Function(String contextMessage) addPendingContext)?
      onConversationReady;

  /// Called when the widget is being disposed.
  final VoidCallback? onDispose;

  // Bubble styling
  final Color? userBubbleColor;
  final Color? userBubbleTextColor;
  final BorderRadius? userBubbleBorderRadius;
  final Color? aiBubbleColor;
  final Color? aiBubbleTextColor;
  final BorderRadius? aiBubbleBorderRadius;
  // Send button
  final Color? sendButtonIconColor;
  final Color? sendButtonBackgroundColor;
  // Welcome message
  final bool showWelcome;
  final String? welcomeTitle;
  final String? welcomeSubtitle;
  // Padding & spacing
  final EdgeInsets? contentPadding;
  final double messageSpacing;
  final double? maxContentWidth;
  // Input area styling
  final Color? inputAreaBackgroundColor;
  final BorderRadius? inputAreaBorderRadius;
  final EdgeInsets? inputAreaPadding;
  // Header colors
  final Color? headerBackgroundColor;
  final Color? headerTextColor;
  // Avatar images
  final String? userAvatarUrl;
  final String? aiAvatarUrl;
  // Auto-scroll
  final bool autoScroll;
}

/// Shared GenUI Chat Widget that accepts configuration as parameters.
class FFGenUIChat extends StatefulWidget {
  const FFGenUIChat({
    super.key,
    required this.config,
    this.width,
    this.height,
  });

  final FFGenUIChatConfig config;
  final double? width;
  final double? height;

  @override
  State<FFGenUIChat> createState() => _FFGenUIChatState();
}

class _FFGenUIChatState extends State<FFGenUIChat>
    with TickerProviderStateMixin {
  late final GenUiConversation _conversation;
  late final A2uiMessageProcessor _messageProcessor;
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final _focusNode = FocusNode();
  bool _isInitialized = false;

  /// Current status message to show (null = no status bubble).
  final _statusMessage = ValueNotifier<String?>(null);

  /// Pending context messages from app events (context-only mode).
  /// These are flushed into conversation history before the next user message.
  /// Capped to prevent unbounded growth if events fire rapidly.
  static const _maxPendingContextMessages = 50;
  final List<String> _pendingContextMessages = [];

  void _addPendingContext(String message) {
    if (_pendingContextMessages.length >= _maxPendingContextMessages) {
      _pendingContextMessages.removeAt(0);
    }
    _pendingContextMessages.add(message);
  }

  /// Injects pending context messages into conversation history
  /// without triggering inference.
  ///
  /// NOTE: This accesses GenUiConversation internals. If the genui package
  /// adds a public API for injecting messages, migrate to that instead.
  void _injectPendingContext(List<String> messages) {
    if (_conversation.conversation is! ValueNotifier<List<ChatMessage>>) {
      debugPrint(
          'GenUI conversation type mismatch: cannot inject pending context');
      return;
    }
    final notifier =
        _conversation.conversation as ValueNotifier<List<ChatMessage>>;
    notifier.value = [
      ...notifier.value,
      ...messages.map((ctx) => InternalMessage(ctx)),
    ];
  }

  FFGenUIChatConfig get config => widget.config;

  @override
  void initState() {
    super.initState();
    _initializeConversation();
  }

  Future<void> _initializeConversation() async {
    _messageProcessor = A2uiMessageProcessor(catalogs: [config.catalog]);

    final contentGenerator = config.contentGeneratorFactory(
      config.catalog,
      config.systemPrompt,
      context,
      onStatusChange: _updateStatus,
    );

    _conversation = GenUiConversation(
      a2uiMessageProcessor: _messageProcessor,
      contentGenerator: contentGenerator,
      onSurfaceUpdated: (_) => _scrollToBottom(),
      onSurfaceAdded: (_) {
        _scrollToBottom();
      },
      onTextResponse: (text) {
        _updateStatus(null);
        if (text.isNotEmpty) _scrollToBottom();
      },
      onError: (error) {
        _updateStatus(null); // Clear status on error
        debugPrint('GenUI Error: ${error.error}');
      },
    );

    if (!mounted) return;
    setState(() {
      _isInitialized = true;
    });

    config.onConversationReady?.call(_conversation, _addPendingContext);
  }

  void _scrollToBottom() {
    if (!config.autoScroll) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        final duration = config.scrollAnimationMs > 0
            ? Duration(milliseconds: config.scrollAnimationMs)
            : const Duration(milliseconds: 300);
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: duration,
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty || _conversation.isProcessing.value) return;
    _textController.clear();
    // Explicitly retain focus - widget rebuilds can cause focus loss
    _focusNode.requestFocus();
    _scrollToBottom();
    // Flush pending context into conversation history WITHOUT triggering
    // inference. When sendRequest(UserMessage) fires next, its history
    // snapshot will include these InternalMessages, so the AI sees the
    // context alongside the user's question in a single inference call.
    final pendingContext = List<String>.of(_pendingContextMessages);
    _pendingContextMessages.clear();
    if (pendingContext.isNotEmpty) {
      _injectPendingContext(pendingContext);
    }
    // Show "Thinking..." status when user sends a message
    _statusMessage.value = config.thinkingMessage;
    config.onStatusChange?.call(config.thinkingMessage);
    _conversation.sendRequest(UserMessage.text(text));
  }

  /// Updates the status message from external sources (e.g., tool execution).
  void _updateStatus(String? status) {
    _statusMessage.value = status;
    config.onStatusChange?.call(status);
  }

  @override
  void dispose() {
    config.onDispose?.call();
    _statusMessage.dispose();
    _textController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    _conversation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = config.backgroundColor ?? Color(0xFFF5F5F5);
    final radius = config.borderRadius ?? BorderRadius.zero;

    if (!_isInitialized) {
      return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(color: bgColor, borderRadius: radius),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final hasBoundedHeight = constraints.maxHeight != double.infinity;
        final effectiveHeight =
            hasBoundedHeight ? constraints.maxHeight : (widget.height ?? 500.0);

        return Container(
          width: widget.width,
          height: effectiveHeight,
          decoration: BoxDecoration(color: bgColor, borderRadius: radius),
          child: SizedBox(
            height: effectiveHeight,
            child: Column(
              children: [
                if (config.showHeader) _buildHeader(),
                Expanded(
                  child: ValueListenableBuilder<List<ChatMessage>>(
                    valueListenable: _conversation.conversation,
                    builder: (context, messages, _) {
                      final visible = messages.where(_isRenderable).toList();
                      if (visible.isEmpty) {
                        return _buildWelcomeMessage();
                      }
                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              controller: _scrollController,
                              padding: config.contentPadding ??
                                  const EdgeInsets.all(16),
                              itemCount: visible.length,
                              itemBuilder: (context, index) =>
                                  _buildMessage(visible[index]),
                            ),
                          ),
                          // Status bubble at bottom of messages
                          _buildStatusBubble(),
                        ],
                      );
                    },
                  ),
                ),
                _buildInputArea(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    final headerBg = config.headerBackgroundColor ??
        Theme.of(context).primaryColor.withValues(alpha: 0.1);
    final headerFg = config.headerTextColor ?? Theme.of(context).primaryColor;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: headerBg,
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.smart_toy, color: headerFg),
          const SizedBox(width: 8),
          Text(
            config.headerTitle ?? 'Chat',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: headerFg,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeMessage() {
    if (!config.showWelcome) return const SizedBox.shrink();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_bubble_outline,
                size: 64, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            Text(
              config.welcomeTitle ?? 'Start a conversation',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              config.welcomeSubtitle ?? 'Type a message below to begin.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBubble() {
    return ValueListenableBuilder<String?>(
      valueListenable: _statusMessage,
      builder: (context, status, _) {
        if (status == null) return const SizedBox.shrink();

        final colorScheme = Theme.of(context).colorScheme;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color:
                    colorScheme.surfaceContainerHighest.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    status,
                    style: TextStyle(
                      color: colorScheme.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Whether a [ChatMessage] should be rendered in the chat UI.
  /// Filters out internal bookkeeping messages and empty AI responses
  /// (e.g. intermediate tool-call-only turns).
  bool _isRenderable(ChatMessage message) {
    if (message is InternalMessage) return false;
    if (message is ToolResponseMessage) return false;
    if (message is UserUiInteractionMessage) return false;
    if (message is AiTextMessage) {
      final text =
          message.parts.whereType<TextPart>().map((p) => p.text).join();
      return text.trim().isNotEmpty;
    }
    return true;
  }

  Widget _buildMessage(ChatMessage message) {
    final isUser = message is UserMessage;
    final isUiMessage = message is AiUiMessage;
    final colorScheme = Theme.of(context).colorScheme;
    final avatarRadius = config.avatarSize / 2;

    // UI messages (generated components) - render directly
    if (isUiMessage) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: config.messageSpacing / 2),
        child: _buildMessageContent(message),
      );
    }

    // Build avatar widgets
    Widget userAvatar() {
      if (config.userAvatarUrl != null && config.userAvatarUrl!.isNotEmpty) {
        return CircleAvatar(
          radius: avatarRadius,
          backgroundImage: NetworkImage(config.userAvatarUrl!),
          onBackgroundImageError: (_, __) {},
          child: const SizedBox.shrink(),
        );
      }
      return CircleAvatar(
        radius: avatarRadius,
        backgroundColor: colorScheme.primary,
        child: Icon(Icons.person,
            size: config.avatarSize * 0.5, color: colorScheme.onPrimary),
      );
    }

    Widget aiAvatar() {
      if (config.aiAvatarUrl != null && config.aiAvatarUrl!.isNotEmpty) {
        return CircleAvatar(
          radius: avatarRadius,
          backgroundImage: NetworkImage(config.aiAvatarUrl!),
          onBackgroundImageError: (_, __) {},
          child: const SizedBox.shrink(),
        );
      }
      return CircleAvatar(
        radius: avatarRadius,
        backgroundColor: colorScheme.primaryContainer,
        child: Icon(Icons.smart_toy,
            size: config.avatarSize * 0.5, color: colorScheme.primary),
      );
    }

    final bubbleColor = isUser
        ? (config.userBubbleColor ?? colorScheme.primaryContainer)
        : (config.aiBubbleColor ?? colorScheme.surfaceContainerHighest);
    final bubbleBorderRadius = isUser
        ? (config.userBubbleBorderRadius ?? BorderRadius.circular(16))
        : (config.aiBubbleBorderRadius ?? BorderRadius.circular(16));

    Widget bubbleContent = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: bubbleColor,
        borderRadius: bubbleBorderRadius,
      ),
      child: _buildMessageContent(message),
    );

    Widget bubbleWidget = Flexible(child: bubbleContent);
    if (config.maxContentWidth != null) {
      bubbleWidget = Flexible(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: config.maxContentWidth!),
          child: bubbleContent,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: config.messageSpacing / 2),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser && config.showAvatars) ...[
            aiAvatar(),
            const SizedBox(width: 8),
          ],
          bubbleWidget,
          if (isUser && config.showAvatars) ...[
            const SizedBox(width: 8),
            userAvatar(),
          ],
        ],
      ),
    );
  }

  Widget _buildMessageContent(ChatMessage message) {
    final theme = Theme.of(context);

    if (message case UserMessage(:final parts)) {
      final textParts = parts.whereType<TextPart>();
      if (textParts.isNotEmpty) {
        final baseStyle = theme.textTheme.bodyMedium;
        final style = config.userBubbleTextColor != null
            ? baseStyle?.copyWith(color: config.userBubbleTextColor)
            : baseStyle;
        return Text(
          textParts.map((p) => p.text).join(),
          style: style,
        );
      }
    }

    if (message case AiTextMessage(:final parts)) {
      final textContent = parts.whereType<TextPart>().map((p) => p.text).join();
      if (textContent.isNotEmpty) {
        final baseStyle = theme.textTheme.bodyMedium;
        final style = config.aiBubbleTextColor != null
            ? baseStyle?.copyWith(color: config.aiBubbleTextColor)
            : baseStyle;
        return Text(textContent, style: style);
      }
    }

    if (message case AiUiMessage()) {
      return _FrozenGenUiSurface(
        liveHost: _messageProcessor,
        message: message,
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildInputArea() {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: config.inputAreaPadding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: config.inputAreaBackgroundColor ?? colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: ValueListenableBuilder<bool>(
        valueListenable: _conversation.isProcessing,
        builder: (context, isProcessing, _) {
          return Row(
            children: [
              Expanded(child: _buildInputField(isProcessing)),
              const SizedBox(width: 12),
              if (isProcessing)
                _buildDefaultLoadingIndicator(colorScheme)
              else
                _buildSendButton(isProcessing),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInputField(bool isProcessing) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: config.inputAreaBackgroundColor ??
            colorScheme.surfaceContainerHighest,
        borderRadius: config.inputAreaBorderRadius ?? BorderRadius.circular(25),
      ),
      child: TextField(
        controller: _textController,
        focusNode: _focusNode,
        // Keep TextField enabled to retain focus; only disable submission during processing
        decoration: InputDecoration(
          hintText: config.inputPlaceholder,
          hintStyle: TextStyle(
            color: colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
        ),
        onSubmitted: isProcessing ? null : _sendMessage,
      ),
    );
  }

  Widget _buildSendButton(bool isProcessing) {
    final colorScheme = Theme.of(context).colorScheme;
    return IconButton.filled(
      onPressed: () => _sendMessage(_textController.text),
      icon: const Icon(Icons.send),
      style: IconButton.styleFrom(
        backgroundColor:
            config.sendButtonBackgroundColor ?? colorScheme.primary,
        foregroundColor: config.sendButtonIconColor ?? colorScheme.onPrimary,
      ),
    );
  }

  Widget _buildDefaultLoadingIndicator(ColorScheme colorScheme) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class _FrozenGenUiSurface extends StatefulWidget {
  const _FrozenGenUiSurface({
    required this.liveHost,
    required this.message,
  });

  final GenUiHost liveHost;
  final AiUiMessage message;

  @override
  State<_FrozenGenUiSurface> createState() => _FrozenGenUiSurfaceState();
}

class _FrozenGenUiSurfaceState extends State<_FrozenGenUiSurface> {
  late _FrozenGenUiHost _snapshotHost;

  @override
  void initState() {
    super.initState();
    _snapshotHost = _FrozenGenUiHost.fromMessage(
      liveHost: widget.liveHost,
      message: widget.message,
    );
  }

  @override
  void didUpdateWidget(covariant _FrozenGenUiSurface oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message.uiKey != widget.message.uiKey) {
      _snapshotHost = _FrozenGenUiHost.fromMessage(
        liveHost: widget.liveHost,
        message: widget.message,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GenUiSurface(
      key: widget.message.uiKey,
      host: _snapshotHost,
      surfaceId: widget.message.surfaceId,
    );
  }
}

class _FrozenGenUiHost implements GenUiHost {
  _FrozenGenUiHost._(
    this._liveHost,
    this._surfaceId,
    this._surfaceNotifier,
    this._dataModel,
  );

  factory _FrozenGenUiHost.fromMessage({
    required GenUiHost liveHost,
    required AiUiMessage message,
  }) {
    final frozenDefinition = UiDefinition.fromJson(message.definition.toJson());
    final dataSnapshot =
        _deepCopyJson(liveHost.dataModels[message.surfaceId]?.data);
    final dataModel = DataModel();
    dataModel.update(DataPath.root, dataSnapshot);
    return _FrozenGenUiHost._(
      liveHost,
      message.surfaceId,
      ValueNotifier<UiDefinition?>(frozenDefinition),
      dataModel,
    );
  }

  final GenUiHost _liveHost;
  final String _surfaceId;
  final ValueNotifier<UiDefinition?> _surfaceNotifier;
  final DataModel _dataModel;

  @override
  Iterable<Catalog> get catalogs => _liveHost.catalogs;

  @override
  Map<String, DataModel> get dataModels => {_surfaceId: _dataModel};

  @override
  DataModel dataModelForSurface(String surfaceId) => _dataModel;

  @override
  ValueNotifier<UiDefinition?> getSurfaceNotifier(String surfaceId) =>
      _surfaceNotifier;

  @override
  void handleUiEvent(UiEvent event) => _liveHost.handleUiEvent(event);

  @override
  Stream<GenUiUpdate> get surfaceUpdates => const Stream<GenUiUpdate>.empty();

  static Object? _deepCopyJson(Object? value) {
    if (value == null) {
      return const <String, Object?>{};
    }
    return jsonDecode(jsonEncode(value));
  }
}
