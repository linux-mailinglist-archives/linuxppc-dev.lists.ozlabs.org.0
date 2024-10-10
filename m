Return-Path: <linuxppc-dev+bounces-1991-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB58998FE7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:25:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdTc0dM4z3bn9;
	Fri, 11 Oct 2024 05:25:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584708;
	cv=none; b=aLybG4tizOsXn8GUMyT4tSy/JvVdqMOt2beRhtgn5oURuOr1I9APlrtIisjtrZIF1FuogXqcQ3REq0LK9dWobFYtAO4KXTLRbK38GYMNff4RYRS2urv7npHRMaAnUGBbSEOnCD2mNl0MK68TMYZCGFLUiPlpUOHuitaSNLHW3hhsiOFii1LNlyKHNKlJxZRRymqUMCx9EYd0wBraVRA5DO7/OXgZsENugpe7wPkeutrOIqErg1CI9S7eZ7yVbr3clTGdRGbe9+8UNxj1IzyGUtB6eUCofPHuUq0nXOoG8HrLlDCIu5K4HF81fDg/jFF4zBwyC/sD6/Ga4L7zBOSzXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584708; c=relaxed/relaxed;
	bh=zmCOkT+wuJeT9H1MjXHCrAkGhLQoiMWK376kHF4kwCg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Uoqphda+3TG2hZWyuO7ShH3RnzYf6ocvvj+Gcp77bUdw/Z8ryzS1UmA85g4P4Hfmd+f1DGwNqTpR8GnhoJkxhB42gBjzKplFHmkYLGP1/V6uIyQcKWvvX+ow36tOSzZHCjXmbL1qR9TFLm5hH8/fUbwoGsWcpnfLivQD6xrZc67wu4Rdx6MM+upoNFVTP735dephUiEhGGFypUfweKDFOyrDwiICTkpXNvh/c8IShDfb+ws1pbpAWCqoh5JTJi69/vi+4IKbdqKJ/94epiubmnMEJHVqzJy9WiT4ujxYFgWySQ3EsTBmSikSzl5Q7fSfBh634XS200w0gcHN85m2uA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=sEhiXrDS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3_hsizwykdjuh3zc815dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=sEhiXrDS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3_hsizwykdjuh3zc815dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdTb09VDz3blZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:06 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e290d41291bso1588429276.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584704; x=1729189504; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zmCOkT+wuJeT9H1MjXHCrAkGhLQoiMWK376kHF4kwCg=;
        b=sEhiXrDSjHETYIdDD4LlhAK4FAP9flhbwSJPy/AT5cLT/onA0vjY9kf0IVNxZPAj1c
         d3Wcul3+LZctUpKBsDfSH8pxmoJOqA+aRRld44BqrFwoXhwQ/cEVE4hObf9k0Hw/BTk7
         JxuuPh76tJKFGAPlfh9BBDuEcjqFqsHU8z6MYQX21QYkWWzXd3htnzyPFAxd40PIa2K6
         WXrMIfrR/h+o8Ja1CeMldtEwOmtsB4np5zVa3i9pxT8HwYhFXt/r5xzT0wmXJR627Q+y
         SPoNCM06r5uZOI29bRJpfh9UkqJYIrCjI9NaT6vuXfOw1IFVFiucE65sS9b1X34Bx3vE
         BPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584704; x=1729189504;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmCOkT+wuJeT9H1MjXHCrAkGhLQoiMWK376kHF4kwCg=;
        b=nrBXLh35k0gBnRZzTF2dpaGNAjvDU45Vh9Eq/vKz1wqX+gcDi6nLjZM/9RxR9hBiHV
         FY9OkWlVHZY5l0n5P698xRlnDbbQpfh2XmKX0sL4s1jbzs+8BVdNPJtHgOqGoLO7jKIG
         Uu6k3KXP66LzsICTAliM0wl3vPMvc3TsYBWYceeLcBL8r0LVaIqybb8wXnE8EHsZ1ihz
         q4Rl7PCyUdhZrkRzsP77mk9xe1MR7XYJy4CNL4wMWIoXzEh5IlsF0HGWmJRUJ7mzN+/G
         eT+ELy7J2Zo4TgmqXrJTkIh1x9wtTUv39SLynph7hTi/nyOFMSSqhHdFYhjMU7ety/Xz
         r/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsOf6vkZotfRYVhC0U9cyDpebkSGbwfk7rlwZthKdXcwPwfNUXPBiR4Ea7G962GFQmNL7u7D98cljxQRo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw/vHviBCwOH6Dzwx3QU6A24ywBWmheBmykXdXiDXYxhgDj9g3U
	cm2IBFuj9CVALftVd/OqsP7w2xtY8M8SzgOTfReWqegejzZgevo9dqUnZH9T5LhpG1ha7GiLwaw
	pmw==
X-Google-Smtp-Source: AGHT+IHLS32ZnUy4bY0gdVqRjJSlR5N1zmb3UxYk5drKGwVtxhq/Y8NIZIwMp1duovDzYwXPQsOfO5WBu4o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1812:b0:e24:9f58:dd17 with SMTP id
 3f1490d57ef6-e28fe32f042mr66754276.1.1728584702932; Thu, 10 Oct 2024 11:25:02
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:08 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-7-seanjc@google.com>
Subject: [PATCH v13 06/85] KVM: x86/mmu: Invert @can_unsync and renamed to @synchronizing
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Invert the polarity of "can_unsync" and rename the parameter to
"synchronizing" to allow a future change to set the Accessed bit if KVM
is synchronizing an existing SPTE.  Querying "can_unsync" in that case is
nonsensical, as the fact that KVM can't unsync SPTEs doesn't provide any
justification for setting the Accessed bit.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 12 ++++++------
 arch/x86/kvm/mmu/mmu_internal.h |  2 +-
 arch/x86/kvm/mmu/paging_tmpl.h  |  2 +-
 arch/x86/kvm/mmu/spte.c         |  4 ++--
 arch/x86/kvm/mmu/spte.h         |  2 +-
 arch/x86/kvm/mmu/tdp_mmu.c      |  4 ++--
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a8c64069aa89..0f21d6f76cab 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2795,7 +2795,7 @@ static void kvm_unsync_page(struct kvm *kvm, struct kvm_mmu_page *sp)
  * be write-protected.
  */
 int mmu_try_to_unsync_pages(struct kvm *kvm, const struct kvm_memory_slot *slot,
-			    gfn_t gfn, bool can_unsync, bool prefetch)
+			    gfn_t gfn, bool synchronizing, bool prefetch)
 {
 	struct kvm_mmu_page *sp;
 	bool locked = false;
@@ -2810,12 +2810,12 @@ int mmu_try_to_unsync_pages(struct kvm *kvm, const struct kvm_memory_slot *slot,
 
 	/*
 	 * The page is not write-tracked, mark existing shadow pages unsync
-	 * unless KVM is synchronizing an unsync SP (can_unsync = false).  In
-	 * that case, KVM must complete emulation of the guest TLB flush before
-	 * allowing shadow pages to become unsync (writable by the guest).
+	 * unless KVM is synchronizing an unsync SP.  In that case, KVM must
+	 * complete emulation of the guest TLB flush before allowing shadow
+	 * pages to become unsync (writable by the guest).
 	 */
 	for_each_gfn_valid_sp_with_gptes(kvm, sp, gfn) {
-		if (!can_unsync)
+		if (synchronizing)
 			return -EPERM;
 
 		if (sp->unsync)
@@ -2941,7 +2941,7 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
 	}
 
 	wrprot = make_spte(vcpu, sp, slot, pte_access, gfn, pfn, *sptep, prefetch,
-			   true, host_writable, &spte);
+			   false, host_writable, &spte);
 
 	if (*sptep == spte) {
 		ret = RET_PF_SPURIOUS;
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index c98827840e07..4da83544c4e1 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -164,7 +164,7 @@ static inline gfn_t gfn_round_for_level(gfn_t gfn, int level)
 }
 
 int mmu_try_to_unsync_pages(struct kvm *kvm, const struct kvm_memory_slot *slot,
-			    gfn_t gfn, bool can_unsync, bool prefetch);
+			    gfn_t gfn, bool synchronizing, bool prefetch);
 
 void kvm_mmu_gfn_disallow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn);
 void kvm_mmu_gfn_allow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn);
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index ae7d39ff2d07..6e7bd8921c6f 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -963,7 +963,7 @@ static int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int
 	host_writable = spte & shadow_host_writable_mask;
 	slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
 	make_spte(vcpu, sp, slot, pte_access, gfn,
-		  spte_to_pfn(spte), spte, true, false,
+		  spte_to_pfn(spte), spte, true, true,
 		  host_writable, &spte);
 
 	return mmu_spte_update(sptep, spte);
diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index 5521608077ec..0e47fea1a2d9 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -157,7 +157,7 @@ bool spte_has_volatile_bits(u64 spte)
 bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 	       const struct kvm_memory_slot *slot,
 	       unsigned int pte_access, gfn_t gfn, kvm_pfn_t pfn,
-	       u64 old_spte, bool prefetch, bool can_unsync,
+	       u64 old_spte, bool prefetch, bool synchronizing,
 	       bool host_writable, u64 *new_spte)
 {
 	int level = sp->role.level;
@@ -248,7 +248,7 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 		 * e.g. it's write-tracked (upper-level SPs) or has one or more
 		 * shadow pages and unsync'ing pages is not allowed.
 		 */
-		if (mmu_try_to_unsync_pages(vcpu->kvm, slot, gfn, can_unsync, prefetch)) {
+		if (mmu_try_to_unsync_pages(vcpu->kvm, slot, gfn, synchronizing, prefetch)) {
 			wrprot = true;
 			pte_access &= ~ACC_WRITE_MASK;
 			spte &= ~(PT_WRITABLE_MASK | shadow_mmu_writable_mask);
diff --git a/arch/x86/kvm/mmu/spte.h b/arch/x86/kvm/mmu/spte.h
index 2cb816ea2430..c81cac9358e0 100644
--- a/arch/x86/kvm/mmu/spte.h
+++ b/arch/x86/kvm/mmu/spte.h
@@ -499,7 +499,7 @@ bool spte_has_volatile_bits(u64 spte);
 bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 	       const struct kvm_memory_slot *slot,
 	       unsigned int pte_access, gfn_t gfn, kvm_pfn_t pfn,
-	       u64 old_spte, bool prefetch, bool can_unsync,
+	       u64 old_spte, bool prefetch, bool synchronizing,
 	       bool host_writable, u64 *new_spte);
 u64 make_huge_page_split_spte(struct kvm *kvm, u64 huge_spte,
 		      	      union kvm_mmu_page_role role, int index);
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 3c6583468742..76bca7a726c1 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1033,8 +1033,8 @@ static int tdp_mmu_map_handle_target_level(struct kvm_vcpu *vcpu,
 		new_spte = make_mmio_spte(vcpu, iter->gfn, ACC_ALL);
 	else
 		wrprot = make_spte(vcpu, sp, fault->slot, ACC_ALL, iter->gfn,
-					 fault->pfn, iter->old_spte, fault->prefetch, true,
-					 fault->map_writable, &new_spte);
+				   fault->pfn, iter->old_spte, fault->prefetch,
+				   false, fault->map_writable, &new_spte);
 
 	if (new_spte == iter->old_spte)
 		ret = RET_PF_SPURIOUS;
-- 
2.47.0.rc1.288.g06298d1525-goog


