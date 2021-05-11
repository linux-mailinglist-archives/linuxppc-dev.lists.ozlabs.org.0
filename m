Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8A5379ED0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 06:48:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfQRk2jwXz30BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 14:48:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FfQRK4ykCz2xvT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 14:48:27 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id AB91DAE80042;
 Tue, 11 May 2021 00:48:16 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
Date: Tue, 11 May 2021 14:48:12 +1000
Message-Id: <20210511044812.267965-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The $(CPP) (do only preprocessing) macro is already defined in Makefile.
However POWERPC redefines it and adds $(KBUILD_CFLAGS) which results
in flags duplication. Which is not a big deal by itself except for
the flags which depend on other flags and the compiler checks them
as it parses the command line.

Specifically, scripts/Makefile.build:304 generates ksyms for .S files.
If clang+llvm+sanitizer are enabled, this results in

-emit-llvm-bc -fno-lto -flto -fvisibility=hidden \
 -fsanitize=cfi-mfcall -fno-lto  ...

in the clang command line and triggers error:

clang-13: error: invalid argument '-fsanitize=cfi-mfcall' only allowed with '-flto'

This removes unnecessary CPP redefinition. Which works fine as in most
place KBUILD_CFLAGS is passed to $CPP except
arch/powerpc/kernel/vdso64/vdso(32|64).lds (and probably some others,
not yet detected). To fix vdso, we do:
1. explicitly add -m(big|little)-endian to $CPP
2. (for clang) add $CLANG_FLAGS to $KBUILD_CPPFLAGS as otherwise clang
silently ignores -m(big|little)-endian if the building platform does not
support big endian (such as x86) so --prefix= is required.

While at this, remove some duplication from CPPFLAGS_vdso(32|64)
as cmd_cpp_lds_S has them anyway. It still puzzles me why we need -C
(preserve comments in the preprocessor output) flag here.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v2:
* fix KBUILD_CPPFLAGS
* add CLANG_FLAGS to CPPFLAGS
---
 Makefile                            | 1 +
 arch/powerpc/Makefile               | 3 ++-
 arch/powerpc/kernel/vdso32/Makefile | 2 +-
 arch/powerpc/kernel/vdso64/Makefile | 2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 72af8e423f11..13acd2183d55 100644
--- a/Makefile
+++ b/Makefile
@@ -591,6 +591,7 @@ CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
 endif
 CLANG_FLAGS	+= -Werror=unknown-warning-option
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
+KBUILD_CPPFLAGS	+= $(CLANG_FLAGS)
 KBUILD_AFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS
 endif
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 3212d076ac6a..306bfd2797ad 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -76,6 +76,7 @@ endif
 
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CFLAGS	+= -mlittle-endian
+KBUILD_CPPFLAGS	+= -mlittle-endian
 KBUILD_LDFLAGS	+= -EL
 LDEMULATION	:= lppc
 GNUTARGET	:= powerpcle
@@ -83,6 +84,7 @@ MULTIPLEWORD	:= -mno-multiple
 KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-save-toc-indirect)
 else
 KBUILD_CFLAGS += $(call cc-option,-mbig-endian)
+KBUILD_CPPFLAGS += $(call cc-option,-mbig-endian)
 KBUILD_LDFLAGS	+= -EB
 LDEMULATION	:= ppc
 GNUTARGET	:= powerpc
@@ -208,7 +210,6 @@ KBUILD_CPPFLAGS	+= -I $(srctree)/arch/$(ARCH) $(asinstr)
 KBUILD_AFLAGS	+= $(AFLAGS-y)
 KBUILD_CFLAGS	+= $(call cc-option,-msoft-float)
 KBUILD_CFLAGS	+= -pipe $(CFLAGS-y)
-CPP		= $(CC) -E $(KBUILD_CFLAGS)
 
 CHECKFLAGS	+= -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
 ifdef CONFIG_CPU_BIG_ENDIAN
diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index 7d9a6fee0e3d..ea001c6df1fa 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -44,7 +44,7 @@ asflags-y := -D__VDSO32__ -s
 
 obj-y += vdso32_wrapper.o
 targets += vdso32.lds
-CPPFLAGS_vdso32.lds += -P -C -Upowerpc
+CPPFLAGS_vdso32.lds += -C
 
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso32.so.dbg: $(src)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday.o FORCE
diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
index 2813e3f98db6..07eadba48c7a 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -30,7 +30,7 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
 asflags-y := -D__VDSO64__ -s
 
 targets += vdso64.lds
-CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
+CPPFLAGS_vdso64.lds += -C
 
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday.o FORCE
-- 
2.30.2

