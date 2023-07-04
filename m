Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D9B746B51
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 09:58:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YcEN4H40;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwFXp1LbSz3cDk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 17:58:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YcEN4H40;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwFPK2yTXz3btn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 17:52:05 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b8033987baso31904045ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jul 2023 00:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688457122; x=1691049122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLyQmP5nDh0RgJC6CxbUZRaauZtJFbl0jChhLeFWjJY=;
        b=YcEN4H40VBFhjUSroHCTQ6NibkY4/dreFivRtQDGr7gpTqvTZYZwVe0bAU1BlFr7Tw
         uJyTBZW+lzvSd7mHzrU/btQNmpbPixGeevr1thUasCjlICbLKVv58agecCi50tM+ervX
         xWtDxYDrmZS6HTOxaQPe/+ifjAer7v5B3P0B0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688457122; x=1691049122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLyQmP5nDh0RgJC6CxbUZRaauZtJFbl0jChhLeFWjJY=;
        b=WcOy4Z4I8r4XgHGWW2yVDMq9lRlzjNmetwSBYymq/shGX2X5p5h054OIrekyI4Bkmo
         NhOXrwF6O/neNf1Q6S1WfFEzMNYHIxrZ7pkVJz2IsYy7C12kdqeKJtcQQprQ7vqnLWMn
         f63m21xRfagQJepetqJl3HGKJFA1i023oFmdZ/5G2igYYoniAKHww6ubCsAZIQRL6Ikl
         G96tLfb1Lb/rxaqZ18W5hDcrGxGtS9ncnYnU2w0mBtm0wxNEximML11wPazflDbwxciB
         MTKrRAOIvYNiObFnG2gXE1YCow1NKYPGf2qckQ48bp64kCWu8y7pPJ74CqueQl4G9qEE
         P8LQ==
X-Gm-Message-State: AC+VfDxFWajncmPRbLeh8eZpWef0G5wm0Nzc/tJ3V5kOb9c1ijScjnN9
	egw2OfTeugnxGfE+WCXJFj25Wg==
X-Google-Smtp-Source: ACHHUZ4Cs6VvcY2DlvQtFDLVIBEE3ptFC2QoRwiqnzemyLMsDUP2Zh7EwpxaQZ2k3xDH9fQ4SSovsQ==
X-Received: by 2002:a17:902:c411:b0:1b6:92f0:b6f5 with SMTP id k17-20020a170902c41100b001b692f0b6f5mr24933837plk.14.1688457122247;
        Tue, 04 Jul 2023 00:52:02 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:a11b:bff7:d8ae:bb0])
        by smtp.gmail.com with UTF8SMTPSA id b3-20020a170902a9c300b001b53be3d956sm16550209plr.167.2023.07.04.00.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 00:52:01 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Sean Christopherson <seanjc@google.com>
Subject: [PATCH v7 7/8] KVM: PPC: Migrate to __kvm_follow_pfn
Date: Tue,  4 Jul 2023 16:50:52 +0900
Message-ID: <20230704075054.3344915-8-stevensd@google.com>
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

Migrate from __gfn_to_pfn_memslot to __kvm_follow_pfn. As part of the
refactoring, remove the redundant calls to get_user_page_fast_only,
since the check for !async && !atomic was removed from the KVM generic
code in b9b33da2aa74. Also, remove the kvm_ro parameter because the KVM
generic code handles RO memslots.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
I have checked that this patch compiles, but I don't have the hardware
to test it myself.

 arch/powerpc/include/asm/kvm_book3s.h  |  2 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c    | 38 +++++++++-----------
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 50 +++++++++++---------------
 arch/powerpc/kvm/book3s_hv_nested.c    |  4 +--
 4 files changed, 38 insertions(+), 56 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index bbf5e2c5fe09..bf48c511e700 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -202,7 +202,7 @@ extern bool kvmppc_hv_handle_set_rc(struct kvm *kvm, bool nested,
 extern int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 				unsigned long gpa,
 				struct kvm_memory_slot *memslot,
-				bool writing, bool kvm_ro,
+				bool writing,
 				pte_t *inserted_pte, unsigned int *levelp);
 extern int kvmppc_init_vm_radix(struct kvm *kvm);
 extern void kvmppc_free_radix(struct kvm *kvm);
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 7f765d5ad436..9a4715e73937 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -523,6 +523,9 @@ int kvmppc_book3s_hv_page_fault(struct kvm_vcpu *vcpu,
 	unsigned long rcbits;
 	long mmio_update;
 	pte_t pte, *ptep;
+	struct kvm_follow_pfn foll = {
+		.allow_write_mapping = true,
+	};
 
 	if (kvm_is_radix(kvm))
 		return kvmppc_book3s_radix_page_fault(vcpu, ea, dsisr);
@@ -599,29 +602,20 @@ int kvmppc_book3s_hv_page_fault(struct kvm_vcpu *vcpu,
 	page = NULL;
 	writing = (dsisr & DSISR_ISSTORE) != 0;
 	/* If writing != 0, then the HPTE must allow writing, if we get here */
-	write_ok = writing;
-	hva = gfn_to_hva_memslot(memslot, gfn);
 
-	/*
-	 * Do a fast check first, since __gfn_to_pfn_memslot doesn't
-	 * do it with !atomic && !async, which is how we call it.
-	 * We always ask for write permission since the common case
-	 * is that the page is writable.
-	 */
-	if (get_user_page_fast_only(hva, FOLL_WRITE, &page)) {
-		write_ok = true;
-	} else {
-		/* Call KVM generic code to do the slow-path check */
-		pfn = __gfn_to_pfn_memslot(memslot, gfn, false, false, NULL,
-					   writing, &write_ok, NULL);
-		if (is_error_noslot_pfn(pfn))
-			return -EFAULT;
-		page = NULL;
-		if (pfn_valid(pfn)) {
-			page = pfn_to_page(pfn);
-			if (PageReserved(page))
-				page = NULL;
-		}
+	foll.slot = memslot;
+	foll.gfn = gfn;
+	foll.flags = FOLL_GET | (writing ? FOLL_WRITE : 0);
+	pfn = __kvm_follow_pfn(&foll);
+	if (is_error_noslot_pfn(pfn))
+		return -EFAULT;
+	page = NULL;
+	write_ok = foll.writable;
+	hva = foll.hva;
+	if (pfn_valid(pfn)) {
+		page = pfn_to_page(pfn);
+		if (PageReserved(page))
+			page = NULL;
 	}
 
 	/*
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 461307b89c3a..339d1efcb6c9 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -815,47 +815,39 @@ bool kvmppc_hv_handle_set_rc(struct kvm *kvm, bool nested, bool writing,
 int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 				   unsigned long gpa,
 				   struct kvm_memory_slot *memslot,
-				   bool writing, bool kvm_ro,
+				   bool writing,
 				   pte_t *inserted_pte, unsigned int *levelp)
 {
 	struct kvm *kvm = vcpu->kvm;
 	struct page *page = NULL;
 	unsigned long mmu_seq;
-	unsigned long hva, gfn = gpa >> PAGE_SHIFT;
-	bool upgrade_write = false;
-	bool *upgrade_p = &upgrade_write;
+	unsigned long hva, pfn, gfn = gpa >> PAGE_SHIFT;
+	bool upgrade_write;
 	pte_t pte, *ptep;
 	unsigned int shift, level;
 	int ret;
 	bool large_enable;
+	struct kvm_follow_pfn foll = {
+		.slot = memslot,
+		.gfn = gfn,
+		.flags = FOLL_GET | (writing ? FOLL_WRITE : 0),
+		.allow_write_mapping = true,
+	};
 
 	/* used to check for invalidations in progress */
 	mmu_seq = kvm->mmu_invalidate_seq;
 	smp_rmb();
 
-	/*
-	 * Do a fast check first, since __gfn_to_pfn_memslot doesn't
-	 * do it with !atomic && !async, which is how we call it.
-	 * We always ask for write permission since the common case
-	 * is that the page is writable.
-	 */
-	hva = gfn_to_hva_memslot(memslot, gfn);
-	if (!kvm_ro && get_user_page_fast_only(hva, FOLL_WRITE, &page)) {
-		upgrade_write = true;
-	} else {
-		unsigned long pfn;
-
-		/* Call KVM generic code to do the slow-path check */
-		pfn = __gfn_to_pfn_memslot(memslot, gfn, false, false, NULL,
-					   writing, upgrade_p, NULL);
-		if (is_error_noslot_pfn(pfn))
-			return -EFAULT;
-		page = NULL;
-		if (pfn_valid(pfn)) {
-			page = pfn_to_page(pfn);
-			if (PageReserved(page))
-				page = NULL;
-		}
+	pfn = __kvm_follow_pfn(&foll);
+	if (is_error_noslot_pfn(pfn))
+		return -EFAULT;
+	page = NULL;
+	hva = foll.hva;
+	upgrade_write = foll.writable;
+	if (pfn_valid(pfn)) {
+		page = pfn_to_page(pfn);
+		if (PageReserved(page))
+			page = NULL;
 	}
 
 	/*
@@ -944,7 +936,6 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 	struct kvm_memory_slot *memslot;
 	long ret;
 	bool writing = !!(dsisr & DSISR_ISSTORE);
-	bool kvm_ro = false;
 
 	/* Check for unusual errors */
 	if (dsisr & DSISR_UNSUPP_MMU) {
@@ -997,7 +988,6 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 					ea, DSISR_ISSTORE | DSISR_PROTFAULT);
 			return RESUME_GUEST;
 		}
-		kvm_ro = true;
 	}
 
 	/* Failed to set the reference/change bits */
@@ -1015,7 +1005,7 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 
 	/* Try to insert a pte */
 	ret = kvmppc_book3s_instantiate_page(vcpu, gpa, memslot, writing,
-					     kvm_ro, NULL, NULL);
+					     NULL, NULL);
 
 	if (ret == 0 || ret == -EAGAIN)
 		ret = RESUME_GUEST;
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 377d0b4a05ee..6d531051df04 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -1497,7 +1497,6 @@ static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
 	unsigned long n_gpa, gpa, gfn, perm = 0UL;
 	unsigned int shift, l1_shift, level;
 	bool writing = !!(dsisr & DSISR_ISSTORE);
-	bool kvm_ro = false;
 	long int ret;
 
 	if (!gp->l1_gr_to_hr) {
@@ -1577,7 +1576,6 @@ static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
 					ea, DSISR_ISSTORE | DSISR_PROTFAULT);
 			return RESUME_GUEST;
 		}
-		kvm_ro = true;
 	}
 
 	/* 2. Find the host pte for this L1 guest real address */
@@ -1599,7 +1597,7 @@ static long int __kvmhv_nested_page_fault(struct kvm_vcpu *vcpu,
 	if (!pte_present(pte) || (writing && !(pte_val(pte) & _PAGE_WRITE))) {
 		/* No suitable pte found -> try to insert a mapping */
 		ret = kvmppc_book3s_instantiate_page(vcpu, gpa, memslot,
-					writing, kvm_ro, &pte, &level);
+					writing, &pte, &level);
 		if (ret == -EAGAIN)
 			return RESUME_GUEST;
 		else if (ret)
-- 
2.41.0.255.g8b1d071c50-goog

