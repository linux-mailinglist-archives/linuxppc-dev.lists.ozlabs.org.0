Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B074D199D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 14:51:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCcF36S3jz3bfH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 00:51:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aHO+7NxD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aHO+7NxD; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCcDQ3b2Bz30G0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 00:51:00 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id z16so17381960pfh.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Mar 2022 05:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X/JGFhmA8c44hDr9TLg48cMIKO3X6c2pGbif4ExiSqo=;
 b=aHO+7NxDBZNr+WQ8Ml8KUCgs+z3A025scl2eB/06srpvimjp6rZptS0yZqzOsbvyL+
 8XjVH5lIkQpj9MN5GywVqNS4BDKuRc3IVW0oWMmZo9XU9K97Us5bXLuHOH6BBo1q44ja
 JG8qNUn3Eu3z5aktbyjGlJyRbotnODn7Kr0o+5Jqs/vey3zCLPc7I27iqSw5Z6ZlC63v
 8/tIL1ziY30v52r/y5IBM+PvtY4Z7ZatCHcYDVCBwjR4Z5wHqvyV+KACCCwC/EbBKCp3
 GM8OSpNxipWU6+dTVuY7WpGo9V/b29KvzM4AsMDfNM+1KVNRLrVLuFJEZhjlGo3gaYWC
 3krA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X/JGFhmA8c44hDr9TLg48cMIKO3X6c2pGbif4ExiSqo=;
 b=Z2Nhi+4VhhUImhvL0j12UP0FzkoYrQQQH/DsKx9Zd5h8Ma/BlzUAuccWdlY2Iuae5A
 xcWq27npSi4SotJeBO5qAxfF8kL6LmRbuqEDzOwJsIvrtRFmZN40p53oimzsr0Ej1aJZ
 6susJG8CHUxFVTDBD8Jdy/nS4ieO4tuYbJlS07vkgehYAoCc4sE0QOWKVKD+h3nw8rKD
 Y2DVb27WUgtuam7ZML8fuMB2jYcmIjg2Wi4LSB/daY8cb8ENNdDa04iUjOcXEl2idG/z
 W/oXoCbB6kBzc6if1qvPQnPv0m4AJ4ndRqkHmaN6eVwTxJyfU1UYR69JvFi7StF07Tnz
 v+1g==
X-Gm-Message-State: AOAM533DDlM2ZAlgGTaFe954/fmPk7PWT3cnjc6Mz89KxJpUEk9tYplc
 1dpljgiVKAk2T9DQKcpx3hzY6AFOsEQ=
X-Google-Smtp-Source: ABdhPJw28YOTHyiNGur9fZQhGKYMyNMQpG/WfEo8cQwblpGauYORAFfTqVfEQeaYq+vQJpXtB1M0EA==
X-Received: by 2002:a05:6a00:3199:b0:4f7:945:14cf with SMTP id
 bj25-20020a056a00319900b004f7094514cfmr9005693pfb.47.1646747459557; 
 Tue, 08 Mar 2022 05:50:59 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (61-68-211-196.tpgi.com.au. [61.68.211.196])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f741b5c071sm541737pfu.86.2022.03.08.05.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:50:59 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/14] powerpc/rtas: Move rtas entry assembly into its own file
Date: Tue,  8 Mar 2022 23:50:34 +1000
Message-Id: <20220308135047.478297-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220308135047.478297-1-npiggin@gmail.com>
References: <20220308135047.478297-1-npiggin@gmail.com>
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This makes working on the code a bit easier.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/Makefile     |   2 +-
 arch/powerpc/kernel/entry_32.S   |  49 --------
 arch/powerpc/kernel/entry_64.S   | 150 -----------------------
 arch/powerpc/kernel/rtas_entry.S | 199 +++++++++++++++++++++++++++++++
 4 files changed, 200 insertions(+), 200 deletions(-)
 create mode 100644 arch/powerpc/kernel/rtas_entry.S

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 4d7829399570..13602b0f0472 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -68,7 +68,7 @@ obj-$(CONFIG_PPC_BOOK3S_IDLE)	+= idle_book3s.o
 procfs-y			:= proc_powerpc.o
 obj-$(CONFIG_PROC_FS)		+= $(procfs-y)
 rtaspci-$(CONFIG_PPC64)-$(CONFIG_PCI)	:= rtas_pci.o
-obj-$(CONFIG_PPC_RTAS)		+= rtas.o rtas-rtc.o $(rtaspci-y-y)
+obj-$(CONFIG_PPC_RTAS)		+= rtas_entry.o rtas.o rtas-rtc.o $(rtaspci-y-y)
 obj-$(CONFIG_PPC_RTAS_DAEMON)	+= rtasd.o
 obj-$(CONFIG_RTAS_FLASH)	+= rtas_flash.o
 obj-$(CONFIG_RTAS_PROC)		+= rtas-proc.o
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 7748c278d13c..1d599df6f169 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -555,52 +555,3 @@ ret_from_mcheck_exc:
 _ASM_NOKPROBE_SYMBOL(ret_from_mcheck_exc)
 #endif /* CONFIG_BOOKE */
 #endif /* !(CONFIG_4xx || CONFIG_BOOKE) */
-
-/*
- * PROM code for specific machines follows.  Put it
- * here so it's easy to add arch-specific sections later.
- * -- Cort
- */
-#ifdef CONFIG_PPC_RTAS
-/*
- * On CHRP, the Run-Time Abstraction Services (RTAS) have to be
- * called with the MMU off.
- */
-_GLOBAL(enter_rtas)
-	stwu	r1,-INT_FRAME_SIZE(r1)
-	mflr	r0
-	stw	r0,INT_FRAME_SIZE+4(r1)
-	LOAD_REG_ADDR(r4, rtas)
-	lis	r6,1f@ha	/* physical return address for rtas */
-	addi	r6,r6,1f@l
-	tophys(r6,r6)
-	lwz	r8,RTASENTRY(r4)
-	lwz	r4,RTASBASE(r4)
-	mfmsr	r9
-	stw	r9,8(r1)
-	LOAD_REG_IMMEDIATE(r0,MSR_KERNEL)
-	mtmsr	r0	/* disable interrupts so SRR0/1 don't get trashed */
-	li	r9,MSR_KERNEL & ~(MSR_IR|MSR_DR)
-	mtlr	r6
-	stw	r1, THREAD + RTAS_SP(r2)
-	mtspr	SPRN_SRR0,r8
-	mtspr	SPRN_SRR1,r9
-	rfi
-1:
-	lis	r8, 1f@h
-	ori	r8, r8, 1f@l
-	LOAD_REG_IMMEDIATE(r9,MSR_KERNEL)
-	mtspr	SPRN_SRR0,r8
-	mtspr	SPRN_SRR1,r9
-	rfi			/* Reactivate MMU translation */
-1:
-	lwz	r8,INT_FRAME_SIZE+4(r1)	/* get return address */
-	lwz	r9,8(r1)	/* original msr value */
-	addi	r1,r1,INT_FRAME_SIZE
-	li	r0,0
-	stw	r0, THREAD + RTAS_SP(r2)
-	mtlr	r8
-	mtmsr	r9
-	blr			/* return to caller */
-_ASM_NOKPROBE_SYMBOL(enter_rtas)
-#endif /* CONFIG_PPC_RTAS */
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 9581906b5ee9..01ace4c56104 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -264,156 +264,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	addi	r1,r1,SWITCH_FRAME_SIZE
 	blr
 
-#ifdef CONFIG_PPC_RTAS
-/*
- * On CHRP, the Run-Time Abstraction Services (RTAS) have to be
- * called with the MMU off.
- *
- * In addition, we need to be in 32b mode, at least for now.
- * 
- * Note: r3 is an input parameter to rtas, so don't trash it...
- */
-_GLOBAL(enter_rtas)
-	mflr	r0
-	std	r0,16(r1)
-        stdu	r1,-SWITCH_FRAME_SIZE(r1) /* Save SP and create stack space. */
-
-	/* Because RTAS is running in 32b mode, it clobbers the high order half
-	 * of all registers that it saves.  We therefore save those registers
-	 * RTAS might touch to the stack.  (r0, r3-r13 are caller saved)
-   	 */
-	SAVE_GPR(2, r1)			/* Save the TOC */
-	SAVE_GPR(13, r1)		/* Save paca */
-	SAVE_NVGPRS(r1)			/* Save the non-volatiles */
-
-	mfcr	r4
-	std	r4,_CCR(r1)
-	mfctr	r5
-	std	r5,_CTR(r1)
-	mfspr	r6,SPRN_XER
-	std	r6,_XER(r1)
-	mfdar	r7
-	std	r7,_DAR(r1)
-	mfdsisr	r8
-	std	r8,_DSISR(r1)
-
-	/* Temporary workaround to clear CR until RTAS can be modified to
-	 * ignore all bits.
-	 */
-	li	r0,0
-	mtcr	r0
-
-#ifdef CONFIG_BUG
-	/* There is no way it is acceptable to get here with interrupts enabled,
-	 * check it with the asm equivalent of WARN_ON
-	 */
-	lbz	r0,PACAIRQSOFTMASK(r13)
-1:	tdeqi	r0,IRQS_ENABLED
-	EMIT_WARN_ENTRY 1b,__FILE__,__LINE__,BUGFLAG_WARNING
-#endif
-
-	/* Hard-disable interrupts */
-	mfmsr	r6
-	rldicl	r7,r6,48,1
-	rotldi	r7,r7,16
-	mtmsrd	r7,1
-
-	/* Unfortunately, the stack pointer and the MSR are also clobbered,
-	 * so they are saved in the PACA which allows us to restore
-	 * our original state after RTAS returns.
-         */
-	std	r1,PACAR1(r13)
-        std	r6,PACASAVEDMSR(r13)
-
-	/* Setup our real return addr */	
-	LOAD_REG_ADDR(r4,rtas_return_loc)
-	clrldi	r4,r4,2			/* convert to realmode address */
-       	mtlr	r4
-
-	li	r0,0
-	ori	r0,r0,MSR_EE|MSR_SE|MSR_BE|MSR_RI
-	andc	r0,r6,r0
-	
-        li      r9,1
-        rldicr  r9,r9,MSR_SF_LG,(63-MSR_SF_LG)
-	ori	r9,r9,MSR_IR|MSR_DR|MSR_FE0|MSR_FE1|MSR_FP|MSR_RI|MSR_LE
-	andc	r6,r0,r9
-
-__enter_rtas:
-	sync				/* disable interrupts so SRR0/1 */
-	mtmsrd	r0			/* don't get trashed */
-
-	LOAD_REG_ADDR(r4, rtas)
-	ld	r5,RTASENTRY(r4)	/* get the rtas->entry value */
-	ld	r4,RTASBASE(r4)		/* get the rtas->base value */
-	
-	mtspr	SPRN_SRR0,r5
-	mtspr	SPRN_SRR1,r6
-	RFI_TO_KERNEL
-	b	.	/* prevent speculative execution */
-
-rtas_return_loc:
-	FIXUP_ENDIAN
-
-	/*
-	 * Clear RI and set SF before anything.
-	 */
-	mfmsr   r6
-	li	r0,MSR_RI
-	andc	r6,r6,r0
-	sldi	r0,r0,(MSR_SF_LG - MSR_RI_LG)
-	or	r6,r6,r0
-	sync
-	mtmsrd  r6
-
-	/* relocation is off at this point */
-	GET_PACA(r4)
-	clrldi	r4,r4,2			/* convert to realmode address */
-
-	bcl	20,31,$+4
-0:	mflr	r3
-	ld	r3,(1f-0b)(r3)		/* get &rtas_restore_regs */
-
-        ld	r1,PACAR1(r4)           /* Restore our SP */
-        ld	r4,PACASAVEDMSR(r4)     /* Restore our MSR */
-
-	mtspr	SPRN_SRR0,r3
-	mtspr	SPRN_SRR1,r4
-	RFI_TO_KERNEL
-	b	.	/* prevent speculative execution */
-_ASM_NOKPROBE_SYMBOL(__enter_rtas)
-_ASM_NOKPROBE_SYMBOL(rtas_return_loc)
-
-	.align	3
-1:	.8byte	rtas_restore_regs
-
-rtas_restore_regs:
-	/* relocation is on at this point */
-	REST_GPR(2, r1)			/* Restore the TOC */
-	REST_GPR(13, r1)		/* Restore paca */
-	REST_NVGPRS(r1)			/* Restore the non-volatiles */
-
-	GET_PACA(r13)
-
-	ld	r4,_CCR(r1)
-	mtcr	r4
-	ld	r5,_CTR(r1)
-	mtctr	r5
-	ld	r6,_XER(r1)
-	mtspr	SPRN_XER,r6
-	ld	r7,_DAR(r1)
-	mtdar	r7
-	ld	r8,_DSISR(r1)
-	mtdsisr	r8
-
-        addi	r1,r1,SWITCH_FRAME_SIZE	/* Unstack our frame */
-	ld	r0,16(r1)		/* get return address */
-
-	mtlr    r0
-        blr				/* return to caller */
-
-#endif /* CONFIG_PPC_RTAS */
-
 _GLOBAL(enter_prom)
 	mflr	r0
 	std	r0,16(r1)
diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
new file mode 100644
index 000000000000..192fea342744
--- /dev/null
+++ b/arch/powerpc/kernel/rtas_entry.S
@@ -0,0 +1,199 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <asm/asm-offsets.h>
+#include <asm/bug.h>
+#include <asm/page.h>
+#include <asm/ppc_asm.h>
+
+/*
+ * RTAS is called with MSR IR, DR, EE disabled, and LR in the return address.
+ *
+ * Note: r3 is an input parameter to rtas, so don't trash it...
+ */
+
+#ifdef CONFIG_PPC32
+_GLOBAL(enter_rtas)
+	stwu	r1,-INT_FRAME_SIZE(r1)
+	mflr	r0
+	stw	r0,INT_FRAME_SIZE+4(r1)
+	LOAD_REG_ADDR(r4, rtas)
+	lis	r6,1f@ha	/* physical return address for rtas */
+	addi	r6,r6,1f@l
+	tophys(r6,r6)
+	lwz	r8,RTASENTRY(r4)
+	lwz	r4,RTASBASE(r4)
+	mfmsr	r9
+	stw	r9,8(r1)
+	LOAD_REG_IMMEDIATE(r0,MSR_KERNEL)
+	mtmsr	r0	/* disable interrupts so SRR0/1 don't get trashed */
+	li	r9,MSR_KERNEL & ~(MSR_IR|MSR_DR)
+	mtlr	r6
+	stw	r1, THREAD + RTAS_SP(r2)
+	mtspr	SPRN_SRR0,r8
+	mtspr	SPRN_SRR1,r9
+	rfi
+1:
+	lis	r8, 1f@h
+	ori	r8, r8, 1f@l
+	LOAD_REG_IMMEDIATE(r9,MSR_KERNEL)
+	mtspr	SPRN_SRR0,r8
+	mtspr	SPRN_SRR1,r9
+	rfi			/* Reactivate MMU translation */
+1:
+	lwz	r8,INT_FRAME_SIZE+4(r1)	/* get return address */
+	lwz	r9,8(r1)	/* original msr value */
+	addi	r1,r1,INT_FRAME_SIZE
+	li	r0,0
+	stw	r0, THREAD + RTAS_SP(r2)
+	mtlr	r8
+	mtmsr	r9
+	blr			/* return to caller */
+_ASM_NOKPROBE_SYMBOL(enter_rtas)
+
+#else /* CONFIG_PPC32 */
+#include <asm/exception-64s.h>
+
+/*
+ * 32-bit rtas on 64-bit machines has the additional problem that RTAS may
+ * not preserve the upper parts of registers it uses.
+ */
+_GLOBAL(enter_rtas)
+	mflr	r0
+	std	r0,16(r1)
+        stdu	r1,-SWITCH_FRAME_SIZE(r1) /* Save SP and create stack space. */
+
+	/* Because RTAS is running in 32b mode, it clobbers the high order half
+	 * of all registers that it saves.  We therefore save those registers
+	 * RTAS might touch to the stack.  (r0, r3-r13 are caller saved)
+   	 */
+	SAVE_GPR(2, r1)			/* Save the TOC */
+	SAVE_GPR(13, r1)		/* Save paca */
+	SAVE_NVGPRS(r1)			/* Save the non-volatiles */
+
+	mfcr	r4
+	std	r4,_CCR(r1)
+	mfctr	r5
+	std	r5,_CTR(r1)
+	mfspr	r6,SPRN_XER
+	std	r6,_XER(r1)
+	mfdar	r7
+	std	r7,_DAR(r1)
+	mfdsisr	r8
+	std	r8,_DSISR(r1)
+
+	/* Temporary workaround to clear CR until RTAS can be modified to
+	 * ignore all bits.
+	 */
+	li	r0,0
+	mtcr	r0
+
+#ifdef CONFIG_BUG
+	/* There is no way it is acceptable to get here with interrupts enabled,
+	 * check it with the asm equivalent of WARN_ON
+	 */
+	lbz	r0,PACAIRQSOFTMASK(r13)
+1:	tdeqi	r0,IRQS_ENABLED
+	EMIT_WARN_ENTRY 1b,__FILE__,__LINE__,BUGFLAG_WARNING
+#endif
+
+	/* Hard-disable interrupts */
+	mfmsr	r6
+	rldicl	r7,r6,48,1
+	rotldi	r7,r7,16
+	mtmsrd	r7,1
+
+	/* Unfortunately, the stack pointer and the MSR are also clobbered,
+	 * so they are saved in the PACA which allows us to restore
+	 * our original state after RTAS returns.
+         */
+	std	r1,PACAR1(r13)
+        std	r6,PACASAVEDMSR(r13)
+
+	/* Setup our real return addr */	
+	LOAD_REG_ADDR(r4,rtas_return_loc)
+	clrldi	r4,r4,2			/* convert to realmode address */
+       	mtlr	r4
+
+	li	r0,0
+	ori	r0,r0,MSR_EE|MSR_SE|MSR_BE|MSR_RI
+	andc	r0,r6,r0
+	
+        li      r9,1
+        rldicr  r9,r9,MSR_SF_LG,(63-MSR_SF_LG)
+	ori	r9,r9,MSR_IR|MSR_DR|MSR_FE0|MSR_FE1|MSR_FP|MSR_RI|MSR_LE
+	andc	r6,r0,r9
+
+__enter_rtas:
+	sync				/* disable interrupts so SRR0/1 */
+	mtmsrd	r0			/* don't get trashed */
+
+	LOAD_REG_ADDR(r4, rtas)
+	ld	r5,RTASENTRY(r4)	/* get the rtas->entry value */
+	ld	r4,RTASBASE(r4)		/* get the rtas->base value */
+	
+	mtspr	SPRN_SRR0,r5
+	mtspr	SPRN_SRR1,r6
+	RFI_TO_KERNEL
+	b	.	/* prevent speculative execution */
+
+rtas_return_loc:
+	FIXUP_ENDIAN
+
+	/*
+	 * Clear RI and set SF before anything.
+	 */
+	mfmsr   r6
+	li	r0,MSR_RI
+	andc	r6,r6,r0
+	sldi	r0,r0,(MSR_SF_LG - MSR_RI_LG)
+	or	r6,r6,r0
+	sync
+	mtmsrd  r6
+
+	/* relocation is off at this point */
+	GET_PACA(r4)
+	clrldi	r4,r4,2			/* convert to realmode address */
+
+	bcl	20,31,$+4
+0:	mflr	r3
+	ld	r3,(1f-0b)(r3)		/* get &rtas_restore_regs */
+
+        ld	r1,PACAR1(r4)           /* Restore our SP */
+        ld	r4,PACASAVEDMSR(r4)     /* Restore our MSR */
+
+	mtspr	SPRN_SRR0,r3
+	mtspr	SPRN_SRR1,r4
+	RFI_TO_KERNEL
+	b	.	/* prevent speculative execution */
+_ASM_NOKPROBE_SYMBOL(__enter_rtas)
+_ASM_NOKPROBE_SYMBOL(rtas_return_loc)
+
+	.align	3
+1:	.8byte	rtas_restore_regs
+
+rtas_restore_regs:
+	/* relocation is on at this point */
+	REST_GPR(2, r1)			/* Restore the TOC */
+	REST_GPR(13, r1)		/* Restore paca */
+	REST_NVGPRS(r1)			/* Restore the non-volatiles */
+
+	GET_PACA(r13)
+
+	ld	r4,_CCR(r1)
+	mtcr	r4
+	ld	r5,_CTR(r1)
+	mtctr	r5
+	ld	r6,_XER(r1)
+	mtspr	SPRN_XER,r6
+	ld	r7,_DAR(r1)
+	mtdar	r7
+	ld	r8,_DSISR(r1)
+	mtdsisr	r8
+
+        addi	r1,r1,SWITCH_FRAME_SIZE	/* Unstack our frame */
+	ld	r0,16(r1)		/* get return address */
+
+	mtlr    r0
+        blr				/* return to caller */
+
+#endif /* CONFIG_PPC32 */
-- 
2.23.0

