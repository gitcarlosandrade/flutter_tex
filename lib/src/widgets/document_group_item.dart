import 'package:flutter_tex/flutter_tex.dart';
import 'package:flutter_tex/src/models/widget_meta.dart';
import 'package:flutter_tex/src/utils/strings_util.dart';
import 'package:flutter_tex/src/utils/style_utils.dart';

class TeXViewDocumentGroupItem extends TeXViewWidget {
  final String? id;

  /// Raw String containing HTML and TEX Code e.g. r"""$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$<br> """
  final String data;

  final bool? checked;

  final int index;

  /// Style TeXView Widget with [TeXViewStyle].
  final TeXViewStyle? style;

  const TeXViewDocumentGroupItem(
    this.data, {
    this.id,
    this.style,
    this.checked = false,
    this.index = -1,
  });

  @override
  TeXViewWidgetMeta meta() {
    return TeXViewWidgetMeta(
        id: this.id,
        tag: 'div',
        classList: 'tex-view-document',
        node: Node.Leaf);
  }

  @override
  Map toJson() => {
        'meta': meta().toJson(),
        'data':
            '${getLetterItem()} <input type="radio" id="${this.id}" name="alternative" ${this.checked == true ? "checked" : ""}> &nbsp ${this.data}',
        'style': this.style?.initStyle() ?? teXViewDefaultStyle,
      };

  String getLetterItem() => this.index <= -1 ? "" : '${alphabet[index]})';
}
