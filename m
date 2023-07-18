Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6ED7589C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 01:57:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=IZaEPyOB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5G8p16WRz3c5N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 09:57:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=IZaEPyOB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=34cs3zaykddmhtpcyrvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Fyp6HSNz3bWj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 09:48:50 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1b8a44ee130so32271265ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 16:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724129; x=1692316129;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Fu4IZGb2U3Va9MKTtjfVBe1U+H33z+Vvz3vKzeN2toA=;
        b=IZaEPyOB4Xi+5QmwIHD8P7bc+aaX+suafWFmyT5uwQp3NUo61kUBrlISRhIplzjVEY
         uIBImmDPLupPxDXzTC/50r1tCCSeNlOhOVA9fS78zyP8h2biybmVrYzbOwK26JEGKHg7
         I6sJKMWknlDa2y4/RkUGMNcU33LK92gZhfmmSlvWmT3ZRUCpnDAoSRUYtWBJR6q/98qc
         7IYBfRSml8lO4T0/G64blb3o3A6eL3IHfZ2JdAaLZw/yFNgP47pFoelbwcMFEWdCuDgU
         rwttR7vXoy9ZQPZyTuXNE5j4H6jC+h7BIC2q5luL01pI3AyzFKBb/KLl+zHlx/O6BsOV
         E2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724129; x=1692316129;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fu4IZGb2U3Va9MKTtjfVBe1U+H33z+Vvz3vKzeN2toA=;
        b=EKq4Sk8aNqJOaW9hQdDsUGeWwBwHIL3aNkWueVOb+m674Hrs5VNRApj/qfuJEvDTOH
         GTDa4DIerR6c2Yv3sEh7NgBr3S4TpGW6YPQz7zGFbA+pgS/ww3MXTd0sNEqx9rNh6eKk
         R0hl0WsCQM6ST2EGAD2V5OmRD3zGBVcXAHAiTth+S7FDL5mbRlwppTMKWqYFB6ul/tEb
         JGVx4wEjFbLxYfIQdhqmNsRV64i/XLi3568HeXUy0UrsTEOfmhubXvguxujoVedPHX9F
         7TDe/bf24oh0EFNZJPfWhtzk982Xy1YA2VmEyvx32G3hL/TidIQJo02BpuJNZkacx3Dx
         7luQ==
X-Gm-Message-State: ABy/qLZ68ijq+opByWx7HguvT4LqKv+o1rKXOxeujWj3NPrYN9Gs5epd
	WrHcyubsz7g4pfKZHHmZbKtuANYaBOg=
X-Google-Smtp-Source: APBJJlHCRauC+c30Qnbz/xVE6cHMskqGKCbuMUu/5uTMRLvWSmi8GHs1UQtZYN/I3Q3rU07U5notqbe0Vyo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41ca:b0:1b8:a54c:61ef with SMTP id
 u10-20020a17090341ca00b001b8a54c61efmr8486ple.9.1689724128966; Tue, 18 Jul
 2023 16:48:48 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:44:52 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-10-seanjc@google.com>
Subject: [RFC PATCH v11 09/29] KVM: x86: Disallow hugepages when memory
 attributes are mixed
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

From: Chao Peng <chao.p.peng@linux.intel.com>

Disallow creating hugepages with mixed memory attributes, e.g. shared
versus private, as mapping a hugepage in this case would allow the guest
to access memory with the wrong attributes, e.g. overlaying private memory
with a shared hugepage.

Tracking whether or not attributes are mixed via the existing
disallow_lpage field, but use the most significant bit in 'disallow_lpage'
to indicate a hugepage has mixed attributes instead using the normal
refcounting.  Whether or not attributes are mixed is binary; either they
are or they aren't.  Attempting to squeeze that info into the refcount is
unnecessarily complex as it would require knowing the previous state of
the mixed count when updating attributes.  Using a flag means KVM just
needs to ensure the current status is reflected in the memslots.

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |   3 +
 arch/x86/kvm/mmu/mmu.c          | 185 +++++++++++++++++++++++++++++++-
 arch/x86/kvm/x86.c              |   4 +
 3 files changed, 190 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index f9a927296d85..b87ff7b601fa 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1816,6 +1816,9 @@ int kvm_mmu_create(struct kvm_vcpu *vcpu);
 int kvm_mmu_init_vm(struct kvm *kvm);
 void kvm_mmu_uninit_vm(struct kvm *kvm);
 
+void kvm_mmu_init_memslot_memory_attributes(struct kvm *kvm,
+					    struct kvm_memory_slot *slot);
+
 void kvm_mmu_after_set_cpuid(struct kvm_vcpu *vcpu);
 void kvm_mmu_reset_context(struct kvm_vcpu *vcpu);
 void kvm_mmu_slot_remove_write_access(struct kvm *kvm,
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index b034727c4cf9..aefe67185637 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -803,16 +803,27 @@ static struct kvm_lpage_info *lpage_info_slot(gfn_t gfn,
 	return &slot->arch.lpage_info[level - 2][idx];
 }
 
+/*
+ * The most significant bit in disallow_lpage tracks whether or not memory
+ * attributes are mixed, i.e. not identical for all gfns at the current level.
+ * The lower order bits are used to refcount other cases where a hugepage is
+ * disallowed, e.g. if KVM has shadow a page table at the gfn.
+ */
+#define KVM_LPAGE_MIXED_FLAG	BIT(31)
+
 static void update_gfn_disallow_lpage_count(const struct kvm_memory_slot *slot,
 					    gfn_t gfn, int count)
 {
 	struct kvm_lpage_info *linfo;
-	int i;
+	int old, i;
 
 	for (i = PG_LEVEL_2M; i <= KVM_MAX_HUGEPAGE_LEVEL; ++i) {
 		linfo = lpage_info_slot(gfn, slot, i);
+
+		old = linfo->disallow_lpage;
 		linfo->disallow_lpage += count;
-		WARN_ON(linfo->disallow_lpage < 0);
+
+		WARN_ON_ONCE((old ^ linfo->disallow_lpage) & KVM_LPAGE_MIXED_FLAG);
 	}
 }
 
@@ -7223,3 +7234,173 @@ void kvm_mmu_pre_destroy_vm(struct kvm *kvm)
 	if (kvm->arch.nx_huge_page_recovery_thread)
 		kthread_stop(kvm->arch.nx_huge_page_recovery_thread);
 }
+
+#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
+static bool hugepage_test_mixed(struct kvm_memory_slot *slot, gfn_t gfn,
+				int level)
+{
+	return lpage_info_slot(gfn, slot, level)->disallow_lpage & KVM_LPAGE_MIXED_FLAG;
+}
+
+static void hugepage_clear_mixed(struct kvm_memory_slot *slot, gfn_t gfn,
+				 int level)
+{
+	lpage_info_slot(gfn, slot, level)->disallow_lpage &= ~KVM_LPAGE_MIXED_FLAG;
+}
+
+static void hugepage_set_mixed(struct kvm_memory_slot *slot, gfn_t gfn,
+			       int level)
+{
+	lpage_info_slot(gfn, slot, level)->disallow_lpage |= KVM_LPAGE_MIXED_FLAG;
+}
+
+static bool range_has_attrs(struct kvm *kvm, gfn_t start, gfn_t end,
+			    unsigned long attrs)
+{
+	XA_STATE(xas, &kvm->mem_attr_array, start);
+	unsigned long index;
+	bool has_attrs;
+	void *entry;
+
+	rcu_read_lock();
+
+	if (!attrs) {
+		has_attrs = !xas_find(&xas, end);
+		goto out;
+	}
+
+	has_attrs = true;
+	for (index = start; index < end; index++) {
+		do {
+			entry = xas_next(&xas);
+		} while (xas_retry(&xas, entry));
+
+		if (xas.xa_index != index || xa_to_value(entry) != attrs) {
+			has_attrs = false;
+			break;
+		}
+	}
+
+out:
+	rcu_read_unlock();
+	return has_attrs;
+}
+
+static bool hugepage_has_attrs(struct kvm *kvm, struct kvm_memory_slot *slot,
+			       gfn_t gfn, int level, unsigned long attrs)
+{
+	const unsigned long start = gfn;
+	const unsigned long end = start + KVM_PAGES_PER_HPAGE(level);
+
+	if (level == PG_LEVEL_2M)
+		return range_has_attrs(kvm, start, end, attrs);
+
+	for (gfn = start; gfn < end; gfn += KVM_PAGES_PER_HPAGE(level - 1)) {
+		if (hugepage_test_mixed(slot, gfn, level - 1) ||
+		    attrs != kvm_get_memory_attributes(kvm, gfn))
+			return false;
+	}
+	return true;
+}
+
+bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
+					 struct kvm_gfn_range *range)
+{
+	unsigned long attrs = range->arg.attributes;
+	struct kvm_memory_slot *slot = range->slot;
+	int level;
+
+	lockdep_assert_held_write(&kvm->mmu_lock);
+	lockdep_assert_held(&kvm->slots_lock);
+
+	/*
+	 * KVM x86 currently only supports KVM_MEMORY_ATTRIBUTE_PRIVATE, skip
+	 * the slot if the slot will never consume the PRIVATE attribute.
+	 */
+	if (!kvm_slot_can_be_private(slot))
+		return false;
+
+	/*
+	 * The sequence matters here: upper levels consume the result of lower
+	 * level's scanning.
+	 */
+	for (level = PG_LEVEL_2M; level <= KVM_MAX_HUGEPAGE_LEVEL; level++) {
+		gfn_t nr_pages = KVM_PAGES_PER_HPAGE(level);
+		gfn_t gfn = gfn_round_for_level(range->start, level);
+
+		/* Process the head page if it straddles the range. */
+		if (gfn != range->start || gfn + nr_pages > range->end) {
+			/*
+			 * Skip mixed tracking if the aligned gfn isn't covered
+			 * by the memslot, KVM can't use a hugepage due to the
+			 * misaligned address regardless of memory attributes.
+			 */
+			if (gfn >= slot->base_gfn) {
+				if (hugepage_has_attrs(kvm, slot, gfn, level, attrs))
+					hugepage_clear_mixed(slot, gfn, level);
+				else
+					hugepage_set_mixed(slot, gfn, level);
+			}
+			gfn += nr_pages;
+		}
+
+		/*
+		 * Pages entirely covered by the range are guaranteed to have
+		 * only the attributes which were just set.
+		 */
+		for ( ; gfn + nr_pages <= range->end; gfn += nr_pages)
+			hugepage_clear_mixed(slot, gfn, level);
+
+		/*
+		 * Process the last tail page if it straddles the range and is
+		 * contained by the memslot.  Like the head page, KVM can't
+		 * create a hugepage if the slot size is misaligned.
+		 */
+		if (gfn < range->end &&
+		    (gfn + nr_pages) <= (slot->base_gfn + slot->npages)) {
+			if (hugepage_has_attrs(kvm, slot, gfn, level, attrs))
+				hugepage_clear_mixed(slot, gfn, level);
+			else
+				hugepage_set_mixed(slot, gfn, level);
+		}
+	}
+	return false;
+}
+
+void kvm_mmu_init_memslot_memory_attributes(struct kvm *kvm,
+					    struct kvm_memory_slot *slot)
+{
+	int level;
+
+	if (!kvm_slot_can_be_private(slot))
+		return;
+
+	for (level = PG_LEVEL_2M; level <= KVM_MAX_HUGEPAGE_LEVEL; level++) {
+		/*
+		 * Don't bother tracking mixed attributes for pages that can't
+		 * be huge due to alignment, i.e. process only pages that are
+		 * entirely contained by the memslot.
+		 */
+		gfn_t end = gfn_round_for_level(slot->base_gfn + slot->npages, level);
+		gfn_t start = gfn_round_for_level(slot->base_gfn, level);
+		gfn_t nr_pages = KVM_PAGES_PER_HPAGE(level);
+		gfn_t gfn;
+
+		if (start < slot->base_gfn)
+			start += nr_pages;
+
+		/*
+		 * Unlike setting attributes, every potential hugepage needs to
+		 * be manually checked as the attributes may already be mixed.
+		 */
+		for (gfn = start; gfn < end; gfn += nr_pages) {
+			unsigned long attrs = kvm_get_memory_attributes(kvm, gfn);
+
+			if (hugepage_has_attrs(kvm, slot, gfn, level, attrs))
+				hugepage_clear_mixed(slot, gfn, level);
+			else
+				hugepage_set_mixed(slot, gfn, level);
+		}
+	}
+}
+#endif
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 92e77afd3ffd..dd7cefe78815 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12570,6 +12570,10 @@ static int kvm_alloc_memslot_metadata(struct kvm *kvm,
 		}
 	}
 
+#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
+	kvm_mmu_init_memslot_memory_attributes(kvm, slot);
+#endif
+
 	if (kvm_page_track_create_memslot(kvm, slot, npages))
 		goto out_free;
 
-- 
2.41.0.255.g8b1d071c50-goog

