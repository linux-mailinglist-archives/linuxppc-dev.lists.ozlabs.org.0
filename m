Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9942679E8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 13:18:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpVVC17F2zDqym
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 21:18:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=derYVmOC; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpVH20Ln6zDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 21:08:29 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id o16so2992414pjr.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 04:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QKhJot8+to6qKu+kMYm4kysaXKnRZz6+eVc9HFtoAC0=;
 b=derYVmOCJvHNh5vXBTIqRN639+QYp2Ima9wlNPyQ9WhsVt6z+ujiUK93WRnZUcsgJa
 56K/8/zjGpnrL9kAoptHwuckPAButJImWrCCwyiO9DiDVHsrbxalUoEMQIqQZVyppWc6
 Ee+YDqjRz8veoXRbQfqxsgmDU3EojdbmbMZp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QKhJot8+to6qKu+kMYm4kysaXKnRZz6+eVc9HFtoAC0=;
 b=Rc2hfOOQJCKG6Y1dTfLnY+Wrmo3BopDKiuElAM48xPSKIm0UQCfTaF4dWt6a2bunts
 +2t5YM505osqRgLIFmZ1ZgBHL3LM8ny1WKR1M87CI8uwCaxA2TJpB3DR+VSLH/McArYP
 6nEwT1sQ598SqvetheMWr2we/dNwmpv4vmgcNihuZR8FZpceX9GI+ljsmTJyJcSkigor
 S6WLQyy4swkGySoQSX1rhIxJLP4lkNCuxNi93Z9xvxP3fA//Fx7z5Sd00cfuYEqLdfgX
 UC2C8Xt1adVOXQyalDepJB71rjZAb+A9lRM6WRn4fVj53Y8vyinju+0EaEIMIUF/n44d
 06oA==
X-Gm-Message-State: AOAM531y9Sphs6PDx7Rv+ADRbm8uXz+DC5GkSH61WwQBqVmPGEgXh7IB
 vSwtwspaRtu3kRD+gYOyDjAJBQ==
X-Google-Smtp-Source: ABdhPJy+dZm2QFai7sfR0m9YcZtzGf7C5BX6vbAvfQk3QaGiefAxnuL3yTjBJPD1CaoCvlCi+ojigA==
X-Received: by 2002:a17:90b:3241:: with SMTP id
 jy1mr6101351pjb.10.1599908907078; 
 Sat, 12 Sep 2020 04:08:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id s8sm5388984pfd.153.2020.09.12.04.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 04:08:23 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 04/15] selftests/seccomp: arm: Define SYSCALL_NUM_SET macro
Date: Sat, 12 Sep 2020 04:08:09 -0700
Message-Id: <20200912110820.597135-5-keescook@chromium.org>
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

Remove the arm special-case in change_syscall().

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 02a9a6599746..610fc036e374 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1708,6 +1708,11 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 #elif defined(__arm__)
 # define ARCH_REGS		struct pt_regs
 # define SYSCALL_NUM(_regs)	(_regs).ARM_r7
+# ifndef PTRACE_SET_SYSCALL
+#  define PTRACE_SET_SYSCALL   23
+# endif
+# define SYSCALL_NUM_SET(_regs, _nr)	\
+		EXPECT_EQ(0, ptrace(PTRACE_SET_SYSCALL, tracee, NULL, _nr))
 # define SYSCALL_RET(_regs)	(_regs).ARM_r0
 #elif defined(__aarch64__)
 # define ARCH_REGS		struct user_pt_regs
@@ -1847,20 +1852,11 @@ void change_syscall(struct __test_metadata *_metadata,
 #if defined(__x86_64__) || defined(__i386__) || defined(__powerpc__) || \
 	defined(__s390__) || defined(__hppa__) || defined(__riscv) || \
 	defined(__xtensa__) || defined(__csky__) || defined(__sh__) || \
-	defined(__mips__)
+	defined(__mips__) || defined(__arm__)
 	{
 		SYSCALL_NUM_SET(regs, syscall);
 	}
 
-#elif defined(__arm__)
-# ifndef PTRACE_SET_SYSCALL
-#  define PTRACE_SET_SYSCALL   23
-# endif
-	{
-		ret = ptrace(PTRACE_SET_SYSCALL, tracee, NULL, syscall);
-		EXPECT_EQ(0, ret);
-	}
-
 #elif defined(__aarch64__)
 # ifndef NT_ARM_SYSTEM_CALL
 #  define NT_ARM_SYSTEM_CALL 0x404
-- 
2.25.1

