Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C58833707AD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 17:18:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FXXvB56rHz2yyS
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 01:18:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=E/Y5NiHG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.76;
 helo=conuserg-09.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=E/Y5NiHG; 
 dkim-atps=neutral
Received: from conuserg-09.nifty.com (conuserg-09.nifty.com [210.131.2.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FXXtY4vXYz2yhr
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 May 2021 01:18:13 +1000 (AEST)
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp
 [133.32.232.101]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id 141FFirA014188;
 Sun, 2 May 2021 00:15:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 141FFirA014188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1619882145;
 bh=u9G2y9j8kDI7ZQJXHPzFbSaa9rJKSH6IgG7TTQj7jqQ=;
 h=From:To:Cc:Subject:Date:From;
 b=E/Y5NiHGYWBCdK49NO0y6Qu2vvGHmQlyFFVptGIbXAAaoIGy8pjC6imlkiakgytni
 JZP2Z5pzajhdbQ/0C2H8goOoY8HdgxdHI8DfHIm4hSK/ZRB/SUnIBq+3rXrZFHJ+uJ
 HpDbDONoTW3tLDb+7U7GLOtj5WThv70KojHnCZVi/QhIhVbQlVrEB99glwjEO1fm0s
 zleWaVpLEnonAvu1y8hGYYJhm20aLE9Bq17KoF92T1gBaUxlMNJT5uGIPCSIIz0gN9
 5YKXQD0zN3lojtQzZOpjBYpy0dfkkVKLEJSUz2DixNVjUEJaCN3+/W1t1wZPC4dCsF
 L7ZzM5deu0ZTA==
X-Nifty-SrcIP: [133.32.232.101]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] Raise the minimum GCC version to 5.2
Date: Sun,  2 May 2021 00:15:38 +0900
Message-Id: <20210501151538.145449-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The current minimum GCC version is 4.9 except ARCH=arm64 requiring
GCC 5.1.

When we discussed last time, we agreed to raise the minimum GCC version
to 5.1 globally. [1]

I'd like to propose GCC 5.2 to clean up arch/powerpc/Kconfig as well.

This commit updates the minimum versions in scripts/min-tool-version.sh
and Documentation/process/changes.rst with trivial code cleanups.

More cleanups will be possible as follow-up patches, but this one must
be agreed and applied to the mainline first.

[1]: https://lore.kernel.org/lkml/CAHk-=wjHTpG+gMx9vqrZgo8Uw0NqA2kNjS87o63Zv3=WG2K3zA@mail.gmail.com/

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

I'd like Linus to pick up this patch
if there is no objection.


 Documentation/process/changes.rst | 2 +-
 arch/arm64/Kconfig                | 2 +-
 arch/powerpc/Kconfig              | 2 +-
 arch/riscv/Kconfig                | 2 +-
 include/linux/compiler-gcc.h      | 6 +-----
 lib/Kconfig.debug                 | 2 +-
 scripts/min-tool-version.sh       | 8 +-------
 7 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index dac17711dc11..cf104a8d1850 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -29,7 +29,7 @@ you probably needn't concern yourself with pcmciautils.
 ====================== ===============  ========================================
         Program        Minimal version       Command to check the version
 ====================== ===============  ========================================
-GNU C                  4.9              gcc --version
+GNU C                  5.2              gcc --version
 Clang/LLVM (optional)  10.0.1           clang --version
 GNU make               3.81             make --version
 binutils               2.23             ld -v
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7f2a80091337..fae9514dabab 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -78,7 +78,7 @@ config ARM64
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select ARCH_SUPPORTS_CFI_CLANG
 	select ARCH_SUPPORTS_ATOMIC_RMW
-	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && (GCC_VERSION >= 50000 || CC_IS_CLANG)
+	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1e6230bea09d..10dc47eac122 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -212,7 +212,7 @@ config PPC
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
-	select HAVE_GCC_PLUGINS			if GCC_VERSION >= 50200   # plugin support on gcc <= 5.1 is buggy on PPC
+	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO
 	select HAVE_HW_BREAKPOINT		if PERF_EVENTS && (PPC_BOOK3S || PPC_8xx)
 	select HAVE_IDE
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4515a10c5d22..748a5b37a0e5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -226,7 +226,7 @@ config ARCH_RV32I
 config ARCH_RV64I
 	bool "RV64I"
 	select 64BIT
-	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && GCC_VERSION >= 50000
+	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && CC_IS_GCC
 	select HAVE_DYNAMIC_FTRACE if MMU
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_FTRACE_MCOUNT_RECORD
diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index 5d97ef738a57..3608189dfc29 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -98,10 +98,8 @@
 
 #if GCC_VERSION >= 70000
 #define KASAN_ABI_VERSION 5
-#elif GCC_VERSION >= 50000
+#else
 #define KASAN_ABI_VERSION 4
-#elif GCC_VERSION >= 40902
-#define KASAN_ABI_VERSION 3
 #endif
 
 #if __has_attribute(__no_sanitize_address__)
@@ -122,9 +120,7 @@
 #define __no_sanitize_undefined
 #endif
 
-#if GCC_VERSION >= 50100
 #define COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW 1
-#endif
 
 /*
  * Turn individual warnings and errors on and off locally, depending
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 678c13967580..0d0ed298905d 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -284,7 +284,7 @@ config DEBUG_INFO_DWARF4
 
 config DEBUG_INFO_DWARF5
 	bool "Generate DWARF Version 5 debuginfo"
-	depends on GCC_VERSION >= 50000 || (CC_IS_CLANG && (AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)))
+	depends on CC_IS_GCC || (CC_IS_CLANG && (AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)))
 	depends on !DEBUG_INFO_BTF
 	help
 	  Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0+ (gcc
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index d22cf91212b0..d5d0d26b8e7d 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -17,13 +17,7 @@ binutils)
 	echo 2.23.0
 	;;
 gcc)
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
-	# https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
-	if [ "$SRCARCH" = arm64 ]; then
-		echo 5.1.0
-	else
-		echo 4.9.0
-	fi
+	echo 5.2.0
 	;;
 icc)
 	# temporary
-- 
2.27.0

