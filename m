Return-Path: <linuxppc-dev+bounces-3089-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9409C36FF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2024 04:23:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xmvyl2wBQz2yZ5;
	Mon, 11 Nov 2024 14:23:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731295423;
	cv=none; b=KZzolMoKgCD2R/A7kRH2kVIyQvQFkVwgGs5kHRNbFygfuJF10UgT6JmrZwnCs5F4BzM7EMzs9u7r14MUDXXC02+AZfRRNS1p6c65uPJEU1g4kUgtUFnsWrr52L+NF7cT+vkqLnNvovkklEjmIPyxx8JBxRDv+TtcCha1rCa71k6oy0GtRGid+zRa1y3v/gCb/ztgZyBcgskWD1C4rAEx4sQsO4ZBYzgLfndq187jB8ise4U5Y/KfmCsLf3gZ1pV6Tj2jE8enUcXn9VsostyOCV24vG/yxEVP58LPgxxEZQ7UebBuoDykvKyNKu3+X1LeiEtUpB1wM/mpQP5Xu58u7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731295423; c=relaxed/relaxed;
	bh=d+wMLfPxNHxJ7phrptyu/3OJ+BH6UzV8ou42vl0csj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3LgABnvU8N1f0R5RV5WjJOF3EFV6WOvSEhqcSoyCZKtcWcYDnof7D2OHgjON3LM+NCs29WW7mSLSauj5zNSVHuT4JRK3qzY5vUsQQIZ68arB8fA1dItWiARpoHXtLmvL2aatNXE+1Eo8/C3IvmSPQlO3+j4W1PFZmbI+1m7RjMkECAPWbjcDCxjftX6rZ7PzpVKb/txdqWXiOWs0bgz3dYDlROcEU1xG+OJQcSJgUfwxYUp8tSI9qMi25Uux/wuENcVIEfJS3V63YasgYYL1A6bqpHWpFQuFFoIpYNa/QOeOabiV1p1HU2EiGe8YRLDKu+5mkbBAcY0rYP58+FzPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn; spf=pass (client-ip=54.254.200.128; helo=smtpbgsg2.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org) smtp.mailfrom=shingroup.cn
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=shingroup.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shingroup.cn (client-ip=54.254.200.128; helo=smtpbgsg2.qq.com; envelope-from=luming.yu@shingroup.cn; receiver=lists.ozlabs.org)
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xmvyk3bZdz2yZ1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 14:23:42 +1100 (AEDT)
X-QQ-mid: bizesmtpsz5t1731295385ts11owj
X-QQ-Originating-IP: /GbQ/HB/INrFDZmzy9qkrIEl2FAoqRZXE+uqupwHtag=
Received: from HX09040029.powercore.com.cn ( [116.233.136.127])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 11 Nov 2024 11:22:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8040518500708632268
From: Luming Yu <luming.yu@shingroup.cn>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: [PATCH v2 8/8] powerpc/entry: fix ppc syscall entry issues for common entry
Date: Mon, 11 Nov 2024 11:19:40 +0800
Message-ID: <AD7BF1A62C0AD367+20241111031934.1579-16-luming.yu@shingroup.cn>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20241111031934.1579-2-luming.yu@shingroup.cn>
References: <20241111031934.1579-2-luming.yu@shingroup.cn>
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
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Mb4RgdP5R+YFL4OWP+Z3hgokEAcqPRcy+45Qc3tKZP7hH8yQB8OrTNzl
	NX0VKVK5ikOoxEx7IwWfYgJPyf+273ui2Wh8urebXFPzN4IhjpYTxu34MNzcuzo65nXZdKU
	+VOmtEM977KDmLnyIkq1cnKmu2rKWqbnxcKTzkvcw+VbSiVzN61Ipq1t3TzJUBIfsOjOcFa
	TjguVfgaMVwAkAkQJcLpa6J5VbqDcnAz5vX9PiKOzPoWclVbcbNBBjqzlZ+zssn2rbem7tE
	77saG4z0L8IIlsjN6+oO2YxfUMhxgFQms0RUA0svD3n4yC11K1ihLXhjlyrF3+FBF8w97JV
	z2kflxt14KxgVO3SsJ1foRgy2me5uS37IUOzdAJl99jVWiIZ06d1yphfUiUVBBm/6WmhADY
	JysBRNtJi/qBeWS2yUtIhqLg5GmbcX6soe1ZtxnmsyU2N3XaQrMWuusrXsrmwj2ehGGsFpP
	OmO+ijS8Y/8Y2XIJTbPM3ucIyidyhyRHdPNT0KWaunwjW6H3Q5aORjuK+bBp8DvKOx9wiiO
	ADvfMcrkZEBUqA/8uSfr87QbLrqk0F+fPbGMb460UZDQn13ZymUGE7VZ91lukbkakHuknVE
	/UJg8bOBcNBUe/cxiqLJZ/AZOcHOb3JVuzqPPJD3H2l960LJr9IgW2Wtf6l/1tmeI8wsnhd
	EZtLy4UUBpTz80h0P7vAEafkzH5aW9T307kBqOtvxUdZdDGsdoVJ2JykgD+kwgLxRZh3SkS
	2rTc5EWIIBM4yLKkasUOMa2Z8w4LpnAS4spf5SRVPnyHlK5pi0VNjP6yHJ5t4XwSCxOr4dg
	M+SR6zTUL/kbpQmQ2ladQZJp671FbsOs00h1ihtWrPqzUOeU61vcyvzk24WksFYc5nQ0F2j
	pZnQo+bSpRV4Us3SbufI7Sl8EwGxdfgvL0m8MQFG750gSGbPTwvAVQV1S5TCN4Y2Wq+kiit
	dpv1oNJhnymCLkTvhtMoy39KxvtNFaE4RiNClcAkiQApr8L8lOPQ3b3Ma
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Yu Luming <luming.yu@gmail.com>

Due to the common layer and internal calls details are hidden from
the top level at the call side in ppc arch code, there are some
difficulties in preserving
all semantics implications of the original code in the patch. e.g  when
we got -1 returned
from syscall_enter_from_user_mode, without touching common code, we have
to do
our own inference to recover the reasonable route to return, in order to
have correct errno
and syscall work behaviors,that are tested in seccomp_bpf 98 test cases.

Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
---
 arch/powerpc/kernel/interrupt.c |  4 ++++
 arch/powerpc/kernel/syscall.c   | 28 +++++++++++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 2a5693b5f336..380697e35d3a 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -232,6 +232,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 {
 	unsigned long ti_flags;
 	unsigned long ret = 0;
+	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
 	bool is_not_scv = !IS_ENABLED(CONFIG_PPC_BOOK3S_64) || !scv;
 
 	CT_WARN_ON(ct_state() == CT_STATE_USER);
@@ -268,6 +269,9 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 
 	if (ti_flags & _TIF_SIGPENDING)
 		ret |= _TIF_RESTOREALL;
+
+	if (work)
+		ret |= _TIF_RESTOREALL;
 #ifdef CONFIG_PPC64
 	regs->exit_result = ret;
 #endif
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index dabe7f2b4bd4..358340f7fe75 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -18,6 +18,7 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 {
 	long ret;
 	syscall_fn f;
+	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
 
 	kuap_lock();
 
@@ -119,7 +120,7 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 
 	local_irq_enable();
 
-	if (unlikely(read_thread_flags() & _TIF_SYSCALL_DOTRACE)) {
+	if (work & SYSCALL_WORK_ENTER) {
 		if (unlikely(trap_is_unsupported_scv(regs))) {
 			/* Unsupported scv vector */
 			_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
@@ -132,7 +133,32 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 		 * and the test against NR_syscalls will fail and the return
 		 * value to be used is in regs->gpr[3].
 		 */
+		if (test_syscall_work(SECCOMP) &&
+				!test_syscall_work(SYSCALL_EMU))
+			regs->gpr[3] = -ENOSYS;
 		r0 = syscall_enter_from_user_mode(regs, r0);
+
+		if (test_syscall_work(SECCOMP)) {
+			if (r0 != -1)
+				regs->gpr[3] = regs->orig_gpr3;
+			else
+				goto skip;
+		}
+		if ((r0 == -1) && (test_syscall_work(SYSCALL_TRACE))) {
+			goto skip1;
+		}
+		if ((r0 == -1) && test_syscall_work(SYSCALL_EMU))
+			goto skip;
+		if (regs->gpr[0] >= NR_syscalls)
+			goto skip1;
+
+		r0 = regs->gpr[0];
+		if (r0 != -1)
+			goto skip;
+skip1:
+		r0 = -1;
+		regs->gpr[3] = -ENOSYS;
+skip:
 		if (unlikely(r0 >= NR_syscalls))
 			return regs->gpr[3];
 
-- 
2.42.0.windows.2


