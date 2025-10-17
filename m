Return-Path: <linuxppc-dev+bounces-12956-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B2CBE5E8C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 02:33:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnm4v1xNXz3cmC;
	Fri, 17 Oct 2025 11:33:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::44a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760661183;
	cv=none; b=JtZ+cI2s+7xFhuSITEH2ssc2YN8oO8aIyvXxjGmK/i6xnWud++AhU6IKvpDyPwsEWQXABlEvtwx2lYN7qkUKjtd5GU2cu/rChmkpqC8KZF4msDqZPZ3TiGVjOSePByATZ8HG/jRwOAg2LHzj/R1AVyURptshZ3Yhnqh596TrkDGNcX7qs1RCEA/yuDAjJB/h2EbpZbfiCzewE6EoxRf9ce0d6owDj5yfVazT++zfxChFLzkTBSOlrtaF9nu/83pMm0FVmld5MNG452+BIcMSui+vKES+KNFeoVTg1E58oWWFTU1+iwzN/heO2uL37VpyekTZ4MjiB9DRgznnAMWoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760661183; c=relaxed/relaxed;
	bh=cf8N8Y56G5w6bizwE7Ci0y1MCMFb0ZkjYruE6L135MI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WaZ14iwBpWQjJMGcNLRJOE0QNsBIeYjthEIv0I/kzH59Rqx+22dF9WJgqPK1hUevrZRMAlUZxCOk9X2MD7sL6ZX9QNhUeTogHiqmUfgOmDt54z6aHvRYRzBdaI8izyh94jp33nzyTPJ/L5LLP6YdgWL2BKf/sVUdAGLrzQaDS7afJZcVo0GK6uUzvaUb7COb9Y1dqqXNJheLyX5OL5pFdkEu+b3Doh4aDDlEY/UC/hwybdX9uBPtgADf15Wb/47un2RtY+hZMD8VCCtRmqO7Pgw0ALEGCdd3QUbhdjhAr8zNZYKpOyoLv/5UO3S9krrL6s7LBrqfbSgmm1kM61hjBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=m3FPlrya; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3vi7xaaykdo0htpcyrvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=m3FPlrya;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3vi7xaaykdo0htpcyrvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnm4t3vSFz3cfQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 11:33:02 +1100 (AEDT)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7810e5a22f3so2753604b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 17:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661181; x=1761265981; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=cf8N8Y56G5w6bizwE7Ci0y1MCMFb0ZkjYruE6L135MI=;
        b=m3FPlrya/tp8MY25/Jc6mvHvC/uULIebovsB2T787zXHVAjKVKx7d96PV7nb3aUlnu
         jsgDHRuLVJeApPO6Al7+kTkgMtw3B+NHQFLCxl1sq8YC+jkbEvLpNMDE6oyQEkBYX26b
         DEnZdfKomWf4A9obJJToDIbhnqhQTArryTB02BI73/ZvvyLJPEaWJZVSsvrE2DVhSIM1
         4EMh4pbZWllJRlmPMzUXmUkJ/5FGVGzBbGwGfsV9uH9W4OvBBfPOzHOwEaMJSA7DLyZx
         ZwfVGSOi7QeaoUavkLSZPkwPDMNR9kQ7RwQk0PEfoxeez+2L3Q2k1rqkYl3R0qa1pFeW
         kCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661181; x=1761265981;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cf8N8Y56G5w6bizwE7Ci0y1MCMFb0ZkjYruE6L135MI=;
        b=iXwXIURfsVdn8TiZCJxcB8WuZiVTxR6iUSzk7mcCHaD4+WCQhmvjcFJMgDOHGUrymp
         nlVQq1btDajxnRssuTow3sobz/0TIlB3bwWugI9NLw/kPMDNrG2NQ3nrtFevDKhqkVQJ
         UWBBVsOUrBC9w251aKun3lVfzamXhlvBS1M5AZoZfi8K+sPTSOBleuXtaeOjuXyS/H4M
         89kejmGi062gxmzSr1uTrL6wCWwijU/3mJiv6OHM3fVN2OCKZovMzirLo4S+et7xuaXz
         YtPtxk2LkB/4H6wWDaYEzequ1PBc93osuisYVyJ1Y9pzwu31o/6BjR42jhouDOgbiydw
         +zLw==
X-Forwarded-Encrypted: i=1; AJvYcCW83zUVWxO0n5d7Tzw3H2qr6gQa14m4pwXAVo3dW9oPuwUKInbAtqpPKYwPo5hEirq46jQCzz/WZviztFA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw7Tlt0FY0qkbiQ3i/Z1GBLOZx7nv5Y4u53zF/OsTAWKpAlz0PQ
	hpwbGXcsZtwF/u/6yiWSWt19q4TbmDy8LgopaaKuJQJOTiNz5rgARwEJPpY/vykWowZge/gnbQl
	a6vfqCA==
X-Google-Smtp-Source: AGHT+IFGX/O8rAylXetPrL4mM3U8URlaleqJu641GFX2gsiAqRo0BdBbaKA0U4x8ZGwd9In5RU4acPt36Xo=
X-Received: from pjbml22.prod.google.com ([2002:a17:90b:3616:b0:339:ae3b:2bc7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:2408:b0:334:a23e:2dff
 with SMTP id adf61e73a8af0-334a858f4e4mr1825671637.25.1760661180701; Thu, 16
 Oct 2025 17:33:00 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:25 -0700
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
Message-ID: <20251017003244.186495-8-seanjc@google.com>
Subject: [PATCH v3 07/25] KVM: TDX: Drop superfluous page pinning in S-EPT management
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

From: Yan Zhao <yan.y.zhao@intel.com>

Don't explicitly pin pages when mapping pages into the S-EPT, guest_memfd
doesn't support page migration in any capacity, i.e. there are no migrate
callbacks because guest_memfd pages *can't* be migrated.  See the WARN in
kvm_gmem_migrate_folio().

Eliminating TDX's explicit pinning will also enable guest_memfd to support
in-place conversion between shared and private memory[1][2].  Because KVM
cannot distinguish between speculative/transient refcounts and the
intentional refcount for TDX on private pages[3], failing to release
private page refcount in TDX could cause guest_memfd to indefinitely wait
on decreasing the refcount for the splitting.

Under normal conditions, not holding an extra page refcount in TDX is safe
because guest_memfd ensures pages are retained until its invalidation
notification to KVM MMU is completed. However, if there're bugs in KVM/TDX
module, not holding an extra refcount when a page is mapped in S-EPT could
result in a page being released from guest_memfd while still mapped in the
S-EPT.  But, doing work to make a fatal error slightly less fatal is a net
negative when that extra work adds complexity and confusion.

Several approaches were considered to address the refcount issue, including
  - Attempting to modify the KVM unmap operation to return a failure,
    which was deemed too complex and potentially incorrect[4].
 - Increasing the folio reference count only upon S-EPT zapping failure[5].
 - Use page flags or page_ext to indicate a page is still used by TDX[6],
   which does not work for HVO (HugeTLB Vmemmap Optimization).
  - Setting HWPOISON bit or leveraging folio_set_hugetlb_hwpoison()[7].

Due to the complexity or inappropriateness of these approaches, and the
fact that S-EPT zapping failure is currently only possible when there are
bugs in the KVM or TDX module, which is very rare in a production kernel,
a straightforward approach of simply not holding the page reference count
in TDX was chosen[8].

When S-EPT zapping errors occur, KVM_BUG_ON() is invoked to kick off all
vCPUs and mark the VM as dead. Although there is a potential window that a
private page mapped in the S-EPT could be reallocated and used outside the
VM, the loud warning from KVM_BUG_ON() should provide sufficient debug
information. To be robust against bugs, the user can enable panic_on_warn
as normal.

Link: https://lore.kernel.org/all/cover.1747264138.git.ackerleytng@google.com [1]
Link: https://youtu.be/UnBKahkAon4 [2]
Link: https://lore.kernel.org/all/CAGtprH_ypohFy9TOJ8Emm_roT4XbQUtLKZNFcM6Fr+fhTFkE0Q@mail.gmail.com [3]
Link: https://lore.kernel.org/all/aEEEJbTzlncbRaRA@yzhao56-desk.sh.intel.com [4]
Link: https://lore.kernel.org/all/aE%2Fq9VKkmaCcuwpU@yzhao56-desk.sh.intel.com [5]
Link: https://lore.kernel.org/all/aFkeBtuNBN1RrDAJ@yzhao56-desk.sh.intel.com [6]
Link: https://lore.kernel.org/all/diqzy0tikran.fsf@ackerleytng-ctop.c.googlers.com [7]
Link: https://lore.kernel.org/all/53ea5239f8ef9d8df9af593647243c10435fd219.camel@intel.com [8]
Suggested-by: Vishal Annapurve <vannapurve@google.com>
Suggested-by: Ackerley Tng <ackerleytng@google.com>
Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
[sean: extract out of hugepage series, massage changelog accordingly]
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 29f344af4cc2..c3bae6b96dc4 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1583,29 +1583,22 @@ void tdx_load_mmu_pgd(struct kvm_vcpu *vcpu, hpa_t root_hpa, int pgd_level)
 	td_vmcs_write64(to_tdx(vcpu), SHARED_EPT_POINTER, root_hpa);
 }
 
-static void tdx_unpin(struct kvm *kvm, struct page *page)
-{
-	put_page(page);
-}
-
 static int tdx_mem_page_aug(struct kvm *kvm, gfn_t gfn,
-			    enum pg_level level, struct page *page)
+			    enum pg_level level, kvm_pfn_t pfn)
 {
 	int tdx_level = pg_level_to_tdx_sept_level(level);
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
+	struct page *page = pfn_to_page(pfn);
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 entry, level_state;
 	u64 err;
 
 	err = tdh_mem_page_aug(&kvm_tdx->td, gpa, tdx_level, page, &entry, &level_state);
-	if (unlikely(tdx_operand_busy(err))) {
-		tdx_unpin(kvm, page);
+	if (unlikely(tdx_operand_busy(err)))
 		return -EBUSY;
-	}
 
 	if (KVM_BUG_ON(err, kvm)) {
 		pr_tdx_error_2(TDH_MEM_PAGE_AUG, err, entry, level_state);
-		tdx_unpin(kvm, page);
 		return -EIO;
 	}
 
@@ -1639,29 +1632,18 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 				     enum pg_level level, kvm_pfn_t pfn)
 {
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-	struct page *page = pfn_to_page(pfn);
 
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
 		return -EINVAL;
 
-	/*
-	 * Because guest_memfd doesn't support page migration with
-	 * a_ops->migrate_folio (yet), no callback is triggered for KVM on page
-	 * migration.  Until guest_memfd supports page migration, prevent page
-	 * migration.
-	 * TODO: Once guest_memfd introduces callback on page migration,
-	 * implement it and remove get_page/put_page().
-	 */
-	get_page(page);
-
 	/*
 	 * Read 'pre_fault_allowed' before 'kvm_tdx->state'; see matching
 	 * barrier in tdx_td_finalize().
 	 */
 	smp_rmb();
 	if (likely(kvm_tdx->state == TD_STATE_RUNNABLE))
-		return tdx_mem_page_aug(kvm, gfn, level, page);
+		return tdx_mem_page_aug(kvm, gfn, level, pfn);
 
 	return tdx_mem_page_record_premap_cnt(kvm, gfn, level, pfn);
 }
@@ -1712,7 +1694,6 @@ static int tdx_sept_drop_private_spte(struct kvm *kvm, gfn_t gfn,
 		return -EIO;
 	}
 	tdx_quirk_reset_page(page);
-	tdx_unpin(kvm, page);
 	return 0;
 }
 
@@ -1792,7 +1773,6 @@ static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
 	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level) &&
 	    !KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm)) {
 		atomic64_dec(&kvm_tdx->nr_premapped);
-		tdx_unpin(kvm, page);
 		return 0;
 	}
 
-- 
2.51.0.858.gf9c4a03a3a-goog


