Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA39270BBB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 10:10:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Btjzt6K6szDqvZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 18:10:02 +1000 (AEST)
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
 header.s=google header.b=kD/ryGMR; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtjwC2DKkzDqrZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 18:06:49 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id x18so4208316pll.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 01:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nyn3p1AYDnBnQ4k/sfOfTwMI04kwqjnEmN1ZdkN/y18=;
 b=kD/ryGMRuv0D1dIxpRJqOu8zbrriTOfATRCXuG31vqWqYL2HVA/CmFftKhcfjg6OAh
 THvxy+oxlj4JaretrVlyZCpw90QqgsMbCh+vuxehWF43CuCeGbbZN7GWfX1FUJ/YSiQO
 1VGT4ayJpV2eNOsMs9f2C3di/YcgoPGjIQbfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nyn3p1AYDnBnQ4k/sfOfTwMI04kwqjnEmN1ZdkN/y18=;
 b=moG6s3HXpPYt3TJRrwtrE+JQ8NvBGZZv0uarwoAEd5ZBa0XN/dcxe0StXplE1EklY4
 Dhy+FizFJV1a6OEBDbLnMOhR5RpJYRu6gT6HLqnXHJHFjIugCP64q1CiN+uCthpJytIh
 AQ2W51vbGGNg1BK158on4WqmgtHzzV++p/xKMl+vCucZMi7hlHudfFvNxkxBOnx1LIhP
 LCVrYMnikrZzv9tNOqvJG/4qRidOAjJ2lMgnLgEymMhQnp4+LATxOAzz4e1s6ajabyxs
 ZG44PlEKqH+gLQrR7+1mGldQxG43w4uXvLbfNTmGvqNlcXz52NmHbanGPWfjHEzsHbmJ
 muVQ==
X-Gm-Message-State: AOAM533GIfWohaeH+DulWyGjNvf+Qx1q8BTblX5LIfKEuK6Hx/sBVuOz
 HcYnngWsH6x3kCTLUqxVwvNKBQ==
X-Google-Smtp-Source: ABdhPJzN+n3zupFhcjY/ktmA4F1rjsh5uKf1KCvEnujAg8mfVuhf7wd9EYSQZvOO+dyZ8v3HEcRy+g==
X-Received: by 2002:a17:902:8c89:b029:d2:1724:170d with SMTP id
 t9-20020a1709028c89b02900d21724170dmr711671plo.84.1600502807435; 
 Sat, 19 Sep 2020 01:06:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id n12sm5822899pgk.20.2020.09.19.01.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 01:06:45 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] selftests/seccomp: Allow syscall nr and ret value to
 be set separately
Date: Sat, 19 Sep 2020 01:06:35 -0700
Message-Id: <20200919080637.259478-3-keescook@chromium.org>
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

In preparation for setting syscall nr and ret values separately, refactor
the helpers to take a pointer to a value, so that a NULL can indicate
"do not change this respective value". This is done to keep the regset
read/write happening once and in one code path.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 59 +++++++++++++++----
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index c0311b4c736b..98ce5e8a6398 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1888,27 +1888,47 @@ int get_syscall(struct __test_metadata *_metadata, pid_t tracee)
 }
 
 /* Architecture-specific syscall changing routine. */
-void change_syscall(struct __test_metadata *_metadata,
-		    pid_t tracee, int syscall, int result)
+void __change_syscall(struct __test_metadata *_metadata,
+		    pid_t tracee, long *syscall, long *ret)
 {
 	ARCH_REGS orig, regs;
 
+	/* Do not get/set registers if we have nothing to do. */
+	if (!syscall && !ret)
+		return;
+
 	EXPECT_EQ(0, ARCH_GETREGS(regs)) {
 		return;
 	}
 	orig = regs;
 
-	SYSCALL_NUM_SET(regs, syscall);
+	if (syscall)
+		SYSCALL_NUM_SET(regs, *syscall);
 
-	/* If syscall is skipped, change return value. */
-	if (syscall == -1)
-		SYSCALL_RET_SET(regs, result);
+	if (ret)
+		SYSCALL_RET_SET(regs, *ret);
 
 	/* Flush any register changes made. */
 	if (memcmp(&orig, &regs, sizeof(orig)) != 0)
 		EXPECT_EQ(0, ARCH_SETREGS(regs));
 }
 
+/* Change only syscall number. */
+void change_syscall_nr(struct __test_metadata *_metadata,
+		       pid_t tracee, long syscall)
+{
+	__change_syscall(_metadata, tracee, &syscall, NULL);
+}
+
+/* Change syscall return value (and set syscall number to -1). */
+void change_syscall_ret(struct __test_metadata *_metadata,
+			pid_t tracee, long ret)
+{
+	long syscall = -1;
+
+	__change_syscall(_metadata, tracee, &syscall, &ret);
+}
+
 void tracer_seccomp(struct __test_metadata *_metadata, pid_t tracee,
 		    int status, void *args)
 {
@@ -1924,17 +1944,17 @@ void tracer_seccomp(struct __test_metadata *_metadata, pid_t tracee,
 	case 0x1002:
 		/* change getpid to getppid. */
 		EXPECT_EQ(__NR_getpid, get_syscall(_metadata, tracee));
-		change_syscall(_metadata, tracee, __NR_getppid, 0);
+		change_syscall_nr(_metadata, tracee, __NR_getppid);
 		break;
 	case 0x1003:
 		/* skip gettid with valid return code. */
 		EXPECT_EQ(__NR_gettid, get_syscall(_metadata, tracee));
-		change_syscall(_metadata, tracee, -1, 45000);
+		change_syscall_ret(_metadata, tracee, 45000);
 		break;
 	case 0x1004:
 		/* skip openat with error. */
 		EXPECT_EQ(__NR_openat, get_syscall(_metadata, tracee));
-		change_syscall(_metadata, tracee, -1, -ESRCH);
+		change_syscall_ret(_metadata, tracee, -ESRCH);
 		break;
 	case 0x1005:
 		/* do nothing (allow getppid) */
@@ -1961,6 +1981,8 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
 	int ret;
 	unsigned long msg;
 	static bool entry;
+	long syscall_nr_val, syscall_ret_val;
+	long *syscall_nr = NULL, *syscall_ret = NULL;
 	FIXTURE_DATA(TRACE_syscall) *self = args;
 
 	/*
@@ -1987,17 +2009,30 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
 	else
 		return;
 
+	syscall_nr = &syscall_nr_val;
+	syscall_ret = &syscall_ret_val;
+
+	/* Now handle the actual rewriting cases. */
 	switch (self->syscall_nr) {
 	case __NR_getpid:
-		change_syscall(_metadata, tracee, __NR_getppid, 0);
+		syscall_nr_val = __NR_getppid;
+		/* Never change syscall return for this case. */
+		syscall_ret = NULL;
 		break;
 	case __NR_gettid:
-		change_syscall(_metadata, tracee, -1, 45000);
+		syscall_nr_val = -1;
+		syscall_ret_val = 45000;
 		break;
 	case __NR_openat:
-		change_syscall(_metadata, tracee, -1, -ESRCH);
+		syscall_nr_val = -1;
+		syscall_ret_val = -ESRCH;
 		break;
+	default:
+		/* Unhandled, do nothing. */
+		return;
 	}
+
+	__change_syscall(_metadata, tracee, syscall_nr, syscall_ret);
 }
 
 FIXTURE_VARIANT(TRACE_syscall) {
-- 
2.25.1

