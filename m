Return-Path: <linuxppc-dev+bounces-2041-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D4B999052
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:31:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWg1G39z3cN4;
	Fri, 11 Oct 2024 05:26:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584815;
	cv=none; b=d+N2e2lAr53bI8nGauf6cmeqYm5g5OL8jFbCIm28MXGQZuM/PJIcMf7e3NN3H3Yi/rlV7I88zSctRLuNvIxaIki6wbon2Tu90lY++UgKMJsxhFPKmc3ynKkucWgL2zSEft6hQXiPZM0rdYTh4VileEwWcZWsJf9lOxvQ6JKOK4eo/tUOc0+fBvo85R6yVsuNlhT4GLv2GbvmWOhTrv11jhaiQ52zNjHYrgvnmLdHzViVzZoFn7Skm5H2oQfp836J3CF8Kp8YdcTB/io6aeFVWpeGVM/xyKLOdK6sJNrJICPDMHn3dZZ6O+1VW3oLMCeaySR++skNgJsyGI9FwiUjFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584815; c=relaxed/relaxed;
	bh=L6S7ecEpHeP2pNYK74CcyfNjVxKIOVPI1u0giMU3AdU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ln+coRADVMXEHwtifIHNOjEOBKtq428M9QKP0GfopinEaEvQsBvxlRvmG4GsevCt80zb6VsdsdAHfBux5XaivNl9om1T11nxXf27k1eg6GSVpVKErMrZY1zi6sW/4p16vF83FugxT4Ue+Wvxi2bO3jWMz7IxONdFKn2K4cPEzrGVIIeVyRmbkdrEjcl1qWj0goqfjlnbcoU6Z0+FRMrfDLr6RcAi3ihIn+HileVDtqHTKrHWRILdDmRRa1Do5Vknqw16lxGz79yBlqTqxF2W8+2j+p2E4MBrNqI4DoxV5ZTlbhCR7EifEHA0dyxAetr8sdGEkgcTYsp3EpVsnfW2mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0G0lBz3f; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3bbwizwykdauxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=0G0lBz3f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3bbwizwykdauxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWf1rgsz3brC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:54 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2e2c4154dcbso1513318a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584812; x=1729189612; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6S7ecEpHeP2pNYK74CcyfNjVxKIOVPI1u0giMU3AdU=;
        b=0G0lBz3fKNA921N7jbmTCC75+Fj1tn7FqLURq1pVh8KQnzPykbM4JS93K6UoXSaXyN
         R7EPHgDwemT15dKBl+Au9pRoUQouRyoWZW0zWPpeFILVXudfhN8clKBem6ChbfwZKeqU
         OPnAeJGF8d2qgMhF58GoNcMR+2vv/fiDTcH89Adx78C1SHlSsjtid3lV/Gv04Fjpo8sK
         XKDKc2UOB9wkCVebmb3pSBaj747qiqXtzNvGoXaUAbXhCy4AtteHV32+Kpc4L+xVF/0K
         5GN2mft14iTi2rrJMa3dlk4TqVYV0AACRObnPoUGGnyKE3GxhJHzDrIF4lnnz/eV3y7Y
         Aygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584812; x=1729189612;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L6S7ecEpHeP2pNYK74CcyfNjVxKIOVPI1u0giMU3AdU=;
        b=Fpcs9Q8U2+OGnhjFFOzz9dNGrXq1oahR/+gFaEpsxhQ2Izfs1wOAzexMXi90tM8HFh
         ec7orYjUn4CBTuR01ewqWu8Q5gfzvbMNSGsr9s1S4/Qub2KpFRfoiQnuSX63WbHZS+Ww
         /iK6rHOm3JnImmsl0SY6uw7TI+Yd7tj0ylOnIbQPWyWxTW73FH95i4xnBS1QjM+bP9IX
         /8cSwZ23feMPXcMwwz5CPuNfm9kemXy93vjpJTo9GBs3vvROOGH59DwLKY3CjxAF1REA
         wtLREBWSY2YsZAMdu4YusHXx0iWkrTukRSZaYld90mD2an5fC2HHrbpOVMmEYi56zupO
         U1dg==
X-Forwarded-Encrypted: i=1; AJvYcCV40NA5yhHkGmmpPF/STQCf9ZJ+gndsH8DsdP/mTrhEt07xzz+jCWHgIic0p3Uy8dKtURdnn6o5FXYCq+M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywd4GypsFsTY16kDrLsdqPiIqXAYLAI1Px80psBrdYZt9ZSn6Vx
	xP2pXTe+N6tZ19bUdvklZ+RB6yks/vxaMXeazb0/TaDJtAL7y89bskpynb5wWaRYsUlhxAeNF14
	mUA==
X-Google-Smtp-Source: AGHT+IFNqFi+zU38KeaNCnXXdZA3xW66mqPsBP1LkkibZO//JxtU2HWKMaWXgt9tHH1pSDOFY+ZWY6Gk4GE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90b:4f4b:b0:2d8:bf47:947c with SMTP id
 98e67ed59e1d1-2e2f0c456f8mr35a91.3.1728584812033; Thu, 10 Oct 2024 11:26:52
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:58 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-57-seanjc@google.com>
Subject: [PATCH v13 56/85] KVM: arm64: Use __kvm_faultin_pfn() to handle
 memory aborts
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Convert arm64 to use __kvm_faultin_pfn()+kvm_release_faultin_page().
Three down, six to go.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index ecc6c2b56c43..4054356c9712 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1439,6 +1439,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys=
_addr_t fault_ipa,
 	long vma_pagesize, fault_granule;
 	enum kvm_pgtable_prot prot =3D KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
+	struct page *page;
=20
 	if (fault_is_perm)
 		fault_granule =3D kvm_vcpu_trap_get_perm_fault_granule(vcpu);
@@ -1560,7 +1561,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys=
_addr_t fault_ipa,
=20
 	/*
 	 * Read mmu_invalidate_seq so that KVM can detect if the results of
-	 * vma_lookup() or __gfn_to_pfn_memslot() become stale prior to
+	 * vma_lookup() or __kvm_faultin_pfn() become stale prior to
 	 * acquiring kvm->mmu_lock.
 	 *
 	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
@@ -1569,8 +1570,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys=
_addr_t fault_ipa,
 	mmu_seq =3D vcpu->kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
=20
-	pfn =3D __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-				   write_fault, &writable);
+	pfn =3D __kvm_faultin_pfn(memslot, gfn, write_fault ? FOLL_WRITE : 0,
+				&writable, &page);
 	if (pfn =3D=3D KVM_PFN_ERR_HWPOISON) {
 		kvm_send_hwpoison_signal(hva, vma_shift);
 		return 0;
@@ -1583,7 +1584,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys=
_addr_t fault_ipa,
 		 * If the page was identified as device early by looking at
 		 * the VMA flags, vma_pagesize is already representing the
 		 * largest quantity we can map.  If instead it was mapped
-		 * via gfn_to_pfn_prot(), vma_pagesize is set to PAGE_SIZE
+		 * via __kvm_faultin_pfn(), vma_pagesize is set to PAGE_SIZE
 		 * and must not be upgraded.
 		 *
 		 * In both cases, we don't let transparent_hugepage_adjust()
@@ -1692,11 +1693,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phy=
s_addr_t fault_ipa,
 	}
=20
 out_unlock:
-	if (writable && !ret)
-		kvm_release_pfn_dirty(pfn);
-	else
-		kvm_release_pfn_clean(pfn);
-
+	kvm_release_faultin_page(kvm, page, !!ret, writable);
 	read_unlock(&kvm->mmu_lock);
=20
 	/* Mark the page dirty only if the fault is handled successfully */
--=20
2.47.0.rc1.288.g06298d1525-goog


