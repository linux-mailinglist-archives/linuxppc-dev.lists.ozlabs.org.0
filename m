Return-Path: <linuxppc-dev+bounces-10441-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B46B1523A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jul 2025 19:43:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bs2k8512Gz3bmQ;
	Wed, 30 Jul 2025 03:42:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::54a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753810976;
	cv=none; b=YFLYZC3FhrQuQzh6JLg7WLSWTgX7yt7OEmL4u/DkQIV8oJfPxwKdQAaH8CJzv0cw07lRe2sLohOFm9o/TiZkdtNu2uSMJ4w77Xzg6U62WstrE3smcOkTQsAJvmViSGhC7L9A4OPiex23OwYQn+7fe+X+gxyPsr+ouy9Txn+pLkQ7ZDCz95f8QKUJjJz+O+a0+17Km5qJFWIzsAsNK9KEvMaP3+mWBz9xINniGsLMcaI7ty5MGW7kWPdTBpYiGPI/X+PdlSQdP5dQZS0yHjHq54Gb1rZZBGkqxA2S+VYzmWegr2q6EZrUyMyhS+Qel2whiDOWb87AZRUZ40pX9p7XlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753810976; c=relaxed/relaxed;
	bh=zBwnBSkL9rhJYWurRlCWyKaUzSq9fJX2MjMTW/ih42U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k8Oi6cnVaUoEHpPM3/3wAF3fQs1OvM6ntb7OOO3g/3+HVZt1c2Zou9FhDIBqtZBjcLTTCS70tzP1jDBU0bySk1bHMk1RhwU8Q+C+4u2zhnyfWrPlav//DedWr1ohGBzdrkY22T4dTCvP5jcwW6xbe2CYAQ13yKYlAlnytdK8cUWG5opz7OsfiYb6q5QFC6AVfAACI/yppI175A57PJa8ZVzsXVvjwZ2zE0BKuQHs29cYkZaaZl8PO+Dqmpkdu1mPf+OmXZ52a5XZeNO8+fOV2vwu+qqwDEgxiZ10yzqB9zp5PQFItW4bbFVo8Ku/QHt/r+14lQxjlr8+/lNRFpmFnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Rb1iAg20; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3hqijaaykdjwoa6jf8ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Rb1iAg20;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3hqijaaykdjwoa6jf8ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bs2k72Gclz3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 03:42:55 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b2c00e965d0so3874341a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jul 2025 10:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753810974; x=1754415774; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zBwnBSkL9rhJYWurRlCWyKaUzSq9fJX2MjMTW/ih42U=;
        b=Rb1iAg20jh+ToPCnq40s3tRTWmIuFMR656XSx3wyzuWF8EQaWuv7QVhYx3Ou8OuVpK
         Sih9tS07AcSHjtCr8YpnTOGiQq0825GW9+jua6Ds7MZ7kq9uXMYa3KRmr0L6TK8dV8+O
         bz7GLPQOd00EuISbSrco8eW0ug0Y+JirZsjh7EcnfWJLSYTWBqzc6yALOJUwQ6O8ReeB
         Rf2jJYQcXLJFr90Z7tX8aOu60IOVgNoopX+EK6SyFJdV6jFVx3RAd/YsTnknLhaPnuea
         yAnAUtV6LAHNeFPcvqk5u3XAr04hM9ODhgV79Oduoqz/oBuFLRdRPWJpdWEHbLaakIlm
         FHjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753810974; x=1754415774;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBwnBSkL9rhJYWurRlCWyKaUzSq9fJX2MjMTW/ih42U=;
        b=xOsugvwYtwZ3l2DLkvQBqi2vm+mvSDyXVVc3RPCRYYsXlEe9amSkj3i5eOav0+pHhN
         kPMF+nPpbe+WRCIEhZD1Odh2lAAoUOd1hJWv0wE0LELwOtl/v7g50vlh83CSO5X3NXWO
         oEW0TjUXFIlwkajCRxO6M3PyKbzCiQzQMldB25CejIYkFlOKj1cVVugwXGVzyzO+kyYw
         QYcPgiG0+3b5pUjLiCiCpDJ6IdlbrcAhjmoGopbtDsPfdcfU7o1ywmoxVstNj2nYDm2d
         m7Sa53cZT/bZKo5gV7XUQ3QYTiXUs0Yum1P7WbpLw+PjJ42pqg9Nj6NOcthbEWVOHH3c
         E9pw==
X-Gm-Message-State: AOJu0Yw+EBL62J3YHCFrCj2TvwcdCR5gHisxR6bkcw+usKJzzsPPbwNY
	g0JQXFe02ISO/cRvBTA//NX83sqsuISnWIthzT7+xtqtEZD1v9FNduV91bg079rFiRRKtVF4Hao
	XZS+0hQ==
X-Google-Smtp-Source: AGHT+IEpOmy40vDFCiONIhzTIzLKN2AuWJocp42dCS5K3oolGB8Mze9xosKvNjDUUAqfkE9xtUP2v9nDV9Y=
X-Received: from pjg11.prod.google.com ([2002:a17:90b:3f4b:b0:31e:c87a:ce95])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:28c4:b0:31e:c62b:477b
 with SMTP id 98e67ed59e1d1-31f5dd9deb9mr577076a91.11.1753810973679; Tue, 29
 Jul 2025 10:42:53 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Jul 2025 10:42:38 -0700
In-Reply-To: <20250729174238.593070-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20250729174238.593070-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729174238.593070-7-seanjc@google.com>
Subject: [PATCH 6/6] x86: Restrict KVM-induced symbol exports to KVM modules
 where obvious/possible
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Andy Lutomirski <luto@kernel.org>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Holger Dengler <dengler@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-sgx@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Extend KVM's export macro framework to provide EXPORT_SYMBOL_GPL_FOR_KVM(),
and use the helper macro to export symbols for KVM throughout x86 if and
only if KVM will build one or more modules, and only for those modules.

To avoid unnecessary exports when CONFIG_KVM=m but kvm.ko will not be
built (because no vendor modules are selected), let arch code #define
EXPORT_SYMBOL_GPL_FOR_KVM to suppress/override the exports.

Note, the set of symbols to restrict to KVM was generated by manual search
and audit; any "misses" are due to human error, not some grand plan.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/entry/entry.S             |  7 ++--
 arch/x86/entry/entry_64_fred.S     |  3 +-
 arch/x86/events/amd/core.c         |  5 ++-
 arch/x86/events/core.c             |  7 ++--
 arch/x86/events/intel/lbr.c        |  3 +-
 arch/x86/events/intel/pt.c         |  7 ++--
 arch/x86/include/asm/kvm_types.h   |  5 +++
 arch/x86/kernel/apic/apic.c        |  3 +-
 arch/x86/kernel/apic/apic_common.c |  3 +-
 arch/x86/kernel/cpu/amd.c          |  4 +-
 arch/x86/kernel/cpu/bugs.c         | 17 ++++----
 arch/x86/kernel/cpu/bus_lock.c     |  3 +-
 arch/x86/kernel/cpu/common.c       |  7 ++--
 arch/x86/kernel/cpu/sgx/main.c     |  3 +-
 arch/x86/kernel/cpu/sgx/virt.c     |  5 ++-
 arch/x86/kernel/e820.c             |  3 +-
 arch/x86/kernel/fpu/core.c         | 21 +++++-----
 arch/x86/kernel/fpu/xstate.c       |  7 ++--
 arch/x86/kernel/hw_breakpoint.c    |  3 +-
 arch/x86/kernel/irq.c              |  3 +-
 arch/x86/kernel/kvm.c              |  5 ++-
 arch/x86/kernel/nmi.c              |  5 +--
 arch/x86/kernel/process_64.c       |  5 +--
 arch/x86/kernel/reboot.c           |  5 ++-
 arch/x86/kernel/tsc.c              |  1 +
 arch/x86/lib/cache-smp.c           |  9 +++--
 arch/x86/lib/msr.c                 |  5 ++-
 arch/x86/mm/pat/memtype.c          |  3 +-
 arch/x86/mm/tlb.c                  |  5 ++-
 arch/x86/virt/vmx/tdx/tdx.c        | 65 +++++++++++++++---------------
 include/linux/kvm_types.h          | 14 +++++++
 31 files changed, 140 insertions(+), 101 deletions(-)

diff --git a/arch/x86/entry/entry.S b/arch/x86/entry/entry.S
index 8e9a0cc20a4a..0a94e9c93d1e 100644
--- a/arch/x86/entry/entry.S
+++ b/arch/x86/entry/entry.S
@@ -4,6 +4,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/kvm_types.h>
 #include <linux/linkage.h>
 #include <linux/objtool.h>
 #include <asm/msr-index.h>
@@ -29,8 +30,7 @@ SYM_FUNC_START(write_ibpb)
 	FILL_RETURN_BUFFER %rax, RSB_CLEAR_LOOPS, X86_BUG_IBPB_NO_RET
 	RET
 SYM_FUNC_END(write_ibpb)
-/* For KVM */
-EXPORT_SYMBOL_GPL(write_ibpb);
+EXPORT_SYMBOL_GPL_FOR_KVM(write_ibpb);
 
 .popsection
 
@@ -48,8 +48,7 @@ SYM_CODE_START_NOALIGN(x86_verw_sel)
 	.word __KERNEL_DS
 .align L1_CACHE_BYTES, 0xcc
 SYM_CODE_END(x86_verw_sel);
-/* For KVM */
-EXPORT_SYMBOL_GPL(x86_verw_sel);
+EXPORT_SYMBOL_GPL_FOR_KVM(x86_verw_sel);
 
 .popsection
 
diff --git a/arch/x86/entry/entry_64_fred.S b/arch/x86/entry/entry_64_fred.S
index 29c5c32c16c3..629cbed9061e 100644
--- a/arch/x86/entry/entry_64_fred.S
+++ b/arch/x86/entry/entry_64_fred.S
@@ -4,6 +4,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/kvm_types.h>
 
 #include <asm/asm.h>
 #include <asm/fred.h>
@@ -128,5 +129,5 @@ SYM_FUNC_START(asm_fred_entry_from_kvm)
 	RET
 
 SYM_FUNC_END(asm_fred_entry_from_kvm)
-EXPORT_SYMBOL_GPL(asm_fred_entry_from_kvm);
+EXPORT_SYMBOL_GPL_FOR_KVM(asm_fred_entry_from_kvm);
 #endif
diff --git a/arch/x86/events/amd/core.c b/arch/x86/events/amd/core.c
index b20661b8621d..0c7c8022b07c 100644
--- a/arch/x86/events/amd/core.c
+++ b/arch/x86/events/amd/core.c
@@ -2,6 +2,7 @@
 #include <linux/perf_event.h>
 #include <linux/jump_label.h>
 #include <linux/export.h>
+#include <linux/kvm_types.h>
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/slab.h>
@@ -1569,7 +1570,7 @@ void amd_pmu_enable_virt(void)
 	/* Reload all events */
 	amd_pmu_reload_virt();
 }
-EXPORT_SYMBOL_GPL(amd_pmu_enable_virt);
+EXPORT_SYMBOL_GPL_FOR_KVM(amd_pmu_enable_virt);
 
 void amd_pmu_disable_virt(void)
 {
@@ -1586,4 +1587,4 @@ void amd_pmu_disable_virt(void)
 	/* Reload all events */
 	amd_pmu_reload_virt();
 }
-EXPORT_SYMBOL_GPL(amd_pmu_disable_virt);
+EXPORT_SYMBOL_GPL_FOR_KVM(amd_pmu_disable_virt);
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 7610f26dfbd9..54d0228333be 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -20,6 +20,7 @@
 #include <linux/export.h>
 #include <linux/init.h>
 #include <linux/kdebug.h>
+#include <linux/kvm_types.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/clock.h>
 #include <linux/uaccess.h>
@@ -714,7 +715,7 @@ struct perf_guest_switch_msr *perf_guest_get_msrs(int *nr, void *data)
 {
 	return static_call(x86_pmu_guest_get_msrs)(nr, data);
 }
-EXPORT_SYMBOL_GPL(perf_guest_get_msrs);
+EXPORT_SYMBOL_GPL_FOR_KVM(perf_guest_get_msrs);
 
 /*
  * There may be PMI landing after enabled=0. The PMI hitting could be before or
@@ -3104,7 +3105,7 @@ void perf_get_x86_pmu_capability(struct x86_pmu_capability *cap)
 	cap->events_mask_len	= x86_pmu.events_mask_len;
 	cap->pebs_ept		= x86_pmu.pebs_ept;
 }
-EXPORT_SYMBOL_GPL(perf_get_x86_pmu_capability);
+EXPORT_SYMBOL_GPL_FOR_KVM(perf_get_x86_pmu_capability);
 
 u64 perf_get_hw_event_config(int hw_event)
 {
@@ -3115,4 +3116,4 @@ u64 perf_get_hw_event_config(int hw_event)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(perf_get_hw_event_config);
+EXPORT_SYMBOL_GPL_FOR_KVM(perf_get_hw_event_config);
diff --git a/arch/x86/events/intel/lbr.c b/arch/x86/events/intel/lbr.c
index 7aa59966e7c3..972017b2fd35 100644
--- a/arch/x86/events/intel/lbr.c
+++ b/arch/x86/events/intel/lbr.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/kvm_types.h>
 #include <linux/perf_event.h>
 #include <linux/types.h>
 
@@ -1705,7 +1706,7 @@ void x86_perf_get_lbr(struct x86_pmu_lbr *lbr)
 	lbr->info = x86_pmu.lbr_info;
 	lbr->has_callstack = x86_pmu_has_lbr_callstack();
 }
-EXPORT_SYMBOL_GPL(x86_perf_get_lbr);
+EXPORT_SYMBOL_GPL_FOR_KVM(x86_perf_get_lbr);
 
 struct event_constraint vlbr_constraint =
 	__EVENT_CONSTRAINT(INTEL_FIXED_VLBR_EVENT, (1ULL << INTEL_PMC_IDX_FIXED_VLBR),
diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
index e8cf29d2b10c..fbe1ac90499a 100644
--- a/arch/x86/events/intel/pt.c
+++ b/arch/x86/events/intel/pt.c
@@ -17,6 +17,7 @@
 #include <linux/limits.h>
 #include <linux/slab.h>
 #include <linux/device.h>
+#include <linux/kvm_types.h>
 
 #include <asm/cpuid/api.h>
 #include <asm/perf_event.h>
@@ -82,13 +83,13 @@ u32 intel_pt_validate_cap(u32 *caps, enum pt_capabilities capability)
 
 	return (c & cd->mask) >> shift;
 }
-EXPORT_SYMBOL_GPL(intel_pt_validate_cap);
+EXPORT_SYMBOL_GPL_FOR_KVM(intel_pt_validate_cap);
 
 u32 intel_pt_validate_hw_cap(enum pt_capabilities cap)
 {
 	return intel_pt_validate_cap(pt_pmu.caps, cap);
 }
-EXPORT_SYMBOL_GPL(intel_pt_validate_hw_cap);
+EXPORT_SYMBOL_GPL_FOR_KVM(intel_pt_validate_hw_cap);
 
 static ssize_t pt_cap_show(struct device *cdev,
 			   struct device_attribute *attr,
@@ -1590,7 +1591,7 @@ void intel_pt_handle_vmx(int on)
 
 	local_irq_restore(flags);
 }
-EXPORT_SYMBOL_GPL(intel_pt_handle_vmx);
+EXPORT_SYMBOL_GPL_FOR_KVM(intel_pt_handle_vmx);
 
 /*
  * PMU callbacks
diff --git a/arch/x86/include/asm/kvm_types.h b/arch/x86/include/asm/kvm_types.h
index 23268a188e70..9597fe3a6c87 100644
--- a/arch/x86/include/asm/kvm_types.h
+++ b/arch/x86/include/asm/kvm_types.h
@@ -10,6 +10,11 @@
 #define KVM_SUB_MODULES kvm-intel
 #else
 #undef KVM_SUB_MODULES
+/*
+ * Don't export symbols for KVM without vendor modules, as kvm.ko is built iff
+ * at least one vendor module is enabled.
+ */
+#define EXPORT_SYMBOL_GPL_FOR_KVM(symbol)
 #endif
 
 #define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 40
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index d73ba5a7b623..1c2a810e8dab 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -36,6 +36,7 @@
 #include <linux/dmi.h>
 #include <linux/smp.h>
 #include <linux/mm.h>
+#include <linux/kvm_types.h>
 
 #include <xen/xen.h>
 
@@ -2311,7 +2312,7 @@ u32 x86_msi_msg_get_destid(struct msi_msg *msg, bool extid)
 		dest |= msg->arch_addr_hi.destid_8_31 << 8;
 	return dest;
 }
-EXPORT_SYMBOL_GPL(x86_msi_msg_get_destid);
+EXPORT_SYMBOL_GPL_FOR_KVM(x86_msi_msg_get_destid);
 
 static void __init apic_bsp_up_setup(void)
 {
diff --git a/arch/x86/kernel/apic/apic_common.c b/arch/x86/kernel/apic/apic_common.c
index 9ef3be866832..df1436a3a76f 100644
--- a/arch/x86/kernel/apic/apic_common.c
+++ b/arch/x86/kernel/apic/apic_common.c
@@ -4,6 +4,7 @@
  * SPDX-License-Identifier: GPL-2.0
  */
 #include <linux/irq.h>
+#include <linux/kvm_types.h>
 #include <asm/apic.h>
 
 #include "local.h"
@@ -25,7 +26,7 @@ u32 default_cpu_present_to_apicid(int mps_cpu)
 	else
 		return BAD_APICID;
 }
-EXPORT_SYMBOL_GPL(default_cpu_present_to_apicid);
+EXPORT_SYMBOL_GPL_FOR_KVM(default_cpu_present_to_apicid);
 
 /*
  * Set up the logical destination ID when the APIC operates in logical
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 329ee185d8cc..e382a81ea35b 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -3,7 +3,7 @@
 #include <linux/bitops.h>
 #include <linux/elf.h>
 #include <linux/mm.h>
-
+#include <linux/kvm_types.h>
 #include <linux/io.h>
 #include <linux/sched.h>
 #include <linux/sched/clock.h>
@@ -1281,7 +1281,7 @@ unsigned long amd_get_dr_addr_mask(unsigned int dr)
 
 	return per_cpu(amd_dr_addr_mask[dr], smp_processor_id());
 }
-EXPORT_SYMBOL_GPL(amd_get_dr_addr_mask);
+EXPORT_SYMBOL_GPL_FOR_KVM(amd_get_dr_addr_mask);
 
 static void zenbleed_check_cpu(void *unused)
 {
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index f4d3abb12317..855cc523618a 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -16,6 +16,7 @@
 #include <linux/sched/smt.h>
 #include <linux/pgtable.h>
 #include <linux/bpf.h>
+#include <linux/kvm_types.h>
 
 #include <asm/spec-ctrl.h>
 #include <asm/cmdline.h>
@@ -169,7 +170,7 @@ DEFINE_STATIC_KEY_FALSE(switch_mm_always_ibpb);
 
 /* Control IBPB on vCPU load */
 DEFINE_STATIC_KEY_FALSE(switch_vcpu_ibpb);
-EXPORT_SYMBOL_GPL(switch_vcpu_ibpb);
+EXPORT_SYMBOL_GPL_FOR_KVM(switch_vcpu_ibpb);
 
 /* Control CPU buffer clear before idling (halt, mwait) */
 DEFINE_STATIC_KEY_FALSE(cpu_buf_idle_clear);
@@ -188,7 +189,7 @@ DEFINE_STATIC_KEY_FALSE(switch_mm_cond_l1d_flush);
  * mitigation is required.
  */
 DEFINE_STATIC_KEY_FALSE(cpu_buf_vm_clear);
-EXPORT_SYMBOL_GPL(cpu_buf_vm_clear);
+EXPORT_SYMBOL_GPL_FOR_KVM(cpu_buf_vm_clear);
 
 void __init cpu_select_mitigations(void)
 {
@@ -318,7 +319,7 @@ x86_virt_spec_ctrl(u64 guest_virt_spec_ctrl, bool setguest)
 		speculation_ctrl_update(tif);
 	}
 }
-EXPORT_SYMBOL_GPL(x86_virt_spec_ctrl);
+EXPORT_SYMBOL_GPL_FOR_KVM(x86_virt_spec_ctrl);
 
 static void x86_amd_ssb_disable(void)
 {
@@ -904,7 +905,7 @@ bool gds_ucode_mitigated(void)
 	return (gds_mitigation == GDS_MITIGATION_FULL ||
 		gds_mitigation == GDS_MITIGATION_FULL_LOCKED);
 }
-EXPORT_SYMBOL_GPL(gds_ucode_mitigated);
+EXPORT_SYMBOL_GPL_FOR_KVM(gds_ucode_mitigated);
 
 void update_gds_msr(void)
 {
@@ -2806,7 +2807,7 @@ void x86_spec_ctrl_setup_ap(void)
 }
 
 bool itlb_multihit_kvm_mitigation;
-EXPORT_SYMBOL_GPL(itlb_multihit_kvm_mitigation);
+EXPORT_SYMBOL_GPL_FOR_KVM(itlb_multihit_kvm_mitigation);
 
 #undef pr_fmt
 #define pr_fmt(fmt)	"L1TF: " fmt
@@ -2814,11 +2815,9 @@ EXPORT_SYMBOL_GPL(itlb_multihit_kvm_mitigation);
 /* Default mitigation for L1TF-affected CPUs */
 enum l1tf_mitigations l1tf_mitigation __ro_after_init =
 	IS_ENABLED(CONFIG_MITIGATION_L1TF) ? L1TF_MITIGATION_AUTO : L1TF_MITIGATION_OFF;
-#if IS_ENABLED(CONFIG_KVM_INTEL)
-EXPORT_SYMBOL_GPL(l1tf_mitigation);
-#endif
+EXPORT_SYMBOL_GPL_FOR_KVM(l1tf_mitigation);
 enum vmx_l1d_flush_state l1tf_vmx_mitigation = VMENTER_L1D_FLUSH_AUTO;
-EXPORT_SYMBOL_GPL(l1tf_vmx_mitigation);
+EXPORT_SYMBOL_GPL_FOR_KVM(l1tf_vmx_mitigation);
 
 /*
  * These CPUs all support 44bits physical address space internally in the
diff --git a/arch/x86/kernel/cpu/bus_lock.c b/arch/x86/kernel/cpu/bus_lock.c
index 981f8b1f0792..90fe42911432 100644
--- a/arch/x86/kernel/cpu/bus_lock.c
+++ b/arch/x86/kernel/cpu/bus_lock.c
@@ -6,6 +6,7 @@
 #include <linux/workqueue.h>
 #include <linux/delay.h>
 #include <linux/cpuhotplug.h>
+#include <linux/kvm_types.h>
 #include <asm/cpu_device_id.h>
 #include <asm/cmdline.h>
 #include <asm/traps.h>
@@ -289,7 +290,7 @@ bool handle_guest_split_lock(unsigned long ip)
 	force_sig_fault(SIGBUS, BUS_ADRALN, NULL);
 	return false;
 }
-EXPORT_SYMBOL_GPL(handle_guest_split_lock);
+EXPORT_SYMBOL_GPL_FOR_KVM(handle_guest_split_lock);
 
 void bus_lock_init(void)
 {
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index fb50c1dd53ef..72f5c32d0e64 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -7,6 +7,7 @@
 #include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/export.h>
+#include <linux/kvm_types.h>
 #include <linux/percpu.h>
 #include <linux/string.h>
 #include <linux/ctype.h>
@@ -459,14 +460,14 @@ void cr4_update_irqsoff(unsigned long set, unsigned long clear)
 		__write_cr4(newval);
 	}
 }
-EXPORT_SYMBOL(cr4_update_irqsoff);
+EXPORT_SYMBOL_GPL_FOR_KVM(cr4_update_irqsoff);
 
 /* Read the CR4 shadow. */
 unsigned long cr4_read_shadow(void)
 {
 	return this_cpu_read(cpu_tlbstate.cr4);
 }
-EXPORT_SYMBOL_GPL(cr4_read_shadow);
+EXPORT_SYMBOL_GPL_FOR_KVM(cr4_read_shadow);
 
 void cr4_init(void)
 {
@@ -721,7 +722,7 @@ void load_direct_gdt(int cpu)
 	gdt_descr.size = GDT_SIZE - 1;
 	load_gdt(&gdt_descr);
 }
-EXPORT_SYMBOL_GPL(load_direct_gdt);
+EXPORT_SYMBOL_GPL_FOR_KVM(load_direct_gdt);
 
 /* Load a fixmap remapping of the per-cpu GDT */
 void load_fixmap_gdt(int cpu)
diff --git a/arch/x86/kernel/cpu/sgx/main.c b/arch/x86/kernel/cpu/sgx/main.c
index 2de01b379aa3..c8da7984d9d8 100644
--- a/arch/x86/kernel/cpu/sgx/main.c
+++ b/arch/x86/kernel/cpu/sgx/main.c
@@ -5,6 +5,7 @@
 #include <linux/freezer.h>
 #include <linux/highmem.h>
 #include <linux/kthread.h>
+#include <linux/kvm_types.h>
 #include <linux/miscdevice.h>
 #include <linux/node.h>
 #include <linux/pagemap.h>
@@ -915,7 +916,7 @@ int sgx_set_attribute(unsigned long *allowed_attributes,
 	*allowed_attributes |= SGX_ATTR_PROVISIONKEY;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(sgx_set_attribute);
+EXPORT_SYMBOL_GPL_FOR_KVM(sgx_set_attribute);
 
 static int __init sgx_init(void)
 {
diff --git a/arch/x86/kernel/cpu/sgx/virt.c b/arch/x86/kernel/cpu/sgx/virt.c
index 7aaa3652e31d..1c8318f1004a 100644
--- a/arch/x86/kernel/cpu/sgx/virt.c
+++ b/arch/x86/kernel/cpu/sgx/virt.c
@@ -5,6 +5,7 @@
  * Copyright(c) 2021 Intel Corporation.
  */
 
+#include <linux/kvm_types.h>
 #include <linux/miscdevice.h>
 #include <linux/mm.h>
 #include <linux/mman.h>
@@ -363,7 +364,7 @@ int sgx_virt_ecreate(struct sgx_pageinfo *pageinfo, void __user *secs,
 	WARN_ON_ONCE(ret);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(sgx_virt_ecreate);
+EXPORT_SYMBOL_GPL_FOR_KVM(sgx_virt_ecreate);
 
 static int __sgx_virt_einit(void __user *sigstruct, void __user *token,
 			    void __user *secs)
@@ -432,4 +433,4 @@ int sgx_virt_einit(void __user *sigstruct, void __user *token,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(sgx_virt_einit);
+EXPORT_SYMBOL_GPL_FOR_KVM(sgx_virt_einit);
diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index c3acbd26408b..b06be3af86c8 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -16,6 +16,7 @@
 #include <linux/firmware-map.h>
 #include <linux/sort.h>
 #include <linux/memory_hotplug.h>
+#include <linux/kvm_types.h>
 
 #include <asm/e820/api.h>
 #include <asm/setup.h>
@@ -95,7 +96,7 @@ bool e820__mapped_raw_any(u64 start, u64 end, enum e820_type type)
 {
 	return _e820__mapped_any(e820_table_firmware, start, end, type);
 }
-EXPORT_SYMBOL_GPL(e820__mapped_raw_any);
+EXPORT_SYMBOL_GPL_FOR_KVM(e820__mapped_raw_any);
 
 bool e820__mapped_any(u64 start, u64 end, enum e820_type type)
 {
diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
index ea138583dd92..94346f59f7d4 100644
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -18,6 +18,7 @@
 #include <uapi/asm/kvm.h>
 
 #include <linux/hardirq.h>
+#include <linux/kvm_types.h>
 #include <linux/pkeys.h>
 #include <linux/vmalloc.h>
 
@@ -273,7 +274,7 @@ bool fpu_alloc_guest_fpstate(struct fpu_guest *gfpu)
 
 	return true;
 }
-EXPORT_SYMBOL_GPL(fpu_alloc_guest_fpstate);
+EXPORT_SYMBOL_GPL_FOR_KVM(fpu_alloc_guest_fpstate);
 
 void fpu_free_guest_fpstate(struct fpu_guest *gfpu)
 {
@@ -288,7 +289,7 @@ void fpu_free_guest_fpstate(struct fpu_guest *gfpu)
 	gfpu->fpstate = NULL;
 	vfree(fpstate);
 }
-EXPORT_SYMBOL_GPL(fpu_free_guest_fpstate);
+EXPORT_SYMBOL_GPL_FOR_KVM(fpu_free_guest_fpstate);
 
 /*
   * fpu_enable_guest_xfd_features - Check xfeatures against guest perm and enable
@@ -310,7 +311,7 @@ int fpu_enable_guest_xfd_features(struct fpu_guest *guest_fpu, u64 xfeatures)
 
 	return __xfd_enable_feature(xfeatures, guest_fpu);
 }
-EXPORT_SYMBOL_GPL(fpu_enable_guest_xfd_features);
+EXPORT_SYMBOL_GPL_FOR_KVM(fpu_enable_guest_xfd_features);
 
 #ifdef CONFIG_X86_64
 void fpu_update_guest_xfd(struct fpu_guest *guest_fpu, u64 xfd)
@@ -321,7 +322,7 @@ void fpu_update_guest_xfd(struct fpu_guest *guest_fpu, u64 xfd)
 		xfd_update_state(guest_fpu->fpstate);
 	fpregs_unlock();
 }
-EXPORT_SYMBOL_GPL(fpu_update_guest_xfd);
+EXPORT_SYMBOL_GPL_FOR_KVM(fpu_update_guest_xfd);
 
 /**
  * fpu_sync_guest_vmexit_xfd_state - Synchronize XFD MSR and software state
@@ -345,7 +346,7 @@ void fpu_sync_guest_vmexit_xfd_state(void)
 		__this_cpu_write(xfd_state, fpstate->xfd);
 	}
 }
-EXPORT_SYMBOL_GPL(fpu_sync_guest_vmexit_xfd_state);
+EXPORT_SYMBOL_GPL_FOR_KVM(fpu_sync_guest_vmexit_xfd_state);
 #endif /* CONFIG_X86_64 */
 
 int fpu_swap_kvm_fpstate(struct fpu_guest *guest_fpu, bool enter_guest)
@@ -387,7 +388,7 @@ int fpu_swap_kvm_fpstate(struct fpu_guest *guest_fpu, bool enter_guest)
 	fpregs_unlock();
 	return 0;
 }
-EXPORT_SYMBOL_GPL(fpu_swap_kvm_fpstate);
+EXPORT_SYMBOL_GPL_FOR_KVM(fpu_swap_kvm_fpstate);
 
 void fpu_copy_guest_fpstate_to_uabi(struct fpu_guest *gfpu, void *buf,
 				    unsigned int size, u64 xfeatures, u32 pkru)
@@ -406,7 +407,7 @@ void fpu_copy_guest_fpstate_to_uabi(struct fpu_guest *gfpu, void *buf,
 		ustate->xsave.header.xfeatures = XFEATURE_MASK_FPSSE;
 	}
 }
-EXPORT_SYMBOL_GPL(fpu_copy_guest_fpstate_to_uabi);
+EXPORT_SYMBOL_GPL_FOR_KVM(fpu_copy_guest_fpstate_to_uabi);
 
 int fpu_copy_uabi_to_guest_fpstate(struct fpu_guest *gfpu, const void *buf,
 				   u64 xcr0, u32 *vpkru)
@@ -436,7 +437,7 @@ int fpu_copy_uabi_to_guest_fpstate(struct fpu_guest *gfpu, const void *buf,
 
 	return copy_uabi_from_kernel_to_xstate(kstate, ustate, vpkru);
 }
-EXPORT_SYMBOL_GPL(fpu_copy_uabi_to_guest_fpstate);
+EXPORT_SYMBOL_GPL_FOR_KVM(fpu_copy_uabi_to_guest_fpstate);
 #endif /* CONFIG_KVM */
 
 void kernel_fpu_begin_mask(unsigned int kfpu_mask)
@@ -829,7 +830,7 @@ void switch_fpu_return(void)
 
 	fpregs_restore_userregs();
 }
-EXPORT_SYMBOL_GPL(switch_fpu_return);
+EXPORT_SYMBOL_GPL_FOR_KVM(switch_fpu_return);
 
 void fpregs_lock_and_load(void)
 {
@@ -864,7 +865,7 @@ void fpregs_assert_state_consistent(void)
 
 	WARN_ON_FPU(!fpregs_state_valid(fpu, smp_processor_id()));
 }
-EXPORT_SYMBOL_GPL(fpregs_assert_state_consistent);
+EXPORT_SYMBOL_GPL_FOR_KVM(fpregs_assert_state_consistent);
 #endif
 
 void fpregs_mark_activate(void)
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index 9aa9ac8399ae..a3bfa0613e99 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -8,6 +8,7 @@
 #include <linux/compat.h>
 #include <linux/cpu.h>
 #include <linux/mman.h>
+#include <linux/kvm_types.h>
 #include <linux/nospec.h>
 #include <linux/pkeys.h>
 #include <linux/seq_file.h>
@@ -1032,7 +1033,7 @@ void *get_xsave_addr(struct xregs_state *xsave, int xfeature_nr)
 
 	return __raw_xsave_addr(xsave, xfeature_nr);
 }
-EXPORT_SYMBOL_GPL(get_xsave_addr);
+EXPORT_SYMBOL_GPL_FOR_KVM(get_xsave_addr);
 
 /*
  * Given an xstate feature nr, calculate where in the xsave buffer the state is.
@@ -1456,7 +1457,7 @@ void fpstate_clear_xstate_component(struct fpstate *fpstate, unsigned int xfeatu
 	if (addr)
 		memset(addr, 0, xstate_sizes[xfeature]);
 }
-EXPORT_SYMBOL_GPL(fpstate_clear_xstate_component);
+EXPORT_SYMBOL_GPL_FOR_KVM(fpstate_clear_xstate_component);
 #endif
 
 #ifdef CONFIG_X86_64
@@ -1792,7 +1793,7 @@ u64 xstate_get_guest_group_perm(void)
 {
 	return xstate_get_group_perm(true);
 }
-EXPORT_SYMBOL_GPL(xstate_get_guest_group_perm);
+EXPORT_SYMBOL_GPL_FOR_KVM(xstate_get_guest_group_perm);
 
 /**
  * fpu_xstate_prctl - xstate permission operations
diff --git a/arch/x86/kernel/hw_breakpoint.c b/arch/x86/kernel/hw_breakpoint.c
index b01644c949b2..a37f12a978e4 100644
--- a/arch/x86/kernel/hw_breakpoint.c
+++ b/arch/x86/kernel/hw_breakpoint.c
@@ -24,6 +24,7 @@
 #include <linux/percpu.h>
 #include <linux/kdebug.h>
 #include <linux/kernel.h>
+#include <linux/kvm_types.h>
 #include <linux/export.h>
 #include <linux/sched.h>
 #include <linux/smp.h>
@@ -489,7 +490,7 @@ void hw_breakpoint_restore(void)
 	set_debugreg(DR6_RESERVED, 6);
 	set_debugreg(__this_cpu_read(cpu_dr7), 7);
 }
-EXPORT_SYMBOL_GPL(hw_breakpoint_restore);
+EXPORT_SYMBOL_GPL_FOR_KVM(hw_breakpoint_restore);
 
 /*
  * Handle debug exception notifications.
diff --git a/arch/x86/kernel/irq.c b/arch/x86/kernel/irq.c
index 9ed29ff10e59..6aecd1a7524d 100644
--- a/arch/x86/kernel/irq.c
+++ b/arch/x86/kernel/irq.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/irq.h>
+#include <linux/kvm_types.h>
 
 #include <asm/irq_stack.h>
 #include <asm/apic.h>
@@ -328,7 +329,7 @@ void kvm_set_posted_intr_wakeup_handler(void (*handler)(void))
 		synchronize_rcu();
 	}
 }
-EXPORT_SYMBOL_GPL(kvm_set_posted_intr_wakeup_handler);
+EXPORT_SYMBOL_GPL_FOR_KVM(kvm_set_posted_intr_wakeup_handler);
 
 /*
  * Handler for POSTED_INTERRUPT_VECTOR.
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 921c1c783bc1..d70e1b5a255c 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -29,6 +29,7 @@
 #include <linux/syscore_ops.h>
 #include <linux/cc_platform.h>
 #include <linux/efi.h>
+#include <linux/kvm_types.h>
 #include <asm/timer.h>
 #include <asm/cpu.h>
 #include <asm/traps.h>
@@ -162,7 +163,7 @@ void kvm_async_pf_task_wait_schedule(u32 token)
 	}
 	finish_swait(&n.wq, &wait);
 }
-EXPORT_SYMBOL_GPL(kvm_async_pf_task_wait_schedule);
+EXPORT_SYMBOL_GPL_FOR_KVM(kvm_async_pf_task_wait_schedule);
 
 static void apf_task_wake_one(struct kvm_task_sleep_node *n)
 {
@@ -254,7 +255,7 @@ noinstr u32 kvm_read_and_reset_apf_flags(void)
 
 	return flags;
 }
-EXPORT_SYMBOL_GPL(kvm_read_and_reset_apf_flags);
+EXPORT_SYMBOL_GPL_FOR_KVM(kvm_read_and_reset_apf_flags);
 
 noinstr bool __kvm_handle_async_pf(struct pt_regs *regs, u32 token)
 {
diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index be93ec7255bf..5b6874554ab1 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -24,6 +24,7 @@
 #include <linux/export.h>
 #include <linux/atomic.h>
 #include <linux/sched/clock.h>
+#include <linux/kvm_types.h>
 
 #include <asm/cpu_entry_area.h>
 #include <asm/traps.h>
@@ -613,9 +614,7 @@ DEFINE_IDTENTRY_RAW(exc_nmi_kvm_vmx)
 {
 	exc_nmi(regs);
 }
-#if IS_MODULE(CONFIG_KVM_INTEL)
-EXPORT_SYMBOL_GPL(asm_exc_nmi_kvm_vmx);
-#endif
+EXPORT_SYMBOL_GPL_FOR_KVM(asm_exc_nmi_kvm_vmx);
 #endif
 
 #ifdef CONFIG_NMI_CHECK_CPU
diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index b972bf72fb8b..14f2bae0042d 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -30,6 +30,7 @@
 #include <linux/interrupt.h>
 #include <linux/delay.h>
 #include <linux/export.h>
+#include <linux/kvm_types.h>
 #include <linux/ptrace.h>
 #include <linux/notifier.h>
 #include <linux/kprobes.h>
@@ -303,9 +304,7 @@ void current_save_fsgs(void)
 	save_fsgs(current);
 	local_irq_restore(flags);
 }
-#if IS_ENABLED(CONFIG_KVM)
-EXPORT_SYMBOL_GPL(current_save_fsgs);
-#endif
+EXPORT_SYMBOL_GPL_FOR_KVM(current_save_fsgs);
 
 static __always_inline void loadseg(enum which_selector which,
 				    unsigned short sel)
diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index 964f6b0a3d68..e550515b1fc1 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -13,6 +13,7 @@
 #include <linux/objtool.h>
 #include <linux/pgtable.h>
 #include <linux/kexec.h>
+#include <linux/kvm_types.h>
 #include <acpi/reboot.h>
 #include <asm/io.h>
 #include <asm/apic.h>
@@ -541,7 +542,7 @@ void cpu_emergency_register_virt_callback(cpu_emergency_virt_cb *callback)
 
 	rcu_assign_pointer(cpu_emergency_virt_callback, callback);
 }
-EXPORT_SYMBOL_GPL(cpu_emergency_register_virt_callback);
+EXPORT_SYMBOL_GPL_FOR_KVM(cpu_emergency_register_virt_callback);
 
 void cpu_emergency_unregister_virt_callback(cpu_emergency_virt_cb *callback)
 {
@@ -551,7 +552,7 @@ void cpu_emergency_unregister_virt_callback(cpu_emergency_virt_cb *callback)
 	rcu_assign_pointer(cpu_emergency_virt_callback, NULL);
 	synchronize_rcu();
 }
-EXPORT_SYMBOL_GPL(cpu_emergency_unregister_virt_callback);
+EXPORT_SYMBOL_GPL_FOR_KVM(cpu_emergency_unregister_virt_callback);
 
 /*
  * Disable virtualization, i.e. VMX or SVM, to ensure INIT is recognized during
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 87e749106dda..7d3e13e14eab 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -11,6 +11,7 @@
 #include <linux/cpufreq.h>
 #include <linux/delay.h>
 #include <linux/clocksource.h>
+#include <linux/kvm_types.h>
 #include <linux/percpu.h>
 #include <linux/timex.h>
 #include <linux/static_key.h>
diff --git a/arch/x86/lib/cache-smp.c b/arch/x86/lib/cache-smp.c
index c5c60d07308c..23bab469c6c6 100644
--- a/arch/x86/lib/cache-smp.c
+++ b/arch/x86/lib/cache-smp.c
@@ -2,6 +2,7 @@
 #include <asm/paravirt.h>
 #include <linux/smp.h>
 #include <linux/export.h>
+#include <linux/kvm_types.h>
 
 static void __wbinvd(void *dummy)
 {
@@ -12,7 +13,7 @@ void wbinvd_on_cpu(int cpu)
 {
 	smp_call_function_single(cpu, __wbinvd, NULL, 1);
 }
-EXPORT_SYMBOL(wbinvd_on_cpu);
+EXPORT_SYMBOL_GPL_FOR_KVM(wbinvd_on_cpu);
 
 void wbinvd_on_all_cpus(void)
 {
@@ -24,7 +25,7 @@ void wbinvd_on_cpus_mask(struct cpumask *cpus)
 {
 	on_each_cpu_mask(cpus, __wbinvd, NULL, 1);
 }
-EXPORT_SYMBOL_GPL(wbinvd_on_cpus_mask);
+EXPORT_SYMBOL_GPL_FOR_KVM(wbinvd_on_cpus_mask);
 
 static void __wbnoinvd(void *dummy)
 {
@@ -35,10 +36,10 @@ void wbnoinvd_on_all_cpus(void)
 {
 	on_each_cpu(__wbnoinvd, NULL, 1);
 }
-EXPORT_SYMBOL_GPL(wbnoinvd_on_all_cpus);
+EXPORT_SYMBOL_GPL_FOR_KVM(wbnoinvd_on_all_cpus);
 
 void wbnoinvd_on_cpus_mask(struct cpumask *cpus)
 {
 	on_each_cpu_mask(cpus, __wbnoinvd, NULL, 1);
 }
-EXPORT_SYMBOL_GPL(wbnoinvd_on_cpus_mask);
+EXPORT_SYMBOL_GPL_FOR_KVM(wbnoinvd_on_cpus_mask);
diff --git a/arch/x86/lib/msr.c b/arch/x86/lib/msr.c
index 4ef7c6dcbea6..0544a8af9f5b 100644
--- a/arch/x86/lib/msr.c
+++ b/arch/x86/lib/msr.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/export.h>
+#include <linux/kvm_types.h>
 #include <linux/percpu.h>
 #include <linux/preempt.h>
 #include <asm/msr.h>
@@ -103,7 +104,7 @@ int msr_set_bit(u32 msr, u8 bit)
 {
 	return __flip_bit(msr, bit, true);
 }
-EXPORT_SYMBOL_GPL(msr_set_bit);
+EXPORT_SYMBOL_GPL_FOR_KVM(msr_set_bit);
 
 /**
  * msr_clear_bit - Clear @bit in a MSR @msr.
@@ -119,7 +120,7 @@ int msr_clear_bit(u32 msr, u8 bit)
 {
 	return __flip_bit(msr, bit, false);
 }
-EXPORT_SYMBOL_GPL(msr_clear_bit);
+EXPORT_SYMBOL_GPL_FOR_KVM(msr_clear_bit);
 
 #ifdef CONFIG_TRACEPOINTS
 void do_trace_write_msr(u32 msr, u64 val, int failed)
diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index 2e7923844afe..0829d054dbf4 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -43,6 +43,7 @@
 #include <linux/highmem.h>
 #include <linux/fs.h>
 #include <linux/rbtree.h>
+#include <linux/kvm_types.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/cacheflush.h>
@@ -698,7 +699,7 @@ bool pat_pfn_immune_to_uc_mtrr(unsigned long pfn)
 	       cm == _PAGE_CACHE_MODE_UC_MINUS ||
 	       cm == _PAGE_CACHE_MODE_WC;
 }
-EXPORT_SYMBOL_GPL(pat_pfn_immune_to_uc_mtrr);
+EXPORT_SYMBOL_GPL_FOR_KVM(pat_pfn_immune_to_uc_mtrr);
 
 /**
  * memtype_reserve_io - Request a memory type mapping for a region of memory
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 39f80111e6f1..33dd1c7a8b67 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -12,6 +12,7 @@
 #include <linux/task_work.h>
 #include <linux/mmu_notifier.h>
 #include <linux/mmu_context.h>
+#include <linux/kvm_types.h>
 
 #include <asm/tlbflush.h>
 #include <asm/mmu_context.h>
@@ -1562,7 +1563,7 @@ unsigned long __get_current_cr3_fast(void)
 	VM_BUG_ON(cr3 != __read_cr3());
 	return cr3;
 }
-EXPORT_SYMBOL_GPL(__get_current_cr3_fast);
+EXPORT_SYMBOL_GPL_FOR_KVM(__get_current_cr3_fast);
 
 /*
  * Flush one page in the kernel mapping
@@ -1703,7 +1704,7 @@ void __flush_tlb_all(void)
 		flush_tlb_local();
 	}
 }
-EXPORT_SYMBOL_GPL(__flush_tlb_all);
+EXPORT_SYMBOL_GPL_FOR_KVM(__flush_tlb_all);
 
 void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 {
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index c7a9a087ccaf..426fefdd2b60 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -29,6 +29,7 @@
 #include <linux/acpi.h>
 #include <linux/suspend.h>
 #include <linux/idr.h>
+#include <linux/kvm_types.h>
 #include <asm/page.h>
 #include <asm/special_insns.h>
 #include <asm/msr-index.h>
@@ -181,7 +182,7 @@ int tdx_cpu_enable(void)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(tdx_cpu_enable);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdx_cpu_enable);
 
 /*
  * Add a memory region as a TDX memory block.  The caller must make sure
@@ -1214,7 +1215,7 @@ int tdx_enable(void)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(tdx_enable);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdx_enable);
 
 static bool is_pamt_page(unsigned long phys)
 {
@@ -1475,13 +1476,13 @@ const struct tdx_sys_info *tdx_get_sysinfo(void)
 
 	return p;
 }
-EXPORT_SYMBOL_GPL(tdx_get_sysinfo);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdx_get_sysinfo);
 
 u32 tdx_get_nr_guest_keyids(void)
 {
 	return tdx_nr_guest_keyids;
 }
-EXPORT_SYMBOL_GPL(tdx_get_nr_guest_keyids);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdx_get_nr_guest_keyids);
 
 int tdx_guest_keyid_alloc(void)
 {
@@ -1489,13 +1490,13 @@ int tdx_guest_keyid_alloc(void)
 			       tdx_guest_keyid_start + tdx_nr_guest_keyids - 1,
 			       GFP_KERNEL);
 }
-EXPORT_SYMBOL_GPL(tdx_guest_keyid_alloc);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdx_guest_keyid_alloc);
 
 void tdx_guest_keyid_free(unsigned int keyid)
 {
 	ida_free(&tdx_guest_keyid_pool, keyid);
 }
-EXPORT_SYMBOL_GPL(tdx_guest_keyid_free);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdx_guest_keyid_free);
 
 static inline u64 tdx_tdr_pa(struct tdx_td *td)
 {
@@ -1524,7 +1525,7 @@ noinstr __flatten u64 tdh_vp_enter(struct tdx_vp *td, struct tdx_module_args *ar
 
 	return __seamcall_saved_ret(TDH_VP_ENTER, args);
 }
-EXPORT_SYMBOL_GPL(tdh_vp_enter);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_vp_enter);
 
 u64 tdh_mng_addcx(struct tdx_td *td, struct page *tdcs_page)
 {
@@ -1536,7 +1537,7 @@ u64 tdh_mng_addcx(struct tdx_td *td, struct page *tdcs_page)
 	tdx_clflush_page(tdcs_page);
 	return seamcall(TDH_MNG_ADDCX, &args);
 }
-EXPORT_SYMBOL_GPL(tdh_mng_addcx);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_mng_addcx);
 
 u64 tdh_mem_page_add(struct tdx_td *td, u64 gpa, struct page *page, struct page *source, u64 *ext_err1, u64 *ext_err2)
 {
@@ -1556,7 +1557,7 @@ u64 tdh_mem_page_add(struct tdx_td *td, u64 gpa, struct page *page, struct page
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(tdh_mem_page_add);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_mem_page_add);
 
 u64 tdh_mem_sept_add(struct tdx_td *td, u64 gpa, int level, struct page *page, u64 *ext_err1, u64 *ext_err2)
 {
@@ -1575,7 +1576,7 @@ u64 tdh_mem_sept_add(struct tdx_td *td, u64 gpa, int level, struct page *page, u
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(tdh_mem_sept_add);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_mem_sept_add);
 
 u64 tdh_vp_addcx(struct tdx_vp *vp, struct page *tdcx_page)
 {
@@ -1587,7 +1588,7 @@ u64 tdh_vp_addcx(struct tdx_vp *vp, struct page *tdcx_page)
 	tdx_clflush_page(tdcx_page);
 	return seamcall(TDH_VP_ADDCX, &args);
 }
-EXPORT_SYMBOL_GPL(tdh_vp_addcx);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_vp_addcx);
 
 u64 tdh_mem_page_aug(struct tdx_td *td, u64 gpa, int level, struct page *page, u64 *ext_err1, u64 *ext_err2)
 {
@@ -1606,7 +1607,7 @@ u64 tdh_mem_page_aug(struct tdx_td *td, u64 gpa, int level, struct page *page, u
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(tdh_mem_page_aug);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_mem_page_aug);
 
 u64 tdh_mem_range_block(struct tdx_td *td, u64 gpa, int level, u64 *ext_err1, u64 *ext_err2)
 {
@@ -1623,7 +1624,7 @@ u64 tdh_mem_range_block(struct tdx_td *td, u64 gpa, int level, u64 *ext_err1, u6
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(tdh_mem_range_block);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_mem_range_block);
 
 u64 tdh_mng_key_config(struct tdx_td *td)
 {
@@ -1633,7 +1634,7 @@ u64 tdh_mng_key_config(struct tdx_td *td)
 
 	return seamcall(TDH_MNG_KEY_CONFIG, &args);
 }
-EXPORT_SYMBOL_GPL(tdh_mng_key_config);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_mng_key_config);
 
 u64 tdh_mng_create(struct tdx_td *td, u16 hkid)
 {
@@ -1645,7 +1646,7 @@ u64 tdh_mng_create(struct tdx_td *td, u16 hkid)
 	tdx_clflush_page(td->tdr_page);
 	return seamcall(TDH_MNG_CREATE, &args);
 }
-EXPORT_SYMBOL_GPL(tdh_mng_create);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_mng_create);
 
 u64 tdh_vp_create(struct tdx_td *td, struct tdx_vp *vp)
 {
@@ -1657,7 +1658,7 @@ u64 tdh_vp_create(struct tdx_td *td, struct tdx_vp *vp)
 	tdx_clflush_page(vp->tdvpr_page);
 	return seamcall(TDH_VP_CREATE, &args);
 }
-EXPORT_SYMBOL_GPL(tdh_vp_create);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_vp_create);
 
 u64 tdh_mng_rd(struct tdx_td *td, u64 field, u64 *data)
 {
@@ -1674,7 +1675,7 @@ u64 tdh_mng_rd(struct tdx_td *td, u64 field, u64 *data)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(tdh_mng_rd);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_mng_rd);
 
 u64 tdh_mr_extend(struct tdx_td *td, u64 gpa, u64 *ext_err1, u64 *ext_err2)
 {
@@ -1691,7 +1692,7 @@ u64 tdh_mr_extend(struct tdx_td *td, u64 gpa, u64 *ext_err1, u64 *ext_err2)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(tdh_mr_extend);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_mr_extend);
 
 u64 tdh_mr_finalize(struct tdx_td *td)
 {
@@ -1701,7 +1702,7 @@ u64 tdh_mr_finalize(struct tdx_td *td)
 
 	return seamcall(TDH_MR_FINALIZE, &args);
 }
-EXPORT_SYMBOL_GPL(tdh_mr_finalize);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_mr_finalize);
 
 u64 tdh_vp_flush(struct tdx_vp *vp)
 {
@@ -1711,7 +1712,7 @@ u64 tdh_vp_flush(struct tdx_vp *vp)
 
 	return seamcall(TDH_VP_FLUSH, &args);
 }
-EXPORT_SYMBOL_GPL(tdh_vp_flush);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_vp_flush);
 
 u64 tdh_mng_vpflushdone(struct tdx_td *td)
 {
@@ -1721,7 +1722,7 @@ u64 tdh_mng_vpflushdone(struct tdx_td *td)
 
 	return seamcall(TDH_MNG_VPFLUSHDONE, &args);
 }
-EXPORT_SYMBOL_GPL(tdh_mng_vpflushdone);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_mng_vpflushdone);
 
 u64 tdh_mng_key_freeid(struct tdx_td *td)
 {
@@ -1731,7 +1732,7 @@ u64 tdh_mng_key_freeid(struct tdx_td *td)
 
 	return seamcall(TDH_MNG_KEY_FREEID, &args);
 }
-EXPORT_SYMBOL_GPL(tdh_mng_key_freeid);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_mng_key_freeid);
 
 u64 tdh_mng_init(struct tdx_td *td, u64 td_params, u64 *extended_err)
 {
@@ -1747,7 +1748,7 @@ u64 tdh_mng_init(struct tdx_td *td, u64 td_params, u64 *extended_err)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(tdh_mng_init);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_mng_init);
 
 u64 tdh_vp_rd(struct tdx_vp *vp, u64 field, u64 *data)
 {
@@ -1764,7 +1765,7 @@ u64 tdh_vp_rd(struct tdx_vp *vp, u64 field, u64 *data)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(tdh_vp_rd);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_vp_rd);
 
 u64 tdh_vp_wr(struct tdx_vp *vp, u64 field, u64 data, u64 mask)
 {
@@ -1777,7 +1778,7 @@ u64 tdh_vp_wr(struct tdx_vp *vp, u64 field, u64 data, u64 mask)
 
 	return seamcall(TDH_VP_WR, &args);
 }
-EXPORT_SYMBOL_GPL(tdh_vp_wr);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_vp_wr);
 
 u64 tdh_vp_init(struct tdx_vp *vp, u64 initial_rcx, u32 x2apicid)
 {
@@ -1790,7 +1791,7 @@ u64 tdh_vp_init(struct tdx_vp *vp, u64 initial_rcx, u32 x2apicid)
 	/* apicid requires version == 1. */
 	return seamcall(TDH_VP_INIT | (1ULL << TDX_VERSION_SHIFT), &args);
 }
-EXPORT_SYMBOL_GPL(tdh_vp_init);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_vp_init);
 
 /*
  * TDX ABI defines output operands as PT, OWNER and SIZE. These are TDX defined fomats.
@@ -1812,7 +1813,7 @@ u64 tdh_phymem_page_reclaim(struct page *page, u64 *tdx_pt, u64 *tdx_owner, u64
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(tdh_phymem_page_reclaim);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_phymem_page_reclaim);
 
 u64 tdh_mem_track(struct tdx_td *td)
 {
@@ -1822,7 +1823,7 @@ u64 tdh_mem_track(struct tdx_td *td)
 
 	return seamcall(TDH_MEM_TRACK, &args);
 }
-EXPORT_SYMBOL_GPL(tdh_mem_track);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_mem_track);
 
 u64 tdh_mem_page_remove(struct tdx_td *td, u64 gpa, u64 level, u64 *ext_err1, u64 *ext_err2)
 {
@@ -1839,7 +1840,7 @@ u64 tdh_mem_page_remove(struct tdx_td *td, u64 gpa, u64 level, u64 *ext_err1, u6
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(tdh_mem_page_remove);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_mem_page_remove);
 
 u64 tdh_phymem_cache_wb(bool resume)
 {
@@ -1849,7 +1850,7 @@ u64 tdh_phymem_cache_wb(bool resume)
 
 	return seamcall(TDH_PHYMEM_CACHE_WB, &args);
 }
-EXPORT_SYMBOL_GPL(tdh_phymem_cache_wb);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_phymem_cache_wb);
 
 u64 tdh_phymem_page_wbinvd_tdr(struct tdx_td *td)
 {
@@ -1859,7 +1860,7 @@ u64 tdh_phymem_page_wbinvd_tdr(struct tdx_td *td)
 
 	return seamcall(TDH_PHYMEM_PAGE_WBINVD, &args);
 }
-EXPORT_SYMBOL_GPL(tdh_phymem_page_wbinvd_tdr);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_phymem_page_wbinvd_tdr);
 
 u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, struct page *page)
 {
@@ -1869,4 +1870,4 @@ u64 tdh_phymem_page_wbinvd_hkid(u64 hkid, struct page *page)
 
 	return seamcall(TDH_PHYMEM_PAGE_WBINVD, &args);
 }
-EXPORT_SYMBOL_GPL(tdh_phymem_page_wbinvd_hkid);
+EXPORT_SYMBOL_GPL_FOR_KVM(tdh_phymem_page_wbinvd_hkid);
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index 92a7051c1c9c..4df5a1c19612 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -11,8 +11,22 @@
 #ifdef KVM_SUB_MODULES
 #define EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(symbol) \
 	EXPORT_SYMBOL_GPL_FOR_MODULES(symbol, __stringify(KVM_SUB_MODULES))
+#define EXPORT_SYMBOL_GPL_FOR_KVM(symbol) \
+	EXPORT_SYMBOL_GPL_FOR_MODULES(symbol, "kvm," __stringify(KVM_SUB_MODULES))
 #else
 #define EXPORT_SYMBOL_GPL_FOR_KVM_INTERNAL(symbol)
+/*
+ * Allow architectures to provide a custom EXPORT_SYMBOL_GPL_FOR_KVM, but only
+ * if there are no submodules, e.g. to allow suppressing exports if KVM=m, but
+ * kvm.ko won't actually be built (due to lack of at least one submodule).
+ */
+#ifndef EXPORT_SYMBOL_GPL_FOR_KVM
+#if IS_MODULE(CONFIG_KVM)
+#define EXPORT_SYMBOL_GPL_FOR_KVM(symbol) EXPORT_SYMBOL_GPL_FOR_MODULES(symbol, "kvm")
+#else
+#define EXPORT_SYMBOL_GPL_FOR_KVM(symbol)
+#endif /* IS_MODULE(CONFIG_KVM) */
+#endif /* EXPORT_SYMBOL_GPL_FOR_KVM */
 #endif
 
 #ifndef __ASSEMBLER__
-- 
2.50.1.552.g942d659e1b-goog


