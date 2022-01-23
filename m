Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3389B49716A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 13:04:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JhWxG0WFWz3cD3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 23:04:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l/OS6CoX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=l/OS6CoX; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JhWsn5sScz30Qb
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 23:01:01 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 h20-20020a17090adb9400b001b518bf99ffso10392820pjv.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 04:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Kxgn5+TapNg5dOQRMAKOfi3fxVe/2I5d4BMvUjIArI=;
 b=l/OS6CoXi08bRkcXIeIJZ1VicuSsFN9GgcZa0UhL9G2e96oTnmp6BzmprNveIWv1gh
 Z0KAWUyjVgfJYLQAhdJuPl1wZZ85pRTKjs5qaJfCB8JsiYT7ZwMue92Et+R8Ds5rWw91
 1evdM3UBbEtR2NP2nNMAAsYphMpYgoCg8gE/zd/dto9+D2h/IilDz3i6Tw/tk28VXmPJ
 lKC1jkRsPADwq6B2ICDF6+P8Zfx71ZFpxGMd2IQCbXuL5sT0xsm64ucoZT2JKfm7b490
 zBDWWMP9O1bPwD/cnFVsEyGFTFNQfASEBSLLRsvmVIl5mTwQLU4UacpHeAVNZZQ9jJiK
 ea2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Kxgn5+TapNg5dOQRMAKOfi3fxVe/2I5d4BMvUjIArI=;
 b=ZSxCSshme7MZg4F1gcahjh/uToDp72EHcra1OqzPLlRJ46MkdKZ1cv7IiGiTjO3RKR
 VUTvb3kz95s6aUVtEHphrwjF6cadoburOQLt0jNo2VNsRL1yX9xI+TjnR7aH0p/moRsT
 zPepFz7cgQklXeNpnAHWT5d7W0ZVRoEAa4dzJ8jJh9RwzWTForMtca8lhx1xwSbh+wAU
 EsEpCqmrc6Kyn/srnHVApVezmL9myeIb4+LExwl2F5x5EvtMn6FWxsppm9NkgDATSTiT
 gMjTsYgDLAIJ574CyDb+vGW8W6yk7SyAkmv00B8qP66rsz7WZQhkiVktUHxAmQJgL9gp
 /PFQ==
X-Gm-Message-State: AOAM533Ld9eTjHHHPbD2PjLVH2jKLsXIS4teXldPbm9nxE2VeZJLCDkq
 mJrAjs4cHUtG6XXmd8ZgMrwdhpuZOVs=
X-Google-Smtp-Source: ABdhPJxi1jyXWWual15fPXCG1GTAuhnHcXJjARp0v8RWi4dxwnovmXrKVxA8V2jN3JrbNvcC+uxhag==
X-Received: by 2002:a17:902:b10e:b0:14a:4a48:cac5 with SMTP id
 q14-20020a170902b10e00b0014a4a48cac5mr10991461plr.16.1642939259496; 
 Sun, 23 Jan 2022 04:00:59 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id kx11sm9608213pjb.1.2022.01.23.04.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 04:00:59 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/6] KVM: PPC: Book3S HV Nested: Change nested guest lookup to
 use idr
Date: Sun, 23 Jan 2022 22:00:41 +1000
Message-Id: <20220123120043.3586018-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220123120043.3586018-1-npiggin@gmail.com>
References: <20220123120043.3586018-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This removes the fixed sized kvm->arch.nested_guests array.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_host.h |   3 +-
 arch/powerpc/kvm/book3s_hv_nested.c | 110 +++++++++++++++-------------
 2 files changed, 59 insertions(+), 54 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index d9bf60bf0816..5fd0564e5c94 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -326,8 +326,7 @@ struct kvm_arch {
 	struct list_head uvmem_pfns;
 	struct mutex mmu_setup_lock;	/* nests inside vcpu mutexes */
 	u64 l1_ptcr;
-	int max_nested_lpid;
-	struct kvm_nested_guest *nested_guests[KVM_MAX_NESTED_GUESTS];
+	struct idr kvm_nested_guest_idr;
 	/* This array can grow quite large, keep it at the end */
 	struct kvmppc_vcore *vcores[KVM_MAX_VCORES];
 #endif
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 9d373f8963ee..1eff969b095c 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -521,11 +521,6 @@ static void kvmhv_set_nested_ptbl(struct kvm_nested_guest *gp)
 	kvmhv_set_ptbl_entry(gp->shadow_lpid, dw0, gp->process_table);
 }
 
-void kvmhv_vm_nested_init(struct kvm *kvm)
-{
-	kvm->arch.max_nested_lpid = -1;
-}
-
 /*
  * Handle the H_SET_PARTITION_TABLE hcall.
  * r4 = guest real address of partition table + log_2(size) - 12
@@ -660,6 +655,35 @@ static void kvmhv_update_ptbl_cache(struct kvm_nested_guest *gp)
 	kvmhv_set_nested_ptbl(gp);
 }
 
+void kvmhv_vm_nested_init(struct kvm *kvm)
+{
+	idr_init(&kvm->arch.kvm_nested_guest_idr);
+}
+
+static struct kvm_nested_guest *__find_nested(struct kvm *kvm, int lpid)
+{
+	return idr_find(&kvm->arch.kvm_nested_guest_idr, lpid);
+}
+
+static bool __prealloc_nested(struct kvm *kvm, int lpid)
+{
+	if (idr_alloc(&kvm->arch.kvm_nested_guest_idr,
+				NULL, lpid, lpid + 1, GFP_KERNEL) != lpid)
+		return false;
+	return true;
+}
+
+static void __add_nested(struct kvm *kvm, int lpid, struct kvm_nested_guest *gp)
+{
+	if (idr_replace(&kvm->arch.kvm_nested_guest_idr, gp, lpid))
+		WARN_ON(1);
+}
+
+static void __remove_nested(struct kvm *kvm, int lpid)
+{
+	idr_remove(&kvm->arch.kvm_nested_guest_idr, lpid);
+}
+
 static struct kvm_nested_guest *kvmhv_alloc_nested(struct kvm *kvm, unsigned int lpid)
 {
 	struct kvm_nested_guest *gp;
@@ -720,13 +744,8 @@ static void kvmhv_remove_nested(struct kvm_nested_guest *gp)
 	long ref;
 
 	spin_lock(&kvm->mmu_lock);
-	if (gp == kvm->arch.nested_guests[lpid]) {
-		kvm->arch.nested_guests[lpid] = NULL;
-		if (lpid == kvm->arch.max_nested_lpid) {
-			while (--lpid >= 0 && !kvm->arch.nested_guests[lpid])
-				;
-			kvm->arch.max_nested_lpid = lpid;
-		}
+	if (gp == __find_nested(kvm, lpid)) {
+		__remove_nested(kvm, lpid);
 		--gp->refcnt;
 	}
 	ref = gp->refcnt;
@@ -743,24 +762,22 @@ static void kvmhv_remove_nested(struct kvm_nested_guest *gp)
  */
 void kvmhv_release_all_nested(struct kvm *kvm)
 {
-	int i;
+	int lpid;
 	struct kvm_nested_guest *gp;
 	struct kvm_nested_guest *freelist = NULL;
 	struct kvm_memory_slot *memslot;
 	int srcu_idx, bkt;
 
 	spin_lock(&kvm->mmu_lock);
-	for (i = 0; i <= kvm->arch.max_nested_lpid; i++) {
-		gp = kvm->arch.nested_guests[i];
-		if (!gp)
-			continue;
-		kvm->arch.nested_guests[i] = NULL;
+	idr_for_each_entry(&kvm->arch.kvm_nested_guest_idr, gp, lpid) {
+		__remove_nested(kvm, lpid);
 		if (--gp->refcnt == 0) {
 			gp->next = freelist;
 			freelist = gp;
 		}
 	}
-	kvm->arch.max_nested_lpid = -1;
+	idr_destroy(&kvm->arch.kvm_nested_guest_idr);
+	/* idr is empty and may be reused at this point */
 	spin_unlock(&kvm->mmu_lock);
 	while ((gp = freelist) != NULL) {
 		freelist = gp->next;
@@ -797,7 +814,7 @@ struct kvm_nested_guest *kvmhv_get_nested(struct kvm *kvm, int l1_lpid,
 		return NULL;
 
 	spin_lock(&kvm->mmu_lock);
-	gp = kvm->arch.nested_guests[l1_lpid];
+	gp = __find_nested(kvm, l1_lpid);
 	if (gp)
 		++gp->refcnt;
 	spin_unlock(&kvm->mmu_lock);
@@ -808,17 +825,19 @@ struct kvm_nested_guest *kvmhv_get_nested(struct kvm *kvm, int l1_lpid,
 	newgp = kvmhv_alloc_nested(kvm, l1_lpid);
 	if (!newgp)
 		return NULL;
+
+	if (!__prealloc_nested(kvm, l1_lpid)) {
+		kvmhv_release_nested(newgp);
+		return NULL;
+	}
+
 	spin_lock(&kvm->mmu_lock);
-	if (kvm->arch.nested_guests[l1_lpid]) {
-		/* someone else beat us to it */
-		gp = kvm->arch.nested_guests[l1_lpid];
-	} else {
-		kvm->arch.nested_guests[l1_lpid] = newgp;
+	gp = __find_nested(kvm, l1_lpid);
+	if (!gp) {
+		__add_nested(kvm, l1_lpid, newgp);
 		++newgp->refcnt;
 		gp = newgp;
 		newgp = NULL;
-		if (l1_lpid > kvm->arch.max_nested_lpid)
-			kvm->arch.max_nested_lpid = l1_lpid;
 	}
 	++gp->refcnt;
 	spin_unlock(&kvm->mmu_lock);
@@ -841,20 +860,13 @@ void kvmhv_put_nested(struct kvm_nested_guest *gp)
 		kvmhv_release_nested(gp);
 }
 
-static struct kvm_nested_guest *kvmhv_find_nested(struct kvm *kvm, int lpid)
-{
-	if (lpid > kvm->arch.max_nested_lpid)
-		return NULL;
-	return kvm->arch.nested_guests[lpid];
-}
-
 pte_t *find_kvm_nested_guest_pte(struct kvm *kvm, unsigned long lpid,
 				 unsigned long ea, unsigned *hshift)
 {
 	struct kvm_nested_guest *gp;
 	pte_t *pte;
 
-	gp = kvmhv_find_nested(kvm, lpid);
+	gp = __find_nested(kvm, lpid);
 	if (!gp)
 		return NULL;
 
@@ -960,7 +972,7 @@ static void kvmhv_remove_nest_rmap(struct kvm *kvm, u64 n_rmap,
 
 	gpa = n_rmap & RMAP_NESTED_GPA_MASK;
 	lpid = (n_rmap & RMAP_NESTED_LPID_MASK) >> RMAP_NESTED_LPID_SHIFT;
-	gp = kvmhv_find_nested(kvm, lpid);
+	gp = __find_nested(kvm, lpid);
 	if (!gp)
 		return;
 
@@ -1152,16 +1164,13 @@ static void kvmhv_emulate_tlbie_all_lpid(struct kvm_vcpu *vcpu, int ric)
 {
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_nested_guest *gp;
-	int i;
+	int lpid;
 
 	spin_lock(&kvm->mmu_lock);
-	for (i = 0; i <= kvm->arch.max_nested_lpid; i++) {
-		gp = kvm->arch.nested_guests[i];
-		if (gp) {
-			spin_unlock(&kvm->mmu_lock);
-			kvmhv_emulate_tlbie_lpid(vcpu, gp, ric);
-			spin_lock(&kvm->mmu_lock);
-		}
+	idr_for_each_entry(&kvm->arch.kvm_nested_guest_idr, gp, lpid) {
+		spin_unlock(&kvm->mmu_lock);
+		kvmhv_emulate_tlbie_lpid(vcpu, gp, ric);
+		spin_lock(&kvm->mmu_lock);
 	}
 	spin_unlock(&kvm->mmu_lock);
 }
@@ -1313,7 +1322,7 @@ long do_h_rpt_invalidate_pat(struct kvm_vcpu *vcpu, unsigned long lpid,
 	 * H_ENTER_NESTED call. Since we can't differentiate this case from
 	 * the invalid case, we ignore such flush requests and return success.
 	 */
-	if (!kvmhv_find_nested(vcpu->kvm, lpid))
+	if (!__find_nested(vcpu->kvm, lpid))
 		return H_SUCCESS;
 
 	/*
@@ -1657,15 +1666,12 @@ long int kvmhv_nested_page_fault(struct kvm_vcpu *vcpu)
 
 int kvmhv_nested_next_lpid(struct kvm *kvm, int lpid)
 {
-	int ret = -1;
+	int ret = lpid + 1;
 
 	spin_lock(&kvm->mmu_lock);
-	while (++lpid <= kvm->arch.max_nested_lpid) {
-		if (kvm->arch.nested_guests[lpid]) {
-			ret = lpid;
-			break;
-		}
-	}
+	if (!idr_get_next(&kvm->arch.kvm_nested_guest_idr, &ret))
+		ret = -1;
 	spin_unlock(&kvm->mmu_lock);
+
 	return ret;
 }
-- 
2.23.0

