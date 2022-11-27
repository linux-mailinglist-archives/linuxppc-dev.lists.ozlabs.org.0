Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B4F639AC0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 14:01:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKpdW6lzyz3fHb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 00:01:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qc8vjABQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qc8vjABQ;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKpNV67lbz3f34
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:50:18 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id f3so7650248pgc.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 04:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfwtSudMtiVdToka3aI+qBrrQ0xZIUpeRExRUBMt9RA=;
        b=qc8vjABQZnHF191D36UPdLE0Obxl4UGIKl4BoKazalIZCdM76Bn8fBUE4hLZXCT1sa
         PcLwXworXxIzMkGD4Mi0wIpWKY+ei/ORpWq1Aliv9Y9AA/cIgtHeqSNTBuh3MzMS7JBB
         zuE3lH3Jpo3nAWou6vMimWQvuxSw6xrHz67KnzexU02/uCO6dGrvv8LE0b9MwwgFbJO4
         EABDIIiMsT2kSgTeYxxLiKhJzlBxKHRfZMitrwrwS8XGITJQfmnf6gr9PlIqPM69Jowc
         GsxXtSmWIHQLY0NuLFDiDwwY/vxjrgJOvT3elsKPBSDPxIpplta1h2m6uCPa7dKVzNDw
         XR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfwtSudMtiVdToka3aI+qBrrQ0xZIUpeRExRUBMt9RA=;
        b=02/W2FwDOunahjhKbK3em9A+iWDc5jY4/dYMP+ym9wTPReWA6IqUrdCj5o5gu41mH2
         cAzWJkPclmOFoC3cMTnwWRA4zxFSWsrmzx5Ibdh7I9XYG+OqVL0Drl6+L56KLzi1pN5s
         K7c3XqDWngGbfdtI5gLC1idWqT4kmPkMAxPU+zarsZo/csi6VyO3xXoD9cu+sCvbRzX1
         gnnSGrohMujTaXZv5zCvlu14GnHLf9NG+facnt5ZkNGY4QKafW3wCig42BB/fSgOdLGE
         BH6bkX93w0Mze6BcNTvsm1iUnmfEq45SUH5OtBr181ujoANXRXfc2J8KTYT3gXxZTYr1
         liDw==
X-Gm-Message-State: ANoB5pnc4NFZvs4pfTBU4AieHZWpV7KJp/fpzVFw6LZWd25dVrYYzLX0
	tyhN8h9hgFN0f8plLHOB8r7Yy6e0RlTGUg==
X-Google-Smtp-Source: AA0mqf5/+6We2z/7hTBZ4F2MyGZ4Vr+1vJh2FQeNuwdkXQzOriwRCG495m88dmT3OFlEp9FRhkCq7A==
X-Received: by 2002:a05:6a00:2183:b0:574:2104:5657 with SMTP id h3-20020a056a00218300b0057421045657mr25006092pfi.58.1669553418051;
        Sun, 27 Nov 2022 04:50:18 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id q13-20020a63e20d000000b00473c36ea150sm5102287pgh.92.2022.11.27.04.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:50:17 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 12/17] powerpc: copy_thread fill in interrupt frame marker and back chain
Date: Sun, 27 Nov 2022 22:49:37 +1000
Message-Id: <20221127124942.1665522-13-npiggin@gmail.com>
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

Backtraces will not recognise the fork system call interrupt without
the regs marker. And regular interrupt entry from userspace creates
the back chain to the user stack, so do this for the initial fork
frame too, to be consistent.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/process.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index a097879b0474..27956831fa5d 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1728,12 +1728,13 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 	/* Create initial stack frame. */
 	sp -= STACK_USER_INT_FRAME_SIZE;
-	((unsigned long *)sp)[0] = 0;
+	*(unsigned long *)(sp + STACK_INT_FRAME_MARKER) = STACK_FRAME_REGS_MARKER;
 
 	/* Copy registers */
 	childregs = (struct pt_regs *)(sp + STACK_INT_FRAME_REGS);
 	if (unlikely(args->fn)) {
 		/* kernel thread */
+		((unsigned long *)sp)[0] = 0;
 		memset(childregs, 0, sizeof(struct pt_regs));
 		childregs->gpr[1] = sp + STACK_USER_INT_FRAME_SIZE;
 		/* function */
@@ -1753,6 +1754,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		*childregs = *regs;
 		if (usp)
 			childregs->gpr[1] = usp;
+		((unsigned long *)sp)[0] = childregs->gpr[1];
 		p->thread.regs = childregs;
 		/* 64s sets this in ret_from_fork */
 		if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
-- 
2.37.2

