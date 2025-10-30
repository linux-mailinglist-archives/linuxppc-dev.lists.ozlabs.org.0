Return-Path: <linuxppc-dev+bounces-13589-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD2CC22260
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 21:12:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyFbg5Z8Xz3f1W;
	Fri, 31 Oct 2025 07:10:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761855039;
	cv=none; b=mGY7YHpr1o0FjvAJwytIdLvN5RxbdDh9/klyxHk+HyVrfQlh+LMDDCwhLO/mW2+qlIL2edCKimDWZUj3tJ686/JgvZO5mZn9x/I6acWjJQLfGuZNOlBL9nWRryJ239UvpaF9i+O+x3gXIwhcwXxRNDfXHY/TWFkTwi1fDD/LgOmMMP64Trw6N+yy8Vt5mXVaGpn3fvaf5D5N29zHpxpSfP90QhbRxkD1RrL/1kyQp7ToFt9iF4D//dE+hu7YneeODVhxkjMa/ieIypBhOhp9lOd7bfwse55uF7c2PuLWnq2Ham4Cc9RSd+E+D7pCDB4a69p2cFTFmOYMpPy/LT62tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761855039; c=relaxed/relaxed;
	bh=/Z7Z4VCKxvbeclMBJpiAZWPr8rGnQCyDletBZbiKOLg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FtFKD0Ie96hSnm/tzi4GxxFbRb7e/4DIi/Fnm7s8iDRfPk9nlsfnCSpwe12AyMwaXG8kOIqSP/MbrQDaR06f+Yb0JCICDshJdqLZnJTMyozszDYyw7x18JjMa+70NeldB8tR9ZHGkkGqCnbChK6f1Yu7bsLgymOajmiNJkWYypitoZUfGfX64kfRN8kjY1I0aJw4vLKeoTk0P+us1rtYZ8k/k5pET6XPtt4gpLi/DM18LzsN/72i3i3T8YjKRW1IJOkQ/zDgWG0/z/aP4QY9PKAlqvpAsmn/w/znUEtVeZNtS0lKdBSV3mu6OJv4qU3F3uyax1J4IX05HZWTo0QSuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Je/hOxYL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3pcydaqykdcgwierngksskpi.gsqpmrybttg-hizpmwxw.sdpefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Je/hOxYL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3pcydaqykdcgwierngksskpi.gsqpmrybttg-hizpmwxw.sdpefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyFbf6hvTz3f1V
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 07:10:38 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3408d2c733cso57675a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 13:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855037; x=1762459837; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/Z7Z4VCKxvbeclMBJpiAZWPr8rGnQCyDletBZbiKOLg=;
        b=Je/hOxYLT+gn+e8DRiKUSnjxZ9T65lRN9ATUAnu72efrhptmrnK1JKRkrPCBnK38Q7
         04TmVZSVEtIo6wgCWsIADGMZj7DzRu7wcsFJju+V/Qtf9EakNDnmYL8vmzQHXYknoaj4
         7lSeh27N9eufIvA43H0xIiytr7jYaLpVD34UAVXb4Bi/2WJuV7XPFq2hKG1Lt6YTeOzi
         t9HB5Ev/q/uC9SzouaiZgLWeEjfMUivfdzDCOG8gLKbF0P5ve8U+COoTFlgDFPRc5Hcu
         dgcVB0Z2mXSHxYPboLnTSn5TVGYyDHrJaGskV+5oVTRcccdtSGi6dzkjU3wURvClwHCj
         IR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855037; x=1762459837;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Z7Z4VCKxvbeclMBJpiAZWPr8rGnQCyDletBZbiKOLg=;
        b=weerqxNn1+7StTcNQHKJn4Uyy7fn/GgrtQdkFTDGTavdDKIVPNqk04E8JQnjeXvpcn
         w0gZFMdcuzkEFNCR+3LHmzHlJ2FJWeC1PTsRbE/3Ena27mweZwrokM/ZqFCoLAlEZIR/
         0cmhtkdVoIdhwYzPIAc8h55URbNqPZiFgDanqOY1hbHG9rRjTImaquaVbLstVWW2G9HY
         VKCg7XOz+DvFhCYENBsRHjVecUkJfyUZruPVOADm1tD4gKOed1h7AxO46ufLUu6u1PaG
         EFBWwnHLpDi9ZResiY7a5GYBM17RZw33gV0TilSINt9JbRq2VF0aHjVn3ospmbIbQAWz
         NZYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS/W89caJrv9aRYkBBWNjYWM0PGifIqjr4i48JlDu447u/ixQLLZM2ofKQZ+p6/Nxx6VBqjuX3QXD28Ig=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz5rfS131ZelXk9nflkW/QEa0vvqlOlkxKIGQo9PDH1T54Zpn4W
	DQxeJMI74lh9JjSCHzWPD/k62GAC2li/YqAOGpLuZLcV9RIAehGJ0EOixMxs8k4gURFgxko6jAv
	whRRw8A==
X-Google-Smtp-Source: AGHT+IGuQ9tseR+UxrPGQmatIE4dzuj8mufA6J/LivL787A5dSoSjpBpOEZB47eEhvzGXFTpSKaWylv+I0w=
X-Received: from pjqx5.prod.google.com ([2002:a17:90a:b005:b0:32d:dbd4:5cf3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3141:b0:339:a323:30fe
 with SMTP id 98e67ed59e1d1-34082fdc1a5mr1313871a91.14.1761855037257; Thu, 30
 Oct 2025 13:10:37 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:38 -0700
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
Message-ID: <20251030200951.3402865-16-seanjc@google.com>
Subject: [PATCH v4 15/28] KVM: TDX: Fold tdx_mem_page_record_premap_cnt() into
 its sole caller
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

Fold tdx_mem_page_record_premap_cnt() into tdx_sept_set_private_spte() as
providing a one-off helper for effectively three lines of code is at best a
wash, and splitting the code makes the comment for smp_rmb()  _extremely_
confusing as the comment talks about reading kvm->arch.pre_fault_allowed
before kvm_tdx->state, but the immediately visible code does the exact
opposite.

Opportunistically rewrite the comments to more explicitly explain who is
checking what, as well as _why_ the ordering matters.

No functional change intended.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 49 ++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 99db19e02cf1..a30471c972ba 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1605,29 +1605,6 @@ static int tdx_mem_page_aug(struct kvm *kvm, gfn_t gfn,
 	return 0;
 }
 
-/*
- * KVM_TDX_INIT_MEM_REGION calls kvm_gmem_populate() to map guest pages; the
- * callback tdx_gmem_post_populate() then maps pages into private memory.
- * through the a seamcall TDH.MEM.PAGE.ADD().  The SEAMCALL also requires the
- * private EPT structures for the page to have been built before, which is
- * done via kvm_tdp_map_page(). nr_premapped counts the number of pages that
- * were added to the EPT structures but not added with TDH.MEM.PAGE.ADD().
- * The counter has to be zero on KVM_TDX_FINALIZE_VM, to ensure that there
- * are no half-initialized shared EPT pages.
- */
-static int tdx_mem_page_record_premap_cnt(struct kvm *kvm, gfn_t gfn,
-					  enum pg_level level, kvm_pfn_t pfn)
-{
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-
-	if (KVM_BUG_ON(kvm->arch.pre_fault_allowed, kvm))
-		return -EIO;
-
-	/* nr_premapped will be decreased when tdh_mem_page_add() is called. */
-	atomic64_inc(&kvm_tdx->nr_premapped);
-	return 0;
-}
-
 static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 				     enum pg_level level, u64 mirror_spte)
 {
@@ -1642,14 +1619,30 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 		     (mirror_spte & VMX_EPT_RWX_MASK) != VMX_EPT_RWX_MASK);
 
 	/*
-	 * Read 'pre_fault_allowed' before 'kvm_tdx->state'; see matching
-	 * barrier in tdx_td_finalize().
+	 * Ensure pre_fault_allowed is read by kvm_arch_vcpu_pre_fault_memory()
+	 * before kvm_tdx->state.  Userspace must not be allowed to pre-fault
+	 * arbitrary memory until the initial memory image is finalized.  Pairs
+	 * with the smp_wmb() in tdx_td_finalize().
 	 */
 	smp_rmb();
-	if (likely(kvm_tdx->state == TD_STATE_RUNNABLE))
-		return tdx_mem_page_aug(kvm, gfn, level, pfn);
 
-	return tdx_mem_page_record_premap_cnt(kvm, gfn, level, pfn);
+	/*
+	 * If the TD isn't finalized/runnable, then userspace is initializing
+	 * the VM image via KVM_TDX_INIT_MEM_REGION.  Increment the number of
+	 * pages that need to be mapped and initialized via TDH.MEM.PAGE.ADD.
+	 * KVM_TDX_FINALIZE_VM checks the counter to ensure all pre-mapped
+	 * pages have been added to the image, to prevent running the TD with a
+	 * valid mapping in the mirror EPT, but not in the S-EPT.
+	 */
+	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE)) {
+		if (KVM_BUG_ON(kvm->arch.pre_fault_allowed, kvm))
+			return -EIO;
+
+		atomic64_inc(&kvm_tdx->nr_premapped);
+		return 0;
+	}
+
+	return tdx_mem_page_aug(kvm, gfn, level, pfn);
 }
 
 static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn,
-- 
2.51.1.930.gacf6e81ea2-goog


