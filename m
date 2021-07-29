Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EE93D9C85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 06:14:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZxxJ08CHz3cJp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 14:14:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dRFmUrtW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dRFmUrtW; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZxwT36l2z2xKP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 14:13:29 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d1so5414234pll.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 21:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tYFO0AfXr/FC3oUtNHOzensxU52qor8faZD+me42iRQ=;
 b=dRFmUrtWShhlDrzUigz/5KjtFByjaXpqTujTpLC0Fu8iEPOZmGBh/DzBiRV/ZwMWjI
 s7WA/xPhfk21PeTAOXfFWih5lCrbUsZDQBi5nUaG4oaxBBYK51l4Wq8VS+p/yoxP2G0u
 /VaHbqykxo1BqztF+hCgHNIuJuoG8i3oXc9IyasLVl/QTsHUsw35Zdx+DiHpN3DmnA8K
 XGRRsH2x3S7WHvqQhxVY37EKRajhhTEDpvkYZDkEKiXAGp+eiHLxFVinUUXtF66GEy0l
 86bGxfVKb/C6iSD2s9TA/ltPdz9s64kpJdhA9lQKlRzfUlE+9gwqBFaRtCEf/8IxzdaC
 6qhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tYFO0AfXr/FC3oUtNHOzensxU52qor8faZD+me42iRQ=;
 b=Ki7Q8Rf2BvPHooJxirLSUhGBw5pZl+PnJ6YRYNaa3JGTKtBjbMNz+AXYUcUmj9ZxT8
 UOUtNlg7uHqy1Pzf6Z+irxb9HoMuWxk81okQZF9dc6QaeNv7zrgqVAXsf/bol4WX9iys
 VRrZQKP6mHqN7+rFH2A/z+qIygfUGUOalyX6JBPYYb7YftDIaGIk5cSqTCYF39MsZEUt
 opsxKYc/mPQjTXDNztSrpAs0XEVigyMl4wMLkMOFCEJHysKbv+C46T2c9rSKpwwwssQV
 silbnqRoJol17XCKQykjD/lDP9D17tMt1EEgXuQAVcvhyq9sQTFUTaVh7dG575vCBipi
 fcXw==
X-Gm-Message-State: AOAM5310IftXY0i4BdUjkG8sANcE72n/mjXDajq4aHvu9i/aPTrWVrqm
 FGYzQBrJwATn0VCi1cDhhvHKkY9spb8=
X-Google-Smtp-Source: ABdhPJy+h2PmSP4yrD5u8c8N7A/EFYGo/55pspkX7y2AHbGa2TBAeUPbpEAheceDfgZsnUNIBh79fQ==
X-Received: by 2002:a63:1d18:: with SMTP id d24mr2132972pgd.69.1627532006900; 
 Wed, 28 Jul 2021 21:13:26 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id 198sm1617803pfw.21.2021.07.28.21.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 21:13:26 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] selftests: Skip TM tests on synthetic TM
 implementations
Date: Thu, 29 Jul 2021 14:13:17 +1000
Message-Id: <20210729041317.366612-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729041317.366612-1-jniethe5@gmail.com>
References: <20210729041317.366612-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, mikey@neuling.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Transactional Memory was removed from the architecture in ISA v3.1. For
threads running in P8/P9 compatibility mode on P10 a synthetic TM
implementation is provided. In this implementation, tbegin. always sets
cr0 eq meaning the abort handler is always called. This is not an issue
as users of TM are expected to have a fallback non transactional way to
make forward progress in the abort handler.  The TEXASR indicates if a
transaction failure is due to a synthetic implementation.

Some of the TM self tests need a non-degenerate TM implementation for
their testing to be meaningful so check for a synthetic implementation
and skip the test if so.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: Added checking for synthetic implementation to more tests
---
 .../selftests/powerpc/ptrace/ptrace-tm-gpr.c  |  1 +
 .../powerpc/ptrace/ptrace-tm-spd-gpr.c        |  1 +
 .../powerpc/ptrace/ptrace-tm-spd-tar.c        |  1 +
 .../powerpc/ptrace/ptrace-tm-spd-vsx.c        |  1 +
 .../selftests/powerpc/ptrace/ptrace-tm-spr.c  |  1 +
 .../selftests/powerpc/ptrace/ptrace-tm-tar.c  |  1 +
 .../selftests/powerpc/ptrace/ptrace-tm-vsx.c  |  1 +
 .../selftests/powerpc/signal/signal_tm.c      |  1 +
 tools/testing/selftests/powerpc/tm/tm-exec.c  |  1 +
 tools/testing/selftests/powerpc/tm/tm-fork.c  |  1 +
 .../testing/selftests/powerpc/tm/tm-poison.c  |  1 +
 .../selftests/powerpc/tm/tm-resched-dscr.c    |  1 +
 .../powerpc/tm/tm-signal-context-chk-fpu.c    |  1 +
 .../powerpc/tm/tm-signal-context-chk-gpr.c    |  1 +
 .../powerpc/tm/tm-signal-context-chk-vmx.c    |  1 +
 .../powerpc/tm/tm-signal-context-chk-vsx.c    |  1 +
 .../powerpc/tm/tm-signal-pagefault.c          |  1 +
 .../powerpc/tm/tm-signal-sigreturn-nt.c       |  1 +
 .../selftests/powerpc/tm/tm-signal-stack.c    |  1 +
 .../selftests/powerpc/tm/tm-sigreturn.c       |  1 +
 .../testing/selftests/powerpc/tm/tm-syscall.c |  2 +-
 tools/testing/selftests/powerpc/tm/tm-tar.c   |  1 +
 tools/testing/selftests/powerpc/tm/tm-tmspr.c |  1 +
 tools/testing/selftests/powerpc/tm/tm-trap.c  |  1 +
 .../selftests/powerpc/tm/tm-unavailable.c     |  1 +
 .../selftests/powerpc/tm/tm-vmx-unavail.c     |  1 +
 .../testing/selftests/powerpc/tm/tm-vmxcopy.c |  1 +
 tools/testing/selftests/powerpc/tm/tm.h       | 36 +++++++++++++++++++
 28 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
index 7df7100a29be..67ca297c5cca 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
@@ -113,6 +113,7 @@ int ptrace_tm_gpr(void)
 	int ret, status;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 2, 0777|IPC_CREAT);
 	pid = fork();
 	if (pid < 0) {
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
index 8706bea5d015..6f2bce1b6c5d 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
@@ -119,6 +119,7 @@ int ptrace_tm_spd_gpr(void)
 	int ret, status;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 3, 0777|IPC_CREAT);
 	pid = fork();
 	if (pid < 0) {
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
index 2ecfa1158e2b..e112a34fbe59 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
@@ -129,6 +129,7 @@ int ptrace_tm_spd_tar(void)
 	int ret, status;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 3, 0777|IPC_CREAT);
 	pid = fork();
 	if (pid == 0)
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c
index 6f7fb51f0809..40133d49fe39 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c
@@ -129,6 +129,7 @@ int ptrace_tm_spd_vsx(void)
 	int ret, status, i;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 3, 0777|IPC_CREAT);
 
 	for (i = 0; i < 128; i++) {
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spr.c
index 068bfed2e606..880ba6a29a48 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spr.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spr.c
@@ -114,6 +114,7 @@ int ptrace_tm_spr(void)
 	int ret, status;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 	shm_id = shmget(IPC_PRIVATE, sizeof(struct shared), 0777|IPC_CREAT);
 	shm_id1 = shmget(IPC_PRIVATE, sizeof(int), 0777|IPC_CREAT);
 	pid = fork();
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c
index 46ef378a15ec..d0db6df0f0ea 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c
@@ -117,6 +117,7 @@ int ptrace_tm_tar(void)
 	int ret, status;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 2, 0777|IPC_CREAT);
 	pid = fork();
 	if (pid == 0)
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c
index 70ca01234f79..4f05ce4fd282 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c
@@ -113,6 +113,7 @@ int ptrace_tm_vsx(void)
 	int ret, status, i;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 2, 0777|IPC_CREAT);
 
 	for (i = 0; i < 128; i++) {
diff --git a/tools/testing/selftests/powerpc/signal/signal_tm.c b/tools/testing/selftests/powerpc/signal/signal_tm.c
index 5bf2224ef7f2..c9cf66a3daa2 100644
--- a/tools/testing/selftests/powerpc/signal/signal_tm.c
+++ b/tools/testing/selftests/powerpc/signal/signal_tm.c
@@ -56,6 +56,7 @@ static int test_signal_tm()
 	}
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 
 	for (i = 0; i < MAX_ATTEMPT; i++) {
 		/*
diff --git a/tools/testing/selftests/powerpc/tm/tm-exec.c b/tools/testing/selftests/powerpc/tm/tm-exec.c
index 260cfdb97d23..c59919d6710d 100644
--- a/tools/testing/selftests/powerpc/tm/tm-exec.c
+++ b/tools/testing/selftests/powerpc/tm/tm-exec.c
@@ -27,6 +27,7 @@ static char *path;
 static int test_exec(void)
 {
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 
 	asm __volatile__(
 		"tbegin.;"
diff --git a/tools/testing/selftests/powerpc/tm/tm-fork.c b/tools/testing/selftests/powerpc/tm/tm-fork.c
index 6efa5a685a77..c27b935f0e9f 100644
--- a/tools/testing/selftests/powerpc/tm/tm-fork.c
+++ b/tools/testing/selftests/powerpc/tm/tm-fork.c
@@ -21,6 +21,7 @@
 int test_fork(void)
 {
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 
 	asm __volatile__(
 		"tbegin.;"
diff --git a/tools/testing/selftests/powerpc/tm/tm-poison.c b/tools/testing/selftests/powerpc/tm/tm-poison.c
index 29e5f26af7b9..891b7b32a51f 100644
--- a/tools/testing/selftests/powerpc/tm/tm-poison.c
+++ b/tools/testing/selftests/powerpc/tm/tm-poison.c
@@ -34,6 +34,7 @@ int tm_poison_test(void)
 	bool fail_vr = false;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 
 	cpu = pick_online_cpu();
 	FAIL_IF(cpu < 0);
diff --git a/tools/testing/selftests/powerpc/tm/tm-resched-dscr.c b/tools/testing/selftests/powerpc/tm/tm-resched-dscr.c
index 4cdb83964bb3..85c940ae6ff8 100644
--- a/tools/testing/selftests/powerpc/tm/tm-resched-dscr.c
+++ b/tools/testing/selftests/powerpc/tm/tm-resched-dscr.c
@@ -40,6 +40,7 @@ int test_body(void)
 	uint64_t rv, dscr1 = 1, dscr2, texasr;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 
 	printf("Check DSCR TM context switch: ");
 	fflush(stdout);
diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-fpu.c b/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-fpu.c
index 254f912ad611..657d755b2905 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-fpu.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-fpu.c
@@ -79,6 +79,7 @@ static int tm_signal_context_chk_fpu()
 	pid_t pid = getpid();
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 
 	act.sa_sigaction = signal_usr1;
 	sigemptyset(&act.sa_mask);
diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-gpr.c b/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-gpr.c
index 0cc680f61828..400fa70ca71e 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-gpr.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-gpr.c
@@ -81,6 +81,7 @@ static int tm_signal_context_chk_gpr()
 	pid_t pid = getpid();
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 
 	act.sa_sigaction = signal_usr1;
 	sigemptyset(&act.sa_mask);
diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vmx.c b/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vmx.c
index b6d52730a0d8..d628fd302b28 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vmx.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vmx.c
@@ -104,6 +104,7 @@ static int tm_signal_context_chk()
 	pid_t pid = getpid();
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 
 	act.sa_sigaction = signal_usr1;
 	sigemptyset(&act.sa_mask);
diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vsx.c b/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vsx.c
index 8e25e2072ecd..9bd869245bad 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vsx.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vsx.c
@@ -153,6 +153,7 @@ static int tm_signal_context_chk()
 	pid_t pid = getpid();
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 
 	act.sa_sigaction = signal_usr1;
 	sigemptyset(&act.sa_mask);
diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-pagefault.c b/tools/testing/selftests/powerpc/tm/tm-signal-pagefault.c
index 5908bc6abe60..0b84c9208d62 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-pagefault.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-pagefault.c
@@ -226,6 +226,7 @@ int tm_signal_pagefault(void)
 	stack_t ss;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 	SKIP_IF(!have_userfaultfd());
 
 	setup_uf_mem();
diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c b/tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c
index 07c388147b75..06b801906f27 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-sigreturn-nt.c
@@ -32,6 +32,7 @@ int tm_signal_sigreturn_nt(void)
 	struct sigaction trap_sa;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 
 	trap_sa.sa_flags = SA_SIGINFO;
 	trap_sa.sa_sigaction = trap_signal_handler;
diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-stack.c b/tools/testing/selftests/powerpc/tm/tm-signal-stack.c
index cdcf8c5bbbc7..68807aac8dd3 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-stack.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-stack.c
@@ -35,6 +35,7 @@ int tm_signal_stack()
 	int pid;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 
 	pid = fork();
 	if (pid < 0)
diff --git a/tools/testing/selftests/powerpc/tm/tm-sigreturn.c b/tools/testing/selftests/powerpc/tm/tm-sigreturn.c
index 9a6017a1d769..ffe4e5515f33 100644
--- a/tools/testing/selftests/powerpc/tm/tm-sigreturn.c
+++ b/tools/testing/selftests/powerpc/tm/tm-sigreturn.c
@@ -55,6 +55,7 @@ int tm_sigreturn(void)
 	uint64_t ret = 0;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 	SKIP_IF(!is_ppc64le());
 
 	memset(&sa, 0, sizeof(sa));
diff --git a/tools/testing/selftests/powerpc/tm/tm-syscall.c b/tools/testing/selftests/powerpc/tm/tm-syscall.c
index becb8207b432..467a6b3134b2 100644
--- a/tools/testing/selftests/powerpc/tm/tm-syscall.c
+++ b/tools/testing/selftests/powerpc/tm/tm-syscall.c
@@ -25,7 +25,6 @@ extern int getppid_tm_suspended(void);
 unsigned retries = 0;
 
 #define TEST_DURATION 10 /* seconds */
-#define TM_RETRIES 100
 
 pid_t getppid_tm(bool suspend)
 {
@@ -67,6 +66,7 @@ int tm_syscall(void)
 	struct timeval end, now;
 
 	SKIP_IF(!have_htm_nosc());
+	SKIP_IF(htm_is_synthetic());
 
 	setbuf(stdout, NULL);
 
diff --git a/tools/testing/selftests/powerpc/tm/tm-tar.c b/tools/testing/selftests/powerpc/tm/tm-tar.c
index 03be8c47292b..f2a9137f3c1e 100644
--- a/tools/testing/selftests/powerpc/tm/tm-tar.c
+++ b/tools/testing/selftests/powerpc/tm/tm-tar.c
@@ -26,6 +26,7 @@ int test_tar(void)
 	int i;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 	SKIP_IF(!is_ppc64le());
 
 	for (i = 0; i < num_loops; i++)
diff --git a/tools/testing/selftests/powerpc/tm/tm-tmspr.c b/tools/testing/selftests/powerpc/tm/tm-tmspr.c
index 794d574db784..dd5ddffa28b7 100644
--- a/tools/testing/selftests/powerpc/tm/tm-tmspr.c
+++ b/tools/testing/selftests/powerpc/tm/tm-tmspr.c
@@ -96,6 +96,7 @@ int test_tmspr()
 	unsigned long	i;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 
 	/* To cause some context switching */
 	thread_num = 10 * sysconf(_SC_NPROCESSORS_ONLN);
diff --git a/tools/testing/selftests/powerpc/tm/tm-trap.c b/tools/testing/selftests/powerpc/tm/tm-trap.c
index 11521077f915..97cb74768e30 100644
--- a/tools/testing/selftests/powerpc/tm/tm-trap.c
+++ b/tools/testing/selftests/powerpc/tm/tm-trap.c
@@ -255,6 +255,7 @@ int tm_trap_test(void)
 	struct sigaction trap_sa;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 
 	trap_sa.sa_flags = SA_SIGINFO;
 	trap_sa.sa_sigaction = trap_signal_handler;
diff --git a/tools/testing/selftests/powerpc/tm/tm-unavailable.c b/tools/testing/selftests/powerpc/tm/tm-unavailable.c
index a1348a5f721a..6bf1b65b020d 100644
--- a/tools/testing/selftests/powerpc/tm/tm-unavailable.c
+++ b/tools/testing/selftests/powerpc/tm/tm-unavailable.c
@@ -344,6 +344,7 @@ int tm_unavailable_test(void)
 	cpu_set_t cpuset;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 
 	cpu = pick_online_cpu();
 	FAIL_IF(cpu < 0);
diff --git a/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c b/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
index 9ef37a9836ac..34364ed2b6b7 100644
--- a/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
+++ b/tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c
@@ -91,6 +91,7 @@ int tm_vmx_unavail_test()
 	pthread_t *thread;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 
 	passed = 1;
 
diff --git a/tools/testing/selftests/powerpc/tm/tm-vmxcopy.c b/tools/testing/selftests/powerpc/tm/tm-vmxcopy.c
index c1e788a6df47..1640e7ead69b 100644
--- a/tools/testing/selftests/powerpc/tm/tm-vmxcopy.c
+++ b/tools/testing/selftests/powerpc/tm/tm-vmxcopy.c
@@ -46,6 +46,7 @@ int test_vmxcopy()
 	uint64_t aborted = 0;
 
 	SKIP_IF(!have_htm());
+	SKIP_IF(htm_is_synthetic());
 	SKIP_IF(!is_ppc64le());
 
 	fd = mkstemp(tmpfile);
diff --git a/tools/testing/selftests/powerpc/tm/tm.h b/tools/testing/selftests/powerpc/tm/tm.h
index c5a1e5c163fc..c03c6e778876 100644
--- a/tools/testing/selftests/powerpc/tm/tm.h
+++ b/tools/testing/selftests/powerpc/tm/tm.h
@@ -10,6 +10,9 @@
 #include <asm/tm.h>
 
 #include "utils.h"
+#include "reg.h"
+
+#define TM_RETRIES 100
 
 static inline bool have_htm(void)
 {
@@ -31,6 +34,39 @@ static inline bool have_htm_nosc(void)
 #endif
 }
 
+/*
+ * Transactional Memory was removed in ISA 3.1. A synthetic TM implementation
+ * is provided on P10 for threads running in P8/P9 compatibility  mode. The
+ * synthetic implementation immediately fails after tbegin. This failure sets
+ * Bit 7 (Failure Persistent) and Bit 15 (Implementation-specific).
+ */
+static inline bool htm_is_synthetic(void)
+{
+	int i;
+
+	/*
+	 * Per the ISA, the Failure Persistent bit may be incorrect. Try a few
+	 * times in case we got an Implementation-specific failure on a non ISA
+	 * v3.1 system. On these systems the Implementation-specific failure
+	 * should not be persistent.
+	 */
+	for (i = 0; i < TM_RETRIES; i++) {
+		asm volatile(
+		"tbegin.;"
+		"beq 1f;"
+		"tend.;"
+		"1:"
+		:
+		:
+		: "memory");
+
+		if ((__builtin_get_texasr() & (TEXASR_FP | TEXASR_IC)) !=
+		    (TEXASR_FP | TEXASR_IC))
+			break;
+	}
+	return i == TM_RETRIES;
+}
+
 static inline long failure_code(void)
 {
 	return __builtin_get_texasru() >> 24;
-- 
2.25.1

