Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 622D61B1BD3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 04:25:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495nVK54dYzDqWg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 12:25:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P8sxwNlg; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495nQ34GmSzDqw6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 12:22:01 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id x15so1646381pfa.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 19:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E30M5zWoFma0ezCK7U8Emj3OqNU3XhmBCW8YFU1eHY0=;
 b=P8sxwNlgRFvBqC5DwU8jyfM3ro60kjTc+1qYb0lpztFU5hO+yPCxnh+Ru0/NX33IgZ
 eG7fmTZIRi7dlA16flNca+F4YtDj7femCYMZE19KgusIGmakWWXr/OaEWHSgVp1Nmuds
 3Si/OaednlbK6G5NUCdlKJGWpBpmlTWRB1s8GQ2NQxgqLWE9FGeKDVjSZrOzTi066pZX
 6nZhxLeUUgasKdwXFwjsOjbw0ZmgRqf7qc9zXpvP+Y0TQZeAOFEFtbNZbKSiE4A/j9KF
 hOdVoIFHvEMRlgPg31P0AkUiqqHF/u5MWFgTLDjqaUDd/1XftT3hN2HMe+FMNwqfUUm1
 pw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E30M5zWoFma0ezCK7U8Emj3OqNU3XhmBCW8YFU1eHY0=;
 b=tAmE/ZIdu3y53/qEOzxTr9iZJHNCN60+Qg0dpUA+XUFunMBhgh8E3rLzVcHYHlkmEB
 sSYRzo8brX2fNgx64cxje3mF/8A1yAJ4h/hVMS/0KhfpSBMIJ1VRxARuz6zFvSNxbLcy
 aGJ5TxMkmwg3jUmmAvwJgjBlb0kOix8plXsv+4hYhV9mEgNnmegwJl8b0szKdb9QflgX
 rzeraq3SaeqONXDkpbXF3PbNfmI5QI1ReEG5s3SQGVc8u1/EZVgM0rZz+nt1eELHf2Q3
 ARMBvwsTmRDDQrbO1W38lk4SiGzvYR9skyconwo3t9m7oYPkukyQ1pGr+Xd5kYg9iBN4
 PeSA==
X-Gm-Message-State: AGi0PuYjNnP5x9CPep7qkxYszqXAN0GK6HODLtZbD7XRjkSR9HhCGujD
 Ge0hdUUo7nP35oyS2x3QT9+7zTdV
X-Google-Smtp-Source: APiQypKmve7b6f5wbRgxVWV9ac7czmg3MJ5Ct75bQwVw0NPfUifW6ls6A0uFzKTxO9an22qLcNsTnQ==
X-Received: by 2002:a65:6250:: with SMTP id q16mr20081736pgv.9.1587435719478; 
 Mon, 20 Apr 2020 19:21:59 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.170])
 by smtp.gmail.com with ESMTPSA id w3sm829397pfn.115.2020.04.20.19.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 19:21:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] powerpc/64s: Always has full regs,
 so remove remnant checks
Date: Tue, 21 Apr 2020 12:19:52 +1000
Message-Id: <20200421021955.772023-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200421021955.772023-1-npiggin@gmail.com>
References: <20200421021955.772023-1-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h | 23 ++++++++++++++++-------
 arch/powerpc/kernel/process.c     |  2 +-
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index e0195e6b892b..89f31d5a8062 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -179,6 +179,20 @@ extern int ptrace_put_reg(struct task_struct *task, int regno,
 
 #define current_pt_regs() \
 	((struct pt_regs *)((unsigned long)task_stack_page(current) + THREAD_SIZE) - 1)
+
+#ifdef __powerpc64__
+#ifdef CONFIG_PPC_BOOK3S
+#define TRAP(regs)		((regs)->trap)
+#define FULL_REGS(regs)		true
+#define SET_FULL_REGS(regs)	do { } while (0)
+#else
+#define TRAP(regs)		((regs)->trap & ~0x1)
+#define FULL_REGS(regs)		(((regs)->trap & 1) == 0)
+#define SET_FULL_REGS(regs)	((regs)->trap |= 1)
+#endif
+#define CHECK_FULL_REGS(regs)	BUG_ON(!FULL_REGS(regs))
+#define NV_REG_POISON		0xdeadbeefdeadbeefUL
+#else
 /*
  * We use the least-significant bit of the trap field to indicate
  * whether we have saved the full set of registers, or only a
@@ -186,17 +200,12 @@ extern int ptrace_put_reg(struct task_struct *task, int regno,
  * On 4xx we use the next bit to indicate whether the exception
  * is a critical exception (1 means it is).
  */
+#define TRAP(regs)		((regs)->trap & ~0xF)
 #define FULL_REGS(regs)		(((regs)->trap & 1) == 0)
-#ifndef __powerpc64__
+#define SET_FULL_REGS(regs)	((regs)->trap |= 1)
 #define IS_CRITICAL_EXC(regs)	(((regs)->trap & 2) != 0)
 #define IS_MCHECK_EXC(regs)	(((regs)->trap & 4) != 0)
 #define IS_DEBUG_EXC(regs)	(((regs)->trap & 8) != 0)
-#endif /* ! __powerpc64__ */
-#define TRAP(regs)		((regs)->trap & ~0xF)
-#ifdef __powerpc64__
-#define NV_REG_POISON		0xdeadbeefdeadbeefUL
-#define CHECK_FULL_REGS(regs)	BUG_ON(regs->trap & 1)
-#else
 #define NV_REG_POISON		0xdeadbeef
 #define CHECK_FULL_REGS(regs)						      \
 do {									      \
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 9c21288f8645..6599a3099d10 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1740,7 +1740,7 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 	 * FULL_REGS(regs) return true.  This is necessary to allow
 	 * ptrace to examine the thread immediately after exec.
 	 */
-	regs->trap &= ~1UL;
+	SET_FULL_REGS(regs);
 
 #ifdef CONFIG_PPC32
 	regs->mq = 0;
-- 
2.23.0

