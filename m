Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E26F20F9CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 18:50:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x9MD55Y9zDqL9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 02:50:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=cascardo@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x9KM46S1zDqJh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 02:48:22 +1000 (AEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58]
 helo=localhost.localdomain) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1jqJQc-0001jJ-S7; Tue, 30 Jun 2020 16:48:15 +0000
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/seccomp: fix ptrace tests on powerpc
Date: Tue, 30 Jun 2020 13:47:39 -0300
Message-Id: <20200630164739.1268222-1-cascardo@canonical.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Shuah Khan <shuah@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Kees Cook <keescook@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As pointed out by Michael Ellerman, the ptrace ABI on powerpc does not
allow or require the return code to be set on syscall entry when
skipping the syscall. It will always return ENOSYS and the return code
must be set on syscall exit.

This code does that, behaving more similarly to strace. It still sets
the return code on entry, which is overridden on powerpc, and it will
always repeat the same on exit. Also, on powerpc, the errno is not
inverted, and depends on ccr.so being set.

This has been tested on powerpc and amd64.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Kees Cook <keescook@google.com>
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 252140a52553..b90a9190ba88 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1738,6 +1738,14 @@ void change_syscall(struct __test_metadata *_metadata,
 		TH_LOG("Can't modify syscall return on this architecture");
 #else
 		regs.SYSCALL_RET = result;
+# if defined(__powerpc__)
+		if (result < 0) {
+			regs.SYSCALL_RET = -result;
+			regs.ccr |= 0x10000000;
+		} else {
+			regs.ccr &= ~0x10000000;
+		}
+# endif
 #endif
 
 #ifdef HAVE_GETREGS
@@ -1796,6 +1804,7 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
 	int ret, nr;
 	unsigned long msg;
 	static bool entry;
+	int *syscall_nr = args;
 
 	/*
 	 * The traditional way to tell PTRACE_SYSCALL entry/exit
@@ -1809,10 +1818,15 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
 	EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
 			: PTRACE_EVENTMSG_SYSCALL_EXIT, msg);
 
-	if (!entry)
+	if (!entry && !syscall_nr)
 		return;
 
-	nr = get_syscall(_metadata, tracee);
+	if (entry)
+		nr = get_syscall(_metadata, tracee);
+	else
+		nr = *syscall_nr;
+	if (syscall_nr)
+		*syscall_nr = nr;
 
 	if (nr == __NR_getpid)
 		change_syscall(_metadata, tracee, __NR_getppid, 0);
@@ -1889,9 +1903,10 @@ TEST_F(TRACE_syscall, ptrace_syscall_redirected)
 
 TEST_F(TRACE_syscall, ptrace_syscall_errno)
 {
+	int syscall_nr = -1;
 	/* Swap SECCOMP_RET_TRACE tracer for PTRACE_SYSCALL tracer. */
 	teardown_trace_fixture(_metadata, self->tracer);
-	self->tracer = setup_trace_fixture(_metadata, tracer_ptrace, NULL,
+	self->tracer = setup_trace_fixture(_metadata, tracer_ptrace, &syscall_nr,
 					   true);
 
 	/* Tracer should skip the open syscall, resulting in ESRCH. */
@@ -1900,9 +1915,10 @@ TEST_F(TRACE_syscall, ptrace_syscall_errno)
 
 TEST_F(TRACE_syscall, ptrace_syscall_faked)
 {
+	int syscall_nr = -1;
 	/* Swap SECCOMP_RET_TRACE tracer for PTRACE_SYSCALL tracer. */
 	teardown_trace_fixture(_metadata, self->tracer);
-	self->tracer = setup_trace_fixture(_metadata, tracer_ptrace, NULL,
+	self->tracer = setup_trace_fixture(_metadata, tracer_ptrace, &syscall_nr,
 					   true);
 
 	/* Tracer should skip the gettid syscall, resulting fake pid. */
-- 
2.25.1

