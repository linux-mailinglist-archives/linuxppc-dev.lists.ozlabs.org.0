Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E073D51EC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 05:55:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5gN2r2nz3dwF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 13:55:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lBOAk8ys;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lBOAk8ys; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5Z93sXvz30Mg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:51:13 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 gv20-20020a17090b11d4b0290173b9578f1cso11984301pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U+hxFadF7rDD737thjtwTXg1szqkFi6egNx7RN8wOw8=;
 b=lBOAk8ysarc37c5RgJdg+ncx9+W7XJTFZnI0pdmZH5q/UvOOHorvI48Z5LsZ1UaQiU
 rjKl2iMAy+n5Cy2T93ZKIckWqIHl4I4afXgLtgC1YgdMPkfF8Eq5lC6NlY8QJgMYihHL
 LnbOlEDw+BlpFHcyo6wvdFC/fE+wrcOfp3WNnrgsg8aHR5QYLwFYJ0VKg2cCHvgsYsN6
 9L2vqPXOZoRLWTWm8pH8G0+x75lor/VzFieUdoV0Sl4WYrlbqrmJ8ItbY3jDw8rgjEXJ
 0Dxe48kPj1l1uKDn4zsw1wgYl4hZO1rjATeZCePf3Abb3vfgh4mCvs9+IaCK1qtPO8Y4
 nT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U+hxFadF7rDD737thjtwTXg1szqkFi6egNx7RN8wOw8=;
 b=IXWTkgd8FvbzQc2LM3umbQm7hTsAxzUZ9YvYoJTDZzHXC6/cEH4XQV3NYZ+/aWD1Hw
 0j71s6Kao6BLhF7n+L9SytevMNxJx/Uuwi7GelNt5YaYNgWAtk1uKGwKimNm2Oy228Zg
 7UanT2BI4mDGiSFo0CnFXzlvSlo3BWaquBK8p3F1NyzDdWbksoLOlQpMw0HMus7l3VSZ
 3yxezmKDd/pJnGyYzV8eKfLGHYxGKgLHzIy0bOQj5uhO0GfF/Ce4dXvKE01teuoggMck
 ISOTh/1X8d3H2wzGkv4rMHsbytr2pTW8Vj9SPrbkvkyHRGKHYGBYeSBdlSWDF2i2Rq3h
 yfqQ==
X-Gm-Message-State: AOAM5301lLD5QaqXZOsYjlH1Lgl7cRNUZmf6490t7X6j6XvEoni9b8yC
 W/ucr0NANL7uleZ5ld5UTJU=
X-Google-Smtp-Source: ABdhPJyERyuOio4qvoqLtz/rUqcHpCZaHWROFblTuPaA1JSruI9r5uXy4KMCWGiK/KExivVaqPDNZw==
X-Received: by 2002:a65:61ab:: with SMTP id i11mr16390663pgv.168.1627271471238; 
 Sun, 25 Jul 2021 20:51:11 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:51:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 11/55] powerpc/time: add API for KVM to re-arm the host
 timer/decrementer
Date: Mon, 26 Jul 2021 13:49:52 +1000
Message-Id: <20210726035036.739609-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210726035036.739609-1-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
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
index 72d872b49167..016828b7401b 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -499,6 +499,16 @@ EXPORT_SYMBOL(profile_pc);
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
@@ -542,13 +552,44 @@ void arch_irq_work_raise(void)
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
@@ -609,10 +650,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
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
 
@@ -854,11 +892,7 @@ static int decrementer_set_next_event(unsigned long evt,
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
index 6e6cfb10e9bb..0cef578930f9 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4018,11 +4018,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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

