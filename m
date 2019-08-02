Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 016407F6CC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 14:27:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460RHP3xh0zDr7D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 22:26:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="a6kDkj+5"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PNM1vKvzDqxf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:01:07 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id y15so35872901pfn.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nanOQbXs9olX59d1uRmjC7tvR9Xt5ZOOBj36zmx961Q=;
 b=a6kDkj+5spYU01a4dZp/RZDxuJMUoSyAnfjoWvaUOhS70Y3MNNc7wxGSJmyZCe+hZc
 5bNGD69Q4MRDpR1vmK8Y0w/A6+8RCiTseFF8BMKnuG5MfIF4CcBgbSsXFLM1qwobCI/U
 vEol9hm2VtuSZql4kl9vbeCKFMnPsrPzjotEHsPeWwJjbM14GYoNo0n2cZrDFtnGCQ0q
 bgV/n/DEeerK8ONbpsplx/Xpxm5f+kIhSRTG2q0/CPMRo03LLLMR4ucrpRvmuYOmaAXj
 tpPVzvDdkZRwnaV3XOEWjj5LV6rGKhEu0267N64ILrloBZ0CFs52mKs4FauiXlJHF+wQ
 dRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nanOQbXs9olX59d1uRmjC7tvR9Xt5ZOOBj36zmx961Q=;
 b=WOOO/6A02pl5iiCcDi2zeLlDxT3PRi4GefOrcpOtHBtK46yiI8lG6xcTy54gjl6dns
 AI/ZcGa+/tx93AJPihEjbHjV8/pW4+43t2htGUFiErQYjIIIXi71Igy8jD5n/P8M29iX
 QOAygXfXEx/VzPM8NnxN54UOT1nmU1RrvwhDE7cd2Ejfh85fjwP+29mRTz9tF+CHU3IK
 Et/ilrrPi3At8gsZnTabPXnGlu+2PLG2lr2CVGrFKtkVryE1oBeQ4pedfHMBAWiblyrG
 ZdPpRduLVCDvxukGi8Or6WUhw9IJVVfZJrfWYmrtImCrAz9bhOW3loW6mcFVpJvEZ9Y8
 DAJA==
X-Gm-Message-State: APjAAAWb14GTQdGqvCReUhl5hrSDYRcUdkConHI0UBDrFSFUi+LA5wQR
 xuUweze7V7wsojBuahd2Fh6TSOq25oU=
X-Google-Smtp-Source: APXvYqwLQONCM3Zn9keXnY8UBkDtbI12HqT8wzpt8XKPGoe95U321iTMJeFQLDBaGflt35fqVh+HPg==
X-Received: by 2002:a62:3347:: with SMTP id z68mr60508961pfz.174.1564743664799; 
 Fri, 02 Aug 2019 04:01:04 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.01.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:01:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 36/44] powerpc/64s/exception: reduce page fault unnecessary
 loads
Date: Fri,  2 Aug 2019 20:57:01 +1000
Message-Id: <20190802105709.27696-37-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This avoids 3 loads in the radix page fault case, 1 load in the
hash fault case, and 2 loads in the hash miss page fault case.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S  | 38 ++++++++++++---------------
 arch/powerpc/mm/book3s64/hash_utils.c |  4 +--
 2 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 908c8003f063..c8ba052290f8 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1159,11 +1159,11 @@ EXC_COMMON_BEGIN(data_access_common)
 	 * EX_DAR and EX_DSISR have saved DAR/DSISR
 	 */
 	INT_COMMON 0x300, PACA_EXGEN, 1, 1, 1, 1, 1
-	ld	r12,_MSR(r1)
-	ld	r3,_DAR(r1)
-	ld	r4,_DSISR(r1)
-	li	r5,0x300
+	ld	r4,_DAR(r1)
+	ld	r5,_DSISR(r1)
 BEGIN_MMU_FTR_SECTION
+	ld	r6,_MSR(r1)
+	li	r3,0x300
 	b	do_hash_page		/* Try to handle as hpte fault */
 MMU_FTR_SECTION_ELSE
 	b	handle_page_fault
@@ -1211,11 +1211,11 @@ EXC_VIRT_END(instruction_access, 0x4400, 0x80)
 INT_KVM_HANDLER instruction_access, 0x400, EXC_STD, PACA_EXGEN, 0
 EXC_COMMON_BEGIN(instruction_access_common)
 	INT_COMMON 0x400, PACA_EXGEN, 1, 1, 1, 2, 2
-	ld      r12,_MSR(r1)
-	ld	r3,_DAR(r1)
-	ld	r4,_DSISR(r1)
-	li	r5,0x400
+	ld	r4,_DAR(r1)
+	ld	r5,_DSISR(r1)
 BEGIN_MMU_FTR_SECTION
+	ld      r6,_MSR(r1)
+	li	r3,0x400
 	b	do_hash_page		/* Try to handle as hpte fault */
 MMU_FTR_SECTION_ELSE
 	b	handle_page_fault
@@ -2261,7 +2261,7 @@ do_hash_page:
 #ifdef CONFIG_PPC_BOOK3S_64
 	lis	r0,(DSISR_BAD_FAULT_64S | DSISR_DABRMATCH | DSISR_KEYFAULT)@h
 	ori	r0,r0,DSISR_BAD_FAULT_64S@l
-	and.	r0,r4,r0		/* weird error? */
+	and.	r0,r5,r0		/* weird error? */
 	bne-	handle_page_fault	/* if not, try to insert a HPTE */
 	ld	r11, PACA_THREAD_INFO(r13)
 	lwz	r0,TI_PREEMPT(r11)	/* If we're in an "NMI" */
@@ -2269,15 +2269,13 @@ do_hash_page:
 	bne	77f			/* then don't call hash_page now */
 
 	/*
-	 * r3 contains the faulting address
-	 * r4 msr
-	 * r5 contains the trap number
-	 * r6 contains dsisr
+	 * r3 contains the trap number
+	 * r4 contains the faulting address
+	 * r5 contains dsisr
+	 * r6 msr
 	 *
 	 * at return r3 = 0 for success, 1 for page fault, negative for error
 	 */
-        mr 	r4,r12
-	ld      r6,_DSISR(r1)
 	bl	__hash_page		/* build HPTE if possible */
         cmpdi	r3,0			/* see if __hash_page succeeded */
 
@@ -2287,16 +2285,15 @@ do_hash_page:
 	/* Error */
 	blt-	13f
 
-	/* Reload DSISR into r4 for the DABR check below */
-	ld      r4,_DSISR(r1)
+	/* Reload DAR/DSISR into r4/r5 for the DABR check below */
+	ld	r4,_DAR(r1)
+	ld      r5,_DSISR(r1)
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
 /* Here we have a page fault that hash_page can't handle. */
 handle_page_fault:
-11:	andis.  r0,r4,DSISR_DABRMATCH@h
+11:	andis.  r0,r5,DSISR_DABRMATCH@h
 	bne-    handle_dabr_fault
-	ld	r4,_DAR(r1)
-	ld	r5,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_page_fault
 	cmpdi	r3,0
@@ -2343,7 +2340,6 @@ handle_dabr_fault:
  * the access, or panic if there isn't a handler.
  */
 77:	bl	save_nvgprs
-	mr	r4,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	li	r5,SIGSEGV
 	bl	bad_page_fault
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index b8ad14bb1170..0a434cea16b7 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1460,8 +1460,8 @@ int hash_page(unsigned long ea, unsigned long access, unsigned long trap,
 }
 EXPORT_SYMBOL_GPL(hash_page);
 
-int __hash_page(unsigned long ea, unsigned long msr, unsigned long trap,
-		unsigned long dsisr)
+int __hash_page(unsigned long trap, unsigned long ea, unsigned long dsisr,
+		unsigned long msr)
 {
 	unsigned long access = _PAGE_PRESENT | _PAGE_READ;
 	unsigned long flags = 0;
-- 
2.22.0

