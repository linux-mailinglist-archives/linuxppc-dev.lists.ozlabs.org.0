Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA5E3B022E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:01:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8Njx4HrXz3cnS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:01:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YbzqIKRm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YbzqIKRm; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8NfZ399Bz309V
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:58:14 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id t32so4763811pfg.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zKksIi3iobNDKIZiDXIqera5X5YbozPv4TcF08UE7EA=;
 b=YbzqIKRmxnfL5Zen0t0nqknewQXwLa8Dg3geLkGOwe5xPoBy2yIik/mSNX3tjzqRdq
 k4jYQsH1FzFIG7jUcNYA8KFzOteCUIWh8sdsXuu1brt3/PUc0kj/tAXOn19VImesZSbK
 dEADcpbdNPXyT2IhjJNeCUlX7ZdP79N1SuYkznlgJx+i+oRjFB4cZYciNPnLEWw0Cnat
 hHYsIY6NF9PzCCOawP5NP1BOa/cg9IUnNZMfhwdlcBrJlTYIDjS32kFI6KPyLhGKwwgx
 aF92fO0NAM6+DwlClFpBcSU635+qT1vxjzWfPnPbJ4z9AYTHinDFxawly7Z+JWqbEJFg
 EbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zKksIi3iobNDKIZiDXIqera5X5YbozPv4TcF08UE7EA=;
 b=UMWUzFsURaYV6u2qz0y5s+VdgpnQnkK6D7rx/AbCooD0uTselUEvwLjKZZJosY7Cf7
 NpX5g2mcN6Ry6KLLx0XJp5EUm2ZiDrkH8JMCGrJy+F13oyahUfb3xLTbjWrMQCVYQFBS
 X7ZhVkMtgGti+3Gqda67snKm/B5MDpV4MfC+y1HHmBBUKKbnvRRnLvuDgNiMoiXSzFPG
 uCcbs+NesEhc8H//bVxRiLMqZGwHhDsY4CIS49vcSHn+gRmugoL4hHAQxEs0tshVe+3b
 R9WpyR+Cdll/WvUiDmVVUmzVL7HzpwgfBdwMJPvm8fDjQblZ2GEZ4wL7+tG/aBXw7fUo
 ea/A==
X-Gm-Message-State: AOAM533cQFJ7Osf60DVxk/8stqpcLKeHONMNJSntPl2tDBW/quQQn0IT
 Cu0wsCfEFp0E4VONmYpacSQ=
X-Google-Smtp-Source: ABdhPJwZv/W3X+QQYObSapJUzVOgC4mG0sd7Z/q9rXQGafDQo22cluA9C0VscQZ81/N1E7z8NpipmA==
X-Received: by 2002:a65:50c5:: with SMTP id s5mr3227651pgp.138.1624359491426; 
 Tue, 22 Jun 2021 03:58:11 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:58:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 06/43] powerpc/time: add API for KVM to re-arm the host
 timer/decrementer
Date: Tue, 22 Jun 2021 20:56:59 +1000
Message-Id: <20210622105736.633352-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210622105736.633352-1-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
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
index 026b3c0b648c..7c9de3498548 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -510,6 +510,16 @@ EXPORT_SYMBOL(profile_pc);
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
@@ -553,13 +563,44 @@ void arch_irq_work_raise(void)
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
@@ -620,10 +661,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
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
 
@@ -865,11 +903,7 @@ static int decrementer_set_next_event(unsigned long evt,
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
index 5ec534620e07..36e1db48fccf 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3913,11 +3913,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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

