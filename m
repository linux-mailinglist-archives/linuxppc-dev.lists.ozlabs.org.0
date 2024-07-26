Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DD593DB8A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:00:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zYpjRb4E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4X36NWhz3fpm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:00:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=zYpjRb4E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=32zakzgykdbye0w95y2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4M131x2z3dSG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:53:01 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fc58790766so11052065ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037980; x=1722642780; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OCfqpOOOZn7LpwpHWWHUZjndC9uE6mObDYxnDRBBpAY=;
        b=zYpjRb4ETVJLf0OkJMKEWR5eClFnLtKDuDFIT2V7fmHn2VVImDaSTQ/I34buvkAbBh
         rmmofkPTrV0ieCTfA5JuWMD4C1NRi8T2wtifCic93URwWSgYcdxaFzTEgzNBW389qazl
         AH99y8bl65kjkL74ylWaDScfpqiobSt3chtPeLdFt5zyVYZgMoPoekHQr0CQay4m2Yys
         /VX+ZbXKK9EVy16lFagWFDZBpE4z9U+hRmXCFBcUgJdZS5SYIzlokMRTyxn9H6MXLrCP
         kETcgtOzc0JtjSqNILd04X/jGFbCukgv+1MVLWeGX4p9YniazpghZhf/RRFYvEwv0Ycx
         Zk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037980; x=1722642780;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCfqpOOOZn7LpwpHWWHUZjndC9uE6mObDYxnDRBBpAY=;
        b=dPQDMxqewvdCKxlc4tpEYwv53D1ZYylVdHJi2NdE5xtBwD1TqCaCIWIeyo9NZi/XtB
         pSjd1C93e3aoPmGgLPEVNNnR2t8H3Dqkl7iQQr+STibQkqw3PxTXolvssC/bVHCQdmgI
         zDnFykA0ppDIuFTyEdTBBAtil1W+be7UqyslPn1atI7o5Ck+Mtjc8v8neYZ/aemm60PE
         1puC02er9xt8WvFEHC2dQPpnxGcegGDOdrv2Fht7tUbBwkCLXxLUQb1POezX+X92MSBt
         ufkmx6aSarBpCCG4sYn/HWVNgAw+0M9Mb3lQGCtRWLSOxhmKcCheY0cVjG/VCuIsahO8
         nR6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpzd4T1P703/CxN1YGHjkBrZhNpcXrAo1yV04NgRb38Y2nC1lb3yag94W8UnrN7ZZqdKwP5WyFMC719RQQDqo/+8Jq4TKb0Kj+V1xu1w==
X-Gm-Message-State: AOJu0Yyd5biOUnv18d0jQpnDEPQlKmMpTG08LZoWoZ8YqgmeLp0PVyiU
	jOZisnutO8/UPI0OUsuKKIw0XnlaGJp6nPCKzDL5lfiaxznsIlNIS6u6NSvhzBmpdiJxUGKZ8Qr
	1DQ==
X-Google-Smtp-Source: AGHT+IGEij7x5iOOrUuL0BYhT5Dm9YFKfO4AZ5nK1acS0T3wJ2KiuANG5aiKSF+tpPt4GoCINPA3jjFDrnM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2341:b0:1fd:d740:b1e5 with SMTP id
 d9443c01a7336-1ff04850898mr447825ad.6.1722037979718; Fri, 26 Jul 2024
 16:52:59 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:20 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-12-seanjc@google.com>
Subject: [PATCH v12 11/84] KVM: Rename gfn_to_page_many_atomic() to kvm_prefetch_pages()
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

Rename gfn_to_page_many_atomic() to kvm_prefetch_pages() to try and
communicate its true purpose, as the "atomic" aspect is essentially a
side effect of the fact that x86 uses the API while holding mmu_lock.
E.g. even if mmu_lock weren't held, KVM wouldn't want to fault-in pages,
as the goal is to opportunistically grab surrounding pages that have
already been accessed and/or dirtied by the host, and to do so quickly.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c         | 2 +-
 arch/x86/kvm/mmu/paging_tmpl.h | 2 +-
 include/linux/kvm_host.h       | 4 ++--
 virt/kvm/kvm_main.c            | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index b7642f1f993f..c1914f02c5e1 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2912,7 +2912,7 @@ static int direct_pte_prefetch_many(struct kvm_vcpu *vcpu,
 	if (!slot)
 		return -1;
 
-	ret = gfn_to_page_many_atomic(slot, gfn, pages, end - start);
+	ret = kvm_prefetch_pages(slot, gfn, pages, end - start);
 	if (ret <= 0)
 		return -1;
 
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index 6b215a932158..bc801d454f41 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -549,7 +549,7 @@ FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 	if (!slot)
 		return false;
 
-	if (gfn_to_page_many_atomic(slot, gfn, &page, 1) != 1)
+	if (kvm_prefetch_pages(slot, gfn, &page, 1) != 1)
 		return false;
 
 	mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c5d39a337aa3..79fed9fea638 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1192,8 +1192,8 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm);
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 				   struct kvm_memory_slot *slot);
 
-int gfn_to_page_many_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
-			    struct page **pages, int nr_pages);
+int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
+		       struct page **pages, int nr_pages);
 
 struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn);
 unsigned long gfn_to_hva(struct kvm *kvm, gfn_t gfn);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 656e931ac39e..803299778cf8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3060,8 +3060,8 @@ kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn);
 
-int gfn_to_page_many_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
-			    struct page **pages, int nr_pages)
+int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
+		       struct page **pages, int nr_pages)
 {
 	unsigned long addr;
 	gfn_t entry = 0;
@@ -3075,7 +3075,7 @@ int gfn_to_page_many_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
 
 	return get_user_pages_fast_only(addr, nr_pages, FOLL_WRITE, pages);
 }
-EXPORT_SYMBOL_GPL(gfn_to_page_many_atomic);
+EXPORT_SYMBOL_GPL(kvm_prefetch_pages);
 
 /*
  * Do not use this helper unless you are absolutely certain the gfn _must_ be
-- 
2.46.0.rc1.232.g9752f9e123-goog

