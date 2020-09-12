Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0453E2679F6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 13:30:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpVm51xzLzDrBk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 21:30:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=K1BHHo1e; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpVH83ZmJzDqsv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 21:08:36 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id 34so8185559pgo.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 04:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=grGRfF2oc4Mrj7QbeeTIjwfyG+77vtq6pTEp1U/ruko=;
 b=K1BHHo1evlP7HOYg1ZAzFN6YM48ETae3xI7p7rULuTb/67o1w2O4DRWN5Of3sP+nNA
 1hp7xWjAewTidrGnugC/X0nQz1mf/c7PFnmJRbgewvDbBnJaFQM3m/iV9mMms3GpIJPH
 rvw0kaANVUvR5b4Wf+1UIc1c0gKVU9OgmMr6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=grGRfF2oc4Mrj7QbeeTIjwfyG+77vtq6pTEp1U/ruko=;
 b=IoKUxFVGzvesyw9b55XoyAaA4Smo9jouje8S/3J508XNlnQ6ANndVIWOzi7pFi4pBh
 pxPdcMkfDfzstM+t+t+ufVIO24q1LNA0lew2bjUo+KBSX4aeIhEtpDCTaXTQo1RxeBzz
 VdvpsCWZZlIzCyKf0q+JxDl8llnTC/1ONn07BFqYJ6GtSuOc1Rh389CLsDzsV6WEyTP7
 Y9RLEzyncybNYPGtllC9V9/KAljjfZrq2WCBRoi+dvOGlbTd4bsqRPQkAFAe4UIW0Fec
 q5hMEmTwXNVDtGopj74xQkxgtRLHcybkK+hj87AdAP6ARjamaV8lVurldgMxtRAG9WiI
 Dqdg==
X-Gm-Message-State: AOAM531r8W16SlF/8Fcepu214zKs1yfyUF8Fh/QJubvsUF2vlgKA5vWf
 U3qMnafjMbNkmlIyn2G5mb5VGA==
X-Google-Smtp-Source: ABdhPJz0lqRrd9ZAIbQNwHdMwokn/e8KIK1qcB2JeErSyyv6PiiwOqirwQ5yiqUysT88RrlcDZ8BVA==
X-Received: by 2002:aa7:8084:0:b029:13f:b82a:1725 with SMTP id
 v4-20020aa780840000b029013fb82a1725mr3857546pff.9.1599908914782; 
 Sat, 12 Sep 2020 04:08:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j20sm4905489pfh.146.2020.09.12.04.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 04:08:31 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 13/15] selftests/seccomp: powerpc: Set syscall return during
 ptrace syscall exit
Date: Sat, 12 Sep 2020 04:08:18 -0700
Message-Id: <20200912110820.597135-14-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200912110820.597135-1-keescook@chromium.org>
References: <20200912110820.597135-1-keescook@chromium.org>
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
 Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christian Brauner <christian@brauner.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some archs (like ppc) only support changing the return code during
syscall exit when ptrace is used. As the syscall number might not
be available anymore during syscall exit, it needs to be saved
during syscall enter. Adjust the ptrace tests to do this.

Reported-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Suggested-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Link: https://lore.kernel.org/linux-kselftest/20200911181012.171027-1-cascardo@canonical.com/
Fixes: 58d0a862f573 ("seccomp: add tests for ptrace hole")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 34 +++++++++++--------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index bbab2420d708..26c712c6a575 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1949,12 +1949,19 @@ void tracer_seccomp(struct __test_metadata *_metadata, pid_t tracee,
 
 }
 
+FIXTURE(TRACE_syscall) {
+	struct sock_fprog prog;
+	pid_t tracer, mytid, mypid, parent;
+	long syscall_nr;
+};
+
 void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
 		   int status, void *args)
 {
-	int ret, nr;
+	int ret;
 	unsigned long msg;
 	static bool entry;
+	FIXTURE_DATA(TRACE_syscall) *self = args;
 
 	/*
 	 * The traditional way to tell PTRACE_SYSCALL entry/exit
@@ -1968,24 +1975,23 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
 	EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
 			: PTRACE_EVENTMSG_SYSCALL_EXIT, msg);
 
-	if (!entry)
-		return;
-
-	nr = get_syscall(_metadata, tracee);
+	/*
+	 * Some architectures only support setting return values during
+	 * syscall exit under ptrace, and on exit the syscall number may
+	 * no longer be available. Therefore, save it here, and call
+	 * "change syscall and set return values" on both entry and exit.
+	 */
+	if (entry)
+		self->syscall_nr = get_syscall(_metadata, tracee);
 
-	if (nr == __NR_getpid)
+	if (self->syscall_nr == __NR_getpid)
 		change_syscall(_metadata, tracee, __NR_getppid, 0);
-	if (nr == __NR_gettid)
+	if (self->syscall_nr == __NR_gettid)
 		change_syscall(_metadata, tracee, -1, 45000);
-	if (nr == __NR_openat)
+	if (self->syscall_nr == __NR_openat)
 		change_syscall(_metadata, tracee, -1, -ESRCH);
 }
 
-FIXTURE(TRACE_syscall) {
-	struct sock_fprog prog;
-	pid_t tracer, mytid, mypid, parent;
-};
-
 FIXTURE_VARIANT(TRACE_syscall) {
 	/*
 	 * All of the SECCOMP_RET_TRACE behaviors can be tested with either
@@ -2044,7 +2050,7 @@ FIXTURE_SETUP(TRACE_syscall)
 	self->tracer = setup_trace_fixture(_metadata,
 					   variant->use_ptrace ? tracer_ptrace
 							       : tracer_seccomp,
-					   NULL, variant->use_ptrace);
+					   self, variant->use_ptrace);
 
 	ret = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
 	ASSERT_EQ(0, ret);
-- 
2.25.1

