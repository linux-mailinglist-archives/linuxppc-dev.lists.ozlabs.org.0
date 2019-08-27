Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B31D9DC09
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 05:35:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HZK51LrWzDq6Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 13:35:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SludPViT"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HZCF2MhBzDqnT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 13:30:49 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id go14so11039566plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 20:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4MQv1fZDmpeZG9L25IANzqdKccZIl5dLjm+wLh5C3Oc=;
 b=SludPViT/8QbNF8i+i3WJud4H8ekVirxX5D1dmT++cZlnqPD/C12/61pUjZgso79oq
 fTzvEUnqv+6kLZqdLYOTOh7YiWxoBLnyDGphrXSdLgrsW/smBc7a5Vofo5Chd4QdCG/r
 g7cd7kzTXFoAptjGG7giTQPZj+n7XumzZwAq70yG69li9Skg/iUwoyP4c0Y+C5Jc1eGi
 GnisBsxtyAApZCd+NFqu63EYdZJ8zEMGk0n7ddF6WQkVLmrrCygxWJv8KXaV+TlaH51r
 rCU/2u+M5cvVdO1V6dSfKon5Rhouw/omeyyG0kxU2mMFfBMTk8zxc6bpWeF/99AM+YAE
 RBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4MQv1fZDmpeZG9L25IANzqdKccZIl5dLjm+wLh5C3Oc=;
 b=ozbGXzZozxO5B0b3If7EMF/qXZs/YeCVHWZLQ3rR7Ew5obUhe+ssSmf2pJMppJ+R0A
 jgyquuHinMU/oRnVDOqKjjmrJobNgrE+BmN+RHZufNFwt79gPT+jCHjKvOZqmbBe04LX
 JHTVXb0donlWna8zjICEsAJjlC2PKPp23MKluT2MrDI8sc2aGUcu98l6c7UZNds22eiV
 BOPGgwx7uIPYCUCazTOXRuKN7+3Vk77sO0ahJoR51qeDxx2YwyDJ0NjUN0hmJHZypUv0
 ndqAilzEkOvnWQaPMudWXUkDTAhoCIOexynllIcVvQo3HLI/qPDpsyDWhd2xIcp/fZ0P
 WnaA==
X-Gm-Message-State: APjAAAWJTwGNsaZ1l7vnUdY/Nhcd6bcu2PqtzrukbNE1Ke/ngRkWKfJf
 AeIAbM0dSq96Z5XKaqALqpUfFvyI
X-Google-Smtp-Source: APXvYqxjTOHPRa04u9UMalH6dFvJClzwK+QhPMEt2sk7oJnngBFau9m9PHIQNHjThjITjQ7LXoa7Vg==
X-Received: by 2002:a17:902:b702:: with SMTP id
 d2mr10406427pls.259.1566876646630; 
 Mon, 26 Aug 2019 20:30:46 -0700 (PDT)
Received: from bobo.local0.net (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id x24sm11383984pgl.84.2019.08.26.20.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 20:30:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc/64: remove support for kernel-mode syscalls
Date: Tue, 27 Aug 2019 13:30:07 +1000
Message-Id: <20190827033010.28090-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827033010.28090-1-npiggin@gmail.com>
References: <20190827033010.28090-1-npiggin@gmail.com>
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

There is support for the kernel to execute the 'sc 0' instruction and
make a system call to itself. This is a relic that is unused in the
tree, therefore untested. It's also highly questionable for modules to
be doing this.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_64.S       | 21 ++++++---------------
 arch/powerpc/kernel/exceptions-64s.S |  2 --
 2 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 0a0b5310f54a..6467bdab8d40 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -69,24 +69,20 @@ BEGIN_FTR_SECTION
 	bne	.Ltabort_syscall
 END_FTR_SECTION_IFSET(CPU_FTR_TM)
 #endif
-	andi.	r10,r12,MSR_PR
 	mr	r10,r1
-	addi	r1,r1,-INT_FRAME_SIZE
-	beq-	1f
 	ld	r1,PACAKSAVE(r13)
-1:	std	r10,0(r1)
+	std	r10,0(r1)
 	std	r11,_NIP(r1)
 	std	r12,_MSR(r1)
 	std	r0,GPR0(r1)
 	std	r10,GPR1(r1)
-	beq	2f			/* if from kernel mode */
 #ifdef CONFIG_PPC_FSL_BOOK3E
 START_BTB_FLUSH_SECTION
 	BTB_FLUSH(r10)
 END_BTB_FLUSH_SECTION
 #endif
 	ACCOUNT_CPU_USER_ENTRY(r13, r10, r11)
-2:	std	r2,GPR2(r1)
+	std	r2,GPR2(r1)
 	std	r3,GPR3(r1)
 	mfcr	r2
 	std	r4,GPR4(r1)
@@ -122,14 +118,13 @@ END_BTB_FLUSH_SECTION
 
 #if defined(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) && defined(CONFIG_PPC_SPLPAR)
 BEGIN_FW_FTR_SECTION
-	beq	33f
-	/* if from user, see if there are any DTL entries to process */
+	/* see if there are any DTL entries to process */
 	ld	r10,PACALPPACAPTR(r13)	/* get ptr to VPA */
 	ld	r11,PACA_DTL_RIDX(r13)	/* get log read index */
 	addi	r10,r10,LPPACA_DTLIDX
 	LDX_BE	r10,0,r10		/* get log write index */
-	cmpd	cr1,r11,r10
-	beq+	cr1,33f
+	cmpd	r11,r10
+	beq+	33f
 	bl	accumulate_stolen_time
 	REST_GPR(0,r1)
 	REST_4GPRS(3,r1)
@@ -203,6 +198,7 @@ system_call:			/* label this so stack traces look sane */
 	mtctr   r12
 	bctrl			/* Call handler */
 
+	/* syscall_exit can exit to kernel mode, via ret_from_kernel_thread */
 .Lsyscall_exit:
 	std	r3,RESULT(r1)
 
@@ -216,11 +212,6 @@ system_call:			/* label this so stack traces look sane */
 	ld	r12, PACA_THREAD_INFO(r13)
 
 	ld	r8,_MSR(r1)
-#ifdef CONFIG_PPC_BOOK3S
-	/* No MSR:RI on BookE */
-	andi.	r10,r8,MSR_RI
-	beq-	.Lunrecov_restore
-#endif
 
 /*
  * This is a few instructions into the actual syscall exit path (which actually
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 6ba3cc2ef8ab..768f133de4f1 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1521,8 +1521,6 @@ EXC_COMMON(trap_0b_common, 0xb00, unknown_exception)
  * system call / hypercall (0xc00, 0x4c00)
  *
  * The system call exception is invoked with "sc 0" and does not alter HV bit.
- * There is support for kernel code to invoke system calls but there are no
- * in-tree users.
  *
  * The hypercall is invoked with "sc 1" and sets HV=1.
  *
-- 
2.22.0

