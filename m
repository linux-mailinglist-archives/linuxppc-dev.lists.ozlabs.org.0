Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D78495BF240
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 02:38:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXKK34f9Hz3fN1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 10:38:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rpWC/VKj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3vlsqywykdd8tfbokdhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rpWC/VKj;
	dkim-atps=neutral
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXKBm5jYZz3br0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 10:33:04 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id v18-20020a17090a899200b00200a2c60f3aso7370692pjn.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 17:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=+nmtDj/EH/uK0SyJnyCY1A9LxFaUnx5384By8rF2AcA=;
        b=rpWC/VKjogxaSKricNAD/sRggDf2m+ppcZ99cC4f6M2lXn9866lNJfALVMtFhxatIn
         qQLLRO1BUtEoQdRvY1yCuXD/CtkIEdb3+zCRL0TNiOdne1CQBhI/BizUOruqlzoGL1ru
         VCaVy6ynkLdl8Y2SlQn7F72+sRnXKS9nW+9M+WtquUBaCslXgLIbNwAo/KbGQ39Ut11+
         iX38zqjv00zbeQfFOy8nLz7/nmQA6SCthL08Bvu2Mg/I39d68rA1efgAA/OI3nSBX2ld
         cXZNYtWAos3dWx8qB/6lW1KWT1k2gQ6b3mCS+VL9cYwYuehjdDCD0p4cY7hCsI3NeNJV
         wlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=+nmtDj/EH/uK0SyJnyCY1A9LxFaUnx5384By8rF2AcA=;
        b=dcemrgjBOCj/RutqWj02G1bjoMHhhG9qtNs1oJBmlmqJofNwTDoS4N6+dqYdChJ9lK
         cHZWLqoMVs2ItvzJCqJQi7BuGcYqH4Q1rLQNdrDaa/ZLncdzYBAZVcS3N/+zNGi1mu96
         VowxwsKpVMP/u2GMXMCT8CFKV5izAWdP9/7jsN35sjyVCCNQNK+WGcwKlYtsc9+sfH9c
         AExVUp0gZ90iak4HGn6xSbavqxhReteh3KHSF0ZcjpInLY/1fQUDDFNQsigx/sLlOJhk
         lLjxh4bo4QcRlkwPmZnbu7mVyA8Is0h4CMhLcdTQqVV7o9M6VfYmIjkCReteagkuQqFW
         Nwaw==
X-Gm-Message-State: ACrzQf0AZmf1sMyALr894Lzj88pHepsDxJwRgnNUk5CjVfabdINuaRjA
	AvJQIbQ/WJqi+FpUsBV6jwq+4kBZy7w=
X-Google-Smtp-Source: AMsMyM6zSXdEm/sdOmQ6ucVPu4StzA9LzXizITrmOCaLxtYOZuSorePqxSyOnSzLlOuDLemc+6OfhU9oA1I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:4a43:b0:202:7706:73d7 with SMTP id
 lb3-20020a17090b4a4300b00202770673d7mr6477790pjb.137.1663720382986; Tue, 20
 Sep 2022 17:33:02 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:31:58 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-10-seanjc@google.com>
Subject: [PATCH v4 09/12] KVM: x86: Don't snapshot pending INIT/SIPI prior to
 checking nested events
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

Don't snapshot pending INIT/SIPI events prior to checking nested events,
architecturally there's nothing wrong with KVM processing (dropping) a
SIPI that is received immediately after synthesizing a VM-Exit.  Taking
and consuming the snapshot makes the flow way more subtle than it needs
to be, e.g. nVMX consumes/clears events that trigger VM-Exit (INIT/SIPI),
and so at first glance it appears that KVM is double-dipping on pending
INITs and SIPIs.  But that's not the case because INIT is blocked
unconditionally in VMX root mode the CPU cannot be in wait-for_SIPI after
VM-Exit, i.e. the paths that truly consume the snapshot are unreachable
if apic->pending_events is modified by kvm_check_nested_events().

nSVM is a similar story as GIF is cleared by the CPU on VM-Exit; INIT is
blocked regardless of whether or not it was pending prior to VM-Exit.

Drop the snapshot logic so that a future fix doesn't create weirdness
when kvm_vcpu_running()'s call to kvm_check_nested_events() is moved to
vcpu_block().  In that case, kvm_check_nested_events() will be called
immediately before kvm_apic_accept_events(), which raises the obvious
question of why that change doesn't break the snapshot logic.

Note, there is a subtle functional change.  Previously, KVM would clear
pending SIPIs if and only SIPI was pending prior to VM-Exit, whereas now
KVM clears pending SIPI unconditionally if INIT+SIPI are blocked.  The
latter is architecturally allowed, as SIPI is ignored if the CPU is not
in wait-for-SIPI mode (arguably, KVM should be even more aggressive in
dropping SIPIs).  It is software's responsibility to ensure the SIPI is
delivered, i.e. software shouldn't be firing INIT-SIPI at a CPU until
it knows with 100% certaining that the target CPU isn't in VMX root mode.

Furthermore, the existing code is extra weird as SIPIs that arrive after
VM-Exit _are_ dropped if there also happened to be a pending SIPI before
VM-Exit.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.c | 36 ++++++++++--------------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 2bd90effc653..d7639d126e6c 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -3025,17 +3025,8 @@ int kvm_apic_accept_events(struct kvm_vcpu *vcpu)
 	struct kvm_lapic *apic = vcpu->arch.apic;
 	u8 sipi_vector;
 	int r;
-	unsigned long pe;
 
-	if (!lapic_in_kernel(vcpu))
-		return 0;
-
-	/*
-	 * Read pending events before calling the check_events
-	 * callback.
-	 */
-	pe = smp_load_acquire(&apic->pending_events);
-	if (!pe)
+	if (!kvm_apic_has_pending_init_or_sipi(vcpu))
 		return 0;
 
 	if (is_guest_mode(vcpu)) {
@@ -3043,38 +3034,31 @@ int kvm_apic_accept_events(struct kvm_vcpu *vcpu)
 		if (r < 0)
 			return r == -EBUSY ? 0 : r;
 		/*
-		 * If an event has happened and caused a vmexit,
-		 * we know INITs are latched and therefore
-		 * we will not incorrectly deliver an APIC
-		 * event instead of a vmexit.
+		 * Continue processing INIT/SIPI even if a nested VM-Exit
+		 * occurred, e.g. pending SIPIs should be dropped if INIT+SIPI
+		 * are blocked as a result of transitioning to VMX root mode.
 		 */
 	}
 
 	/*
-	 * INITs are blocked while CPU is in specific states
-	 * (SMM, VMX root mode, SVM with GIF=0).
-	 * Because a CPU cannot be in these states immediately
-	 * after it has processed an INIT signal (and thus in
-	 * KVM_MP_STATE_INIT_RECEIVED state), just eat SIPIs
-	 * and leave the INIT pending.
+	 * INITs are blocked while CPU is in specific states (SMM, VMX root
+	 * mode, SVM with GIF=0), while SIPIs are dropped if the CPU isn't in
+	 * wait-for-SIPI (WFS).
 	 */
 	if (!kvm_apic_init_sipi_allowed(vcpu)) {
 		WARN_ON_ONCE(vcpu->arch.mp_state == KVM_MP_STATE_INIT_RECEIVED);
-		if (test_bit(KVM_APIC_SIPI, &pe))
-			clear_bit(KVM_APIC_SIPI, &apic->pending_events);
+		clear_bit(KVM_APIC_SIPI, &apic->pending_events);
 		return 0;
 	}
 
-	if (test_bit(KVM_APIC_INIT, &pe)) {
-		clear_bit(KVM_APIC_INIT, &apic->pending_events);
+	if (test_and_clear_bit(KVM_APIC_INIT, &apic->pending_events)) {
 		kvm_vcpu_reset(vcpu, true);
 		if (kvm_vcpu_is_bsp(apic->vcpu))
 			vcpu->arch.mp_state = KVM_MP_STATE_RUNNABLE;
 		else
 			vcpu->arch.mp_state = KVM_MP_STATE_INIT_RECEIVED;
 	}
-	if (test_bit(KVM_APIC_SIPI, &pe)) {
-		clear_bit(KVM_APIC_SIPI, &apic->pending_events);
+	if (test_and_clear_bit(KVM_APIC_SIPI, &apic->pending_events)) {
 		if (vcpu->arch.mp_state == KVM_MP_STATE_INIT_RECEIVED) {
 			/* evaluate pending_events before reading the vector */
 			smp_rmb();
-- 
2.37.3.968.ga6b4b080e4-goog

