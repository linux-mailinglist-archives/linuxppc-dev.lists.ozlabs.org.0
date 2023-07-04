Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04121746B4C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 09:57:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Vdipneht;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwFWh6QlHz3cRR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 17:57:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Vdipneht;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwFPD6S0Nz3bWr
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 17:52:00 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b7e6512973so29842545ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jul 2023 00:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688457118; x=1691049118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCpKC4uXwQHydKgBR4yAPbGVdXRXBlTDW5vlI7SMZnI=;
        b=VdipnehtoBWVnZgiiIRUC3n4cutyHftCzzQTvCt+6pDBfsoJDl0IPP7jexUln1Z3yv
         24G47TmH8QpI+nwzx6ctjE817ctenOUmr6AjP+CmoU02rktwSe6aOZx2ZntH2UwQ9DeO
         KBx6QbhtpOviBTERdqZU9t3L7LqRKS8+C/r84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688457118; x=1691049118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCpKC4uXwQHydKgBR4yAPbGVdXRXBlTDW5vlI7SMZnI=;
        b=ZCrxVu2RZEEYnTFZPwQD3hZw01uwBWbYidOE7Rq7XXP1y5r6RLxfP35bYMqUj39UqJ
         lSXAva7BNUNmO+I5Q/WyogxqGGzKM/xwxkZIO12QcqxiUo6yAieolEc0YkoBdsV5hikR
         gEfwW4lLMADMp0ipwb8GirLksoKwXHMzEUYDFMLbBXWTWYfiYmycMAsyj21VSP+EcR9C
         DXxoo6X4Si3vkNLIBXZhszH/ynSEJe5p1/YZZPPmY5dNO81Y4t/IOoKKHSvXlgk6rkCu
         sSPmM2ykmYEdBgelvUZ+vSd9BP/hRyqykAMqD/p5Kpzptp+mxPO1m3NQGt0kVI8OqjQS
         FNBQ==
X-Gm-Message-State: ABy/qLYTVyxPONSD4wUgWIWHmPE9CKUnQH3EOjCBnMqBS1/PQq5x+PM2
	eray9z1rnYJh3kNCjV0ZF8QoTw==
X-Google-Smtp-Source: APBJJlFlOFbHWdaS64bV6rkagDydvh49k9oEO7W5D2RIf2i40ajXmc6e9E8Ak2SPFXB+2GmF5HmwRQ==
X-Received: by 2002:a17:902:c409:b0:1b8:6cae:4400 with SMTP id k9-20020a170902c40900b001b86cae4400mr9997546plk.37.1688457118004;
        Tue, 04 Jul 2023 00:51:58 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:a11b:bff7:d8ae:bb0])
        by smtp.gmail.com with UTF8SMTPSA id a4-20020a1709027d8400b001ae0a4b1d3fsm16529164plm.153.2023.07.04.00.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 00:51:57 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Sean Christopherson <seanjc@google.com>
Subject: [PATCH v7 6/8] KVM: arm64: Migrate to __kvm_follow_pfn
Date: Tue,  4 Jul 2023 16:50:51 +0900
Message-ID: <20230704075054.3344915-7-stevensd@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
In-Reply-To: <20230704075054.3344915-1-stevensd@google.com>
References: <20230704075054.3344915-1-stevensd@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, David Stevens <stevensd@chromium.org>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David Stevens <stevensd@chromium.org>

Migrate from __gfn_to_pfn_memslot to __kvm_follow_pfn.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 arch/arm64/kvm/mmu.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6db9ef288ec3..c706530d304d 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1334,7 +1334,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 			  unsigned long fault_status)
 {
 	int ret = 0;
-	bool write_fault, writable, force_pte = false;
+	bool write_fault = kvm_is_write_fault(vcpu);
+	bool force_pte = false;
 	bool exec_fault, mte_allowed;
 	bool device = false;
 	unsigned long mmu_seq;
@@ -1342,16 +1343,19 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
 	struct vm_area_struct *vma;
 	short vma_shift;
-	gfn_t gfn;
 	kvm_pfn_t pfn;
 	bool logging_active = memslot_is_logging(memslot);
 	unsigned long fault_level = kvm_vcpu_trap_get_fault_level(vcpu);
 	long vma_pagesize, fault_granule;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
+	struct kvm_follow_pfn foll = {
+		.slot = memslot,
+		.flags = FOLL_GET | (write_fault ? FOLL_WRITE : 0),
+		.allow_write_mapping = true,
+	};
 
 	fault_granule = 1UL << ARM64_HW_PGTABLE_LEVEL_SHIFT(fault_level);
-	write_fault = kvm_is_write_fault(vcpu);
 	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
 	VM_BUG_ON(write_fault && exec_fault);
 
@@ -1425,7 +1429,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE)
 		fault_ipa &= ~(vma_pagesize - 1);
 
-	gfn = fault_ipa >> PAGE_SHIFT;
+	foll.gfn = fault_ipa >> PAGE_SHIFT;
 	mte_allowed = kvm_vma_mte_allowed(vma);
 
 	/* Don't use the VMA after the unlock -- it may have vanished */
@@ -1433,7 +1437,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 
 	/*
 	 * Read mmu_invalidate_seq so that KVM can detect if the results of
-	 * vma_lookup() or __gfn_to_pfn_memslot() become stale prior to
+	 * vma_lookup() or __kvm_follow_pfn() become stale prior to
 	 * acquiring kvm->mmu_lock.
 	 *
 	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
@@ -1442,8 +1446,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
-	pfn = __gfn_to_pfn_memslot(memslot, gfn, false, false, NULL,
-				   write_fault, &writable, NULL);
+	pfn = __kvm_follow_pfn(&foll);
 	if (pfn == KVM_PFN_ERR_HWPOISON) {
 		kvm_send_hwpoison_signal(hva, vma_shift);
 		return 0;
@@ -1468,7 +1471,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		 * Only actually map the page as writable if this was a write
 		 * fault.
 		 */
-		writable = false;
+		foll.writable = false;
 	}
 
 	if (exec_fault && device)
@@ -1508,7 +1511,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		}
 	}
 
-	if (writable)
+	if (foll.writable)
 		prot |= KVM_PGTABLE_PROT_W;
 
 	if (exec_fault)
@@ -1534,9 +1537,9 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 					     KVM_PGTABLE_WALK_SHARED);
 
 	/* Mark the page dirty only if the fault is handled successfully */
-	if (writable && !ret) {
+	if (foll.writable && !ret) {
 		kvm_set_pfn_dirty(pfn);
-		mark_page_dirty_in_slot(kvm, memslot, gfn);
+		mark_page_dirty_in_slot(kvm, memslot, foll.gfn);
 	}
 
 out_unlock:
-- 
2.41.0.255.g8b1d071c50-goog

