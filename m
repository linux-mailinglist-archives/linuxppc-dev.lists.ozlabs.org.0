Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A356C8E2F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 13:32:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkJNv4NhZz3fBH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 23:31:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LX/J/7Aj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LX/J/7Aj;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkJKw1RlQz3cdr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 23:29:24 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id kq3so4151121plb.13
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 05:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679747361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXo1dPspstfP5ZAYPyDqZZjqWAGBLPym1egNZgkn+94=;
        b=LX/J/7AjMtiLNMUdcrQulKCFA0WpOrvc6U8UOvIvGGY2qPdvutB3TxebIUKmO3kB11
         mtBgYOzALS6wi9UvJEwHk/CiCAsiTpyExTYvEF13PwZXipBWLO+0M4iawzj4shvT4Mb6
         icEt+HeWLa415KPquSFl84cHxCoZa2Cv20/w2I9i8B/GZwOtDQBFIg2OayFOPuWbtQLP
         CNcC5TbFG4lo7a6CVtHodkSH3iG2RynSPVl5ZsUDQ+e4kN0BJk2zEfdYDMuCPYf53Hfu
         1sL6X5JydLwOCTFO6GLs5gqtnW7zbQSnNdzGcaL7TZaezfNqw1KxWLZDzzoDZFTZKBJs
         y6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679747361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXo1dPspstfP5ZAYPyDqZZjqWAGBLPym1egNZgkn+94=;
        b=sovahZ98yuGRPKUYX/8shymaGY5P1kXKqBvErvIq8ufpK+0BtmijYztJCoK8lQN1zf
         /77axwEjIbJr8v0uWVh4ePeZaSqm8JV4ReP6XUx0zgXEik3pQ6bQ4FFezIg9JUobFrCv
         5++Fr2MH9gNQtVa7ed+EKLR9xVu/2vo/tOnghyCig3Koy1HcmhPsEqzKqTUTSdpyRcZ2
         95xdAOa2tct9Xs8GuCBXNPPlPCAn5V9BrNJTbjQwg3OMJdC/e5JYHidy9TOVLliaiMzt
         UEp3g3DS0ZPLI46Vbcv8bIgk2c2F0UYavEydJDoY4C8JJ03HrBoaje7R4bCK/wyaHO3W
         ZcEg==
X-Gm-Message-State: AAQBX9csghOm6kpk79cuFGZHMK9jLrGSBxrU8a3QVoNuKzPcmkADCQ8A
	jIIPAentFpdvGhz2mfpAAUUnnH7DM9A=
X-Google-Smtp-Source: AKy350bgeBBMZNchXvd12aFlBMYENTdDDpUU/8pVeLY2jDVMzph4MUedPwA3+MKfZ6dJATyniDG81Q==
X-Received: by 2002:a17:90b:2241:b0:23d:3698:8ed3 with SMTP id hk1-20020a17090b224100b0023d36988ed3mr6335774pjb.22.1679747361234;
        Sat, 25 Mar 2023 05:29:21 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.191])
        by smtp.gmail.com with ESMTPSA id a13-20020a63d20d000000b0050376cedb3asm14923643pgg.24.2023.03.25.05.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 05:29:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/8] powerpc: copy_thread make ret_from_fork register setup consistent
Date: Sat, 25 Mar 2023 22:28:58 +1000
Message-Id: <20230325122904.2375060-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230325122904.2375060-1-npiggin@gmail.com>
References: <20230325122904.2375060-1-npiggin@gmail.com>
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

The ret_from_fork code for 64e and 32-bit set r3 for
syscall_exit_prepare the same way that 64s does, so there should
be no need to special-case them in copy_thread.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_32.S | 2 +-
 arch/powerpc/kernel/process.c  | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 5604c9a1ac22..755408c63be8 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -183,7 +183,7 @@ syscall_exit_finish:
 ret_from_fork:
 	REST_NVGPRS(r1)
 	bl	schedule_tail
-	li	r3,0
+	li	r3,0	/* fork() return value */
 	b	ret_from_syscall
 
 	.globl	ret_from_kernel_thread
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 9b4431651ed5..46e2c3f3a2e9 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1784,9 +1784,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 			childregs->gpr[1] = usp;
 		((unsigned long *)sp)[0] = childregs->gpr[1];
 		p->thread.regs = childregs;
-		/* 64s sets this in ret_from_fork */
-		if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64))
-			childregs->gpr[3] = 0;  /* Result from fork() */
 		if (clone_flags & CLONE_SETTLS) {
 			if (!is_32bit_task())
 				childregs->gpr[13] = tls;
-- 
2.37.2

