Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B86E05BF235
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 02:35:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXKF03rHfz3dyC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 10:35:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=FGingks1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3tfsqywykddujvreatxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=FGingks1;
	dkim-atps=neutral
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXKBZ6M1tz30Ly
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 10:32:54 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id mi9-20020a17090b4b4900b00202b50464b6so7358825pjb.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 17:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=U5vFo4bt4S1YBkw7qJ/8SsXR9dI8fRaWN+LYTLGRLXc=;
        b=FGingks1cs8K3eS5eyjPLfgz2EyXv6C+mz7GjFjIsR+ztzCwCbQq/48DDu5g/uZ1Qf
         TKdHFjxeqF2i0gKdcBxhcxSwZQh25TbMTEUem6xBx1Il6mlI/R35MG7zDJLXZ+I7LRBZ
         mB01ACY29IvkNpuZxo5f8s86udAgXwT4AOfA1e8PAgFjsJzWl66pgmnkr+XqCz1Pxayf
         V7RA+S0PCVWgQtIYKdUAP6E/DVuSBq5M3Pu7Pd23qTYkXbQU93GZE0OA4qnvuhDPMOMn
         IE+AwnDKCJLEXKQ6ToCeXyPtQN6f4t7z2J4mxlNIQNjfcIA2lIcoI5cSSKDW/YvjdeCG
         Unmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=U5vFo4bt4S1YBkw7qJ/8SsXR9dI8fRaWN+LYTLGRLXc=;
        b=acdyILdFVan2MZQuJBgdxai4h9AGiA+aaKOtiWcqrsrDPZJVJ4nVHPZF6c1IqDiknv
         8CD4n7ZbC0MWL0Oght5GGgXn0wWRHsFv5+C80NcfQ8BkJmMFjou5CU7gf+B7EcygZpH4
         aaik+2riqdsBU53bORDv+WkfYCfv18JAtjBrdVQl+Gj6WLR4VrmXUjSU4+2k3Jiu1Uyz
         p5m8b1bBKoTL70UoU18LqQ612ITISjx1qCQiabklfXZ3Tbot6SbiJz4lBbaFsQON0Ztd
         hxO7nL0Kn3QN7KnORibowD8aDmD82NS0/E1/T53ZE2rg/ZdeFCVrXgUBQn67e+DMfUAT
         VrQA==
X-Gm-Message-State: ACrzQf2mZBMjA9B+6c71KqMg+6txTBxIWypZOLH0KImbMmB265u9bwnb
	VaH5DWYxT1ky2cT1M6jbhf5C2zpotbw=
X-Google-Smtp-Source: AMsMyM7I8M2k58LdiY9Bn17s48fNmOAL5wLIHciB2Qx2fxuZBU4hSU51h5SdBz6suytGhuqo6XNaa5/wPfk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:a9c6:b0:178:b2d4:f8b2 with SMTP id
 b6-20020a170902a9c600b00178b2d4f8b2mr2142306plr.79.1663720372595; Tue, 20 Sep
 2022 17:32:52 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:31:52 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-4-seanjc@google.com>
Subject: [PATCH v4 03/12] KVM: x86: Rename and expose helper to detect if
 INIT/SIPI are allowed
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

Rename and invert kvm_vcpu_latch_init() to kvm_apic_init_sipi_allowed()
so as to match the behavior of {interrupt,nmi,smi}_allowed(), and expose
the helper so that it can be used by kvm_vcpu_has_events() to determine
whether or not an INIT or SIPI is pending _and_ can be taken immediately.

Opportunistically replaced usage of the "latch" terminology with "blocked"
and/or "allowed", again to align with KVM's terminology used for all other
event types.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.c | 4 ++--
 arch/x86/kvm/lapic.h | 7 +++++++
 arch/x86/kvm/x86.c   | 9 +++++----
 arch/x86/kvm/x86.h   | 5 -----
 4 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 9dda989a1cf0..2bd90effc653 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -3051,14 +3051,14 @@ int kvm_apic_accept_events(struct kvm_vcpu *vcpu)
 	}
 
 	/*
-	 * INITs are latched while CPU is in specific states
+	 * INITs are blocked while CPU is in specific states
 	 * (SMM, VMX root mode, SVM with GIF=0).
 	 * Because a CPU cannot be in these states immediately
 	 * after it has processed an INIT signal (and thus in
 	 * KVM_MP_STATE_INIT_RECEIVED state), just eat SIPIs
 	 * and leave the INIT pending.
 	 */
-	if (kvm_vcpu_latch_init(vcpu)) {
+	if (!kvm_apic_init_sipi_allowed(vcpu)) {
 		WARN_ON_ONCE(vcpu->arch.mp_state == KVM_MP_STATE_INIT_RECEIVED);
 		if (test_bit(KVM_APIC_SIPI, &pe))
 			clear_bit(KVM_APIC_SIPI, &apic->pending_events);
diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
index 117a46df5cc1..c3ce6b0b1ea3 100644
--- a/arch/x86/kvm/lapic.h
+++ b/arch/x86/kvm/lapic.h
@@ -7,6 +7,7 @@
 #include <linux/kvm_host.h>
 
 #include "hyperv.h"
+#include "kvm_cache_regs.h"
 
 #define KVM_APIC_INIT		0
 #define KVM_APIC_SIPI		1
@@ -228,6 +229,12 @@ static inline bool kvm_apic_has_events(struct kvm_vcpu *vcpu)
 	return lapic_in_kernel(vcpu) && vcpu->arch.apic->pending_events;
 }
 
+static inline bool kvm_apic_init_sipi_allowed(struct kvm_vcpu *vcpu)
+{
+	return !is_smm(vcpu) &&
+	       !static_call(kvm_x86_apic_init_signal_blocked)(vcpu);
+}
+
 static inline bool kvm_lowest_prio_delivery(struct kvm_lapic_irq *irq)
 {
 	return (irq->delivery_mode == APIC_DM_LOWEST ||
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index e1a25e46dbf7..59be7b16b92f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11293,11 +11293,12 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
 		goto out;
 
 	/*
-	 * KVM_MP_STATE_INIT_RECEIVED means the processor is in
-	 * INIT state; latched init should be reported using
-	 * KVM_SET_VCPU_EVENTS, so reject it here.
+	 * Pending INITs are reported using KVM_SET_VCPU_EVENTS, disallow
+	 * forcing the guest into INIT/SIPI if those events are supposed to be
+	 * blocked.  KVM prioritizes SMI over INIT, so reject INIT/SIPI state
+	 * if an SMI is pending as well.
 	 */
-	if ((kvm_vcpu_latch_init(vcpu) || vcpu->arch.smi_pending) &&
+	if ((!kvm_apic_init_sipi_allowed(vcpu) || vcpu->arch.smi_pending) &&
 	    (mp_state->mp_state == KVM_MP_STATE_SIPI_RECEIVED ||
 	     mp_state->mp_state == KVM_MP_STATE_INIT_RECEIVED))
 		goto out;
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index a784ff90740b..829d3134c1eb 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -275,11 +275,6 @@ static inline bool kvm_check_has_quirk(struct kvm *kvm, u64 quirk)
 	return !(kvm->arch.disabled_quirks & quirk);
 }
 
-static inline bool kvm_vcpu_latch_init(struct kvm_vcpu *vcpu)
-{
-	return is_smm(vcpu) || static_call(kvm_x86_apic_init_signal_blocked)(vcpu);
-}
-
 void kvm_inject_realmode_interrupt(struct kvm_vcpu *vcpu, int irq, int inc_eip);
 
 u64 get_kvmclock_ns(struct kvm *kvm);
-- 
2.37.3.968.ga6b4b080e4-goog

