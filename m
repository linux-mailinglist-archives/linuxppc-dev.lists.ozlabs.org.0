Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC4933A9DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 04:17:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzM7575Wrz3cVJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 14:17:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tLMyetUO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tLMyetUO; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzM6h03NLz30LP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 14:17:30 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 205so2658281pgh.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 20:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CDJoUG1yLv0WyAFnf8ZykYSJsUDwHka1W1/1b/XD9EY=;
 b=tLMyetUO3K4qPdpAr0BSx6Zyhdb4TJQzMX8MUlHNcZojZymedZKIhOKtxDjW+FhX7z
 2pfosM/XAyUco/rrpC/U9V4+RrKFNBxSodIzdZHOWNnx39WAIwUIsEO0YeMWJahcr6ss
 KL1XVjTmlsTDlIuCbTKHxA3Yj68RiDCsrEaRErI5yaMIPR85Nh7By58PD0WyQrQvuDSB
 E2zBXCdgx/XoJvgrAFb6Fj1NAHmZ5hry+5s+EEe6noRT4y+Nvwbvf4yGHm7AvP+B0KZr
 rOXcKWwk6BpLvSMz/lpy03XxVmjQ+UBqY0RZWfQ6HRIPlULv5UFzRTlrqrrSEKZao4Bc
 rK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CDJoUG1yLv0WyAFnf8ZykYSJsUDwHka1W1/1b/XD9EY=;
 b=ZWpiiycOaJqgHQs/nMhfi5zo6eCgx3qtHSSMuzg7fV8ZWDRSDVCHGN8em2sLWENh1P
 2+uqxe/GFO5RCQaukQmr1eoaV7LcBDZCpYMnSS3D24YW2jaeXa61dhOfNNNNcM7n47uO
 K60VYMIElRaJkNyBk8QvW7ZFDK9Mu1Di9YZzx9PYeSEX9s/pdt1Ghn4NUav4FlzJXyOa
 F9kXKWQkpaFL71Yy0cvKgSCVPRz5qkBbdBk3TNv3Alycp5+HdToj3hsKoAsL6UX4/9Gx
 virpexzqxX9SOU9zrtoNZNSKBlso1VEQMo+hFtTG4Nm958E+1fLAB45nwXTZAi+jaG47
 RlnQ==
X-Gm-Message-State: AOAM5320RTQs+PrNzIeAXmlP7/AoNtk3QLWOilmEkHTKbvqCgjc0EFsI
 fOCbvbOM+zy5QnuvxfD3fRQ3/iu6Tjg=
X-Google-Smtp-Source: ABdhPJy9jsuU0uThIfATwH84yKwvo5h+v8VvDwjNey9LDaw1M1xYFNbE/340DNfwMgZ8da3RsbiAzg==
X-Received: by 2002:a63:e5d:: with SMTP id 29mr21115462pgo.450.1615778247947; 
 Sun, 14 Mar 2021 20:17:27 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 j22sm8517740pjz.3.2021.03.14.20.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 20:17:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/10] powerpc/syscall: switch user_exit_irqoff and
 trace_hardirqs_off order
Date: Mon, 15 Mar 2021 13:17:07 +1000
Message-Id: <20210315031716.3940350-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210315031716.3940350-1-npiggin@gmail.com>
References: <20210315031716.3940350-1-npiggin@gmail.com>
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
Cc: Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

user_exit_irqoff() -> __context_tracking_exit -> vtime_user_exit
warns in __seqprop_assert due to lockdep thinking preemption is enabled
because trace_hardirqs_off() has not yet been called.

Switch the order of these two calls, which matches their ordering in
interrupt_enter_prepare.

Fixes: 5f0b6ac3905f ("powerpc/64/syscall: Reconcile interrupts")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index c4dd4b8f9cfa..fbabb49888d3 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -43,11 +43,11 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
 
+	trace_hardirqs_off(); /* finish reconciling */
+
 	CT_WARN_ON(ct_state() == CONTEXT_KERNEL);
 	user_exit_irqoff();
 
-	trace_hardirqs_off(); /* finish reconciling */
-
 	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
 		BUG_ON(!(regs->msr & MSR_RI));
 	BUG_ON(!(regs->msr & MSR_PR));
-- 
2.23.0

