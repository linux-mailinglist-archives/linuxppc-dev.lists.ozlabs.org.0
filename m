Return-Path: <linuxppc-dev+bounces-12964-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3B3BE5EC1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 02:34:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnm586VZ7z3dDn;
	Fri, 17 Oct 2025 11:33:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760661196;
	cv=none; b=G5RkYLsB3iu9IqtqRhrLlC0A6JkfiupabFeQ4ADHbFfeNTY3nu+1A3LF0XDAuxOG1H5H+bjhv6wCrf+iDmGzgbE9Q8DD/7njbJ+7w21KzaKSk6ULFm7Ofn/UHyfWar7oMj4KX7Nq98KCu5HidbiP+xIeF0lg24Utj5lCAMxTcfEJE50l+awWCHHtY2k7mz+ssGdZXluHLk2dfZGJf9VlxPMKE03uHkovZb6Ffln1gI5aznCWD+xlUCcRH2aS4wEmc3IwTw5m6rrWQl5zRHPVanfRhBk61KHvi3PQu/6SpD8+s48JHN2UClhRrslTh8k2314KRSUGpXTuBNMexwQunQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760661196; c=relaxed/relaxed;
	bh=24WL3/XVrWtQShgQMVnGZkUPAQhnwZjEdj9gk6jqvRM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Uck7r6sBk/ERT2z7Fy2fL6T+3M6rcsCGo4NJzbzXNL4qdIADRtzgJM2F249zhoYEmnWNRoy+TrLG2H2mw1cyUvwMK0WIVF1Gma8wb4hF70KFzGqt4dbcjdg96LnhDvez9BuQ7SsBpj0zdOo9OcSLMwTm9VG6S0GLNu5giD9UcqFC3HZu/5BmqYR7G/ww9ghkw+fbe01+C5OgZkkjfBNn6/cdNoLTIGTwNFizeffTm/adwq5ZYwBMAwfbiIvqF3a2mr109qbVYoQouiD3GXupPrgO5gZcu75XjofjYEKiuPNj560Hwz89Ulk33vB/GqX5UUtKdLGiaDuH2L8OkrvOeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hRlzd/YZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3yo7xaaykdpsvhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hRlzd/YZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3yo7xaaykdpsvhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnm5812BLz3dBr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 11:33:16 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33bcb7796d4so677131a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 17:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661194; x=1761265994; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=24WL3/XVrWtQShgQMVnGZkUPAQhnwZjEdj9gk6jqvRM=;
        b=hRlzd/YZw5NbnQpJ6Gg6zcTeo0cO/V6ORRUJ1U3EMBb/B27GrYytM/q7i2LbMCumHe
         g4f6LKnDZVXW6dI4I1QtbBF3Fh16AKrzp3LqQeyG7SxT0M39SJLNpd+Ijw1Py13H0EZk
         U83bSZ+w9x6gKeMyaUXZq132KOqOilNZMWxXZXLissBLp9hR/8LEN1j1q7qyu1vWbclz
         JXyxgsKS8zcXUj2vhFM4us5cd6uGvtI7GEv4Lq85JWim02K5I2JBVxvhfyVuIOyYTq5V
         vZgpXzMvQag2bTMf+HMVdiqc7x8U0qIxWVhvspPJSRr92MIOnJ18kg+TZUvGsjXt4uAc
         C9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661194; x=1761265994;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24WL3/XVrWtQShgQMVnGZkUPAQhnwZjEdj9gk6jqvRM=;
        b=lTRYwKajMBDXiyMbRsyXAALClM3fA3IotywfbuccuxJJS5+53tKA1jtDnA7h+y5l1s
         Qf+QQQa9/8V0QbA+Qw6s4IDxd3h3vKHV914IHr3KHgfPhFwtXlKZnYtTkEt5PGz1NyFS
         cRiW2WNF5DmFLxSConCAm1Hk2nbRp9eZ0Z9tyJAdqT8pIvJrVTeUNMXzUOvUnEiZZvTi
         rDn3G/B20dfh72FV/ySKGgM7tdAXdhhGVOnikPygBJ6/vfvT7vjU+GrRnseFNsauaosA
         GE86/nAocl21jJOfQftWPEBkDfce9nFXasH8BKTajhdt+RmbAp9o7ol9YXswbw5yH+85
         aHlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeeP/fM1k6FuD0Ns7vhf/vR5nnf9JjHo3bKPr3XeiPKyCo0b+OncKZkLKyI/yJhC04N3hIPE+zKgnqp1o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwIqA3Y/pSVXGNKUB7R0TmQdLY8KoNw8IUJywq0Lr/OHBLDaGif
	mQmmMxWboHB2dA9nR/V6lBUTJJHuaqPFkvSU+nXmF5YgFWl2osnh1FU1wPrGNaaJxTQOukhh9xM
	hoD8Hhg==
X-Google-Smtp-Source: AGHT+IHsf5Q4hKwAqjzfrtBJQeOEWpiuWR1U3EUS3M0ncbeH1DJJyZF5orweh3oOIyC71bDEGVac2tYwtXY=
X-Received: from pjir1.prod.google.com ([2002:a17:90a:5c81:b0:31f:2a78:943])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:270a:b0:32e:8c14:5d09
 with SMTP id 98e67ed59e1d1-33bcf86287fmr1924301a91.7.1760661194542; Thu, 16
 Oct 2025 17:33:14 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:33 -0700
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
Message-ID: <20251017003244.186495-16-seanjc@google.com>
Subject: [PATCH v3 15/25] KVM: TDX: ADD pages to the TD image while populating
 mirror EPT entries
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

When populating the initial memory image for a TDX guest, ADD pages to the
TD as part of establishing the mappings in the mirror EPT, as opposed to
creating the mappings and then doing ADD after the fact.  Doing ADD in the
S-EPT callbacks eliminates the need to track "premapped" pages, as the
mirror EPT (M-EPT) and S-EPT are always synchronized, e.g. if ADD fails,
KVM reverts to the previous M-EPT entry (guaranteed to be !PRESENT).

Eliminating the hole where the M-EPT can have a mapping that doesn't exist
in the S-EPT in turn obviates the need to handle errors that are unique to
encountering a missing S-EPT entry (see tdx_is_sept_zap_err_due_to_premap()).

Keeping the M-EPT and S-EPT synchronized also eliminates the need to check
for unconsumed "premap" entries during tdx_td_finalize(), as there simply
can't be any such entries.  Dropping that check in particular reduces the
overall cognitive load, as the managemented of nr_premapped with respect
to removal of S-EPT is _very_ subtle.  E.g. successful removal of an S-EPT
entry after it completed ADD doesn't adjust nr_premapped, but it's not
clear why that's "ok" but having half-baked entries is not (it's not truly
"ok" in that removing pages from the image will likely prevent the guest
from booting, but from KVM's perspective it's "ok").

Doing ADD in the S-EPT path requires passing an argument via a scratch
field, but the current approach of tracking the number of "premapped"
pages effectively does the same.  And the "premapped" counter is much more
dangerous, as it doesn't have a singular lock to protect its usage, since
nr_premapped can be modified as soon as mmu_lock is dropped, at least in
theory.  I.e. nr_premapped is guarded by slots_lock, but only for "happy"
paths.

Note, this approach was used/tried at various points in TDX development,
but was ultimately discarded due to a desire to avoid stashing temporary
state in kvm_tdx.  But as above, KVM ended up with such state anyways,
and fully committing to using temporary state provides better access
rules (100% guarded by slots_lock), and makes several edge cases flat out
impossible.

Note #2, continue to extend the measurement outside of mmu_lock, as it's
a slow operation (typically 16 SEAMCALLs per page whose data is included
in the measurement), and doesn't *need* to be done under mmu_lock, e.g.
for consistency purposes.  However, MR.EXTEND isn't _that_ slow, e.g.
~1ms latency to measure a full page, so if it needs to be done under
mmu_lock in the future, e.g. because KVM gains a flow that can remove
S-EPT entries uring KVM_TDX_INIT_MEM_REGION, then extending the
measurement can also be moved into the S-EPT mapping path (again, only if
absolutely necessary).  P.S. _If_ MR.EXTEND is moved into the S-EPT path,
take care not to return an error up the stack if TDH_MR_EXTEND fails, as
removing the M-EPT entry but not the S-EPT entry would result in
inconsistent state!

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 114 ++++++++++++++---------------------------
 arch/x86/kvm/vmx/tdx.h |   8 ++-
 2 files changed, 45 insertions(+), 77 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index f4bab75d3ffb..76030461c8f7 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1583,6 +1583,32 @@ void tdx_load_mmu_pgd(struct kvm_vcpu *vcpu, hpa_t root_hpa, int pgd_level)
 	td_vmcs_write64(to_tdx(vcpu), SHARED_EPT_POINTER, root_hpa);
 }
 
+static int tdx_mem_page_add(struct kvm *kvm, gfn_t gfn, enum pg_level level,
+			    kvm_pfn_t pfn)
+{
+	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
+	u64 err, entry, level_state;
+	gpa_t gpa = gfn_to_gpa(gfn);
+
+	lockdep_assert_held(&kvm->slots_lock);
+
+	if (KVM_BUG_ON(kvm->arch.pre_fault_allowed, kvm) ||
+	    KVM_BUG_ON(!kvm_tdx->page_add_src, kvm))
+		return -EIO;
+
+	err = tdh_mem_page_add(&kvm_tdx->td, gpa, pfn_to_page(pfn),
+			       kvm_tdx->page_add_src, &entry, &level_state);
+	if (unlikely(tdx_operand_busy(err)))
+		return -EBUSY;
+
+	if (KVM_BUG_ON(err, kvm)) {
+		pr_tdx_error_2(TDH_MEM_PAGE_ADD, err, entry, level_state);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int tdx_mem_page_aug(struct kvm *kvm, gfn_t gfn,
 			    enum pg_level level, kvm_pfn_t pfn)
 {
@@ -1624,19 +1650,10 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 
 	/*
 	 * If the TD isn't finalized/runnable, then userspace is initializing
-	 * the VM image via KVM_TDX_INIT_MEM_REGION.  Increment the number of
-	 * pages that need to be mapped and initialized via TDH.MEM.PAGE.ADD.
-	 * KVM_TDX_FINALIZE_VM checks the counter to ensure all mapped pages
-	 * have been added to the image, to prevent running the TD with a
-	 * valid mapping in the mirror EPT, but not in the S-EPT.
+	 * the VM image via KVM_TDX_INIT_MEM_REGION; ADD the page to the TD.
 	 */
-	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE)) {
-		if (KVM_BUG_ON(kvm->arch.pre_fault_allowed, kvm))
-			return -EIO;
-
-		atomic64_inc(&kvm_tdx->nr_premapped);
-		return 0;
-	}
+	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
+		return tdx_mem_page_add(kvm, gfn, level, pfn);
 
 	return tdx_mem_page_aug(kvm, gfn, level, pfn);
 }
@@ -1662,39 +1679,6 @@ static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn,
 	return 0;
 }
 
-/*
- * Check if the error returned from a SEPT zap SEAMCALL is due to that a page is
- * mapped by KVM_TDX_INIT_MEM_REGION without tdh_mem_page_add() being called
- * successfully.
- *
- * Since tdh_mem_sept_add() must have been invoked successfully before a
- * non-leaf entry present in the mirrored page table, the SEPT ZAP related
- * SEAMCALLs should not encounter err TDX_EPT_WALK_FAILED. They should instead
- * find TDX_EPT_ENTRY_STATE_INCORRECT due to an empty leaf entry found in the
- * SEPT.
- *
- * Further check if the returned entry from SEPT walking is with RWX permissions
- * to filter out anything unexpected.
- *
- * Note: @level is pg_level, not the tdx_level. The tdx_level extracted from
- * level_state returned from a SEAMCALL error is the same as that passed into
- * the SEAMCALL.
- */
-static int tdx_is_sept_zap_err_due_to_premap(struct kvm_tdx *kvm_tdx, u64 err,
-					     u64 entry, int level)
-{
-	if (!err || kvm_tdx->state == TD_STATE_RUNNABLE)
-		return false;
-
-	if (err != (TDX_EPT_ENTRY_STATE_INCORRECT | TDX_OPERAND_ID_RCX))
-		return false;
-
-	if ((is_last_spte(entry, level) && (entry & VMX_EPT_RWX_MASK)))
-		return false;
-
-	return true;
-}
-
 static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
 				     enum pg_level level, struct page *page)
 {
@@ -1714,12 +1698,6 @@ static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
 		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
 		tdx_no_vcpus_enter_stop(kvm);
 	}
-	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level)) {
-		if (KVM_BUG_ON(atomic64_dec_return(&kvm_tdx->nr_premapped) < 0, kvm))
-			return -EIO;
-
-		return 0;
-	}
 
 	if (KVM_BUG_ON(err, kvm)) {
 		pr_tdx_error_2(TDH_MEM_RANGE_BLOCK, err, entry, level_state);
@@ -2825,12 +2803,6 @@ static int tdx_td_finalize(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
 
 	if (!is_hkid_assigned(kvm_tdx) || kvm_tdx->state == TD_STATE_RUNNABLE)
 		return -EINVAL;
-	/*
-	 * Pages are pending for KVM_TDX_INIT_MEM_REGION to issue
-	 * TDH.MEM.PAGE.ADD().
-	 */
-	if (atomic64_read(&kvm_tdx->nr_premapped))
-		return -EINVAL;
 
 	cmd->hw_error = tdh_mr_finalize(&kvm_tdx->td);
 	if (tdx_operand_busy(cmd->hw_error))
@@ -3127,6 +3099,9 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 	struct page *src_page;
 	int ret, i;
 
+	if (KVM_BUG_ON(kvm_tdx->page_add_src, kvm))
+		return -EIO;
+
 	/*
 	 * Get the source page if it has been faulted in. Return failure if the
 	 * source page has been swapped out or unmapped in primary memory.
@@ -3137,22 +3112,14 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 	if (ret != 1)
 		return -ENOMEM;
 
+	kvm_tdx->page_add_src = src_page;
 	ret = kvm_tdp_mmu_map_private_pfn(arg->vcpu, gfn, pfn);
-	if (ret < 0)
-		goto out;
+	kvm_tdx->page_add_src = NULL;
 
-	ret = 0;
-	err = tdh_mem_page_add(&kvm_tdx->td, gpa, pfn_to_page(pfn),
-			       src_page, &entry, &level_state);
-	if (err) {
-		ret = unlikely(tdx_operand_busy(err)) ? -EBUSY : -EIO;
-		goto out;
-	}
+	put_page(src_page);
 
-	KVM_BUG_ON(atomic64_dec_return(&kvm_tdx->nr_premapped) < 0, kvm);
-
-	if (!(arg->flags & KVM_TDX_MEASURE_MEMORY_REGION))
-		goto out;
+	if (ret || !(arg->flags & KVM_TDX_MEASURE_MEMORY_REGION))
+		return ret;
 
 	/*
 	 * Note, MR.EXTEND can fail if the S-EPT mapping is somehow removed
@@ -3165,14 +3132,11 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 		err = tdh_mr_extend(&kvm_tdx->td, gpa + i, &entry, &level_state);
 		if (KVM_BUG_ON(err, kvm)) {
 			pr_tdx_error_2(TDH_MR_EXTEND, err, entry, level_state);
-			ret = -EIO;
-			goto out;
+			return -EIO;
 		}
 	}
 
-out:
-	put_page(src_page);
-	return ret;
+	return 0;
 }
 
 static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *cmd)
diff --git a/arch/x86/kvm/vmx/tdx.h b/arch/x86/kvm/vmx/tdx.h
index ca39a9391db1..1b00adbbaf77 100644
--- a/arch/x86/kvm/vmx/tdx.h
+++ b/arch/x86/kvm/vmx/tdx.h
@@ -36,8 +36,12 @@ struct kvm_tdx {
 
 	struct tdx_td td;
 
-	/* For KVM_TDX_INIT_MEM_REGION. */
-	atomic64_t nr_premapped;
+	/*
+	 * Scratch pointer used to pass the source page to tdx_mem_page_add.
+	 * Protected by slots_lock, and non-NULL only when mapping a private
+	 * pfn via tdx_gmem_post_populate().
+	 */
+	struct page *page_add_src;
 
 	/*
 	 * Prevent vCPUs from TD entry to ensure SEPT zap related SEAMCALLs do
-- 
2.51.0.858.gf9c4a03a3a-goog


