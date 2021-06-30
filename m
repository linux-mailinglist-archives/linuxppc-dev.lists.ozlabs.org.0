Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DAB3B7E57
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 09:48:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFD4T42Vdz3dQg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 17:48:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dX9TUNtx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dX9TUNtx; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFD1t0mPyz2ysq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 17:46:42 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id u14so1405585pga.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 00:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IWBMjXBinn0yPYqP0cxTqwcLCJprYUYGTqwvGOKQk78=;
 b=dX9TUNtxzXoGG5RLvNoJA/PcYkPdrDFaXN+UDyRRPeH5gyIBEd+kFtcd6963k6Wri2
 nB23D44Dv1EUajVhbw2zGhxcljFEbHtyWdhJih9G4W+wC0aGjzpsMRLZCIMsgzDjPoVE
 D57d4P8oeJR5eeg6mSZspwxS7Y1N9spscjuug9KXp68C2PXKN7GsAEx84bqs2FdK3sLm
 V9IxGGbAQIBpgAkRduJ2aTDUOC9fJSYBW1H3b44hI+mjA8gN9SGD0ErPfkzroMvr+7Rv
 gcDoaMdwvyeI7Cp9w65kvuopiBDgoYUZIbVZEtPAdHPgGwsyR3/NUVnNyvRnXFAt+QDU
 mh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IWBMjXBinn0yPYqP0cxTqwcLCJprYUYGTqwvGOKQk78=;
 b=cC3vZLi8CaeXyb2iM/2BsZz6coKisM+e0V1hjt6kVIxrnJ5UG0fcMgEODADnXk7h5Q
 EiG0GCy6JEgD1YyQg+DkEIGDJBXUWbdS+kmgiMaI1RnESKR43VEPOPxw3Now+XdJg8OX
 AuzpqXX0rJBGXZF/tCbC0JbRq5ihowkumb1onekOBVPpNy1JSHtkyX88aaf+0Wb14360
 JxWuU4iGfQ0WKVX/tRf1XckIfgJ4HC9JZEO/LeW+6hnogIvWkQc5uw7/Nbvri2xjopD3
 kDhsxcQRfKsWkrSrrY/JfOnx5zx2dzjSxx0+t7Nupu8iBfiktyQyf8rc7q7zJCRvJkgV
 V+Bw==
X-Gm-Message-State: AOAM530BM45oTO0cYhkQGU9A8XpCmfsNb3/uNYuU5ksRHgDruAhXbH1n
 aQmB4bOv4Nsee71zmyORqiYMp8o+GQ4=
X-Google-Smtp-Source: ABdhPJycKqF9AIz+HaV2mGSxdrTPvXmHLA8dhehFitwn9gL1bIM+/heu2rGcIYuo3mqn4Z4qhrt8PQ==
X-Received: by 2002:a63:d06:: with SMTP id c6mr32225990pgl.121.1625039199500; 
 Wed, 30 Jun 2021 00:46:39 -0700 (PDT)
Received: from bobo.ibm.com (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id g4sm20503369pfu.134.2021.06.30.00.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 00:46:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 5/9] powerpc/64s/interrupt: preserve regs->softe for NMI
 interrupts
Date: Wed, 30 Jun 2021 17:46:17 +1000
Message-Id: <20210630074621.2109197-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210630074621.2109197-1-npiggin@gmail.com>
References: <20210630074621.2109197-1-npiggin@gmail.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If an NMI interrupt hits in an implicit soft-masked region, regs->softe
is modified to reflect that. This may not be necessary for correctness
at the moment, but it is less surprising and it's unhelpful when
debugging or adding checks.

Make sure this is changed back to how it was found before returning.

Fixes: 4ec5feec1ad0 ("powerpc/64s: Make NMI record implicitly soft-masked code as irqs disabled")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index d7df247a149c..789311d1e283 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -227,6 +227,7 @@ struct interrupt_nmi_state {
 	u8 irq_soft_mask;
 	u8 irq_happened;
 	u8 ftrace_enabled;
+	u64 softe;
 #endif
 };
 
@@ -252,6 +253,7 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 #ifdef CONFIG_PPC64
 	state->irq_soft_mask = local_paca->irq_soft_mask;
 	state->irq_happened = local_paca->irq_happened;
+	state->softe = regs->softe;
 
 	/*
 	 * Set IRQS_ALL_DISABLED unconditionally so irqs_disabled() does
@@ -311,6 +313,7 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 
 	/* Check we didn't change the pending interrupt mask. */
 	WARN_ON_ONCE((state->irq_happened | PACA_IRQ_HARD_DIS) != local_paca->irq_happened);
+	regs->softe = state->softe;
 	local_paca->irq_happened = state->irq_happened;
 	local_paca->irq_soft_mask = state->irq_soft_mask;
 #endif
-- 
2.23.0

