Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFA4498289
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 15:41:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjCNS2P4Wz3cPh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 01:41:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PqjGu2aP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PqjGu2aP; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjCLR5qJFz30N0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 01:39:43 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id i8so15523031pgt.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 06:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JXg8E5Lndpzi6IklKyVrPNfHKkjhFg0trjH6MKcvRkU=;
 b=PqjGu2aPxjEU96qr16Z8EZt12kZq5PzGj/1JeJmVH2FJik59bzBUumkvKN5ZXiX8jR
 GKXDvMC1LVYMhTbS4eMKLlh33cCAWwMNr1Rc/fbFmDXqRxIiXrspT5SFJYTf5LcXaXrE
 /RHFAskNCLEuUTdf6r7d4j9S3EfV55w781Se3bKqcSlieuUjUIIRvxqRltFJplCuYSdh
 Mnsk+lnneOPizC0DsVcb0oeJRi+pRlvsB1gWHJyKUUj8NOt1YewMygwZ1ih4G6X2vRZg
 zL/bzcqMTIkZuxbBC0rQjDg/znUZDXBLnKhMcn1gudroGtIzCruvN3Iw2EZekidrFp3J
 mYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JXg8E5Lndpzi6IklKyVrPNfHKkjhFg0trjH6MKcvRkU=;
 b=nTfAqFQyaJaEtCjsySyVdWKWJNUHm0eELKNvzB74nfOQ96iOpI99VtIr58HAj+PPMN
 qhFNmsKZljGOpi6mAvmLYwS5/zxHh6kF/LV8zePUbOeRCEK6wKK7BGanLPsv2rUQ5zWp
 4ERDq2+HmHwGbgwdPP29iY8z09Dc/6xIwiF2ytV7+tXPyEYLmv5DneBIhJbRnlzaiYjt
 I7C4gWKIFRZSx3d5xGlrWiHgAG1BtsqhdrMlDn+G4a1DgkyU1qoFwK2cqOeta5B+j1/n
 geeFxiqyqvtscCnIBj1HEsBFLz0dOi7xuP9x3n1wHt1VsfCnv9qN4kxaspR+KN14O40d
 XwDw==
X-Gm-Message-State: AOAM532HWOYLT+csqfFrkMt06Vp//cgZStdd0OqcPXPMm6C9+35irM5U
 TVPay71Fwzogg569Y+8or/t0vpvrElE=
X-Google-Smtp-Source: ABdhPJw3Duklt5v/SfTcwYyMT+0noVnlmRJHy2E3gOOV7UaqKunYKmYURul7hJV0C4rvLXpwcmP6bw==
X-Received: by 2002:a63:7f12:: with SMTP id a18mr3157715pgd.453.1643035181032; 
 Mon, 24 Jan 2022 06:39:41 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id k16sm12748001pgm.26.2022.01.24.06.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 06:39:40 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/time: improve decrementer clockevent processing
Date: Tue, 25 Jan 2022 00:39:30 +1000
Message-Id: <20220124143930.3923442-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220124143930.3923442-1-npiggin@gmail.com>
References: <20220124143930.3923442-1-npiggin@gmail.com>
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

The stop/shutdown op should not use decrementer_set_next_event because
that sets decrementers_next_tb to now + decrementer_max, which means a
decrementer interrupt that occurs after that time will call the
clockevent event handler unexpectedly. Set next_tb to ~0 here to prevent
any clock event call. Init all clockevents to stopped.

Then the decrementer clockevent device always has event_handler set and
applicable because we know the clock event device was not stopped. So
make this call unconditional to show that it is always called. next_tb
need not be set to ~0 before the event handler is called because it will
stop the clockevent device if there is no other timer.

Finally, the timer broadcast interrupt should not modify next_tb because
it is not involved with the local decrementer clockevent on this CPU.

This doesn't fix a known bug, just tidies the code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/time.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 384f58a3f373..f3845601ab6a 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -107,7 +107,12 @@ struct clock_event_device decrementer_clockevent = {
 };
 EXPORT_SYMBOL(decrementer_clockevent);
 
-DEFINE_PER_CPU(u64, decrementers_next_tb);
+/*
+ * This always puts next_tb beyond now, so the clock event will never fire
+ * with the usual comparison, no need for a separate test for stopped.
+ */
+#define DEC_CLOCKEVENT_STOPPED ~0ULL
+DEFINE_PER_CPU(u64, decrementers_next_tb) = DEC_CLOCKEVENT_STOPPED;
 EXPORT_SYMBOL_GPL(decrementers_next_tb);
 static DEFINE_PER_CPU(struct clock_event_device, decrementers);
 
@@ -644,9 +649,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 
 	now = get_tb();
 	if (now >= *next_tb) {
-		*next_tb = ~(u64)0;
-		if (evt->event_handler)
-			evt->event_handler(evt);
+		evt->event_handler(evt);
 		__this_cpu_inc(irq_stat.timer_irqs_event);
 	} else {
 		now = *next_tb - now;
@@ -665,9 +668,6 @@ EXPORT_SYMBOL(timer_interrupt);
 #ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
 void timer_broadcast_interrupt(void)
 {
-	u64 *next_tb = this_cpu_ptr(&decrementers_next_tb);
-
-	*next_tb = ~(u64)0;
 	tick_receive_broadcast();
 	__this_cpu_inc(irq_stat.broadcast_irqs_event);
 }
@@ -893,7 +893,9 @@ static int decrementer_set_next_event(unsigned long evt,
 
 static int decrementer_shutdown(struct clock_event_device *dev)
 {
-	decrementer_set_next_event(decrementer_max, dev);
+	__this_cpu_write(decrementers_next_tb, DEC_CLOCKEVENT_STOPPED);
+	set_dec_or_work(decrementer_max);
+
 	return 0;
 }
 
-- 
2.23.0

