Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 549E13B261C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 06:16:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9RfZ0VBHz3c8f
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 14:16:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dv5LjKXQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=stevensd@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=dv5LjKXQ; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9RGh4ZS9z2ym7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 13:59:40 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id 69so2254821plc.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 20:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rGhSdqWICTA5PgwfGHMrAD52/EkxYZBZfRUDwyHqnHk=;
 b=dv5LjKXQNX7iqd//Y8mI9XsYTQRLW55xnD2xsarWiSn1UgfVIpkqdxYauBiMjnGZgS
 Daq2nuOAbtSX3iHsOL4BO23OO1GBSnnl01c/lf1ovjm+bxGIPLuJ5OR1ckWXD96vSsQE
 RbH3hT2NCPbNJQQmWidQ7NArS7fSJCQmDp3+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rGhSdqWICTA5PgwfGHMrAD52/EkxYZBZfRUDwyHqnHk=;
 b=lwQPY9NQGYYE9oof/8hwqeMNC6a5KdhZtcWXD/loPJLjAHiYc7PXscTbEudu7PdXpQ
 hGA9LO8X8n3hSbmV8evcjiwvVAP45uRmVso+IyF26WuybWv9VYWElSaFqNjIE0kGF1wu
 1SUdcvwvIQnHvgA3g/w0W8Rd4RRtHQDhoQl+H1N0pPeQObc0vpnkfCMu7zGpYVp2iS++
 rA7mDr3Osas/O485oXbamWEYUcYz/rh0Vq8tsDhFn4iXh0FMLDIYW50YNbaN+aWd1JZx
 cjlPUDlfKP/MV0CrFJV5Hr5z+93oNtnROTts/i+QIPM5kgnPHv1TRpJ3W67GP4GN5trr
 6IKA==
X-Gm-Message-State: AOAM532FJGhuKSg9sClq+KFeropEv3Bom+leY8PC+WNCBhvQOLayO3wQ
 3DrnGiGRziLxwYUfwD4zVnCuiQ==
X-Google-Smtp-Source: ABdhPJw8ZvbCfm9/QnuBxKkuk/y0QnUUa8vtPtRegVMQUfCTblbVZdhf10lpvlsnnzi7jBhKM/uELQ==
X-Received: by 2002:a17:902:7c92:b029:111:2ca8:3d8e with SMTP id
 y18-20020a1709027c92b02901112ca83d8emr2395525pll.77.1624507177170; 
 Wed, 23 Jun 2021 20:59:37 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:5038:6344:7f10:3690])
 by smtp.gmail.com with UTF8SMTPSA id c14sm600303pgv.86.2021.06.23.20.59.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 20:59:36 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 3/6] KVM: x86/mmu: avoid struct page in MMU
Date: Thu, 24 Jun 2021 12:57:46 +0900
Message-Id: <20210624035749.4054934-4-stevensd@google.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210624035749.4054934-1-stevensd@google.com>
References: <20210624035749.4054934-1-stevensd@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 24 Jun 2021 14:15:11 +1000
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
Cc: intel-gvt-dev@lists.freedesktop.org, Wanpeng Li <wanpengli@tencent.com>,
 kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-mips@vger.kernel.org,
 David Stevens <stevensd@chromium.org>, James Morse <james.morse@arm.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David Stevens <stevensd@chromium.org>

Avoid converting pfns returned by follow_fault_pfn to struct pages to
transiently take a reference. The reference was originally taken to
match the reference taken by gup. However, pfns returned by
follow_fault_pfn may not have a struct page set up for reference
counting.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 arch/x86/kvm/mmu/mmu.c          | 56 +++++++++++++++++++--------------
 arch/x86/kvm/mmu/mmu_audit.c    | 13 ++++----
 arch/x86/kvm/mmu/mmu_internal.h |  3 +-
 arch/x86/kvm/mmu/paging_tmpl.h  | 36 ++++++++++++---------
 arch/x86/kvm/mmu/tdp_mmu.c      |  7 +++--
 arch/x86/kvm/mmu/tdp_mmu.h      |  4 +--
 arch/x86/kvm/x86.c              |  9 +++---
 7 files changed, 73 insertions(+), 55 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 84913677c404..8fa4a4a411ba 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2610,16 +2610,16 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, u64 *sptep,
 	return ret;
 }
 
-static kvm_pfn_t pte_prefetch_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
-				     bool no_dirty_log)
+static struct kvm_pfn_page pte_prefetch_gfn_to_pfn(struct kvm_vcpu *vcpu,
+						   gfn_t gfn, bool no_dirty_log)
 {
 	struct kvm_memory_slot *slot;
 
 	slot = gfn_to_memslot_dirty_bitmap(vcpu, gfn, no_dirty_log);
 	if (!slot)
-		return KVM_PFN_ERR_FAULT;
+		return KVM_PFN_PAGE_ERR(KVM_PFN_ERR_FAULT);
 
-	return kvm_pfn_page_unwrap(gfn_to_pfn_memslot_atomic(slot, gfn));
+	return gfn_to_pfn_memslot_atomic(slot, gfn);
 }
 
 static int direct_pte_prefetch_many(struct kvm_vcpu *vcpu,
@@ -2748,7 +2748,8 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
 
 int kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, gfn_t gfn,
 			    int max_level, kvm_pfn_t *pfnp,
-			    bool huge_page_disallowed, int *req_level)
+			    struct page *page, bool huge_page_disallowed,
+			    int *req_level)
 {
 	struct kvm_memory_slot *slot;
 	kvm_pfn_t pfn = *pfnp;
@@ -2760,6 +2761,9 @@ int kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, gfn_t gfn,
 	if (unlikely(max_level == PG_LEVEL_4K))
 		return PG_LEVEL_4K;
 
+	if (!page)
+		return PG_LEVEL_4K;
+
 	if (is_error_noslot_pfn(pfn) || kvm_is_reserved_pfn(pfn))
 		return PG_LEVEL_4K;
 
@@ -2814,7 +2818,8 @@ void disallowed_hugepage_adjust(u64 spte, gfn_t gfn, int cur_level,
 }
 
 static int __direct_map(struct kvm_vcpu *vcpu, gpa_t gpa, u32 error_code,
-			int map_writable, int max_level, kvm_pfn_t pfn,
+			int map_writable, int max_level,
+			const struct kvm_pfn_page *pfnpg,
 			bool prefault, bool is_tdp)
 {
 	bool nx_huge_page_workaround_enabled = is_nx_huge_page_enabled();
@@ -2826,11 +2831,12 @@ static int __direct_map(struct kvm_vcpu *vcpu, gpa_t gpa, u32 error_code,
 	int level, req_level, ret;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	gfn_t base_gfn = gfn;
+	kvm_pfn_t pfn = pfnpg->pfn;
 
 	if (WARN_ON(!VALID_PAGE(vcpu->arch.mmu->root_hpa)))
 		return RET_PF_RETRY;
 
-	level = kvm_mmu_hugepage_adjust(vcpu, gfn, max_level, &pfn,
+	level = kvm_mmu_hugepage_adjust(vcpu, gfn, max_level, &pfn, pfnpg->page,
 					huge_page_disallowed, &req_level);
 
 	trace_kvm_mmu_spte_requested(gpa, level, pfn);
@@ -3672,8 +3678,8 @@ static bool kvm_arch_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 }
 
 static bool try_async_pf(struct kvm_vcpu *vcpu, bool prefault, gfn_t gfn,
-			 gpa_t cr2_or_gpa, kvm_pfn_t *pfn, hva_t *hva,
-			 bool write, bool *writable)
+			 gpa_t cr2_or_gpa, struct kvm_pfn_page *pfnpg,
+			 hva_t *hva, bool write, bool *writable)
 {
 	struct kvm_memory_slot *slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
 	bool async;
@@ -3688,17 +3694,16 @@ static bool try_async_pf(struct kvm_vcpu *vcpu, bool prefault, gfn_t gfn,
 
 	/* Don't expose private memslots to L2. */
 	if (is_guest_mode(vcpu) && !kvm_is_visible_memslot(slot)) {
-		*pfn = KVM_PFN_NOSLOT;
+		*pfnpg = KVM_PFN_PAGE_ERR(KVM_PFN_NOSLOT);
 		*writable = false;
 		return false;
 	}
 
 	async = false;
-	*pfn = kvm_pfn_page_unwrap(__gfn_to_pfn_memslot(slot, gfn, false,
-							&async, write,
-							writable, hva));
+	*pfnpg = __gfn_to_pfn_memslot(slot, gfn, false, &async,
+				      write, writable, hva);
 	if (!async)
-		return false; /* *pfn has correct page already */
+		return false; /* *pfnpg has correct page already */
 
 	if (!prefault && kvm_can_do_async_pf(vcpu)) {
 		trace_kvm_try_async_get_page(cr2_or_gpa, gfn);
@@ -3710,8 +3715,8 @@ static bool try_async_pf(struct kvm_vcpu *vcpu, bool prefault, gfn_t gfn,
 			return true;
 	}
 
-	*pfn = kvm_pfn_page_unwrap(__gfn_to_pfn_memslot(slot, gfn, false, NULL,
-							write, writable, hva));
+	*pfnpg = __gfn_to_pfn_memslot(slot, gfn, false, NULL,
+				      write, writable, hva);
 	return false;
 }
 
@@ -3723,7 +3728,7 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u32 error_code,
 
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	unsigned long mmu_seq;
-	kvm_pfn_t pfn;
+	struct kvm_pfn_page pfnpg;
 	hva_t hva;
 	int r;
 
@@ -3743,11 +3748,12 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u32 error_code,
 	mmu_seq = vcpu->kvm->mmu_notifier_seq;
 	smp_rmb();
 
-	if (try_async_pf(vcpu, prefault, gfn, gpa, &pfn, &hva,
+	if (try_async_pf(vcpu, prefault, gfn, gpa, &pfnpg, &hva,
 			 write, &map_writable))
 		return RET_PF_RETRY;
 
-	if (handle_abnormal_pfn(vcpu, is_tdp ? 0 : gpa, gfn, pfn, ACC_ALL, &r))
+	if (handle_abnormal_pfn(vcpu, is_tdp ? 0 : gpa,
+				gfn, pfnpg.pfn, ACC_ALL, &r))
 		return r;
 
 	r = RET_PF_RETRY;
@@ -3757,7 +3763,8 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u32 error_code,
 	else
 		write_lock(&vcpu->kvm->mmu_lock);
 
-	if (!is_noslot_pfn(pfn) && mmu_notifier_retry_hva(vcpu->kvm, mmu_seq, hva))
+	if (!is_noslot_pfn(pfnpg.pfn) &&
+	    mmu_notifier_retry_hva(vcpu->kvm, mmu_seq, hva))
 		goto out_unlock;
 	r = make_mmu_pages_available(vcpu);
 	if (r)
@@ -3765,17 +3772,18 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u32 error_code,
 
 	if (is_tdp_mmu_root(vcpu->kvm, vcpu->arch.mmu->root_hpa))
 		r = kvm_tdp_mmu_map(vcpu, gpa, error_code, map_writable, max_level,
-				    pfn, prefault);
+				    &pfnpg, prefault);
 	else
-		r = __direct_map(vcpu, gpa, error_code, map_writable, max_level, pfn,
-				 prefault, is_tdp);
+		r = __direct_map(vcpu, gpa, error_code, map_writable, max_level,
+				 &pfnpg, prefault, is_tdp);
 
 out_unlock:
 	if (is_tdp_mmu_root(vcpu->kvm, vcpu->arch.mmu->root_hpa))
 		read_unlock(&vcpu->kvm->mmu_lock);
 	else
 		write_unlock(&vcpu->kvm->mmu_lock);
-	kvm_release_pfn_clean(pfn);
+	if (pfnpg.page)
+		put_page(pfnpg.page);
 	return r;
 }
 
diff --git a/arch/x86/kvm/mmu/mmu_audit.c b/arch/x86/kvm/mmu/mmu_audit.c
index 3f983dc6e0f1..72b470b892da 100644
--- a/arch/x86/kvm/mmu/mmu_audit.c
+++ b/arch/x86/kvm/mmu/mmu_audit.c
@@ -94,7 +94,7 @@ static void audit_mappings(struct kvm_vcpu *vcpu, u64 *sptep, int level)
 {
 	struct kvm_mmu_page *sp;
 	gfn_t gfn;
-	kvm_pfn_t pfn;
+	struct kvm_pfn_page pfnpg;
 	hpa_t hpa;
 
 	sp = sptep_to_sp(sptep);
@@ -111,18 +111,19 @@ static void audit_mappings(struct kvm_vcpu *vcpu, u64 *sptep, int level)
 		return;
 
 	gfn = kvm_mmu_page_get_gfn(sp, sptep - sp->spt);
-	pfn = kvm_pfn_page_unwrap(kvm_vcpu_gfn_to_pfn_atomic(vcpu, gfn));
+	pfnpg = kvm_vcpu_gfn_to_pfn_atomic(vcpu, gfn);
 
-	if (is_error_pfn(pfn))
+	if (is_error_pfn(pfnpg.pfn))
 		return;
 
-	hpa =  pfn << PAGE_SHIFT;
+	hpa =  pfnpg.pfn << PAGE_SHIFT;
 	if ((*sptep & PT64_BASE_ADDR_MASK) != hpa)
 		audit_printk(vcpu->kvm, "levels %d pfn %llx hpa %llx "
-			     "ent %llxn", vcpu->arch.mmu->root_level, pfn,
+			     "ent %llxn", vcpu->arch.mmu->root_level, pfnpg.pfn,
 			     hpa, *sptep);
 
-	kvm_release_pfn_clean(pfn);
+	if (pfnpg.page)
+		put_page(pfnpg.page);
 }
 
 static void inspect_spte_has_rmap(struct kvm *kvm, u64 *sptep)
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index d64ccb417c60..db4d878fde4e 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -154,7 +154,8 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
 			      kvm_pfn_t pfn, int max_level);
 int kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, gfn_t gfn,
 			    int max_level, kvm_pfn_t *pfnp,
-			    bool huge_page_disallowed, int *req_level);
+			    struct page *page, bool huge_page_disallowed,
+			    int *req_level);
 void disallowed_hugepage_adjust(u64 spte, gfn_t gfn, int cur_level,
 				kvm_pfn_t *pfnp, int *goal_levelp);
 
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index 823a5919f9fa..db13efd4b62d 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -535,7 +535,7 @@ FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 {
 	unsigned pte_access;
 	gfn_t gfn;
-	kvm_pfn_t pfn;
+	struct kvm_pfn_page pfnpg;
 
 	if (FNAME(prefetch_invalid_gpte)(vcpu, sp, spte, gpte))
 		return false;
@@ -545,19 +545,20 @@ FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 	gfn = gpte_to_gfn(gpte);
 	pte_access = sp->role.access & FNAME(gpte_access)(gpte);
 	FNAME(protect_clean_gpte)(vcpu->arch.mmu, &pte_access, gpte);
-	pfn = pte_prefetch_gfn_to_pfn(vcpu, gfn,
+	pfnpg = pte_prefetch_gfn_to_pfn(vcpu, gfn,
 			no_dirty_log && (pte_access & ACC_WRITE_MASK));
-	if (is_error_pfn(pfn))
+	if (is_error_pfn(pfnpg.pfn))
 		return false;
 
 	/*
 	 * we call mmu_set_spte() with host_writable = true because
 	 * pte_prefetch_gfn_to_pfn always gets a writable pfn.
 	 */
-	mmu_set_spte(vcpu, spte, pte_access, false, PG_LEVEL_4K, gfn, pfn,
+	mmu_set_spte(vcpu, spte, pte_access, false, PG_LEVEL_4K, gfn, pfnpg.pfn,
 		     true, true);
 
-	kvm_release_pfn_clean(pfn);
+	if (pfnpg.page)
+		put_page(pfnpg.page);
 	return true;
 }
 
@@ -637,8 +638,8 @@ static void FNAME(pte_prefetch)(struct kvm_vcpu *vcpu, struct guest_walker *gw,
  */
 static int FNAME(fetch)(struct kvm_vcpu *vcpu, gpa_t addr,
 			 struct guest_walker *gw, u32 error_code,
-			 int max_level, kvm_pfn_t pfn, bool map_writable,
-			 bool prefault)
+			 int max_level, struct kvm_pfn_page *pfnpg,
+			 bool map_writable, bool prefault)
 {
 	bool nx_huge_page_workaround_enabled = is_nx_huge_page_enabled();
 	bool write_fault = error_code & PFERR_WRITE_MASK;
@@ -649,6 +650,7 @@ static int FNAME(fetch)(struct kvm_vcpu *vcpu, gpa_t addr,
 	unsigned int direct_access, access;
 	int top_level, level, req_level, ret;
 	gfn_t base_gfn = gw->gfn;
+	kvm_pfn_t pfn = pfnpg->pfn;
 
 	direct_access = gw->pte_access;
 
@@ -695,7 +697,8 @@ static int FNAME(fetch)(struct kvm_vcpu *vcpu, gpa_t addr,
 	}
 
 	level = kvm_mmu_hugepage_adjust(vcpu, gw->gfn, max_level, &pfn,
-					huge_page_disallowed, &req_level);
+					pfnpg->page, huge_page_disallowed,
+					&req_level);
 
 	trace_kvm_mmu_spte_requested(addr, gw->level, pfn);
 
@@ -801,7 +804,7 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, gpa_t addr, u32 error_code,
 	bool user_fault = error_code & PFERR_USER_MASK;
 	struct guest_walker walker;
 	int r;
-	kvm_pfn_t pfn;
+	struct kvm_pfn_page pfnpg;
 	hva_t hva;
 	unsigned long mmu_seq;
 	bool map_writable, is_self_change_mapping;
@@ -853,11 +856,12 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, gpa_t addr, u32 error_code,
 	mmu_seq = vcpu->kvm->mmu_notifier_seq;
 	smp_rmb();
 
-	if (try_async_pf(vcpu, prefault, walker.gfn, addr, &pfn, &hva,
+	if (try_async_pf(vcpu, prefault, walker.gfn, addr, &pfnpg, &hva,
 			 write_fault, &map_writable))
 		return RET_PF_RETRY;
 
-	if (handle_abnormal_pfn(vcpu, addr, walker.gfn, pfn, walker.pte_access, &r))
+	if (handle_abnormal_pfn(vcpu, addr, walker.gfn, pfnpg.pfn,
+				walker.pte_access, &r))
 		return r;
 
 	/*
@@ -866,7 +870,7 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, gpa_t addr, u32 error_code,
 	 */
 	if (write_fault && !(walker.pte_access & ACC_WRITE_MASK) &&
 	     !is_write_protection(vcpu) && !user_fault &&
-	      !is_noslot_pfn(pfn)) {
+	      !is_noslot_pfn(pfnpg.pfn)) {
 		walker.pte_access |= ACC_WRITE_MASK;
 		walker.pte_access &= ~ACC_USER_MASK;
 
@@ -882,20 +886,22 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, gpa_t addr, u32 error_code,
 
 	r = RET_PF_RETRY;
 	write_lock(&vcpu->kvm->mmu_lock);
-	if (!is_noslot_pfn(pfn) && mmu_notifier_retry_hva(vcpu->kvm, mmu_seq, hva))
+	if (!is_noslot_pfn(pfnpg.pfn) &&
+	    mmu_notifier_retry_hva(vcpu->kvm, mmu_seq, hva))
 		goto out_unlock;
 
 	kvm_mmu_audit(vcpu, AUDIT_PRE_PAGE_FAULT);
 	r = make_mmu_pages_available(vcpu);
 	if (r)
 		goto out_unlock;
-	r = FNAME(fetch)(vcpu, addr, &walker, error_code, max_level, pfn,
+	r = FNAME(fetch)(vcpu, addr, &walker, error_code, max_level, &pfnpg,
 			 map_writable, prefault);
 	kvm_mmu_audit(vcpu, AUDIT_POST_PAGE_FAULT);
 
 out_unlock:
 	write_unlock(&vcpu->kvm->mmu_lock);
-	kvm_release_pfn_clean(pfn);
+	if (pfnpg.page)
+		put_page(pfnpg.page);
 	return r;
 }
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 237317b1eddd..b0e6d63f0fe1 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -960,8 +960,8 @@ static int tdp_mmu_map_handle_target_level(struct kvm_vcpu *vcpu, int write,
  * page tables and SPTEs to translate the faulting guest physical address.
  */
 int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, gpa_t gpa, u32 error_code,
-		    int map_writable, int max_level, kvm_pfn_t pfn,
-		    bool prefault)
+		    int map_writable, int max_level,
+		    const struct kvm_pfn_page *pfnpg, bool prefault)
 {
 	bool nx_huge_page_workaround_enabled = is_nx_huge_page_enabled();
 	bool write = error_code & PFERR_WRITE_MASK;
@@ -976,13 +976,14 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, gpa_t gpa, u32 error_code,
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	int level;
 	int req_level;
+	kvm_pfn_t pfn = pfnpg->pfn;
 
 	if (WARN_ON(!VALID_PAGE(vcpu->arch.mmu->root_hpa)))
 		return RET_PF_RETRY;
 	if (WARN_ON(!is_tdp_mmu_root(vcpu->kvm, vcpu->arch.mmu->root_hpa)))
 		return RET_PF_RETRY;
 
-	level = kvm_mmu_hugepage_adjust(vcpu, gfn, max_level, &pfn,
+	level = kvm_mmu_hugepage_adjust(vcpu, gfn, max_level, &pfn, pfnpg->page,
 					huge_page_disallowed, &req_level);
 
 	trace_kvm_mmu_spte_requested(gpa, level, pfn);
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index 5fdf63090451..f78681b9dcb7 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -52,8 +52,8 @@ void kvm_tdp_mmu_invalidate_all_roots(struct kvm *kvm);
 void kvm_tdp_mmu_zap_invalidated_roots(struct kvm *kvm);
 
 int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, gpa_t gpa, u32 error_code,
-		    int map_writable, int max_level, kvm_pfn_t pfn,
-		    bool prefault);
+		    int map_writable, int max_level,
+		    const struct kvm_pfn_page *pfnpg, bool prefault);
 
 bool kvm_tdp_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range,
 				 bool flush);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index d31797e0cb6e..86d66c765190 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -7311,7 +7311,7 @@ static bool reexecute_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 				  int emulation_type)
 {
 	gpa_t gpa = cr2_or_gpa;
-	kvm_pfn_t pfn;
+	struct kvm_pfn_page pfnpg;
 
 	if (!(emulation_type & EMULTYPE_ALLOW_RETRY_PF))
 		return false;
@@ -7341,16 +7341,17 @@ static bool reexecute_instruction(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 	 * retry instruction -> write #PF -> emulation fail -> retry
 	 * instruction -> ...
 	 */
-	pfn = kvm_pfn_page_unwrap(gfn_to_pfn(vcpu->kvm, gpa_to_gfn(gpa)));
+	pfnpg = gfn_to_pfn(vcpu->kvm, gpa_to_gfn(gpa));
 
 	/*
 	 * If the instruction failed on the error pfn, it can not be fixed,
 	 * report the error to userspace.
 	 */
-	if (is_error_noslot_pfn(pfn))
+	if (is_error_noslot_pfn(pfnpg.pfn))
 		return false;
 
-	kvm_release_pfn_clean(pfn);
+	if (pfnpg.page)
+		put_page(pfnpg.page);
 
 	/* The instructions are well-emulated on direct mmu. */
 	if (vcpu->arch.mmu->direct_map) {
-- 
2.32.0.93.g670b81a890-goog

