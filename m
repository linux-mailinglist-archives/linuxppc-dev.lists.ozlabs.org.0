Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E43B8AEF80
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 18:24:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SVjn2T4MzDqrN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 02:24:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="hLD1YdS6"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SVgk1WBmzF155
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 02:22:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46SVgc6D70z9tyvR;
 Tue, 10 Sep 2019 18:22:52 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=hLD1YdS6; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sXuk_CNHZkkt; Tue, 10 Sep 2019 18:22:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46SVgc57dVz9tyvQ;
 Tue, 10 Sep 2019 18:22:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568132572; bh=vyOfof1EN+sHNN2fvL/owbDyjpKSZbteaRPnhGFDHKU=;
 h=From:Subject:To:Cc:Date:From;
 b=hLD1YdS6TR7PJUqv0coKAWeF3BVPMyTzPlhhniQgMXPHGXWMdAlJeOFMjyF+qVWE2
 snhxBUpCs5ek41emp41yAlodk9M/6EjvjKdavHDVjZIJUfHRARdTBaxepJ+qQDB9CP
 B7BdGyDCUq4N3kdtxEFABnokG4mJjPwM5+IuRFgk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 531C78B88E;
 Tue, 10 Sep 2019 18:22:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id onMYOPYYeXMN; Tue, 10 Sep 2019 18:22:54 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C7CCF8B885;
 Tue, 10 Sep 2019 18:22:53 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 872736B751; Tue, 10 Sep 2019 16:22:53 +0000 (UTC)
Message-Id: <b8fbdac205bbebd8e860dc42e12246de29bcc68f.1568132567.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 1/2] powerpc/32: Split kexec low level code out of misc_32.S
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 10 Sep 2019 16:22:53 +0000 (UTC)
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

Almost half of misc_32.S is dedicated to kexec.
That's the relocation function for kexec.

Drop it into a dedicated kexec_relocate_32.S

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

---
v2: no change
v3: renamed kexec_32.S to kexec_relocate_32.S
---
 arch/powerpc/kernel/Makefile            |   1 +
 arch/powerpc/kernel/kexec_relocate_32.S | 500 ++++++++++++++++++++++++++++++++
 arch/powerpc/kernel/misc_32.S           | 491 -------------------------------
 3 files changed, 501 insertions(+), 491 deletions(-)
 create mode 100644 arch/powerpc/kernel/kexec_relocate_32.S

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index c9cc4b689e60..f6c80f31502a 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 obj-$(CONFIG_FA_DUMP)		+= fadump.o
 ifdef CONFIG_PPC32
 obj-$(CONFIG_E500)		+= idle_e500.o
+obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate_32.o
 endif
 obj-$(CONFIG_PPC_BOOK3S_32)	+= idle_6xx.o l2cr_6xx.o cpu_setup_6xx.o
 obj-$(CONFIG_TAU)		+= tau_6xx.o
diff --git a/arch/powerpc/kernel/kexec_relocate_32.S b/arch/powerpc/kernel/kexec_relocate_32.S
new file mode 100644
index 000000000000..3f8ca6a566fb
--- /dev/null
+++ b/arch/powerpc/kernel/kexec_relocate_32.S
@@ -0,0 +1,500 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * This file contains kexec low-level functions.
+ *
+ * Copyright (C) 2002-2003 Eric Biederman  <ebiederm@xmission.com>
+ * GameCube/ppc32 port Copyright (C) 2004 Albert Herranz
+ * PPC44x port. Copyright (C) 2011,  IBM Corporation
+ * 		Author: Suzuki Poulose <suzuki@in.ibm.com>
+ */
+
+#include <asm/reg.h>
+#include <asm/page.h>
+#include <asm/mmu.h>
+#include <asm/ppc_asm.h>
+#include <asm/kexec.h>
+
+	.text
+
+	/*
+	 * Must be relocatable PIC code callable as a C function.
+	 */
+	.globl relocate_new_kernel
+relocate_new_kernel:
+	/* r3 = page_list   */
+	/* r4 = reboot_code_buffer */
+	/* r5 = start_address      */
+
+#ifdef CONFIG_FSL_BOOKE
+
+	mr	r29, r3
+	mr	r30, r4
+	mr	r31, r5
+
+#define ENTRY_MAPPING_KEXEC_SETUP
+#include "fsl_booke_entry_mapping.S"
+#undef ENTRY_MAPPING_KEXEC_SETUP
+
+	mr      r3, r29
+	mr      r4, r30
+	mr      r5, r31
+
+	li	r0, 0
+#elif defined(CONFIG_44x)
+
+	/* Save our parameters */
+	mr	r29, r3
+	mr	r30, r4
+	mr	r31, r5
+
+#ifdef CONFIG_PPC_47x
+	/* Check for 47x cores */
+	mfspr	r3,SPRN_PVR
+	srwi	r3,r3,16
+	cmplwi	cr0,r3,PVR_476FPE@h
+	beq	setup_map_47x
+	cmplwi	cr0,r3,PVR_476@h
+	beq	setup_map_47x
+	cmplwi	cr0,r3,PVR_476_ISS@h
+	beq	setup_map_47x
+#endif /* CONFIG_PPC_47x */
+	
+/*
+ * Code for setting up 1:1 mapping for PPC440x for KEXEC
+ *
+ * We cannot switch off the MMU on PPC44x.
+ * So we:
+ * 1) Invalidate all the mappings except the one we are running from.
+ * 2) Create a tmp mapping for our code in the other address space(TS) and
+ *    jump to it. Invalidate the entry we started in.
+ * 3) Create a 1:1 mapping for 0-2GiB in chunks of 256M in original TS.
+ * 4) Jump to the 1:1 mapping in original TS.
+ * 5) Invalidate the tmp mapping.
+ *
+ * - Based on the kexec support code for FSL BookE
+ *
+ */
+
+	/* 
+	 * Load the PID with kernel PID (0).
+	 * Also load our MSR_IS and TID to MMUCR for TLB search.
+	 */
+	li	r3, 0
+	mtspr	SPRN_PID, r3
+	mfmsr	r4
+	andi.	r4,r4,MSR_IS@l
+	beq	wmmucr
+	oris	r3,r3,PPC44x_MMUCR_STS@h
+wmmucr:
+	mtspr	SPRN_MMUCR,r3
+	sync
+
+	/*
+	 * Invalidate all the TLB entries except the current entry
+	 * where we are running from
+	 */
+	bl	0f				/* Find our address */
+0:	mflr	r5				/* Make it accessible */
+	tlbsx	r23,0,r5			/* Find entry we are in */
+	li	r4,0				/* Start at TLB entry 0 */
+	li	r3,0				/* Set PAGEID inval value */
+1:	cmpw	r23,r4				/* Is this our entry? */
+	beq	skip				/* If so, skip the inval */
+	tlbwe	r3,r4,PPC44x_TLB_PAGEID		/* If not, inval the entry */
+skip:
+	addi	r4,r4,1				/* Increment */
+	cmpwi	r4,64				/* Are we done?	*/
+	bne	1b				/* If not, repeat */
+	isync
+
+	/* Create a temp mapping and jump to it */
+	andi.	r6, r23, 1		/* Find the index to use */
+	addi	r24, r6, 1		/* r24 will contain 1 or 2 */
+
+	mfmsr	r9			/* get the MSR */
+	rlwinm	r5, r9, 27, 31, 31	/* Extract the MSR[IS] */
+	xori	r7, r5, 1		/* Use the other address space */
+
+	/* Read the current mapping entries */
+	tlbre	r3, r23, PPC44x_TLB_PAGEID
+	tlbre	r4, r23, PPC44x_TLB_XLAT
+	tlbre	r5, r23, PPC44x_TLB_ATTRIB
+
+	/* Save our current XLAT entry */
+	mr	r25, r4
+
+	/* Extract the TLB PageSize */
+	li	r10, 1 			/* r10 will hold PageSize */
+	rlwinm	r11, r3, 0, 24, 27	/* bits 24-27 */
+
+	/* XXX: As of now we use 256M, 4K pages */
+	cmpwi	r11, PPC44x_TLB_256M
+	bne	tlb_4k
+	rotlwi	r10, r10, 28		/* r10 = 256M */
+	b	write_out
+tlb_4k:
+	cmpwi	r11, PPC44x_TLB_4K
+	bne	default
+	rotlwi	r10, r10, 12		/* r10 = 4K */
+	b	write_out
+default:
+	rotlwi	r10, r10, 10		/* r10 = 1K */
+
+write_out:
+	/*
+	 * Write out the tmp 1:1 mapping for this code in other address space
+	 * Fixup  EPN = RPN , TS=other address space
+	 */
+	insrwi	r3, r7, 1, 23		/* Bit 23 is TS for PAGEID field */
+
+	/* Write out the tmp mapping entries */
+	tlbwe	r3, r24, PPC44x_TLB_PAGEID
+	tlbwe	r4, r24, PPC44x_TLB_XLAT
+	tlbwe	r5, r24, PPC44x_TLB_ATTRIB
+
+	subi	r11, r10, 1		/* PageOffset Mask = PageSize - 1 */
+	not	r10, r11		/* Mask for PageNum */
+
+	/* Switch to other address space in MSR */
+	insrwi	r9, r7, 1, 26		/* Set MSR[IS] = r7 */
+
+	bl	1f
+1:	mflr	r8
+	addi	r8, r8, (2f-1b)		/* Find the target offset */
+
+	/* Jump to the tmp mapping */
+	mtspr	SPRN_SRR0, r8
+	mtspr	SPRN_SRR1, r9
+	rfi
+
+2:
+	/* Invalidate the entry we were executing from */
+	li	r3, 0
+	tlbwe	r3, r23, PPC44x_TLB_PAGEID
+
+	/* attribute fields. rwx for SUPERVISOR mode */
+	li	r5, 0
+	ori	r5, r5, (PPC44x_TLB_SW | PPC44x_TLB_SR | PPC44x_TLB_SX | PPC44x_TLB_G)
+
+	/* Create 1:1 mapping in 256M pages */
+	xori	r7, r7, 1			/* Revert back to Original TS */
+
+	li	r8, 0				/* PageNumber */
+	li	r6, 3				/* TLB Index, start at 3  */
+
+next_tlb:
+	rotlwi	r3, r8, 28			/* Create EPN (bits 0-3) */
+	mr	r4, r3				/* RPN = EPN  */
+	ori	r3, r3, (PPC44x_TLB_VALID | PPC44x_TLB_256M) /* SIZE = 256M, Valid */
+	insrwi	r3, r7, 1, 23			/* Set TS from r7 */
+
+	tlbwe	r3, r6, PPC44x_TLB_PAGEID	/* PageID field : EPN, V, SIZE */
+	tlbwe	r4, r6, PPC44x_TLB_XLAT		/* Address translation : RPN   */
+	tlbwe	r5, r6, PPC44x_TLB_ATTRIB	/* Attributes */
+
+	addi	r8, r8, 1			/* Increment PN */
+	addi	r6, r6, 1			/* Increment TLB Index */
+	cmpwi	r8, 8				/* Are we done ? */
+	bne	next_tlb
+	isync
+
+	/* Jump to the new mapping 1:1 */
+	li	r9,0
+	insrwi	r9, r7, 1, 26			/* Set MSR[IS] = r7 */
+
+	bl	1f
+1:	mflr	r8
+	and	r8, r8, r11			/* Get our offset within page */
+	addi	r8, r8, (2f-1b)
+
+	and	r5, r25, r10			/* Get our target PageNum */
+	or	r8, r8, r5			/* Target jump address */
+
+	mtspr	SPRN_SRR0, r8
+	mtspr	SPRN_SRR1, r9
+	rfi
+2:
+	/* Invalidate the tmp entry we used */
+	li	r3, 0
+	tlbwe	r3, r24, PPC44x_TLB_PAGEID
+	sync
+	b	ppc44x_map_done
+
+#ifdef CONFIG_PPC_47x
+
+	/* 1:1 mapping for 47x */
+
+setup_map_47x:
+
+	/*
+	 * Load the kernel pid (0) to PID and also to MMUCR[TID].
+	 * Also set the MSR IS->MMUCR STS
+	 */
+	li	r3, 0
+	mtspr	SPRN_PID, r3			/* Set PID */
+	mfmsr	r4				/* Get MSR */
+	andi.	r4, r4, MSR_IS@l		/* TS=1? */
+	beq	1f				/* If not, leave STS=0 */
+	oris	r3, r3, PPC47x_MMUCR_STS@h	/* Set STS=1 */
+1:	mtspr	SPRN_MMUCR, r3			/* Put MMUCR */
+	sync
+
+	/* Find the entry we are running from */
+	bl	2f
+2:	mflr	r23
+	tlbsx	r23, 0, r23
+	tlbre	r24, r23, 0			/* TLB Word 0 */
+	tlbre	r25, r23, 1			/* TLB Word 1 */
+	tlbre	r26, r23, 2			/* TLB Word 2 */
+
+
+	/*
+	 * Invalidates all the tlb entries by writing to 256 RPNs(r4)
+	 * of 4k page size in all  4 ways (0-3 in r3).
+	 * This would invalidate the entire UTLB including the one we are
+	 * running from. However the shadow TLB entries would help us 
+	 * to continue the execution, until we flush them (rfi/isync).
+	 */
+	addis	r3, 0, 0x8000			/* specify the way */
+	addi	r4, 0, 0			/* TLB Word0 = (EPN=0, VALID = 0) */
+	addi	r5, 0, 0
+	b	clear_utlb_entry
+
+	/* Align the loop to speed things up. from head_44x.S */
+	.align	6
+
+clear_utlb_entry:
+
+	tlbwe	r4, r3, 0
+	tlbwe	r5, r3, 1
+	tlbwe	r5, r3, 2
+	addis	r3, r3, 0x2000			/* Increment the way */
+	cmpwi	r3, 0
+	bne	clear_utlb_entry
+	addis	r3, 0, 0x8000
+	addis	r4, r4, 0x100			/* Increment the EPN */
+	cmpwi	r4, 0
+	bne	clear_utlb_entry
+
+	/* Create the entries in the other address space */
+	mfmsr	r5
+	rlwinm	r7, r5, 27, 31, 31		/* Get the TS (Bit 26) from MSR */
+	xori	r7, r7, 1			/* r7 = !TS */
+
+	insrwi	r24, r7, 1, 21			/* Change the TS in the saved TLB word 0 */
+
+	/* 
+	 * write out the TLB entries for the tmp mapping
+	 * Use way '0' so that we could easily invalidate it later.
+	 */
+	lis	r3, 0x8000			/* Way '0' */ 
+
+	tlbwe	r24, r3, 0
+	tlbwe	r25, r3, 1
+	tlbwe	r26, r3, 2
+
+	/* Update the msr to the new TS */
+	insrwi	r5, r7, 1, 26
+
+	bl	1f
+1:	mflr	r6
+	addi	r6, r6, (2f-1b)
+
+	mtspr	SPRN_SRR0, r6
+	mtspr	SPRN_SRR1, r5
+	rfi
+
+	/* 
+	 * Now we are in the tmp address space.
+	 * Create a 1:1 mapping for 0-2GiB in the original TS.
+	 */
+2:
+	li	r3, 0
+	li	r4, 0				/* TLB Word 0 */
+	li	r5, 0				/* TLB Word 1 */
+	li	r6, 0
+	ori	r6, r6, PPC47x_TLB2_S_RWX	/* TLB word 2 */
+
+	li	r8, 0				/* PageIndex */
+
+	xori	r7, r7, 1			/* revert back to original TS */
+
+write_utlb:
+	rotlwi	r5, r8, 28			/* RPN = PageIndex * 256M */
+						/* ERPN = 0 as we don't use memory above 2G */
+
+	mr	r4, r5				/* EPN = RPN */
+	ori	r4, r4, (PPC47x_TLB0_VALID | PPC47x_TLB0_256M)
+	insrwi	r4, r7, 1, 21			/* Insert the TS to Word 0 */
+
+	tlbwe	r4, r3, 0			/* Write out the entries */
+	tlbwe	r5, r3, 1
+	tlbwe	r6, r3, 2
+	addi	r8, r8, 1
+	cmpwi	r8, 8				/* Have we completed ? */
+	bne	write_utlb
+
+	/* make sure we complete the TLB write up */
+	isync
+
+	/* 
+	 * Prepare to jump to the 1:1 mapping.
+	 * 1) Extract page size of the tmp mapping
+	 *    DSIZ = TLB_Word0[22:27]
+	 * 2) Calculate the physical address of the address
+	 *    to jump to.
+	 */
+	rlwinm	r10, r24, 0, 22, 27
+
+	cmpwi	r10, PPC47x_TLB0_4K
+	bne	0f
+	li	r10, 0x1000			/* r10 = 4k */
+	bl	1f
+
+0:
+	/* Defaults to 256M */
+	lis	r10, 0x1000
+	
+	bl	1f
+1:	mflr	r4
+	addi	r4, r4, (2f-1b)			/* virtual address  of 2f */
+
+	subi	r11, r10, 1			/* offsetmask = Pagesize - 1 */
+	not	r10, r11			/* Pagemask = ~(offsetmask) */
+
+	and	r5, r25, r10			/* Physical page */
+	and	r6, r4, r11			/* offset within the current page */
+
+	or	r5, r5, r6			/* Physical address for 2f */
+
+	/* Switch the TS in MSR to the original one */
+	mfmsr	r8
+	insrwi	r8, r7, 1, 26
+
+	mtspr	SPRN_SRR1, r8
+	mtspr	SPRN_SRR0, r5
+	rfi
+
+2:
+	/* Invalidate the tmp mapping */
+	lis	r3, 0x8000			/* Way '0' */
+
+	clrrwi	r24, r24, 12			/* Clear the valid bit */
+	tlbwe	r24, r3, 0
+	tlbwe	r25, r3, 1
+	tlbwe	r26, r3, 2
+
+	/* Make sure we complete the TLB write and flush the shadow TLB */
+	isync
+
+#endif
+
+ppc44x_map_done:
+
+
+	/* Restore the parameters */
+	mr	r3, r29
+	mr	r4, r30
+	mr	r5, r31
+
+	li	r0, 0
+#else
+	li	r0, 0
+
+	/*
+	 * Set Machine Status Register to a known status,
+	 * switch the MMU off and jump to 1: in a single step.
+	 */
+
+	mr	r8, r0
+	ori     r8, r8, MSR_RI|MSR_ME
+	mtspr	SPRN_SRR1, r8
+	addi	r8, r4, 1f - relocate_new_kernel
+	mtspr	SPRN_SRR0, r8
+	sync
+	rfi
+
+1:
+#endif
+	/* from this point address translation is turned off */
+	/* and interrupts are disabled */
+
+	/* set a new stack at the bottom of our page... */
+	/* (not really needed now) */
+	addi	r1, r4, KEXEC_CONTROL_PAGE_SIZE - 8 /* for LR Save+Back Chain */
+	stw	r0, 0(r1)
+
+	/* Do the copies */
+	li	r6, 0 /* checksum */
+	mr	r0, r3
+	b	1f
+
+0:	/* top, read another word for the indirection page */
+	lwzu	r0, 4(r3)
+
+1:
+	/* is it a destination page? (r8) */
+	rlwinm.	r7, r0, 0, 31, 31 /* IND_DESTINATION (1<<0) */
+	beq	2f
+
+	rlwinm	r8, r0, 0, 0, 19 /* clear kexec flags, page align */
+	b	0b
+
+2:	/* is it an indirection page? (r3) */
+	rlwinm.	r7, r0, 0, 30, 30 /* IND_INDIRECTION (1<<1) */
+	beq	2f
+
+	rlwinm	r3, r0, 0, 0, 19 /* clear kexec flags, page align */
+	subi	r3, r3, 4
+	b	0b
+
+2:	/* are we done? */
+	rlwinm.	r7, r0, 0, 29, 29 /* IND_DONE (1<<2) */
+	beq	2f
+	b	3f
+
+2:	/* is it a source page? (r9) */
+	rlwinm.	r7, r0, 0, 28, 28 /* IND_SOURCE (1<<3) */
+	beq	0b
+
+	rlwinm	r9, r0, 0, 0, 19 /* clear kexec flags, page align */
+
+	li	r7, PAGE_SIZE / 4
+	mtctr   r7
+	subi    r9, r9, 4
+	subi    r8, r8, 4
+9:
+	lwzu    r0, 4(r9)  /* do the copy */
+	xor	r6, r6, r0
+	stwu    r0, 4(r8)
+	dcbst	0, r8
+	sync
+	icbi	0, r8
+	bdnz    9b
+
+	addi    r9, r9, 4
+	addi    r8, r8, 4
+	b	0b
+
+3:
+
+	/* To be certain of avoiding problems with self-modifying code
+	 * execute a serializing instruction here.
+	 */
+	isync
+	sync
+
+	mfspr	r3, SPRN_PIR /* current core we are running on */
+	mr	r4, r5 /* load physical address of chunk called */
+
+	/* jump to the entry point, usually the setup routine */
+	mtlr	r5
+	blrl
+
+1:	b	1b
+
+relocate_new_kernel_end:
+
+	.globl relocate_new_kernel_size
+relocate_new_kernel_size:
+	.long relocate_new_kernel_end - relocate_new_kernel
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index 82df4b09e79f..6cbcabac7ee1 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -6,11 +6,6 @@
  * Largely rewritten by Cort Dougan (cort@cs.nmt.edu)
  * and Paul Mackerras.
  *
- * kexec bits:
- * Copyright (C) 2002-2003 Eric Biederman  <ebiederm@xmission.com>
- * GameCube/ppc32 port Copyright (C) 2004 Albert Herranz
- * PPC44x port. Copyright (C) 2011,  IBM Corporation
- * 		Author: Suzuki Poulose <suzuki@in.ibm.com>
  */
 
 #include <linux/sys.h>
@@ -25,7 +20,6 @@
 #include <asm/thread_info.h>
 #include <asm/asm-offsets.h>
 #include <asm/processor.h>
-#include <asm/kexec.h>
 #include <asm/bug.h>
 #include <asm/ptrace.h>
 #include <asm/export.h>
@@ -614,488 +608,3 @@ _GLOBAL(start_secondary_resume)
  */
 _GLOBAL(__main)
 	blr
-
-#ifdef CONFIG_KEXEC_CORE
-	/*
-	 * Must be relocatable PIC code callable as a C function.
-	 */
-	.globl relocate_new_kernel
-relocate_new_kernel:
-	/* r3 = page_list   */
-	/* r4 = reboot_code_buffer */
-	/* r5 = start_address      */
-
-#ifdef CONFIG_FSL_BOOKE
-
-	mr	r29, r3
-	mr	r30, r4
-	mr	r31, r5
-
-#define ENTRY_MAPPING_KEXEC_SETUP
-#include "fsl_booke_entry_mapping.S"
-#undef ENTRY_MAPPING_KEXEC_SETUP
-
-	mr      r3, r29
-	mr      r4, r30
-	mr      r5, r31
-
-	li	r0, 0
-#elif defined(CONFIG_44x)
-
-	/* Save our parameters */
-	mr	r29, r3
-	mr	r30, r4
-	mr	r31, r5
-
-#ifdef CONFIG_PPC_47x
-	/* Check for 47x cores */
-	mfspr	r3,SPRN_PVR
-	srwi	r3,r3,16
-	cmplwi	cr0,r3,PVR_476FPE@h
-	beq	setup_map_47x
-	cmplwi	cr0,r3,PVR_476@h
-	beq	setup_map_47x
-	cmplwi	cr0,r3,PVR_476_ISS@h
-	beq	setup_map_47x
-#endif /* CONFIG_PPC_47x */
-	
-/*
- * Code for setting up 1:1 mapping for PPC440x for KEXEC
- *
- * We cannot switch off the MMU on PPC44x.
- * So we:
- * 1) Invalidate all the mappings except the one we are running from.
- * 2) Create a tmp mapping for our code in the other address space(TS) and
- *    jump to it. Invalidate the entry we started in.
- * 3) Create a 1:1 mapping for 0-2GiB in chunks of 256M in original TS.
- * 4) Jump to the 1:1 mapping in original TS.
- * 5) Invalidate the tmp mapping.
- *
- * - Based on the kexec support code for FSL BookE
- *
- */
-
-	/* 
-	 * Load the PID with kernel PID (0).
-	 * Also load our MSR_IS and TID to MMUCR for TLB search.
-	 */
-	li	r3, 0
-	mtspr	SPRN_PID, r3
-	mfmsr	r4
-	andi.	r4,r4,MSR_IS@l
-	beq	wmmucr
-	oris	r3,r3,PPC44x_MMUCR_STS@h
-wmmucr:
-	mtspr	SPRN_MMUCR,r3
-	sync
-
-	/*
-	 * Invalidate all the TLB entries except the current entry
-	 * where we are running from
-	 */
-	bl	0f				/* Find our address */
-0:	mflr	r5				/* Make it accessible */
-	tlbsx	r23,0,r5			/* Find entry we are in */
-	li	r4,0				/* Start at TLB entry 0 */
-	li	r3,0				/* Set PAGEID inval value */
-1:	cmpw	r23,r4				/* Is this our entry? */
-	beq	skip				/* If so, skip the inval */
-	tlbwe	r3,r4,PPC44x_TLB_PAGEID		/* If not, inval the entry */
-skip:
-	addi	r4,r4,1				/* Increment */
-	cmpwi	r4,64				/* Are we done?	*/
-	bne	1b				/* If not, repeat */
-	isync
-
-	/* Create a temp mapping and jump to it */
-	andi.	r6, r23, 1		/* Find the index to use */
-	addi	r24, r6, 1		/* r24 will contain 1 or 2 */
-
-	mfmsr	r9			/* get the MSR */
-	rlwinm	r5, r9, 27, 31, 31	/* Extract the MSR[IS] */
-	xori	r7, r5, 1		/* Use the other address space */
-
-	/* Read the current mapping entries */
-	tlbre	r3, r23, PPC44x_TLB_PAGEID
-	tlbre	r4, r23, PPC44x_TLB_XLAT
-	tlbre	r5, r23, PPC44x_TLB_ATTRIB
-
-	/* Save our current XLAT entry */
-	mr	r25, r4
-
-	/* Extract the TLB PageSize */
-	li	r10, 1 			/* r10 will hold PageSize */
-	rlwinm	r11, r3, 0, 24, 27	/* bits 24-27 */
-
-	/* XXX: As of now we use 256M, 4K pages */
-	cmpwi	r11, PPC44x_TLB_256M
-	bne	tlb_4k
-	rotlwi	r10, r10, 28		/* r10 = 256M */
-	b	write_out
-tlb_4k:
-	cmpwi	r11, PPC44x_TLB_4K
-	bne	default
-	rotlwi	r10, r10, 12		/* r10 = 4K */
-	b	write_out
-default:
-	rotlwi	r10, r10, 10		/* r10 = 1K */
-
-write_out:
-	/*
-	 * Write out the tmp 1:1 mapping for this code in other address space
-	 * Fixup  EPN = RPN , TS=other address space
-	 */
-	insrwi	r3, r7, 1, 23		/* Bit 23 is TS for PAGEID field */
-
-	/* Write out the tmp mapping entries */
-	tlbwe	r3, r24, PPC44x_TLB_PAGEID
-	tlbwe	r4, r24, PPC44x_TLB_XLAT
-	tlbwe	r5, r24, PPC44x_TLB_ATTRIB
-
-	subi	r11, r10, 1		/* PageOffset Mask = PageSize - 1 */
-	not	r10, r11		/* Mask for PageNum */
-
-	/* Switch to other address space in MSR */
-	insrwi	r9, r7, 1, 26		/* Set MSR[IS] = r7 */
-
-	bl	1f
-1:	mflr	r8
-	addi	r8, r8, (2f-1b)		/* Find the target offset */
-
-	/* Jump to the tmp mapping */
-	mtspr	SPRN_SRR0, r8
-	mtspr	SPRN_SRR1, r9
-	rfi
-
-2:
-	/* Invalidate the entry we were executing from */
-	li	r3, 0
-	tlbwe	r3, r23, PPC44x_TLB_PAGEID
-
-	/* attribute fields. rwx for SUPERVISOR mode */
-	li	r5, 0
-	ori	r5, r5, (PPC44x_TLB_SW | PPC44x_TLB_SR | PPC44x_TLB_SX | PPC44x_TLB_G)
-
-	/* Create 1:1 mapping in 256M pages */
-	xori	r7, r7, 1			/* Revert back to Original TS */
-
-	li	r8, 0				/* PageNumber */
-	li	r6, 3				/* TLB Index, start at 3  */
-
-next_tlb:
-	rotlwi	r3, r8, 28			/* Create EPN (bits 0-3) */
-	mr	r4, r3				/* RPN = EPN  */
-	ori	r3, r3, (PPC44x_TLB_VALID | PPC44x_TLB_256M) /* SIZE = 256M, Valid */
-	insrwi	r3, r7, 1, 23			/* Set TS from r7 */
-
-	tlbwe	r3, r6, PPC44x_TLB_PAGEID	/* PageID field : EPN, V, SIZE */
-	tlbwe	r4, r6, PPC44x_TLB_XLAT		/* Address translation : RPN   */
-	tlbwe	r5, r6, PPC44x_TLB_ATTRIB	/* Attributes */
-
-	addi	r8, r8, 1			/* Increment PN */
-	addi	r6, r6, 1			/* Increment TLB Index */
-	cmpwi	r8, 8				/* Are we done ? */
-	bne	next_tlb
-	isync
-
-	/* Jump to the new mapping 1:1 */
-	li	r9,0
-	insrwi	r9, r7, 1, 26			/* Set MSR[IS] = r7 */
-
-	bl	1f
-1:	mflr	r8
-	and	r8, r8, r11			/* Get our offset within page */
-	addi	r8, r8, (2f-1b)
-
-	and	r5, r25, r10			/* Get our target PageNum */
-	or	r8, r8, r5			/* Target jump address */
-
-	mtspr	SPRN_SRR0, r8
-	mtspr	SPRN_SRR1, r9
-	rfi
-2:
-	/* Invalidate the tmp entry we used */
-	li	r3, 0
-	tlbwe	r3, r24, PPC44x_TLB_PAGEID
-	sync
-	b	ppc44x_map_done
-
-#ifdef CONFIG_PPC_47x
-
-	/* 1:1 mapping for 47x */
-
-setup_map_47x:
-
-	/*
-	 * Load the kernel pid (0) to PID and also to MMUCR[TID].
-	 * Also set the MSR IS->MMUCR STS
-	 */
-	li	r3, 0
-	mtspr	SPRN_PID, r3			/* Set PID */
-	mfmsr	r4				/* Get MSR */
-	andi.	r4, r4, MSR_IS@l		/* TS=1? */
-	beq	1f				/* If not, leave STS=0 */
-	oris	r3, r3, PPC47x_MMUCR_STS@h	/* Set STS=1 */
-1:	mtspr	SPRN_MMUCR, r3			/* Put MMUCR */
-	sync
-
-	/* Find the entry we are running from */
-	bl	2f
-2:	mflr	r23
-	tlbsx	r23, 0, r23
-	tlbre	r24, r23, 0			/* TLB Word 0 */
-	tlbre	r25, r23, 1			/* TLB Word 1 */
-	tlbre	r26, r23, 2			/* TLB Word 2 */
-
-
-	/*
-	 * Invalidates all the tlb entries by writing to 256 RPNs(r4)
-	 * of 4k page size in all  4 ways (0-3 in r3).
-	 * This would invalidate the entire UTLB including the one we are
-	 * running from. However the shadow TLB entries would help us 
-	 * to continue the execution, until we flush them (rfi/isync).
-	 */
-	addis	r3, 0, 0x8000			/* specify the way */
-	addi	r4, 0, 0			/* TLB Word0 = (EPN=0, VALID = 0) */
-	addi	r5, 0, 0
-	b	clear_utlb_entry
-
-	/* Align the loop to speed things up. from head_44x.S */
-	.align	6
-
-clear_utlb_entry:
-
-	tlbwe	r4, r3, 0
-	tlbwe	r5, r3, 1
-	tlbwe	r5, r3, 2
-	addis	r3, r3, 0x2000			/* Increment the way */
-	cmpwi	r3, 0
-	bne	clear_utlb_entry
-	addis	r3, 0, 0x8000
-	addis	r4, r4, 0x100			/* Increment the EPN */
-	cmpwi	r4, 0
-	bne	clear_utlb_entry
-
-	/* Create the entries in the other address space */
-	mfmsr	r5
-	rlwinm	r7, r5, 27, 31, 31		/* Get the TS (Bit 26) from MSR */
-	xori	r7, r7, 1			/* r7 = !TS */
-
-	insrwi	r24, r7, 1, 21			/* Change the TS in the saved TLB word 0 */
-
-	/* 
-	 * write out the TLB entries for the tmp mapping
-	 * Use way '0' so that we could easily invalidate it later.
-	 */
-	lis	r3, 0x8000			/* Way '0' */ 
-
-	tlbwe	r24, r3, 0
-	tlbwe	r25, r3, 1
-	tlbwe	r26, r3, 2
-
-	/* Update the msr to the new TS */
-	insrwi	r5, r7, 1, 26
-
-	bl	1f
-1:	mflr	r6
-	addi	r6, r6, (2f-1b)
-
-	mtspr	SPRN_SRR0, r6
-	mtspr	SPRN_SRR1, r5
-	rfi
-
-	/* 
-	 * Now we are in the tmp address space.
-	 * Create a 1:1 mapping for 0-2GiB in the original TS.
-	 */
-2:
-	li	r3, 0
-	li	r4, 0				/* TLB Word 0 */
-	li	r5, 0				/* TLB Word 1 */
-	li	r6, 0
-	ori	r6, r6, PPC47x_TLB2_S_RWX	/* TLB word 2 */
-
-	li	r8, 0				/* PageIndex */
-
-	xori	r7, r7, 1			/* revert back to original TS */
-
-write_utlb:
-	rotlwi	r5, r8, 28			/* RPN = PageIndex * 256M */
-						/* ERPN = 0 as we don't use memory above 2G */
-
-	mr	r4, r5				/* EPN = RPN */
-	ori	r4, r4, (PPC47x_TLB0_VALID | PPC47x_TLB0_256M)
-	insrwi	r4, r7, 1, 21			/* Insert the TS to Word 0 */
-
-	tlbwe	r4, r3, 0			/* Write out the entries */
-	tlbwe	r5, r3, 1
-	tlbwe	r6, r3, 2
-	addi	r8, r8, 1
-	cmpwi	r8, 8				/* Have we completed ? */
-	bne	write_utlb
-
-	/* make sure we complete the TLB write up */
-	isync
-
-	/* 
-	 * Prepare to jump to the 1:1 mapping.
-	 * 1) Extract page size of the tmp mapping
-	 *    DSIZ = TLB_Word0[22:27]
-	 * 2) Calculate the physical address of the address
-	 *    to jump to.
-	 */
-	rlwinm	r10, r24, 0, 22, 27
-
-	cmpwi	r10, PPC47x_TLB0_4K
-	bne	0f
-	li	r10, 0x1000			/* r10 = 4k */
-	bl	1f
-
-0:
-	/* Defaults to 256M */
-	lis	r10, 0x1000
-	
-	bl	1f
-1:	mflr	r4
-	addi	r4, r4, (2f-1b)			/* virtual address  of 2f */
-
-	subi	r11, r10, 1			/* offsetmask = Pagesize - 1 */
-	not	r10, r11			/* Pagemask = ~(offsetmask) */
-
-	and	r5, r25, r10			/* Physical page */
-	and	r6, r4, r11			/* offset within the current page */
-
-	or	r5, r5, r6			/* Physical address for 2f */
-
-	/* Switch the TS in MSR to the original one */
-	mfmsr	r8
-	insrwi	r8, r7, 1, 26
-
-	mtspr	SPRN_SRR1, r8
-	mtspr	SPRN_SRR0, r5
-	rfi
-
-2:
-	/* Invalidate the tmp mapping */
-	lis	r3, 0x8000			/* Way '0' */
-
-	clrrwi	r24, r24, 12			/* Clear the valid bit */
-	tlbwe	r24, r3, 0
-	tlbwe	r25, r3, 1
-	tlbwe	r26, r3, 2
-
-	/* Make sure we complete the TLB write and flush the shadow TLB */
-	isync
-
-#endif
-
-ppc44x_map_done:
-
-
-	/* Restore the parameters */
-	mr	r3, r29
-	mr	r4, r30
-	mr	r5, r31
-
-	li	r0, 0
-#else
-	li	r0, 0
-
-	/*
-	 * Set Machine Status Register to a known status,
-	 * switch the MMU off and jump to 1: in a single step.
-	 */
-
-	mr	r8, r0
-	ori     r8, r8, MSR_RI|MSR_ME
-	mtspr	SPRN_SRR1, r8
-	addi	r8, r4, 1f - relocate_new_kernel
-	mtspr	SPRN_SRR0, r8
-	sync
-	rfi
-
-1:
-#endif
-	/* from this point address translation is turned off */
-	/* and interrupts are disabled */
-
-	/* set a new stack at the bottom of our page... */
-	/* (not really needed now) */
-	addi	r1, r4, KEXEC_CONTROL_PAGE_SIZE - 8 /* for LR Save+Back Chain */
-	stw	r0, 0(r1)
-
-	/* Do the copies */
-	li	r6, 0 /* checksum */
-	mr	r0, r3
-	b	1f
-
-0:	/* top, read another word for the indirection page */
-	lwzu	r0, 4(r3)
-
-1:
-	/* is it a destination page? (r8) */
-	rlwinm.	r7, r0, 0, 31, 31 /* IND_DESTINATION (1<<0) */
-	beq	2f
-
-	rlwinm	r8, r0, 0, 0, 19 /* clear kexec flags, page align */
-	b	0b
-
-2:	/* is it an indirection page? (r3) */
-	rlwinm.	r7, r0, 0, 30, 30 /* IND_INDIRECTION (1<<1) */
-	beq	2f
-
-	rlwinm	r3, r0, 0, 0, 19 /* clear kexec flags, page align */
-	subi	r3, r3, 4
-	b	0b
-
-2:	/* are we done? */
-	rlwinm.	r7, r0, 0, 29, 29 /* IND_DONE (1<<2) */
-	beq	2f
-	b	3f
-
-2:	/* is it a source page? (r9) */
-	rlwinm.	r7, r0, 0, 28, 28 /* IND_SOURCE (1<<3) */
-	beq	0b
-
-	rlwinm	r9, r0, 0, 0, 19 /* clear kexec flags, page align */
-
-	li	r7, PAGE_SIZE / 4
-	mtctr   r7
-	subi    r9, r9, 4
-	subi    r8, r8, 4
-9:
-	lwzu    r0, 4(r9)  /* do the copy */
-	xor	r6, r6, r0
-	stwu    r0, 4(r8)
-	dcbst	0, r8
-	sync
-	icbi	0, r8
-	bdnz    9b
-
-	addi    r9, r9, 4
-	addi    r8, r8, 4
-	b	0b
-
-3:
-
-	/* To be certain of avoiding problems with self-modifying code
-	 * execute a serializing instruction here.
-	 */
-	isync
-	sync
-
-	mfspr	r3, SPRN_PIR /* current core we are running on */
-	mr	r4, r5 /* load physical address of chunk called */
-
-	/* jump to the entry point, usually the setup routine */
-	mtlr	r5
-	blrl
-
-1:	b	1b
-
-relocate_new_kernel_end:
-
-	.globl relocate_new_kernel_size
-relocate_new_kernel_size:
-	.long relocate_new_kernel_end - relocate_new_kernel
-#endif
-- 
2.13.3

