Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D93222B2500
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 20:57:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXq515cLnzDqTb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Nov 2020 06:57:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Rz7bo515; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXq3K0PrRzDr74
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Nov 2020 06:56:12 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id 199so9949541qkg.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 11:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BuSBR3W0Up+xs4RMbJtfRRlgixduLeoiJlhk7xnEIR0=;
 b=Rz7bo5155yveyQ9ZrU3UXRmgFVAlpmKkI/wTgDabwLcf/AW274xZWtGwKaoFUHCuWV
 AlUe5BkWT/spMfkjOhGCLbH/P6zUhfVdE0Ya0L1jSSCP5uofyayDsp4lUMXVQtrOM4iq
 ymSNPlt7IqY/MlDkIJMQo1VjmPcK94pRwWf4QkNu+vVjHunZEg9cnxjY4plQCq/MKl+H
 cCHXsuMrxAVYpHLpMIehHAJKLLkv6OrYRA/SZyIZR3JxxDw5jpL2lTKg1vC3GAVhk/rE
 /vPKiSV5CAXK/3t0WeX1/3ZNsY/Ul5dLS8lV0uol/Cj+UtRt/Zk4sIh6yididMuf64Ba
 GLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BuSBR3W0Up+xs4RMbJtfRRlgixduLeoiJlhk7xnEIR0=;
 b=eUid7PqHsH3abMYOHqK4rJoRgggS05/0S8LCsPKMbnFV8NzGIQb1aaVzEqO+S9Bxxe
 G4Vda105tw8+wjo4Jlo8fjFkQ1wVOg49rpW87vyfJMsN825lvfXcOJLnyC8wo+Vb8CDX
 XG1BRyyLu/39TZ/9NO3qcEymOVNeWHLi4QX++xrbRgTcq8uDJprWrprOjzJagAZadD0f
 r6awfQQct7tAlg7aif4yo49vTBlpA8KfcguWX4c6zRK41Dnx01w/jr6upnPXVm7T4UgY
 ub5/kP0rShBI/h6yorJzMjCz/Okwq7acb7GQIxLdqVkAtT5LNo3tHmpIvzkH7XmIqykB
 5DGw==
X-Gm-Message-State: AOAM530+0By4NzdkB+xE+vg7TNYXmsT90OywxMyxsuHyfWvyHBro3LHB
 gqCjA+HMu01O+vYyXxhitgE=
X-Google-Smtp-Source: ABdhPJzdFZIQVJ1DipALLbMQzdXhQ7LqTzyxp6paaFlRduPmNj6wrsGfChmfjhdHmK67f9IFeZWQKQ==
X-Received: by 2002:ae9:dec5:: with SMTP id s188mr3767153qkf.250.1605297369148; 
 Fri, 13 Nov 2020 11:56:09 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id z26sm6977757qki.40.2020.11.13.11.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 11:56:08 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>
Subject: [PATCH 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld 10.0.1
Date: Fri, 13 Nov 2020 12:55:53 -0700
Message-Id: <20201113195553.1487659-2-natechancellor@gmail.com>
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

Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
Reported-by: kernelci.org bot <bot@kernelci.org>
Reported-by: Mark Brown <broonie@kernel.org>
Link: https://github.com/ClangBuiltLinux/linux/issues/1187
Link: https://github.com/ClangBuiltLinux/linux/issues/1193
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 MAINTAINERS            |  1 +
 init/Kconfig           |  6 +++++-
 scripts/lld-version.sh | 20 ++++++++++++++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100755 scripts/lld-version.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index 3da6d8c154e4..4b83d3591ec7 100644
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
index a270716562de..40c9ca60ac1d 100644
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
@@ -1349,7 +1353,7 @@ config LD_DEAD_CODE_DATA_ELIMINATION
 	  own risk.
 
 config LD_ORPHAN_WARN
-	def_bool ARCH_WANT_LD_ORPHAN_WARN && $(ld-option,--orphan-handling=warn)
+	def_bool ARCH_WANT_LD_ORPHAN_WARN && $(ld-option,--orphan-handling=warn) && (!LD_IS_LLD || LLD_VERSION >= 110000)
 
 config SYSCTL
 	bool
diff --git a/scripts/lld-version.sh b/scripts/lld-version.sh
new file mode 100755
index 000000000000..cc779f412e39
--- /dev/null
+++ b/scripts/lld-version.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# ld.lld-version ld.lld-command
+#
+# Print the linker version of `ld.lld-command' in a 5 or 6-digit form
+# such as `100001' for ld.lld 10.0.1 etc.
+
+linker="$*"
+
+if ! ( $linker --version | grep -q LLD ); then
+	echo 0
+	exit 1
+fi
+
+VERSION=$($linker --version | cut -d ' ' -f 2)
+MAJOR=$(echo $VERSION | cut -d . -f 1)
+MINOR=$(echo $VERSION | cut -d . -f 2)
+PATCHLEVEL=$(echo $VERSION | cut -d . -f 3)
+printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
-- 
2.29.2

