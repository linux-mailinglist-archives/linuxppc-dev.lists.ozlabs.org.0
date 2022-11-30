Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA0B63E588
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:34:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwWq6tQsz3fss
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:33:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Q7q/5TXz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=33ukhywykdouzlhuqjnvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Q7q/5TXz;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw0d2vs5z3bg0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:10:25 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-3cf0762f741so66709437b3.16
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Ajf/v6plBmBpvMRb25eu7yZbuYHVVa1MLg3BBW1ApnM=;
        b=Q7q/5TXzNDPohOMoxUDiD0nnqEk1FoSW4RF/EEt8HMYjM52gPxj46PgYF/68/eUC70
         R52IpECaCvp222vr9xTL7j44GbL8VsDvPS5HArvcL4xJanWkN6UNBVlmOIcOzEnjqYoe
         h8mvG1+Ri644iv9eVrF8AA62rM3of5sqQn2h8l1NJ4Hp9LBXQlFjVGfCJ0M8iuidAG/g
         r3QoWBzS8+6cQpNc7qHKOescERK5wH+DxZ5oURQjRLgPy9Nq0G8eKIEZQN5DdxTswpJO
         dO7YdMWEfCe6tuDQ8/4qvPOOW5vLDHcu9lY8BtQx5KXbThVrpdnPftQhmMi0Ij7DKBRT
         iKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ajf/v6plBmBpvMRb25eu7yZbuYHVVa1MLg3BBW1ApnM=;
        b=ZzvsVMZNbd11oK2kKuesHxqah0iBUGKb3KdHT6YwT8bzBqkRJ6l3jBil0cJGIMPb3c
         bzBlb7C4qeOxLqlOVgBPkH/aSMg/CqSLMKzFCzH3EMy0tEqzAWpELRftgd+gCUww30+r
         Z2hBE6tBVSrBY4JugVQvXkbNu2UhFnWJUax2Yu2HLzzFNATWH0zYvzZ3vlpTV/S+zxQA
         Z/PKzt5Eow90MPP+jSJimoMAwZSux1CWrAXpdueiWF6AAS3gr/ECW/kINIWGgvSx0IZh
         3Gv3I/N4aeusFZJSdgVfrqpbYV6cc7McLIa5cV1epPiVbHHbPXpXPHdLt+u5gFSaa8Vl
         Rx2g==
X-Gm-Message-State: ANoB5plyAI5WizrUUeT5u/uGd6FqtcKlkNPCiBHgsk6Rj1YXO1m/NJA0
	/PPghllqgP0vSpjKSmvZcQAjdX7dqZc=
X-Google-Smtp-Source: AA0mqf6Y4D7Qf+J2WKP5H4v6O2gU4VSt61bmL1SListQ4TvwmtEqTFXL/Zt8AS/4xR6esIpeSKRCzrkbQ9o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:8401:0:b0:6f1:4590:92b9 with SMTP id
 u1-20020a258401000000b006f1459092b9mr33613349ybk.430.1669849822483; Wed, 30
 Nov 2022 15:10:22 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:10 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-27-seanjc@google.com>
Subject: [PATCH v2 26/50] KVM: PPC: Move processor compatibility check to
 module init
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move KVM PPC's compatibility checks to their respective module_init()
hooks, there's no need to wait until KVM's common compat check, nor is
there a need to perform the check on every CPU (provided by common KVM's
hook), as the compatibility checks operate on global data.

  arch/powerpc/include/asm/cputable.h: extern struct cpu_spec *cur_cpu_spec;
  arch/powerpc/kvm/book3s.c: return 0
  arch/powerpc/kvm/e500.c: strcmp(cur_cpu_spec->cpu_name, "e500v2")
  arch/powerpc/kvm/e500mc.c: strcmp(cur_cpu_spec->cpu_name, "e500mc")
                             strcmp(cur_cpu_spec->cpu_name, "e5500")
                             strcmp(cur_cpu_spec->cpu_name, "e6500")

Cc: Fabiano Rosas <farosas@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_ppc.h |  1 -
 arch/powerpc/kvm/book3s.c          | 10 ----------
 arch/powerpc/kvm/e500.c            |  4 ++--
 arch/powerpc/kvm/e500mc.c          |  4 ++++
 arch/powerpc/kvm/powerpc.c         |  2 +-
 5 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index bfacf12784dd..51a1824b0a16 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -118,7 +118,6 @@ extern int kvmppc_xlate(struct kvm_vcpu *vcpu, ulong eaddr,
 extern int kvmppc_core_vcpu_create(struct kvm_vcpu *vcpu);
 extern void kvmppc_core_vcpu_free(struct kvm_vcpu *vcpu);
 extern int kvmppc_core_vcpu_setup(struct kvm_vcpu *vcpu);
-extern int kvmppc_core_check_processor_compat(void);
 extern int kvmppc_core_vcpu_translate(struct kvm_vcpu *vcpu,
                                       struct kvm_translation *tr);
 
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 6d525285dbe8..87283a0e33d8 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -999,16 +999,6 @@ int kvmppc_h_logical_ci_store(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_GPL(kvmppc_h_logical_ci_store);
 
-int kvmppc_core_check_processor_compat(void)
-{
-	/*
-	 * We always return 0 for book3s. We check
-	 * for compatibility while loading the HV
-	 * or PR module
-	 */
-	return 0;
-}
-
 int kvmppc_book3s_hcall_implemented(struct kvm *kvm, unsigned long hcall)
 {
 	return kvm->arch.kvm_ops->hcall_implemented(hcall);
diff --git a/arch/powerpc/kvm/e500.c b/arch/powerpc/kvm/e500.c
index c8b2b4478545..0ea61190ec04 100644
--- a/arch/powerpc/kvm/e500.c
+++ b/arch/powerpc/kvm/e500.c
@@ -314,7 +314,7 @@ static void kvmppc_core_vcpu_put_e500(struct kvm_vcpu *vcpu)
 	kvmppc_booke_vcpu_put(vcpu);
 }
 
-int kvmppc_core_check_processor_compat(void)
+static int kvmppc_e500_check_processor_compat(void)
 {
 	int r;
 
@@ -507,7 +507,7 @@ static int __init kvmppc_e500_init(void)
 	unsigned long handler_len;
 	unsigned long max_ivor = 0;
 
-	r = kvmppc_core_check_processor_compat();
+	r = kvmppc_e500_check_processor_compat();
 	if (r)
 		goto err_out;
 
diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
index 57e0ad6a2ca3..795667f7ebf0 100644
--- a/arch/powerpc/kvm/e500mc.c
+++ b/arch/powerpc/kvm/e500mc.c
@@ -388,6 +388,10 @@ static int __init kvmppc_e500mc_init(void)
 {
 	int r;
 
+	r = kvmppc_e500mc_check_processor_compat();
+	if (r)
+		return kvmppc_e500mc;
+
 	r = kvmppc_booke_init();
 	if (r)
 		goto err_out;
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 5faf69421f13..d44b85ba8cef 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -442,7 +442,7 @@ int kvm_arch_hardware_enable(void)
 
 int kvm_arch_check_processor_compat(void *opaque)
 {
-	return kvmppc_core_check_processor_compat();
+	return 0;
 }
 
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
-- 
2.38.1.584.g0f3c55d4c2-goog

