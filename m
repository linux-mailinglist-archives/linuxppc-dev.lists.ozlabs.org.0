Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4B535E061
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 15:43:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKRdp5z4dz3cC3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 23:43:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Zc1rpsme;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Zc1rpsme; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKRcd6W6zz30C1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 23:42:41 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id z22so3107972plo.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5DdIb7caJKIVHR38EDEC3oy5CdMMDVm1Jnwd54EA0OE=;
 b=Zc1rpsmepHixbpGPdvl3C7xqe+seW/GCoFmahZd+nUAD59TN5iVH6daSR+jGW9DB4D
 UzKHAbXllfuBrxpYlSqN+/x2PjuKFcONRJ3DJvGU6EXLakzbIXugWWB9VokQO52Tzik/
 ATBI9bwV4etsz4+/kpZuBEjMPS5jcLm/m7bCq0XEI2SiPHPIh1Bl3sUirMsbpZTw/BJz
 MqAnrdqYQK/3FG3g8DYA7EJ4Z0lq8ln8q2PaQPDp/4FDcYEApXA+99+i0Wo5p06xb3sW
 qYjczrrNJpfMt0e1q6PiFl6kjhIIRs/1ydksnsyyVbTJnt0xCEuJbXG/bvE/YlwS4TK5
 92CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5DdIb7caJKIVHR38EDEC3oy5CdMMDVm1Jnwd54EA0OE=;
 b=t9lm1LC24+DCPahIQO9Z4rYQGV6ebMIIj0nx64D7VSeHBkxjgVPjIPmbeuoX3uMmPE
 UWN5obWzlctMmw/XXOfNpJ1SnHAfwT/nsJYrI5h/ENQV6LEZMGuUNiFp4ObcDjDmi5Yk
 rIcdt8yLLHvemzPa7GHiIkE9YeQf2lhVYDz70fEE4ouwDaucNOw/wzjgrufdy7qnfg0n
 4hIpkGQbI9/Hw64Zs2bi86grLMQ+SV8hUtq2nvuXJJxMtr+xTva+KqYVUCiPnTyJBIye
 jgfnGz//9Fp2WEfhsAN1vIPn7q29b78sN+KIyXE68p7xtML2wnMIBQjJROhWI+kYgIWz
 kjEA==
X-Gm-Message-State: AOAM530Enm3OWkEyFSnUwnQRkB2Mn0HuH69+ERQHh3Mh4OX0Rur3aEmv
 1B8R10ZbDRqT9KTN+u3NB5Y=
X-Google-Smtp-Source: ABdhPJwJM71Lnf5SNTjBV9O13f5FVFZ2EFgpom4FI3mZ3owzvtOIxgSYvi52ogjmu4pNa1yDdIoRSw==
X-Received: by 2002:a17:90b:4c47:: with SMTP id
 np7mr122192pjb.26.1618321359681; 
 Tue, 13 Apr 2021 06:42:39 -0700 (PDT)
Received: from bobo.ibm.com (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id l22sm100465pjc.13.2021.04.13.06.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 06:42:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 2/2] KVM: PPC: Book3S HV P9: Reduce irq_work vs guest
 decrementer races
Date: Tue, 13 Apr 2021 23:42:23 +1000
Message-Id: <20210413134223.1691892-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210413134223.1691892-1-npiggin@gmail.com>
References: <20210413134223.1691892-1-npiggin@gmail.com>
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

irq_work's use of the DEC SPR is racy with guest<->host switch and guest
entry which flips the DEC interrupt to guest, which could lose a host
work interrupt.

This patch closes one race, and attempts to comment another class of
races.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/time.h | 12 ++++++++++++
 arch/powerpc/kernel/time.c      | 10 ----------
 arch/powerpc/kvm/book3s_hv.c    | 15 +++++++++++++++
 3 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 8dd3cdb25338..8c2c3dd4ddba 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -97,6 +97,18 @@ extern void div128_by_32(u64 dividend_high, u64 dividend_low,
 extern void secondary_cpu_time_init(void);
 extern void __init time_init(void);
 
+#ifdef CONFIG_PPC64
+static inline unsigned long test_irq_work_pending(void)
+{
+	unsigned long x;
+
+	asm volatile("lbz %0,%1(13)"
+		: "=r" (x)
+		: "i" (offsetof(struct paca_struct, irq_work_pending)));
+	return x;
+}
+#endif
+
 DECLARE_PER_CPU(u64, decrementers_next_tb);
 
 /* Convert timebase ticks to nanoseconds */
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index b67d93a609a2..da995c5fb97d 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -508,16 +508,6 @@ EXPORT_SYMBOL(profile_pc);
  * 64-bit uses a byte in the PACA, 32-bit uses a per-cpu variable...
  */
 #ifdef CONFIG_PPC64
-static inline unsigned long test_irq_work_pending(void)
-{
-	unsigned long x;
-
-	asm volatile("lbz %0,%1(13)"
-		: "=r" (x)
-		: "i" (offsetof(struct paca_struct, irq_work_pending)));
-	return x;
-}
-
 static inline void set_irq_work_pending_flag(void)
 {
 	asm volatile("stb %0,%1(13)" : :
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 48df339affdf..bdc24e9cb096 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3708,6 +3708,18 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (!(vcpu->arch.ctrl & 1))
 		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
 
+	/*
+	 * When setting DEC, we must always deal with irq_work_raise via NMI vs
+	 * setting DEC. The problem occurs right as we switch into guest mode
+	 * if a NMI hits and sets pending work and sets DEC, then that will
+	 * apply to the guest and not bring us back to the host.
+	 *
+	 * irq_work_raise could check a flag (or possibly LPCR[HDICE] for
+	 * example) and set HDEC to 1? That wouldn't solve the nested hv
+	 * case which needs to abort the hcall or zero the time limit.
+	 *
+	 * XXX: Another day's problem.
+	 */
 	mtspr(SPRN_DEC, vcpu->arch.dec_expires - mftb());
 
 	if (kvmhv_on_pseries()) {
@@ -3822,6 +3834,9 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->in_guest = 0;
 
 	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - mftb());
+	/* We may have raced with new irq work */
+	if (test_irq_work_pending())
+		set_dec(1);
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
 	kvmhv_load_host_pmu();
-- 
2.23.0

