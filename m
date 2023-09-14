Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9B879F780
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 04:03:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TakjM6Fg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmLFk55BPz3dks
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 12:03:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=TakjM6Fg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3kggczqykddefrnawptbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmL563Sgrz3bXm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 11:55:54 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d8185415dfbso535232276.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 18:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656552; x=1695261352; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=c0gbqnW9KUovCg+coU7ldlYhYVFXBRbmaH2jYlXJSe8=;
        b=TakjM6Fg5aiBsySvVH6EcJUgX7bxDMfw5e3b+UhGq3zdAHAIxTgXhhLSV0Nege8clC
         CflNVFUDZ3fWMpPCMuou8Pp2wn4Zv1U52L+kx64rZ4WxU93qWxmY7YRE/QRYj/2nz+Zi
         eHWzBV1IQQVgyDTqKisuCOXKFTXdZvWlkwxnIdGBMcEOoDsQdsmGGLA1MgXjofYiI9/e
         gO8wRImNsdhJdJDJZT/A3rxE5y4oTOb+NjHNhO3RF8f8Xu8k6ZImPpNNmwFpsRSsaFpH
         feWtaqvou7HFAEXj65Zhz4APzO192CjHlxFS/8tWShWz7LTZshC66H4BdvhYDzJQC/40
         uqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656552; x=1695261352;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0gbqnW9KUovCg+coU7ldlYhYVFXBRbmaH2jYlXJSe8=;
        b=tXHXs//vsCDGPQtHdMOYR6b6bTMYgv8QHt6YlGKBuyPdMYRZXSeARUEmgBSJMBAFdS
         aXiCXpFdwIq1wM+4fXOqZAs/gpKY/lgqdRBD2eBWXT2tcyIBETbBISvSl4jje/nkR4HP
         7BznbmZD9Ue0Y5L/TOcupoWtombVa9/IxToHjH0jEZoXt+GaSc8VTPaV8JIs+BrQ3ctE
         8g5m9T8XDHRHf/QPeQ9qUxwTnVY5SYHxOfIo9PmJSp6C5jrrpef4ooJmKyMDI8WDGCYm
         Onbp36Mgas0vEvNQh3ffzhv9NxDj3EMLsfwigWwbIy1j0M5Fyd3yJMG8nvvA3vM7m4+y
         zKvg==
X-Gm-Message-State: AOJu0Yw3aakMPmz5sHxrYjS6fKJM6Am9h13LtKr77EUrAA4FhuVG0/X/
	QHX27//HrNndMyb87536FUEHyRqMozc=
X-Google-Smtp-Source: AGHT+IG9pkaa+NfBfBN3tv0PMD61sScfAedWpdRl9BNgXYxxGW/3XiB249I/ScBV6f/2zKuHHJhj18tIK2Y=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:83d0:0:b0:d78:3c2e:b186 with SMTP id
 v16-20020a2583d0000000b00d783c2eb186mr79839ybm.5.1694656552108; Wed, 13 Sep
 2023 18:55:52 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:06 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-9-seanjc@google.com>
Subject: [RFC PATCH v12 08/33] KVM: Add a dedicated mmu_notifier flag for
 reclaiming freed memory
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

Handle AMD SEV's kvm_arch_guest_memory_reclaimed() hook by having
__kvm_handle_hva_range() return whether or not an overlapping memslot
was found, i.e. mmu_lock was acquired.  Using the .on_unlock() hook
works, but kvm_arch_guest_memory_reclaimed() needs to run after dropping
mmu_lock, which makes .on_lock() and .on_unlock() asymmetrical.

Use a small struct to return the tuple of the notifier-specific return,
plus whether or not overlap was found.  Because the iteration helpers are
__always_inlined, practically speaking, the struct will never actually be
returned from a function call (not to mention the size of the struct will
be two bytes in practice).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 53 +++++++++++++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 16 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 7c0e38752526..76d01de7838f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -561,6 +561,19 @@ struct kvm_mmu_notifier_range {
 	bool may_block;
 };
 
+/*
+ * The inner-most helper returns a tuple containing the return value from the
+ * arch- and action-specific handler, plus a flag indicating whether or not at
+ * least one memslot was found, i.e. if the handler found guest memory.
+ *
+ * Note, most notifiers are averse to booleans, so even though KVM tracks the
+ * return from arch code as a bool, outer helpers will cast it to an int. :-(
+ */
+typedef struct kvm_mmu_notifier_return {
+	bool ret;
+	bool found_memslot;
+} kvm_mn_ret_t;
+
 /*
  * Use a dedicated stub instead of NULL to indicate that there is no callback
  * function/handler.  The compiler technically can't guarantee that a real
@@ -582,22 +595,25 @@ static const union kvm_mmu_notifier_arg KVM_MMU_NOTIFIER_NO_ARG;
 	     node;							     \
 	     node = interval_tree_iter_next(node, start, last))	     \
 
-static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
-						  const struct kvm_mmu_notifier_range *range)
+static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
+							   const struct kvm_mmu_notifier_range *range)
 {
-	bool ret = false, locked = false;
+	struct kvm_mmu_notifier_return r = {
+		.ret = false,
+		.found_memslot = false,
+	};
 	struct kvm_gfn_range gfn_range;
 	struct kvm_memory_slot *slot;
 	struct kvm_memslots *slots;
 	int i, idx;
 
 	if (WARN_ON_ONCE(range->end <= range->start))
-		return 0;
+		return r;
 
 	/* A null handler is allowed if and only if on_lock() is provided. */
 	if (WARN_ON_ONCE(IS_KVM_NULL_FN(range->on_lock) &&
 			 IS_KVM_NULL_FN(range->handler)))
-		return 0;
+		return r;
 
 	idx = srcu_read_lock(&kvm->srcu);
 
@@ -631,8 +647,8 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 			gfn_range.end = hva_to_gfn_memslot(hva_end + PAGE_SIZE - 1, slot);
 			gfn_range.slot = slot;
 
-			if (!locked) {
-				locked = true;
+			if (!r.found_memslot) {
+				r.found_memslot = true;
 				KVM_MMU_LOCK(kvm);
 				if (!IS_KVM_NULL_FN(range->on_lock))
 					range->on_lock(kvm);
@@ -640,14 +656,14 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 				if (IS_KVM_NULL_FN(range->handler))
 					break;
 			}
-			ret |= range->handler(kvm, &gfn_range);
+			r.ret |= range->handler(kvm, &gfn_range);
 		}
 	}
 
-	if (range->flush_on_ret && ret)
+	if (range->flush_on_ret && r.ret)
 		kvm_flush_remote_tlbs(kvm);
 
-	if (locked) {
+	if (r.found_memslot) {
 		KVM_MMU_UNLOCK(kvm);
 		if (!IS_KVM_NULL_FN(range->on_unlock))
 			range->on_unlock(kvm);
@@ -655,8 +671,7 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 
 	srcu_read_unlock(&kvm->srcu, idx);
 
-	/* The notifiers are averse to booleans. :-( */
-	return (int)ret;
+	return r;
 }
 
 static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
@@ -677,7 +692,7 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 		.may_block	= false,
 	};
 
-	return __kvm_handle_hva_range(kvm, &range);
+	return __kvm_handle_hva_range(kvm, &range).ret;
 }
 
 static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn,
@@ -696,7 +711,7 @@ static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn
 		.may_block	= false,
 	};
 
-	return __kvm_handle_hva_range(kvm, &range);
+	return __kvm_handle_hva_range(kvm, &range).ret;
 }
 
 static bool kvm_change_spte_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
@@ -796,7 +811,7 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 		.end		= range->end,
 		.handler	= kvm_mmu_unmap_gfn_range,
 		.on_lock	= kvm_mmu_invalidate_begin,
-		.on_unlock	= kvm_arch_guest_memory_reclaimed,
+		.on_unlock	= (void *)kvm_null_fn,
 		.flush_on_ret	= true,
 		.may_block	= mmu_notifier_range_blockable(range),
 	};
@@ -828,7 +843,13 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 	gfn_to_pfn_cache_invalidate_start(kvm, range->start, range->end,
 					  hva_range.may_block);
 
-	__kvm_handle_hva_range(kvm, &hva_range);
+	/*
+	 * If one or more memslots were found and thus zapped, notify arch code
+	 * that guest memory has been reclaimed.  This needs to be done *after*
+	 * dropping mmu_lock, as x86's reclaim path is slooooow.
+	 */
+	if (__kvm_handle_hva_range(kvm, &hva_range).found_memslot)
+		kvm_arch_guest_memory_reclaimed(kvm);
 
 	return 0;
 }
-- 
2.42.0.283.g2d96d420d3-goog

