Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55176900A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 13:20:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46918T6xdlzDrNL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 21:20:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="iyGheMYs"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4691392BN8zDrNG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 21:16:05 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4691333mTlz9tyXs;
 Fri, 16 Aug 2019 13:15:59 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=iyGheMYs; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ll52ruOpJIhH; Fri, 16 Aug 2019 13:15:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4691332WGcz9tyXr;
 Fri, 16 Aug 2019 13:15:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565954159; bh=AZa/Vbvz2vvSVzzKeKFOlBKQpBBPn8tg+lwWM3PrWDc=;
 h=From:Subject:To:Cc:Date:From;
 b=iyGheMYsJGzG/1XCaE5L9KFLNeNn8MMnG5pDhiaMiUrKrHaRafvaCnhBGvBEOk3/h
 FV2uv5wOH5ODcEgqywBVQxlG+fDBZNULNMrlbm6Eoao5jGAUvt+IONp52E5r31qm8i
 6dTfluEIu4RWdZi24lCbXOkS3z9KABK1NTpKHODQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BDC338B776;
 Fri, 16 Aug 2019 13:16:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UoPRWb9ooZBL; Fri, 16 Aug 2019 13:16:00 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 97C768B754;
 Fri, 16 Aug 2019 13:16:00 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 987C5698B9; Fri, 16 Aug 2019 11:16:00 +0000 (UTC)
Message-Id: <b2fd7fdecdcf1d0fb836b8742f0422d3d02a1180.1565954131.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2] powerpc/32: Add VDSO version of getcpu
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 16 Aug 2019 11:16:00 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 18ad51dd342a ("powerpc: Add VDSO version of getcpu") added
getcpu() for PPC64 only, by making use of a user readable general
purpose SPR.

PPC32 doesn't have any such SPR, a full system call can still be
avoided by implementing a fast system call which reads the CPU id
in the task struct and returns immediately without going back in
virtual mode.

Before the patch, vdsotest reported:
getcpu: syscall: 1572 nsec/call
getcpu:    libc: 1787 nsec/call
getcpu:    vdso: not tested

Now, vdsotest reports:
getcpu: syscall: 1582 nsec/call
getcpu:    libc: 667 nsec/call
getcpu:    vdso: 368 nsec/call

For non SMP, just return CPU id 0 from the VDSO directly.

PPC32 doesn't support CONFIG_NUMA so NUMA node is always 0.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

---
v2: fixed build error in getcpu.S
---
 arch/powerpc/include/asm/vdso.h         |  2 ++
 arch/powerpc/kernel/head_32.h           | 13 +++++++++++++
 arch/powerpc/kernel/head_booke.h        | 11 +++++++++++
 arch/powerpc/kernel/vdso32/Makefile     |  4 +---
 arch/powerpc/kernel/vdso32/getcpu.S     |  7 +++++++
 arch/powerpc/kernel/vdso32/vdso32.lds.S |  2 --
 6 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso.h b/arch/powerpc/include/asm/vdso.h
index b5e1f8f8a05c..adb54782df5f 100644
--- a/arch/powerpc/include/asm/vdso.h
+++ b/arch/powerpc/include/asm/vdso.h
@@ -16,6 +16,8 @@
 /* Define if 64 bits VDSO has procedure descriptors */
 #undef VDS64_HAS_DESCRIPTORS
 
+#define NR_MAGIC_FAST_VDSO_SYSCALL	0x789a
+
 #ifndef __ASSEMBLY__
 
 /* Offsets relative to thread->vdso_base */
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 4a692553651f..a2e38b59785a 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -3,6 +3,8 @@
 #define __HEAD_32_H__
 
 #include <asm/ptrace.h>	/* for STACK_FRAME_REGS_MARKER */
+#include <asm/vdso.h>
+#include <asm/asm-offsets.h>
 
 /*
  * MSR_KERNEL is > 0x8000 on 4xx/Book-E since it include MSR_CE.
@@ -74,7 +76,13 @@
 .endm
 
 .macro SYSCALL_ENTRY trapno
+#ifdef CONFIG_SMP
+	cmplwi	cr0, r0, NR_MAGIC_FAST_VDSO_SYSCALL
+#endif
 	mfspr	r12,SPRN_SPRG_THREAD
+#ifdef CONFIG_SMP
+	beq-	1f
+#endif
 	mfcr	r10
 	lwz	r11,TASK_STACK-THREAD(r12)
 	mflr	r9
@@ -152,6 +160,11 @@
 	mtspr	SPRN_SRR0,r11
 	SYNC
 	RFI				/* jump to handler, enable MMU */
+#ifdef CONFIG_SMP
+1:
+	lwz	r5, TASK_CPU - THREAD(r12)
+	RFI
+#endif
 .endm
 
 /*
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 2ae635df9026..c534e87cac84 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -3,6 +3,8 @@
 #define __HEAD_BOOKE_H__
 
 #include <asm/ptrace.h>	/* for STACK_FRAME_REGS_MARKER */
+#include <asm/vdso.h>
+#include <asm/asm-offsets.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_booke_hv_asm.h>
 
@@ -104,6 +106,10 @@ FTR_SECTION_ELSE
 #ifdef CONFIG_KVM_BOOKE_HV
 ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 #endif
+#ifdef CONFIG_SMP
+	cmplwi	cr0, r0, NR_MAGIC_FAST_VDSO_SYSCALL
+	beq-	1f
+#endif
 	BOOKE_CLEAR_BTB(r11)
 	lwz	r11, TASK_STACK - THREAD(r10)
 	rlwinm	r12,r12,0,4,2	/* Clear SO bit in CR */
@@ -176,6 +182,11 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	mtspr	SPRN_SRR0,r11
 	SYNC
 	RFI				/* jump to handler, enable MMU */
+#ifdef CONFIG_SMP
+1:
+	lwz	r5, TASK_CPU - THREAD(r10)
+	RFI
+#endif
 .endm
 
 /* To handle the additional exception priority levels on 40x and Book-E
diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index 06f54d947057..e147bbdc12cd 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -2,9 +2,7 @@
 
 # List of files in the vdso, has to be asm only for now
 
-obj-vdso32-$(CONFIG_PPC64) = getcpu.o
-obj-vdso32 = sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o \
-		$(obj-vdso32-y)
+obj-vdso32 = sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o getcpu.o
 
 # Build rules
 
diff --git a/arch/powerpc/kernel/vdso32/getcpu.S b/arch/powerpc/kernel/vdso32/getcpu.S
index 63e914539e1a..bde226ad904d 100644
--- a/arch/powerpc/kernel/vdso32/getcpu.S
+++ b/arch/powerpc/kernel/vdso32/getcpu.S
@@ -17,7 +17,14 @@
  */
 V_FUNCTION_BEGIN(__kernel_getcpu)
   .cfi_startproc
+#if defined(CONFIG_PPC64)
 	mfspr	r5,SPRN_SPRG_VDSO_READ
+#elif defined(CONFIG_SMP)
+	li	r0, NR_MAGIC_FAST_VDSO_SYSCALL
+	sc	/* returns cpuid in r5, clobbers cr0 and r10-r13 */
+#else
+	li	r5, 0
+#endif
 	cmpwi	cr0,r3,0
 	cmpwi	cr1,r4,0
 	clrlwi  r6,r5,16
diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index 099a6db14e67..663880671e20 100644
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
@@ -152,9 +152,7 @@ VERSION
 		__kernel_sync_dicache_p5;
 		__kernel_sigtramp32;
 		__kernel_sigtramp_rt32;
-#ifdef CONFIG_PPC64
 		__kernel_getcpu;
-#endif
 		__kernel_time;
 
 	local: *;
-- 
2.13.3

