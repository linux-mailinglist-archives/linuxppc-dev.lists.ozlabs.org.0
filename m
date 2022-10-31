Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D437613007
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 06:57:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12Vc724Dz3dtv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 16:57:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JRq6GaG1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JRq6GaG1;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12Rg3Hptz2ygC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:54:55 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id h193so1135444pgc.10
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRuFoJst6qFyhTCk1lHltjd/22AEakekbUAT3ErVngw=;
        b=JRq6GaG12wdldEEV7GkB+NQJyJwi1p/T+SWRDl61RnHXkMcTTdoykULTtJeBIKQL+7
         FQNmhMOGuP6GRSs/Ih7Jv73uiBGU7SOwgqp0GhCYaAaqQXg8dm3dH2gzo9bSw+uNqdsN
         nVZHSL7DrbinCSFIWNsUial0iRosR/PDyXeSogIQ8AZFYrAF9UX1d4Y5tRmxdhCJZ3Fk
         BCN5LxY4JYHfWWukWUuD9MZ6WkDj3ytu8KbAkRZdC6Vs5Go0fiiEYKTTYEsfa99mHs67
         99CYKc3aG9Gz0MyUEM+zn/K4Wq7VKMqXg+EaoVBPa6xD5TIDnHvXRzoC+Qs4Vkrztcyk
         vyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRuFoJst6qFyhTCk1lHltjd/22AEakekbUAT3ErVngw=;
        b=WlDWWKCVJsEmixXBZBcxn70hp/nGpIpTRCt622tNrx0hR+QT2KFSAl/n/npT9EYkFl
         yQiTLcRhs1HNfDzAt7p/OHxROr0JDkbgCY/T5zHI9OK/z9DoL1+xRMbGXlug//hIwQle
         NLPlRHhFcDirE2yZ8qT1pqW8vwSuDizHSrsYX3j6iN21vD7pc/fwDNOOHEoSE4AErVZk
         pTM3uoTe+0vWQJnLFrfyYyKPMUle8rQsC5Z0mafIEqyjm/xusrX5Bucc8jU4CW2yFe9r
         AAEnUpBgd2dND00UA1LkS6y18xdlaNLeXOKsDzvJhGIey8DhbqfxlHdBzVqQbUcPUj9V
         mqvA==
X-Gm-Message-State: ACrzQf2UU6CvAArD+ZzqMgAoAIGIirdEocLU1RAO/4Hxd6DXQrOmaAyd
	bMUDb9X1yc9oEkFeOZbZfmzv4rQMsSU=
X-Google-Smtp-Source: AMsMyM4IYPKlsFqHRPgjK3dxSJbfNFYWGwm4SN35O5EqCvFnohmfJ1kr5s22gxlZgh9RCMURR11N+g==
X-Received: by 2002:a63:450c:0:b0:443:94a1:3703 with SMTP id s12-20020a63450c000000b0044394a13703mr10849801pga.565.1667195692763;
        Sun, 30 Oct 2022 22:54:52 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:54:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 02/19] powerpc: Rearrange copy_thread child stack creation
Date: Mon, 31 Oct 2022 15:54:23 +1000
Message-Id: <20221031055440.3594315-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221031055440.3594315-1-npiggin@gmail.com>
References: <20221031055440.3594315-1-npiggin@gmail.com>
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

