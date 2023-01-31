Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C6568332A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 17:59:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5rqm5hl1z3f6w
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 03:59:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hzFFyjis;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hzFFyjis;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5rlr2Rd6z3bW2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 03:55:52 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id e6so7474716plg.12
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 08:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HRo1V2plvCyYSyGsHCxdqPdu7maA25oJkY4seRjlcA=;
        b=hzFFyjisgqBOQ/m0vnvdOKGgnl/9zN/XN6XKahFzPV5fT/m5XmWbuON4N8bHfLBTDF
         doYRSIEgYAVj/kQLae8XGVQecPwjgutTd+ywhs27WQuc1PpqX5PS9Aa2vJlfzCtOFAtP
         6D/1Z/jiLD965P52vRYzcEIgopI9tI+CCTEIHdxdl3TJaK5IxVHvgH0zApApqX77+Bhi
         7cYbkaYnYIwUOb6TExoMB8WkQEbJ/+pFdxmSCNboWNMHYpuzIgTr7HK8jHZosVEthsLx
         Tue7dsbUuWvvh4eucVLizxD7qiT5PpdCBbM7vICco8OCu6tHCuD0drc8xJDY3fK7vgwV
         a6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/HRo1V2plvCyYSyGsHCxdqPdu7maA25oJkY4seRjlcA=;
        b=BqqbA+UBjSLcK3aknd36sk0r3+jgiJEo9X6EunGdvj0lJLhonkExHr1ExjYtEOJ2H6
         BJBarNu23rPveZxfyUDJJsXtHKYq+dT8E4j/kIL9lmtrnDwv4dVdJ8mOJQB2Lk/67Ymx
         ypYg8cFngAetNAq3XlNJnGP74+UYL3UzBq8Sgiswi9YaEOThOVLPPFFEPaRI52c1KF9O
         PPfihTtFMLDtKWosKg25RZ6GooMbPDjojW2sVIj/FUDpmt20bJLPlGNqLx731/tmiH9h
         FhKc1fgeF6wAJxeqUka5Cdk5W/9vBwQQFQRBEHLIEtAzqoV3Xi+RXnawrc6QJpM+lYGL
         EAGg==
X-Gm-Message-State: AO0yUKUaaJe8ct+Q9iSlyJp+Q9+zWCCcaQrbEphcrAb3A4CmM13aYh+/
	zV64BEFP59IKBVVdRHzOljpHmagNWy8=
X-Google-Smtp-Source: AK7set+T9CAHv0mmhZ66XfXEv+w1gaBEQSg181U4C7SIcvKpHpDfS/42Bb7V3OSV3brNAtH5+jh+GA==
X-Received: by 2002:a17:90a:19c2:b0:22c:7603:3793 with SMTP id 2-20020a17090a19c200b0022c76033793mr12083105pjj.20.1675184149897;
        Tue, 31 Jan 2023 08:55:49 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([203.194.37.234])
        by smtp.gmail.com with ESMTPSA id bk7-20020a17090b080700b00223f495dc28sm9029371pjb.14.2023.01.31.08.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 08:55:49 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/8] powerpc: use switch frame for ret_from_kernel_thread parameters
Date: Wed,  1 Feb 2023 02:55:29 +1000
Message-Id: <20230131165534.601490-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230131165534.601490-1-npiggin@gmail.com>
References: <20230131165534.601490-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kernel thread path in copy_thread creates a user interrupt frame on
stack and stores the function and arg parameters there, and
ret_from_kernel_thread loads them. This is a slightly confusing way to
overload that frame. Non-volatile registers are loaded from the switch
frame, so the parameters can be stored there.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_32.S     | 1 -
 arch/powerpc/kernel/interrupt_64.S | 1 -
 arch/powerpc/kernel/process.c      | 9 +++++++++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 755408c63be8..c3fdb3081d3d 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -188,7 +188,6 @@ ret_from_fork:
 
 	.globl	ret_from_kernel_thread
 ret_from_kernel_thread:
-	REST_NVGPRS(r1)
 	bl	schedule_tail
 	mtctr	r14
 	mr	r3,r15
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index fccc34489add..d60e7e7564df 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -741,7 +741,6 @@ _GLOBAL(ret_from_fork)
 
 _GLOBAL(ret_from_kernel_thread)
 	bl	schedule_tail
-	REST_NVGPRS(r1)
 	mtctr	r14
 	mr	r3,r15
 #ifdef CONFIG_PPC64_ELF_ABI_V2
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index dc66ca668b44..6cea224b7e60 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1812,6 +1812,15 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	((unsigned long *)sp)[0] = sp + STACK_SWITCH_FRAME_SIZE;
 	kregs = (struct pt_regs *)(sp + STACK_SWITCH_FRAME_REGS);
 	kregs->nip = ppc_function_entry(f);
+	if (unlikely(args->fn)) {
+		/*
+		 * Put kthread create details in non-volatile GPRs in the
+		 * switch frame so they are loaded by _switch before it
+		 * returns to ret_from_kernel_thread.
+		 */
+		kregs->gpr[14] = ppc_function_entry((void *)args->fn);
+		kregs->gpr[15] = (unsigned long)args->fn_arg;
+	}
 	p->thread.ksp = sp;
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
-- 
2.37.2

