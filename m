Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB925373AE2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 14:16:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZwfR3m5Wz30CY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 22:15:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SXSIIPse;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SXSIIPse; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZwdw0JPQz2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 22:15:29 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id gj14so696281pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 May 2021 05:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oyHwnIbZLLevfNDzdT6CM1DYrT1P/eF7j4L5Cf+qIR4=;
 b=SXSIIPseqld8EsKpB9fNO9vdeGXr/v8noETf6vr642IHwFrh+spYCo9atcasz023yS
 qVySb6P9Rie9BqVrrHATGQ9EatZvDd6J12fGDf944ukVwjuZXIWPZIvwkD0LC7kAM+03
 aTZBk6o02Zaxp5+pSZ471MByxYyjc3/h4fj6C1dO10L0Jk6e2zsID1tuuoIBvIgJrkk9
 9Tqok7EnUvdb0Kg4cj8GnzYuGcZ6il4/WoqmPmIADolprN+RSdPhML+S9G3SknGuVeZm
 crO5+UMTC5IW7UvqqR1KRd5ZaRUaIiIpBBzx0WaMxG7Ij91x1/Nw+8OcCNTLNhKrRHnB
 qD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oyHwnIbZLLevfNDzdT6CM1DYrT1P/eF7j4L5Cf+qIR4=;
 b=cAVMyGlWGkGAfVX6cB0L+Y0/NE8Z0JraQ6cNz88QUXEC9/fNSoKmQcmHdNww5QIxe+
 SWRPpAL0bKZb/9wdX1NiAHrdblTfpD/s7ZZbnHr9idbAvoSPV0i40Iw5qOlLhqBFuNui
 JLAJIDuR87iExmjpMo64NSBVLCL2n43kAREdLdhYeBNMNxOTVSnRoVwN8A8NmlPwCMi6
 J3bdu0Utr5S5QTnXFEzY0xQ9l973rET3P08VizYp8p2qwPYLzp0LRGhX+RhUO6NAn06T
 6NUwZknrgtU6TiHAgAaldzjoXIpCidKMH8vOXnJAMjgNjWMc1NQOuSWJP0+L1ZIifzSR
 iv5A==
X-Gm-Message-State: AOAM5302D+CBBml0yrYWJaY8bpOER1PWwIA8QdtzPEpEuaJQIB5reo6f
 ecqNS0uQueushQU1tcvGBoQ=
X-Google-Smtp-Source: ABdhPJwqGY80yo9FMB+w8ED2zdJKVQ2H2OOCk9+HBaaFhnPzYsKRiWudVo7ZrYUfKFfCx45R6y5zTg==
X-Received: by 2002:a17:902:8b86:b029:e5:bef6:56b0 with SMTP id
 ay6-20020a1709028b86b02900e5bef656b0mr30448266plb.76.1620216926016; 
 Wed, 05 May 2021 05:15:26 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id cv24sm14655694pjb.7.2021.05.05.05.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 05:15:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH] KVM: PPC: Book3S HV: Fix conversion to gfn-based MMU notifier
 callbacks
Date: Wed,  5 May 2021 22:15:09 +1000
Message-Id: <20210505121509.1470207-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>,
 Nicholas Piggin <npiggin@gmail.com>, Bharata B Rao <bharata@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit b1c5356e873c ("KVM: PPC: Convert to the gfn-based MMU notifier
callbacks") causes unmap_gfn_range and age_gfn callbacks to only work
on the first gfn in the range. It also makes the aging callbacks call
into both radix and hash aging functions for radix guests. Fix this.

Add warnings for the single-gfn calls that have been converted to range
callbacks, in case they ever receieve ranges greater than 1.

Fixes: b1c5356e873c ("KVM: PPC: Convert to the gfn-based MMU notifier callbacks")
Reported-by: Bharata B Rao <bharata@linux.ibm.com>
Tested-by: Bharata B Rao <bharata@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
The e500 change in that commit also looks suspicious, why is it okay
to remove kvm_flush_remote_tlbs() there? Also is the the change from
returning false to true intended?

Thanks,
Nick

 arch/powerpc/include/asm/kvm_book3s.h  |  2 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c    | 46 ++++++++++++++++++--------
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  5 ++-
 3 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index a6e9a5585e61..e6b53c6e21e3 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -210,7 +210,7 @@ extern void kvmppc_free_pgtable_radix(struct kvm *kvm, pgd_t *pgd,
 				      unsigned int lpid);
 extern int kvmppc_radix_init(void);
 extern void kvmppc_radix_exit(void);
-extern bool kvm_unmap_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
+extern void kvm_unmap_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
 			    unsigned long gfn);
 extern bool kvm_age_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
 			  unsigned long gfn);
diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index b7bd9ca040b8..2d9193cd73be 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -795,7 +795,7 @@ static void kvmppc_unmap_hpte(struct kvm *kvm, unsigned long i,
 	}
 }
 
-static bool kvm_unmap_rmapp(struct kvm *kvm, struct kvm_memory_slot *memslot,
+static void kvm_unmap_rmapp(struct kvm *kvm, struct kvm_memory_slot *memslot,
 			    unsigned long gfn)
 {
 	unsigned long i;
@@ -829,15 +829,21 @@ static bool kvm_unmap_rmapp(struct kvm *kvm, struct kvm_memory_slot *memslot,
 		unlock_rmap(rmapp);
 		__unlock_hpte(hptep, be64_to_cpu(hptep[0]));
 	}
-	return false;
 }
 
 bool kvm_unmap_gfn_range_hv(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	if (kvm_is_radix(kvm))
-		return kvm_unmap_radix(kvm, range->slot, range->start);
+	gfn_t gfn;
+
+	if (kvm_is_radix(kvm)) {
+		for (gfn = range->start; gfn < range->end; gfn++)
+			kvm_unmap_radix(kvm, range->slot, gfn);
+	} else {
+		for (gfn = range->start; gfn < range->end; gfn++)
+			kvm_unmap_rmapp(kvm, range->slot, range->start);
+	}
 
-	return kvm_unmap_rmapp(kvm, range->slot, range->start);
+	return false;
 }
 
 void kvmppc_core_flush_memslot_hv(struct kvm *kvm,
@@ -924,10 +930,18 @@ static bool kvm_age_rmapp(struct kvm *kvm, struct kvm_memory_slot *memslot,
 
 bool kvm_age_gfn_hv(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	if (kvm_is_radix(kvm))
-		kvm_age_radix(kvm, range->slot, range->start);
+	gfn_t gfn;
+	bool ret = false;
 
-	return kvm_age_rmapp(kvm, range->slot, range->start);
+	if (kvm_is_radix(kvm)) {
+		for (gfn = range->start; gfn < range->end; gfn++)
+			ret |= kvm_age_radix(kvm, range->slot, gfn);
+	} else {
+		for (gfn = range->start; gfn < range->end; gfn++)
+			ret |= kvm_age_rmapp(kvm, range->slot, gfn);
+	}
+
+	return ret;
 }
 
 static bool kvm_test_age_rmapp(struct kvm *kvm, struct kvm_memory_slot *memslot,
@@ -965,18 +979,24 @@ static bool kvm_test_age_rmapp(struct kvm *kvm, struct kvm_memory_slot *memslot,
 
 bool kvm_test_age_gfn_hv(struct kvm *kvm, struct kvm_gfn_range *range)
 {
-	if (kvm_is_radix(kvm))
-		kvm_test_age_radix(kvm, range->slot, range->start);
+	WARN_ON(range->start + 1 != range->end);
 
-	return kvm_test_age_rmapp(kvm, range->slot, range->start);
+	if (kvm_is_radix(kvm))
+		return kvm_test_age_radix(kvm, range->slot, range->start);
+	else
+		return kvm_test_age_rmapp(kvm, range->slot, range->start);
 }
 
 bool kvm_set_spte_gfn_hv(struct kvm *kvm, struct kvm_gfn_range *range)
 {
+	WARN_ON(range->start + 1 != range->end);
+
 	if (kvm_is_radix(kvm))
-		return kvm_unmap_radix(kvm, range->slot, range->start);
+		kvm_unmap_radix(kvm, range->slot, range->start);
+	else
+		kvm_unmap_rmapp(kvm, range->slot, range->start);
 
-	return kvm_unmap_rmapp(kvm, range->slot, range->start);
+	return false;
 }
 
 static int vcpus_running(struct kvm *kvm)
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index ec4f58fa9f5a..d909c069363e 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -993,7 +993,7 @@ int kvmppc_book3s_radix_page_fault(struct kvm_vcpu *vcpu,
 }
 
 /* Called with kvm->mmu_lock held */
-bool kvm_unmap_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
+void kvm_unmap_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
 		     unsigned long gfn)
 {
 	pte_t *ptep;
@@ -1002,14 +1002,13 @@ bool kvm_unmap_radix(struct kvm *kvm, struct kvm_memory_slot *memslot,
 
 	if (kvm->arch.secure_guest & KVMPPC_SECURE_INIT_DONE) {
 		uv_page_inval(kvm->arch.lpid, gpa, PAGE_SHIFT);
-		return false;
+		return;
 	}
 
 	ptep = find_kvm_secondary_pte(kvm, gpa, &shift);
 	if (ptep && pte_present(*ptep))
 		kvmppc_unmap_pte(kvm, ptep, gpa, shift, memslot,
 				 kvm->arch.lpid);
-	return false;
 }
 
 /* Called with kvm->mmu_lock held */
-- 
2.23.0

