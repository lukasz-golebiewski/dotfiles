import net.ceedubs.sbtctags.CtagsKeys

CtagsKeys.ctagsParams ~= (_.copy(languages = Seq("scala")))
CtagsKeys.ctagsParams ~= (default => default.copy(tagFileName = "TAGS", extraArgs = "-e" +: default.extraArgs))
