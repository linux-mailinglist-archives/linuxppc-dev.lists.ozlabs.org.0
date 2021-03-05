Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C0732EE2F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:17:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWYc3F9lz3gcJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:17:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WgjQLPaq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WgjQLPaq; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWMR2XHBz3dbc
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:08:19 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id fu20so2031417pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jk8vfy/yd/4qy8LE9BxE9tg9OnF6uS84O1SR+0v77vw=;
 b=WgjQLPaqu6aoKNSDRXtz8B18qbOh+7UvJgCd8fmmdBE2xEQNRWESSqnDEm2wCP3e23
 CPQq/BF7KwJhQujm8ylYnF74PEhzyxcKuaDw4sJNDeRMmz4PegRqku4QqCqmIX6UEeZZ
 78wgfGf/LSHagSETh+t9t5uI5RWrLGnPVn1WYy2SUZElHj/DUIwsIt0Rtv6JJ8ZxrxIO
 yHfNWdeTxRsHEmFhMycHpl1BoncOnw+iVpLxevDXNn6GYhd2c0bFmAM1lx1mxdEywzSg
 GrPiqzhTEWNi5vR5JqQ3yEVyNVtwRgWlWh490LjLhqjQoCkJVwyYKUnB4bn6CPDD3tc8
 OKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jk8vfy/yd/4qy8LE9BxE9tg9OnF6uS84O1SR+0v77vw=;
 b=g8MUCbfDvm+QBUVmuZYFMJIVnos3vIJUDMxZlRCFdgMMzf5P6SVCkywO5ZnYQjxubg
 QsKI8jciK8Oxpa0h6fwfa7xbbfr8n/tta7/Band3nW1PZlHkeaAidOtFML9fCrbl75Wm
 yKs1f8y55nRK1mp/BGfA64yMBZYRT3X8sBANODuNsqx63SbBFBVmB4MkaXxmni/p/52d
 7uiTk0nEaq4aPsPqt8rnCItg2+KItCVPep51ZV64q8WPH7JImTUI0uU1OuJsjBOqDq1j
 30XTrlgIKvULGEr4WqDGK1GlFeTc7KbYS3Y1U/VI5nfx+Dw1skZvg6RUFxIAx3fO1xd8
 cbrQ==
X-Gm-Message-State: AOAM530o+tkWZqbXcEC97Oi+SNVpfJxy9P9Clpb2ytVjlL14R1jHEeYE
 PXOMam7Sokd65EcY4hNT76QmdPfttAc=
X-Google-Smtp-Source: ABdhPJx5amxiiOZmSQTIOQLyBrW/VZXIOOtAOqAsBhKIbOG3wYYvK9tDB1FhuAbm+vzGhxsjgCJftg==
X-Received: by 2002:a17:90a:f403:: with SMTP id
 ch3mr9074018pjb.126.1614956897305; 
 Fri, 05 Mar 2021 07:08:17 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:08:16 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 24/41] powerpc: add set_dec_or_work API for safely updating
 decrementer
Date: Sat,  6 Mar 2021 01:06:21 +1000
Message-Id: <20210305150638.2675513-25-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210305150638.2675513-1-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Decrementer updates must always check for new irq work to avoid an
irq work decrementer interrupt being lost.

Add an API for this in the timer code so callers don't have to care
about details.

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

