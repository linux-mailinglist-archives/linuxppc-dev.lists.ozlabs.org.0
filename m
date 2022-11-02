Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B18EA617304
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:46:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2k773pZZz3fPp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 10:46:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=claCS3Nw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3i_tiywykdmy4qmzvos00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=claCS3Nw;
	dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2jXj2j47z3chb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 10:20:05 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id b18-20020a170903229200b00186e357f3b9so234543plh.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Nov 2022 16:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8Uwp9RFmCfERzBLmSD7eu3R9205OYPiiKzVrBdwzi3Q=;
        b=claCS3NwR+0MhaVoOkYFaVJrGvE24DgWhuNNCXqXu/cNJfkkndHulcRSJgg3bl5nWu
         ezVBksYs16BVUSTgISauIccvN25YpCmvIh4mNK/TCF369Fz0WIi83T4N5gGR00HTOqlx
         K4C+hDeDasVPWWZ4+BaBihKLBuiEHpr1atX0l4mNFYO6SnajcydRGegOOlYJnt7A9EyL
         WVgPBRXZNK+X1jmKSPJP+zS+z/RzaqKh78J6C240UaCJXUpsZczjlAYOamojaVu730U3
         lpa507MtfiYoTLuSMZbMYA0BMaBQ45neHFSt224FOIaW6TS0lAzeoj2uBvYGp04j4B2C
         qnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Uwp9RFmCfERzBLmSD7eu3R9205OYPiiKzVrBdwzi3Q=;
        b=nCTwJjXsqsT/p3vRCMHvH0Bpp9I7OnHRe5r6/QPKlf0bkdqfXPydGf3/MW2XmtGke6
         xc3rzMwNB+rjpdTpP07z9TokK2O45b5XXHshWNL2AzwGJ7qhQ4sTBWZ4q9njtoEB5c6z
         uCOGBe4fCvNqaS7QxJkOXAcswqS8Iw4558EmccyGkdzJ8zRBsQ5d28P+ii/txKGMWk+3
         SGLKcz/8L++x6mLwmfjfBjHaCVqUKS6gKp/NcPM6yyswwb+KgEEXBL4ZHOUFxNlSzjYB
         3yr9/zNP4RcObMCLCx8ijY64A+U/azl+VZrJNW9bUcRtaZQi9yHMetVZXOxVj0ucPAYj
         UsiA==
X-Gm-Message-State: ACrzQf0/m9FE0BfukxYfs3+nzLgmhJKE/z+3/+U3Dcyv5/5IdQjet7bP
	X4dCQL7KF0mOOm8kXIcJ0kgsE0qtZo0=
X-Google-Smtp-Source: AMsMyM4zzGxwdwr8knwrNkc9Tyv3aipP6cXa6lLRwTf0OJezhzGXSJ4RMlmbp1AMJSMoes4N/0MT7VKx15M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:4d0d:b0:20d:6fc0:51 with SMTP id
 mw13-20020a17090b4d0d00b0020d6fc00051mr44233781pjb.10.1667431203634; Wed, 02
 Nov 2022 16:20:03 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:56 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-30-seanjc@google.com>
Subject: [PATCH 29/44] KVM: x86: Do CPU compatibility checks in x86 code
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the CPU compatibility checks to pure x86 code, i.e. drop x86's use
of the common kvm_x86_check_cpu_compat() arch hook.  x86 is the only
architecture that "needs" to do per-CPU compatibility checks, moving
the logic to x86 will allow dropping the common code, and will also
give x86 more control over when/how the compatibility checks are
performed, e.g. TDX will need to enable hardware (do VMXON) in order to
perform compatibility checks.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c |  2 +-
 arch/x86/kvm/vmx/vmx.c |  2 +-
 arch/x86/kvm/x86.c     | 49 ++++++++++++++++++++++++++++++++----------
 3 files changed, 40 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index f48d07bfc3d7..368b4db4b240 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5144,7 +5144,7 @@ static int __init svm_init(void)
 	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
 	 * exposed to userspace!
 	 */
-	r = kvm_init(&svm_init_ops, sizeof(struct vcpu_svm),
+	r = kvm_init(NULL, sizeof(struct vcpu_svm),
 		     __alignof__(struct vcpu_svm), THIS_MODULE);
 	if (r)
 		goto err_kvm_init;
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 81690fce0eb1..26baaccb659a 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8562,7 +8562,7 @@ static int __init vmx_init(void)
 	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
 	 * exposed to userspace!
 	 */
-	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
+	r = kvm_init(NULL, sizeof(struct vcpu_vmx),
 		     __alignof__(struct vcpu_vmx), THIS_MODULE);
 	if (r)
 		goto err_kvm_init;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 2b4530a33298..94831f1a1d04 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9271,10 +9271,36 @@ static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
 	kvm_pmu_ops_update(ops->pmu_ops);
 }
 
+struct kvm_cpu_compat_check {
+	struct kvm_x86_init_ops *ops;
+	int *ret;
+};
+
+static int kvm_x86_check_processor_compatibility(struct kvm_x86_init_ops *ops)
+{
+	struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
+
+	WARN_ON(!irqs_disabled());
+
+	if (__cr4_reserved_bits(cpu_has, c) !=
+	    __cr4_reserved_bits(cpu_has, &boot_cpu_data))
+		return -EIO;
+
+	return ops->check_processor_compatibility();
+}
+
+static void kvm_x86_check_cpu_compat(void *data)
+{
+	struct kvm_cpu_compat_check *c = data;
+
+	*c->ret = kvm_x86_check_processor_compatibility(c->ops);
+}
+
 static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 {
+	struct kvm_cpu_compat_check c;
 	u64 host_pat;
-	int r;
+	int r, cpu;
 
 	if (kvm_x86_ops.hardware_enable) {
 		pr_err("kvm: already loaded vendor module '%s'\n", kvm_x86_ops.name);
@@ -9354,6 +9380,14 @@ static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 	if (r != 0)
 		goto out_mmu_exit;
 
+	c.ret = &r;
+	c.ops = ops;
+	for_each_online_cpu(cpu) {
+		smp_call_function_single(cpu, kvm_x86_check_cpu_compat, &c, 1);
+		if (r < 0)
+			goto out_hardware_unsetup;
+	}
+
 	/*
 	 * Point of no return!  DO NOT add error paths below this point unless
 	 * absolutely necessary, as most operations from this point forward
@@ -9396,6 +9430,8 @@ static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 	kvm_init_msr_list();
 	return 0;
 
+out_hardware_unsetup:
+	ops->runtime_ops->hardware_unsetup();
 out_mmu_exit:
 	kvm_mmu_vendor_module_exit();
 out_free_percpu:
@@ -12002,16 +12038,7 @@ void kvm_arch_hardware_disable(void)
 
 int kvm_arch_check_processor_compat(void *opaque)
 {
-	struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
-	struct kvm_x86_init_ops *ops = opaque;
-
-	WARN_ON(!irqs_disabled());
-
-	if (__cr4_reserved_bits(cpu_has, c) !=
-	    __cr4_reserved_bits(cpu_has, &boot_cpu_data))
-		return -EIO;
-
-	return ops->check_processor_compatibility();
+	return 0;
 }
 
 bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu)
-- 
2.38.1.431.g37b22c650d-goog

