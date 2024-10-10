Return-Path: <linuxppc-dev+bounces-2044-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A003899905A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:31:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWm3H8Gz3brC;
	Fri, 11 Oct 2024 05:27:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584820;
	cv=none; b=XU6shOxiGj0j161GAj1lwwYl5C1Iqji+6GH9NwblFz5fAwieSU6VHnzkjyEdIVvWFfHzp/OQfy6xckv8nL02COmK+derlgGCUMk9PM/+nuB8N/3mEAMpzuZyk3qz2SBOfNlzrNZUqBNVpmeYeJo/msbK8tDVBRIwmhC6gpvESgY3CDyqHNdnNgvf5m78wr3WZThQq98Xw1/wrXoP26OCCGnB8UXvroS95Dhs72l6xk2mbXe1BVcWiKPq/c4o5cZp4T3G4n7sw287F/iPujTpCtPdNve/Uqqjvxqbnq61gofoL3FAMyyMPlsBJNR6WHbcp1haCxCNG2P5XQYKI2DKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584820; c=relaxed/relaxed;
	bh=OPPvMTYiUGb6pAXW02Q14XiUF2+KvArosM2sRK6VjAA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n3Fixg9FzgGh4IEuC6u0D7lRrI2okP3kxdAF5PvhwjSZXKT8qanHUjBVIqZUdIJ4189rJyFZYKOqcKCVA4IWLCu6IrbBlcAJjtwfOTIynsyY+OwcL91uX55GMglz5PxODutnBzMjoWqkAwcOqXMH+35qiKQKML7TM6XugKtTiPtwf658O7RaSYMjs+BwTX/hCYG6Yx0q4cKs5ZoGACHLDfr1/53DzEtUYx17TOQY/iR+eKOFcSz2sYrRmZNKTHIrGNPPd4GhAmNIXELZZ+qSmkWbAeZgqSOOtserwdbLqRFxHmVVUADwSXMeM97j23fY1gvlIYaSw3t0Gg79EDoleg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=30pv36Rn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3crwizwykdao2okxtmqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=30pv36Rn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3crwizwykdao2okxtmqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWl48J2z3cPW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:59 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-70ac9630e3aso1196101a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584818; x=1729189618; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OPPvMTYiUGb6pAXW02Q14XiUF2+KvArosM2sRK6VjAA=;
        b=30pv36RnGgds0uWQpCJj/fKCgye8IiNTS3cNlenKHMhTtggAJ6/QyvIJOH9gzNYTlG
         TXYlgfJv1JI5Sm72TI392eS7tYFkjQo2xvjK/AbruZqcdYgM/dQzyQ2EpGdHCr8DWuAm
         bF5gD37r2VZzYrUUObgyI/RLCRes5JitI/NSw1GVhc2yjsweq5Hq8NEIoQVJvshN6GbD
         rant3lCc8JxH66GOeTSSeUX4hpo5SjyacJs2P4uLwKWKm6yBNWvIxpkEeYKzW14PStTa
         Dp6dhfC8xeSckQUFK7Kb0BeUg+tcMnr/7kkoFSBdVwQC/RG/fsQaq/BB2k2G0dVxCQnQ
         dDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584818; x=1729189618;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OPPvMTYiUGb6pAXW02Q14XiUF2+KvArosM2sRK6VjAA=;
        b=LECv1CgSJzpBK0Jqpg4m0KWd9yz0ujzHrH/KZUVsJ/I4PJe69gOLadXvMWLolS8ioL
         FN36mUomZ/iLLx1j0uXG9mzr9boBt07OeKxgTGDR1hGUSa6NjEcnigJK77n7OrTLYO3f
         zowJEZ5U8K+lXJa1a7AgucPVVz4DTeQ/C+sAKEXcIcMkvLSpcmwSpNzTQmHYYfpb7h2r
         rxWDh0PtsDfIekSFFF/cIEWbCCidiXDDRu5DBpCmZJxPs2rsDOhdcArwgWFiSV2gl44n
         fbgJJaRYTWE9cjJmOVPYHSogjulCEZASXia5W8GBco2DLh+97ZTTlTOFRFinjBYN9H3H
         UXkg==
X-Forwarded-Encrypted: i=1; AJvYcCUFRRjH/mP8rivRxXKidZTgrcPn1luEg5YTWorKuCmRmPSoj5zm56s1pxNnNmXINTCaXnqgrI8xrBwf3aQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzhB/SwAPbZAvi5R/ebT5HZ0ooHNx9rtlHGOoMTC4D3OlIeutaZ
	NiPeiazhbAw33CwlntptmE1IfmMdPJrgGhA4iRyWJebuE+UySlLNN6mLRIF31McTY7vkIdYAe/E
	R9Q==
X-Google-Smtp-Source: AGHT+IHVZkXcNH8eDb3GIQubykYaXKWHdrpGe/zHTLQHIjPMwQpAN0ra/QncFunLfkL/hgYZuPxk0qgLkH8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:903:2343:b0:20c:747d:ec15 with SMTP id
 d9443c01a7336-20c747df618mr290175ad.1.1728584817934; Thu, 10 Oct 2024
 11:26:57 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:01 -0700
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
Message-ID: <20241010182427.1434605-60-seanjc@google.com>
Subject: [PATCH v13 59/85] KVM: RISC-V: Use kvm_faultin_pfn() when mapping
 pfns into the guest
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
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Convert RISC-V to __kvm_faultin_pfn()+kvm_release_faultin_page(), which
are new APIs to consolidate arch code and provide consistent behavior
across all KVM architectures.

Opportunisticaly fix a s/priort/prior typo in the related comment.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 2e9aee518142..e11ad1b616f3 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -601,6 +601,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 	bool logging = (memslot->dirty_bitmap &&
 			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
 	unsigned long vma_pagesize, mmu_seq;
+	struct page *page;
 
 	/* We need minimum second+third level pages */
 	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
@@ -631,7 +632,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 
 	/*
 	 * Read mmu_invalidate_seq so that KVM can detect if the results of
-	 * vma_lookup() or gfn_to_pfn_prot() become stale priort to acquiring
+	 * vma_lookup() or __kvm_faultin_pfn() become stale prior to acquiring
 	 * kvm->mmu_lock.
 	 *
 	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
@@ -647,7 +648,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		return -EFAULT;
 	}
 
-	hfn = gfn_to_pfn_prot(kvm, gfn, is_write, &writable);
+	hfn = kvm_faultin_pfn(vcpu, gfn, is_write, &writable, &page);
 	if (hfn == KVM_PFN_ERR_HWPOISON) {
 		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
 				vma_pageshift, current);
@@ -681,11 +682,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
-	if ((!ret || ret == -EEXIST) && writable)
-		kvm_release_pfn_dirty(hfn);
-	else
-		kvm_release_pfn_clean(hfn);
-
+	kvm_release_faultin_page(kvm, page, ret && ret != -EEXIST, writable);
 	spin_unlock(&kvm->mmu_lock);
 	return ret;
 }
-- 
2.47.0.rc1.288.g06298d1525-goog


