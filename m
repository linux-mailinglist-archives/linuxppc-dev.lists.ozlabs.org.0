Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B5B7A2CB8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 02:49:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hqsE2yCa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnXW54CMvz3fgS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 10:49:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hqsE2yCa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3gpcezqykdlejvreatxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnX7R0DHdz3dHt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 10:32:03 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-56f89b2535dso2528687a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 17:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824321; x=1695429121; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=B1dRB8XO+KspaRMyC7zp9UYo9xj54whk7JRM1+EstQc=;
        b=hqsE2yCaFVoNC0dOaU1LmzS6NcrrQDM13IgIInU6a0kNmFAIsJ0vXfWuYgEL/mMcI/
         oea04p6GV0mTNyPiIs1SwkRCL4C2utFzELq4CeHHMlbkmmfD9o2tH5jlkXa8hP1LeO42
         zxr9yrbcaYVxjP+/LKih7YJ70QnJWSwJ72IvJPkBI76M3CCCpbv7jgXnMYUDOgWhyxy9
         ER2qdBeOBda0hpWETBfElayNU/kfJjW8nIpxIEbRlwxnux+v+11zK/KTlA68w4yTWU1p
         TuflPQ6Fv/PiIHo4KIMyex5Vdy04rOevLdSmgZV4vA7zL5RkjpYZM2DG+9RZa2jfCW5R
         HFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824321; x=1695429121;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1dRB8XO+KspaRMyC7zp9UYo9xj54whk7JRM1+EstQc=;
        b=XjXIqX2B/ntuGMhfm8JKs+jTf4mgEVRSmZJwRdhMJWDVroCmblAMuAuFwy7ZdNfesk
         kAKScdCuvrvHVwfUf2rFGnT1ugDOGtiyQkfgPb1PgS9xEMm6DcCPtVFa490ZoJqsLvOM
         wfm2Xy90BqmkVccwN7Jq1XHgu9mA5jSKDqz1tSDekIU1CAzkrjyrg/BwmYLHxBt+vtKT
         4GiQFPOclyA1UODiLs7JBB+DGo5n1A/qCvs1Q4cFYEZR+tbFtYyV1+KiSNAnpDbLShOw
         x89qbSkvqUDD5uoTRTKftX6j/Nmu7zYD7BqL4OayfMDvUoo/vt7ICvzLS3MGcHrKFh+v
         f9+A==
X-Gm-Message-State: AOJu0YxYyu7pRxGcrJ8Nj4nBujOANQHqG6/fZaWFFGbS/+jZjsmdyhSI
	nrjjkHePlsKLLjTyjr0uRhbuEJK/urw=
X-Google-Smtp-Source: AGHT+IEG3geNQyBEinQ/Gc8L0qGg6gjLTemmwswG1GJ9AY1G6CN5uqCE+2kqm1oXbdjIn4d5e6QeKtFd3X4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:7057:0:b0:574:535:60f with SMTP id
 a23-20020a637057000000b005740535060fmr69376pgn.11.1694824320845; Fri, 15 Sep
 2023 17:32:00 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:12 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-21-seanjc@google.com>
Subject: [PATCH 20/26] perf/x86: KVM: Have perf define a dedicated struct for
 getting guest PEBS data
From: Sean Christopherson <seanjc@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Andy Lutomirski <luto@kernel.org>
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, Venkatesh Srinivas <venkateshs@chromium.org>, Anish Ghulati <aghulati@google.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Thornton <andrewth@google.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Have perf define a struct for getting guest PEBS data from KVM instead of
poking into the kvm_pmu structure.  Passing in an entire "struct kvm_pmu"
_as an opaque pointer_ to get at three fields is silly, especially since
one of the fields exists purely to convey information to perf, i.e. isn't
used by KVM.

Perf should also own its APIs, i.e. define what fields/data it needs, not
rely on KVM to throw fields into data structures that effectively hold
KVM-internal state.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/events/core.c            |  5 +++--
 arch/x86/events/intel/core.c      | 18 +++++++++---------
 arch/x86/events/perf_event.h      |  3 ++-
 arch/x86/include/asm/kvm_host.h   |  9 ---------
 arch/x86/include/asm/perf_event.h | 12 ++++++++++--
 arch/x86/kvm/vmx/pmu_intel.c      | 16 +++++++++++++---
 arch/x86/kvm/vmx/vmx.c            | 10 ++++++----
 arch/x86/kvm/vmx/vmx.h            |  2 +-
 8 files changed, 44 insertions(+), 31 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 185f902e5f28..3b015cfcf41d 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -695,9 +695,10 @@ void x86_pmu_disable_all(void)
 	}
 }
 
-struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr, void *data)
+struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr,
+						  struct x86_guest_pebs *guest_pebs)
 {
-	return static_call(x86_pmu_guest_get_msrs)(nr, data);
+	return static_call(x86_pmu_guest_get_msrs)(nr, guest_pebs);
 }
 EXPORT_SYMBOL_GPL(perf_guest_get_msrs);
 
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index fa355d3658a6..9b848d7ebaaf 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -14,7 +14,6 @@
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <linux/nmi.h>
-#include <linux/kvm_host.h>
 
 #include <asm/cpufeature.h>
 #include <asm/hardirq.h>
@@ -4053,11 +4052,11 @@ static int intel_pmu_hw_config(struct perf_event *event)
  * when it uses {RD,WR}MSR, which should be handled by the KVM context,
  * specifically in the intel_pmu_{get,set}_msr().
  */
-static struct perf_guest_switch_msr *intel_guest_get_msrs(int *nr, void *data)
+static struct perf_guest_switch_msr *intel_guest_get_msrs(int *nr,
+							  struct x86_guest_pebs *guest_pebs)
 {
 	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
 	struct perf_guest_switch_msr *arr = cpuc->guest_switch_msrs;
-	struct kvm_pmu *kvm_pmu = (struct kvm_pmu *)data;
 	u64 intel_ctrl = hybrid(cpuc->pmu, intel_ctrl);
 	u64 pebs_mask = cpuc->pebs_enabled & x86_pmu.pebs_capable;
 	int global_ctrl, pebs_enable;
@@ -4090,20 +4089,20 @@ static struct perf_guest_switch_msr *intel_guest_get_msrs(int *nr, void *data)
 		return arr;
 	}
 
-	if (!kvm_pmu || !x86_pmu.pebs_ept)
+	if (!guest_pebs || !x86_pmu.pebs_ept)
 		return arr;
 
 	arr[(*nr)++] = (struct perf_guest_switch_msr){
 		.msr = MSR_IA32_DS_AREA,
 		.host = (unsigned long)cpuc->ds,
-		.guest = kvm_pmu->ds_area,
+		.guest = guest_pebs->ds_area,
 	};
 
 	if (x86_pmu.intel_cap.pebs_baseline) {
 		arr[(*nr)++] = (struct perf_guest_switch_msr){
 			.msr = MSR_PEBS_DATA_CFG,
 			.host = cpuc->active_pebs_data_cfg,
-			.guest = kvm_pmu->pebs_data_cfg,
+			.guest = guest_pebs->data_cfg,
 		};
 	}
 
@@ -4119,8 +4118,8 @@ static struct perf_guest_switch_msr *intel_guest_get_msrs(int *nr, void *data)
 		arr[pebs_enable].guest = 0;
 	} else {
 		/* Disable guest PEBS thoroughly for cross-mapped PEBS counters. */
-		arr[pebs_enable].guest &= ~kvm_pmu->host_cross_mapped_mask;
-		arr[global_ctrl].guest &= ~kvm_pmu->host_cross_mapped_mask;
+		arr[pebs_enable].guest &= ~guest_pebs->cross_mapped_mask;
+		arr[global_ctrl].guest &= ~guest_pebs->cross_mapped_mask;
 		/* Set hw GLOBAL_CTRL bits for PEBS counter when it runs for guest */
 		arr[global_ctrl].guest |= arr[pebs_enable].guest;
 	}
@@ -4128,7 +4127,8 @@ static struct perf_guest_switch_msr *intel_guest_get_msrs(int *nr, void *data)
 	return arr;
 }
 
-static struct perf_guest_switch_msr *core_guest_get_msrs(int *nr, void *data)
+static struct perf_guest_switch_msr *core_guest_get_msrs(int *nr,
+							 struct x86_guest_pebs *guest_pebs)
 {
 	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
 	struct perf_guest_switch_msr *arr = cpuc->guest_switch_msrs;
diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
index c8ba2be7585d..d805c9007e35 100644
--- a/arch/x86/events/perf_event.h
+++ b/arch/x86/events/perf_event.h
@@ -920,7 +920,8 @@ struct x86_pmu {
 	/*
 	 * Intel host/guest support (KVM)
 	 */
-	struct perf_guest_switch_msr *(*guest_get_msrs)(int *nr, void *data);
+	struct perf_guest_switch_msr *(*guest_get_msrs)(int *nr,
+							struct x86_guest_pebs *guest_pebs);
 
 	/*
 	 * Check period value for PERF_EVENT_IOC_PERIOD ioctl.
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 1a4def36d5bb..29db870dbaae 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -548,15 +548,6 @@ struct kvm_pmu {
 	u64 pebs_data_cfg;
 	u64 pebs_data_cfg_mask;
 
-	/*
-	 * If a guest counter is cross-mapped to host counter with different
-	 * index, its PEBS capability will be temporarily disabled.
-	 *
-	 * The user should make sure that this mask is updated
-	 * after disabling interrupts and before perf_guest_get_msrs();
-	 */
-	u64 host_cross_mapped_mask;
-
 	/*
 	 * The gate to release perf_events not marked in
 	 * pmc_in_use only once in a vcpu time slice.
diff --git a/arch/x86/include/asm/perf_event.h b/arch/x86/include/asm/perf_event.h
index 85a9fd5a3ec3..34c2c9a0b02b 100644
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -564,11 +564,19 @@ static inline void perf_events_lapic_init(void)	{ }
 static inline void perf_check_microcode(void) { }
 #endif
 
+struct x86_guest_pebs {
+	u64	ds_area;
+	u64	data_cfg;
+	u64	cross_mapped_mask;
+};
+
 #if defined(CONFIG_PERF_EVENTS) && defined(CONFIG_CPU_SUP_INTEL)
-extern struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr, void *data);
+extern struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr,
+							 struct x86_guest_pebs *guest_pebs);
 extern void x86_perf_get_lbr(struct x86_pmu_lbr *lbr);
 #else
-struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr, void *data);
+struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr,
+						  struct x86_guest_pebs *guest_pebs);
 static inline void x86_perf_get_lbr(struct x86_pmu_lbr *lbr)
 {
 	memset(lbr, 0, sizeof(*lbr));
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index f2efa0bf7ae8..3b3929871f7e 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -765,11 +765,20 @@ static void intel_pmu_cleanup(struct kvm_vcpu *vcpu)
 		intel_pmu_release_guest_lbr_event(vcpu);
 }
 
-void intel_pmu_cross_mapped_check(struct kvm_pmu *pmu)
+u64 intel_pmu_get_cross_mapped_mask(struct kvm_pmu *pmu)
 {
-	struct kvm_pmc *pmc = NULL;
+	u64 host_cross_mapped_mask;
+	struct kvm_pmc *pmc;
 	int bit, hw_idx;
 
+	if (!(pmu->pebs_enable & pmu->global_ctrl))
+		return 0;
+
+	/*
+	 * If a guest counter is cross-mapped to host counter with different
+	 * index, its PEBS capability will be temporarily disabled.
+	 */
+	host_cross_mapped_mask = 0;
 	for_each_set_bit(bit, (unsigned long *)&pmu->global_ctrl,
 			 X86_PMC_IDX_MAX) {
 		pmc = intel_pmc_idx_to_pmc(pmu, bit);
@@ -784,8 +793,9 @@ void intel_pmu_cross_mapped_check(struct kvm_pmu *pmu)
 		 */
 		hw_idx = pmc->perf_event->hw.idx;
 		if (hw_idx != pmc->idx && hw_idx > -1)
-			pmu->host_cross_mapped_mask |= BIT_ULL(hw_idx);
+			host_cross_mapped_mask |= BIT_ULL(hw_idx);
 	}
+	return host_cross_mapped_mask;
 }
 
 struct kvm_pmu_ops intel_pmu_ops __initdata = {
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 72e3943f3693..faf0071566ef 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7131,12 +7131,14 @@ static void atomic_switch_perf_msrs(struct vcpu_vmx *vmx)
 	struct perf_guest_switch_msr *msrs;
 	struct kvm_pmu *pmu = vcpu_to_pmu(&vmx->vcpu);
 
-	pmu->host_cross_mapped_mask = 0;
-	if (pmu->pebs_enable & pmu->global_ctrl)
-		intel_pmu_cross_mapped_check(pmu);
+	struct x86_guest_pebs guest_pebs = {
+		.ds_area = pmu->ds_area,
+		.data_cfg = pmu->pebs_data_cfg,
+		.cross_mapped_mask = intel_pmu_get_cross_mapped_mask(pmu),
+	};
 
 	/* Note, nr_msrs may be garbage if perf_guest_get_msrs() returns NULL. */
-	msrs = perf_guest_get_msrs(&nr_msrs, (void *)pmu);
+	msrs = perf_guest_get_msrs(&nr_msrs, &guest_pebs);
 	if (!msrs)
 		return;
 
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index c2130d2c8e24..476119670d82 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -670,7 +670,7 @@ static inline bool intel_pmu_lbr_is_enabled(struct kvm_vcpu *vcpu)
 	return !!vcpu_to_lbr_records(vcpu)->nr;
 }
 
-void intel_pmu_cross_mapped_check(struct kvm_pmu *pmu);
+u64 intel_pmu_get_cross_mapped_mask(struct kvm_pmu *pmu);
 int intel_pmu_create_guest_lbr_event(struct kvm_vcpu *vcpu);
 void vmx_passthrough_lbr_msrs(struct kvm_vcpu *vcpu);
 
-- 
2.42.0.459.ge4e396fd5e-goog

