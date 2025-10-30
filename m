Return-Path: <linuxppc-dev+bounces-13578-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F56C22224
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 21:10:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyFb75KxLz3chK;
	Fri, 31 Oct 2025 07:10:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761855011;
	cv=none; b=V+zfaEAiSatAHELxwX7kCBVXGYn0UmC4LiVJwxxThKFDtosgErjkEK6BV+JsXqp1BBN04xGc2KtUTLrjbjEweCpJthNbzilp5/cMIvt7CE4CQU1PCDNxI9vXRRf6ASQ4cUPuYBhf1WZIFRJGkjf1oLDViO4NwPDx6Jjzf3NYRxA708tS0ha97WWnfUXXUDGGfWC16loQzqFzGB2eKZ81yAcsj55wheOIMxJDYVl/9EY5RdULSlKbMw2YUOxNpB/Rx/A+4L6LdsXU1L2XjAGFg9Hw8xuEeYhsd9xBsyEWOIlnFDQXGu/JLquK1K75FvCd0sTt1pHq0uIH74V8xw7Kkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761855011; c=relaxed/relaxed;
	bh=AWjqyewTSxAo5goVGUIy0m+TBQ84l/fAmH7ugD3Pbw4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YsxsXddEc+lotdOIG+q0naG0tUwwwRhrC+FWMezDTZApNfiod+iMhIKyvc4Qs/4JhezrUl6QeIFlT1fBSX+5kd3BIcwEn/5XnJvC9LzRZ7oxT8DFXQUrs7BJTQDZMewNVFkM/sIWEV/WQF2W3EYoEU0NLoL5LTW36twJ4wGv7CCZq38haUsHdZBkM4vQnL5Sfgc0fpHnIcw7Cy7789EDl+L4CeZXU902hGex1RZWvZ4vLFltsr9KOJ52GmMk/8m6hlglTafpmOVnvhojAbFGkfBjgy+hyyE047IPGpUfIIv5yPMiEO/H8L1uegHPYCoe0pP8Mz6KRVnPYZ6Kjr45IQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=aEuYIQ/E; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3icydaqykdaw4qmzvos00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=aEuYIQ/E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3icydaqykdaw4qmzvos00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyFb70X33z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 07:10:10 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2697410e7f9so34487565ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 13:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855009; x=1762459809; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=AWjqyewTSxAo5goVGUIy0m+TBQ84l/fAmH7ugD3Pbw4=;
        b=aEuYIQ/ECDBcxql4rt5u+HY/E2USXI8iHhlYprxNCQmNhYcR+QC9z0hux3gTvBIdQz
         +YdUahAE6G3qLQJQhTDhln3JnC/T4sgAaqHQJZTSXIRiCRxFjFCUQU/EwQyRZLExKBYW
         fNKv8ILMx/sj8CFGajIko9N5SZx1JNaqnbTCwyKYvNiXmRB9YHkvqNwJs2S54bh0mgxJ
         iNQnvCuC0b4BEn2nQtDQVRzJ5CEUJ628PfywMfStKElHDy7M5sdLrhiIlqg8zylM2YPo
         mkvUACNkGaE5fr3EMaPZB6mkK4p56KuMnzYaugNig2iBiS/e+3XCeJdH4hWBC8FronV1
         iJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855009; x=1762459809;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWjqyewTSxAo5goVGUIy0m+TBQ84l/fAmH7ugD3Pbw4=;
        b=p5dMGwF5QoJQgHHkHAVcs8ffkEqhWjmcCbF3SjpVHPEl/KKtiRsOE7etTS5G/TaNlh
         X/mS+lSbYeQUgCuRwIkWU7qRvtWjjf6BcOlyhiwamuXPDp+zx1t9m4uafIv7y0L8gliG
         tk6WYxj1XarTb795oeF65BES4jv+PqYdB2MiMxXxwqLy2QJm9hPbNZL4uMpchRBNQvUN
         IEvs4oragjeBazIx4THPbqLvMkK0k2pMegWWAg0Jzdn8iEnx4A2R7/iSqfyrSaFp+J1/
         QGnHMvWozkQOBEAfBrTjDFuMTtkwQM4BrL6QIRcVaNY/7CubRuDvCcUVl6mHyusKIf3W
         cWrg==
X-Forwarded-Encrypted: i=1; AJvYcCWWYHSkUgPzwdQg5Yyzm7ZPrWgHQQ1N1wpAIroM2HjY8NdV8DDAIInIIPD8cvLQapKKwhQTE00WQPL+xIc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwG8ijOudRlJ52vpRtBN/mPuJvvzq2m3w/KGlrmFw9ga9rA0nqC
	jlNBEY1gnYgTo18uyWztgSUim6YXFM3M4m7ceEviVvDYx3D3oTEZGbnoS2zzYqgJqCe8xcwKrm/
	zqUyDLQ==
X-Google-Smtp-Source: AGHT+IEOd6dhhOrMyLm5rAPRaBNRm2puNA7otVNJLczO2HSlc5/6mK5syWdypSUA75SSISTWcIWOwk769kE=
X-Received: from plkn2.prod.google.com ([2002:a17:902:6a82:b0:292:4a9c:44cf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2452:b0:267:a55a:8684
 with SMTP id d9443c01a7336-2951a36417cmr13224335ad.2.1761855009104; Thu, 30
 Oct 2025 13:10:09 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:27 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
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
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-5-seanjc@google.com>
Subject: [PATCH v4 04/28] KVM: x86/mmu: Add dedicated API to map guest_memfd
 pfn into TDP MMU
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add and use a new API for mapping a private pfn from guest_memfd into the
TDP MMU from TDX's post-populate hook instead of partially open-coding the
functionality into the TDX code.  Sharing code with the pre-fault path
sounded good on paper, but it's fatally flawed as simulating a fault loses
the pfn, and calling back into gmem to re-retrieve the pfn creates locking
problems, e.g. kvm_gmem_populate() already holds the gmem invalidation
lock.

Providing a dedicated API will also removing several MMU exports that
ideally would not be exposed outside of the MMU, let alone to vendor code.
On that topic, opportunistically drop the kvm_mmu_load() export.  Leave
kvm_tdp_mmu_gpa_is_mapped() alone for now; the entire commit that added
kvm_tdp_mmu_gpa_is_mapped() will be removed in the near future.

Gate the API on CONFIG_KVM_GUEST_MEMFD=y as private memory _must_ be backed
by guest_memfd.  Add a lockdep-only assert to that the incoming pfn is
indeed backed by guest_memfd, and that the gmem instance's invalidate lock
is held (which, combined with slots_lock being held, obviates the need to
check for a stale "fault").

Cc: Michael Roth <michael.roth@amd.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>
Cc: Ira Weiny <ira.weiny@intel.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Link: https://lore.kernel.org/all/20250709232103.zwmufocd3l7sqk7y@amd.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu.h     |  1 +
 arch/x86/kvm/mmu/mmu.c | 81 +++++++++++++++++++++++++++++++++++++++++-
 arch/x86/kvm/vmx/tdx.c | 10 ++----
 3 files changed, 84 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index f63074048ec6..2f108e381959 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -259,6 +259,7 @@ extern bool tdp_mmu_enabled;
 
 bool kvm_tdp_mmu_gpa_is_mapped(struct kvm_vcpu *vcpu, u64 gpa);
 int kvm_tdp_map_page(struct kvm_vcpu *vcpu, gpa_t gpa, u64 error_code, u8 *level);
+int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn);
 
 static inline bool kvm_memslots_have_rmaps(struct kvm *kvm)
 {
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 18d69d48bc55..bad0480bdb0d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5014,6 +5014,86 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 	return min(range->size, end - range->gpa);
 }
 
+#ifdef CONFIG_KVM_GUEST_MEMFD
+static void kvm_assert_gmem_invalidate_lock_held(struct kvm_memory_slot *slot)
+{
+#ifdef CONFIG_PROVE_LOCKING
+	if (WARN_ON_ONCE(!kvm_slot_has_gmem(slot)) ||
+	    WARN_ON_ONCE(!slot->gmem.file) ||
+	    WARN_ON_ONCE(!file_count(slot->gmem.file)))
+		return;
+
+	lockdep_assert_held(&file_inode(slot->gmem.file)->i_mapping->invalidate_lock);
+#endif
+}
+
+int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
+{
+	struct kvm_page_fault fault = {
+		.addr = gfn_to_gpa(gfn),
+		.error_code = PFERR_GUEST_FINAL_MASK | PFERR_PRIVATE_ACCESS,
+		.prefetch = true,
+		.is_tdp = true,
+		.nx_huge_page_workaround_enabled = is_nx_huge_page_enabled(vcpu->kvm),
+
+		.max_level = PG_LEVEL_4K,
+		.req_level = PG_LEVEL_4K,
+		.goal_level = PG_LEVEL_4K,
+		.is_private = true,
+
+		.gfn = gfn,
+		.slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn),
+		.pfn = pfn,
+		.map_writable = true,
+	};
+	struct kvm *kvm = vcpu->kvm;
+	int r;
+
+	lockdep_assert_held(&kvm->slots_lock);
+
+	/*
+	 * Mapping a pre-determined private pfn is intended only for use when
+	 * populating a guest_memfd instance.  Assert that the slot is backed
+	 * by guest_memfd and that the gmem instance's invalidate_lock is held.
+	 */
+	kvm_assert_gmem_invalidate_lock_held(fault.slot);
+
+	if (KVM_BUG_ON(!tdp_mmu_enabled, kvm))
+		return -EIO;
+
+	if (kvm_gfn_is_write_tracked(kvm, fault.slot, fault.gfn))
+		return -EPERM;
+
+	r = kvm_mmu_reload(vcpu);
+	if (r)
+		return r;
+
+	r = mmu_topup_memory_caches(vcpu, false);
+	if (r)
+		return r;
+
+	do {
+		if (signal_pending(current))
+			return -EINTR;
+
+		if (kvm_test_request(KVM_REQ_VM_DEAD, vcpu))
+			return -EIO;
+
+		cond_resched();
+
+		guard(read_lock)(&kvm->mmu_lock);
+
+		r = kvm_tdp_mmu_map(vcpu, &fault);
+	} while (r == RET_PF_RETRY);
+
+	if (r != RET_PF_FIXED)
+		return -EIO;
+
+	return 0;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_tdp_mmu_map_private_pfn);
+#endif
+
 static void nonpaging_init_context(struct kvm_mmu *context)
 {
 	context->page_fault = nonpaging_page_fault;
@@ -5997,7 +6077,6 @@ int kvm_mmu_load(struct kvm_vcpu *vcpu)
 out:
 	return r;
 }
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_mmu_load);
 
 void kvm_mmu_unload(struct kvm_vcpu *vcpu)
 {
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 4c3014befe9f..29f344af4cc2 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3157,15 +3157,12 @@ struct tdx_gmem_post_populate_arg {
 static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 				  void __user *src, int order, void *_arg)
 {
-	u64 error_code = PFERR_GUEST_FINAL_MASK | PFERR_PRIVATE_ACCESS;
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 	struct tdx_gmem_post_populate_arg *arg = _arg;
-	struct kvm_vcpu *vcpu = arg->vcpu;
+	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
+	u64 err, entry, level_state;
 	gpa_t gpa = gfn_to_gpa(gfn);
-	u8 level = PG_LEVEL_4K;
 	struct page *src_page;
 	int ret, i;
-	u64 err, entry, level_state;
 
 	/*
 	 * Get the source page if it has been faulted in. Return failure if the
@@ -3177,7 +3174,7 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 	if (ret != 1)
 		return -ENOMEM;
 
-	ret = kvm_tdp_map_page(vcpu, gpa, error_code, &level);
+	ret = kvm_tdp_mmu_map_private_pfn(arg->vcpu, gfn, pfn);
 	if (ret < 0)
 		goto out;
 
@@ -3240,7 +3237,6 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
 	    !vt_is_tdx_private_gpa(kvm, region.gpa + (region.nr_pages << PAGE_SHIFT) - 1))
 		return -EINVAL;
 
-	kvm_mmu_reload(vcpu);
 	ret = 0;
 	while (region.nr_pages) {
 		if (signal_pending(current)) {
-- 
2.51.1.930.gacf6e81ea2-goog


