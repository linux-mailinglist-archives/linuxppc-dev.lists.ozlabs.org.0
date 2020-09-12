Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE422679F8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 13:31:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpVnv15bSzDr2y
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 21:31:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Fl2bqtSL; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpVH83BW3zDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 21:08:36 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id md22so3616079pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 04:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F4tHM0L8tNnxsWtLsTsMp6Ii6Rnl8nRf7R1d/DJ5GX0=;
 b=Fl2bqtSL2iiRfZluzSWOTXzNL8dmVQDhsUPUUB10qGGSvjXPumusHfP3CokhnSfKCH
 +t1jc2Q7OaXG85BoTd0A91s9q9C//+V6czJh5bMgwh6mcmDIOuQaMrCFly9wGejcGRUz
 s31sojad768defEHNH0ElcsN5owiLsEYQ0XZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F4tHM0L8tNnxsWtLsTsMp6Ii6Rnl8nRf7R1d/DJ5GX0=;
 b=CBk59GOMEtUnN+z75MPtIBx+ZFpvztUxFG+k+IlSQ7LQxiXJWIs0T8mUDYNOuKxHbM
 UERkjCecWtkD677ho6gVrUo2zUrM+wgr0wpW4mk7ZatCvYC3pg3GNUop84/BomeVLvzJ
 o2G4r2/a99hH/4LPV0R3Ku5dj1hUxQYcXjLY0BDwaMxF4szK+G27GhxbY7hcIaXCDR0M
 t//O1f/GvINXqqmcCy5fpohzyz28mFkWVGoo40SKWXNUTzD8m8F2sJV19kK2r/keYiHp
 dIipndNUriQ/D7Il4MfX6MGRBLLHrssMKp9fOySBtrQ6F6pbWMgJ1lTbLSPVKltQ6ZpK
 VISA==
X-Gm-Message-State: AOAM532vzErdFH64bClmYlJ9vOz1hED+XaZhBh0q8jOmvwtrlmQQcrT6
 muGJw45KLNrj9PPZA3gl+BEN7Q==
X-Google-Smtp-Source: ABdhPJxIVZvhB1EkQWrlPCCU/1v4hWzLbZ0KeU8jimuCS6pLb+8hNC5hU2kfhglj/9om5Lrdkt4vIA==
X-Received: by 2002:a17:90b:374b:: with SMTP id
 ne11mr5637226pjb.21.1599908913988; 
 Sat, 12 Sep 2020 04:08:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m24sm4069132pgn.44.2020.09.12.04.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 04:08:27 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 11/15] selftests/seccomp: Remove SYSCALL_NUM_RET_SHARE_REG in
 favor of SYSCALL_RET_SET
Date: Sat, 12 Sep 2020 04:08:16 -0700
Message-Id: <20200912110820.597135-12-keescook@chromium.org>
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

Instead of special-casing the specific case of shared registers, create
a default SYSCALL_RET_SET() macro (mirroring SYSCALL_NUM_SET()), that
writes to the SYSCALL_RET register. For architectures that can't set the
return value (for whatever reason), they can define SYSCALL_RET_SET()
without an associated SYSCALL_RET() macro. This also paves the way for
architectures that need to do special things to set the return value
(e.g. powerpc).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 33 +++++++++++++------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 2790d9cd50f4..623953a53032 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1753,8 +1753,8 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 #elif defined(__s390__)
 # define ARCH_REGS		s390_regs
 # define SYSCALL_NUM(_regs)	(_regs).gprs[2]
-# define SYSCALL_RET(_regs)	(_regs).gprs[2]
-# define SYSCALL_NUM_RET_SHARE_REG
+# define SYSCALL_RET_SET(_regs, _val)			\
+		TH_LOG("Can't modify syscall return on this architecture")
 #elif defined(__mips__)
 # include <asm/unistd_nr_n32.h>
 # include <asm/unistd_nr_n64.h>
@@ -1776,8 +1776,8 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 		else					\
 			(_regs).regs[2] = _nr;		\
 	} while (0)
-# define SYSCALL_RET(_regs)	(_regs).regs[2]
-# define SYSCALL_NUM_RET_SHARE_REG
+# define SYSCALL_RET_SET(_regs, _val)			\
+		TH_LOG("Can't modify syscall return on this architecture")
 #elif defined(__xtensa__)
 # define ARCH_REGS		struct user_pt_regs
 # define SYSCALL_NUM(_regs)	(_regs).syscall
@@ -1804,9 +1804,26 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 		SYSCALL_NUM(_regs) = (_nr);	\
 	} while (0)
 #endif
+/*
+ * Most architectures can change the syscall return value by just
+ * writing to the SYSCALL_RET register. This is the default if not
+ * defined above. If an architecture cannot set the return value
+ * (for example when the syscall and return value register is
+ * shared), report it with TH_LOG() in an arch-specific definition
+ * of SYSCALL_RET_SET() above, and leave SYSCALL_RET undefined.
+ */
+#if !defined(SYSCALL_RET) && !defined(SYSCALL_RET_SET)
+# error "One of SYSCALL_RET or SYSCALL_RET_SET is needed for this arch"
+#endif
+#ifndef SYSCALL_RET_SET
+# define SYSCALL_RET_SET(_regs, _val)		\
+	do {					\
+		SYSCALL_RET(_regs) = (_val);	\
+	} while (0)
+#endif
 
 /* When the syscall return can't be changed, stub out the tests for it. */
-#ifdef SYSCALL_NUM_RET_SHARE_REG
+#ifndef SYSCALL_RET
 # define EXPECT_SYSCALL_RETURN(val, action)	EXPECT_EQ(-1, action)
 #else
 # define EXPECT_SYSCALL_RETURN(val, action)		\
@@ -1870,11 +1887,7 @@ void change_syscall(struct __test_metadata *_metadata,
 
 	/* If syscall is skipped, change return value. */
 	if (syscall == -1)
-#ifdef SYSCALL_NUM_RET_SHARE_REG
-		TH_LOG("Can't modify syscall return on this architecture");
-#else
-		SYSCALL_RET(regs) = result;
-#endif
+		SYSCALL_RET_SET(regs, result);
 
 	/* Flush any register changes made. */
 	if (memcmp(&orig, &regs, sizeof(orig)) != 0)
-- 
2.25.1

