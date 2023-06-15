Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2094B73210F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 22:44:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=nQbZV095;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhvQk05Vzz3bnw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 06:43:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=nQbZV095;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::a49; helo=mail-vk1-xa49.google.com; envelope-from=3geolzaykdf8pb7kg9dlldib.9ljifkrumm9-absifpqp.lwi78p.lod@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com [IPv6:2607:f8b0:4864:20::a49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhvPs5pzCz30FW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 06:43:11 +1000 (AEST)
Received: by mail-vk1-xa49.google.com with SMTP id 71dfb90a1353d-46e6f186080so763784e0c.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 13:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686861788; x=1689453788;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ncA8NUQ/d7RIXyoqKxF4dofBT4rINO6z44852n+jNFs=;
        b=nQbZV095qPTODM38p030xUkUE5YvPu/SZRzBpPfAXb+fLsoa1IGO9yqckVeOQshL6T
         K+JwXgnKUHxQEx5636G+4fgYCnUVleMvPleLvieSaIvK9v+lIL8nmEZQO8QButhEQLZv
         lW//NSLqYnHhKpkWpZb3umXstgQFcdd2srXFlCBcWln+720WttnI0XQ9xBtmd1Evi7YL
         a5oQG5UTyBCNvIUY6C/RgnT59oqEOLyP8z+w1VtbmtIDLYsjgcDSunfFLuBPr1wPUPYU
         pwLL1WcZBPSf8UWLLktIi6pDH2d+QINc05EvgnluyEVFUlX2ucegVqKnUxlMpj7qFseF
         q1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686861788; x=1689453788;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ncA8NUQ/d7RIXyoqKxF4dofBT4rINO6z44852n+jNFs=;
        b=ZbZRu+jMI+WlFZkrvjrkCPiKlctmOtpz0jSMwjNJxxzYSrKVJlaGYUmonmLXMYCurY
         VzTxTPIJF/F4CeUEtBZSHap7tAAlwjxBmwnPiugArWxsQYMzVdESUOqC+utnpnomoThp
         vBsbdwyXXvu+5A+No0GEL1s2tyHrsYdaXLi7kJ7FHuQqtd0HkyaBEFm+IyCIsR6z/lcx
         cmt8T7M0SDVgenOc4hprxpsLO7YrpShwPaQgsmbPR8lx5z+mS+9a8SbybP/DREHrT96k
         R/a/R4lGF7nY+D6LH2TWF2xXn2XtoOFny8qx5LwE52/Bjg1a54WJn/1pU23lZynuNL7J
         SAJg==
X-Gm-Message-State: AC+VfDy8T/CydmYKuyISeOgVqxjpJaahbARA4GGrKXS/+p0umkzidDT8
	2xR51gkT8NsIlr+HdROdPV7V7B0OY4Q=
X-Google-Smtp-Source: ACHHUZ58VbUpKiHJn4yWrs3hFzFVgLfs2NAcssDwAzKOV57o1C8oPk/BJPOHvBI5DAEtAMIVLjSdWrCDPAY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:3495:0:b0:bc3:9cd9:6e0e with SMTP id
 b143-20020a253495000000b00bc39cd96e0emr732274yba.10.1686848384875; Thu, 15
 Jun 2023 09:59:44 -0700 (PDT)
Date: Thu, 15 Jun 2023 09:59:43 -0700
In-Reply-To: <20230526234435.662652-9-yuzhao@google.com>
Mime-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com> <20230526234435.662652-9-yuzhao@google.com>
Message-ID: <ZItDf5lpKJz7uezP@google.com>
Subject: Re: [PATCH mm-unstable v2 08/10] kvm/x86: move tdp_mmu_enabled and shadow_accessed_mask
From: Sean Christopherson <seanjc@google.com>
To: Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 26, 2023, Yu Zhao wrote:
> tdp_mmu_enabled and shadow_accessed_mask are needed to implement
> kvm_arch_has_test_clear_young().
> 
> Signed-off-by: Yu Zhao <yuzhao@google.com>
> ---
>  arch/x86/include/asm/kvm_host.h | 6 ++++++
>  arch/x86/kvm/mmu.h              | 6 ------
>  arch/x86/kvm/mmu/spte.h         | 1 -
>  3 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index fb9d1f2d6136..753c67072c47 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1772,6 +1772,7 @@ struct kvm_arch_async_pf {
>  
>  extern u32 __read_mostly kvm_nr_uret_msrs;
>  extern u64 __read_mostly host_efer;
> +extern u64 __read_mostly shadow_accessed_mask;
>  extern bool __read_mostly allow_smaller_maxphyaddr;
>  extern bool __read_mostly enable_apicv;
>  extern struct kvm_x86_ops kvm_x86_ops;
> @@ -1855,6 +1856,11 @@ void kvm_fire_mask_notifiers(struct kvm *kvm, unsigned irqchip, unsigned pin,
>  			     bool mask);
>  
>  extern bool tdp_enabled;
> +#ifdef CONFIG_X86_64
> +extern bool tdp_mmu_enabled;
> +#else
> +#define tdp_mmu_enabled false
> +#endif

I would much prefer that these be kept in kvm/mmu.h.  And looking at all the arch
code, there's no reason to make kvm_arch_has_test_clear_young() a runtime callback,
all of the logic is constant relative to when KVM is loaded.

So rather than have generic KVM pull from arch code, what if we have arch code
push info to generic KVM?  We could even avoid #ifdefs if arch code passed in its
handler.  That might result in an extra indirect branch though, so it might be
better to just use a flag?  E.g. the x86 conversion would be something like this.

---
 arch/x86/kvm/mmu/mmu.c     |  5 +++++
 arch/x86/kvm/mmu/tdp_mmu.c |  2 +-
 arch/x86/kvm/mmu/tdp_mmu.h |  1 +
 include/linux/kvm_host.h   | 24 ++++--------------------
 virt/kvm/kvm_main.c        | 14 ++++++++++----
 5 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index c8ebe542c565..84a4a83540f0 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5809,6 +5809,11 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
 		max_huge_page_level = PG_LEVEL_1G;
 	else
 		max_huge_page_level = PG_LEVEL_2M;
+
+	if (tdp_mmu_enabled && kvm_ad_enabled())
+		kvm_init_test_clear_young(kvm_tdp_mmu_test_clear_young);
+	else
+		kvm_init_test_clear_young(NULL);
 }
 EXPORT_SYMBOL_GPL(kvm_configure_mmu);
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index f463d54228f8..e878c88f0e02 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1308,7 +1308,7 @@ bool kvm_tdp_mmu_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	return kvm_tdp_mmu_handle_gfn(kvm, range, test_age_gfn);
 }
 
-bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *range)
+bool kvm_tdp_mmu_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	struct kvm_mmu_page *root;
 	int offset = ffs(shadow_accessed_mask) - 1;
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index 0a63b1afabd3..aaa0b75b3896 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -34,6 +34,7 @@ bool kvm_tdp_mmu_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range,
 bool kvm_tdp_mmu_age_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_tdp_mmu_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_tdp_mmu_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
+bool kvm_tdp_mmu_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *range);
 
 bool kvm_tdp_mmu_wrprot_slot(struct kvm *kvm,
 			     const struct kvm_memory_slot *slot, int min_level);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 1714f82a0c47..7a0922cbc36f 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -264,31 +264,15 @@ struct kvm_gfn_range {
 	pte_t pte;
 	bool may_block;
 };
+
+typedef bool (*hva_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
+
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_set_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_should_clear_young(struct kvm_gfn_range *range, gfn_t gfn);
-bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *range);
-#endif
-
-/*
- * Architectures that implement kvm_arch_test_clear_young() should override
- * kvm_arch_has_test_clear_young().
- *
- * kvm_arch_has_test_clear_young() is allowed to return false positive, i.e., it
- * can return true if kvm_arch_test_clear_young() is supported but disabled due
- * to some runtime constraint. In this case, kvm_arch_test_clear_young() should
- * return true; otherwise, it should return false.
- *
- * For each young KVM PTE, kvm_arch_test_clear_young() should call
- * kvm_should_clear_young() to decide whether to clear the accessed bit.
- */
-#ifndef kvm_arch_has_test_clear_young
-static inline bool kvm_arch_has_test_clear_young(void)
-{
-	return false;
-}
+void kvm_init_test_clear_young(hva_handler_t arch_test_clear_young);
 #endif
 
 enum {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ef2790469fda..ac83cfb30771 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -530,8 +530,6 @@ static void kvm_mmu_notifier_invalidate_range(struct mmu_notifier *mn,
 	srcu_read_unlock(&kvm->srcu, idx);
 }
 
-typedef bool (*hva_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
-
 typedef void (*on_lock_fn_t)(struct kvm *kvm, unsigned long start,
 			     unsigned long end);
 
@@ -859,6 +857,14 @@ bool kvm_should_clear_young(struct kvm_gfn_range *range, gfn_t gfn)
 	return args->clear;
 }
 
+static hva_handler_t kvm_test_clear_young;
+
+void kvm_init_test_clear_young(hva_handler_t arch_test_clear_young)
+{
+	WARN_ON_ONCE(!list_empty(&vm_list));
+	kvm_test_clear_young = arch_test_clear_young;
+}
+
 static int kvm_mmu_notifier_test_clear_young(struct mmu_notifier *mn, struct mm_struct *mm,
 					     unsigned long start, unsigned long end,
 					     bool clear, unsigned long *bitmap)
@@ -873,7 +879,7 @@ static int kvm_mmu_notifier_test_clear_young(struct mmu_notifier *mn, struct mm_
 
 	trace_kvm_age_hva(start, end);
 
-	if (kvm_arch_has_test_clear_young()) {
+	if (kvm_test_clear_young) {
 		struct test_clear_young_args args = {
 			.bitmap	= bitmap,
 			.end	= end,
@@ -882,7 +888,7 @@ static int kvm_mmu_notifier_test_clear_young(struct mmu_notifier *mn, struct mm_
 
 		range.args = &args;
 		range.lockless = true;
-		range.handler = kvm_arch_test_clear_young;
+		range.handler = kvm_test_clear_young;
 
 		if (!__kvm_handle_hva_range(kvm, &range))
 			return args.young ? MMU_NOTIFIER_RANGE_LOCKLESS : 0;

base-commit: 39ca80f27cc0d2a37b4e3d07bbf763d4954934d7
-- 

