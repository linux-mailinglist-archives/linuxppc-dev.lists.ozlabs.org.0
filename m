Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A12412A81FE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 16:17:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRnFH6wj0zDqc6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 02:17:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pcyc77dF; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRmK73jVGzDr09
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 01:35:38 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id i26so1547840pgl.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 06:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YVWrZz/3DgzeNnVhELP22vBtoCxdRlVz4M7HtTATPDE=;
 b=pcyc77dFKLKKA8U03XWTt7ilnxZ5L+c6Xf5yG8IZ5JIklLrqli8tGgJXaKDqg7yTo0
 sLkd9oIw6gh3GrvBNsYCRkZZVq8PfizZLQa4deKKhRh6At5Z+GlkIon4R1K7hP997cux
 CtJKbr01YoqUCVO5pOn7AQUgbGEHIsCPBvAFudt5HSMsref/T7tN6nVqetaAcT1KM358
 bZWw1OtZ4UfhJHK3eFJ7wLg4cwvpSwWe0I1OC5auCCGw7QVGTY/scb+S/UlowxUiWA52
 ViytW3isz65kJsaVYuYpgvoWSpj2SH+NC44xw0r20esC+UrefR4bONSkXb4BC9y9G1Lm
 zPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YVWrZz/3DgzeNnVhELP22vBtoCxdRlVz4M7HtTATPDE=;
 b=Zx4KLnMs416sqlJfIFVqBr0gJprQfkF0tU/nyHfQxncdnANIGzXfPske/2RF5UtEj4
 PBB1XAx65b7kDVuwfy9a5GJmWyorS3BzVMmzg0PVv32/NnT2AXJ7Ft6CucBQFzpaRhV6
 gEo1c1AWBsUHEXnx9syRwKZNJ6s0S0EnQu/XOf5ZoiZRWMOXeO8maHWmDDJzAcBo5zH9
 Uy6R5hZgD/9YtI15MLaxh8KTEEcUgQlIu3Iht2VKTs8LhZITap402H4PElDrvtIkKV0R
 K6dXOcjypOxESEP7ofBoKUUCJvN4rKGYl16uum5D0ZWlRw1Bybkm4ouhf7/0KRxe0Qa7
 iFAw==
X-Gm-Message-State: AOAM530ZtXtg6o+EBcX1lveQqQlSOlfAeIuJm7quxJNses7AR1ye9Rnf
 BkMWglPdmnlkXCNnI4l42PnGMStgQtxb3g==
X-Google-Smtp-Source: ABdhPJyY0x0lbt86CI4ZP/zH81DutDQujfZNIPAOY6Wv7mPITlILm62p+U2Ep+SW7VkjK/3+fJObnQ==
X-Received: by 2002:aa7:870e:0:b029:18b:f46:9ca9 with SMTP id
 b14-20020aa7870e0000b029018b0f469ca9mr2891450pfo.3.1604586935072; 
 Thu, 05 Nov 2020 06:35:35 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id n15sm2876771pgt.75.2020.11.05.06.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:35:34 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 18/18] powerpc/64s: move power4 idle entirely to C
Date: Fri,  6 Nov 2020 00:34:31 +1000
Message-Id: <20201105143431.1874789-19-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201105143431.1874789-1-npiggin@gmail.com>
References: <20201105143431.1874789-1-npiggin@gmail.com>
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

Christophe asked about doing this, most of the code is still in
asm but maybe it's slightly nicer? I don't know if it's worthwhile.
---
 arch/powerpc/kernel/idle.c        | 25 ++++++++++++++++++++-----
 arch/powerpc/kernel/idle_book3s.S | 22 ----------------------
 2 files changed, 20 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
index ae0e2632393d..849e77a45915 100644
--- a/arch/powerpc/kernel/idle.c
+++ b/arch/powerpc/kernel/idle.c
@@ -72,6 +72,9 @@ int powersave_nap;
 #ifdef CONFIG_PPC_970_NAP
 void power4_idle(void)
 {
+	unsigned long msr_idle = MSR_KERNEL|MSR_EE|MSR_POW;
+	unsigned long tmp1, tmp2;
+
 	if (!cpu_has_feature(CPU_FTR_CAN_NAP))
 		return;
 
@@ -84,13 +87,25 @@ void power4_idle(void)
 	if (cpu_has_feature(CPU_FTR_ALTIVEC))
 		asm volatile("DSSALL ; sync" ::: "memory");
 
-	power4_idle_nap();
-
+	asm volatile(
+"	ld	%0,PACA_THREAD_INFO(r13)		\n"
+"	ld	%1,TI_LOCAL_FLAGS(%0)			\n"
+"	ori	%1,%1,_TLF_NAPPING			\n"
+"	std	%1,TI_LOCAL_FLAGS(%0)			\n"
 	/*
-	 * power4_idle_nap returns with interrupts enabled (soft and hard).
-	 * to our caller with interrupts enabled (soft and hard). Our caller
-	 * can cope with either interrupts disabled or enabled upon return.
+	 * NAPPING bit is set, from this point onward nap_adjust_return() 
+	 * will cause interrupts to return to power4_idle_nap_return.
 	 */
+"1:	sync						\n"
+"	isync						\n"
+"	mtmsrd	%2					\n"
+"	isync						\n"
+"	b	1b					\n"
+"	.globl power4_idle_nap_return			\n"
+"power4_idle_nap_return:				\n"
+	: "=r"(tmp1), "=r"(tmp2)
+	: "r"(msr_idle)
+	);
 }
 #endif
 
diff --git a/arch/powerpc/kernel/idle_book3s.S b/arch/powerpc/kernel/idle_book3s.S
index 27d2e6a72ec9..d4047f3c672e 100644
--- a/arch/powerpc/kernel/idle_book3s.S
+++ b/arch/powerpc/kernel/idle_book3s.S
@@ -184,25 +184,3 @@ _GLOBAL(isa206_idle_insn_mayloss)
 	IDLE_STATE_ENTER_SEQ_NORET(PPC_SLEEP)
 2:	IDLE_STATE_ENTER_SEQ_NORET(PPC_WINKLE)
 #endif
-
-#ifdef CONFIG_PPC_970_NAP
-_GLOBAL(power4_idle_nap)
-	LOAD_REG_IMMEDIATE(r7, MSR_KERNEL|MSR_EE|MSR_POW)
-	ld	r9,PACA_THREAD_INFO(r13)
-	ld	r8,TI_LOCAL_FLAGS(r9)
-	ori	r8,r8,_TLF_NAPPING
-	std	r8,TI_LOCAL_FLAGS(r9)
-	/*
-	 * NAPPING bit is set, from this point onward power4_fixup_nap
-	 * will cause exceptions to return to power4_idle_nap_return.
-	 */
-1:	sync
-	isync
-	mtmsrd	r7
-	isync
-	b	1b
-
-	.globl power4_idle_nap_return
-power4_idle_nap_return:
-	blr
-#endif
-- 
2.23.0

