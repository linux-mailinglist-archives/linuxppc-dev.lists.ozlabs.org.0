Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F7C93DB74
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 01:58:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jx5br4N3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4Tg0499z3fnN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 09:58:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=jx5br4N3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=31takzgykdba8uq3zsw44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4Lv58Zsz3dT4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:52:55 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-65b985bb059so7660337b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037974; x=1722642774; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Dpyi/TQvAabfHqvBiXmrWwwqtiSCC0ukXFLvczoDhHE=;
        b=jx5br4N3GnEk9vDL9d+Hdwo9nRiqTZXGZ1BtCjfS9Yw0Za8MdxtYqewwcmEiGNnP4Q
         R9QHpJMEJqrYcDkUxneSa28Fc13HJFxeH6uLcp1cdC69Ms1mC41TlRIhA/8E4Or7g6D8
         Y4pu+KZZVHF7paJ3RL2txYLPo1k/Kz2D9FOyMd5SH1jqPaiS4TEo6v4s0+5iL/Zvi1M5
         2FZyA1b8l+nRX6NuwuznULP8AR0w4Pieo3PFAq6q1KD/6ieHw0lHUrO0tSrAqXNUxo6L
         AoPPhH44b2WbVvkh73eclDIHrWNfPkNCSl9kgC6k9zww8+F1nJZ1D/tSovhutzKqGdp4
         /Xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037974; x=1722642774;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dpyi/TQvAabfHqvBiXmrWwwqtiSCC0ukXFLvczoDhHE=;
        b=JoRKfyC6J3BWZrZsBu/Brw2wLiuH/21pSUPQuonlla+Heh502RNCD5o/glqtzTV0h2
         qxLL4wrTJQ8JpE+WqQBpMZxAcEjVMQUrvuUV7R3WEB2jxKWrcowP9mmCe2juxsBNlJry
         4eHFWNYUzqWjYzZ77Ne+9Q3q52rWzuqa4yRSGMH82ndPmwKChi6jpRpYS3M/PTD4Jcti
         llxq4B3ZIh1EvEe+DCLM0w/U/gP7P9ZzbmcL4d9juTssBX7UFyf4wG3W3JDgJ/rxnj8p
         tyfhMWBK4GZg5KbghFg7heFrGZI44HcuYJkPswAmLXKDbC22S63ZccHO1X2H+dftrNY3
         fQnw==
X-Forwarded-Encrypted: i=1; AJvYcCXoTd8sNgAkMmtvIUzc21lKFNkeilzT1eusf1TqiFqNnbnEQ7yKsgTPS42ZObvu53DC3rTNIzP4lUut0xBB/BiAB+rkenHamgPncKlEAg==
X-Gm-Message-State: AOJu0YysJTc9rkT5SiKD/0rLIMAe8sLCwKI8H1JT1GZRIwD8HM49ZXpB
	4KDfWgQbU3UfDZ2TjQoMDEyk5M0n3UOu+QGEw4nKtemjwKsZ8iQGsepZiNf03s9wwP2eyfNGZnK
	YRA==
X-Google-Smtp-Source: AGHT+IEuz+UKgzDWJGr0lPjm3UdUlqhv4uVGAVLwalCQIXTZVrMJ3vp7bbZbHMGkSPe0yP2xueKpOueyV+8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:f07:b0:64a:e220:bfb5 with SMTP id
 00721157ae682-67a051e9c33mr504237b3.1.1722037973756; Fri, 26 Jul 2024
 16:52:53 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:17 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-9-seanjc@google.com>
Subject: [PATCH v12 08/84] KVM: x86/mmu: Mark page/folio accessed only when
 zapping leaf SPTEs
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

Mark folios as accessed only when zapping leaf SPTEs, which is a rough
heuristic for "only in response to an mmu_notifier invalidation".  Page
aging and LRUs are tolerant of false negatives, i.e. KVM doesn't need to
be precise for correctness, and re-marking folios as accessed when zapping
entire roots or when zapping collapsible SPTEs is expensive and adds very
little value.

E.g. when a VM is dying, all of its memory is being freed; marking folios
accessed at that time provides no known value.  Similarly, because KVM
marks folios as accessed when creating SPTEs, marking all folios as
accessed when userspace happens to delete a memslot doesn't add value.
The folio was marked access when the old SPTE was created, and will be
marked accessed yet again if a vCPU accesses the pfn again after reloading
a new root.  Zapping collapsible SPTEs is a similar story; marking folios
accessed just because userspace disable dirty logging is a side effect of
KVM behavior, not a deliberate goal.

As an intermediate step, a.k.a. bisection point, towards *never* marking
folios accessed when dropping SPTEs, mark folios accessed when the primary
MMU might be invalidating mappings, as such zappings are not KVM initiated,
i.e. might actually be related to page aging and LRU activity.

Note, x86 is the only KVM architecture that "double dips"; every other
arch marks pfns as accessed only when mapping into the guest, not when
mapping into the guest _and_ when removing from the guest.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/locking.rst | 76 +++++++++++++++---------------
 arch/x86/kvm/mmu/mmu.c             |  4 +-
 arch/x86/kvm/mmu/tdp_mmu.c         |  7 ++-
 3 files changed, 43 insertions(+), 44 deletions(-)

diff --git a/Documentation/virt/kvm/locking.rst b/Documentation/virt/kvm/locking.rst
index 02880d5552d5..8b3bb9fe60bf 100644
--- a/Documentation/virt/kvm/locking.rst
+++ b/Documentation/virt/kvm/locking.rst
@@ -138,49 +138,51 @@ Then, we can ensure the dirty bitmaps is correctly set for a gfn.
 
 2) Dirty bit tracking
 
-In the origin code, the spte can be fast updated (non-atomically) if the
+In the original code, the spte can be fast updated (non-atomically) if the
 spte is read-only and the Accessed bit has already been set since the
 Accessed bit and Dirty bit can not be lost.
 
 But it is not true after fast page fault since the spte can be marked
 writable between reading spte and updating spte. Like below case:
 
-+------------------------------------------------------------------------+
-| At the beginning::                                                     |
-|                                                                        |
-|	spte.W = 0                                                       |
-|	spte.Accessed = 1                                                |
-+------------------------------------+-----------------------------------+
-| CPU 0:                             | CPU 1:                            |
-+------------------------------------+-----------------------------------+
-| In mmu_spte_clear_track_bits()::   |                                   |
-|                                    |                                   |
-|  old_spte = *spte;                 |                                   |
-|                                    |                                   |
-|                                    |                                   |
-|  /* 'if' condition is satisfied. */|                                   |
-|  if (old_spte.Accessed == 1 &&     |                                   |
-|       old_spte.W == 0)             |                                   |
-|     spte = 0ull;                   |                                   |
-+------------------------------------+-----------------------------------+
-|                                    | on fast page fault path::         |
-|                                    |                                   |
-|                                    |    spte.W = 1                     |
-|                                    |                                   |
-|                                    | memory write on the spte::        |
-|                                    |                                   |
-|                                    |    spte.Dirty = 1                 |
-+------------------------------------+-----------------------------------+
-|  ::                                |                                   |
-|                                    |                                   |
-|   else                             |                                   |
-|     old_spte = xchg(spte, 0ull)    |                                   |
-|   if (old_spte.Accessed == 1)      |                                   |
-|     kvm_set_pfn_accessed(spte.pfn);|                                   |
-|   if (old_spte.Dirty == 1)         |                                   |
-|     kvm_set_pfn_dirty(spte.pfn);   |                                   |
-|     OOPS!!!                        |                                   |
-+------------------------------------+-----------------------------------+
++-------------------------------------------------------------------------+
+| At the beginning::                                                      |
+|                                                                         |
+|	spte.W = 0                                                              |
+|	spte.Accessed = 1                                                       |
++-------------------------------------+-----------------------------------+
+| CPU 0:                              | CPU 1:                            |
++-------------------------------------+-----------------------------------+
+| In mmu_spte_update()::              |                                   |
+|                                     |                                   |
+|  old_spte = *spte;                  |                                   |
+|                                     |                                   |
+|                                     |                                   |
+|  /* 'if' condition is satisfied. */ |                                   |
+|  if (old_spte.Accessed == 1 &&      |                                   |
+|       old_spte.W == 0)              |                                   |
+|     spte = new_spte;                |                                   |
++-------------------------------------+-----------------------------------+
+|                                     | on fast page fault path::         |
+|                                     |                                   |
+|                                     |    spte.W = 1                     |
+|                                     |                                   |
+|                                     | memory write on the spte::        |
+|                                     |                                   |
+|                                     |    spte.Dirty = 1                 |
++-------------------------------------+-----------------------------------+
+|  ::                                 |                                   |
+|                                     |                                   |
+|   else                              |                                   |
+|     old_spte = xchg(spte, new_spte);|                                   |
+|   if (old_spte.Accessed &&          |                                   |
+|       !new_spte.Accessed)           |                                   |
+|     flush = true;                   |                                   |
+|   if (old_spte.Dirty &&             |                                   |
+|       !new_spte.Dirty)              |                                   |
+|     flush = true;                   |                                   |
+|     OOPS!!!                         |                                   |
++-------------------------------------+-----------------------------------+
 
 The Dirty bit is lost in this case.
 
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 2e6daa6d1cc0..58b70328b20c 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -542,10 +542,8 @@ static bool mmu_spte_update(u64 *sptep, u64 new_spte)
 	 * to guarantee consistency between TLB and page tables.
 	 */
 
-	if (is_accessed_spte(old_spte) && !is_accessed_spte(new_spte)) {
+	if (is_accessed_spte(old_spte) && !is_accessed_spte(new_spte))
 		flush = true;
-		kvm_set_pfn_accessed(spte_to_pfn(old_spte));
-	}
 
 	if (is_dirty_spte(old_spte) && !is_dirty_spte(new_spte))
 		flush = true;
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 7ac43d1ce918..d1de5f28c445 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -520,10 +520,6 @@ static void handle_changed_spte(struct kvm *kvm, int as_id, gfn_t gfn,
 	if (was_present && !was_leaf &&
 	    (is_leaf || !is_present || WARN_ON_ONCE(pfn_changed)))
 		handle_removed_pt(kvm, spte_to_child_pt(old_spte, level), shared);
-
-	if (was_leaf && is_accessed_spte(old_spte) &&
-	    (!is_present || !is_accessed_spte(new_spte) || pfn_changed))
-		kvm_set_pfn_accessed(spte_to_pfn(old_spte));
 }
 
 static inline int __must_check __tdp_mmu_set_spte_atomic(struct tdp_iter *iter,
@@ -865,6 +861,9 @@ static bool tdp_mmu_zap_leafs(struct kvm *kvm, struct kvm_mmu_page *root,
 
 		tdp_mmu_iter_set_spte(kvm, &iter, SHADOW_NONPRESENT_VALUE);
 
+		if (is_accessed_spte(iter.old_spte))
+			kvm_set_pfn_accessed(spte_to_pfn(iter.old_spte));
+
 		/*
 		 * Zappings SPTEs in invalid roots doesn't require a TLB flush,
 		 * see kvm_tdp_mmu_zap_invalidated_roots() for details.
-- 
2.46.0.rc1.232.g9752f9e123-goog

