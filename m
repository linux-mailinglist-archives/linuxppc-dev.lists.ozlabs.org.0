Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9671BD546
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 09:00:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BqD037bHzDqyG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 17:00:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jtnNbY/j; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Bq7r1JC7zDqNt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:57:11 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id hi11so394746pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 23:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rl/a8Tgu/fTx7PIQlRO+k5H/qjF2hwZBlTIIEOL9peY=;
 b=jtnNbY/jm1grs2ZEN6KRCjZbQFcOIx4WDqrZKanEDWp6oOQaNX7TDMB4sSq2rCt8o1
 z8hJatWqQj5j6cGN2ZAiO3+Hx+zUsI0/kYCZqSGmdkk5/w+OuTpf0yRH9+td3IOXtpVh
 y2WI76c/M6IOCVc2EvF1jPe3SH7ybFur7VGK56TRrIMaG04pYwLW8d2QMY6qbxftHBxT
 pXOBNcB2VehCbOsRWHgpXUmacviV/vT5Zw2KNbnn3/DBWQ/QuiQVl3vq5JKClg6R6ByD
 1SzjXPvMrp1nzuQWjoiWXZKZikWYylDUQoH6bRYSoQJMSEJTSdt18l+rNgQY+EgJAM7i
 8uLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rl/a8Tgu/fTx7PIQlRO+k5H/qjF2hwZBlTIIEOL9peY=;
 b=LJq5+kh1XwzJ05D/Kcc4CHKHSrNvVdQNMusDgKGm3JPrrTmtEHJBNoh4KMBA1PSvLp
 PatviVz4mHNW1N2AlNHf+5N+cvLfStRbVF0XCclMhFezQfO6PIUChsPMd3WU1JaggvYc
 EXqtRDMCR/6QnPUaAVPlb54tepXTtILbkWEYTRJff3OZT//mVuxbaVPI47PvZLcUXOnt
 tmdBzHDefm1tq1/r07DzOvXmXE0CRKTQr8J42SrwLh6yWlpOd9TS0ENAF8I8oz5YBEAL
 /3QucoISbLXcqVp/wwdZeOOJhtdyfsatUCYtJPpcAg/4Pji4t0XPfKBg8rHCguzZuQP7
 P4WQ==
X-Gm-Message-State: AGi0Puaer4ukNqFOpQIl6iuXasP1g3zLAf5awCQQj0Eh39JBZC8c4OJz
 to46HkmSlpPRVnJyqGobtDkeoYWR
X-Google-Smtp-Source: APiQypJqUGZ/N5ROgy1fMXOnSWdhteAqGo/gPPqH28FzQf0kWiX3imbC6EUDOsIgOO8LOGiG8yWvvA==
X-Received: by 2002:a17:90a:20a8:: with SMTP id
 f37mr1437381pjg.148.1588143429521; 
 Tue, 28 Apr 2020 23:57:09 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id a26sm254660pgd.68.2020.04.28.23.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 23:57:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] powerpc/64/kuap: move kuap checks out of MSR[RI]=0
 regions of exit code
Date: Wed, 29 Apr 2020 16:56:49 +1000
Message-Id: <20200429065654.1677541-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200429065654.1677541-1-npiggin@gmail.com>
References: <20200429065654.1677541-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Any kind of WARN causes a program check that will crash with
unrecoverable exception if it occurs when RI is clear.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/syscall_64.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 8f7e268f3294..a37c7717424f 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -35,6 +35,8 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(regs->softe != IRQS_ENABLED);
 
+	kuap_check_amr();
+
 	account_cpu_user_entry();
 
 #ifdef CONFIG_PPC_SPLPAR
@@ -47,8 +49,6 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	}
 #endif
 
-	kuap_check_amr();
-
 	/*
 	 * This is not required for the syscall exit path, but makes the
 	 * stack frame look nicer. If this was initialised in the first stack
@@ -142,6 +142,8 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	unsigned long ti_flags;
 	unsigned long ret = 0;
 
+	kuap_check_amr();
+
 	regs->result = r3;
 
 	/* Check whether the syscall is issued inside a restartable sequence */
@@ -218,8 +220,6 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	local_paca->tm_scratch = regs->msr;
 #endif
 
-	kuap_check_amr();
-
 	account_cpu_user_exit();
 
 	return ret;
@@ -242,6 +242,8 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(regs->softe != IRQS_ENABLED);
 
+	kuap_check_amr();
+
 	local_irq_save(flags);
 
 again:
@@ -298,8 +300,6 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	local_paca->tm_scratch = regs->msr;
 #endif
 
-	kuap_check_amr();
-
 	account_cpu_user_exit();
 
 	return ret;
@@ -319,6 +319,8 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	BUG_ON(regs->msr & MSR_PR);
 	BUG_ON(!FULL_REGS(regs));
 
+	kuap_check_amr();
+
 	if (unlikely(*ti_flagsp & _TIF_EMULATE_STACK_STORE)) {
 		clear_bits(_TIF_EMULATE_STACK_STORE, ti_flagsp);
 		ret = 1;
-- 
2.23.0

