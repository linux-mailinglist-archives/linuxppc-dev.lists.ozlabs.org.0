Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 236FC807D8F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 02:04:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=29UF0vLX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Slwyc47k4z3d8n
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 12:04:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=29UF0vLX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jmattson.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=31blxzqgkdp0orfyyxtslttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--jmattson.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Slwxl0YwLz30gH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 12:03:21 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5d1ed4b268dso1830927b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Dec 2023 17:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701910996; x=1702515796; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kNsTQFENpLV0yAX5x5gNndSdmWF67ocLDbukBVvw4Ho=;
        b=29UF0vLXGyCC+Y5SQj5Pooq4yXZe80CRzIehPUZRhkHde4J9+n/fznSSPK9TgLpTyP
         wMKwR06V1l5Nke65RbbvKDa40R7WJfmEktNcnMpxpwy9UsHAbJBE9t/yEE6xUU8TLBgJ
         Y4CKESbmBsdPSH85jEBuG5bxnGG3DStxyX0zY+B43ecVdYevDvKXN3AggyTS7F5Fg/2n
         xYaeQNVtpFcsvUcs6iqXYClna26iqlE+x2ktnr7+aJt6Lp4YjOTjSzNYV1iz4jBX46/i
         jJEDRQpcf5eH/lFiwc+SFgwiDX1f6OOaF1KImWLroaKvo89R7nydSkbez1mN3xAhXEP5
         TiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701910996; x=1702515796;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kNsTQFENpLV0yAX5x5gNndSdmWF67ocLDbukBVvw4Ho=;
        b=A/jsX1sKZHvwqxtdYn8ZMe2Qy/Vh1OJL8BfN5qLNF8pO6OvnIm79M5Y7fWMepLoa9g
         YiIt+gZGaAJwhHPgqihFeVD16PFhgU+1zYxWAUv2xEVQdmTiiTMsEE6jfiTAYldaj2TT
         pyNysuHQcW6pqdYovEGUwa9VVxMbMaVAe+CS1mBxylA9h+FIMCoEKNqFsR5/5+R2Uie6
         rj4X7Ny/XmkoB+IzokrCQzEVHT3NAf0OLisdaUfKNLDaI1goS9YKbnU6pRT4VLgTYS04
         6lUgbpvNKO450ubnFAtVFQmJCJcTtFTM23P+DwTAmiBpBc9Q3k+GfTOVCkE8TWMxDsPo
         BKIQ==
X-Gm-Message-State: AOJu0YzgR7TcvBcXo6x1fShPYKTIar+gyM2seDRes8KMYjlIyI6tILN5
	+siGRRgoVSd/WmLIAFKNEM1rV3fBOgrW/Q==
X-Google-Smtp-Source: AGHT+IEeNrOu3itFc+M9ynsd08u9d5b33h7Ph3dWYLMht1q/VwgbdO1TO2ezXuPbPGpyVmgh4Cp2D8u2f11e3g==
X-Received: from loggerhead.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:29a])
 (user=jmattson job=sendgmr) by 2002:a25:2981:0:b0:dbc:3553:efe with SMTP id
 p123-20020a252981000000b00dbc35530efemr3380ybp.4.1701910996183; Wed, 06 Dec
 2023 17:03:16 -0800 (PST)
Date: Wed,  6 Dec 2023 17:03:02 -0800
In-Reply-To: <20220921003201.1441511-11-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-11-seanjc@google.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231207010302.2240506-1-jmattson@google.com>
Subject: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
From: Jim Mattson <jmattson@google.com>
To: seanjc@google.com
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
Cc: kvm@vger.kernel.org, david@redhat.com, paul.walmsley@sifive.com, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, imbrenda@linux.ibm.com, kvmarm@lists.cs.columbia.edu, frankja@linux.ibm.com, maz@kernel.org, chenhuacai@kernel.org, mlevitsk@redhat.com, aleksandar.qemu.devel@gmail.com, palmer@dabbelt.com, borntraeger@linux.ibm.com, aou@eecs.berkeley.edu, suzuki.poulose@arm.com, atishp@atishpatra.org, alexandru.elisei@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, oliver.upton@linux.dev, james.morse@arm.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kvm_vcpu_check_block() is called while not in TASK_RUNNING, and therefore
it cannot sleep.  Writing to guest memory is therefore forbidden, but it
can happen on AMD processors if kvm_check_nested_events() causes a vmexit.

Fortunately, all events that are caught by kvm_check_nested_events() are
also recognized by kvm_vcpu_has_events() through vendor callbacks such as
kvm_x86_interrupt_allowed() or kvm_x86_ops.nested_ops->has_events(), so
remove the call and postpone the actual processing to vcpu_block().

Opportunistically honor the return of kvm_check_nested_events().  KVM
punted on the check in kvm_vcpu_running() because the only error path is
if vmx_complete_nested_posted_interrupt() fails, in which case KVM exits
to userspace with "internal error" i.e. the VM is likely dead anyways so
it wasn't worth overloading the return of kvm_vcpu_running().

Add the check mostly so that KVM is consistent with itself; the return of
the call via kvm_apic_accept_events()=>kvm_check_nested_events() that
immediately follows  _is_ checked.

Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[sean: check and handle return of kvm_check_nested_events()]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index dcc675d4e44b..8aeacbc2bff9 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10815,6 +10815,17 @@ static inline int vcpu_block(struct kvm_vcpu *vcpu)
 			return 1;
 	}
 
+	/*
+	 * Evaluate nested events before exiting the halted state.  This allows
+	 * the halt state to be recorded properly in the VMCS12's activity
+	 * state field (AMD does not have a similar field and a VM-Exit always
+	 * causes a spurious wakeup from HLT).
+	 */
+	if (is_guest_mode(vcpu)) {
+		if (kvm_check_nested_events(vcpu) < 0)
+			return 0;
+	}
+
 	if (kvm_apic_accept_events(vcpu) < 0)
 		return 0;
 	switch(vcpu->arch.mp_state) {
@@ -10837,9 +10848,6 @@ static inline int vcpu_block(struct kvm_vcpu *vcpu)
 
 static inline bool kvm_vcpu_running(struct kvm_vcpu *vcpu)
 {
-	if (is_guest_mode(vcpu))
-		kvm_check_nested_events(vcpu);
-
 	return (vcpu->arch.mp_state == KVM_MP_STATE_RUNNABLE &&
 		!vcpu->arch.apf.halted);
 }

This commit breaks delivery of a (virtualized) posted interrupt from
an L1 vCPU to a halted L2 vCPU.

Looking back at commit e6c67d8cf117 ("KVM: nVMX: Wake blocked vCPU in
guest-mode if pending interrupt in virtual APICv"), Liran wrote:

    Note that this also handles the case of nested posted-interrupt by the
    fact RVI is updated in vmx_complete_nested_posted_interrupt() which is
    called from kvm_vcpu_check_block() -> kvm_arch_vcpu_runnable() ->
    kvm_vcpu_running() -> vmx_check_nested_events() ->
    vmx_complete_nested_posted_interrupt().

Clearly, that is no longer the case.
