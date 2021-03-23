Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D69E33454C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:15:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4D265y8Bz3d67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:15:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uWtFeu8E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uWtFeu8E; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Cnh4qvzz3by5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:04:40 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so9408060pjv.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RpgAHr4lPncc4R5huY2gufv6w8hrEYHtSJr/paKKtqw=;
 b=uWtFeu8Es0RvfJMJsETLxXicV1fOHor2vBEazg2o60jHN95FbgAlb2rG2+abqUWy8a
 tEArAF/jorgkSJ/X7iIOBfJH6Ex4KcYaz5fUcOXUNJBatWBge7JohZ0x+By5bydsdZjR
 gZuBuc/kOxszUp5NfliajaEpkRleSU+wiHEqD96q9/GauxEHXEE/Db7u36HT5sgrnwC0
 8MoOMMv90ZQKgiIE7qgg0gYzG9f5+/Hg+2pV8TSPaMdfQeeBTtyGJrFODytvesXQS3NS
 TXFWzksRh+zmpt/v/yr8yfb5A+7UJktHiw+vx1ZuvpJZffTEBgT5/XjpHVRB+T9yihJS
 1W7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RpgAHr4lPncc4R5huY2gufv6w8hrEYHtSJr/paKKtqw=;
 b=A36YonSpslsOO7CVM4rz2lcYekkxo3KUu/hkgpjFwZHsya07Seg5Iif8QJLzHq91Fz
 QdU6pOh7XXkXwbAYIwOZAqR0oH4GHeI2IGvUfQAq/yW6MfnLtebVRygwuVxiSM2FYOt9
 o3tRjWgUxfVHD+cPFl0X2stBBCyGGxrQ6cvUns8D0O/7rsO2VTYld7FxkZVKpjkcqWxN
 CEwSK242nLKo4kVFrSM5GGRfETXV17SENAv5ws546jlGEWqH83hfyuU7B0049R+6yvfV
 OmxrurGVAhE8LAs/K57/+imcAtsraAmL2sHImdI2c6Go/leMiaLoxnclpKcBY/HA1ddw
 ws8A==
X-Gm-Message-State: AOAM530/KG8YzacRmES7d3BNuVuGRdiBNZe/X84cMvmqFHja6SZNbia+
 aXK7MS8XsD6Hqs3BY+Vk8II=
X-Google-Smtp-Source: ABdhPJw1pEYA6GuXuGP0ehPlfFkdfhUHwMNPJ68hNEODejRzOlO7ltmQoR1bkvqKc2pNqR1xw/+ygQ==
X-Received: by 2002:a17:90a:bb81:: with SMTP id
 v1mr1803111pjr.123.1616461478726; 
 Mon, 22 Mar 2021 18:04:38 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:04:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 27/46] powerpc: add set_dec_or_work API for safely updating
 decrementer
Date: Tue, 23 Mar 2021 11:02:46 +1000
Message-Id: <20210323010305.1045293-28-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Decrementer updates must always check for new irq work to avoid an
irq work decrementer interrupt being lost.

Add an API for this in the timer code so callers don't have to care
about details.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/time.h |  9 +++++++++
 arch/powerpc/kernel/time.c      | 20 +++++++++++---------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 0128cd9769bc..d62bde57bf02 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -78,6 +78,15 @@ static inline void set_dec(u64 val)
 		mtspr(SPRN_DEC, val - 1);
 }
 
+#ifdef CONFIG_IRQ_WORK
+void set_dec_or_work(u64 val);
+#else
+static inline void set_dec_or_work(u64 val)
+{
+	set_dec(val);
+}
+#endif
+
 static inline unsigned long tb_ticks_since(unsigned long tstamp)
 {
 	return mftb() - tstamp;
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index c5d524622c17..341cc8442e5e 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -562,6 +562,15 @@ void arch_irq_work_raise(void)
 	preempt_enable();
 }
 
+void set_dec_or_work(u64 val)
+{
+	set_dec(val);
+	/* We may have raced with new irq work */
+	if (unlikely(test_irq_work_pending()))
+		set_dec(1);
+}
+EXPORT_SYMBOL_GPL(set_dec_or_work);
+
 #else  /* CONFIG_IRQ_WORK */
 
 #define test_irq_work_pending()	0
@@ -629,10 +638,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 	} else {
 		now = *next_tb - now;
 		if (now <= decrementer_max)
-			set_dec(now);
-		/* We may have raced with new irq work */
-		if (test_irq_work_pending())
-			set_dec(1);
+			set_dec_or_work(now);
 		__this_cpu_inc(irq_stat.timer_irqs_others);
 	}
 
@@ -874,11 +880,7 @@ static int decrementer_set_next_event(unsigned long evt,
 				      struct clock_event_device *dev)
 {
 	__this_cpu_write(decrementers_next_tb, get_tb() + evt);
-	set_dec(evt);
-
-	/* We may have raced with new irq work */
-	if (test_irq_work_pending())
-		set_dec(1);
+	set_dec_or_work(evt);
 
 	return 0;
 }
-- 
2.23.0

