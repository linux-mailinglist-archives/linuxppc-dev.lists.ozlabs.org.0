Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1192B9C6C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 22:02:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcXFS1hPQzDqDc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 08:02:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uDFEv2oS; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcX6m6ncczDqpK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 07:57:04 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id 11so6872095qkd.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 12:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=moOxL8imdBPuCB1TVd3+9oe+UH2t4tfUVnJemRAZuA4=;
 b=uDFEv2oScZscfpUCpr67JL0lOgnOI2BRUTpuJW+ttBg6ndIPmOtvf/Eo2k8Zmv2ugf
 oDnMkWwJWkaUbEV6jTqWFv7pohpcppcktwsiY/wY4BTaJyx4RxBlz3EH+T3Lq6L1Sgr3
 tzMaPbwyM/aKUan7BooGbju0FVUuFOUqqiUToeSJx5O8HCA7LhirNm30a3XnmDRg/22W
 5Y3s6e5hgbOwZVEs2apioEy3pFEo8SahFW9IRvT4xr9kAxqBj1RU1MJHL1FcRM8e474A
 eGxEK0OzM5WkEL/VHKL9sFQVM8vVJnhmFOmj3kETGLstLEhDF6RipfyWwJOgPBFe+pHD
 WxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=moOxL8imdBPuCB1TVd3+9oe+UH2t4tfUVnJemRAZuA4=;
 b=jJN27WmKKS/WpycGfgP63Z3erDQ6L7P+iQtUpydE4e5ruQni1IiDVzlegXVRRkavPP
 tpIK758YG1puZ3pVgqzgyfITduoPXBYq4JtdQSNy9uNIuY960/6vOzaheSLGXnbo12By
 pMJRKX9g0fSyg5uJhW+df/A06g6i2Nwzgtp/eAP8Ak3iplNkxhXMT55YGwQTDUoxPyoS
 42PZQP9MmpyJsh5bCkpeLBE2ynxmzu9zPwrlLEDyTWzNVY3S8xoHDI636p8Pl8mTlwMT
 bAX4Qrqlf2lxd/TibtoTIUaCNL96LrX6+ddyddEP6f7aC4iBDVJ11gNSuqYJ1tQRFTiP
 dArg==
X-Gm-Message-State: AOAM531RoKMOyYRGFqyY0DS8NblwP3IIoJPpf+QcJvhDBiCWGkq7gnT9
 HCPKInslqH1ZxNl7FLuyMcA=
X-Google-Smtp-Source: ABdhPJykpdxUp+qOeObH8VdNp8zHwtu+fKXhT5aKLKVjsWBWyNKin9ChMzRWd+T5YA1Zo00LWaPkwg==
X-Received: by 2002:a37:6688:: with SMTP id
 a130mr12248572qkc.163.1605819421641; 
 Thu, 19 Nov 2020 12:57:01 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id 82sm714348qke.76.2020.11.19.12.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 12:57:00 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>
Subject: [PATCH v2 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld 10.0.1
Date: Thu, 19 Nov 2020 13:46:58 -0700
Message-Id: <20201119204656.3261686-2-natechancellor@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201113195553.1487659-1-natechancellor@gmail.com>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, "kernelci . org bot" <bot@kernelci.org>,
 linux-kbuild@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Mark Brown <broonie@kernel.org>, x86@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Arvind Sankar <nivedita@alum.mit.edu>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ld.lld 10.0.1 spews a bunch of various warnings about .rela sections,
along with a few others. Newer versions of ld.lld do not have these
warnings. As a result, do not add '--orphan-handling=warn' to
LDFLAGS_vmlinux if ld.lld's version is not new enough.

Link: https://github.com/ClangBuiltLinux/linux/issues/1187
Link: https://github.com/ClangBuiltLinux/linux/issues/1193
Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
Reported-by: kernelci.org bot <bot@kernelci.org>
Reported-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2:

* Add condition as a depends on line (Kees Cook)

* Capture output of "$* --version" to avoid invoking linker twice (Nick
  Desaulniers)

* Improve documentation of script in comments (Nick Desaulniers)

* Pick up review tag from Kees

 MAINTAINERS            |  1 +
 init/Kconfig           |  5 +++++
 scripts/lld-version.sh | 20 ++++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100755 scripts/lld-version.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index e451dcce054f..e6f74f130ae1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4284,6 +4284,7 @@ B:	https://github.com/ClangBuiltLinux/linux/issues
 C:	irc://chat.freenode.net/clangbuiltlinux
 F:	Documentation/kbuild/llvm.rst
 F:	scripts/clang-tools/
+F:	scripts/lld-version.sh
 K:	\b(?i:clang|llvm)\b
 
 CLEANCACHE API
diff --git a/init/Kconfig b/init/Kconfig
index 92c58b45abb8..b9037d6c5ab3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -47,6 +47,10 @@ config CLANG_VERSION
 	int
 	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
 
+config LLD_VERSION
+	int
+	default $(shell,$(srctree)/scripts/lld-version.sh $(LD))
+
 config CC_CAN_LINK
 	bool
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
@@ -1351,6 +1355,7 @@ config LD_DEAD_CODE_DATA_ELIMINATION
 config LD_ORPHAN_WARN
 	def_bool y
 	depends on ARCH_WANT_LD_ORPHAN_WARN
+	depends on !LD_IS_LLD || LLD_VERSION >= 110000
 	depends on $(ld-option,--orphan-handling=warn)
 
 config SYSCTL
diff --git a/scripts/lld-version.sh b/scripts/lld-version.sh
new file mode 100755
index 000000000000..d70edb4d8a4f
--- /dev/null
+++ b/scripts/lld-version.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Usage: $ ./scripts/lld-version.sh ld.lld
+#
+# Print the linker version of `ld.lld' in a 5 or 6-digit form
+# such as `100001' for ld.lld 10.0.1 etc.
+
+linker_string="$($* --version)"
+
+if ! ( echo $linker_string | grep -q LLD ); then
+	echo 0
+	exit 1
+fi
+
+VERSION=$(echo $linker_string | cut -d ' ' -f 2)
+MAJOR=$(echo $VERSION | cut -d . -f 1)
+MINOR=$(echo $VERSION | cut -d . -f 2)
+PATCHLEVEL=$(echo $VERSION | cut -d . -f 3)
+printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
-- 
2.29.2

