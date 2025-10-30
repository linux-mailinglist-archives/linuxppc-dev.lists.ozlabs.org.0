Return-Path: <linuxppc-dev+bounces-13586-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC6FC22254
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 21:11:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyFbV42cNz3dmy;
	Fri, 31 Oct 2025 07:10:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761855030;
	cv=none; b=jlw3BWySFRN+V+kuwQly4Pg4XWfWL6Am4GqSX4EcACeK/AdpmpTHi5QYpTpEmWfvfKCD+FZ/0PnphQTRVwTIA8qLHVkoYs3jDcG7EhuHouY3qcoCQiqddasT9UUNzybLixENYqD7hit/zP51PCofpOfg8WlfnY1yIMr96ob/U0gVoHWNpDRwRLwGhFqxPzYTpNDplLzEfzDSIm7VjGZX4CxGrpLVySIyiov99+VCZKpP7zowQZCol45/SnSbMF89qox+QrVutGZWHJRPTK4+5hTqd1+WTHA0Sb0+2SnHDD58+8yWwrbZJvT7XW5qbWQd8nfX/yOr8TMPDYdJaQefDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761855030; c=relaxed/relaxed;
	bh=KH8ZMUFkaBzXjpSahKr3XCuyUdT65ecO9/HP1PAb4RI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fJuxTDN83bTcqAsd5FTgKWT1dpuyzyc1/tq97i86scnPPeohFv9UezwVDe8eNtrRMAt7fMp3lzGkyyVgjcPN3yYmJ243Tdxpb68988Z0g3Zxp2nkOTyEk4FohJLAGGiKAOxn/Wyt1U4Y8TC85hxaKYfoqTxxSSv+mP9PdTf3Q3xMBLfvbSym0yLIzX9jmpyWmGj5LB/yK5hNM3AWGWQdzJOyrxTL7YkNdATxkfWo+Vg3zyfjAoS0JT+TFb7Z1kW6gVFkvGdE6ZDv0WcSWKB35nzs+9AN4QRXg66RdsG7dPlIHWgJDQdDF2f+4jnqC3sAmEmjCxrMWdW4e81zn/iP4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VdD/34jM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3nmydaqykdb8n95ie7bjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VdD/34jM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3nmydaqykdb8n95ie7bjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyFbT6tjJz3bfV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 07:10:29 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3408686190eso460991a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 13:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855028; x=1762459828; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=KH8ZMUFkaBzXjpSahKr3XCuyUdT65ecO9/HP1PAb4RI=;
        b=VdD/34jMPfTbFJ+xhNh8urfyoKt62SgEGO2VXnbQtne544OkLU0x60y2Xd+jJH/+Kj
         4JXJ/Z3Fl350B9B/dT1nEvr1v2X+n5dHGN0BXVqu1efsXPeJ8Qsj92+VqrLbrINiDVv0
         81h+WemOZ0SAnovrFRzHs8XVV/prZq5iN7Mb/k4iJnn4dUQcgxgiXo6UEdZ3qh67RZP/
         penplcNAl7yViAFocmHtxZ1xM75xCj9CGzaOKeSdw7S1hjHmiORmY4ikB3V5GhzG+OaI
         XN8OnuGHapGjXT+gaFAKHxb27CqQ1lEy7nQOlWc7HlFr0zlTwy/24/zbl9XLik28xLY1
         w5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855028; x=1762459828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KH8ZMUFkaBzXjpSahKr3XCuyUdT65ecO9/HP1PAb4RI=;
        b=RGuGlhegbddPkPE9RqzGn7XQ9pbybBg+o4SZdctlkvcIGxg8ibXfSP4ziQWUKrD7fH
         OGX7JxzfA6fimjLLFxV4BLt3OQPgSN+7MxXsKt6UVOLLxMyJ43ftACAnYK7uEvuUheIB
         +FORh9M8awQR0rh29997FoSIp1mB2CKIU7rdAkqJFYKjQ/cG5Q64JIBKB3rD9P57dDlQ
         BT9OpSlwER0f8he4Ek/RYMMFM7JRxwCQuAggfamKnVC2dwCbk+CV0guH8T2Nx/bpBR17
         S5fyl10lliPjE2bDCCkzhbPa2Zb67HIhyUDTLNX/gHymHk0y4j+z0syEZ0JKX4ATw09c
         7l7A==
X-Forwarded-Encrypted: i=1; AJvYcCUk0pwXNgL4/OMZINm8iNFxNGlD+Haq7CPV6XDKDL6ZlqaWXWGWEePLQUQuzaRsp1gqXsWvRf2yHiBRWus=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxuVzVRyc9cWrwKS5l1Jyc7HyiMdc4WQHoBY/5tn5ZWfNRuItSK
	Nk+tmmzi0949aNUgnZaMlJ9EFW7EeztGPHmY27Xy3MdnPXLsY88gCqmc9Cc6qc6GT2+5TMJ+zlv
	VrSZoJA==
X-Google-Smtp-Source: AGHT+IGrJrKalEV3VAWt2uGzDiDeYhZVGRjeI1LK3deyE8hSeRDQF6nrnXg4JLxn0CpF+AukaegC2zqX/UE=
X-Received: from pjbgj23.prod.google.com ([2002:a17:90b:1097:b0:33b:cfaf:ce3e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1801:b0:330:6d5e:f17b
 with SMTP id 98e67ed59e1d1-34083074dddmr1219299a91.21.1761855028166; Thu, 30
 Oct 2025 13:10:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:35 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
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
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-13-seanjc@google.com>
Subject: [PATCH v4 12/28] KVM: TDX: WARN if mirror SPTE doesn't have full RWX
 when creating S-EPT mapping
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
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Pass in the mirror_spte to kvm_x86_ops.set_external_spte() to provide
symmetry with .remove_external_spte(), and assert in TDX that the mirror
SPTE is shadow-present with full RWX permissions (the TDX-Module doesn't
allow the hypervisor to control protections).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 2 +-
 arch/x86/kvm/mmu/tdp_mmu.c      | 3 +--
 arch/x86/kvm/vmx/tdx.c          | 6 +++++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index b5867f8fe6ce..87a5f5100b1d 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1848,7 +1848,7 @@ struct kvm_x86_ops {
 				void *external_spt);
 	/* Update the external page table from spte getting set. */
 	int (*set_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
-				 kvm_pfn_t pfn_for_gfn);
+				 u64 mirror_spte);
 
 	/* Update external page tables for page table about to be freed. */
 	int (*free_external_spt)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index e1a96e9ea1bb..9c26038f6b77 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -515,7 +515,6 @@ static int __must_check set_external_spte_present(struct kvm *kvm, tdp_ptep_t sp
 	bool was_present = is_shadow_present_pte(old_spte);
 	bool is_present = is_shadow_present_pte(new_spte);
 	bool is_leaf = is_present && is_last_spte(new_spte, level);
-	kvm_pfn_t new_pfn = spte_to_pfn(new_spte);
 	int ret = 0;
 
 	KVM_BUG_ON(was_present, kvm);
@@ -534,7 +533,7 @@ static int __must_check set_external_spte_present(struct kvm *kvm, tdp_ptep_t sp
 	 * external page table, or leaf.
 	 */
 	if (is_leaf) {
-		ret = kvm_x86_call(set_external_spte)(kvm, gfn, level, new_pfn);
+		ret = kvm_x86_call(set_external_spte)(kvm, gfn, level, new_spte);
 	} else {
 		void *external_spt = get_external_spt(gfn, new_spte, level);
 
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 7ab67ad83677..658e0407eb21 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1629,14 +1629,18 @@ static int tdx_mem_page_record_premap_cnt(struct kvm *kvm, gfn_t gfn,
 }
 
 static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
-				     enum pg_level level, kvm_pfn_t pfn)
+				     enum pg_level level, u64 mirror_spte)
 {
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
+	kvm_pfn_t pfn = spte_to_pfn(mirror_spte);
 
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
 		return -EIO;
 
+	WARN_ON_ONCE(!is_shadow_present_pte(mirror_spte) ||
+		     (mirror_spte & VMX_EPT_RWX_MASK) != VMX_EPT_RWX_MASK);
+
 	/*
 	 * Read 'pre_fault_allowed' before 'kvm_tdx->state'; see matching
 	 * barrier in tdx_td_finalize().
-- 
2.51.1.930.gacf6e81ea2-goog


