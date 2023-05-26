Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0CD71309E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 01:49:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QShVL3CZ8z3fMj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 09:49:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=A+5tnxly;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--yuzhao.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3b0rxzaykdoygchpiwowwotm.kwutqvcfxxk-lmdtqaba.whtija.wzo@flex--yuzhao.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=A+5tnxly;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QShNd53s5z3c8V
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 09:44:49 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-ba8338f20bdso1709668276.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 16:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685144687; x=1687736687;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gdtrmeQ7r8fSzyqqoeow0Oco6w18CVCYcKcBQXKvLk0=;
        b=A+5tnxly4jAziM7PCgC2JSUrvZIuWUL9UuTqWd7F/s/V7U9ZvBSUtbCMn4PDjXhEkh
         xPkXA8ijRXU8kfBAAJh45kvENT/cQ+0BqqVDKv4CzNn3FeibDZ4esB2AS5+kj2xWW1A/
         5f+rTWaRryOWr0eLpQP68cwlR3USUfp7Ely4h3ulPbhNc/8a6O9EbhRXY0Hc8yu56mx8
         LQMCwDasuefCJVI+rIDEYvr3/19bdInHAEUvVq6phC2Jc21wzdoWQlzM7WDhIq/i18eK
         BEwyErOKi0xkhmnwWH0N/n1UzNpwg5kRKa2pc24aeVs5XXh0p7GOcbD7gzDkKgQaeHXr
         C7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685144687; x=1687736687;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gdtrmeQ7r8fSzyqqoeow0Oco6w18CVCYcKcBQXKvLk0=;
        b=AW04Jh/uNlXrfOyRDowaGu8k4iko/BkH99ex0EW0RP0Ju9En+SWwc/TzmB0XjLifT0
         yaQb8S9ckoHM/+cBgLb0pLs2wvTYyZ91ELwlFJL7+tTv+Loah/eOX3mfQ0WMM1qxx390
         S8tnz13grgNdel6f4nP4ImSQuJ76SJXZN6xNi+w0Q8OcGSFrN2WjqdqPHyWnIIBDZzqj
         uiKgkjb15GgAl6jfmnI2YWQPXsjIFTjiSmlFv2WkjBOeBWKuiPcDGaRJseFOgwa+Wn5I
         BaKRNv6pdm8SALprVUWVQtbw2KOUdnefX7IBYjoyFGhfaHuMtEd43uXevvuX4Cavz26h
         NiwQ==
X-Gm-Message-State: AC+VfDztNXsmV3GXYkNaELFf9csHQq6kylQ/Or5YSw8xxL8IAkpOqM9s
	ZtGgkvkh4qvbThssHPMNLW+h5vYW7Dw=
X-Google-Smtp-Source: ACHHUZ75roT4ZouTjM2lH4DZFyTBmS3QLSjPTFGxgUaEGtzpG1LtCtXvcTQXcsV4/+3guLPQ6FLc+WkYaOc=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:910f:8a15:592b:2087])
 (user=yuzhao job=sendgmr) by 2002:a25:b28d:0:b0:bad:155a:1004 with SMTP id
 k13-20020a25b28d000000b00bad155a1004mr1830575ybj.2.1685144687512; Fri, 26 May
 2023 16:44:47 -0700 (PDT)
Date: Fri, 26 May 2023 17:44:30 -0600
In-Reply-To: <20230526234435.662652-1-yuzhao@google.com>
Message-Id: <20230526234435.662652-6-yuzhao@google.com>
Mime-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Subject: [PATCH mm-unstable v2 05/10] kvm/arm64: add kvm_arch_test_clear_young()
From: Yu Zhao <yuzhao@google.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Yu Zhao <yuzhao@google.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-ke
 rnel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement kvm_arch_test_clear_young() to support the fast path in
mmu_notifier_ops->test_clear_young().

It focuses on a simple case, i.e., hardware sets the accessed bit in
KVM PTEs and VMs are not protected, where it can rely on RCU and
cmpxchg to safely clear the accessed bit without taking
kvm->mmu_lock. Complex cases fall back to the existing slow path
where kvm->mmu_lock is then taken.

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  6 ++++++
 arch/arm64/kvm/mmu.c              | 36 +++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7e7e19ef6993..da32b0890716 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1113,4 +1113,10 @@ static inline void kvm_hyp_reserve(void) { }
 void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu);
 bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu);
 
+#define kvm_arch_has_test_clear_young kvm_arch_has_test_clear_young
+static inline bool kvm_arch_has_test_clear_young(void)
+{
+	return cpu_has_hw_af() && !is_protected_kvm_enabled();
+}
+
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c3b3e2afe26f..26a8d955b49c 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1678,6 +1678,42 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 					   range->start << PAGE_SHIFT);
 }
 
+static int stage2_test_clear_young(const struct kvm_pgtable_visit_ctx *ctx,
+				   enum kvm_pgtable_walk_flags flags)
+{
+	kvm_pte_t new = ctx->old & ~KVM_PTE_LEAF_ATTR_LO_S2_AF;
+
+	VM_WARN_ON_ONCE(!page_count(virt_to_page(ctx->ptep)));
+
+	if (!kvm_pte_valid(new))
+		return 0;
+
+	if (new == ctx->old)
+		return 0;
+
+	if (kvm_should_clear_young(ctx->arg, ctx->addr / PAGE_SIZE))
+		stage2_try_set_pte(ctx, new);
+
+	return 0;
+}
+
+bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *range)
+{
+	u64 start = range->start * PAGE_SIZE;
+	u64 end = range->end * PAGE_SIZE;
+	struct kvm_pgtable_walker walker = {
+		.cb	= stage2_test_clear_young,
+		.arg	= range,
+		.flags	= KVM_PGTABLE_WALK_LEAF | KVM_PGTABLE_WALK_SHARED,
+	};
+
+	BUILD_BUG_ON(is_hyp_code());
+
+	kvm_pgtable_walk(kvm->arch.mmu.pgt, start, end - start, &walker);
+
+	return false;
+}
+
 phys_addr_t kvm_mmu_get_httbr(void)
 {
 	return __pa(hyp_pgtable->pgd);
-- 
2.41.0.rc0.172.g3f132b7071-goog

