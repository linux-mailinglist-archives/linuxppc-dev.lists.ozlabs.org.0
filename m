Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 737A563E5F6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 01:00:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMx5r1dNMz3gk2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 11:00:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WxyXo6El;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3aeohywykdao2okxtmqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WxyXo6El;
	dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw1H4t3jz3bfQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:10:59 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id b4-20020a253404000000b006fad1bb09f4so2443364yba.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=CIVhF304FuNQHCB0Z/ANdcEHcyexrW00nsg3ZbCG6ks=;
        b=WxyXo6El3AY3uS2CCE8493fXu5Xim7YHqqUPh5hzzujrZqyuJESfWenTy3nM6goYlp
         Z9t0u1cXbo7QWoXuGL3MuNsbCmhLbbziVjnZasLEcNF5XDaOA82dzqNjxV6bd+ZXrBOC
         /ouUqQeBN7042wSndX+tSRiQP6X7P+98Su9Dei0Z17rkfvZAd/jLirbP5QBkwrW3aWKt
         1igXOjcHEfQeCGZapH0wZ1BZKBga5N9z/Z6l5lhjCwpkIDHHLigwALPJgAk7OvgTgEjH
         y+VeL/ZtkLtUj/8FA5qjJYzxmjn4cU7jTfcqyGA+KImrdI9VHKKYtcoYCpwItGcZ4cNZ
         q+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIVhF304FuNQHCB0Z/ANdcEHcyexrW00nsg3ZbCG6ks=;
        b=6rkk9xgyYRfFi0t5VNx2InaNODVvdS/9lswkajWJ+QGhh0XQi5YmYxMEh4xj6SJHsP
         VF8Sm5J9sPFeBUbu70/f+FMmIBDENVfciVtq1VoNVP2pYvd0B5y0REhJLgsewiSJ+J11
         1+9eyPGJdJC/dwCCXCzn000QrkuBtxQRGE/HYT9s5qk/RIdCRQdjkKeuKPTIOKVCcr92
         bRAzDalNhro6SfNnXKDKiuORPax5aKRXZz/CYBZNzR/d9XkPcF9LVNcDxLH0/nVinHfa
         rK5znn9ZMMm7WACZZfQl+a5WZ6X0CkvKsoFvaf3bWA0XIW8Pep6J7AMkTLsvjxHMp1xL
         tD7A==
X-Gm-Message-State: ANoB5pnwlYUGoXStBgiS+/h4XELYJcyrAkp8YH9S9y+z6OZK/3n6tdAK
	wEdrZBCzNxDIxVcrRmAZzHriU5wJnDI=
X-Google-Smtp-Source: AA0mqf4TEmJmGOhumywvokE0rv0nuh+lBrITum4tft1lpQQWM3mKCYwOKeeHTdy7a16GXjVSX22jSKiu+4I=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:d30b:0:b0:6f9:3655:7a59 with SMTP id
 e11-20020a25d30b000000b006f936557a59mr8795192ybf.443.1669849857534; Wed, 30
 Nov 2022 15:10:57 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:30 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-47-seanjc@google.com>
Subject: [PATCH v2 46/50] KVM: Use a per-CPU variable to track which CPUs have
 enabled virtualization
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

Use a per-CPU variable instead of a shared bitmap to track which CPUs
have successfully enabled virtualization hardware.  Using a per-CPU bool
avoids the need for an additional allocation, and arguably yields easier
to read code.  Using a bitmap would be advantageous if KVM used it to
avoid generating IPIs to CPUs that failed to enable hardware, but that's
an extreme edge case and not worth optimizing, and the low level helpers
would still want to keep their individual checks as attempting to enable
virtualization hardware when it's already enabled can be problematic,
e.g. Intel's VMXON will fault.

Opportunistically change the order in hardware_enable_nolock() to set
the flag if and only if hardware enabling is successful, instead of
speculatively setting the flag and then clearing it on failure.

Add a comment explaining that the check in hardware_disable_nolock()
isn't simply paranoia.  Waaay back when, commit 1b6c016818a5 ("KVM: Keep
track of which cpus have virtualization enabled"), added the logic as a
guards against CPU hotplug racing with hardware enable/disable.  Now that
KVM has eliminated the race by taking cpu_hotplug_lock for read (via
cpus_read_lock()) when enabling or disabling hardware, at first glance it
appears that the check is now superfluous, i.e. it's tempting to remove
the per-CPU flag entirely...

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a27ded004644..c1e48c18e2d9 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -102,7 +102,7 @@ EXPORT_SYMBOL_GPL(halt_poll_ns_shrink);
 DEFINE_MUTEX(kvm_lock);
 LIST_HEAD(vm_list);
 
-static cpumask_var_t cpus_hardware_enabled;
+static DEFINE_PER_CPU(bool, hardware_enabled);
 static int kvm_usage_count;
 static atomic_t hardware_enable_failed;
 
@@ -5027,21 +5027,17 @@ static struct miscdevice kvm_dev = {
 
 static void hardware_enable_nolock(void *junk)
 {
-	int cpu = smp_processor_id();
-	int r;
-
-	if (cpumask_test_cpu(cpu, cpus_hardware_enabled))
+	if (__this_cpu_read(hardware_enabled))
 		return;
 
-	cpumask_set_cpu(cpu, cpus_hardware_enabled);
-
-	r = kvm_arch_hardware_enable();
-
-	if (r) {
-		cpumask_clear_cpu(cpu, cpus_hardware_enabled);
+	if (kvm_arch_hardware_enable()) {
 		atomic_inc(&hardware_enable_failed);
-		pr_info("kvm: enabling virtualization on CPU%d failed\n", cpu);
+		pr_info("kvm: enabling virtualization on CPU%d failed\n",
+			raw_smp_processor_id());
+		return;
 	}
+
+	__this_cpu_write(hardware_enabled, true);
 }
 
 static int kvm_online_cpu(unsigned int cpu)
@@ -5070,12 +5066,16 @@ static int kvm_online_cpu(unsigned int cpu)
 
 static void hardware_disable_nolock(void *junk)
 {
-	int cpu = smp_processor_id();
-
-	if (!cpumask_test_cpu(cpu, cpus_hardware_enabled))
+	/*
+	 * Note, hardware_disable_all_nolock() tells all online CPUs to disable
+	 * hardware, not just CPUs that successfully enabled hardware!
+	 */
+	if (!__this_cpu_read(hardware_enabled))
 		return;
-	cpumask_clear_cpu(cpu, cpus_hardware_enabled);
+
 	kvm_arch_hardware_disable();
+
+	__this_cpu_write(hardware_enabled, false);
 }
 
 static int kvm_offline_cpu(unsigned int cpu)
@@ -5876,13 +5876,11 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 	int r;
 	int cpu;
 
-	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL))
-		return -ENOMEM;
-
 	r = cpuhp_setup_state_nocalls(CPUHP_AP_KVM_ONLINE, "kvm/cpu:online",
 				      kvm_online_cpu, kvm_offline_cpu);
 	if (r)
-		goto out_free_2;
+		return r;
+
 	register_reboot_notifier(&kvm_reboot_notifier);
 
 	/* A kmem cache lets us meet the alignment requirements of fx_save. */
@@ -5955,8 +5953,6 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 out_free_3:
 	unregister_reboot_notifier(&kvm_reboot_notifier);
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
-out_free_2:
-	free_cpumask_var(cpus_hardware_enabled);
 	return r;
 }
 EXPORT_SYMBOL_GPL(kvm_init);
@@ -5982,7 +5978,6 @@ void kvm_exit(void)
 	unregister_reboot_notifier(&kvm_reboot_notifier);
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
 	kvm_irqfd_exit();
-	free_cpumask_var(cpus_hardware_enabled);
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
 
-- 
2.38.1.584.g0f3c55d4c2-goog

