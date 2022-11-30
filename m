Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE1063E5BD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:51:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwwP0Ynkz3gT2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:51:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=c7btJG8V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=38ekhywykdpgxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=c7btJG8V;
	dkim-atps=neutral
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw0z0xmjz3bWV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:10:43 +1100 (AEDT)
Received: by mail-pf1-x44a.google.com with SMTP id v23-20020aa78097000000b005748c087db1so209087pff.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=dHU3XdySL+sqLW+/LrYmZDKEHUg9NLktQjaTwPQsVog=;
        b=c7btJG8Vz8oky7wiaNPxy35uhrDeANgOVQezTibSlYx2PbLSsMoH8mDkHjvWv43r2I
         DOyGFxiN/wlU13wd54TlpFEXVNRhIPVkrbT8VpB5+R7A+NORau1uqiIuKdNp1l9ZxS3q
         63CVt28/ps3LWgQLgldTdPmii2k6nYJPIndkTp9NkSDs8QnJA4J1ix03atRul1JJ3BJo
         V4dVc1X9caFKy+lQSJ06QfkENtsRL2kJnSrgxeyZLCJnwJ/oKQ1fSFF4sK0sqmL7zSo3
         SfI9db7qU+AzVLeBiqxZmQO+74EumASU/wum9bD/2lVaCR/4JTt9XngR5ZgsGJrmLu4R
         AyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dHU3XdySL+sqLW+/LrYmZDKEHUg9NLktQjaTwPQsVog=;
        b=biXQIDQdVVBUuRgSk6A0BWoVYKCZakAnHyYbyJSYwKKoY1uoL8mb10oegVEvl5bsK/
         lxvAywm3sPCNyvAGctUEzAyLyagjQiEIzbC/urXKa1H7IKoQlDOgZGSdX5J2gftwsq/t
         RpJ07DsGK/ITxMREvtbXVseZ+3BJnUFUisCGl1yiRLLnezIWJYL9jqAkr0vMTLvADdGa
         brAEjllhKdBe3GwNVDMtRMR4ZJwdd6JPWbN9rlIxYwRN+Gb95R3l46Nm4vXS6pn6C/wO
         Ehdrd3UhoFcjoKxhQOoVoxuMF0/ebHg7zng8svOcqocjuj8S+XQI0kes5RPahFsKomig
         xL/w==
X-Gm-Message-State: ANoB5pkp/NyrZ0BnKwyBuVJBIMBUnQPAAtq+tuENmfq65EeML0lWEe13
	ZEnz5jI8/qfp8h9Yz8UFGv5fvNJCf+Q=
X-Google-Smtp-Source: AA0mqf7lZJJIAb/z3d8ghyEmf3T+skYhpBDPK5HurVPIO9Y/yo5JSkPk3YpIVuNzGNu9rTBuuswE8IOM/i8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:515:b0:189:90d4:3c03 with SMTP id
 jn21-20020a170903051500b0018990d43c03mr15127383plb.45.1669849841483; Wed, 30
 Nov 2022 15:10:41 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:21 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-38-seanjc@google.com>
Subject: [PATCH v2 37/50] KVM: VMX: Shuffle support checks and hardware
 enabling code around
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

Reorder code in vmx.c so that the VMX support check helpers reside above
the hardware enabling helpers, which will allow KVM to perform support
checks during hardware enabling (in a future patch).

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 216 ++++++++++++++++++++---------------------
 1 file changed, 108 insertions(+), 108 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 23b64bf4bfcf..2a8a6e481c76 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2485,79 +2485,6 @@ static void vmx_cache_reg(struct kvm_vcpu *vcpu, enum kvm_reg reg)
 	}
 }
 
-static int kvm_cpu_vmxon(u64 vmxon_pointer)
-{
-	u64 msr;
-
-	cr4_set_bits(X86_CR4_VMXE);
-
-	asm_volatile_goto("1: vmxon %[vmxon_pointer]\n\t"
-			  _ASM_EXTABLE(1b, %l[fault])
-			  : : [vmxon_pointer] "m"(vmxon_pointer)
-			  : : fault);
-	return 0;
-
-fault:
-	WARN_ONCE(1, "VMXON faulted, MSR_IA32_FEAT_CTL (0x3a) = 0x%llx\n",
-		  rdmsrl_safe(MSR_IA32_FEAT_CTL, &msr) ? 0xdeadbeef : msr);
-	cr4_clear_bits(X86_CR4_VMXE);
-
-	return -EFAULT;
-}
-
-static int vmx_hardware_enable(void)
-{
-	int cpu = raw_smp_processor_id();
-	u64 phys_addr = __pa(per_cpu(vmxarea, cpu));
-	int r;
-
-	if (cr4_read_shadow() & X86_CR4_VMXE)
-		return -EBUSY;
-
-	/*
-	 * This can happen if we hot-added a CPU but failed to allocate
-	 * VP assist page for it.
-	 */
-	if (static_branch_unlikely(&enable_evmcs) &&
-	    !hv_get_vp_assist_page(cpu))
-		return -EFAULT;
-
-	intel_pt_handle_vmx(1);
-
-	r = kvm_cpu_vmxon(phys_addr);
-	if (r) {
-		intel_pt_handle_vmx(0);
-		return r;
-	}
-
-	if (enable_ept)
-		ept_sync_global();
-
-	return 0;
-}
-
-static void vmclear_local_loaded_vmcss(void)
-{
-	int cpu = raw_smp_processor_id();
-	struct loaded_vmcs *v, *n;
-
-	list_for_each_entry_safe(v, n, &per_cpu(loaded_vmcss_on_cpu, cpu),
-				 loaded_vmcss_on_cpu_link)
-		__loaded_vmcs_clear(v);
-}
-
-static void vmx_hardware_disable(void)
-{
-	vmclear_local_loaded_vmcss();
-
-	if (cpu_vmxoff())
-		kvm_spurious_fault();
-
-	hv_reset_evmcs();
-
-	intel_pt_handle_vmx(0);
-}
-
 /*
  * There is no X86_FEATURE for SGX yet, but anyway we need to query CPUID
  * directly instead of going through cpu_has(), to ensure KVM is trapping
@@ -2783,6 +2710,114 @@ static __init int setup_vmcs_config(struct vmcs_config *vmcs_conf,
 	return 0;
 }
 
+static bool __init kvm_is_vmx_supported(void)
+{
+	if (!cpu_has_vmx()) {
+		pr_err("CPU doesn't support VMX\n");
+		return false;
+	}
+
+	if (!this_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
+	    !this_cpu_has(X86_FEATURE_VMX)) {
+		pr_err("VMX not enabled (by BIOS) in MSR_IA32_FEAT_CTL\n");
+		return false;
+	}
+
+	return true;
+}
+
+static int __init vmx_check_processor_compat(void)
+{
+	struct vmcs_config vmcs_conf;
+	struct vmx_capability vmx_cap;
+
+	if (!kvm_is_vmx_supported())
+		return -EIO;
+
+	if (setup_vmcs_config(&vmcs_conf, &vmx_cap) < 0)
+		return -EIO;
+	if (nested)
+		nested_vmx_setup_ctls_msrs(&vmcs_conf, vmx_cap.ept);
+	if (memcmp(&vmcs_config, &vmcs_conf, sizeof(struct vmcs_config)) != 0) {
+		pr_err("CPU %d feature inconsistency!\n", smp_processor_id());
+		return -EIO;
+	}
+	return 0;
+}
+
+static int kvm_cpu_vmxon(u64 vmxon_pointer)
+{
+	u64 msr;
+
+	cr4_set_bits(X86_CR4_VMXE);
+
+	asm_volatile_goto("1: vmxon %[vmxon_pointer]\n\t"
+			  _ASM_EXTABLE(1b, %l[fault])
+			  : : [vmxon_pointer] "m"(vmxon_pointer)
+			  : : fault);
+	return 0;
+
+fault:
+	WARN_ONCE(1, "VMXON faulted, MSR_IA32_FEAT_CTL (0x3a) = 0x%llx\n",
+		  rdmsrl_safe(MSR_IA32_FEAT_CTL, &msr) ? 0xdeadbeef : msr);
+	cr4_clear_bits(X86_CR4_VMXE);
+
+	return -EFAULT;
+}
+
+static int vmx_hardware_enable(void)
+{
+	int cpu = raw_smp_processor_id();
+	u64 phys_addr = __pa(per_cpu(vmxarea, cpu));
+	int r;
+
+	if (cr4_read_shadow() & X86_CR4_VMXE)
+		return -EBUSY;
+
+	/*
+	 * This can happen if we hot-added a CPU but failed to allocate
+	 * VP assist page for it.
+	 */
+	if (static_branch_unlikely(&enable_evmcs) &&
+	    !hv_get_vp_assist_page(cpu))
+		return -EFAULT;
+
+	intel_pt_handle_vmx(1);
+
+	r = kvm_cpu_vmxon(phys_addr);
+	if (r) {
+		intel_pt_handle_vmx(0);
+		return r;
+	}
+
+	if (enable_ept)
+		ept_sync_global();
+
+	return 0;
+}
+
+static void vmclear_local_loaded_vmcss(void)
+{
+	int cpu = raw_smp_processor_id();
+	struct loaded_vmcs *v, *n;
+
+	list_for_each_entry_safe(v, n, &per_cpu(loaded_vmcss_on_cpu, cpu),
+				 loaded_vmcss_on_cpu_link)
+		__loaded_vmcs_clear(v);
+}
+
+static void vmx_hardware_disable(void)
+{
+	vmclear_local_loaded_vmcss();
+
+	if (cpu_vmxoff())
+		kvm_spurious_fault();
+
+	hv_reset_evmcs();
+
+	intel_pt_handle_vmx(0);
+}
+
 struct vmcs *alloc_vmcs_cpu(bool shadow, int cpu, gfp_t flags)
 {
 	int node = cpu_to_node(cpu);
@@ -7468,41 +7503,6 @@ static int vmx_vm_init(struct kvm *kvm)
 	return 0;
 }
 
-static bool __init kvm_is_vmx_supported(void)
-{
-	if (!cpu_has_vmx()) {
-		pr_err("CPU doesn't support VMX\n");
-		return false;
-	}
-
-	if (!this_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
-	    !this_cpu_has(X86_FEATURE_VMX)) {
-		pr_err("VMX not enabled (by BIOS) in MSR_IA32_FEAT_CTL\n");
-		return false;
-	}
-
-	return true;
-}
-
-static int __init vmx_check_processor_compat(void)
-{
-	struct vmcs_config vmcs_conf;
-	struct vmx_capability vmx_cap;
-
-	if (!kvm_is_vmx_supported())
-		return -EIO;
-
-	if (setup_vmcs_config(&vmcs_conf, &vmx_cap) < 0)
-		return -EIO;
-	if (nested)
-		nested_vmx_setup_ctls_msrs(&vmcs_conf, vmx_cap.ept);
-	if (memcmp(&vmcs_config, &vmcs_conf, sizeof(struct vmcs_config)) != 0) {
-		pr_err("CPU %d feature inconsistency!\n", smp_processor_id());
-		return -EIO;
-	}
-	return 0;
-}
-
 static u8 vmx_get_mt_mask(struct kvm_vcpu *vcpu, gfn_t gfn, bool is_mmio)
 {
 	u8 cache;
-- 
2.38.1.584.g0f3c55d4c2-goog

