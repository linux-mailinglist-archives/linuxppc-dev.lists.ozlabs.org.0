Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2A855FA91
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 10:30:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXvmh2z4Bz3dsY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 18:30:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXvmG6FBdz3bmR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 18:30:20 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id 1B7F080474;
	Wed, 29 Jun 2022 04:30:12 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH llvm v2] powerpc/llvm/lto: Allow LLVM LTO builds
Date: Wed, 29 Jun 2022 18:30:11 +1000
Message-Id: <20220629083011.1763768-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

This makes the copy routines slower on POWER6 as this partially reverts
a4e22f02f5b6 ("powerpc: Update 64bit__copy_tofrom_user() using CPU_FTR_UNALIGNED_LD_STD")

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v2:
* dropped FTR sections which were only meant to improve POWER6 as
Paul suggested

---

Note 1:
This is further development of
https://lore.kernel.org/all/20220211023125.1790960-1-aik@ozlabs.ru/T/

Note 2:
CONFIG_ZSTD_COMPRESS and CONFIG_ZSTD_DECOMPRESS must be both "m" or "y"
or it won't link. For details:
https://lore.kernel.org/lkml/20220428043850.1706973-1-aik@ozlabs.ru/T/
---
 arch/powerpc/Kconfig                   |  2 ++
 arch/powerpc/kernel/exceptions-64s.S   |  4 +++-
 arch/powerpc/lib/copyuser_64.S         | 15 +--------------
 arch/powerpc/lib/feature-fixups-test.S |  3 +--
 arch/powerpc/lib/memcpy_64.S           | 14 +-------------
 5 files changed, 8 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 3eaddb8997a9..35050264ea7b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -162,6 +162,8 @@ config PPC
 	select ARCH_WANTS_MODULES_DATA_IN_VMALLOC	if PPC_BOOK3S_32 || PPC_8xx
 	select ARCH_WANTS_NO_INSTR
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
index db8719a14846..b914e52ed240 100644
--- a/arch/powerpc/lib/copyuser_64.S
+++ b/arch/powerpc/lib/copyuser_64.S
@@ -9,7 +9,7 @@
 #include <asm/feature-fixups.h>
 
 #ifndef SELFTEST_CASE
-/* 0 == most CPUs, 1 == POWER6, 2 == Cell */
+/* 0 == most CPUs, 2 == Cell */
 #define SELFTEST_CASE	0
 #endif
 
@@ -68,19 +68,6 @@ _GLOBAL(__copy_tofrom_user_base)
 	andi.	r6,r6,7
 	PPC_MTOCRF(0x01,r5)
 	blt	cr1,.Lshort_copy
-/* Below we want to nop out the bne if we're on a CPU that has the
- * CPU_FTR_UNALIGNED_LD_STD bit set and the CPU_FTR_CP_USE_DCBTZ bit
- * cleared.
- * At the time of writing the only CPU that has this combination of bits
- * set is Power6.
- */
-test_feature = (SELFTEST_CASE == 1)
-BEGIN_FTR_SECTION
-	nop
-FTR_SECTION_ELSE
-	bne	.Ldst_unaligned
-ALT_FTR_SECTION_END(CPU_FTR_UNALIGNED_LD_STD | CPU_FTR_CP_USE_DCBTZ, \
-		    CPU_FTR_UNALIGNED_LD_STD)
 .Ldst_aligned:
 	addi	r3,r3,-16
 r3_offset = 16
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
index 016c91e958d8..117399dbc891 100644
--- a/arch/powerpc/lib/memcpy_64.S
+++ b/arch/powerpc/lib/memcpy_64.S
@@ -10,7 +10,7 @@
 #include <asm/kasan.h>
 
 #ifndef SELFTEST_CASE
-/* For big-endian, 0 == most CPUs, 1 == POWER6, 2 == Cell */
+/* For big-endian, 0 == most CPUs, 2 == Cell */
 #define SELFTEST_CASE	0
 #endif
 
@@ -44,18 +44,6 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_VMX_COPY)
 	andi.	r6,r6,7
 	dcbt	0,r4
 	blt	cr1,.Lshort_copy
-/* Below we want to nop out the bne if we're on a CPU that has the
-   CPU_FTR_UNALIGNED_LD_STD bit set and the CPU_FTR_CP_USE_DCBTZ bit
-   cleared.
-   At the time of writing the only CPU that has this combination of bits
-   set is Power6. */
-test_feature = (SELFTEST_CASE == 1)
-BEGIN_FTR_SECTION
-	nop
-FTR_SECTION_ELSE
-	bne	.Ldst_unaligned
-ALT_FTR_SECTION_END(CPU_FTR_UNALIGNED_LD_STD | CPU_FTR_CP_USE_DCBTZ, \
-                    CPU_FTR_UNALIGNED_LD_STD)
 .Ldst_aligned:
 	addi	r3,r3,-16
 test_feature = (SELFTEST_CASE == 0)
-- 
2.30.2

