Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD39459FA0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 10:57:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz01H3H9Kz2yb7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 20:57:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mRNGB9wD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mRNGB9wD; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyzwB6YQPz2yn9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:52:58 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id y8so16625121plg.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RHbI/PXnrc5/sK6elKbbgf5hl3IQ00NHmt9AaqV+IcU=;
 b=mRNGB9wDhdGXiIcuMUH/eLUflvfBIWyhKAp44Vb1SGNPWsrXMxLdiQ+Oj5Nd8AStvF
 iIQY7IbGSzTRY74PhbHW7LbL4PfyTJoBjiu987tBJmXDEp8AjynU0fOwGViXu4trxkhZ
 eqixXjiaX0uRzFD3/YlNfUh58xl0NjOqaGKTTVxCjd+Xflhnbnk0EUDoiNxvtm2/9vsl
 5uOwuhQSrmlGbZ1zMJc1gRdJWwcgjWwzGJiNJuAFlEw+zwHW6/M0OiYBtveXxRzbAZuV
 Z7anfHV4uQcXmVmtPmhCAFNFCmZMUjvvmpDVqwaarM8KpxvfkXZcQRPaTnWfzqOx1U5v
 54hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RHbI/PXnrc5/sK6elKbbgf5hl3IQ00NHmt9AaqV+IcU=;
 b=J7623ad+m1di98uDWcIxAXShQcyCwU+MIfEbVJAoja3pzXHf5DqMrd3JEJfi2NOBi2
 l3sCAicX0vQB2+nWJUD4FfBnqbltwcEVDS0zAj7sf5F0wFlyxVMyxbg3anIK+uYFlTmY
 3cIxSEwuQ/IuPGC0raCdaXoSEUflA96ihOiPtrAiYEXACT3CHDqGDo7nTWqSfpZ1iu2e
 dDdI/yZC/+iTUTdOqcGD1JN7o9dwLwM7aYBhDuFTdK7AeIQfdzOwkddco0ZicgwC7N2f
 SdCSXoEFvCrevzeJLMdLxn29LtubNiExs1PAgZJ0u8zx+y+SOTI+aVcMntHIUfHKwyeO
 l+uw==
X-Gm-Message-State: AOAM533Q/g7jlHZG9Z4JnN+wGzqbAPLxvI0z0gX25JViwXwcwtPDcR9n
 /ArKbu2vEIia9TpV+ko92o81Lr7+hn3s9A==
X-Google-Smtp-Source: ABdhPJwiUL49Gi1bDErOSWwYM5NEflInbArUEnsTuY4Gs76LB/7ca/HXN31RFXJXc3ZTkJjXs+Ri1g==
X-Received: by 2002:a17:90b:3b43:: with SMTP id
 ot3mr1236486pjb.205.1637661177021; 
 Tue, 23 Nov 2021 01:52:57 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:52:56 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 07/53] powerpc/time: add API for KVM to re-arm the host
 timer/decrementer
Date: Tue, 23 Nov 2021 19:51:45 +1000
Message-Id: <20211123095231.1036501-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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

Rather than have KVM look up the host timer and fiddle with the
irq-work internal details, have the powerpc/time.c code provide a
function for KVM to re-arm the Linux timer code when exiting a
guest.

This is implementation has an improvement over existing code of
marking a decrementer interrupt as soft-pending if a timer has
expired, rather than setting DEC to a -ve value, which tended to
cause host timers to take two interrupts (first hdec to exit the
guest, then the immediate dec).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/time.h | 16 +++-------
 arch/powerpc/kernel/time.c      | 52 +++++++++++++++++++++++++++------
 arch/powerpc/kvm/book3s_hv.c    |  7 ++---
 3 files changed, 49 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 69b6be617772..924b2157882f 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -99,18 +99,6 @@ extern void div128_by_32(u64 dividend_high, u64 dividend_low,
 extern void secondary_cpu_time_init(void);
 extern void __init time_init(void);
 
-#ifdef CONFIG_PPC64
-static inline unsigned long test_irq_work_pending(void)
-{
-	unsigned long x;
-
-	asm volatile("lbz %0,%1(13)"
-		: "=r" (x)
-		: "i" (offsetof(struct paca_struct, irq_work_pending)));
-	return x;
-}
-#endif
-
 DECLARE_PER_CPU(u64, decrementers_next_tb);
 
 static inline u64 timer_get_next_tb(void)
@@ -118,6 +106,10 @@ static inline u64 timer_get_next_tb(void)
 	return __this_cpu_read(decrementers_next_tb);
 }
 
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+void timer_rearm_host_dec(u64 now);
+#endif
+
 /* Convert timebase ticks to nanoseconds */
 unsigned long long tb_to_ns(unsigned long long tb_ticks);
 
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 2769d565f842..f7cddb82938f 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -498,6 +498,16 @@ EXPORT_SYMBOL(profile_pc);
  * 64-bit uses a byte in the PACA, 32-bit uses a per-cpu variable...
  */
 #ifdef CONFIG_PPC64
+static inline unsigned long test_irq_work_pending(void)
+{
+	unsigned long x;
+
+	asm volatile("lbz %0,%1(13)"
+		: "=r" (x)
+		: "i" (offsetof(struct paca_struct, irq_work_pending)));
+	return x;
+}
+
 static inline void set_irq_work_pending_flag(void)
 {
 	asm volatile("stb %0,%1(13)" : :
@@ -541,13 +551,44 @@ void arch_irq_work_raise(void)
 	preempt_enable();
 }
 
+static void set_dec_or_work(u64 val)
+{
+	set_dec(val);
+	/* We may have raced with new irq work */
+	if (unlikely(test_irq_work_pending()))
+		set_dec(1);
+}
+
 #else  /* CONFIG_IRQ_WORK */
 
 #define test_irq_work_pending()	0
 #define clear_irq_work_pending()
 
+static void set_dec_or_work(u64 val)
+{
+	set_dec(val);
+}
 #endif /* CONFIG_IRQ_WORK */
 
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+void timer_rearm_host_dec(u64 now)
+{
+	u64 *next_tb = this_cpu_ptr(&decrementers_next_tb);
+
+	WARN_ON_ONCE(!arch_irqs_disabled());
+	WARN_ON_ONCE(mfmsr() & MSR_EE);
+
+	if (now >= *next_tb) {
+		local_paca->irq_happened |= PACA_IRQ_DEC;
+	} else {
+		now = *next_tb - now;
+		if (now <= decrementer_max)
+			set_dec_or_work(now);
+	}
+}
+EXPORT_SYMBOL_GPL(timer_rearm_host_dec);
+#endif
+
 /*
  * timer_interrupt - gets called when the decrementer overflows,
  * with interrupts disabled.
@@ -608,10 +649,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
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
 
@@ -845,11 +883,7 @@ static int decrementer_set_next_event(unsigned long evt,
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
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 5fc0c168a39a..1b556dbfcfc8 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4062,11 +4062,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	next_timer = timer_get_next_tb();
-	set_dec(next_timer - tb);
-	/* We may have raced with new irq work */
-	if (test_irq_work_pending())
-		set_dec(1);
+	timer_rearm_host_dec(tb);
+
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
 	kvmhv_load_host_pmu();
-- 
2.23.0

