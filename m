Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D15413F38
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 04:03:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDhRC6nbDz3c4Y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 12:03:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TwQEHw4x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TwQEHw4x; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDhQT6XnRz2ywp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 12:02:57 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id 145so1295054pfz.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 19:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GlrEJeMX9qGzoBiGCEoIw2bXQuBsE9/YqXXUmediCxI=;
 b=TwQEHw4xdUHM/Jefi7WZXBXM2wl4Ftkmpee64uD7Cu4Db1Bjyp3D88u+EPFmoz91NR
 kG+TZpwD9neNrht3wkn4UJ/CqtKmeKP7GrW8FlTCmM006yUrNXnMU5Y3x3hL8i0AaTV/
 Pg+NyhTOV8ZyPTXH1+cKKf1AQRBmtOD65ovl9z9WmdlW6jLtUKX33O4vMX8DUViwGXWj
 4MqadbjCAVaORdw+MqL/gDwPxukP4AZuDvQtXPhle2B4fuJm8PApgEvHKDymWDQBJZyt
 IMGmYMY3PiThoShnYD16/hQe1Ch3jbLhzAOEs7cxV4qExrIF5jslKk7ZXkpUn4MIPnVM
 cOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GlrEJeMX9qGzoBiGCEoIw2bXQuBsE9/YqXXUmediCxI=;
 b=vLy+uDVqCZfHiwRmNLm3n2qlNDSOI08l/unGAq/reg0JpBaq0M0bIOLjRW16b1yXMj
 AikWRxOObYTD7oP755nctiwmFh/MZdMRQtWMUzR8ZnOD3WanKCowu19QcfOkwXItUH/I
 TKMrEsswf/SFJKSSgmtFpA4NgYM9ol+TS3MKXynXvEvMLHJg5R21sTV8RakL2FAphIsS
 H3SKSUaADRsj+OUh2BtssN07nyZAc6Yo1SzSHJtKU/fH0CyP2nBY1SPo6UkMEWfybsuT
 R34cMWQNCeOmjKJnRXz6A2ZpyPWzFnmLVjxMdXGWHZrDdHJZRuXqxYOmWi1YX6UE/qQU
 pg/Q==
X-Gm-Message-State: AOAM531dp1KSAzgdlhsTXY8xUcIhr8MnST8EVvOL6leSxuIJCbiDevKf
 xO3P0DReo0/Ko7iLLW+dvRz6vKVSSfTb6g==
X-Google-Smtp-Source: ABdhPJxd7yc0n2gKdGhcYeiYSHoHmZ5ICRsvyGjkcWkbBWmbVlOFkr67vTrhNLEx4z/GOGTyITBsnQ==
X-Received: by 2002:a63:d80c:: with SMTP id b12mr30775749pgh.331.1632276175205; 
 Tue, 21 Sep 2021 19:02:55 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id d19sm371125pfn.102.2021.09.21.19.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 19:02:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1] powerpc/64s: Fix unrecoverable MCE crash
Date: Wed, 22 Sep 2021 12:02:47 +1000
Message-Id: <20210922020247.209409-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The machine check handler is not considered NMI on 64s. The early
handler is the true NMI handler, and then it schedules the
machine_check_exception handler to run when interrupts are enabled.

This works fine except the case of an unrecoverable MCE, where the true
NMI is taken when MSR[RI] is clear, it can not recover to schedule the
next handler, so it calls machine_check_exception directly so something
might be done about it.

Calling an async handler from NMI context can result in irq state and
other things getting corrupted. This can also trigger the BUG at
arch/powerpc/include/asm/interrupt.h:168.

Fix this by just making the 64s machine_check_exception handler an NMI
like it is on other subarchs.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h |  4 ----
 arch/powerpc/kernel/traps.c          | 23 +++++++----------------
 2 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 6b800d3e2681..b32ed910a8cf 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -524,11 +524,7 @@ static __always_inline long ____##func(struct pt_regs *regs)
 /* Interrupt handlers */
 /* kernel/traps.c */
 DECLARE_INTERRUPT_HANDLER_NMI(system_reset_exception);
-#ifdef CONFIG_PPC_BOOK3S_64
-DECLARE_INTERRUPT_HANDLER_ASYNC(machine_check_exception);
-#else
 DECLARE_INTERRUPT_HANDLER_NMI(machine_check_exception);
-#endif
 DECLARE_INTERRUPT_HANDLER(SMIException);
 DECLARE_INTERRUPT_HANDLER(handle_hmi_exception);
 DECLARE_INTERRUPT_HANDLER(unknown_exception);
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index aac8c0412ff9..b21450c655d2 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -790,24 +790,19 @@ void die_mce(const char *str, struct pt_regs *regs, long err)
 	 * do_exit() checks for in_interrupt() and panics in that case, so
 	 * exit the irq/nmi before calling die.
 	 */
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
-		irq_exit();
-	else
-		nmi_exit();
+	nmi_exit();
 	die(str, regs, err);
 }
 
 /*
- * BOOK3S_64 does not call this handler as a non-maskable interrupt
- * (it uses its own early real-mode handler to handle the MCE proper
- * and then raises irq_work to call this handler when interrupts are
- * enabled).
+ * BOOK3S_64 does not call this handler as a non-maskable interrupt (it uses
+ * its own early real-mode handler to handle the MCE proper and then raises
+ * irq_work to call this handler when interrupts are enabled), except in the
+ * case of unrecoverable_mce. If unrecoverable_mce was a separate NMI handler,
+ * then this could be ASYNC on 64s. However it should all work okay as an NMI
+ * handler (and it is NMI on other platforms) so just make it an NMI.
  */
-#ifdef CONFIG_PPC_BOOK3S_64
-DEFINE_INTERRUPT_HANDLER_ASYNC(machine_check_exception)
-#else
 DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
-#endif
 {
 	int recover = 0;
 
@@ -842,11 +837,7 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
 	if (regs_is_unrecoverable(regs))
 		die_mce("Unrecoverable Machine check", regs, SIGBUS);
 
-#ifdef CONFIG_PPC_BOOK3S_64
-	return;
-#else
 	return 0;
-#endif
 }
 
 DEFINE_INTERRUPT_HANDLER(SMIException) /* async? */
-- 
2.23.0

