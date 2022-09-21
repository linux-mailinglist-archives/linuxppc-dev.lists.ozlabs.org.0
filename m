Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2516F5BF241
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 02:39:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXKKk0S9pz3fQm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 10:39:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=W1Ft16I2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3wfsqywykdeevhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=W1Ft16I2;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXKBp5P9Nz3c42
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 10:33:06 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-3454647ff7dso37982547b3.12
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 17:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=6n3oC51LepjybeCO/G1gnLj/7i8/kZTfCzCfh49ZsFY=;
        b=W1Ft16I2z4KyotR0zf9JcaxskVjiFIoTSvcCvM9GzqpfMZjOnkUbTlyR/YK2GifRmv
         QrwJq8VMURYEAE2WuDaeBV1lpmfmiUr9qttHXPB25xmfj0zo/Rm8dS6hBczWKfely1To
         iBZYJPxQgEmeTx4V8oSgxXgoc7fmc8jL0B2eJu/Yc6c7NQPqonrY7m5HwsjgveG5t8/q
         DMeMlr+fihRcdrCqNFWVENW4RNE2K4oabECK0hGgUMWhs07ZJGDjNFB5aD/IHo4M7B6i
         xV1aDtVsD/LclbxQq81QXFA9WSGbWt0X054O++Zklv0EWWKP7bGtdKwjb1syoi10fSBt
         trFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=6n3oC51LepjybeCO/G1gnLj/7i8/kZTfCzCfh49ZsFY=;
        b=BSKAN5jaCg7MUSOzAAbwCHy+YqpZOWdIiYNNVohr16AjMXP5TNeK9LSz4rKB47h1yA
         7DPESBtCZ90IjSNZpmd1lNPTkZlNtDiCCMj/cpShOrIq5GTxeV2GlZ2kWLXDF/SYnhzo
         sDtbhNlmpK1nuuXzJMy2o/wdDwVkrITaG2AVt1ppc/hmllNrYnMx1Gkv0HJyM/ZVzhH0
         pcDnEogjFtYQZefwkmcjiY5zFy/d4xTG+DCmcS78Ym0d6gNQRv7WMYsTJUbZ4zVJKHZy
         TBD6UnGRx+eQgiQ1l0kE2a1qzecPHwDQBqxgRYHj7dQ8xHMB5Vu0Yp3uRtlzTJlQJBZm
         lJfQ==
X-Gm-Message-State: ACrzQf1Hwn9UTmcrF551KDbUtdQSeBVlvqUo51oTwidee37FwQvylMqG
	6tDcNYzgqjssIl6vTaubkUu0n1IMSuM=
X-Google-Smtp-Source: AMsMyM6ajbNthck8O3WF1o+1c/8Kt+/LZ69NQ6nvF17LZv5xSYaJvw/YRsOuqwhN87Jz4vl4Gma5UjnRyp0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:c04f:0:b0:6ae:96ac:ac2d with SMTP id
 c76-20020a25c04f000000b006ae96acac2dmr21142783ybf.227.1663720384571; Tue, 20
 Sep 2022 17:33:04 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:31:59 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-11-seanjc@google.com>
Subject: [PATCH v4 10/12] KVM: x86: never write to memory from kvm_vcpu_check_block()
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

From: Paolo Bonzini <pbonzini@redhat.com>

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
-- 
2.37.3.968.ga6b4b080e4-goog

