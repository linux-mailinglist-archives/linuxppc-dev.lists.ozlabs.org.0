Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFD0613023
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 07:06:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N12jD1fWdz3fDy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 17:06:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fLMCKT4n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fLMCKT4n;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N12S804hHz3cFV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 16:55:19 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id 3-20020a17090a0f8300b00212d5cd4e5eso14954832pjz.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Oct 2022 22:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xb0589NO9SSOy5QD8mIn1LRboHiZdaG9ATaW/8B+0so=;
        b=fLMCKT4nS5vy4EQO3tGGVq9cFVgJzv/4PdWG5XTkzT0qyCucNhJmox3/VqxjLxQwzU
         hTK1nR65G/cTG9dVQ/TXZjfJanwJqYTe825Zo3dm47TkGodEDRv2ehk/ZdC5Xg6qD9JZ
         gojPc9r+eGb87e5kpVnQV2ANoq7/lhqgPUur4Cg/a1Ey2jO5stuYPBFLtJmAWuX0WD0A
         29qzBkvUC/OGpl4WuIZtZTXOIOfjqroY/jZQaEetliIJsDEiLgXDMNi8/zyDuuqM1EYu
         hDj1qs1iOVnfJgzYOBdtRaTymPhhzua9OhhSLSGNuQpSTO82UpFiUw/ufjMezF/6fK8M
         ZW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xb0589NO9SSOy5QD8mIn1LRboHiZdaG9ATaW/8B+0so=;
        b=KUBHE6Jk1feChU/aMU9W+4+po/Pti06V3+7826xhvPpsmmRdbkWZsuG1bgr/zAm6wj
         MZiMB9nMt3uFl2413VGgHy7y4xQr2cpgZzN8H2WyNVqGJuXZWwtKMDQSpXGXqrQpukNC
         lsVLFoVzERXSpL+aHcfc4keYhHrx+bXHFw76mTY69xNZDslLGzMVdIgj0nbU3Swwohdv
         JFZTOBl5g4zRXDxafqK2SMpeo6E9U5P5jPS/5z1GR//wigEQ3iJZHuzimMJgwEhuDX6N
         GXI9Ou9wpOPygDxYeprWgKRwf9q8MdqLKsod7MzlLt9prHj4JluPNgsC8315mMGDEV8i
         y1Xw==
X-Gm-Message-State: ACrzQf1yjdIbUoF/dLZ+ehnbjT9UugswDpyC+5/oPDLBN9zhbzuGZ3BU
	p/EyCcB/V0Ww4zeVEahZypfXdP/mGDQ=
X-Google-Smtp-Source: AMsMyM5LTqtsc9gjKhDxyNEm4cc55H2ewdFL1tDF/OTg4QrWEmaIKmNWa3uz/gEOuTq0Du45ZpwSmQ==
X-Received: by 2002:a17:902:ce8a:b0:186:9d96:b93c with SMTP id f10-20020a170902ce8a00b001869d96b93cmr13011369plg.123.1667195717241;
        Sun, 30 Oct 2022 22:55:17 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id d62-20020a623641000000b005627ddbc7a4sm3599599pfa.191.2022.10.30.22.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 22:55:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 12/19] powerpc: copy_thread fill in interrupt frame marker and back chain
Date: Mon, 31 Oct 2022 15:54:33 +1000
Message-Id: <20221031055440.3594315-13-npiggin@gmail.com>
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

Backtraces will not recognise the fork system call interrupt without
the regs marker. And at least perf starts unwinding the user stack
from gpr[1] directly, but regular interrupt entry from userspace creates
the back chain to the user stack, so do this too, to be consistent.

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

