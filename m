Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B7B7130B0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 01:53:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QShZ61Tpsz3fHs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 09:53:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=yrD5cypj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--yuzhao.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3d0rxzaykdo4okpxqeweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--yuzhao.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=yrD5cypj;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QShNn37k3z3fF8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 09:44:57 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-bad06cc7fb7so2973483276.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 16:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685144695; x=1687736695;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M3AF7fBmc1xnJAMOiZdfCsfXZHiS6oPk41ReBM4zbdo=;
        b=yrD5cypjwj76oGySeMKoL+EObdL+VlHBR0ZE4dlUQxoYbTEWiiVpSKdOJmkcaaiF/Z
         4zilNg4E7S1qiA0OC/fMHUKvaq4lLe3h3XrcfBRajVZEzuTWsMjYGvjMBJ/wRyLbmfd/
         x0p59R3lRKLAmUF0+sTBQhD8rRciT1hrCi2rbco+ObNSFPCgz7YI6gzDi295X90OlgMM
         zrJNip6i/8aKO3FHb/HgogYFOfPOgx60+DOedoHxymQQDAPdmrus+K28IPt1M7E0g0cI
         asbBmGj30I6PgAgE5VquUWTvHUX2/5VYaFLlsw0xBC7qUsoM7lDeTwedn+JU6nSVVIPC
         w2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685144695; x=1687736695;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M3AF7fBmc1xnJAMOiZdfCsfXZHiS6oPk41ReBM4zbdo=;
        b=ggSuEgZYg1AKL8ng/h6afZs0fsHvFUDuo9dT3BZTDbmeKlmW2zi5Sd3fRenhRc8VCw
         8Mj6unnG4NGvLhyN1XJzIzc1XnBmDe+a5FyQpwFKsZGSzJDRPJxsOq7nvlddsoEu3+PG
         cayugVwd6j+AN0vPOt70Q9CDAvZbQs4B/GFbWZv9QIs5s/RYfuUjxR9j/4UQPw4RITuN
         Z8zdt5V4CT9sVaVV1qttPchF22iyHCLHJALUxa8c0nUNRM6Iwm006/+naegwAIukAx4y
         5TZRF0hW6dKmSIL8V24IImH1RdMSW9qishvzdZxIjgLFPHvjz7LpqkwRqdTjxBxlecwT
         oJlw==
X-Gm-Message-State: AC+VfDypeMboP9YLixIqdpihjJrJxRdTK+nDaObAnonjZp6SpE24x0oU
	xPhGwNmNqL0xYuAifrasoJrQnVJ7AFc=
X-Google-Smtp-Source: ACHHUZ4QgTvrucO0Q6McE6sU/ZYyF1Ujw9/eAceyjgq3u2aouYR16g/56Sc2t/zSHX7sxuPwIu+K0d0WjYg=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:910f:8a15:592b:2087])
 (user=yuzhao job=sendgmr) by 2002:a05:6902:1341:b0:bac:6bb:2549 with SMTP id
 g1-20020a056902134100b00bac06bb2549mr1840571ybu.7.1685144695170; Fri, 26 May
 2023 16:44:55 -0700 (PDT)
Date: Fri, 26 May 2023 17:44:34 -0600
In-Reply-To: <20230526234435.662652-1-yuzhao@google.com>
Message-Id: <20230526234435.662652-10-yuzhao@google.com>
Mime-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Subject: [PATCH mm-unstable v2 09/10] kvm/x86: add kvm_arch_test_clear_young()
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

It focuses on a simple case, i.e., TDP MMU sets the accessed bit in
KVM PTEs and VMs are not nested, where it can rely on RCU and
clear_bit() to safely clear the accessed bit without taking
kvm->mmu_lock. Complex cases fall back to the existing slow path
where kvm->mmu_lock is then taken.

Signed-off-by: Yu Zhao <yuzhao@google.com>
---
 arch/x86/include/asm/kvm_host.h |  7 +++++++
 arch/x86/kvm/mmu/tdp_mmu.c      | 34 +++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 753c67072c47..d6dfdebe3d94 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2223,4 +2223,11 @@ int memslot_rmap_alloc(struct kvm_memory_slot *slot, unsigned long npages);
  */
 #define KVM_EXIT_HYPERCALL_MBZ		GENMASK_ULL(31, 1)
 
+#define kvm_arch_has_test_clear_young kvm_arch_has_test_clear_young
+static inline bool kvm_arch_has_test_clear_young(void)
+{
+	return IS_ENABLED(CONFIG_X86_64) &&
+	       (!IS_REACHABLE(CONFIG_KVM) || (tdp_mmu_enabled && shadow_accessed_mask));
+}
+
 #endif /* _ASM_X86_KVM_HOST_H */
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 08340219c35a..6875a819e007 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1232,6 +1232,40 @@ bool kvm_tdp_mmu_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	return kvm_tdp_mmu_handle_gfn(kvm, range, test_age_gfn);
 }
 
+bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *range)
+{
+	struct kvm_mmu_page *root;
+	int offset = ffs(shadow_accessed_mask) - 1;
+
+	if (kvm_shadow_root_allocated(kvm))
+		return true;
+
+	rcu_read_lock();
+
+	list_for_each_entry_rcu(root, &kvm->arch.tdp_mmu_roots, link) {
+		struct tdp_iter iter;
+
+		if (kvm_mmu_page_as_id(root) != range->slot->as_id)
+			continue;
+
+		tdp_root_for_each_leaf_pte(iter, root, range->start, range->end) {
+			u64 *sptep = rcu_dereference(iter.sptep);
+
+			VM_WARN_ON_ONCE(!page_count(virt_to_page(sptep)));
+
+			if (!(iter.old_spte & shadow_accessed_mask))
+				continue;
+
+			if (kvm_should_clear_young(range, iter.gfn))
+				clear_bit(offset, (unsigned long *)sptep);
+		}
+	}
+
+	rcu_read_unlock();
+
+	return false;
+}
+
 static bool set_spte_gfn(struct kvm *kvm, struct tdp_iter *iter,
 			 struct kvm_gfn_range *range)
 {
-- 
2.41.0.rc0.172.g3f132b7071-goog

