Return-Path: <linuxppc-dev+bounces-12405-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88925B877B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 02:33:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSYQB66zwz3ccV;
	Fri, 19 Sep 2025 10:33:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758242002;
	cv=none; b=nBGMivZyaJUJHChqlM1KwBU67hKQUJNVyex7cyM46Qt+gVfAyz9R6uogAHeERts/1693f3gmUDwgw7+BDDPqtnhWd5zvYZcxHMB+i9qIVCVawyXySpc+ijYtydWfBY/05hg9dDDWSxH2Xl7THYp4EdAyRiSJPB7k7jxNPa4hZUAMiu4DITlF1TIrPFEK3Mkoo2amIqq/HnsF0ZxrJO2C8FcUTX8WdTwRHt99cuTaj1WRvc6sCMxB7zGCmpKWUPT7JB9MKgaIYsIz/69E1DWQAO/iOiwVPxUDAdGnmLx6OOG7hRi5NzQYETRK34aMCj2jP2VXPYjNhwIt6Zc/OVy3mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758242002; c=relaxed/relaxed;
	bh=50iAb3TbAebOi3cXMklwS6LjjlcHrLpQ5f/WYr9Gs1U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DF2ZYhkLOhdPqwrkG6AjK4DpWgpHpcKu668FMEI+K84OrzheEjPy5v5fYyU+3DN0PwDnuOt3Kap/NzhMJ7rAqNt4Pm/wie5wBi+FGVuzC3Rkv9oM2UZEa0sucIXfqkdY87K264qJftNd4eYd2est0e8NqfJuxTgNRQOLUjQmRDnvKP/j2gdFAS4aRcKh7P6goyWWkF3kAzja+bZtBJbGaJsabJdHSRxgRDp3wbdQ39Udnxv8UWxuiTWKsE0cHnbKocKLWlu/1Pay7h+uH0Q/oznxksDCbCmTbnMzPyaLS0RvDTjWpk/LmzuOX8xv2p7n8kzbibAi1U9jviMCBLGorw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IlJXEwM+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3z6tmaaykdjgk62fb48gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IlJXEwM+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3z6tmaaykdjgk62fb48gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSYQB0qK2z3cbt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 10:33:22 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32ee4998c4aso1444386a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 17:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758242000; x=1758846800; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=50iAb3TbAebOi3cXMklwS6LjjlcHrLpQ5f/WYr9Gs1U=;
        b=IlJXEwM+MQUjYmU3smzYCtKf4j5GXmuaX282ZH4SqpUpWSndb8v0ozTD6B9Gf5qijL
         8LZzwgMYUaKSCcXDELuK17W1MgO33KOhSIS/uxnkGCePPjBx/N1Ybl0VQ34YsUBGgKZZ
         W1TXM0R6ZzXHYn+Pv/HyZ7HhdgaFEFQU/Y9FTy3isYzmi1RG7+wL5RaVa/LMqZXUHFK3
         cDSTSpw9ub/hsWL8mf0Alkto1kji0fS1rJpWDw+0zjdk5Bc+Z3SqoflZjOGCsCyWTFLe
         0gJ0P7283tpIftf8C6qFOJ0dquX7Ddacn9yPXayjQUE4divI70xBzRggkwvnw9k7syGs
         6GbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758242000; x=1758846800;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50iAb3TbAebOi3cXMklwS6LjjlcHrLpQ5f/WYr9Gs1U=;
        b=qKgMBgw+AYTliHj1IoJcQHserNQ1xqBF2zm0s/Fzyc1vhFySm7wlk2LQ9MymqcYFJp
         WLdaaERbXy5/qkcMQZuAFeLq0VC+i0TkZonAPDRI8mqG+9GIcqYZxVwVTtf5s2dLMRwE
         RsmFw3PmR4f+SlxZuA7b3oUonBjEGIxDAA7Bc/pBehVT5NFY0h5TcTMbehksSOAFiix2
         Z/iFKnf/lg12YsKZTTyHNuBh/7B+IhKSBxCWpsap0kTUwU+7Nt8TVPAeFhUm1l0mFVK7
         ZFtQbqnvs1/JXskLi8O3tBW9q5/ndCHC/Ef1tX5uctgPkiIMr2sKcRq3AOyrqs7QCYhx
         08mA==
X-Gm-Message-State: AOJu0YwOLTNfoP4SoCdrst4sYlg5JRaTbqowrDuWwemvi4+bnGS8ciJM
	TozN5PG+axuF2geVeehuD57C6WIkSJ7+IBgihBAjMVmaHYXalpE33ooEojvvtOlyynzKNTUv8B9
	fEYVAkw==
X-Google-Smtp-Source: AGHT+IHWbOdo8qoTOqbS20QiAs/keKKGZuQU4AXsDlIYjlpZHJfwwwTHdlmwpscoisSH/f9YdBDDPaf6ydo=
X-Received: from pjbsi16.prod.google.com ([2002:a17:90b:5290:b0:32e:8ff7:495])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3508:b0:32e:7340:a7f7
 with SMTP id 98e67ed59e1d1-33097fd0f2bmr1581820a91.2.1758241999747; Thu, 18
 Sep 2025 17:33:19 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 18 Sep 2025 17:33:01 -0700
In-Reply-To: <20250919003303.1355064-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20250919003303.1355064-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.470.ga7dc726c21-goog
Message-ID: <20250919003303.1355064-4-seanjc@google.com>
Subject: [PATCH v2 3/5] KVM: x86: Move kvm_intr_is_single_vcpu() to lapic.c
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, 
	Harald Freudenberger <freude@linux.ibm.com>, Holger Dengler <dengler@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Move kvm_intr_is_single_vcpu() to lapic.c, drop its export, and make its
"fast" helper local to lapic.c.  kvm_intr_is_single_vcpu() is only usable
if the local APIC is in-kernel, i.e. it most definitely belongs in the
local APIC code.

No functional change intended.

Fixes: 2f5fb6b965b3 ("KVM: x86: Dedup AVIC vs. PI code for identifying target vCPU")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  3 ---
 arch/x86/kvm/irq.c              | 28 ----------------------------
 arch/x86/kvm/lapic.c            | 33 +++++++++++++++++++++++++++++++--
 arch/x86/kvm/lapic.h            |  4 ++--
 4 files changed, 33 insertions(+), 35 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 17772513b9cc..00a210130fba 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2412,9 +2412,6 @@ void __user *__x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu);
 bool kvm_vcpu_is_bsp(struct kvm_vcpu *vcpu);
 
-bool kvm_intr_is_single_vcpu(struct kvm *kvm, struct kvm_lapic_irq *irq,
-			     struct kvm_vcpu **dest_vcpu);
-
 static inline bool kvm_irq_is_postable(struct kvm_lapic_irq *irq)
 {
 	/* We can only post Fixed and LowPrio IRQs */
diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index a6b122f732be..153134893301 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -354,34 +354,6 @@ int kvm_set_routing_entry(struct kvm *kvm,
 	return 0;
 }
 
-bool kvm_intr_is_single_vcpu(struct kvm *kvm, struct kvm_lapic_irq *irq,
-			     struct kvm_vcpu **dest_vcpu)
-{
-	int r = 0;
-	unsigned long i;
-	struct kvm_vcpu *vcpu;
-
-	if (kvm_intr_is_single_vcpu_fast(kvm, irq, dest_vcpu))
-		return true;
-
-	kvm_for_each_vcpu(i, vcpu, kvm) {
-		if (!kvm_apic_present(vcpu))
-			continue;
-
-		if (!kvm_apic_match_dest(vcpu, NULL, irq->shorthand,
-					irq->dest_id, irq->dest_mode))
-			continue;
-
-		if (++r == 2)
-			return false;
-
-		*dest_vcpu = vcpu;
-	}
-
-	return r == 1;
-}
-EXPORT_SYMBOL_GPL(kvm_intr_is_single_vcpu);
-
 void kvm_scan_ioapic_irq(struct kvm_vcpu *vcpu, u32 dest_id, u16 dest_mode,
 			 u8 vector, unsigned long *ioapic_handled_vectors)
 {
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 3b76192b24e9..b5e47c523164 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -1237,8 +1237,9 @@ bool kvm_irq_delivery_to_apic_fast(struct kvm *kvm, struct kvm_lapic *src,
  *	   interrupt.
  * - Otherwise, use remapped mode to inject the interrupt.
  */
-bool kvm_intr_is_single_vcpu_fast(struct kvm *kvm, struct kvm_lapic_irq *irq,
-			struct kvm_vcpu **dest_vcpu)
+static bool kvm_intr_is_single_vcpu_fast(struct kvm *kvm,
+					 struct kvm_lapic_irq *irq,
+					 struct kvm_vcpu **dest_vcpu)
 {
 	struct kvm_apic_map *map;
 	unsigned long bitmap;
@@ -1265,6 +1266,34 @@ bool kvm_intr_is_single_vcpu_fast(struct kvm *kvm, struct kvm_lapic_irq *irq,
 	return ret;
 }
 
+bool kvm_intr_is_single_vcpu(struct kvm *kvm, struct kvm_lapic_irq *irq,
+			     struct kvm_vcpu **dest_vcpu)
+{
+	int r = 0;
+	unsigned long i;
+	struct kvm_vcpu *vcpu;
+
+	if (kvm_intr_is_single_vcpu_fast(kvm, irq, dest_vcpu))
+		return true;
+
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+		if (!kvm_apic_present(vcpu))
+			continue;
+
+		if (!kvm_apic_match_dest(vcpu, NULL, irq->shorthand,
+					irq->dest_id, irq->dest_mode))
+			continue;
+
+		if (++r == 2)
+			return false;
+
+		*dest_vcpu = vcpu;
+	}
+
+	return r == 1;
+}
+EXPORT_SYMBOL_GPL(kvm_intr_is_single_vcpu);
+
 int kvm_irq_delivery_to_apic(struct kvm *kvm, struct kvm_lapic *src,
 			     struct kvm_lapic_irq *irq, struct dest_map *dest_map)
 {
diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
index 50123fe7f58f..282b9b7da98c 100644
--- a/arch/x86/kvm/lapic.h
+++ b/arch/x86/kvm/lapic.h
@@ -236,8 +236,8 @@ void kvm_wait_lapic_expire(struct kvm_vcpu *vcpu);
 void kvm_bitmap_or_dest_vcpus(struct kvm *kvm, struct kvm_lapic_irq *irq,
 			      unsigned long *vcpu_bitmap);
 
-bool kvm_intr_is_single_vcpu_fast(struct kvm *kvm, struct kvm_lapic_irq *irq,
-			struct kvm_vcpu **dest_vcpu);
+bool kvm_intr_is_single_vcpu(struct kvm *kvm, struct kvm_lapic_irq *irq,
+			     struct kvm_vcpu **dest_vcpu);
 void kvm_lapic_switch_to_sw_timer(struct kvm_vcpu *vcpu);
 void kvm_lapic_switch_to_hv_timer(struct kvm_vcpu *vcpu);
 void kvm_lapic_expired_hv_timer(struct kvm_vcpu *vcpu);
-- 
2.51.0.470.ga7dc726c21-goog


