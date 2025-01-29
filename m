Return-Path: <linuxppc-dev+bounces-5682-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 083ADA21DCD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 14:22:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjjVk3fsMz30TG;
	Thu, 30 Jan 2025 00:22:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738156926;
	cv=none; b=GF4GNPxdFvMGcmYw0ipW4ufjB8TAeDsUiM2gkR8FOvFoK4Mips3ppQaaVJNYvdODqVhF3uEIs0/AVDdog0R7m7ltKm4P1fBHnoCwGBWxALuOCqaolZxjBRFLrynFJBfLXwsH/IicWnxhxaxX8PihEjyb3PLCKjWQW7S/H3zt1ulpVErBE7I48iyZ11VyBjs2iOHJeJDpuxs/kwKvIEshRb8X6mtBG3S5hfz1Yb/5MSkovH/URjNQHnLd8OL/cweOJ5xNrSujShDt0UKYHFwJLVRUydv4vpbTRbluOWMu1s61tK6EjorMt13PrIi2GUaB8xYf/Y9qRqyD7N+tJTZfmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738156926; c=relaxed/relaxed;
	bh=9kq5jxbhmUEoZM+kdlwoh7uFTPoMD9RcTIy1F/a5B80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X48fUN/nyhiGLZZICfhTyYqcmLk/jirFlJutSsR9Kp/TDEYjjPsmj9PNK5PbUCcPC02zch2Lbjcx0QXCblX2afX53wJRRDPX6YvNUDTRsjjSoX7ku7kpDzFNLO1CrL2kznjpblYnU1aBZTCHvg/+eZ2TE7Jx+WMMrKbfspTluvjlb4pFPjM+mqKNGg7K+VETdODohytMc4kdBB8vYddJ01dmFEggJr5jpDeYl+FNkzseJU1ybucwNXRljvqIpvHAjQa4CgSR/Jl3cX5QG4nwAm8yzlLkGk9phdglnmvEzjKApA+aXmXMmZi7Q7l1H5tVwUgjyOfH3wB+XMWOgO8xHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QDdSWRJz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QDdSWRJz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjjVj5PQ9z30T3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 00:22:05 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21c2f1b610dso3509395ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 05:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738156924; x=1738761724; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kq5jxbhmUEoZM+kdlwoh7uFTPoMD9RcTIy1F/a5B80=;
        b=QDdSWRJzg/XrjAHgV6FhPirN/wBb2A99x0EOh/moUlTcpam+6gE4LuWhYn2HLn9S8F
         KxfeYm0QT6oU8F6Tt2A0j49Q3J1Msi1wJUh++i+ck8ozHwz7k3NIjdIyyBBuujWew7Dn
         n+NDAQtraRgTf3VgoV5Pk+AW5C9/bi0OuuYueNZ19rGR2d09PNp0PoT0UOp2CZrv8n3+
         E2aDlEkE4Vm33eBLWoBMdNshRne8QxyT5PEe03Kf9bvAQPlPkNbj/hATIYZXcG5vQpwi
         t+oVUvJqGO2/A0cnl/NTKNw0WkTjj/24ImGEWVSC4JmWDUB1k6Qtv6PwnpjLRjOfqOtf
         2pQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738156924; x=1738761724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kq5jxbhmUEoZM+kdlwoh7uFTPoMD9RcTIy1F/a5B80=;
        b=CVuJB2pJyh3ensQZYf3EuT7h63BB3yKKhH65iOi0GS9cv9Ix2PieKB7VeIy15NHy7K
         E/UAcBnZOOv+fX023vdMdSYl7dtt3SWtqMsPfBJ5rpZZ4cXt7m6oJBweKFCkrd2WEgTF
         lcaYC17HFlDVIWEyysfN/fzMaiuCvjTN5alFlEKfPUbNcd/MlZR9usBn5Tr8nUji2FzD
         l/xhMiSI7+Hbksn44LKHE+SamWmJYQ8jNWQSjpplKwT5J/Aruyxwza4FATZvCQYn1Wbe
         ess6CRZoDOsWgD6LM1S23ctzZJ3y2DMp4RILRSwxJCvHOoq0ISs83Ci49x4T9oAspGZ3
         7bTg==
X-Forwarded-Encrypted: i=1; AJvYcCXRd1zSBLkclr0/DaFPzlT809LCv/RTmTyqHlVqHVkKqoRruQJTsoGciCpe7XAPK5GVnPlWx8gDv7kbVgs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz6/OL474Vo40bFqba8lv3JxPRB6a/BCPhNEz4N/gxjygqKiZg8
	pNba8CdaB0FrLBg6m9O/C/jGWEKMzfULMOteo2VtQFatYsI8cnYkMBM3qw==
X-Gm-Gg: ASbGncuNJc547U1cQ7EA7o2Xyseb/tFjvsMO6doHxjI/NFwtu3oreE+/yixu8cWnLiV
	PxYgdPxRaJzbXCJJ1DZtAsIXebKK+R1BUAtR7p5OWnvlwBdgQFQxmBThKlNsU7fAiXJrA8K/EYq
	+BnwHCUZ4N5fNV2XfSg3/I8YisBuZSHqIIafOZqHfK6ehwtPmxbbLfMuE51b5YD+1UoczzqJPZb
	FW1qzzPU4FYUMqQAQZ0hayowChFKfK8z5cLgpB4X5m/QnGKAFKYNcz6aQ7KpYispCVXvtyFpnyy
	xEtTZcA59SHIm7fug4mw/76tCc+FC6nfyRwdCmq4+3uy7eIlJw==
X-Google-Smtp-Source: AGHT+IEMR52YA8PcQua1hXYBKyOqDnOqJ1npRwUwIgFGGYZDAegRBOM92ReT/AGrlAqHY7XUAu3Pjg==
X-Received: by 2002:a17:902:f644:b0:216:2477:e4d3 with SMTP id d9443c01a7336-21dd7df6ad3mr47961825ad.51.1738156923656;
        Wed, 29 Jan 2025 05:22:03 -0800 (PST)
Received: from wheely.local0.net (124-169-212-233.tpgi.com.au. [124.169.212.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414131esm98984085ad.157.2025.01.29.05.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 05:22:03 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] powerpc/signal: Clean up pt_regs access
Date: Wed, 29 Jan 2025 23:21:42 +1000
Message-ID: <20250129132148.301937-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250129132148.301937-1-npiggin@gmail.com>
References: <20250129132148.301937-1-npiggin@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

There are places in signal code that are made more readable by using a
'regs' local variable instead of finding it from the task.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/signal.c    | 11 ++++++-----
 arch/powerpc/kernel/signal_64.c |  5 +++--
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index aa17e62f3754..193211b04805 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -242,6 +242,7 @@ static void check_syscall_restart(struct pt_regs *regs, struct k_sigaction *ka,
 
 static void do_signal(struct task_struct *tsk)
 {
+	struct pt_regs *regs = tsk->thread.regs;
 	sigset_t *oldset = sigmask_to_save();
 	struct ksignal ksig = { .sig = 0 };
 	int ret;
@@ -251,12 +252,12 @@ static void do_signal(struct task_struct *tsk)
 	get_signal(&ksig);
 
 	/* Is there any syscall restart business here ? */
-	check_syscall_restart(tsk->thread.regs, &ksig.ka, ksig.sig > 0);
+	check_syscall_restart(regs, &ksig.ka, ksig.sig > 0);
 
 	if (ksig.sig <= 0) {
 		/* No signal to deliver -- put the saved sigmask back */
 		restore_saved_sigmask();
-		set_trap_norestart(tsk->thread.regs);
+		set_trap_norestart(regs);
 		return;               /* no signals delivered */
 	}
 
@@ -275,9 +276,9 @@ static void do_signal(struct task_struct *tsk)
 	}
 
 	/* Re-enable the breakpoints for the signal stack */
-	thread_change_pc(tsk, tsk->thread.regs);
+	thread_change_pc(tsk, regs);
 
-	rseq_signal_deliver(&ksig, tsk->thread.regs);
+	rseq_signal_deliver(&ksig, regs);
 
 	if (is_32bit_task()) {
         	if (ksig.ka.sa.sa_flags & SA_SIGINFO)
@@ -288,7 +289,7 @@ static void do_signal(struct task_struct *tsk)
 		ret = handle_rt_signal64(&ksig, oldset, tsk);
 	}
 
-	set_trap_norestart(tsk->thread.regs);
+	set_trap_norestart(regs);
 	signal_setup_done(ret, &ksig, test_thread_flag(TIF_SINGLESTEP));
 }
 
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 86bb5bb4c143..1f0c43baeff2 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -748,6 +748,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	sigset_t set;
 	unsigned long msr;
 
+	BUG_ON(regs != current->thread.regs);
+
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
 
@@ -827,8 +829,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		 * MSR[TS] set, but without CPU in the proper state,
 		 * causing a TM bad thing.
 		 */
-		regs_set_return_msr(current->thread.regs,
-				current->thread.regs->msr & ~MSR_TS_MASK);
+		regs_set_return_msr(regs, regs->msr & ~MSR_TS_MASK);
 		if (!user_read_access_begin(&uc->uc_mcontext, sizeof(uc->uc_mcontext)))
 			goto badframe;
 
-- 
2.47.1


