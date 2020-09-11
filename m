Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B38026681A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 20:12:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp3kS49XyzDqm6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 04:12:16 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp3hY6cv8zDqgp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 04:10:37 +1000 (AEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58]
 helo=localhost.localdomain) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1kGnVI-0001Y9-HA; Fri, 11 Sep 2020 18:10:33 +0000
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: linux-kselftest@vger.kernel.org
Subject: [PATCH v2] selftests/seccomp: fix ptrace tests on powerpc
Date: Fri, 11 Sep 2020 15:10:12 -0300
Message-Id: <20200911181012.171027-1-cascardo@canonical.com>
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
Cc: cascardo@canonical.com, Shuah Khan <shuah@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Kees Cook <keescook@google.com>,
 linuxppc-dev@lists.ozlabs.org
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
 tools/testing/selftests/seccomp/seccomp_bpf.c | 81 ++++++++++++-------
 1 file changed, 53 insertions(+), 28 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 7a6d40286a42..0ddc0846e9c0 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1837,15 +1837,24 @@ void change_syscall(struct __test_metadata *_metadata,
 #endif
 
 	/* If syscall is skipped, change return value. */
-	if (syscall == -1)
+	if (syscall == -1) {
 #ifdef SYSCALL_NUM_RET_SHARE_REG
 		TH_LOG("Can't modify syscall return on this architecture");
-
 #elif defined(__xtensa__)
 		regs.SYSCALL_RET(regs) = result;
+#elif defined(__powerpc__)
+		/* Error is signaled by CR0 SO bit and error code is positive. */
+		if (result < 0) {
+			regs.SYSCALL_RET = -result;
+			regs.ccr |= 0x10000000;
+		} else {
+			regs.SYSCALL_RET = result;
+			regs.ccr &= ~0x10000000;
+		}
 #else
 		regs.SYSCALL_RET = result;
 #endif
+	}
 
 #ifdef HAVE_GETREGS
 	ret = ptrace(PTRACE_SETREGS, tracee, 0, &regs);
@@ -1897,12 +1906,44 @@ void tracer_seccomp(struct __test_metadata *_metadata, pid_t tracee,
 
 }
 
+FIXTURE(TRACE_syscall) {
+	struct sock_fprog prog;
+	pid_t tracer, mytid, mypid, parent;
+};
+
+FIXTURE_VARIANT(TRACE_syscall) {
+	/*
+	 * All of the SECCOMP_RET_TRACE behaviors can be tested with either
+	 * SECCOMP_RET_TRACE+PTRACE_CONT or plain ptrace()+PTRACE_SYSCALL.
+	 * This indicates if we should use SECCOMP_RET_TRACE (false), or
+	 * ptrace (true).
+	 */
+	bool use_ptrace;
+
+	/*
+	 * Some archs (like ppc) only support changing the return code during
+	 * syscall exit when ptrace is used.  As the syscall number might not
+	 * be available anymore during syscall exit, it needs to be saved
+	 * during syscall enter.
+	 */
+	int syscall_nr;
+};
+
+FIXTURE_VARIANT_ADD(TRACE_syscall, ptrace) {
+	.use_ptrace = true,
+};
+
+FIXTURE_VARIANT_ADD(TRACE_syscall, seccomp) {
+	.use_ptrace = false,
+};
+
 void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
 		   int status, void *args)
 {
 	int ret, nr;
 	unsigned long msg;
 	static bool entry;
+	FIXTURE_VARIANT(TRACE_syscall) * variant = args;
 
 	/*
 	 * The traditional way to tell PTRACE_SYSCALL entry/exit
@@ -1916,10 +1957,15 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
 	EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
 			: PTRACE_EVENTMSG_SYSCALL_EXIT, msg);
 
-	if (!entry)
+	if (!entry && !variant)
 		return;
 
-	nr = get_syscall(_metadata, tracee);
+	if (entry)
+		nr = get_syscall(_metadata, tracee);
+	else if (variant)
+		nr = variant->syscall_nr;
+	if (variant)
+		variant->syscall_nr = nr;
 
 	if (nr == __NR_getpid)
 		change_syscall(_metadata, tracee, __NR_getppid, 0);
@@ -1929,29 +1975,6 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
 		change_syscall(_metadata, tracee, -1, -ESRCH);
 }
 
-FIXTURE(TRACE_syscall) {
-	struct sock_fprog prog;
-	pid_t tracer, mytid, mypid, parent;
-};
-
-FIXTURE_VARIANT(TRACE_syscall) {
-	/*
-	 * All of the SECCOMP_RET_TRACE behaviors can be tested with either
-	 * SECCOMP_RET_TRACE+PTRACE_CONT or plain ptrace()+PTRACE_SYSCALL.
-	 * This indicates if we should use SECCOMP_RET_TRACE (false), or
-	 * ptrace (true).
-	 */
-	bool use_ptrace;
-};
-
-FIXTURE_VARIANT_ADD(TRACE_syscall, ptrace) {
-	.use_ptrace = true,
-};
-
-FIXTURE_VARIANT_ADD(TRACE_syscall, seccomp) {
-	.use_ptrace = false,
-};
-
 FIXTURE_SETUP(TRACE_syscall)
 {
 	struct sock_filter filter[] = {
@@ -1992,7 +2015,9 @@ FIXTURE_SETUP(TRACE_syscall)
 	self->tracer = setup_trace_fixture(_metadata,
 					   variant->use_ptrace ? tracer_ptrace
 							       : tracer_seccomp,
-					   NULL, variant->use_ptrace);
+					   variant->use_ptrace ? (void *) variant
+							       : NULL,
+					   variant->use_ptrace);
 
 	ret = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
 	ASSERT_EQ(0, ret);
-- 
2.25.1

