Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7F5270BC2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 10:14:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Btk5Q0SKbzDqxd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 18:14:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=jgNwfK9r; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtjwC34pvzDqrm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 18:06:51 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id bg9so4217244plb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 01:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mrLryApnJ9OrHIHAcwmpSGY4TxWSaJUHtyhtfo3Txxc=;
 b=jgNwfK9rxr13QjIMA849prWXlVCgyfZx2+W0ylmX0aAIoJx1/qaNXA3wOcHdeOJlUp
 2s3/qxs3FuB9H4lpwpHPrlrdp8/Q81BN9i8c12BTmQjY+cDMr1EtxTC2UPe4acoCa3T5
 NgH4X89TkMDe7v6pAN1GmhBpZYl1R92hWMTxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mrLryApnJ9OrHIHAcwmpSGY4TxWSaJUHtyhtfo3Txxc=;
 b=KXwoASEoj4bCsn3ijPC3nQ7eOwbQv80H+Yvfrt21Hif1IVAgCfOX22QiUbBSajkzuE
 RY7I4ybABH/0HyV/HPfWXv4U+YiiZvFP2uwlDwojsXZw6J5fr9lkNejk774BEruJvGmq
 JCpKUbeUAkAzVbn+FbrDZyJRunx+fR5lZo0qGk83q4U0lzoPcA1o8KBSq8GzMMdWy0Yx
 aRDHUpEKLzfNstUnHb865jGhORBA6X4mcZEI72gibz89W4SQJctGsrlA4igNDHL/gXdE
 33IQsEyQECMd2u+/TPVNph2zr8kIhfKypFLhosaRRDBI0QBIzN78YNQC62l2/ecvLMk+
 5Kkw==
X-Gm-Message-State: AOAM530uiKowrdnvBXMU/HBOAkPFsxGk9J14foNYbSRECRo7ze11Qg1t
 UO/7YnqkKocQIzb64qM8u4RHIg==
X-Google-Smtp-Source: ABdhPJxzGPHSPF8+6O/bh2fwfZiDgn7d7ypRGUb1tocspyrduFRi0uPCbZiKy5aQ8tiKYFmJtWgo5A==
X-Received: by 2002:a17:902:9041:b029:d0:cc02:8540 with SMTP id
 w1-20020a1709029041b02900d0cc028540mr35396678plz.41.1600502809446; 
 Sat, 19 Sep 2020 01:06:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m5sm4824996pjn.19.2020.09.19.01.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 01:06:45 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] selftests/seccomp: Record syscall during ptrace entry
Date: Sat, 19 Sep 2020 01:06:34 -0700
Message-Id: <20200919080637.259478-2-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200919080637.259478-1-keescook@chromium.org>
References: <20200919080637.259478-1-keescook@chromium.org>
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

In preparation for performing actions during ptrace syscall exit, save
the syscall number during ptrace syscall entry. Some architectures do
no have the syscall number available during ptrace syscall exit.

Suggested-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Link: https://lore.kernel.org/linux-kselftest/20200911181012.171027-1-cascardo@canonical.com/
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 40 +++++++++++++------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index bc0fb463c709..c0311b4c736b 100644
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
@@ -1968,24 +1975,31 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
 	EXPECT_EQ(entry ? PTRACE_EVENTMSG_SYSCALL_ENTRY
 			: PTRACE_EVENTMSG_SYSCALL_EXIT, msg);
 
-	if (!entry)
+	/*
+	 * Some architectures only support setting return values during
+	 * syscall exit under ptrace, and on exit the syscall number may
+	 * no longer be available. Therefore, save the initial sycall
+	 * number here, so it can be examined during both entry and exit
+	 * phases.
+	 */
+	if (entry)
+		self->syscall_nr = get_syscall(_metadata, tracee);
+	else
 		return;
 
-	nr = get_syscall(_metadata, tracee);
-
-	if (nr == __NR_getpid)
+	switch (self->syscall_nr) {
+	case __NR_getpid:
 		change_syscall(_metadata, tracee, __NR_getppid, 0);
-	if (nr == __NR_gettid)
+		break;
+	case __NR_gettid:
 		change_syscall(_metadata, tracee, -1, 45000);
-	if (nr == __NR_openat)
+		break;
+	case __NR_openat:
 		change_syscall(_metadata, tracee, -1, -ESRCH);
+		break;
+	}
 }
 
-FIXTURE(TRACE_syscall) {
-	struct sock_fprog prog;
-	pid_t tracer, mytid, mypid, parent;
-};
-
 FIXTURE_VARIANT(TRACE_syscall) {
 	/*
 	 * All of the SECCOMP_RET_TRACE behaviors can be tested with either
@@ -2044,7 +2058,7 @@ FIXTURE_SETUP(TRACE_syscall)
 	self->tracer = setup_trace_fixture(_metadata,
 					   variant->use_ptrace ? tracer_ptrace
 							       : tracer_seccomp,
-					   NULL, variant->use_ptrace);
+					   self, variant->use_ptrace);
 
 	ret = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
 	ASSERT_EQ(0, ret);
-- 
2.25.1

