Return-Path: <linuxppc-dev+bounces-10438-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE819B15236
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jul 2025 19:43:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bs2k15FyTz2xrJ;
	Wed, 30 Jul 2025 03:42:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753810969;
	cv=none; b=PvfGXBNbs7NJG1/Et1di8YszHomL3TPKuxVKkOzuFa2UdWggseYtzzCJepPNXI4WYgwhUDNqfKZZsNSZyFcYUTBi73XaD5FZupjRfktWq+L9oUhBDnLey0dMugX4Yrc3frGCg2IMHAy+iZDejnhGT87awMS32zL82zZDlt9R/5ISvIpAdltb0+MkbYlBDZdfLFwxNXqLbgoGAZizXyzmboGXUMQrtcltVFz2Rbx8MdU49HTPUQItth6a1tri14sF6Ql9YZnX8SBB3/DgrIExDRSmpi2qylPhrqGjecUe7B+Oavyy/AMRSJfigo/EIdBdER6TLDnRWeyGvTuw9Trm1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753810969; c=relaxed/relaxed;
	bh=/DbcrgN3ecCQw7+uhqZKGmeiF8XPifOJ/SE5LpRMvY8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Vq9eRVqtJHl5Ce7g6TkJeFmC+9uaWxIhJzSRGpKHLBMDuMfFde4ci2eBgvAhTfKFbpkPI4u//d+nBddvlnHUN22PiopQ9Oq5k+en2A0OZPH/kswYNxbN3lQjH25f/fyGnljGpiOtfY5N2Pcsdodx7ThAu1VVl7ugyJSY5l8ChV+q7WaL8s7LQELjdthPana5hAbAv04+OXhwJrXclnKIWrZ8URXYHYl+yE0hvJjUn1uQP4VWHwbcIhKjhQndU3a1qYxWdyDUImiUtob0+C0MIt3tVzR+yvgpvyhFweCRntQExkcmvb4I2VWh9FM3shU5TxVLaT+09oEClyO0muWZOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=a0blRIzo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3fgijaaykdjuh3zc815dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=a0blRIzo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3fgijaaykdjuh3zc815dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bs2k10qm1z3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 03:42:49 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31edd69d754so2580144a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jul 2025 10:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753810967; x=1754415767; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/DbcrgN3ecCQw7+uhqZKGmeiF8XPifOJ/SE5LpRMvY8=;
        b=a0blRIzoFUgbtMGuCYUTwyiEO6rIbH9IBBu0O6wz7+bHNu9yh1Hll1x4T9bG6KvOJl
         rNx53Nt1nb6biiYNOXrEpcGcrWRlsPDjY1uCzv2aM87JzqGNV3mg9NF+lrWtKsGYRb8D
         KjWp6e9XNHv5dGOmaNIy1EU/iGK9Q2YdUHlaBrXZVAHGAX81dD1i6tvU5I1JmpGt3HpF
         b7bT2q7v+8PsqdHkFmFVga4AltQTSKQpFsrwJfJW46DUHJq9C92IdS5fwDhapbgW+CH1
         Ia6iA+xO7bWroqRlZnCe9TTlGXYa4aU/odUF8dltgz5ht2P3t2wMgHPMqDIkNURjljMS
         V5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753810967; x=1754415767;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DbcrgN3ecCQw7+uhqZKGmeiF8XPifOJ/SE5LpRMvY8=;
        b=ZZy6GfTN4O+4u/MxMgdaqpC3zxO3vqTF29fM1XQ6z4R8UpWMDtFqlvxVUsPjNZjAzu
         PDQZnsOxp44BTJKjFES5LwgIiK1o9cqzki9w6wI1VjNaRdhVGu7JRnWlMdBtkaIO5NUS
         DAlWEGd+c9ClG+VXhk+WAFlKmZDJJyMgB/QdIfWcbOBRoMhnP5qg6/nMjNgbVriDP81u
         9bfPiESrTNxowNWyZ8gX340RbPdrFeL7FXW9FlwDWWnjzu02f9vrlxr/xwwnrEiKVP7g
         LwkO0GemHyZlGp/ppKnrwDebYdxlWKIgudao3lFd0i2oG3dm+6qFndSx6QhOZMoIDjPN
         QrFg==
X-Gm-Message-State: AOJu0Yx3UmQEeuFqCWPKUKjczPdDV6e1Mrdq7rhi9saIYBpvNth+KSfG
	OYxwNjbtIZHIwam5BZswO7mp6ZXZN35cLq3XIR2qIJIBV/ESqgpC3lo5TKI5+nXJPA4sg3TuPtv
	gG+MUEg==
X-Google-Smtp-Source: AGHT+IFH+wIDKMsSmrwhy/nAH7BTEpi34izfhqEJk0uofVTDFy3OPhYpSTuENnjPuH/IjmdxV+EpZXPT7WQ=
X-Received: from pjqx17.prod.google.com ([2002:a17:90a:b011:b0:314:29b4:453])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a92:b0:31f:150:e02b
 with SMTP id 98e67ed59e1d1-31f5dd6fd0fmr572556a91.4.1753810966810; Tue, 29
 Jul 2025 10:42:46 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Jul 2025 10:42:35 -0700
In-Reply-To: <20250729174238.593070-1-seanjc@google.com>
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
References: <20250729174238.593070-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729174238.593070-4-seanjc@google.com>
Subject: [PATCH 3/6] KVM: x86: Move kvm_intr_is_single_vcpu() to lapic.c
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Andy Lutomirski <luto@kernel.org>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Holger Dengler <dengler@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-sgx@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
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
 arch/x86/kvm/lapic.c            | 32 ++++++++++++++++++++++++++++++--
 arch/x86/kvm/lapic.h            |  4 ++--
 4 files changed, 32 insertions(+), 35 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index f19a76d3ca0e..99c07a37bf80 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2392,9 +2392,6 @@ void __user *__x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu);
 bool kvm_vcpu_is_bsp(struct kvm_vcpu *vcpu);
 
-bool kvm_intr_is_single_vcpu(struct kvm *kvm, struct kvm_lapic_irq *irq,
-			     struct kvm_vcpu **dest_vcpu);
-
 static inline bool kvm_irq_is_postable(struct kvm_lapic_irq *irq)
 {
 	/* We can only post Fixed and LowPrio IRQs */
diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 16da89259011..a1a388c00187 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -411,34 +411,6 @@ int kvm_set_routing_entry(struct kvm *kvm,
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
index 8172c2042dd6..20f7a7d0c422 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -1228,8 +1228,9 @@ bool kvm_irq_delivery_to_apic_fast(struct kvm *kvm, struct kvm_lapic *src,
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
@@ -1256,6 +1257,33 @@ bool kvm_intr_is_single_vcpu_fast(struct kvm *kvm, struct kvm_lapic_irq *irq,
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
+
 /*
  * Add a pending IRQ into lapic.
  * Return 1 if successfully added and 0 if discarded.
diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
index 72de14527698..b9e44956c162 100644
--- a/arch/x86/kvm/lapic.h
+++ b/arch/x86/kvm/lapic.h
@@ -240,8 +240,8 @@ void kvm_wait_lapic_expire(struct kvm_vcpu *vcpu);
 void kvm_bitmap_or_dest_vcpus(struct kvm *kvm, struct kvm_lapic_irq *irq,
 			      unsigned long *vcpu_bitmap);
 
-bool kvm_intr_is_single_vcpu_fast(struct kvm *kvm, struct kvm_lapic_irq *irq,
-			struct kvm_vcpu **dest_vcpu);
+bool kvm_intr_is_single_vcpu(struct kvm *kvm, struct kvm_lapic_irq *irq,
+			     struct kvm_vcpu **dest_vcpu);
 int kvm_vector_to_index(u32 vector, u32 dest_vcpus,
 			const unsigned long *bitmap, u32 bitmap_size);
 void kvm_lapic_switch_to_sw_timer(struct kvm_vcpu *vcpu);
-- 
2.50.1.552.g942d659e1b-goog


