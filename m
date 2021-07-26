Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4003D51E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 05:54:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5f229XRz30Nj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 13:54:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QPzPdEGT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QPzPdEGT; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5Z20XDpz30Jw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:51:06 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id ch6so2114578pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XKVxs40Y3Ht4HwL4eALZtDA3njvIWQGeUzaIg+a0YoY=;
 b=QPzPdEGTO+eSvTcth7+jwiO5ueC0TvVJQS4BUYKRHy38O0yEYtwm9gMGhRpBpUJW/E
 xzSLzqzfErZZIsMcf/ws1SFHZe4LgyNE3z7VlqRMjJXEOV8zBY4t1IVGyt/QbYsfOZZd
 V6G7WABrCjummg3Uhvi3UhB5UaoE+GLWPHubt09PLRSh18iNb9gCO+xCju47pqUCjwsA
 ESQuBIRJym46XxTS9kcXhmfgngF1NdqA0jletsUx3XT0rMkmBG7GQAAKl7ZOdvS6R0aw
 TbO7co8QSvMOb8b+65l5QVaxWiYledgtQuuQaEvTkMS8v9b8d25WpYoRmFZhGL+c0BqK
 71TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XKVxs40Y3Ht4HwL4eALZtDA3njvIWQGeUzaIg+a0YoY=;
 b=Fh42t9MH3Uwux5nuOxcRDtZGVJOVURepWFpty4Z5lAB4f0heWwF8fD07cCC1NwdFgc
 U+GTiOK1vFRBaS8NcLVFyZ33RHHa5jsJKvr4/NYZpAyZp5JfiF0c274Vw3PSa3KJ0bWD
 Rt5Z/o9q9EKyoiD8vQl6Ei9aM/j5KXQdob1tw7L9XjCCT+I+iT34/IP0Z4QRuOqlbAlu
 cIieowlPF+KPTD5PXOS8U3fV1AhmPB9FXDFMwOYO7J9BSecnzt7hPsVyAYUoALH4D9sZ
 tiwrWid81yRtZ3jtgb6xZl8bA08MFXKUW+kxDpKrbmLJgpbekZAtRhQHpOUXd3URo1Nk
 RxrQ==
X-Gm-Message-State: AOAM530X++OuhhMI4AcPGZ0WhfEfODOJqJldvllVIrohibDchz52QSR+
 WKlFfT1ChhfMYe2PYwqfg30=
X-Google-Smtp-Source: ABdhPJxo9hVzjn7hW3VmNYfRG/qy/icGPi79DwZhCNr6qvpgl+mPOUebyZqm/10pXKdzhDyuGjIcYg==
X-Received: by 2002:a17:90b:3905:: with SMTP id
 ob5mr1018792pjb.211.1627271463935; 
 Sun, 25 Jul 2021 20:51:03 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:51:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 08/55] KVM: PPC: Book3S HV P9: Use host timer accounting to
 avoid decrementer read
Date: Mon, 26 Jul 2021 13:49:49 +1000
Message-Id: <20210726035036.739609-9-npiggin@gmail.com>
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

There is no need to save away the host DEC value, as it is derived
from the host timer subsystem which maintains the next timer time,
so it can be restored from there.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/time.h |  5 +++++
 arch/powerpc/kernel/time.c      |  1 +
 arch/powerpc/kvm/book3s_hv.c    | 14 +++++++-------
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 8c2c3dd4ddba..fd09b4797fd7 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -111,6 +111,11 @@ static inline unsigned long test_irq_work_pending(void)
 
 DECLARE_PER_CPU(u64, decrementers_next_tb);
 
+static inline u64 timer_get_next_tb(void)
+{
+	return __this_cpu_read(decrementers_next_tb);
+}
+
 /* Convert timebase ticks to nanoseconds */
 unsigned long long tb_to_ns(unsigned long long tb_ticks);
 
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index e45ce427bffb..01df89918aa4 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -108,6 +108,7 @@ struct clock_event_device decrementer_clockevent = {
 EXPORT_SYMBOL(decrementer_clockevent);
 
 DEFINE_PER_CPU(u64, decrementers_next_tb);
+EXPORT_SYMBOL_GPL(decrementers_next_tb);
 static DEFINE_PER_CPU(struct clock_event_device, decrementers);
 
 #define XSEC_PER_SEC (1024*1024)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7020cbbf3aa1..82976f734bd1 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3829,18 +3829,17 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	struct p9_host_os_sprs host_os_sprs;
 	s64 dec;
-	u64 tb;
+	u64 tb, next_timer;
 	int trap, save_pmu;
 
 	WARN_ON_ONCE(vcpu->arch.ceded);
 
-	dec = mfspr(SPRN_DEC);
 	tb = mftb();
-	if (dec < 0)
+	next_timer = timer_get_next_tb();
+	if (tb >= next_timer)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
-	local_paca->kvm_hstate.dec_expires = dec + tb;
-	if (local_paca->kvm_hstate.dec_expires < time_limit)
-		time_limit = local_paca->kvm_hstate.dec_expires;
+	if (next_timer < time_limit)
+		time_limit = next_timer;
 
 	save_p9_host_os_sprs(&host_os_sprs);
 
@@ -4019,7 +4018,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	set_dec(local_paca->kvm_hstate.dec_expires - mftb());
+	next_timer = timer_get_next_tb();
+	set_dec(next_timer - mftb());
 	/* We may have raced with new irq work */
 	if (test_irq_work_pending())
 		set_dec(1);
-- 
2.23.0

