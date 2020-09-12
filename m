Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEAE2679F0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 13:25:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpVfr6DJTzDr4C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 21:25:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=NvsFIwxB; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpVH53RFtzDqsv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 21:08:33 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id d9so9092669pfd.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 04:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k9Scn27yFC+W9ArnzObQ75YlAm/mAi2yXdvN+WcxI8I=;
 b=NvsFIwxBor6gbhPRLZwb/jVT/T+nX6Z+XVHXFtFu/TcUGNP3/MncUQtopjc936YDWp
 R3xYst7NJXA6aVBOzW2yqYtx004tCHQMSEjrxUDj6uvghiw4gRHuKyf6orJdFpOnqppR
 k41JqT9G2h68b34eiIX80bwMoGJZHY/CSxIQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k9Scn27yFC+W9ArnzObQ75YlAm/mAi2yXdvN+WcxI8I=;
 b=tNeL0yIX4UxBSk7SXMCMcQKxNw3i5NsZ8xlI9ydI3mwbHDUJbMUF+4R1EpB6oVFudR
 LZwwIsI3KsZZTYeZtcNV3u3OISDaXIerD49Ov2jMONfIJsKHDkNTetfQgUBrKFpNmN8w
 TPhlCTtQAV744O7f2B/CkwlefU/Mglkv6cB/txvh2AXvBMlX16b3HpehFVZG8oYtPZsW
 RoTc4b94aDIYFO7h69TiLxoNSSg9kkDdW6Kt7jBIFzbB5F6oeh1CVWVJte5/U46Ok1ay
 uo8HOT2gqDd8RevUefgc3KyNl/k7R/OlUFlz4n6OcGaAtgVQbKyg2xQCgzjgaulUstDh
 ieDw==
X-Gm-Message-State: AOAM533XA3pudK7+2hlP5e9Fkg2FS69HOFkl8IQBsRrZZrjp2yxvvKe4
 RI2c0OIr+QG8JH5VzNS0GZOzsQ==
X-Google-Smtp-Source: ABdhPJxOfgT/KlEkxzDrBNa4LGCxQcYJ5lPhAwfQMk4WTnlFoUysQ4K+RWVpU1AXIS+4PLjRZ0yExg==
X-Received: by 2002:a63:60e:: with SMTP id 14mr4570723pgg.343.1599908911776;
 Sat, 12 Sep 2020 04:08:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x7sm4139666pjv.16.2020.09.12.04.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 04:08:27 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 09/15] selftests/seccomp: Convert REGSET calls into
 ARCH_GETREG/ARCH_SETREG
Date: Sat, 12 Sep 2020 04:08:14 -0700
Message-Id: <20200912110820.597135-10-keescook@chromium.org>
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

Consolidate the REGSET logic into the new ARCH_GETREG() and
ARCH_SETREG() macros, avoiding more #ifdef code in function bodies.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 42 +++++++------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index a986f2332327..d9346121b89b 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1828,26 +1828,29 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 #if defined(__x86_64__) || defined(__i386__) || defined(__mips__)
 # define ARCH_GETREGS(_regs)	ptrace(PTRACE_GETREGS, tracee, 0, &(_regs))
 # define ARCH_SETREGS(_regs)	ptrace(PTRACE_SETREGS, tracee, 0, &(_regs))
+#else
+# define ARCH_GETREGS(_regs)	({					\
+		struct iovec __v;					\
+		__v.iov_base = &(_regs);				\
+		__v.iov_len = sizeof(_regs);				\
+		ptrace(PTRACE_GETREGSET, tracee, NT_PRSTATUS, &__v);	\
+	})
+# define ARCH_SETREGS(_regs)	({					\
+		struct iovec __v;					\
+		__v.iov_base = &(_regs);				\
+		__v.iov_len = sizeof(_regs);				\
+		ptrace(PTRACE_SETREGSET, tracee, NT_PRSTATUS, &__v);	\
+	})
 #endif
 
 /* Architecture-specific syscall fetching routine. */
 int get_syscall(struct __test_metadata *_metadata, pid_t tracee)
 {
 	ARCH_REGS regs;
-#ifdef ARCH_GETREGS
-	EXPECT_EQ(0, ARCH_GETREGS(regs)) {
-		return -1;
-	}
-#else
-	struct iovec iov;
 
-	iov.iov_base = &regs;
-	iov.iov_len = sizeof(regs);
-	EXPECT_EQ(0, ptrace(PTRACE_GETREGSET, tracee, NT_PRSTATUS, &iov)) {
-		TH_LOG("PTRACE_GETREGSET failed");
+	EXPECT_EQ(0, ARCH_GETREGS(regs)) {
 		return -1;
 	}
-#endif
 
 	return SYSCALL_NUM(regs);
 }
@@ -1857,18 +1860,10 @@ void change_syscall(struct __test_metadata *_metadata,
 		    pid_t tracee, int syscall, int result)
 {
 	ARCH_REGS regs;
-#ifdef ARCH_GETREGS
+
 	EXPECT_EQ(0, ARCH_GETREGS(regs)) {
 		return;
 	}
-#else
-	int ret;
-	struct iovec iov;
-	iov.iov_base = &regs;
-	iov.iov_len = sizeof(regs);
-	ret = ptrace(PTRACE_GETREGSET, tracee, NT_PRSTATUS, &iov);
-	EXPECT_EQ(0, ret);
-#endif
 
 	SYSCALL_NUM_SET(regs, syscall);
 
@@ -1881,14 +1876,7 @@ void change_syscall(struct __test_metadata *_metadata,
 #endif
 
 	/* Flush any register changes made. */
-#ifdef ARCH_SETREGS
 	EXPECT_EQ(0, ARCH_SETREGS(regs));
-#else
-	iov.iov_base = &regs;
-	iov.iov_len = sizeof(regs);
-	ret = ptrace(PTRACE_SETREGSET, tracee, NT_PRSTATUS, &iov);
-	EXPECT_EQ(0, ret);
-#endif
 }
 
 void tracer_seccomp(struct __test_metadata *_metadata, pid_t tracee,
-- 
2.25.1

