Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7DE9DC0A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 05:37:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HZM62D0PzDqY0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 13:37:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EY0IubGE"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HZCG6KtBzDqnT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 13:30:50 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id d3so11074575plr.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 20:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4MQv1fZDmpeZG9L25IANzqdKccZIl5dLjm+wLh5C3Oc=;
 b=EY0IubGE0vPR4Q9Y3SSvRGjRT4zUvTZyZdQkskTRd4tNV4V6c84ElpaLz1kzDCICil
 TEAqBkyRhmSWFLPR1+JCqWTftF1MY1fJzCv3GaoSyRgZzQsm460qqrrEbtQIGPaOmzN+
 lylK7fp+YTb+zn+j4TYBMLPmW19aACuPqRikJAdqnjtZDD9yvMh+NJ9+SuXtMXATqLDJ
 5NIa5dJSmV4gFoeQ3nkK7oQHjmJTzOVsTRAmikKP6V2fTJhEZOD8ZWd0WR+Jfukma8ya
 UuKt0YaEtxRQugSUV07gDke3meKP++VIcnEnLtuvB4otgfQ4jnXmq16QlyUeqrELikoN
 ULxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4MQv1fZDmpeZG9L25IANzqdKccZIl5dLjm+wLh5C3Oc=;
 b=n3vQdTEPiFx1gtA4iypD+Kv2xkBkfMGR+KLlF42Iez5EtdzZanzRNdO1PVDZeK+EOd
 xazhK3sty/ZoAdJxhqjkvaQVGralim3UjCvyqXp8B/7xrDFhJ3WWI17bzR3KNeO5k7ro
 wl1z2mP53bRhTy2fX/SJL4DMCXQeqGsXs7PoudPH9+B2TEvEGqtG3KJjsdBces4ytFpj
 2ewtzKU18YCyMevbmbp7qiYL2XSupnuF4vPXYe1GcCP0VdBVdjfkb8F1ObnXjD7Lsu9D
 OwphoT5Ihe7DHcKYphcMJurYHXM9Tbo89lJj6RU9nSypS3d6SH7lZivPoOwIMSTGugsK
 yI7g==
X-Gm-Message-State: APjAAAWm1zrF2F/WCnbQsXjE/ZppEzs480iRBVz27PD3dQgcDtQ9er9W
 OzSt0CkSCU+gXfSmm5Lg0RvNlVFr
X-Google-Smtp-Source: APXvYqxvupdxnBcXiNHvz+qHKhvOrfjuYI8RyPpp/o5mqgE5hVkIVlg+gLKSU3vxpYHILt3kcqcmqw==
X-Received: by 2002:a17:902:9a8d:: with SMTP id
 w13mr21888788plp.157.1566876648807; 
 Mon, 26 Aug 2019 20:30:48 -0700 (PDT)
Received: from bobo.local0.net (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id x24sm11383984pgl.84.2019.08.26.20.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 20:30:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc/64s: remove support for kernel-mode syscalls
Date: Tue, 27 Aug 2019 13:30:08 +1000
Message-Id: <20190827033010.28090-4-npiggin@gmail.com>
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

