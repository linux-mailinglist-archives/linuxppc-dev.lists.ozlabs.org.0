Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 714F15BF237
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 02:35:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXKFd0pjvz3f6H
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 10:35:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fxdaQ36w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3tlsqywykddclxtgcvzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fxdaQ36w;
	dkim-atps=neutral
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXKBc1tRbz3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 10:32:56 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id f16-20020a17090a4a9000b001f234757bbbso2375016pjh.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 17:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=in1e99LU0Ccpw/X/GIRYkJpr4V5oHdTaxBm51ABK8Zw=;
        b=fxdaQ36wvXASTDMSCMzYP+4owRlpPpJcqJ4F20fEjNf3NkP/XvFqT6xHl6n3ymucfl
         wAkGHRzbnCmY2sRlXf6ZWxdMJOLwsB9akqzNsLJ63vLPgpDdP/+uiqDwiJPNyKPaW9d7
         W2gxRWjRcioAK5oyxgmQ+mvd8Xlfcqcs1FkpQ/Oqp1HeXyhy4RotzrvhRKtqe8D+3zPD
         +CkxhFgpHhUHVq6NWMedQTZChQMs8Bwl5AD6kmQ5xMId+9oxitQlXRTCf8+K4ilieGZt
         o5dYeYoVYv1Nk//INpmg7k40TTkb2qfPNYErptOcyucxi9O7dxpRl/MDPplYtfBX3bMF
         AtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=in1e99LU0Ccpw/X/GIRYkJpr4V5oHdTaxBm51ABK8Zw=;
        b=CkqCpdq1GuXdIBR4l6+Fs/xfwbRQKi+/bUrwgik6VnGMTGUdLUHSUMEa88e9sId7MA
         QQ6L1xV2UzN63FR+vH1yMwZPPtINliv9VCF6iDS/wO2X0791ju4GjMHpwbOQGqo7A+dA
         PVzMkYjIQY09cYQnRXcHnn/fiVLenntgu0pJHaPmBvseSEpBsmIPM/6WAfFwVqgJUFgt
         Hc9aV39xxcun3bFGw/2gHC0FqTbLk6Y+VFukmY7sW2dlecuYdF1BUYxAnRJzZi2oZllK
         q4wZz6l9c/xA6euuKVLxjUYiJyEJy4MSrabqyRk1avi5abx4qEDB1jrwa4JPKWbHZYH6
         vjGQ==
X-Gm-Message-State: ACrzQf2VAiAm99pa1foKzMqpeHIzTZh0wdXXyEvZ48segjdHp4jO5r50
	6ELqDwD1Baq1tnPQfeQWwuRXPTMUVuU=
X-Google-Smtp-Source: AMsMyM5mvx4Hh7HCt8EQDTkIMloT3kDTM73/Oxb6s3/QbBaMaLHOT1W35eSuZRH5DC184c70ddSZg22LA4I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:cf11:b0:178:29d7:4fbd with SMTP id
 i17-20020a170902cf1100b0017829d74fbdmr2199821plg.174.1663720374306; Tue, 20
 Sep 2022 17:32:54 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:31:53 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-5-seanjc@google.com>
Subject: [PATCH v4 04/12] KVM: x86: Rename kvm_apic_has_events() to make it
 INIT/SIPI specific
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Suzuki K Poulose <suzuki.poulose@arm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Maxim Levitsky <mlevitsk@redhat.com>, Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rename kvm_apic_has_events() to kvm_apic_has_pending_init_or_sipi() so
that it's more obvious that "events" really just means "INIT or SIPI".

Opportunistically clean up a weirdly worded comment that referenced
kvm_apic_has_events() instead of kvm_apic_accept_events().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.h | 2 +-
 arch/x86/kvm/x86.c   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
index c3ce6b0b1ea3..a5ac4a5a5179 100644
--- a/arch/x86/kvm/lapic.h
+++ b/arch/x86/kvm/lapic.h
@@ -224,7 +224,7 @@ static inline bool kvm_vcpu_apicv_active(struct kvm_vcpu *vcpu)
 	return lapic_in_kernel(vcpu) && vcpu->arch.apic->apicv_active;
 }
 
-static inline bool kvm_apic_has_events(struct kvm_vcpu *vcpu)
+static inline bool kvm_apic_has_pending_init_or_sipi(struct kvm_vcpu *vcpu)
 {
 	return lapic_in_kernel(vcpu) && vcpu->arch.apic->pending_events;
 }
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 59be7b16b92f..16a24dd28f26 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11920,8 +11920,8 @@ void kvm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event)
 		struct fpstate *fpstate = vcpu->arch.guest_fpu.fpstate;
 
 		/*
-		 * To avoid have the INIT path from kvm_apic_has_events() that be
-		 * called with loaded FPU and does not let userspace fix the state.
+		 * All paths that lead to INIT are required to load the guest's
+		 * FPU state (because most paths are buried in KVM_RUN).
 		 */
 		if (init_event)
 			kvm_put_guest_fpu(vcpu);
@@ -12765,7 +12765,7 @@ static inline bool kvm_vcpu_has_events(struct kvm_vcpu *vcpu)
 	if (!list_empty_careful(&vcpu->async_pf.done))
 		return true;
 
-	if (kvm_apic_has_events(vcpu))
+	if (kvm_apic_has_pending_init_or_sipi(vcpu))
 		return true;
 
 	if (vcpu->arch.pv.pv_unhalted)
-- 
2.37.3.968.ga6b4b080e4-goog

