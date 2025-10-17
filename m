Return-Path: <linuxppc-dev+bounces-12958-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9DCBE5E97
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 02:34:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnm4y6P72z3d0x;
	Fri, 17 Oct 2025 11:33:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760661186;
	cv=none; b=VgL09bgs0CsZnMshazAk8lAQPEs6DHZkH8eGkqSVDp1A+kQCB57FWbZzU/D1LV8F+RNSZOnK5qYPjVVeBB4jAwrLTN+JgzZlTJ4VPldXbB5x60Njt6V0QfZx68aQrmyQD9QxqVuRzE1ovnG4s5e6TbhSM8WqhgNvgLAEBz17rUBrr7YU8b8tqaO5K3fyAjwEWFJZq657FoLw0ugWibBb4je5N4diITAMwBef28IXHrb1tx3a3TBE6XdokTXXLK+29Vp9pGVJjTNVMNu7XgrYCc/JkVo+MW/kmtD8FB8+M4Bi0+ahp7ynpHGhlaixI+bxHR7Y+nFrY7hjr5U6ozL7ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760661186; c=relaxed/relaxed;
	bh=RrkTXpYpJ7TF3q/IfNrztO0QiwCsWOWOHOU78mYwx64=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KVpTJZiAzAfkyt2gioV38KNuFZHkHBBy2j4gsNio4DBA2xyHa5+vbbWG7Gu2o8RLu8brI1KjwvOK7OKvppGbJog6KI+v8GlaY+9VpSSJnOwbK50oHsBg3F2dVczafuGWGfXtuSMNC3fT2F4cQeNDy5xrB/khHl2k+x14UoJ8OY+X1Ci75v1UTV7A8t9RVFuBkBsEgKbnFWsfNx48aiDyyRLQeDry5K9mQTVYXnoKBr7IsMKRC/yemhIr39LU+woIokpSILy0qdKrcpT1DokbDwSgGbjSmAZ6QXFfIntpudE7PajWyHdHnqOvkTL924IGhs7vmkyT5rwBaQAFuxhFag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=A8pyFa6K; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3wi7xaaykdpelxtgcvzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=A8pyFa6K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3wi7xaaykdpelxtgcvzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnm4y0kblz3cnc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 11:33:06 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33bbbb41a84so2168167a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 17:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661184; x=1761265984; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RrkTXpYpJ7TF3q/IfNrztO0QiwCsWOWOHOU78mYwx64=;
        b=A8pyFa6KosGq0Q/fg1z4XcwTxPOohCtUhXvTphmu5V46yP0NQqKwE+0R8XWQt/LVwI
         IQMwZZT7XbSqJSeennEzXs2U0i5lVC69++QOqjsmq3eba52JMBfsRLToR9LqyL2l/lHv
         Ph58EOSMzu+U1K985hw6cKClKwpwUqCKy0Dr2L94RN/FfV9rTgbqfT2+MTyeuU3jTXv0
         of44kc72qC3jPzPakCJESOQFBW8fuHmeA7luAJZ6YsqM03x/IEs5wmDYkCwXPes8zsIc
         +u+Y8g3YbFOzB8uRcZbJbkPzXeMVkYN5tNPPNFBqfcnbOWmW4pUjdSfr7vtaSYy/x84u
         qY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661184; x=1761265984;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrkTXpYpJ7TF3q/IfNrztO0QiwCsWOWOHOU78mYwx64=;
        b=s6kmPKoYgyIyWk2Jz7QAv0kmkojUoP0MndDc9L7OB9vH2rOOuhy4o2ZgIF/nBbErYC
         ITlEnTl2r1RCr/VqPDMLnr5Ce25ndTejzSvD1elUvOmjMVT1R9oaORWVgy6L+4PkpH0/
         R3xYuosWGIvg/JLtEzoPGo/5gETFLzFntrPhyRrkwMmcjGGfdjEYlmEHVmcCuyWuIWrM
         FhSwDVW5Z8b+fvpkWdEbzYxJdlpYxx2dGVif5xQsX4MSvuj1an2+t5Mc8hoYJsVbw0pj
         5t2hbyprx2RZgnd2LdZZ6ReUchV5olLP9aAcUUvj3XmQjTPN8shWktnfDvysCJsJH2eC
         LsoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqx/CED/Dm/XnEfUKJRb3ox+tl/T/cHfFQ/EnvXUAZoWTlFmi9wnKCD/ltIb5b3vLbLy8T48cPFuYgFNM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyL+4aXkZyiaI08ghiH3QtriCspvS7M1i3Z+6ELlH1Hc/zL9GJa
	hoDM8mAdsUew2L3ZmDfZF4QDLs00lw9dT9rANvAtKhkp+wDnzStj4qIIGHHRwFAgU0UYPglmqq1
	yZdFo6Q==
X-Google-Smtp-Source: AGHT+IEszDWyEl04dE1jeZ+WdRgxVfIHlmHOlr4lEQiQaFSefc7rtggxfv5d/ZUmkL9dWZiaizwe6/ECFgw=
X-Received: from pjtf14.prod.google.com ([2002:a17:90a:c28e:b0:32b:ae4c:196c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:55cb:b0:339:9f7d:92d4
 with SMTP id 98e67ed59e1d1-33bcf87b8a5mr2036638a91.9.1760661184417; Thu, 16
 Oct 2025 17:33:04 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:27 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-10-seanjc@google.com>
Subject: [PATCH v3 09/25] KVM: TDX: Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte() to
avoid having to differnatiate between "zap", "drop", and "remove", and to
eliminate dead code due to redundant checks, e.g. on an HKID being
assigned.

No functional change intended.

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 90 +++++++++++++++++++-----------------------
 1 file changed, 40 insertions(+), 50 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index c242d73b6a7b..abea9b3d08cf 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1648,55 +1648,6 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 	return tdx_mem_page_record_premap_cnt(kvm, gfn, level, pfn);
 }
 
-static int tdx_sept_drop_private_spte(struct kvm *kvm, gfn_t gfn,
-				      enum pg_level level, struct page *page)
-{
-	int tdx_level = pg_level_to_tdx_sept_level(level);
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-	gpa_t gpa = gfn_to_gpa(gfn);
-	u64 err, entry, level_state;
-
-	/* TODO: handle large pages. */
-	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
-		return -EIO;
-
-	if (KVM_BUG_ON(!is_hkid_assigned(kvm_tdx), kvm))
-		return -EIO;
-
-	/*
-	 * When zapping private page, write lock is held. So no race condition
-	 * with other vcpu sept operation.
-	 * Race with TDH.VP.ENTER due to (0-step mitigation) and Guest TDCALLs.
-	 */
-	err = tdh_mem_page_remove(&kvm_tdx->td, gpa, tdx_level, &entry,
-				  &level_state);
-
-	if (unlikely(tdx_operand_busy(err))) {
-		/*
-		 * The second retry is expected to succeed after kicking off all
-		 * other vCPUs and prevent them from invoking TDH.VP.ENTER.
-		 */
-		tdx_no_vcpus_enter_start(kvm);
-		err = tdh_mem_page_remove(&kvm_tdx->td, gpa, tdx_level, &entry,
-					  &level_state);
-		tdx_no_vcpus_enter_stop(kvm);
-	}
-
-	if (KVM_BUG_ON(err, kvm)) {
-		pr_tdx_error_2(TDH_MEM_PAGE_REMOVE, err, entry, level_state);
-		return -EIO;
-	}
-
-	err = tdh_phymem_page_wbinvd_hkid((u16)kvm_tdx->hkid, page);
-
-	if (KVM_BUG_ON(err, kvm)) {
-		pr_tdx_error(TDH_PHYMEM_PAGE_WBINVD, err);
-		return -EIO;
-	}
-	tdx_quirk_reset_page(page);
-	return 0;
-}
-
 static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn,
 				     enum pg_level level, void *private_spt)
 {
@@ -1858,7 +1809,11 @@ static int tdx_sept_free_private_spt(struct kvm *kvm, gfn_t gfn,
 static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 					enum pg_level level, kvm_pfn_t pfn)
 {
+	int tdx_level = pg_level_to_tdx_sept_level(level);
+	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 	struct page *page = pfn_to_page(pfn);
+	gpa_t gpa = gfn_to_gpa(gfn);
+	u64 err, entry, level_state;
 	int ret;
 
 	/*
@@ -1869,6 +1824,10 @@ static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	if (KVM_BUG_ON(!is_hkid_assigned(to_kvm_tdx(kvm)), kvm))
 		return -EIO;
 
+	/* TODO: handle large pages. */
+	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
+		return -EIO;
+
 	ret = tdx_sept_zap_private_spte(kvm, gfn, level, page);
 	if (ret <= 0)
 		return ret;
@@ -1879,7 +1838,38 @@ static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	 */
 	tdx_track(kvm);
 
-	return tdx_sept_drop_private_spte(kvm, gfn, level, page);
+	/*
+	 * When zapping private page, write lock is held. So no race condition
+	 * with other vcpu sept operation.
+	 * Race with TDH.VP.ENTER due to (0-step mitigation) and Guest TDCALLs.
+	 */
+	err = tdh_mem_page_remove(&kvm_tdx->td, gpa, tdx_level, &entry,
+				  &level_state);
+
+	if (unlikely(tdx_operand_busy(err))) {
+		/*
+		 * The second retry is expected to succeed after kicking off all
+		 * other vCPUs and prevent them from invoking TDH.VP.ENTER.
+		 */
+		tdx_no_vcpus_enter_start(kvm);
+		err = tdh_mem_page_remove(&kvm_tdx->td, gpa, tdx_level, &entry,
+					  &level_state);
+		tdx_no_vcpus_enter_stop(kvm);
+	}
+
+	if (KVM_BUG_ON(err, kvm)) {
+		pr_tdx_error_2(TDH_MEM_PAGE_REMOVE, err, entry, level_state);
+		return -EIO;
+	}
+
+	err = tdh_phymem_page_wbinvd_hkid((u16)kvm_tdx->hkid, page);
+	if (KVM_BUG_ON(err, kvm)) {
+		pr_tdx_error(TDH_PHYMEM_PAGE_WBINVD, err);
+		return -EIO;
+	}
+
+	tdx_quirk_reset_page(page);
+	return 0;
 }
 
 void tdx_deliver_interrupt(struct kvm_lapic *apic, int delivery_mode,
-- 
2.51.0.858.gf9c4a03a3a-goog


