Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE1463E599
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:38:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwcy6DV6z3fj3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:38:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fV1/K+jF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=35-khywykdo4iuqdzsweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fV1/K+jF;
	dkim-atps=neutral
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw0m69ssz3bjQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:10:32 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id n11-20020a634d4b000000b00477c4f50b79so50839pgl.22
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gGlMYVi+8cq5eUoZ5sdih51J8dbFvJ7SNZIQRLoo5uo=;
        b=fV1/K+jF8pmsrix+k0p4fqdMLOZW46RiubsdWwI2sgpOZ9mSf0o8kQB+E0gdgHGg9/
         eAw8H+6GYUyvY58pud7hGaMaECg17r4h3ufqi+AQiO/cd2K2PsiQx/t0E+ow2b29O1kq
         mE9Nc5EOzaOOCFpHTdWVwQd3VK8VqaamiQrK4JT5brdDF2lU7pSMAn1NZk1aO9R2/+nZ
         HvMEU0WPaG/hIKRtGO8ZlmpBj18ocxONAB+T3MZL6DtiiV1jniXaBXq2MSSMS+Eff7NV
         6zujBbiUfcV5uJuTUyGLRufJIGyZXhMyG5dt8JA41iQvZmB19fSGzEz6eLd/dvmJ66Ev
         FrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGlMYVi+8cq5eUoZ5sdih51J8dbFvJ7SNZIQRLoo5uo=;
        b=VHDggXtGQgGksWAh5d66lwgC/mvWp+YpPT324eULB7GBhH2jhsIshkaNPRlWHRAvcz
         JDlfMgB3sU6ECZ5bOmpaaeIKT8Hf2TVD5uVunL1evZ47yEmZMhVb/oxLr6K0vOUmItGj
         BIfBflyvr2GzVx/5VcutkbJbfN0JfDThMwMV6MyxIgowIGjG0tL8WEMZVJshIKmkkQ2R
         lEGY7DliLZZ61LmLiy7t5Vfe9XSF77EpHEtX9k56Nveoy4vsAUyzsLdhkASGOi5L/Hml
         lIM4bwZZPZv3dOtOOJ7KlDyZ434Ife09gw0N8+O/HoSceaKLt541p1dDbzMgpMAs4u/V
         TlpQ==
X-Gm-Message-State: ANoB5pk9vlz4bu6ef1msdEqhQHCV8617IttH+GFzH137n4R29AUEk4ow
	Az8cU2fpCZnmGWlQO2rOVLeUGa2ZTB0=
X-Google-Smtp-Source: AA0mqf7tkua9h/cWBirbpjwcNsrjWIz0JrBzEezpRIm7lfNzo4PInvRMnHehpz73z+PXMVC4o8EwEkWCrGc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:8bc1:0:b0:575:bfb9:b1fa with SMTP id
 s1-20020aa78bc1000000b00575bfb9b1famr7675712pfd.62.1669849831189; Wed, 30 Nov
 2022 15:10:31 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:15 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-32-seanjc@google.com>
Subject: [PATCH v2 31/50] KVM: x86: Do CPU compatibility checks in x86 code
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
index 19e81a99c58f..d7ea1c1175c2 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5103,7 +5103,7 @@ static int __init svm_init(void)
 	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
 	 * exposed to userspace!
 	 */
-	r = kvm_init(&svm_init_ops, sizeof(struct vcpu_svm),
+	r = kvm_init(NULL, sizeof(struct vcpu_svm),
 		     __alignof__(struct vcpu_svm), THIS_MODULE);
 	if (r)
 		goto err_kvm_init;
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 654d81f781da..8deb1bd60c10 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8592,7 +8592,7 @@ static int __init vmx_init(void)
 	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
 	 * exposed to userspace!
 	 */
-	r = kvm_init(&vmx_init_ops, sizeof(struct vcpu_vmx),
+	r = kvm_init(NULL, sizeof(struct vcpu_vmx),
 		     __alignof__(struct vcpu_vmx), THIS_MODULE);
 	if (r)
 		goto err_kvm_init;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 66f16458aa97..3571bc968cf8 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9277,10 +9277,36 @@ static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
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
@@ -9360,6 +9386,14 @@ static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
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
@@ -9402,6 +9436,8 @@ static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
 	kvm_init_msr_list();
 	return 0;
 
+out_hardware_unsetup:
+	ops->runtime_ops->hardware_unsetup();
 out_mmu_exit:
 	kvm_mmu_vendor_module_exit();
 out_free_percpu:
@@ -12037,16 +12073,7 @@ void kvm_arch_hardware_disable(void)
 
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
2.38.1.584.g0f3c55d4c2-goog

