Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6155279F7BB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 04:12:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zhtCnlUA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmLSQ27R5z3fXL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 12:12:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zhtCnlUA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3owgczqykdeiwierngksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmL5R62Qwz3c6c
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 11:56:11 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-594e5e2e608so6332937b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 18:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656570; x=1695261370; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hXg+c13z5FpxpMh0dTDS8MDb5ldwgANdA63niVsOR7o=;
        b=zhtCnlUA+ncnP2k7csSeR96DIKoOnf4wmWnOeu9finJUQJT1DVv+gD4GftJ1/8WX4F
         tk3r3Uj8tSoUZ45qI6NJCt2/kTc4IvL68lYXu91uij+iJMKWsIDdYc/sQpsLPXRV1HRV
         ZECjVeAJWNFuCj2BTZVAX8RaLqxxeNsBSn1i7H9PMqwdP2oPkoM5nxuhIPhR4QFa4X6x
         lQP48B+iAkfpAQz35h+qiaYAa0X/SLLa2nQj5npSGk46VIcoP50r7C6U2wCcwphLRi/a
         Pk33aOUIR4R4ghw+oc4HrmvOs+bHYTaKKq9XuPfCu3ENPptMupFgbFPcNGL+aa7tfTq+
         zI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656570; x=1695261370;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXg+c13z5FpxpMh0dTDS8MDb5ldwgANdA63niVsOR7o=;
        b=qUilOGCv9EkWIoOoLB7g2euMNi7xRS+HSMgnDj+jUr+VYTu4pMSXENVgecxRJ4Vjjp
         4I0FlBmhIUoIXttOaFck766IX3XXxomel4PVYYojWcKDMlcxusOxTaslPV/gjYVmiK1O
         Gd6WIt/H1yv11bv17ZeeiyaDZMDLhVL9hEzGDG0QZ2yVZDuT7THSLowKhMM0IZqAX5kd
         vaoy61pqveAKOJzO4ZoiUzYx79Va5kF5w86BRqvQy0vitEXwpriibLfwennwj09SDsiA
         oFEiCVMreFpsasmDWL86sdQyW7OvdLYN2Mm3+S90iToyb3SXhTjIxdZoEqcxZN9l8ECq
         g09A==
X-Gm-Message-State: AOJu0YxvR62k5KSk6eO2qd/qk5NezIx8usevjyI4kv8qrsP6duoGyP1+
	uU1rtxFDIzU5k8PHtcy+t4IGSW5olWA=
X-Google-Smtp-Source: AGHT+IHPiLkfoLFlIeGbzzjp2cxBfgGGv6hvIzEJvebBRPzJegHp6YgbGy/UCdWVr8MsxooaabenVz16PQA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:72a:b0:59b:b8bf:5973 with SMTP id
 bt10-20020a05690c072a00b0059bb8bf5973mr115588ywb.0.1694656569799; Wed, 13 Sep
 2023 18:56:09 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:15 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-18-seanjc@google.com>
Subject: [RFC PATCH v12 17/33] KVM: x86: Disallow hugepages when memory
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Ani
 sh Moorthy <amoorthy@google.com>
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
 arch/x86/kvm/mmu/mmu.c          | 152 +++++++++++++++++++++++++++++++-
 arch/x86/kvm/x86.c              |   4 +
 3 files changed, 157 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 3a2b53483524..91a28ddf7cfd 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1838,6 +1838,9 @@ int kvm_mmu_create(struct kvm_vcpu *vcpu);
 int kvm_mmu_init_vm(struct kvm *kvm);
 void kvm_mmu_uninit_vm(struct kvm *kvm);
 
+void kvm_mmu_init_memslot_memory_attributes(struct kvm *kvm,
+					    struct kvm_memory_slot *slot);
+
 void kvm_mmu_after_set_cpuid(struct kvm_vcpu *vcpu);
 void kvm_mmu_reset_context(struct kvm_vcpu *vcpu);
 void kvm_mmu_slot_remove_write_access(struct kvm *kvm,
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 0f0231d2b74f..a079f36a8bf5 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -795,16 +795,26 @@ static struct kvm_lpage_info *lpage_info_slot(gfn_t gfn,
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
-		WARN_ON_ONCE(linfo->disallow_lpage < 0);
+		WARN_ON_ONCE((old ^ linfo->disallow_lpage) & KVM_LPAGE_MIXED_FLAG);
 	}
 }
 
@@ -7172,3 +7182,141 @@ void kvm_mmu_pre_destroy_vm(struct kvm *kvm)
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
+static bool hugepage_has_attrs(struct kvm *kvm, struct kvm_memory_slot *slot,
+			       gfn_t gfn, int level, unsigned long attrs)
+{
+	const unsigned long start = gfn;
+	const unsigned long end = start + KVM_PAGES_PER_HPAGE(level);
+
+	if (level == PG_LEVEL_2M)
+		return kvm_range_has_memory_attributes(kvm, start, end, attrs);
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
index 8d21b7b09bb5..ac36a5b7b5a3 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12598,6 +12598,10 @@ static int kvm_alloc_memslot_metadata(struct kvm *kvm,
 		}
 	}
 
+#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
+	kvm_mmu_init_memslot_memory_attributes(kvm, slot);
+#endif
+
 	if (kvm_page_track_create_memslot(kvm, slot, npages))
 		goto out_free;
 
-- 
2.42.0.283.g2d96d420d3-goog

