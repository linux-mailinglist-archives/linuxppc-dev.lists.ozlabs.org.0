Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2088D4C7C0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:59:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tt3D2CC8zDr7q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:59:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hfEuT21u"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqmx3QhSzDqtv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:49 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id p10so940942pgn.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=go4Mn3G0gVr6MXcSchN2ThGoIlX6NbLD5/cmAQfRt8Q=;
 b=hfEuT21uk2OdaQ94Acrx/bZL8f3sEp5B5IwFs7yqBiTalOVc5U2KjUe5XAVhrBb1qU
 0NiV4DwTL86dUCP6e0b9z7yAJSZrcyo8jQ7FYM6t7/SVNaZd0o6pxJjDcF/0gosUrm/S
 +DMkNMJ0h+1+pPR5lSNMW9ZHePyVPI08wZ5XFLg6/wfoZanP9qSYWFjvI19al9v3RbMw
 Cw91oHhQcEbgFDXcsCTT11X0rMj8gu+VvzxbfI8X3oTMosrc6GOqZmqIVzYb9cflqkjY
 peLiWkKuLq25mc9au9njurfBEhQeWjMyjljokd/TdugE4JgA3frTNvFWWsc1OwhRyZlQ
 rFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=go4Mn3G0gVr6MXcSchN2ThGoIlX6NbLD5/cmAQfRt8Q=;
 b=qGSXisZmhpPrjKrVb/9GdDP0wpxDfqAxgDN9HHR1AuIh/duZPAGjd4kL4LOfcbaAyk
 W9hN8DnQuKItyRu1qomtK8Iwjz+AdQlwI/Vr7NAVvmfhj4SYvA/AHN94pupi7h3S4X0k
 O3kzhTLpgCNKzRCwrB9iCZ2zCsTR3JQNBJgFlI5HvcTBR3hsmQtSc3Psp1oo80buBakh
 1TIs2k2WVL/EHSJxDZt4HNUpWrovlWRXQF5mbHyAlLfyNjALjn1Q7Z3LC0t4wM4IjweU
 xaDvLNaRIbdWn8CoGtUBYS6Kg8euN8b1FbYtWErqUWC7Eq0cVl67cDlGtdLhDHzGM7cY
 oowQ==
X-Gm-Message-State: APjAAAX+6JQqb0uvGisNKJEBNbvLTw2gjuWgW5D0ukJCwf78b/PmlyWf
 9RBj/+hcmpaEm9KKqWsrZtrjBxYU
X-Google-Smtp-Source: APXvYqzq3ficVOlArGhLGhVCV/2YBHDFNjNBqg67zl87RkLDYKX4l1OZ3aKUH1FCg4ewpprbnSXBxw==
X-Received: by 2002:a17:90a:9289:: with SMTP id
 n9mr1116572pjo.35.1561007807398; 
 Wed, 19 Jun 2019 22:16:47 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 49/52] powerpc/64s/exceptions: machine check move
 unrecoverable handling out of line
Date: Thu, 20 Jun 2019 15:14:56 +1000
Message-Id: <20190620051459.29573-50-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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

Similarly to the previous patch, move unrecoverable handling out of
line, which makes the regular path less cluttered and easier to
follow.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 83 +++++++++++++---------------
 1 file changed, 39 insertions(+), 44 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index be83a4e71814..e8f644d6f310 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1016,9 +1016,9 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 	bne	1f
 	/* First machine check entry */
 	ld	r1,PACAMCEMERGSP(r13)	/* Use MC emergency stack */
-1:	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame */
-	/* Limit nested MCE to level 4 to avoid stack overflow */
-	bge	cr1,2f			/* Check if we hit limit of 4 */
+1:	/* Limit nested MCE to level 4 to avoid stack overflow */
+	bgt	cr1,unrecoverable_mce	/* Check if we hit limit of 4 */
+	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame */
 
 	EXCEPTION_PROLOG_COMMON_1()
 	/* We don't touch AMR here, we never go to virtual mode */
@@ -1032,25 +1032,9 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 
 	li	r10,MSR_RI
 	mtmsrd	r10,1
-
 	bl	enable_machine_check
 	b	machine_check_handle_early
 
-2:
-	/* Stack overflow. Stay on emergency stack and panic.
-	 * Keep the ME bit off while panic-ing, so that if we hit
-	 * another machine check we checkstop.
-	 */
-	addi	r1,r1,INT_FRAME_SIZE	/* go back to previous stack frame */
-	ld	r11,PACAKMSR(r13)
-	LOAD_HANDLER(r12, unrecover_mce)
-	li	r10,MSR_ME
-	andc	r11,r11,r10		/* Turn off MSR_ME */
-	mtspr	SPRN_SRR0,r12
-	mtspr	SPRN_SRR1,r11
-	RFI_TO_KERNEL
-	b	.	/* prevent speculative execution */
-
 EXC_COMMON_BEGIN(machine_check_common)
 	/*
 	 * Machine check is different because we use a different
@@ -1166,32 +1150,15 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_206)
 	 * If yes, then stay on emergency stack and panic.
 	 */
 	andi.	r11,r12,MSR_RI
-	bne	2f
-1:	mfspr	r11,SPRN_SRR0
-	LOAD_HANDLER(r10,unrecover_mce)
-	mtspr	SPRN_SRR0,r10
-	ld	r10,PACAKMSR(r13)
-	/*
-	 * We are going down. But there are chances that we might get hit by
-	 * another MCE during panic path and we may run into unstable state
-	 * with no way out. Hence, turn ME bit off while going down, so that
-	 * when another MCE is hit during panic path, system will checkstop
-	 * and hypervisor will get restarted cleanly by SP.
-	 */
-	li	r3,MSR_ME
-	andc	r10,r10,r3		/* Turn off MSR_ME */
-	mtspr	SPRN_SRR1,r10
-	RFI_TO_KERNEL
-	b	.
-2:
+	beq	unrecoverable_mce
+
 	/*
 	 * Check if we have successfully handled/recovered from error, if not
 	 * then stay on emergency stack and panic.
 	 */
 	ld	r3,RESULT(r1)	/* Load result */
 	cmpdi	r3,0		/* see if we handled MCE successfully */
-
-	beq	1b		/* if !handled then panic */
+	beq	unrecoverable_mce /* if !handled then panic */
 
 	/*
 	 * Return from MC interrupt.
@@ -1213,17 +1180,31 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
 	EXCEPTION_PROLOG_2_REAL machine_check_common, EXC_STD, 0
 
-EXC_COMMON_BEGIN(unrecover_mce)
+EXC_COMMON_BEGIN(unrecoverable_mce)
+	/*
+	 * We are going down. But there are chances that we might get hit by
+	 * another MCE during panic path and we may run into unstable state
+	 * with no way out. Hence, turn ME bit off while going down, so that
+	 * when another MCE is hit during panic path, system will checkstop
+	 * and hypervisor will get restarted cleanly by SP.
+	 */
+	bl	disable_machine_check
+	ld	r10,PACAKMSR(r13)
+	li	r3,MSR_ME
+	andc	r10,r10,r3
+	mtmsrd	r10
+
 	/* Invoke machine_check_exception to print MCE event and panic. */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_exception
+
 	/*
-	 * We will not reach here. Even if we did, there is no way out. Call
-	 * unrecoverable_exception and die.
+	 * We will not reach here. Even if we did, there is no way out.
+	 * Call unrecoverable_exception and die.
 	 */
-1:	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unrecoverable_exception
-	b	1b
+	b	.
 
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
@@ -2297,6 +2278,20 @@ enable_machine_check:
 1:	mtlr	r0
 	blr
 
+disable_machine_check:
+	mflr	r0
+	bcl	20,31,$+4
+0:	mflr	r3
+	addi	r3,r3,(1f - 0b)
+	mtspr	SPRN_SRR0,r3
+	mfmsr	r3
+	li	r4,MSR_ME
+	andc	r3,r3,r4
+	mtspr	SPRN_SRR1,r3
+	RFI_TO_KERNEL
+1:	mtlr	r0
+	blr
+
 /*
  * Hash table stuff
  */
-- 
2.20.1

