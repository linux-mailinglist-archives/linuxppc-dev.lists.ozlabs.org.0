Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 477C52679E9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 13:19:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpVWr5zPyzDqpK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 21:19:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=LqQ/QyMb; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpVH23bY1zDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 21:08:30 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id 34so8185486pgo.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 04:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jbIVGVeXL3UcD5Zx3+0sHrDQsZkQmD0nziWY3w5+YuI=;
 b=LqQ/QyMbPHbN/COohSTcKyMAKLl5cT78qQitFk8CTTS3dxBKp0xZo1Q2/Pnj7vV2qy
 RLb83+qRl281SbYQByqtCv58OW/cIMeoQuNZP7O7zHoBXuxMSUgD493bWxSJcqnwYYg9
 rLdRfx2N0xOFGRKseP1KmNGFygnsLvdtukIbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jbIVGVeXL3UcD5Zx3+0sHrDQsZkQmD0nziWY3w5+YuI=;
 b=FudkDFmPKNRn9vnEcUCV2uRMvA+/Ffh/VXNRyg7dAyXeGYTvCaTPIS6+O756CCTxte
 2SpMw2HC8p6jJlsyN55LQqO39vV9MEmKm/Hkz9I9dmuWrEdGEMTJYEv4ZCmi9ftWSFsv
 hBWYUH5GKhEsUqbQsLfC5Cl+xO51vlOik9PmbUQ4ywxeoWtaeQZesPx6SS7ne1pepiTX
 nqoqEn980/gJl5D1L7VVpJUhoCPPOr49WsJD8gRuH5ym05nozrvVaF0ynn0eYk2NXyw4
 Cjy4+iqVcs8KKCDBnuaRFK1VYpqfpWCQNhZt4WtlOTIiaUV0m23bPUzKRNRk/kFgIx13
 FbeA==
X-Gm-Message-State: AOAM531F6+znLDB1791OrWoxxEuFd3h0sCgJKzkEqS1exwlqX2fU7HOh
 Vi+Mqe3im4O9EZ0kyRIF1YPGig==
X-Google-Smtp-Source: ABdhPJxPd8dhUmxmmh/f8D3tYc3els9U203dCey201+Libct5mZfeDfZE6CqjRDTC4JFXw6rBxndIA==
X-Received: by 2002:a05:6a00:1b:b029:13e:d13d:a101 with SMTP id
 h27-20020a056a00001bb029013ed13da101mr5730307pfk.29.1599908908451; 
 Sat, 12 Sep 2020 04:08:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x20sm4980626pfr.190.2020.09.12.04.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 04:08:27 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 05/15] selftests/seccomp: arm64: Define SYSCALL_NUM_SET macro
Date: Sat, 12 Sep 2020 04:08:10 -0700
Message-Id: <20200912110820.597135-6-keescook@chromium.org>
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

Remove the arm64 special-case in change_syscall().

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 27 +++++++++----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 610fc036e374..cfa606d96086 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1717,6 +1717,18 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 #elif defined(__aarch64__)
 # define ARCH_REGS		struct user_pt_regs
 # define SYSCALL_NUM(_regs)	(_regs).regs[8]
+# ifndef NT_ARM_SYSTEM_CALL
+#  define NT_ARM_SYSTEM_CALL 0x404
+# endif
+# define SYSCALL_NUM_SET(_regs, _nr)				\
+	do {							\
+		struct iovec __v;				\
+		typeof(_nr) __nr = (_nr);			\
+		__v.iov_base = &__nr;				\
+		__v.iov_len = sizeof(__nr);			\
+		EXPECT_EQ(0, ptrace(PTRACE_SETREGSET, tracee,	\
+				    NT_ARM_SYSTEM_CALL, &__v));	\
+	} while (0)
 # define SYSCALL_RET(_regs)	(_regs).regs[0]
 #elif defined(__riscv) && __riscv_xlen == 64
 # define ARCH_REGS		struct user_regs_struct
@@ -1852,23 +1864,10 @@ void change_syscall(struct __test_metadata *_metadata,
 #if defined(__x86_64__) || defined(__i386__) || defined(__powerpc__) || \
 	defined(__s390__) || defined(__hppa__) || defined(__riscv) || \
 	defined(__xtensa__) || defined(__csky__) || defined(__sh__) || \
-	defined(__mips__) || defined(__arm__)
+	defined(__mips__) || defined(__arm__) || defined(__aarch64__)
 	{
 		SYSCALL_NUM_SET(regs, syscall);
 	}
-
-#elif defined(__aarch64__)
-# ifndef NT_ARM_SYSTEM_CALL
-#  define NT_ARM_SYSTEM_CALL 0x404
-# endif
-	{
-		iov.iov_base = &syscall;
-		iov.iov_len = sizeof(syscall);
-		ret = ptrace(PTRACE_SETREGSET, tracee, NT_ARM_SYSTEM_CALL,
-			     &iov);
-		EXPECT_EQ(0, ret);
-	}
-
 #else
 	ASSERT_EQ(1, 0) {
 		TH_LOG("How is the syscall changed on this architecture?");
-- 
2.25.1

