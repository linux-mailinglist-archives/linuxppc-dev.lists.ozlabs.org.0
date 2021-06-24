Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5BA3B2620
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 06:17:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9Rg45kmJz3cJw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 14:17:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HPdpShzC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=stevensd@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=HPdpShzC; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9RGp69VWz2yyL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 13:59:46 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id k5so2693793pjj.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 20:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9SdgTNYjmLMWmcRIfueOdYZ96HzTH4opPLXoYslwZ9E=;
 b=HPdpShzC0ybrvT3bK4wS9AKVUDr5krTibehvPCZeEb7XnHyjJPFqDvLyg3WoT7WmjA
 ii16HFDb+Dr/ywbx1G0hClCMdzQem5OgkBkpMqkErnAepeE/QnIHr5J5GBAyF/S1r4Eo
 AQK6afL4d3/6PBkes4NF6aPC5Zj6ARVYpr48Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9SdgTNYjmLMWmcRIfueOdYZ96HzTH4opPLXoYslwZ9E=;
 b=pESzNO5fftEb9fDmKbyyS8hiqWh+9pj7g9WbyVCC09Vd/SwZgbEOtnS8YaCnZIj3+9
 YFlgO76BIecskZIVed20FgRyyP/A4WmUE1o6Ch1+2MT9QbR489P7BXkNF25+KfQSFgpU
 paCD84/2vQihG8BNHvS0aX3RfOoTnvZoTZvOotVMbciMvxrXnBdVBi+gw4aiBxJj0qmW
 4gUhGw8sCVg2imqq4k7LRXPkOpq//evKh0OhKLG24Y+mS2dxW5rHk7/Tn5uFuQXZ6ZLN
 W6Ks6C4HrTiXXdSGaF8GAW7se18Yf0FxfF7BNotIE02g2AhTVJOCiOQI8/6svfIc0ORE
 HZTQ==
X-Gm-Message-State: AOAM532xWm55yKBA/33scX/1vR+8aisBBytWTmWUw6tT0VbuRXzEW5YG
 BTmuOSffGjBA93ttOTufgITQWA==
X-Google-Smtp-Source: ABdhPJzreaDO29ENi90p5LTXgfYQ+JVEXyymwYOr6PQkte1CXgDzacuiEb/ffZjtnDSEFkJwBV2Mlg==
X-Received: by 2002:a17:903:228d:b029:127:95be:1f7d with SMTP id
 b13-20020a170903228db029012795be1f7dmr2430947plh.64.1624507183619; 
 Wed, 23 Jun 2021 20:59:43 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:5038:6344:7f10:3690])
 by smtp.gmail.com with UTF8SMTPSA id r92sm6898647pja.6.2021.06.23.20.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 20:59:43 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 4/6] KVM: arm64/mmu: avoid struct page in MMU
Date: Thu, 24 Jun 2021 12:57:47 +0900
Message-Id: <20210624035749.4054934-5-stevensd@google.com>
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
 arch/arm64/kvm/mmu.c | 43 +++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 896b3644b36f..a741972cb75f 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -779,17 +779,17 @@ static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
  */
 static unsigned long
 transparent_hugepage_adjust(struct kvm_memory_slot *memslot,
-			    unsigned long hva, kvm_pfn_t *pfnp,
+			    unsigned long hva, struct kvm_pfn_page *pfnpgp,
 			    phys_addr_t *ipap)
 {
-	kvm_pfn_t pfn = *pfnp;
+	kvm_pfn_t pfn = pfnpgp->pfn;
 
 	/*
 	 * Make sure the adjustment is done only for THP pages. Also make
 	 * sure that the HVA and IPA are sufficiently aligned and that the
 	 * block map is contained within the memslot.
 	 */
-	if (kvm_is_transparent_hugepage(pfn) &&
+	if (pfnpgp->page && kvm_is_transparent_hugepage(pfn) &&
 	    fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE)) {
 		/*
 		 * The address we faulted on is backed by a transparent huge
@@ -810,10 +810,11 @@ transparent_hugepage_adjust(struct kvm_memory_slot *memslot,
 		 * page accordingly.
 		 */
 		*ipap &= PMD_MASK;
-		kvm_release_pfn_clean(pfn);
+		put_page(pfnpgp->page);
 		pfn &= ~(PTRS_PER_PMD - 1);
-		kvm_get_pfn(pfn);
-		*pfnp = pfn;
+		pfnpgp->pfn = pfn;
+		pfnpgp->page = pfn_to_page(pfnpgp->pfn);
+		get_page(pfnpgp->page);
 
 		return PMD_SIZE;
 	}
@@ -836,7 +837,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	struct vm_area_struct *vma;
 	short vma_shift;
 	gfn_t gfn;
-	kvm_pfn_t pfn;
+	struct kvm_pfn_page pfnpg;
 	bool logging_active = memslot_is_logging(memslot);
 	unsigned long fault_level = kvm_vcpu_trap_get_fault_level(vcpu);
 	unsigned long vma_pagesize, fault_granule;
@@ -933,17 +934,16 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 */
 	smp_rmb();
 
-	pfn = kvm_pfn_page_unwrap(__gfn_to_pfn_memslot(memslot, gfn, false,
-						       NULL, write_fault,
-						       &writable, NULL));
-	if (pfn == KVM_PFN_ERR_HWPOISON) {
+	pfnpg = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
+				     write_fault, &writable, NULL);
+	if (pfnpg.pfn == KVM_PFN_ERR_HWPOISON) {
 		kvm_send_hwpoison_signal(hva, vma_shift);
 		return 0;
 	}
-	if (is_error_noslot_pfn(pfn))
+	if (is_error_noslot_pfn(pfnpg.pfn))
 		return -EFAULT;
 
-	if (kvm_is_device_pfn(pfn)) {
+	if (kvm_is_device_pfn(pfnpg.pfn)) {
 		device = true;
 		force_pte = true;
 	} else if (logging_active && !write_fault) {
@@ -968,16 +968,16 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 */
 	if (vma_pagesize == PAGE_SIZE && !force_pte)
 		vma_pagesize = transparent_hugepage_adjust(memslot, hva,
-							   &pfn, &fault_ipa);
+							   &pfnpg, &fault_ipa);
 	if (writable)
 		prot |= KVM_PGTABLE_PROT_W;
 
 	if (fault_status != FSC_PERM && !device)
-		clean_dcache_guest_page(pfn, vma_pagesize);
+		clean_dcache_guest_page(pfnpg.pfn, vma_pagesize);
 
 	if (exec_fault) {
 		prot |= KVM_PGTABLE_PROT_X;
-		invalidate_icache_guest_page(pfn, vma_pagesize);
+		invalidate_icache_guest_page(pfnpg.pfn, vma_pagesize);
 	}
 
 	if (device)
@@ -994,20 +994,23 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		ret = kvm_pgtable_stage2_relax_perms(pgt, fault_ipa, prot);
 	} else {
 		ret = kvm_pgtable_stage2_map(pgt, fault_ipa, vma_pagesize,
-					     __pfn_to_phys(pfn), prot,
+					     __pfn_to_phys(pfnpg.pfn), prot,
 					     memcache);
 	}
 
 	/* Mark the page dirty only if the fault is handled successfully */
 	if (writable && !ret) {
-		kvm_set_pfn_dirty(pfn);
+		if (pfnpg.page)
+			kvm_set_pfn_dirty(pfnpg.pfn);
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 	}
 
 out_unlock:
 	spin_unlock(&kvm->mmu_lock);
-	kvm_set_pfn_accessed(pfn);
-	kvm_release_pfn_clean(pfn);
+	if (pfnpg.page) {
+		kvm_set_pfn_accessed(pfnpg.pfn);
+		put_page(pfnpg.page);
+	}
 	return ret != -EAGAIN ? ret : 0;
 }
 
-- 
2.32.0.93.g670b81a890-goog

