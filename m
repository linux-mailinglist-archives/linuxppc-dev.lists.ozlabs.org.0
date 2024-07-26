Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 204A893DCBE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:49:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0tA7Zm4p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW5c00N8Qz30fM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:49:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0tA7Zm4p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3btekzgykdkgamivrkowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Pq6V9yz3dtJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:55:27 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e0b35859345so399040276.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038126; x=1722642926; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4pm2gWEOx5QJNc32HyFmIStymfHzlyUTPI/gy9LPzsU=;
        b=0tA7Zm4p4VaNCakJQx26cDuyv3ectk0wAVPncyEnOmVna+hcxLFDBz7MBKznNCAAXq
         XFqKgs4hJOCmEJBptf7aDHY1c1XCP0ancpiyShIw13NCtEmXMPnhWvz9yoGror41lEv1
         5DDgXyELU8m5dML2Wj5GOlOCxONxQ1cli1QZTAKSDJlPpxMtdzJmVLS7d2hn+JtOaC1f
         z9JGWbQ2VHW8iDPiFOyfGsUw/c5xHJ7WhCHB+NS1TvlBKnzAiPzwZx4N0LMJOoS8fJVu
         BatYOBg88B5H+XPfd/P0udLPpGklV2EDE70Z1gbwMOKTWDKBbyogGuXSED3+SlUC6XrB
         4m7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038126; x=1722642926;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pm2gWEOx5QJNc32HyFmIStymfHzlyUTPI/gy9LPzsU=;
        b=aF/lqAajv5HO9dFwxJ+QqfLgfR+7OITOyhxkz3kdrDOHsq7Tmc01oInN9I3fcgki9f
         JxnxPGbipsCYD606IlsrahXgQ3yC5X4/IEcIIhhbsZBvKeR3Y4tQT2ddw94P1Bxu0GFj
         9t6YvU2v7Db5EeV9vW1F3awJRepAQK61erHGhnNnCo3s/fKs02BqBvIcPQxdUma2rd8S
         bo1mG/sQZdEv/vu5uJe39cCcjPADtVWGcnM24aptlwdA7amppicvn62nA+X2hODNgycI
         BLq7cYLgi2KoSmQ9R4CpU9GpLToNU/oqfkmbpvINQs246tjThAimZTMe6KWj7vaEEj/y
         jFIA==
X-Forwarded-Encrypted: i=1; AJvYcCUy66jVXMuaxPr/WVuaVnb/ntxgQG5CUFBe7jXtlHzelgsXfZeNSmutzKSiu2+wjNQwl6v4bTF/ggsWZM1npt5Mv6OD1DJyX1mcGnw3uw==
X-Gm-Message-State: AOJu0Yyob5rnmq3r6v0eOlVBl/SWTUZ7L2i7ffA4ks1LyNevVPiVaqJq
	eItiwguNuo8hVjDYio2IXRYRaTpFhOtha+p2a1pAm561mo+zhGPa4eGCSYTGJuY5M0CSbZc6jiY
	YhA==
X-Google-Smtp-Source: AGHT+IGgyahrOCg0Ix+MrKo8QCm20LiC8Zd9dP6asKSX3o/8So/b0NT46HfwZKTclpC/RfFjW09NkNDMj3A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1029:b0:e0b:9b5:8647 with SMTP id
 3f1490d57ef6-e0b544ec4ddmr2334276.8.1722038125883; Fri, 26 Jul 2024 16:55:25
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:30 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-82-seanjc@google.com>
Subject: [PATCH v12 81/84] KVM: x86/mmu: Don't mark "struct page" accessed
 when zapping SPTEs
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
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
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Don't mark pages/folios as accessed in the primary MMU when zapping SPTEs,
as doing so relies on kvm_pfn_to_refcounted_page(), and generally speaking
is unnecessary and wasteful.  KVM participates in page aging via
mmu_notifiers, so there's no need to push "accessed" updates to the
primary MMU.

And if KVM zaps a SPTe in response to an mmu_notifier, marking it accessed
_after_ the primary MMU has decided to zap the page is likely to go
unnoticed, i.e. odds are good that, if the page is being zapped for
reclaim, the page will be swapped out regardless of whether or not KVM
marks the page accessed.

Dropping x86's use of kvm_set_pfn_accessed() also paves the way for
removing kvm_pfn_to_refcounted_page() and all its users.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c     | 17 -----------------
 arch/x86/kvm/mmu/tdp_mmu.c |  3 ---
 2 files changed, 20 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 2a0cfa225c8d..5979eeb916cd 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -546,10 +546,8 @@ static bool mmu_spte_update(u64 *sptep, u64 new_spte)
  */
 static u64 mmu_spte_clear_track_bits(struct kvm *kvm, u64 *sptep)
 {
-	kvm_pfn_t pfn;
 	u64 old_spte = *sptep;
 	int level = sptep_to_sp(sptep)->role.level;
-	struct page *page;
 
 	if (!is_shadow_present_pte(old_spte) ||
 	    !spte_has_volatile_bits(old_spte))
@@ -561,21 +559,6 @@ static u64 mmu_spte_clear_track_bits(struct kvm *kvm, u64 *sptep)
 		return old_spte;
 
 	kvm_update_page_stats(kvm, level, -1);
-
-	pfn = spte_to_pfn(old_spte);
-
-	/*
-	 * KVM doesn't hold a reference to any pages mapped into the guest, and
-	 * instead uses the mmu_notifier to ensure that KVM unmaps any pages
-	 * before they are reclaimed.  Sanity check that, if the pfn is backed
-	 * by a refcounted page, the refcount is elevated.
-	 */
-	page = kvm_pfn_to_refcounted_page(pfn);
-	WARN_ON_ONCE(page && !page_count(page));
-
-	if (is_accessed_spte(old_spte))
-		kvm_set_pfn_accessed(pfn);
-
 	return old_spte;
 }
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index d1de5f28c445..dc153cf92a40 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -861,9 +861,6 @@ static bool tdp_mmu_zap_leafs(struct kvm *kvm, struct kvm_mmu_page *root,
 
 		tdp_mmu_iter_set_spte(kvm, &iter, SHADOW_NONPRESENT_VALUE);
 
-		if (is_accessed_spte(iter.old_spte))
-			kvm_set_pfn_accessed(spte_to_pfn(iter.old_spte));
-
 		/*
 		 * Zappings SPTEs in invalid roots doesn't require a TLB flush,
 		 * see kvm_tdp_mmu_zap_invalidated_roots() for details.
-- 
2.46.0.rc1.232.g9752f9e123-goog

