Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DC8639AA6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 13:54:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKpT72F0bz3f4H
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 23:54:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FgVEsUwj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FgVEsUwj;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKpN94rk4z3cJM
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:50:01 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so602671pje.5
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRuFoJst6qFyhTCk1lHltjd/22AEakekbUAT3ErVngw=;
        b=FgVEsUwjeaZp1Hh8Bdcytqy8C3hANEzdOKzAnjBLCBnxGP6D67aG1Lwplu9CmrScYt
         mNCYxE3+u/6efo4MFXVPTsHA3asupn9S0ro41II5gyNnhJ5ruLf1OKc1jXJKpv12s2l3
         4UfzHMZ1jv2E7W+HakJ7lpF9b1j8bK0NvgJSRZvsz6+IFjliRz6GYmXu2YYksNejP1PQ
         Gh/RZ3x3kYfzNuDaYWrIb9jYqO52t2bC7nlUzGyl5CJB+M6QyxkM0KxSd0M/GnucekYF
         DWZ+qbrCw2JjUPN9D6E0aLfA+rRJK2sFqEH0Dg+jNnpI2nGiLv24qQ+BPvloSYxXZFsO
         Qffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRuFoJst6qFyhTCk1lHltjd/22AEakekbUAT3ErVngw=;
        b=UJNLV+ikaTzGbM6OciFoBl7d5kZngXkPTX0hmXQiguGMH/zb0n9Ko5IMXZX6QIwne/
         fNvEYEV/G3v9GhkmkywRLYUIZdONodiDO2ckF5JXcqJWT8gEdmbOk9z9UtKYylDMKrgy
         Zmt50GenoosqZASkvGShS1NYKo13N144n1xVUv2bfl5t1mRSTVM+cDrE5YVUKs/pM9Hn
         uNwvWvXrj2Y+KnSEL9xWHF2gjR87z7e3Pwyy+g2e+wac13h4RX+zOxLL+CnFWiojbZBN
         c/jZTldTWY4f6dsoRFthnkmNicNOMOKZzV4d7+ScyLOO97WDjzdqpq7jbpsQ5+7H1fEb
         cMcg==
X-Gm-Message-State: ANoB5pkWleXtsb4M+Efk+jg8wpcXBLrBSrQUfzpPEcMoi6cxaziknY0h
	2nenQ62vWaMzw2FU7KSlhKAJi0wpoTrRww==
X-Google-Smtp-Source: AA0mqf4W2dWebeWcmu+jb4SDKL0XED45ljxgllkj+JQrIaxWoN3z8wytJLIrNC5OLjlWzNddEpzcvw==
X-Received: by 2002:a17:903:41c8:b0:17d:b9c:cd64 with SMTP id u8-20020a17090341c800b0017d0b9ccd64mr29242906ple.40.1669553398888;
        Sun, 27 Nov 2022 04:49:58 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q13-20020a63e20d000000b00473c36ea150sm5102287pgh.92.2022.11.27.04.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:49:58 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/17] powerpc: Rearrange copy_thread child stack creation
Date: Sun, 27 Nov 2022 22:49:29 +1000
Message-Id: <20221127124942.1665522-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221127124942.1665522-1-npiggin@gmail.com>
References: <20221127124942.1665522-1-npiggin@gmail.com>
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

This makes it a bit clearer where the stack frame is created, and will
allow easier use of some of the stack offset constants in a later
change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/process.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 67da147fe34d..acfa197fb2df 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1726,13 +1726,16 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 	klp_init_thread_info(p);
 
+	/* Create initial stack frame. */
+	sp -= (sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD);
+	((unsigned long *)sp)[0] = 0;
+
 	/* Copy registers */
-	sp -= sizeof(struct pt_regs);
-	childregs = (struct pt_regs *) sp;
+	childregs = (struct pt_regs *)(sp + STACK_FRAME_OVERHEAD);
 	if (unlikely(args->fn)) {
 		/* kernel thread */
 		memset(childregs, 0, sizeof(struct pt_regs));
-		childregs->gpr[1] = sp + sizeof(struct pt_regs);
+		childregs->gpr[1] = sp + (sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD);
 		/* function */
 		if (args->fn)
 			childregs->gpr[14] = ppc_function_entry((void *)args->fn);
@@ -1767,7 +1770,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 			f = ret_from_fork;
 	}
 	childregs->msr &= ~(MSR_FP|MSR_VEC|MSR_VSX);
-	sp -= STACK_FRAME_OVERHEAD;
 
 	/*
 	 * The way this works is that at some point in the future
@@ -1777,7 +1779,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	 * do some house keeping and then return from the fork or clone
 	 * system call, using the stack frame created above.
 	 */
-	((unsigned long *)sp)[0] = 0;
 	sp -= sizeof(struct pt_regs);
 	kregs = (struct pt_regs *) sp;
 	sp -= STACK_FRAME_OVERHEAD;
-- 
2.37.2

