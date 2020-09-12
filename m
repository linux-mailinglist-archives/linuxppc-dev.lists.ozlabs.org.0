Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0052679ED
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 13:22:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpVbR3qNmzDr02
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 21:22:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=oKxTswLt; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpVH443jQzDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 21:08:32 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id g21so829829plq.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 04:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=92Q8oZHyAg95yaZcgBPqYzJZs65e2ppMcBco02q7zS4=;
 b=oKxTswLtIOK07XsveENLHZWzEqRRWXa47NwfzGG/t34zibm0+Q5y6KxKGUyKdfoQJm
 WcOstLYJHtY8SjcIiE3lEzI8GfTXVy2Q+3Wr6si7RPVCGD9IY0lOI6Bzu+EU1MuOCBr+
 vwWMsIRYqobBaUwMudq9qDyqwr6DmrbuVMorM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=92Q8oZHyAg95yaZcgBPqYzJZs65e2ppMcBco02q7zS4=;
 b=pZ0VXWHBdSCEJf4WMD3CIEyIbJeZbyYkygaSRoGV2PXxtOp757Oe9+g6physPA/GPn
 aJ+5QAS2xXGDfwmrQkDGq4pWMP/az5M2y+Czbqg+C77VHJ6G0QdAxNSl0UGuo8rTknno
 EAIyvq+gXd/Y2vn11EOYVoFBycQqyIEpLNFkXRC9veCdZ7dKatKXlkJKmwMKOmO645He
 ScTr6+p65SP0b85BuDZ6tDpyh0/Y8Z5JizuinA+iPHHtmlbqcf24S5YUoU1pqfFm8GEW
 UgptZ8ne136MNnE3sA6r1vL4uyQGD+aUJvzt36r/pr0H6dPhxFtKIaOlnEfedZD+N9hc
 TXHQ==
X-Gm-Message-State: AOAM530oe6oeXOZfB+PvwLy9URRnzlIGqgwVsImfModiujY6zv0jZ6MK
 6+A2EGy/Jx3dlG4/ukuhNUSywA==
X-Google-Smtp-Source: ABdhPJweZZl3gQqRJfY1jLrAEz5YsIr84x1nX2bdgki+nYDKxKRM+1q2OEofassUExMJ/pEA6/fMaQ==
X-Received: by 2002:a17:90a:ea0a:: with SMTP id
 w10mr5837835pjy.165.1599908910885; 
 Sat, 12 Sep 2020 04:08:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id nl10sm3907425pjb.11.2020.09.12.04.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 04:08:27 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 07/15] selftests/seccomp: Remove syscall setting #ifdefs
Date: Sat, 12 Sep 2020 04:08:12 -0700
Message-Id: <20200912110820.597135-8-keescook@chromium.org>
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

With all architectures now using the common SYSCALL_NUM_SET() macro, the
arch-specific #ifdef can be removed from change_syscall() itself.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index aa1c224371d1..3b77bdbe7125 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1865,20 +1865,9 @@ void change_syscall(struct __test_metadata *_metadata,
 	iov.iov_len = sizeof(regs);
 	ret = ptrace(PTRACE_GETREGSET, tracee, NT_PRSTATUS, &iov);
 #endif
-	EXPECT_EQ(0, ret) {}
+	EXPECT_EQ(0, ret);
 
-#if defined(__x86_64__) || defined(__i386__) || defined(__powerpc__) || \
-	defined(__s390__) || defined(__hppa__) || defined(__riscv) || \
-	defined(__xtensa__) || defined(__csky__) || defined(__sh__) || \
-	defined(__mips__) || defined(__arm__) || defined(__aarch64__)
-	{
-		SYSCALL_NUM_SET(regs, syscall);
-	}
-#else
-	ASSERT_EQ(1, 0) {
-		TH_LOG("How is the syscall changed on this architecture?");
-	}
-#endif
+	SYSCALL_NUM_SET(regs, syscall);
 
 	/* If syscall is skipped, change return value. */
 	if (syscall == -1)
@@ -1888,6 +1877,7 @@ void change_syscall(struct __test_metadata *_metadata,
 		SYSCALL_RET(regs) = result;
 #endif
 
+	/* Flush any register changes made. */
 #ifdef HAVE_GETREGS
 	ret = ptrace(PTRACE_SETREGS, tracee, 0, &regs);
 #else
-- 
2.25.1

