Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE4251429B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 08:46:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqNLT4xK9z3bdF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 16:46:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KqNL50RZVz2yw9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 16:46:03 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 72F5C8053C;
 Fri, 29 Apr 2022 02:45:56 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: llvm@lists.linux.dev
Subject: [PATCH kernel] powerpc/llvm/lto: Allow LLVM LTO builds
Date: Fri, 29 Apr 2022 16:45:47 +1000
Message-Id: <20220429064547.2334280-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This enables LTO_CLANG builds on POWER with the upstream version of
LLVM.

LTO optimizes the output vmlinux binary and this may affect the FTP
alternative section if alt branches use "bc" (Branch Conditional) which
is limited by 16 bit offsets. This shows up in errors like:

ld.lld: error: InputSection too large for range extension thunk vmlinux.o:(__ftr_alt_97+0xF0)

This works around the issue by replacing "bc" in FTR_SECTION_ELSE with
"b" which allows 26 bit offsets.

This catches the problem instructions in vmlinux.o before it LTO'ed:

$ objdump -d -M raw -j __ftr_alt_97 vmlinux.o | egrep '\S+\s*\<bc\>'
  30:   00 00 82 40     bc      4,eq,30 <__ftr_alt_97+0x30>
  f0:   00 00 82 40     bc      4,eq,f0 <__ftr_alt_97+0xf0>

This allows LTO builds for ppc64le_defconfig plus LTO options.
Note that DYNAMIC_FTRACE/FUNCTION_TRACER is not supported by LTO builds
but this is not POWERPC-specific.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

Note 1:
This is further development of
https://lore.kernel.org/all/20220211023125.1790960-1-aik@ozlabs.ru/T/

Note 2:
CONFIG_ZSTD_COMPRESS and CONFIG_ZSTD_DECOMPRESS must be both "m" or "y"
or it won't link. For details:
https://lore.kernel.org/lkml/20220428043850.1706973-1-aik@ozlabs.ru/T/
---
 arch/powerpc/Kconfig                   | 2 ++
 arch/powerpc/kernel/exceptions-64s.S   | 4 +++-
 arch/powerpc/lib/copyuser_64.S         | 3 ++-
 arch/powerpc/lib/feature-fixups-test.S | 3 +--
 arch/powerpc/lib/memcpy_64.S           | 3 ++-
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 174edabb74fa..e2c7b5c1d0a6 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -158,6 +158,8 @@ config PPC
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WEAK_RELEASE_ACQUIRE
+	select ARCH_SUPPORTS_LTO_CLANG
+	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select BINFMT_ELF
 	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b66dd6f775a4..5b783bd51260 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -476,9 +476,11 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
 		.if IHSRR_IF_HVMODE
 		BEGIN_FTR_SECTION
 		bne	masked_Hinterrupt
+		b	4f
 		FTR_SECTION_ELSE
-		bne	masked_interrupt
 		ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+		bne	masked_interrupt
+4:
 		.elseif IHSRR
 		bne	masked_Hinterrupt
 		.else
diff --git a/arch/powerpc/lib/copyuser_64.S b/arch/powerpc/lib/copyuser_64.S
index db8719a14846..d07f95eebc65 100644
--- a/arch/powerpc/lib/copyuser_64.S
+++ b/arch/powerpc/lib/copyuser_64.S
@@ -75,10 +75,11 @@ _GLOBAL(__copy_tofrom_user_base)
  * set is Power6.
  */
 test_feature = (SELFTEST_CASE == 1)
+	beq	.Ldst_aligned
 BEGIN_FTR_SECTION
 	nop
 FTR_SECTION_ELSE
-	bne	.Ldst_unaligned
+	b	.Ldst_unaligned
 ALT_FTR_SECTION_END(CPU_FTR_UNALIGNED_LD_STD | CPU_FTR_CP_USE_DCBTZ, \
 		    CPU_FTR_UNALIGNED_LD_STD)
 .Ldst_aligned:
diff --git a/arch/powerpc/lib/feature-fixups-test.S b/arch/powerpc/lib/feature-fixups-test.S
index 480172fbd024..2751e42a9fd7 100644
--- a/arch/powerpc/lib/feature-fixups-test.S
+++ b/arch/powerpc/lib/feature-fixups-test.S
@@ -145,7 +145,6 @@ BEGIN_FTR_SECTION
 FTR_SECTION_ELSE
 2:	or	2,2,2
 	PPC_LCMPI	r3,1
-	beq	3f
 	blt	2b
 	b	3f
 	b	1b
@@ -160,10 +159,10 @@ globl(ftr_fixup_test6_expected)
 1:	or	1,1,1
 2:	or	2,2,2
 	PPC_LCMPI	r3,1
-	beq	3f
 	blt	2b
 	b	3f
 	b	1b
+	nop
 3:	or	1,1,1
 	or	2,2,2
 	or	3,3,3
diff --git a/arch/powerpc/lib/memcpy_64.S b/arch/powerpc/lib/memcpy_64.S
index 016c91e958d8..286c7e2d0883 100644
--- a/arch/powerpc/lib/memcpy_64.S
+++ b/arch/powerpc/lib/memcpy_64.S
@@ -50,10 +50,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_VMX_COPY)
    At the time of writing the only CPU that has this combination of bits
    set is Power6. */
 test_feature = (SELFTEST_CASE == 1)
+	beq      .ldst_aligned
 BEGIN_FTR_SECTION
 	nop
 FTR_SECTION_ELSE
-	bne	.Ldst_unaligned
+	b	.Ldst_unaligned
 ALT_FTR_SECTION_END(CPU_FTR_UNALIGNED_LD_STD | CPU_FTR_CP_USE_DCBTZ, \
                     CPU_FTR_UNALIGNED_LD_STD)
 .Ldst_aligned:
-- 
2.30.2

