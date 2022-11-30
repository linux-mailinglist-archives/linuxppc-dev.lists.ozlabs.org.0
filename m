Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8806463E5DD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:56:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMx1h2MbXz3gcF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:56:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jQgxp+u6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3-ukhywykdamvhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=jQgxp+u6;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw181Bhwz3cB8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:10:52 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id l4-20020a170903244400b00188c393fff1so18983923pls.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/jaxWTFPxmj21+X8Hbtmuwlu7GhNr4CXW1v8XgKCn2o=;
        b=jQgxp+u6SHc5NMy81OYePF88zDxKuqUxtOVxluvPTQI3MEuiQG2uqtD9RQG6VmOJ8F
         kk/Pbv5hy6CTAGXGAAE4oRsWW1h1FNSdzY+gt8AUeNr14OcCE+UIvjb6UQ7TpiTMFIF0
         izlNrD0kV5SMk0eBnY4nR4B5h0mn3eoylpGXZ25XCA4WeenN75ctGGp49AtZXHGvUS+T
         qZhLro5p9fp3cB2diacdo0hy8LHABjsSmVzRqwSHAFnoRTmJG580sa0oMGIlwLbpLirz
         qqtAn0DlcrzmZfTLixcwk1Q4OO5vUHO9P7L17dYxokTmYYn2YF9q+ofLTjNmrrQIy8bI
         XJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jaxWTFPxmj21+X8Hbtmuwlu7GhNr4CXW1v8XgKCn2o=;
        b=XzHxLA2RmMM+UeQfqepXmGKmbGVX3TIjL1Q9pG9XTmRqK5QevtTs68sZ4vp66sbePu
         QEmhHKanUbwJza4b3UCKUFjkRpr0Iba8kAGUaee5lulBiNtVgL+QlY7ZAiSq1tgsqrpg
         jOrIAL72ORuUFYrhNThB3uRy6VyTjmXRs1UeLqpOwskVYmZdIGPvigbsu3JXq+RHWnIb
         hLkLudcpSaMxtxPWATFgxSliH3Ebl6sAnqRCXbq8sJ2lxP/JFv6jGvs/aAB5k491PiYS
         MVy09bDn0fETt/lO/PjL9I7oYtFlZCK8pbZGmhi0JvvNVZWjqs9JQhhyuINFH4DhJ/vL
         YGug==
X-Gm-Message-State: ANoB5pkk0ysN9PDwGVGGVfDb771poGZ7mx2Fi3swgs9avb8ZHd8rDhPM
	HuMN8E1wWbwFkGARRey2XsbDYXw5Grg=
X-Google-Smtp-Source: AA0mqf6+Bap4v8ExdEec6znsKgSVG1g77x3d69DLe55WoTiV/xIM01OoU5c9uuVoqdfTkLa+0jZkKz1t3dk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:6904:b0:185:3f7a:50cc with SMTP id
 j4-20020a170902690400b001853f7a50ccmr43659852plk.99.1669849850498; Wed, 30
 Nov 2022 15:10:50 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:26 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-43-seanjc@google.com>
Subject: [PATCH v2 42/50] KVM: Disable CPU hotplug during hardware enabling/disabling
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

From: Chao Gao <chao.gao@intel.com>

Disable CPU hotplug when enabling/disabling hardware to prevent the
corner case where if the following sequence occurs:

  1. A hotplugged CPU marks itself online in cpu_online_mask
  2. The hotplugged CPU enables interrupt before invoking KVM's ONLINE
     callback
  3  hardware_{en,dis}able_all() is invoked on another CPU

the hotplugged CPU will be included in on_each_cpu() and thus get sent
through hardware_{en,dis}able_nolock() before kvm_online_cpu() is called.

        start_secondary { ...
                set_cpu_online(smp_processor_id(), true); <- 1
                ...
                local_irq_enable();  <- 2
                ...
                cpu_startup_entry(CPUHP_AP_ONLINE_IDLE); <- 3
        }

KVM currently fudges around this race by keeping track of which CPUs have
done hardware enabling (see commit 1b6c016818a5 "KVM: Keep track of which
cpus have virtualization enabled"), but that's an inefficient, convoluted,
and hacky solution.

Signed-off-by: Chao Gao <chao.gao@intel.com>
[sean: split to separate patch, write changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c  | 11 ++++++++++-
 virt/kvm/kvm_main.c | 12 ++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index dad30097f0c3..d2ad383da998 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9281,7 +9281,16 @@ static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
 
 static int kvm_x86_check_processor_compatibility(void)
 {
-	struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
+	int cpu = smp_processor_id();
+	struct cpuinfo_x86 *c = &cpu_data(cpu);
+
+	/*
+	 * Compatibility checks are done when loading KVM and when enabling
+	 * hardware, e.g. during CPU hotplug, to ensure all online CPUs are
+	 * compatible, i.e. KVM should never perform a compatibility check on
+	 * an offline CPU.
+	 */
+	WARN_ON(!cpu_online(cpu));
 
 	if (__cr4_reserved_bits(cpu_has, c) !=
 	    __cr4_reserved_bits(cpu_has, &boot_cpu_data))
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f26ea779710a..d985b24c423b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5098,15 +5098,26 @@ static void hardware_disable_all_nolock(void)
 
 static void hardware_disable_all(void)
 {
+	cpus_read_lock();
 	raw_spin_lock(&kvm_count_lock);
 	hardware_disable_all_nolock();
 	raw_spin_unlock(&kvm_count_lock);
+	cpus_read_unlock();
 }
 
 static int hardware_enable_all(void)
 {
 	int r = 0;
 
+	/*
+	 * When onlining a CPU, cpu_online_mask is set before kvm_online_cpu()
+	 * is called, and so on_each_cpu() between them includes the CPU that
+	 * is being onlined.  As a result, hardware_enable_nolock() may get
+	 * invoked before kvm_online_cpu(), which also enables hardware if the
+	 * usage count is non-zero.  Disable CPU hotplug to avoid attempting to
+	 * enable hardware multiple times.
+	 */
+	cpus_read_lock();
 	raw_spin_lock(&kvm_count_lock);
 
 	kvm_usage_count++;
@@ -5121,6 +5132,7 @@ static int hardware_enable_all(void)
 	}
 
 	raw_spin_unlock(&kvm_count_lock);
+	cpus_read_unlock();
 
 	return r;
 }
-- 
2.38.1.584.g0f3c55d4c2-goog

