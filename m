Return-Path: <linuxppc-dev+bounces-5683-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC21A21DCF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 14:22:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjjVq4rgxz30TN;
	Thu, 30 Jan 2025 00:22:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738156931;
	cv=none; b=RYyx7ngIIkO8EGoDYmNLoMiYyjXvcchY0cN5/xvO60ro4fi373vOWXY7n0cNOTPB7YVocZMRUF2+u0ktEPp5j/Vf05vD/MgYvXDxH413gmesi8neuUg+aCJSVsG6jnxbMlEYm1tYlu9RVM2UjrRAUablwwRLhrhFqZ2Of/PvO2GtMFiY6pBJ+JLAQ+ceAmkrkH/RptIU/GHkUQE1smhU2MKuQZn7Bfcyp4sOSEPZh3WXJ5lPD0WiyVLQVxOoM8fFP4/PeKKeo/N977c28WxzfPP6v0ykJWI8tj4HynuJV7dbAzcv8XIuMpSRx//9iaFxyVElvOxCqLMUSUKNSa+7TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738156931; c=relaxed/relaxed;
	bh=E2G7sCUE18yd2XPHUU2liMqpeHLkCBj0GvojobSAaWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iorfs1hBWAyqMAR9lmOGIk3GeRr2IfiuP0KKC/D8y5QlGPJF8cAYu3b1nYFMV1VqdkoUWgAJy0DXvIWWqdRyw0OXL9+voHPjQWUB8HLIwtv07DGM9/p4ElNaveQexYfv54OKZIk3QRUjBh0Y/d3dblP5xm2PLRygEAWNk4lb7Wi6MsMjdtKIyD3xdEVmpYXZ1GbiFOI024vCNsMhlMiuYp6O8AxogDUN/bVhv5bydNQ/+EwWDQRj3iRcvAp12i64bCODPmghPZGAYfKEZjMyInNtzMGNG3YZ8P9Xu+5jXBJqMdVkIDjE/evBjfAoUH4x72mTFYDDUC9QaieWkyJOJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JP7WIzuR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JP7WIzuR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjjVp70CFz307C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 00:22:10 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21670dce0a7so3294615ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 05:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738156929; x=1738761729; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2G7sCUE18yd2XPHUU2liMqpeHLkCBj0GvojobSAaWM=;
        b=JP7WIzuRuT+LsSljEtEQxdH8WvcC57ai3DSbz8RfGW7F6Mi9Tg7cxdefA1K2pE0uBa
         3Yw8vCw9xgeZi963LWoPHLnRzlm5q+H4de9xGiI8i5c1bdKXMeyRDFHwsTx/2IFpzvS3
         TVuHx6aDPYc+TKgIs0BLJ7qKQD2uOYIOhpLAPhujuAOwN7g9v21RD76XrbHjnd30hU4V
         cnx15EOVwWlyVRbOPKalriJpE6kyp7IeLvzjvHviNzZv9SXZnV3ETXaAZb3d2cpLXApP
         JfmQ9zYCJq/P55kj7NhZbMhXT8uvFyB7H04phk9uwVF3a2GhsVP36d606lIKoyEJl9GE
         ZsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738156929; x=1738761729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2G7sCUE18yd2XPHUU2liMqpeHLkCBj0GvojobSAaWM=;
        b=kBVuvmZgbvdHw1gmE7mFwjbnl+1tDywY/hyrgkcJiPGQZ+Gh6OwFzmVnjtg74pqpDB
         VCs123wXsv/Z/DMO+KhF2Im3hMa2rATmpk1LADLoyDRanOTJMr1ASC8x7cxtxVPhz/2f
         nauJD2HesLmKhp0HF8H4QRUPcyhy+zrXlTtfaXcBfDRGt3Znli5WZKiwcPTCUDkyz3Rg
         P6lNNMKKBJR86a7BS+5fLphECjT0ZSJZV3qXahYv67MJ/m8Ofq5xLtNUKl4QutqFebEH
         r7n6eouDYNv5oFgHs3/YJlf8JT8nn6DYBnHU+pj8NfvDyXXt+6X5Fya8xdZ8tMqDsZWW
         gFPA==
X-Forwarded-Encrypted: i=1; AJvYcCUDLNcUPhSr9L5TsmfRKa5lW62HVAFCZicgshbACIMj/IsQQSEJE2uP818Plr5zE/kWboIG/UgWbpKwKZc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyW1ey9x5BsJbYMXa3Uk0syU/n79B07X6zB9vECcztxInEp2xcP
	ZIFDbBT5ifMtgPEI9XNrxiYPdX/w80iG8Mj6TSgu4vT73qDQQUTs
X-Gm-Gg: ASbGnctw2W150gPijBfG8B5hrzud/vlXTr1vQlTB33eq+PYdaWy1zpwxHnHDBfesypK
	asgXZJv/0oCnpj233eYwF+CIvIPJASfpqHq8sbFFUYeSsOnkaGDzp+FOMg3JcB4T1IMwNp1nko5
	S/wqIKd2EKp889KVYn/Myj9WmPw0BejpGbbfGVJ5OHxamH/tQYYMPQwek+N/gLsy5+03I99y0tU
	UPCGJca6tly/1dS1wpIRPj/teNjPLJrLCTCr3thybug/9luySlq6fai0YRTUxgbUWH90eVp3J87
	H+/fi1TeaoJfDATuwnXKGwEG7Kw03KNmEs+616ucfuPWUR6HmQ==
X-Google-Smtp-Source: AGHT+IEP3nAiW35A49lKobsrBhi75mCu+p/sI5JGaTrGE1/mS0772HNEX/+PFG931ku+i6Po2Pp+/g==
X-Received: by 2002:a17:903:18d:b0:215:773a:c168 with SMTP id d9443c01a7336-21dd7c44a42mr51142665ad.1.1738156928811;
        Wed, 29 Jan 2025 05:22:08 -0800 (PST)
Received: from wheely.local0.net (124-169-212-233.tpgi.com.au. [124.169.212.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414131esm98984085ad.157.2025.01.29.05.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 05:22:08 -0800 (PST)
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
Subject: [RFC PATCH 2/2] powerpc/syscall: rework syscall return value handling
Date: Wed, 29 Jan 2025 23:21:43 +1000
Message-ID: <20250129132148.301937-3-npiggin@gmail.com>
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

powerpc is one of the "interesting" archs when it comes to system call
error return convention. Rather than returning a -errno, it sets a
condition register bit and returns a +errno. To make matters more
complicated, a new system call instruction was introduced that uses the
-errno convention.

These error conventions are carried throughout the kernel in pt_regs,
which has lead to complexity in accessor functions and several subtle
breakages and surprising behaviour particularly around trace and bpf
code.

Can we change the way we do this and improve commonality with the big
archs by always using the "Linux convention" of -errno as the return
value, then just swapping that to powerpc convention in low level
powerpc syscall return code?

In theory this limits some "successful" values that can be returned by
system calls, however its the same as x86 and others, and recent 64-bit
powerpc that use scv 0 for the past few years have the same limitation
too.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h             | 13 +----
 arch/powerpc/include/asm/syscall.h            | 31 +---------
 arch/powerpc/kernel/interrupt.c               | 16 +++---
 arch/powerpc/kernel/signal.c                  | 56 ++++++++++---------
 tools/testing/selftests/seccomp/seccomp_bpf.c | 16 ++++++
 5 files changed, 60 insertions(+), 72 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 7b9350756875..b09b1524c74d 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -286,21 +286,12 @@ static __always_inline void set_trap_norestart(struct pt_regs *regs)
 #define kernel_stack_pointer(regs) ((regs)->gpr[1])
 static inline int is_syscall_success(struct pt_regs *regs)
 {
-	if (trap_is_scv(regs))
-		return !IS_ERR_VALUE((unsigned long)regs->gpr[3]);
-	else
-		return !(regs->ccr & 0x10000000);
+	return !IS_ERR_VALUE((unsigned long)regs->gpr[3]);
 }
 
 static inline long regs_return_value(struct pt_regs *regs)
 {
-	if (trap_is_scv(regs))
-		return regs->gpr[3];
-
-	if (is_syscall_success(regs))
-		return regs->gpr[3];
-	else
-		return -regs->gpr[3];
+	return regs->gpr[3];
 }
 
 static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
index 3dd36c5e334a..020e9f5ed1ca 100644
--- a/arch/powerpc/include/asm/syscall.h
+++ b/arch/powerpc/include/asm/syscall.h
@@ -48,17 +48,8 @@ static inline void syscall_rollback(struct task_struct *task,
 static inline long syscall_get_error(struct task_struct *task,
 				     struct pt_regs *regs)
 {
-	if (trap_is_scv(regs)) {
-		unsigned long error = regs->gpr[3];
-
-		return IS_ERR_VALUE(error) ? error : 0;
-	} else {
-		/*
-		 * If the system call failed,
-		 * regs->gpr[3] contains a positive ERRORCODE.
-		 */
-		return (regs->ccr & 0x10000000UL) ? -regs->gpr[3] : 0;
-	}
+	unsigned long error = regs->gpr[3];
+	return IS_ERR_VALUE(error) ? error : 0;
 }
 
 static inline long syscall_get_return_value(struct task_struct *task,
@@ -71,23 +62,7 @@ static inline void syscall_set_return_value(struct task_struct *task,
 					    struct pt_regs *regs,
 					    int error, long val)
 {
-	if (trap_is_scv(regs)) {
-		regs->gpr[3] = (long) error ?: val;
-	} else {
-		/*
-		 * In the general case it's not obvious that we must deal with
-		 * CCR here, as the syscall exit path will also do that for us.
-		 * However there are some places, eg. the signal code, which
-		 * check ccr to decide if the value in r3 is actually an error.
-		 */
-		if (error) {
-			regs->ccr |= 0x10000000L;
-			regs->gpr[3] = error;
-		} else {
-			regs->ccr &= ~0x10000000L;
-			regs->gpr[3] = val;
-		}
-	}
+	regs->gpr[3] = (long) error ?: val;
 }
 
 static inline void syscall_get_arguments(struct task_struct *task,
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 8f4acc55407b..18ee03fa50ae 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -277,13 +277,6 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 
 	ti_flags = read_thread_flags();
 
-	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
-		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
-			r3 = -r3;
-			regs->ccr |= 0x10000000; /* Set SO bit in CR */
-		}
-	}
-
 	if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
 		if (ti_flags & _TIF_RESTOREALL)
 			ret = _TIF_RESTOREALL;
@@ -302,6 +295,15 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	local_irq_disable();
 	ret = interrupt_exit_user_prepare_main(ret, regs);
 
+	/* sc syscalls return error by setting CR0[SO] and +ve errno in r3 */
+	/* do_signal() has similar conversion */
+	if (unlikely(IS_ERR_VALUE(regs->gpr[3]) && is_not_scv)) {
+		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
+			regs->gpr[3] = -regs->gpr[3];
+			regs->ccr |= 0x10000000; /* Set SO bit in CR */
+		}
+	}
+
 #ifdef CONFIG_PPC64
 	regs->exit_result = ret;
 #endif
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index 193211b04805..b578d1e40b40 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -175,7 +175,7 @@ void __user *get_sigframe(struct ksignal *ksig, struct task_struct *tsk,
         return (void __user *)newsp;
 }
 
-static void check_syscall_restart(struct pt_regs *regs, struct k_sigaction *ka,
+static bool check_syscall_restart(struct pt_regs *regs, struct k_sigaction *ka,
 				  int has_handler)
 {
 	unsigned long ret = regs->gpr[3];
@@ -183,60 +183,52 @@ static void check_syscall_restart(struct pt_regs *regs, struct k_sigaction *ka,
 
 	/* syscall ? */
 	if (!trap_is_syscall(regs))
-		return;
+		return false;
 
 	if (trap_norestart(regs))
-		return;
+		return false;
 
 	/* error signalled ? */
-	if (trap_is_scv(regs)) {
-		/* 32-bit compat mode sign extend? */
-		if (!IS_ERR_VALUE(ret))
-			return;
-		ret = -ret;
-	} else if (!(regs->ccr & 0x10000000)) {
-		return;
-	}
+	if (!IS_ERR_VALUE(ret)) /* Should we 32-bit compat mode sign extend? */
+		return false;
 
 	switch (ret) {
-	case ERESTART_RESTARTBLOCK:
-	case ERESTARTNOHAND:
+	case -ERESTART_RESTARTBLOCK:
+	case -ERESTARTNOHAND:
 		/* ERESTARTNOHAND means that the syscall should only be
 		 * restarted if there was no handler for the signal, and since
 		 * we only get here if there is a handler, we dont restart.
 		 */
 		restart = !has_handler;
 		break;
-	case ERESTARTSYS:
+	case -ERESTARTSYS:
 		/* ERESTARTSYS means to restart the syscall if there is no
 		 * handler or the handler was registered with SA_RESTART
 		 */
 		restart = !has_handler || (ka->sa.sa_flags & SA_RESTART) != 0;
 		break;
-	case ERESTARTNOINTR:
+	case -ERESTARTNOINTR:
 		/* ERESTARTNOINTR means that the syscall should be
 		 * called again after the signal handler returns.
 		 */
 		break;
 	default:
-		return;
+		return false;
 	}
 	if (restart) {
-		if (ret == ERESTART_RESTARTBLOCK)
+		if (ret == -ERESTART_RESTARTBLOCK)
 			regs->gpr[0] = __NR_restart_syscall;
 		else
 			regs->gpr[3] = regs->orig_gpr3;
 		regs_add_return_ip(regs, -4);
 		regs->result = 0;
+
+		return true;
 	} else {
-		if (trap_is_scv(regs)) {
-			regs->result = -EINTR;
-			regs->gpr[3] = -EINTR;
-		} else {
-			regs->result = -EINTR;
-			regs->gpr[3] = EINTR;
-			regs->ccr |= 0x10000000;
-		}
+		regs->result = -EINTR;
+		regs->gpr[3] = -EINTR;
+
+		return false;
 	}
 }
 
@@ -245,6 +237,7 @@ static void do_signal(struct task_struct *tsk)
 	struct pt_regs *regs = tsk->thread.regs;
 	sigset_t *oldset = sigmask_to_save();
 	struct ksignal ksig = { .sig = 0 };
+	bool restart;
 	int ret;
 
 	BUG_ON(tsk != current);
@@ -252,7 +245,7 @@ static void do_signal(struct task_struct *tsk)
 	get_signal(&ksig);
 
 	/* Is there any syscall restart business here ? */
-	check_syscall_restart(regs, &ksig.ka, ksig.sig > 0);
+	restart = check_syscall_restart(regs, &ksig.ka, ksig.sig > 0);
 
 	if (ksig.sig <= 0) {
 		/* No signal to deliver -- put the saved sigmask back */
@@ -280,6 +273,17 @@ static void do_signal(struct task_struct *tsk)
 
 	rseq_signal_deliver(&ksig, regs);
 
+	/* Fix the error code which is restored-exact from sigreturn stack */
+	/* syscall_exit_prepare() has similar conversion */
+	if (trap_is_syscall(regs) && !restart &&
+	    (unlikely(IS_ERR_VALUE(regs->gpr[3]) && !trap_is_scv(regs)))) {
+		if (likely(!(read_thread_flags() & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
+			regs->gpr[3] = -regs->gpr[3];
+			regs->result = -regs->result;
+			regs->ccr |= 0x10000000; /* Set SO bit in CR */
+		}
+	}
+
 	if (is_32bit_task()) {
         	if (ksig.ka.sa.sa_flags & SA_SIGINFO)
 			ret = handle_rt_signal32(&ksig, oldset, tsk);
diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 8c3a73461475..1bda8c9441d3 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1786,6 +1786,22 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 # define SYSCALL_RET_SET(_regs, _val)				\
 	do {							\
 		typeof(_val) _result = (_val);			\
+		/*						\
+		 * powerpc sc 0 syscall error return convention	\
+		 * is r3 = +EERROR and CR0[SO]=1 to flag error.	\
+		 * The scv 0 error convention is r3 = -EERROR.	\
+		 *						\
+		 * The type of syscall can be detected by	\
+		 * testing _regs.trap & 0xfff0, the value	\
+		 * 0x0c00 is an sc 0 call, and 0x3000 is scv 0.	\
+		 *						\
+		 * However tracing does not need to know the	\
+		 * difference when injecting an error, as Linux	\
+		 * will convert -EERROR in r3 to the sc 0 error	\
+		 * convention as necessary. But the below code	\
+		 * demonstrates	explicitly setting the sc 0	\
+		 * error convention.				\
+		 */						\
 		if ((_regs.trap & 0xfff0) == 0x3000) {		\
 			/*					\
 			 * scv 0 system call uses -ve result	\
-- 
2.47.1


