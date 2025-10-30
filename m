Return-Path: <linuxppc-dev+bounces-13585-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D09BC2224E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 21:11:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyFbS27vYz3btL;
	Fri, 31 Oct 2025 07:10:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761855028;
	cv=none; b=MZKLp6lNRC2EZdysGKfnmbp+VgjlIcJWQZ1tvhUQpllxtZvdxj0m32WhisFBRyyLPk5AYbmKfszxn5ViaBRK3LTItLSc0KfVpPI64XOKrVXnGtF56j2Uuj19npq4obCfRZp0GidvtQj5n3bvqPq43fTAUS+TkBXXLWWQsaHT+73UgmDs3JynMQGxkJJTWm0b3JOkvbamblXA+d2Gtiu44Me/rHswi9VP1S5Xa9EGRQebjbo4kbuV+s2nYrfytOt9Wdy2m3SH+HpgcHP/1G9nodDMUJ3PRZPMx86TYf0xbY0R346MMjnSJB+PwLH8lh46FIHKkaSEgqwEamQXDs0ZjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761855028; c=relaxed/relaxed;
	bh=8nIvTvBCdsBevoBG1DvySQLnzbDN6yPR9QB+VA8aXbA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UxlN9oewVSjM8bv7y3baOg2x8QFEGUhakXuxJtp/ZNs+SF4v4WNkHfalJeYNXtLS1dbilSiIiww5xJFbh0rmM8jb66jLo/lTRb4SS/TTrNpjP4Rfkzo8TfPYb7+xRgtUPBcOyMeIm3riXZZIeu+UlsCWHBXVL0n20gCqOEKuD+13kC5ZTUdq1BZ4NvOOFoTJ39d7XpAxaqxyVMvtvv+ShsV6Ftu6p/Vvt/GwYfqMgEBp2PaF+6z1HeO2n5KNMqVQffhbHN+Ont4wLKSVAwKcskyCTq5XvzI6kkmzkOPQ0fp/7zZchQWOqIZOibSwNw0kmDj+7KhcMXpy6DQBBhoVHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kjHFbcpj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3mcydaqykdbwk62fb48gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kjHFbcpj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3mcydaqykdbwk62fb48gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyFbR3xFyz3bfV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 07:10:27 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33baf262850so1720395a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 13:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855026; x=1762459826; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8nIvTvBCdsBevoBG1DvySQLnzbDN6yPR9QB+VA8aXbA=;
        b=kjHFbcpjtDHPG0sm35vtoSWjMHaRvdGwfevdqObvkz8zRhaDkaRYtxiNhTp7qd77ZA
         3kOdSmhS+xkuvY4x6rCIgI9wKusMCEdhiK0kzcsNdL/WN0Ft6F+SjWuuZaV/wkRtnETO
         LAUpZlJPFnBOrx52/CvOlOlagwlGcH33sHwbsbpke0b433NaMFMOx6IBPf1MNAW06QYS
         4J383MKfiRak7PmW4WFdESi117DpC8z+yKcwhA863oL4jGNvHYpUxGKmLt06I30vnNbq
         O4z8ZaEmHcTbFv1pLTsTGqGLNxfvP4cjAMyjYBu1LgF0JduS/FN0Un30QNtch5JhDR/I
         VFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855026; x=1762459826;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8nIvTvBCdsBevoBG1DvySQLnzbDN6yPR9QB+VA8aXbA=;
        b=xVNvzZ64LHXL1sNlV3n7Lo4AIbt/Suy5rFsTqVXOZPxfjcPQINVkMajnKyVOdA5Nab
         wbW2QJ0AIJUfxEgq+153w/KJyNb3yyuajS9jFnnEq9hU08zR5u3ZSuJRMwMUfjoaiAsE
         rGu8uCXT1cydQQBUJ+sUFqdJ9p4bGmmNMxzeuVNulmCcBcSGkl12VUnW8sXVjdjx4ZW4
         2mPlia3hGojOs3yQPhOnveaabyWvhSc1xBNINPNjeZhB4A1dQt2jhK4BwOSAVBVL4MFG
         0LE3EGtV7itDv9nxFJWm3RscN1RZ9QRGkSPuY9gcZDZ3l1bn6X0z4ktr1Ec1pMGaaGxj
         MdPw==
X-Forwarded-Encrypted: i=1; AJvYcCWRzi+Hn7IA9zSBCMNXgOn/oNmh8eAYsC6/yxyrAdQWPyHf6gchcqzYfqgyaZXa5xqgpZ03/wAiiRupb0Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzp5FbdgNqWTbl48oI3oXPk6E8IXNj+eQ6RJtVdIKp2nKoM1jvP
	R4w9gkoG1DQRWVvp9Rmo97t0BEDCzmkGljQicJ4zlXc9qUTEt3FbSU4wYf38tRwdw0qSE5ZldQX
	mXotIFA==
X-Google-Smtp-Source: AGHT+IEhw8LtT9p+iuh4rLr+K1Dp7djyQDWKY2Obpi49t8AGu0qQZAphBfIqivSEmnTrnJBooynMyMjyxqM=
X-Received: from pjbcf6.prod.google.com ([2002:a17:90a:ebc6:b0:33f:e888:4aad])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c8b:b0:32e:3552:8c79
 with SMTP id 98e67ed59e1d1-34083088fb8mr1238454a91.29.1761855025815; Thu, 30
 Oct 2025 13:10:25 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:34 -0700
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
Message-ID: <20251030200951.3402865-12-seanjc@google.com>
Subject: [PATCH v4 11/28] KVM: x86/mmu: Drop the return code from kvm_x86_ops.remove_external_spte()
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

Drop the return code from kvm_x86_ops.remove_external_spte(), a.k.a.
tdx_sept_remove_private_spte(), as KVM simply does a KVM_BUG_ON() failure,
and that KVM_BUG_ON() is redundant since all error paths in TDX also do a
KVM_BUG_ON().

Opportunistically pass the spte instead of the pfn, as the API is clearly
about removing an spte.

Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  4 ++--
 arch/x86/kvm/mmu/tdp_mmu.c      |  8 ++------
 arch/x86/kvm/vmx/tdx.c          | 17 ++++++++---------
 3 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 48598d017d6f..b5867f8fe6ce 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1855,8 +1855,8 @@ struct kvm_x86_ops {
 				 void *external_spt);
 
 	/* Update external page table from spte getting removed, and flush TLB. */
-	int (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
-				    kvm_pfn_t pfn_for_gfn);
+	void (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
+				     u64 mirror_spte);
 
 	bool (*has_wbinvd_exit)(void);
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index e735d2f8367b..e1a96e9ea1bb 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -362,9 +362,6 @@ static void tdp_mmu_unlink_sp(struct kvm *kvm, struct kvm_mmu_page *sp)
 static void remove_external_spte(struct kvm *kvm, gfn_t gfn, u64 old_spte,
 				 int level)
 {
-	kvm_pfn_t old_pfn = spte_to_pfn(old_spte);
-	int ret;
-
 	/*
 	 * External (TDX) SPTEs are limited to PG_LEVEL_4K, and external
 	 * PTs are removed in a special order, involving free_external_spt().
@@ -377,9 +374,8 @@ static void remove_external_spte(struct kvm *kvm, gfn_t gfn, u64 old_spte,
 
 	/* Zapping leaf spte is allowed only when write lock is held. */
 	lockdep_assert_held_write(&kvm->mmu_lock);
-	/* Because write lock is held, operation should success. */
-	ret = kvm_x86_call(remove_external_spte)(kvm, gfn, level, old_pfn);
-	KVM_BUG_ON(ret, kvm);
+
+	kvm_x86_call(remove_external_spte)(kvm, gfn, level, old_spte);
 }
 
 /**
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index abea9b3d08cf..7ab67ad83677 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1806,12 +1806,12 @@ static int tdx_sept_free_private_spt(struct kvm *kvm, gfn_t gfn,
 	return tdx_reclaim_page(virt_to_page(private_spt));
 }
 
-static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
-					enum pg_level level, kvm_pfn_t pfn)
+static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
+					 enum pg_level level, u64 mirror_spte)
 {
+	struct page *page = pfn_to_page(spte_to_pfn(mirror_spte));
 	int tdx_level = pg_level_to_tdx_sept_level(level);
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-	struct page *page = pfn_to_page(pfn);
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 err, entry, level_state;
 	int ret;
@@ -1822,15 +1822,15 @@ static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	 * there can't be anything populated in the private EPT.
 	 */
 	if (KVM_BUG_ON(!is_hkid_assigned(to_kvm_tdx(kvm)), kvm))
-		return -EIO;
+		return;
 
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
-		return -EIO;
+		return;
 
 	ret = tdx_sept_zap_private_spte(kvm, gfn, level, page);
 	if (ret <= 0)
-		return ret;
+		return;
 
 	/*
 	 * TDX requires TLB tracking before dropping private page.  Do
@@ -1859,17 +1859,16 @@ static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 
 	if (KVM_BUG_ON(err, kvm)) {
 		pr_tdx_error_2(TDH_MEM_PAGE_REMOVE, err, entry, level_state);
-		return -EIO;
+		return;
 	}
 
 	err = tdh_phymem_page_wbinvd_hkid((u16)kvm_tdx->hkid, page);
 	if (KVM_BUG_ON(err, kvm)) {
 		pr_tdx_error(TDH_PHYMEM_PAGE_WBINVD, err);
-		return -EIO;
+		return;
 	}
 
 	tdx_quirk_reset_page(page);
-	return 0;
 }
 
 void tdx_deliver_interrupt(struct kvm_lapic *apic, int delivery_mode,
-- 
2.51.1.930.gacf6e81ea2-goog


