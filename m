Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3734C229278
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:45:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBSDB0LdhzDr39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:44:58 +1000 (AEST)
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
 header.s=20161025 header.b=BW3YVI5t; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBS0T46ZMzDr4h
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 17:34:48 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id 8so721659pjj.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 00:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RQ89qsWOpO70EfJfQjJ4cxrSXLRJIs/eA5yjS5jCnts=;
 b=BW3YVI5t9+T3lGDMa8SO2Wsg6+QzUX5F4vSj5V2ThqizfX4wpHEKnlVxC6IQyxnUQ+
 WpG9W8IOpkYFXrFSoMLlDEJWJ8p46/HvfhOqRmXEuoljqx9J6v4sl7SFUTOuzqJdDH4z
 F5oD63NfG5+afSZxP20+l8mR6/UP1rb7d4nyLBKJQ8DF2jXTPllUouylSifEzHktCNpE
 grZtHIVeHLA1lPCEPB+/A8R905pP+qqBzM3edV4s5X/EiPgyyd1fx+39Ro4jvjI1+Thq
 BwTZTTD0QbVz3AY2seIWAkXGh0x4yGrloEKW+GSfN1hVlNU2M7q9j9FW6Z05qI3+aplP
 KXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RQ89qsWOpO70EfJfQjJ4cxrSXLRJIs/eA5yjS5jCnts=;
 b=Hx3Ybmq2rqmYYNi4P+X8dfIOXNUOGH+J0+zNXBBW+zQhsjrNHSiteFuNpio24wTciC
 QchyhBOrxVOuTO6gwMmWdCf1lonfhDsmKKqigLBf/dqGUyyXBDDfCWnGX43SDf+ZJvDB
 UuAewQheyQ5xCg4qS8MUt3+8GfX2Squwv721DQ6ca3jpfjZQyvhu1/yWAe8UcQM112qW
 5dQBimunJk7V5E07skqL6TB5x+WL90xcYIa5PcVyiYSB8ifPYYxhPrc0R/JCD6HiewG4
 XOUA974agQseSMIECpIj/W3sTdysdVz40eke/TlXfBWxwq0upSEV8JMQQFOAPuKFZTmd
 r4iQ==
X-Gm-Message-State: AOAM532G34cGW6IDnH/Y81xYNbZE0ezbRLNvqg85pDN8gsPOUSoo7hMZ
 jactH44ZZgPRJOx7qeHaAjar0hOl
X-Google-Smtp-Source: ABdhPJywmzDXt9hz69F7iLME0jPLBFhGM0DFYemUzIqCI5fjgpvBc5+c7mlrWCA0SvfIuy+eD8FFNg==
X-Received: by 2002:a17:90a:2dcb:: with SMTP id
 q11mr8764306pjm.135.1595403285520; 
 Wed, 22 Jul 2020 00:34:45 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (110-174-173-27.tpgi.com.au.
 [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id 19sm23073281pfy.193.2020.07.22.00.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 00:34:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Fix irq tracing corruption in interrupt/syscall
 return caused by perf interrupts
Date: Wed, 22 Jul 2020 17:34:37 +1000
Message-Id: <20200722073437.930521-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey reports lockdep_assert_irqs_enabled() warnings when stress testing perf, e.g.,

WARNING: CPU: 0 PID: 1556 at kernel/softirq.c:169 __local_bh_enable_ip+0x258/0x270
CPU: 0 PID: 1556 Comm: syz-executor
NIP:  c0000000001ec888 LR: c0000000001ec884 CTR: c000000000ef0610
REGS: c000000022d4f8a0 TRAP: 0700   Not tainted  (5.8.0-rc3-x)
MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28008844  XER: 20040000
CFAR: c0000000001dc1d0 IRQMASK: 0

The interesting thing is MSR[EE] and IRQMASK shows interrupts are enabled,
suggesting the current->hardirqs_enabled irq tracing state is going out of sync
with the actual interrupt enable state.

The cause is a window in interrupt/syscall return where irq tracing state is being
adjusted for an irqs-enabled return while MSR[EE] is still enabled. A perf
interrupt hits and ends up calling trace_hardirqs_off() when restoring
interrupt flags to a disable state.

Fix this by disabling perf interrupts as well while adjusting irq tracing state.

Add a debug check that catches the condition sooner.

Fixes: 68b34588e202 ("powerpc/64/sycall: Implement syscall entry/exit logic in C")
Reported-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

I can reproduce similar symptoms and this patch fixes my test case,
still trying to confirm Alexey's test case or whether there's another
similar bug causing it.

 arch/powerpc/kernel/syscall_64.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 79edba3ab312..6c6f88eff915 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -107,8 +107,13 @@ notrace long system_call_exception(long r3, long r4, long r5,
  */
 static notrace inline bool prep_irq_for_enabled_exit(void)
 {
-	/* This must be done with RI=1 because tracing may touch vmaps */
-	trace_hardirqs_on();
+	if (IS_ENABLED(CONFIG_TRACE_IRQFLAGS)) {
+		/* Prevent perf interrupts hitting and messing up the trace_hardirqs state */
+		irq_soft_mask_set(IRQS_ALL_DISABLED);
+
+		/* This must be done with RI=1 because tracing may touch vmaps */
+		trace_hardirqs_on();
+	}
 
 	/* This pattern matches prep_irq_for_idle */
 	__hard_EE_RI_disable();
@@ -123,6 +128,8 @@ static notrace inline bool prep_irq_for_enabled_exit(void)
 	local_paca->irq_happened = 0;
 	irq_soft_mask_set(IRQS_ENABLED);
 
+	lockdep_assert_irqs_enabled();
+
 	return true;
 }
 
-- 
2.23.0

