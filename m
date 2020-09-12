Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5089D2679E2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 13:13:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpVNV3XHHzDqmq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 21:13:14 +1000 (AEST)
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
 header.s=google header.b=Qf2k8aw+; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpVH04Lb1zDqt0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 21:08:28 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id f2so6184979pgd.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 04:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z1U82n+b6P1wGMlr0n/lm8DqFMBKpyd7dLyrkvRpbNk=;
 b=Qf2k8aw+QpxPUC+okglry6q3bVbH3jKZsyuLzav4/0cOGrbWLhJCSFaj1PEq6tcYip
 cuLmT6KIbM3WOoZcf0/LFo4j2n7CM514U3FYPw2+tttxkQZAULy8Rm5GeDsNU+3BKVoc
 NRHsw3rDvlbw+As6Aw0BRlGiWP+5YqgU+1uN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z1U82n+b6P1wGMlr0n/lm8DqFMBKpyd7dLyrkvRpbNk=;
 b=P3JRDNH2IyHQGoQbERycZRO4OIbI/qsBiJhLmMlHtzobmT19xw00oERaaNDp0Z40Za
 OKHIUcDOMsJV0UrKknJTSUg2CHqFBllexnSnoOkdkW6mYZmjvnuqGpPPxTAXY4odlBYa
 la6sVPl3BOg55e4IaTJKAxxoxbujnu5hxadLi216O/zoAq40iFWIqXaXE59kZMWOi5PB
 BVEz748gIiSLafAzdszmW29jRLPXHWF9Q70RVHuFL/7qAfWMgvvhPLjvQ6nnDCSwZfZi
 6PFgMls2P1+2vh7STgNIgIbEIeTz2ZAsyFBDFJeYy3yfSugb/PeHbqySnNuEpU2NhVfz
 +HEg==
X-Gm-Message-State: AOAM531cqCDfxCoRtG+qFK+1OuqMjV9CCu2SpL8mZOcjSsFz0khUNTuq
 UZx6RyhBmFJ/XzI2+Z/YPmer8g==
X-Google-Smtp-Source: ABdhPJyIeKXZzrcW8QXXXcIxMUHiRH2LjdHzWxFK1aSkuh5GSRlfE14+bSH/SUUsXgpGMgWZ3MHufQ==
X-Received: by 2002:a62:8011:: with SMTP id j17mr5948038pfd.98.1599908906421; 
 Sat, 12 Sep 2020 04:08:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id o1sm4788707pfg.83.2020.09.12.04.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 04:08:23 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 01/15] selftests/seccomp: Refactor arch register macros to
 avoid xtensa special case
Date: Sat, 12 Sep 2020 04:08:06 -0700
Message-Id: <20200912110820.597135-2-keescook@chromium.org>
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

To avoid an xtensa special-case, refactor all arch register macros to
take the register variable instead of depending on the macro expanding
as a struct member name.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 97 +++++++++----------
 1 file changed, 47 insertions(+), 50 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index c5002fc25b00..fef15080b575 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1698,64 +1698,64 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 }
 
 #if defined(__x86_64__)
-# define ARCH_REGS	struct user_regs_struct
-# define SYSCALL_NUM	orig_rax
-# define SYSCALL_RET	rax
+# define ARCH_REGS		struct user_regs_struct
+# define SYSCALL_NUM(_regs)	(_regs).orig_rax
+# define SYSCALL_RET(_regs)	(_regs).rax
 #elif defined(__i386__)
-# define ARCH_REGS	struct user_regs_struct
-# define SYSCALL_NUM	orig_eax
-# define SYSCALL_RET	eax
+# define ARCH_REGS		struct user_regs_struct
+# define SYSCALL_NUM(_regs)	(_regs).orig_eax
+# define SYSCALL_RET(_regs)	(_regs).eax
 #elif defined(__arm__)
-# define ARCH_REGS	struct pt_regs
-# define SYSCALL_NUM	ARM_r7
-# define SYSCALL_RET	ARM_r0
+# define ARCH_REGS		struct pt_regs
+# define SYSCALL_NUM(_regs)	(_regs).ARM_r7
+# define SYSCALL_RET(_regs)	(_regs).ARM_r0
 #elif defined(__aarch64__)
-# define ARCH_REGS	struct user_pt_regs
-# define SYSCALL_NUM	regs[8]
-# define SYSCALL_RET	regs[0]
+# define ARCH_REGS		struct user_pt_regs
+# define SYSCALL_NUM(_regs)	(_regs).regs[8]
+# define SYSCALL_RET(_regs)	(_regs).regs[0]
 #elif defined(__riscv) && __riscv_xlen == 64
-# define ARCH_REGS	struct user_regs_struct
-# define SYSCALL_NUM	a7
-# define SYSCALL_RET	a0
+# define ARCH_REGS		struct user_regs_struct
+# define SYSCALL_NUM(_regs)	(_regs).a7
+# define SYSCALL_RET(_regs)	(_regs).a0
 #elif defined(__csky__)
-# define ARCH_REGS	struct pt_regs
-#if defined(__CSKYABIV2__)
-# define SYSCALL_NUM	regs[3]
-#else
-# define SYSCALL_NUM	regs[9]
-#endif
-# define SYSCALL_RET	a0
+# define ARCH_REGS		struct pt_regs
+#  if defined(__CSKYABIV2__)
+#   define SYSCALL_NUM(_regs)	(_regs).regs[3]
+#  else
+#   define SYSCALL_NUM(_regs)	(_regs).regs[9]
+#  endif
+# define SYSCALL_RET(_regs)	(_regs).a0
 #elif defined(__hppa__)
-# define ARCH_REGS	struct user_regs_struct
-# define SYSCALL_NUM	gr[20]
-# define SYSCALL_RET	gr[28]
+# define ARCH_REGS		struct user_regs_struct
+# define SYSCALL_NUM(_regs)	(_regs).gr[20]
+# define SYSCALL_RET(_regs)	(_regs).gr[28]
 #elif defined(__powerpc__)
-# define ARCH_REGS	struct pt_regs
-# define SYSCALL_NUM	gpr[0]
-# define SYSCALL_RET	gpr[3]
+# define ARCH_REGS		struct pt_regs
+# define SYSCALL_NUM(_regs)	(_regs).gpr[0]
+# define SYSCALL_RET(_regs)	(_regs).gpr[3]
 #elif defined(__s390__)
-# define ARCH_REGS     s390_regs
-# define SYSCALL_NUM   gprs[2]
-# define SYSCALL_RET   gprs[2]
+# define ARCH_REGS		s390_regs
+# define SYSCALL_NUM(_regs)	(_regs).gprs[2]
+# define SYSCALL_RET(_regs)	(_regs).gprs[2]
 # define SYSCALL_NUM_RET_SHARE_REG
 #elif defined(__mips__)
-# define ARCH_REGS	struct pt_regs
-# define SYSCALL_NUM	regs[2]
-# define SYSCALL_SYSCALL_NUM regs[4]
-# define SYSCALL_RET	regs[2]
+# define ARCH_REGS		struct pt_regs
+# define SYSCALL_NUM(_regs)	(_regs).regs[2]
+# define SYSCALL_SYSCALL_NUM	regs[4]
+# define SYSCALL_RET(_regs)	(_regs).regs[2]
 # define SYSCALL_NUM_RET_SHARE_REG
 #elif defined(__xtensa__)
-# define ARCH_REGS	struct user_pt_regs
-# define SYSCALL_NUM	syscall
+# define ARCH_REGS		struct user_pt_regs
+# define SYSCALL_NUM(_regs)	(_regs).syscall
 /*
  * On xtensa syscall return value is in the register
  * a2 of the current window which is not fixed.
  */
-#define SYSCALL_RET(reg) a[(reg).windowbase * 4 + 2]
+#define SYSCALL_RET(_regs)	(_regs).a[(_regs).windowbase * 4 + 2]
 #elif defined(__sh__)
-# define ARCH_REGS	struct pt_regs
-# define SYSCALL_NUM	gpr[3]
-# define SYSCALL_RET	gpr[0]
+# define ARCH_REGS		struct pt_regs
+# define SYSCALL_NUM(_regs)	(_regs).gpr[3]
+# define SYSCALL_RET(_regs)	(_regs).gpr[0]
 #else
 # error "Do not know how to find your architecture's registers and syscalls"
 #endif
@@ -1804,10 +1804,10 @@ int get_syscall(struct __test_metadata *_metadata, pid_t tracee)
 #endif
 
 #if defined(__mips__)
-	if (regs.SYSCALL_NUM == __NR_O32_Linux)
+	if (SYSCALL_NUM(regs) == __NR_O32_Linux)
 		return regs.SYSCALL_SYSCALL_NUM;
 #endif
-	return regs.SYSCALL_NUM;
+	return SYSCALL_NUM(regs);
 }
 
 /* Architecture-specific syscall changing routine. */
@@ -1830,14 +1830,14 @@ void change_syscall(struct __test_metadata *_metadata,
 	defined(__s390__) || defined(__hppa__) || defined(__riscv) || \
 	defined(__xtensa__) || defined(__csky__) || defined(__sh__)
 	{
-		regs.SYSCALL_NUM = syscall;
+		SYSCALL_NUM(regs) = syscall;
 	}
 #elif defined(__mips__)
 	{
-		if (regs.SYSCALL_NUM == __NR_O32_Linux)
+		if (SYSCALL_NUM(regs) == __NR_O32_Linux)
 			regs.SYSCALL_SYSCALL_NUM = syscall;
 		else
-			regs.SYSCALL_NUM = syscall;
+			SYSCALL_NUM(regs) = syscall;
 	}
 
 #elif defined(__arm__)
@@ -1871,11 +1871,8 @@ void change_syscall(struct __test_metadata *_metadata,
 	if (syscall == -1)
 #ifdef SYSCALL_NUM_RET_SHARE_REG
 		TH_LOG("Can't modify syscall return on this architecture");
-
-#elif defined(__xtensa__)
-		regs.SYSCALL_RET(regs) = result;
 #else
-		regs.SYSCALL_RET = result;
+		SYSCALL_RET(regs) = result;
 #endif
 
 #ifdef HAVE_GETREGS
-- 
2.25.1

