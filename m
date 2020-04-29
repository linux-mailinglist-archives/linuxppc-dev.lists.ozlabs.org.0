Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBDE1BD4A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 08:29:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BpXH0218zDqVH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:29:51 +1000 (AEST)
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
 header.s=20161025 header.b=lzcIIqeT; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BpSD705SzDr3F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 16:26:20 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id 7so2000289pjo.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 23:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rl/a8Tgu/fTx7PIQlRO+k5H/qjF2hwZBlTIIEOL9peY=;
 b=lzcIIqeTRR/lXKIieV/qv8P41SnEbyAZeIIuYCVpTFNn/sRoXG8oo5R4c3Ja+9qLl8
 4oD+aa2+3Pt/hwjz98uhgHgvAQ1xSIDg0oki8meQcDeWNsQlFGjs4La1uezT3muM+GVM
 8HOVRvf/EkBF3ZWQn91Y72MnOfKeZJax2jonMWxJYes0eFTuv3ZaamUsvyaFf/8sSJMS
 ytsfKjkYW2PV11Nt4V36pT9iSexLUHL8NVgE2Rg6zCtJGNuVtZ9NcmAcRQv6G8T4BghL
 1hBF95yAI4csLoKSg7oTR0Jtj66/cf+HKpnBrHoFeJNI0ySiTAU2g+G+8ScHNiMEXZ29
 g+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rl/a8Tgu/fTx7PIQlRO+k5H/qjF2hwZBlTIIEOL9peY=;
 b=sD7uS63Sx8oWaY6suUv2S5DIS9kx5Rwv9fNH93GNoZf4muPcAMLptZv/jJGvDImvQF
 +tF52QozRMHV4YrVggalMo3zoArCWzvKRj8QLE6G026jrHDsYVwHZ4dYk/0/RrjMnYbR
 M5jbeNqiBepEopme1QZlJuUf6AEwz6YcrggvIDlMrdpZk8QE+cgvHzBpVpHjbJEmVYFG
 kNKF5FmnbXc2VZDEcC/MyaTwUPWu2P418CQE7Iih8RNTCK4Xu0rS8Lhg4GhYyo1FCT7/
 iPhBuRBQQW9zxbhOXiZvz+jUds5KiiLjLNm02POPraBHnZbANYchT0/sSvdipXIDCNBO
 RP+A==
X-Gm-Message-State: AGi0PuYkc+VfQVMLL8X51KmtjzDiMWgxvYIP2ROCoS49BVPjSgh2GJBu
 1htu51audeBhMq7zHVppLpxOaX6B
X-Google-Smtp-Source: APiQypJSkdJ1jfuv2K4t3hzdggGZGtS4V+YnLeb98T5Qsd0nnjCxXghTBacD5C2fY+MjyxajIE0u9Q==
X-Received: by 2002:a17:90a:3266:: with SMTP id
 k93mr1414793pjb.118.1588141577790; 
 Tue, 28 Apr 2020 23:26:17 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id s76sm164373pgc.85.2020.04.28.23.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 23:26:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] powerpc/64/kuap: move kuap checks out of MSR[RI]=0
 regions of exit code
Date: Wed, 29 Apr 2020 16:26:01 +1000
Message-Id: <20200429062607.1675792-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200429062607.1675792-1-npiggin@gmail.com>
References: <20200429062607.1675792-1-npiggin@gmail.com>
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

