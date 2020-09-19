Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 444E1270BB9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 10:08:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Btjy56TbvzDqv2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 18:08:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=NPIiKYAr; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtjwC1jv7zDqrW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 18:06:50 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id g29so4866451pgl.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 01:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=35YzUlNbVtiet2PZ45LS5yY7R0/2AJJr6WQjB9kb9DQ=;
 b=NPIiKYArpLnpWfZp2HXxYn+rhNR6sHO84+EVXiHS/T9DNxwqVpJsTgJu6e6UOqIac5
 bDkvvguK356n60RctscGCaXQ5NOApiENU+nr9wKDX2+G6Dwk6/Kt2ohTlILyR4XhG7Vd
 EmOtzDVI6LSIRYyfxPFLa8F7JELTXGEK7gbOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=35YzUlNbVtiet2PZ45LS5yY7R0/2AJJr6WQjB9kb9DQ=;
 b=t8ZWovlY+nS+DbILgYsGyHn8ldU4mjJqqofon5/6kzVEZ5WfJhj6JdwrmWOm0HcCjt
 +0Zrm0MylqCqk5fZEAi4jzRHGOMZImjTaZKywhh+JR5mZ1Mx8nI4aQOAoyCpCWidKQsf
 XORsm3RDsORDrpJieUvZiq3sI/+B9uk0Vd/ATVtyIS+SaSVjh1IFMBVr+wYah/6J98I/
 8b3+pAolv7ex7Yl0bsVkARnJlKAjlvkTHpPHkBGKSJHox9CdIdZCJ94HgtPmABfl5HXG
 7N4aBU1lmcYDzMLZVQJeLoSMYVhAEdvX2vDewtcI5UawQCPIydJCVzRXRw+FA6Kn+rb3
 0pBg==
X-Gm-Message-State: AOAM5331AQwokz/KxqDgIbpEoo29Rpa07ODzJP6cRSWbd9xU1LNXd25h
 2389pjzxfVdskNioDL+mlPtreg==
X-Google-Smtp-Source: ABdhPJyNRXL2Utm2uMp6p2aTrp/bIX0uxScQD/cHSmnwCqXqPd9T4QRySA1oqwyg3Lqotd99libtWg==
X-Received: by 2002:a65:6449:: with SMTP id s9mr21340653pgv.388.1600502806814; 
 Sat, 19 Sep 2020 01:06:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id e27sm5744480pfj.62.2020.09.19.01.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 01:06:45 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] selftests/seccomp: powerpc: Set syscall return during
 ptrace syscall exit
Date: Sat, 19 Sep 2020 01:06:36 -0700
Message-Id: <20200919080637.259478-4-keescook@chromium.org>
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

Some archs (like powerpc) only support changing the return code during
syscall exit when ptrace is used. Test entry vs exit phases for which
portions of the syscall number and return values need to be set at which
different phases. For non-powerpc, all changes are made during ptrace
syscall entry, as before. For powerpc, the syscall number is changed at
ptrace syscall entry and the syscall return value is changed on ptrace
syscall exit.

Reported-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Suggested-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Link: https://lore.kernel.org/linux-kselftest/20200911181012.171027-1-cascardo@canonical.com/
Fixes: 58d0a862f573 ("seccomp: add tests for ptrace hole")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 25 ++++++++++++++++---
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 98ce5e8a6398..894c2404d321 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1765,6 +1765,7 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 			(_regs).ccr &= ~0x10000000;		\
 		}						\
 	} while (0)
+# define SYSCALL_RET_SET_ON_PTRACE_EXIT
 #elif defined(__s390__)
 # define ARCH_REGS		s390_regs
 # define SYSCALL_NUM(_regs)	(_regs).gprs[2]
@@ -1853,6 +1854,18 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 	} while (0)
 #endif
 
+/*
+ * Some architectures (e.g. powerpc) can only set syscall
+ * return values on syscall exit during ptrace.
+ */
+const bool ptrace_entry_set_syscall_nr = true;
+const bool ptrace_entry_set_syscall_ret =
+#ifndef SYSCALL_RET_SET_ON_PTRACE_EXIT
+	true;
+#else
+	false;
+#endif
+
 /*
  * Use PTRACE_GETREGS and PTRACE_SETREGS when available. This is useful for
  * architectures without HAVE_ARCH_TRACEHOOK (e.g. User-mode Linux).
@@ -2006,11 +2019,15 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
 	 */
 	if (entry)
 		self->syscall_nr = get_syscall(_metadata, tracee);
-	else
-		return;
 
-	syscall_nr = &syscall_nr_val;
-	syscall_ret = &syscall_ret_val;
+	/*
+	 * Depending on the architecture's syscall setting abilities, we
+	 * pick which things to set during this phase (entry or exit).
+	 */
+	if (entry == ptrace_entry_set_syscall_nr)
+		syscall_nr = &syscall_nr_val;
+	if (entry == ptrace_entry_set_syscall_ret)
+		syscall_ret = &syscall_ret_val;
 
 	/* Now handle the actual rewriting cases. */
 	switch (self->syscall_nr) {
-- 
2.25.1

