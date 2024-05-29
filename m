Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id F39658D3E2E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 20:16:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=btpdQ/tn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqHSX4Zl7z88MJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 04:08:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=btpdQ/tn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jthoughton.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3yw5xzgokdnq9j7ek67jed6ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--jthoughton.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqHNg2qlFz78rS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 04:05:23 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-df7721f2e70so364785276.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 11:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717005921; x=1717610721; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CwoKXote5Ew7Jsdz/aAIUFFvPSk6A909NzRQYNohjtE=;
        b=btpdQ/tnjbLuhpHQdrv9sntfh/8j0t3A5Ptx7O0OXSzJ34gBgycQ2fFNJdCarrSzBF
         7PTBNWKVUUWIEa237spWMScytBg4SdLUsBdiRHqQFpSzYnORQ38WmP611Ec4B3AgK+35
         jUt31rg2tFz0VQ9w7IaewbnS6jriMxaKT9u2SyLTIVAoWzNYXhoE/m+BP29GYiUcaUGC
         /qYJ2Wpp3noIq4J/mbOoDh9tKaKVafZPnIWwi0pm4avRjLac1TBxhHAm2UEpGFC9ADPv
         oC9A7iUI5AYJW2E9OnZ45yc12auG/+MuB9E+1dYdbFjrbjU3nUXTU0EekzB8tvDwDGt8
         kn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717005921; x=1717610721;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CwoKXote5Ew7Jsdz/aAIUFFvPSk6A909NzRQYNohjtE=;
        b=MgYPu04tzJQKdaEoWXUcq/7BqgwkolVo7GQ/QnrPoLzk4aGz3rxj6eKVrQKTdNMd6X
         +/IsJG755oPXjj6Mj2JKdFCGna5ZjNdbnObbFu+Uzhlb8Ei2MeuAYC23qsQx80/vvp70
         i7IwXPTEQkFHR3NOVJRjTLbxQRw/iyImD8MoKtE8Gvsx60SRe85+fkEsVmYKR7b19UP0
         8c2rbQKsQU7+AKJUy1jfy5wF/n/T+X2VNc9cOfBThWTBcUHad1GBI5qmO9TmbireffVs
         h/SBOOtEA0MV/plWnlCimcnJXkG7NJLROKH/orqzznewwdajaFw3PfypG+7V+ArByfgB
         TPAw==
X-Forwarded-Encrypted: i=1; AJvYcCU8Ky70qRMi92EzZ7AjvYFZ4T/3bb7oDo1M8Q4vm8b5U0G3h+d1KAnRF8hprLXVBTC1L+NVhRLvhTquA8G/RAoE3+u0g7Vn5Lv9O8OxYQ==
X-Gm-Message-State: AOJu0Yz1DTGXZCnK00jS1Mj7Zc1eO6JPc8o+uUA96thojMhDCDC2jvIQ
	AqqsixT5rzfjR9fNgn0Q7umBdWr5nvdQ+6NMya4wXV/j5h9P8RgHJyh9HTQiPSyFS0V3ME0nzxu
	axnMh6XJxfDqEM5LCuw==
X-Google-Smtp-Source: AGHT+IF9TgFBMPkNgtG0hPNwMJ317N5S8DzPgfu78mJAr8hsxOfUSU1lJMom0dwIl649roanAV0XRBVJc/tZTtZp
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:6902:1005:b0:df7:9df5:4bbc with
 SMTP id 3f1490d57ef6-dfa462d091bmr641866276.0.1717005921060; Wed, 29 May 2024
 11:05:21 -0700 (PDT)
Date: Wed, 29 May 2024 18:05:07 +0000
In-Reply-To: <20240529180510.2295118-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240529180510.2295118-5-jthoughton@google.com>
Subject: [PATCH v4 4/7] KVM: Move MMU lock acquisition for test/clear_young to architecture
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
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
Cc: James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Yu Zhao <yuzhao@google.com>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, David Rientjes <rientjes@google.com>, Zenghui Yu <yuzenghui@huawei.com>, Axel Rasmussen <axelrasmussen@google.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, David Matlack <dmatlack@google.
 com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, Sean Christopherson <seanjc@google.com>, Ankit Agrawal <ankita@nvidia.com>, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For implementation mmu_notifier_{test,clear}_young, the KVM memslot
walker used to take the MMU lock for us. Now make the architectures
take it themselves.

Don't relax locking for any architecture except powerpc e500; its
implementations of kvm_age_gfn and kvm_test_age_gfn simply return false,
so there is no need to grab the KVM MMU lock.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/kvm/mmu.c      | 30 ++++++++++++++++++++++--------
 arch/loongarch/kvm/mmu.c  | 20 +++++++++++++++-----
 arch/mips/kvm/mmu.c       | 21 ++++++++++++++++-----
 arch/powerpc/kvm/book3s.c | 14 ++++++++++++--
 arch/riscv/kvm/mmu.c      | 26 ++++++++++++++++++++------
 arch/x86/kvm/mmu/mmu.c    |  8 ++++++++
 virt/kvm/kvm_main.c       |  4 ++--
 7 files changed, 95 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 8bcab0cc3fe9..8337009dde77 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1773,25 +1773,39 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
+	bool young = false;
+
+	write_lock(&kvm->mmu_lock);
 
 	if (!kvm->arch.mmu.pgt)
-		return false;
+		goto out;
 
-	return kvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
-						   range->start << PAGE_SHIFT,
-						   size, true);
+	young = kvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
+						    range->start << PAGE_SHIFT,
+						    size, true);
+
+out:
+	write_unlock(&kvm->mmu_lock);
+	return young;
 }
 
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
+	bool young = false;
+
+	write_lock(&kvm->mmu_lock);
 
 	if (!kvm->arch.mmu.pgt)
-		return false;
+		goto out;
 
-	return kvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
-						   range->start << PAGE_SHIFT,
-						   size, false);
+	young = kvm_pgtable_stage2_test_clear_young(kvm->arch.mmu.pgt,
+						    range->start << PAGE_SHIFT,
+						    size, false);
+
+out:
+	write_unlock(&kvm->mmu_lock);
+	return young;
 }
 
 phys_addr_t kvm_mmu_get_httbr(void)
diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 98883aa23ab8..5eb262bcf6b0 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -497,24 +497,34 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	kvm_ptw_ctx ctx;
+	bool young;
+
+	spin_lock(&kvm->mmu_lock);
 
 	ctx.flag = 0;
 	ctx.ops = kvm_mkold_pte;
 	kvm_ptw_prepare(kvm, &ctx);
 
-	return kvm_ptw_top(kvm->arch.pgd, range->start << PAGE_SHIFT,
+	young = kvm_ptw_top(kvm->arch.pgd, range->start << PAGE_SHIFT,
 				range->end << PAGE_SHIFT, &ctx);
+
+	spin_unlock(&kvm->mmu_lock);
+	return young;
 }
 
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	gpa_t gpa = range->start << PAGE_SHIFT;
-	kvm_pte_t *ptep = kvm_populate_gpa(kvm, NULL, gpa, 0);
+	kvm_pte_t *ptep;
+	bool young;
 
-	if (ptep && kvm_pte_present(NULL, ptep) && kvm_pte_young(*ptep))
-		return true;
+	spin_lock(&kvm->mmu_lock);
+	ptep = kvm_populate_gpa(kvm, NULL, gpa, 0);
 
-	return false;
+	young = ptep && kvm_pte_present(NULL, ptep) && kvm_pte_young(*ptep);
+
+	spin_unlock(&kvm->mmu_lock);
+	return young;
 }
 
 /*
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index c17157e700c0..db3b7cf22db1 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -446,17 +446,28 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	return kvm_mips_mkold_gpa_pt(kvm, range->start, range->end);
+	bool young;
+
+	spin_lock(&kvm->mmu_lock);
+	young = kvm_mips_mkold_gpa_pt(kvm, range->start, range->end);
+	spin_unlock(&kvm->mmu_lock);
+	return young;
 }
 
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	gpa_t gpa = range->start << PAGE_SHIFT;
-	pte_t *gpa_pte = kvm_mips_pte_for_gpa(kvm, NULL, gpa);
+	pte_t *gpa_pte;
+	bool young = false;
 
-	if (!gpa_pte)
-		return false;
-	return pte_young(*gpa_pte);
+	spin_lock(&kvm->mmu_lock);
+	gpa_pte = kvm_mips_pte_for_gpa(kvm, NULL, gpa);
+
+	if (gpa_pte)
+		young = pte_young(*gpa_pte);
+
+	spin_unlock(&kvm->mmu_lock);
+	return young;
 }
 
 /**
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index ff6c38373957..f503ab9ac3a5 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -887,12 +887,22 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	return kvm->arch.kvm_ops->age_gfn(kvm, range);
+	bool young;
+
+	spin_lock(&kvm->mmu_lock);
+	young = kvm->arch.kvm_ops->age_gfn(kvm, range);
+	spin_unlock(&kvm->mmu_lock);
+	return young;
 }
 
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	return kvm->arch.kvm_ops->test_age_gfn(kvm, range);
+	bool young;
+
+	spin_lock(&kvm->mmu_lock);
+	young = kvm->arch.kvm_ops->test_age_gfn(kvm, range);
+	spin_unlock(&kvm->mmu_lock);
+	return young;
 }
 
 int kvmppc_core_init_vm(struct kvm *kvm)
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index b63650f9b966..c78abe8041fb 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -555,17 +555,24 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	pte_t *ptep;
 	u32 ptep_level = 0;
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
+	bool young = false;
+
+	spin_lock(&kvm->mmu_lock);
 
 	if (!kvm->arch.pgd)
-		return false;
+		goto out;
 
 	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
 
 	if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
 				   &ptep, &ptep_level))
-		return false;
+		goto out;
+
+	young = ptep_test_and_clear_young(NULL, 0, ptep);
 
-	return ptep_test_and_clear_young(NULL, 0, ptep);
+out:
+	spin_unlock(&kvm->mmu_lock);
+	return young;
 }
 
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
@@ -573,17 +580,24 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	pte_t *ptep;
 	u32 ptep_level = 0;
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
+	bool young = false;
+
+	spin_lock(&kvm->mmu_lock);
 
 	if (!kvm->arch.pgd)
-		return false;
+		goto out;
 
 	WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
 
 	if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
 				   &ptep, &ptep_level))
-		return false;
+		goto out;
+
+	young = pte_young(ptep_get(ptep));
 
-	return pte_young(ptep_get(ptep));
+out:
+	spin_unlock(&kvm->mmu_lock);
+	return young;
 }
 
 int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 662f62dfb2aa..6a2a557c2c31 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1630,12 +1630,16 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	bool young = false;
 
+	write_lock(&kvm->mmu_lock);
+
 	if (kvm_memslots_have_rmaps(kvm))
 		young = kvm_handle_gfn_range(kvm, range, kvm_age_rmap);
 
 	if (tdp_mmu_enabled)
 		young |= kvm_tdp_mmu_age_gfn_range(kvm, range);
 
+	write_unlock(&kvm->mmu_lock);
+
 	return young;
 }
 
@@ -1643,12 +1647,16 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	bool young = false;
 
+	write_lock(&kvm->mmu_lock);
+
 	if (kvm_memslots_have_rmaps(kvm))
 		young = kvm_handle_gfn_range(kvm, range, kvm_test_age_rmap);
 
 	if (tdp_mmu_enabled)
 		young |= kvm_tdp_mmu_test_age_gfn(kvm, range);
 
+	write_unlock(&kvm->mmu_lock);
+
 	return young;
 }
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d197b6725cb3..8d2d3acf18d8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -901,7 +901,7 @@ static int kvm_mmu_notifier_clear_young(struct mmu_notifier *mn,
 	 * more sophisticated heuristic later.
 	 */
 	return kvm_handle_hva_range_no_flush(mn, start, end,
-					     kvm_age_gfn, false);
+					     kvm_age_gfn, true);
 }
 
 static int kvm_mmu_notifier_test_young(struct mmu_notifier *mn,
@@ -911,7 +911,7 @@ static int kvm_mmu_notifier_test_young(struct mmu_notifier *mn,
 	trace_kvm_test_age_hva(address);
 
 	return kvm_handle_hva_range_no_flush(mn, address, address + 1,
-					     kvm_test_age_gfn, false);
+					     kvm_test_age_gfn, true);
 }
 
 static void kvm_mmu_notifier_release(struct mmu_notifier *mn,
-- 
2.45.1.288.g0e0cd299f1-goog

