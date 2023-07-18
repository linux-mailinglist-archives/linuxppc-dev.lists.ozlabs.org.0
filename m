Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B69758953
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 01:50:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=1t0P5wmE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5G0T26ZTz3c71
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 09:50:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=1t0P5wmE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=30ss3zaykdcqseanjcgoogle.comlinuxppc-devlists.ozlabs.org@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5FyZ0ZsZz2ytW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 09:48:36 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1b895fa8929so32403295ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 16:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724113; x=1692316113;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=LxdpiWTpX3B7gMKbPihLQ6FRzF4V55oVGzPxSGe/+4U=;
        b=1t0P5wmE/XmWdqU7J55641EABrTeVarxWaQR4bJ8HE5kvt+bT2Zvilx6zvBC6IhCug
         lxtaG0ZNNeNxKJwNRyofNcY/3UY8SXaGscGhXtOBqjuhZKJLWAvQEL/Od2vXIHWkp721
         m6ADzg8L3JrLCsaJYeIfX0G7ZaqvY3dbA4PpFF78/ivmcmih9CPggzA6FpbWCll6Rc7J
         s/iuth191O25UoKCd/SjRjFkh1FVoiOHo2ymxYD/iPBQpPOGMgrdqXeht4Yx5rEFGAGu
         E6MjDgW0gFgwwVKsMh4xUPmBsbIlsG5Mzs33eQjh6Yww/GhiF/1eZ4NrCcSo7R/KWv9Z
         IRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724113; x=1692316113;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxdpiWTpX3B7gMKbPihLQ6FRzF4V55oVGzPxSGe/+4U=;
        b=L7pUD/6kqjEJlBkG6tp0FlRA7+vSy3Syhpw58ER4h+qG/Js8ZNBonTgYXANQ7KFXgB
         Wvie7LyOXTODyjt8z4ZLSlgDN7OSjvzdpcD3qf3cIpJmemgfWXoqUr43bz5WX5MKkd6+
         Q5X4iZke8AU8OhYWjsaIcTMwltDud5dz753+aa2dFN9eXQ/+pgeI0zI8bzgDqHOvpJWT
         YwmYTlj11kPSzHqWGTq/k6wSh3oLWt2zaKqXWNnqbblevebERZDE2WpkdjjoQB4sTGsp
         1dxJ6D1YdiGhGh8JaWqRoKy3oICmExeHnf31Ayu4x1yKXbdC/pFlcO0luzLPAjnxL706
         +U7w==
X-Gm-Message-State: ABy/qLaPY+Yq7/m1cukHtZSkuN6vZwJ9wOb0V7jnNyquZTnd7ulAcFQq
	VaotHxqCjglzd0JkXkqViVXKQ4P/Emw=
X-Google-Smtp-Source: APBJJlECbx+0jj+7Hb3hGFg2pirZsYDF3lE8aX5+9Q/S485STdtV3M1qZMxLbtNxaVklqPoT+BTJIsFwzzk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2349:b0:1b9:de12:475 with SMTP id
 c9-20020a170903234900b001b9de120475mr8788plh.6.1689724113231; Tue, 18 Jul
 2023 16:48:33 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:44:44 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-2-seanjc@google.com>
Subject: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a per-action union
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c       |  2 +-
 arch/mips/kvm/mmu.c        |  2 +-
 arch/riscv/kvm/mmu.c       |  2 +-
 arch/x86/kvm/mmu/mmu.c     |  2 +-
 arch/x86/kvm/mmu/tdp_mmu.c |  6 +++---
 include/linux/kvm_host.h   |  5 ++++-
 virt/kvm/kvm_main.c        | 16 ++++++++++------
 7 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6db9ef288ec3..55f03a68f1cd 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1721,7 +1721,7 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 
 bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	kvm_pfn_t pfn = pte_pfn(range->pte);
+	kvm_pfn_t pfn = pte_pfn(range->arg.pte);
 
 	if (!kvm->arch.mmu.pgt)
 		return false;
diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index e8c08988ed37..7b2ac1319d70 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -447,7 +447,7 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	gpa_t gpa = range->start << PAGE_SHIFT;
-	pte_t hva_pte = range->pte;
+	pte_t hva_pte = range->arg.pte;
 	pte_t *gpa_pte = kvm_mips_pte_for_gpa(kvm, NULL, gpa);
 	pte_t old_pte;
 
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index f2eb47925806..857f4312b0f8 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -559,7 +559,7 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	int ret;
-	kvm_pfn_t pfn = pte_pfn(range->pte);
+	kvm_pfn_t pfn = pte_pfn(range->arg.pte);
 
 	if (!kvm->arch.pgd)
 		return false;
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index ec169f5c7dce..d72f2b20f430 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1588,7 +1588,7 @@ static __always_inline bool kvm_handle_gfn_range(struct kvm *kvm,
 	for_each_slot_rmap_range(range->slot, PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL,
 				 range->start, range->end - 1, &iterator)
 		ret |= handler(kvm, iterator.rmap, range->slot, iterator.gfn,
-			       iterator.level, range->pte);
+			       iterator.level, range->arg.pte);
 
 	return ret;
 }
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 512163d52194..6250bd3d20c1 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1241,7 +1241,7 @@ static bool set_spte_gfn(struct kvm *kvm, struct tdp_iter *iter,
 	u64 new_spte;
 
 	/* Huge pages aren't expected to be modified without first being zapped. */
-	WARN_ON(pte_huge(range->pte) || range->start + 1 != range->end);
+	WARN_ON(pte_huge(range->arg.pte) || range->start + 1 != range->end);
 
 	if (iter->level != PG_LEVEL_4K ||
 	    !is_shadow_present_pte(iter->old_spte))
@@ -1255,9 +1255,9 @@ static bool set_spte_gfn(struct kvm *kvm, struct tdp_iter *iter,
 	 */
 	tdp_mmu_iter_set_spte(kvm, iter, 0);
 
-	if (!pte_write(range->pte)) {
+	if (!pte_write(range->arg.pte)) {
 		new_spte = kvm_mmu_changed_pte_notifier_make_spte(iter->old_spte,
-								  pte_pfn(range->pte));
+								  pte_pfn(range->arg.pte));
 
 		tdp_mmu_iter_set_spte(kvm, iter, new_spte);
 	}
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9d3ac7720da9..b901571ab61e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -260,7 +260,10 @@ struct kvm_gfn_range {
 	struct kvm_memory_slot *slot;
 	gfn_t start;
 	gfn_t end;
-	pte_t pte;
+	union {
+		pte_t pte;
+		u64 raw;
+	} arg;
 	bool may_block;
 };
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index dfbaafbe3a00..d58b7a506d27 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -526,7 +526,10 @@ typedef void (*on_unlock_fn_t)(struct kvm *kvm);
 struct kvm_hva_range {
 	unsigned long start;
 	unsigned long end;
-	pte_t pte;
+	union {
+		pte_t pte;
+		u64 raw;
+	} arg;
 	hva_handler_t handler;
 	on_lock_fn_t on_lock;
 	on_unlock_fn_t on_unlock;
@@ -562,6 +565,10 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 	struct kvm_memslots *slots;
 	int i, idx;
 
+	BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(gfn_range.arg.raw));
+	BUILD_BUG_ON(sizeof(range->arg) != sizeof(range->arg.raw));
+	BUILD_BUG_ON(sizeof(gfn_range.arg) != sizeof(range->arg));
+
 	if (WARN_ON_ONCE(range->end <= range->start))
 		return 0;
 
@@ -591,7 +598,7 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 			 * bother making these conditional (to avoid writes on
 			 * the second or later invocation of the handler).
 			 */
-			gfn_range.pte = range->pte;
+			gfn_range.arg.raw = range->arg.raw;
 			gfn_range.may_block = range->may_block;
 
 			/*
@@ -639,7 +646,7 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 	const struct kvm_hva_range range = {
 		.start		= start,
 		.end		= end,
-		.pte		= pte,
+		.arg.pte	= pte,
 		.handler	= handler,
 		.on_lock	= (void *)kvm_null_fn,
 		.on_unlock	= (void *)kvm_null_fn,
@@ -659,7 +666,6 @@ static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn
 	const struct kvm_hva_range range = {
 		.start		= start,
 		.end		= end,
-		.pte		= __pte(0),
 		.handler	= handler,
 		.on_lock	= (void *)kvm_null_fn,
 		.on_unlock	= (void *)kvm_null_fn,
@@ -747,7 +753,6 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 	const struct kvm_hva_range hva_range = {
 		.start		= range->start,
 		.end		= range->end,
-		.pte		= __pte(0),
 		.handler	= kvm_unmap_gfn_range,
 		.on_lock	= kvm_mmu_invalidate_begin,
 		.on_unlock	= kvm_arch_guest_memory_reclaimed,
@@ -812,7 +817,6 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 	const struct kvm_hva_range hva_range = {
 		.start		= range->start,
 		.end		= range->end,
-		.pte		= __pte(0),
 		.handler	= (void *)kvm_null_fn,
 		.on_lock	= kvm_mmu_invalidate_end,
 		.on_unlock	= (void *)kvm_null_fn,
-- 
2.41.0.255.g8b1d071c50-goog

