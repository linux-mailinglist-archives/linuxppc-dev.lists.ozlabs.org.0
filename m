Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E5B2679EF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 13:24:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpVd81lfyzDr4g
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 21:24:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=dIji5loM; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpVH52swczDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 21:08:33 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id bd2so2146138plb.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 04:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C4bs7CzTnl1kRyMgFNAx/cMdF4zfB7LMPrNYc0foUqg=;
 b=dIji5loM94lPX2BlTVOZY2wSfFrN4iEdIXvEB9ZXwb9K/O+5wmsPzNlErfm8yXGVnj
 TZPx65IreQCDy5KfHVk+h3ribfRTCS3w07xBw9RenEHHmWnwHiCYzDqMOh8nMd28EDm/
 Boz7+C1dQLQJ9R1+3Y82JwQo1BdlrCLDw68lI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C4bs7CzTnl1kRyMgFNAx/cMdF4zfB7LMPrNYc0foUqg=;
 b=phd8E0gnkr823XoV5LvQkEriYxeJBUR7B5qx/i3LLbG0cuTPVeJHYSu6JQEelnlX2g
 895x/Y88/U01F3flTRngxaB5xcAU5H9ENndAClS0EABJyRL3VQOaF0b5An/y41OagFHj
 AyDPEdrKbSTcuJT0UR/IQiiRR/BjmFLGW1jq2HGMx3teW4G/We41NEPuAYFu/M3GPxLY
 f26+AstHZSrmfTxKssBSg+RM/0tdwtXzhYppKocJFg8BP4YleH9MuhbfLpNbrfNxuA85
 w8vauyPbOFd9vrz1CRnVQktv4iRTCoHb72rqFQ0upPqtBuA378t6l6WSw20a1W92OIii
 ohvw==
X-Gm-Message-State: AOAM531NhJj2eJAv5DS/Z2uYJ4qr5mP3V5xs9E32HL8N9sGzKwJIOXDg
 zNE2iqiT9wf3LQMspAwQJiWIfw==
X-Google-Smtp-Source: ABdhPJx1tWnz+cXsPRMCEeezndnRWBXI9qrLyAtAljqVPQP8qrRmd00oQlT/nRtVdCFkQkBaLysfAw==
X-Received: by 2002:a17:902:c404:: with SMTP id
 k4mr5997422plk.70.1599908909955; 
 Sat, 12 Sep 2020 04:08:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id bx22sm4345524pjb.23.2020.09.12.04.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 04:08:27 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 08/15] selftests/seccomp: Convert HAVE_GETREG into
 ARCH_GETREG/ARCH_SETREG
Date: Sat, 12 Sep 2020 04:08:13 -0700
Message-Id: <20200912110820.597135-9-keescook@chromium.org>
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

Instead of special-casing the get/set-registers routines, move the
HAVE_GETREG logic into the new ARCH_GETREG() and ARCH_SETREG() macros.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 27 ++++++++++---------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 3b77bdbe7125..a986f2332327 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1821,20 +1821,21 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 	} while (0)
 #endif
 
-/* Use PTRACE_GETREGS and PTRACE_SETREGS when available. This is useful for
+/*
+ * Use PTRACE_GETREGS and PTRACE_SETREGS when available. This is useful for
  * architectures without HAVE_ARCH_TRACEHOOK (e.g. User-mode Linux).
  */
 #if defined(__x86_64__) || defined(__i386__) || defined(__mips__)
-#define HAVE_GETREGS
+# define ARCH_GETREGS(_regs)	ptrace(PTRACE_GETREGS, tracee, 0, &(_regs))
+# define ARCH_SETREGS(_regs)	ptrace(PTRACE_SETREGS, tracee, 0, &(_regs))
 #endif
 
 /* Architecture-specific syscall fetching routine. */
 int get_syscall(struct __test_metadata *_metadata, pid_t tracee)
 {
 	ARCH_REGS regs;
-#ifdef HAVE_GETREGS
-	EXPECT_EQ(0, ptrace(PTRACE_GETREGS, tracee, 0, &regs)) {
-		TH_LOG("PTRACE_GETREGS failed");
+#ifdef ARCH_GETREGS
+	EXPECT_EQ(0, ARCH_GETREGS(regs)) {
 		return -1;
 	}
 #else
@@ -1855,17 +1856,19 @@ int get_syscall(struct __test_metadata *_metadata, pid_t tracee)
 void change_syscall(struct __test_metadata *_metadata,
 		    pid_t tracee, int syscall, int result)
 {
-	int ret;
 	ARCH_REGS regs;
-#ifdef HAVE_GETREGS
-	ret = ptrace(PTRACE_GETREGS, tracee, 0, &regs);
+#ifdef ARCH_GETREGS
+	EXPECT_EQ(0, ARCH_GETREGS(regs)) {
+		return;
+	}
 #else
+	int ret;
 	struct iovec iov;
 	iov.iov_base = &regs;
 	iov.iov_len = sizeof(regs);
 	ret = ptrace(PTRACE_GETREGSET, tracee, NT_PRSTATUS, &iov);
-#endif
 	EXPECT_EQ(0, ret);
+#endif
 
 	SYSCALL_NUM_SET(regs, syscall);
 
@@ -1878,14 +1881,14 @@ void change_syscall(struct __test_metadata *_metadata,
 #endif
 
 	/* Flush any register changes made. */
-#ifdef HAVE_GETREGS
-	ret = ptrace(PTRACE_SETREGS, tracee, 0, &regs);
+#ifdef ARCH_SETREGS
+	EXPECT_EQ(0, ARCH_SETREGS(regs));
 #else
 	iov.iov_base = &regs;
 	iov.iov_len = sizeof(regs);
 	ret = ptrace(PTRACE_SETREGSET, tracee, NT_PRSTATUS, &iov);
-#endif
 	EXPECT_EQ(0, ret);
+#endif
 }
 
 void tracer_seccomp(struct __test_metadata *_metadata, pid_t tracee,
-- 
2.25.1

