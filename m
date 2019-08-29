Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14555A1439
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 10:57:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JxMP0LdTzDrS5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 18:57:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 46JxG63958zDqTD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 18:53:02 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id E807AAE802FA;
 Thu, 29 Aug 2019 04:52:36 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v3 2/5] KVM: PPC: Book3S: Invalidate multiple TCEs at
 once
Date: Thu, 29 Aug 2019 18:52:49 +1000
Message-Id: <20190829085252.72370-3-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829085252.72370-1-aik@ozlabs.ru>
References: <20190829085252.72370-1-aik@ozlabs.ru>
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
Cc: kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Popple <alistair@popple.id.au>, kvm-ppc@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Invalidating a TCE cache entry for each updated TCE is quite expensive.
This makes use of the new iommu_table_ops::xchg_no_kill()/tce_kill()
callbacks to bring down the time spent in mapping a huge guest DMA window;
roughly 20s to 10s for each guest's 100GB of DMA space.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Acked-by: Paul Mackerras <paulus@ozlabs.org>
---
Changes:
v3:
* fixed the subject line to include "Book3S"
* added "ack" from Paul
---
 arch/powerpc/kvm/book3s_64_vio.c    | 29 +++++++++++++++-------
 arch/powerpc/kvm/book3s_64_vio_hv.c | 38 +++++++++++++++++++++--------
 2 files changed, 48 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index c4b606fe73eb..5834db0a54c6 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -416,7 +416,7 @@ static void kvmppc_clear_tce(struct mm_struct *mm, struct iommu_table *tbl,
 	unsigned long hpa = 0;
 	enum dma_data_direction dir = DMA_NONE;
 
-	iommu_tce_xchg(mm, tbl, entry, &hpa, &dir);
+	iommu_tce_xchg_no_kill(mm, tbl, entry, &hpa, &dir);
 }
 
 static long kvmppc_tce_iommu_mapped_dec(struct kvm *kvm,
@@ -447,7 +447,8 @@ static long kvmppc_tce_iommu_do_unmap(struct kvm *kvm,
 	unsigned long hpa = 0;
 	long ret;
 
-	if (WARN_ON_ONCE(iommu_tce_xchg(kvm->mm, tbl, entry, &hpa, &dir)))
+	if (WARN_ON_ONCE(iommu_tce_xchg_no_kill(kvm->mm, tbl, entry, &hpa,
+					&dir)))
 		return H_TOO_HARD;
 
 	if (dir == DMA_NONE)
@@ -455,7 +456,7 @@ static long kvmppc_tce_iommu_do_unmap(struct kvm *kvm,
 
 	ret = kvmppc_tce_iommu_mapped_dec(kvm, tbl, entry);
 	if (ret != H_SUCCESS)
-		iommu_tce_xchg(kvm->mm, tbl, entry, &hpa, &dir);
+		iommu_tce_xchg_no_kill(kvm->mm, tbl, entry, &hpa, &dir);
 
 	return ret;
 }
@@ -501,7 +502,7 @@ long kvmppc_tce_iommu_do_map(struct kvm *kvm, struct iommu_table *tbl,
 	if (mm_iommu_mapped_inc(mem))
 		return H_TOO_HARD;
 
-	ret = iommu_tce_xchg(kvm->mm, tbl, entry, &hpa, &dir);
+	ret = iommu_tce_xchg_no_kill(kvm->mm, tbl, entry, &hpa, &dir);
 	if (WARN_ON_ONCE(ret)) {
 		mm_iommu_mapped_dec(mem);
 		return H_TOO_HARD;
@@ -579,6 +580,8 @@ long kvmppc_h_put_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
 			ret = kvmppc_tce_iommu_map(vcpu->kvm, stt, stit->tbl,
 					entry, ua, dir);
 
+		iommu_tce_kill(stit->tbl, entry, 1);
+
 		if (ret != H_SUCCESS) {
 			kvmppc_clear_tce(vcpu->kvm->mm, stit->tbl, entry);
 			goto unlock_exit;
@@ -656,13 +659,13 @@ long kvmppc_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 		 */
 		if (get_user(tce, tces + i)) {
 			ret = H_TOO_HARD;
-			goto unlock_exit;
+			goto invalidate_exit;
 		}
 		tce = be64_to_cpu(tce);
 
 		if (kvmppc_tce_to_ua(vcpu->kvm, tce, &ua)) {
 			ret = H_PARAMETER;
-			goto unlock_exit;
+			goto invalidate_exit;
 		}
 
 		list_for_each_entry_lockless(stit, &stt->iommu_tables, next) {
@@ -673,13 +676,17 @@ long kvmppc_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 			if (ret != H_SUCCESS) {
 				kvmppc_clear_tce(vcpu->kvm->mm, stit->tbl,
 						entry);
-				goto unlock_exit;
+				goto invalidate_exit;
 			}
 		}
 
 		kvmppc_tce_put(stt, entry + i, tce);
 	}
 
+invalidate_exit:
+	list_for_each_entry_lockless(stit, &stt->iommu_tables, next)
+		iommu_tce_kill(stit->tbl, entry, npages);
+
 unlock_exit:
 	srcu_read_unlock(&vcpu->kvm->srcu, idx);
 
@@ -718,7 +725,7 @@ long kvmppc_h_stuff_tce(struct kvm_vcpu *vcpu,
 				continue;
 
 			if (ret == H_TOO_HARD)
-				return ret;
+				goto invalidate_exit;
 
 			WARN_ON_ONCE(1);
 			kvmppc_clear_tce(vcpu->kvm->mm, stit->tbl, entry);
@@ -728,6 +735,10 @@ long kvmppc_h_stuff_tce(struct kvm_vcpu *vcpu,
 	for (i = 0; i < npages; ++i, ioba += (1ULL << stt->page_shift))
 		kvmppc_tce_put(stt, ioba >> stt->page_shift, tce_value);
 
-	return H_SUCCESS;
+invalidate_exit:
+	list_for_each_entry_lockless(stit, &stt->iommu_tables, next)
+		iommu_tce_kill(stit->tbl, ioba >> stt->page_shift, npages);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(kvmppc_h_stuff_tce);
diff --git a/arch/powerpc/kvm/book3s_64_vio_hv.c b/arch/powerpc/kvm/book3s_64_vio_hv.c
index b4f20f13b860..ab6eeb8e753e 100644
--- a/arch/powerpc/kvm/book3s_64_vio_hv.c
+++ b/arch/powerpc/kvm/book3s_64_vio_hv.c
@@ -218,13 +218,14 @@ static long kvmppc_rm_ioba_validate(struct kvmppc_spapr_tce_table *stt,
 	return H_SUCCESS;
 }
 
-static long iommu_tce_xchg_rm(struct mm_struct *mm, struct iommu_table *tbl,
+static long iommu_tce_xchg_no_kill_rm(struct mm_struct *mm,
+		struct iommu_table *tbl,
 		unsigned long entry, unsigned long *hpa,
 		enum dma_data_direction *direction)
 {
 	long ret;
 
-	ret = tbl->it_ops->exchange_rm(tbl, entry, hpa, direction);
+	ret = tbl->it_ops->xchg_no_kill(tbl, entry, hpa, direction, true);
 
 	if (!ret && ((*direction == DMA_FROM_DEVICE) ||
 				(*direction == DMA_BIDIRECTIONAL))) {
@@ -240,13 +241,20 @@ static long iommu_tce_xchg_rm(struct mm_struct *mm, struct iommu_table *tbl,
 	return ret;
 }
 
+extern void iommu_tce_kill_rm(struct iommu_table *tbl,
+		unsigned long entry, unsigned long pages)
+{
+	if (tbl->it_ops->tce_kill)
+		tbl->it_ops->tce_kill(tbl, entry, pages, true);
+}
+
 static void kvmppc_rm_clear_tce(struct kvm *kvm, struct iommu_table *tbl,
 		unsigned long entry)
 {
 	unsigned long hpa = 0;
 	enum dma_data_direction dir = DMA_NONE;
 
-	iommu_tce_xchg_rm(kvm->mm, tbl, entry, &hpa, &dir);
+	iommu_tce_xchg_no_kill_rm(kvm->mm, tbl, entry, &hpa, &dir);
 }
 
 static long kvmppc_rm_tce_iommu_mapped_dec(struct kvm *kvm,
@@ -278,7 +286,7 @@ static long kvmppc_rm_tce_iommu_do_unmap(struct kvm *kvm,
 	unsigned long hpa = 0;
 	long ret;
 
-	if (iommu_tce_xchg_rm(kvm->mm, tbl, entry, &hpa, &dir))
+	if (iommu_tce_xchg_no_kill_rm(kvm->mm, tbl, entry, &hpa, &dir))
 		/*
 		 * real mode xchg can fail if struct page crosses
 		 * a page boundary
@@ -290,7 +298,7 @@ static long kvmppc_rm_tce_iommu_do_unmap(struct kvm *kvm,
 
 	ret = kvmppc_rm_tce_iommu_mapped_dec(kvm, tbl, entry);
 	if (ret)
-		iommu_tce_xchg_rm(kvm->mm, tbl, entry, &hpa, &dir);
+		iommu_tce_xchg_no_kill_rm(kvm->mm, tbl, entry, &hpa, &dir);
 
 	return ret;
 }
@@ -336,7 +344,7 @@ static long kvmppc_rm_tce_iommu_do_map(struct kvm *kvm, struct iommu_table *tbl,
 	if (WARN_ON_ONCE_RM(mm_iommu_mapped_inc(mem)))
 		return H_TOO_HARD;
 
-	ret = iommu_tce_xchg_rm(kvm->mm, tbl, entry, &hpa, &dir);
+	ret = iommu_tce_xchg_no_kill_rm(kvm->mm, tbl, entry, &hpa, &dir);
 	if (ret) {
 		mm_iommu_mapped_dec(mem);
 		/*
@@ -417,6 +425,8 @@ long kvmppc_rm_h_put_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
 			ret = kvmppc_rm_tce_iommu_map(vcpu->kvm, stt,
 					stit->tbl, entry, ua, dir);
 
+		iommu_tce_kill_rm(stit->tbl, entry, 1);
+
 		if (ret != H_SUCCESS) {
 			kvmppc_rm_clear_tce(vcpu->kvm, stit->tbl, entry);
 			return ret;
@@ -558,7 +568,7 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 		ua = 0;
 		if (kvmppc_rm_tce_to_ua(vcpu->kvm, tce, &ua, NULL)) {
 			ret = H_PARAMETER;
-			goto unlock_exit;
+			goto invalidate_exit;
 		}
 
 		list_for_each_entry_lockless(stit, &stt->iommu_tables, next) {
@@ -569,13 +579,17 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 			if (ret != H_SUCCESS) {
 				kvmppc_rm_clear_tce(vcpu->kvm, stit->tbl,
 						entry);
-				goto unlock_exit;
+				goto invalidate_exit;
 			}
 		}
 
 		kvmppc_rm_tce_put(stt, entry + i, tce);
 	}
 
+invalidate_exit:
+	list_for_each_entry_lockless(stit, &stt->iommu_tables, next)
+		iommu_tce_kill_rm(stit->tbl, entry, npages);
+
 unlock_exit:
 	if (rmap)
 		unlock_rmap(rmap);
@@ -618,7 +632,7 @@ long kvmppc_rm_h_stuff_tce(struct kvm_vcpu *vcpu,
 				continue;
 
 			if (ret == H_TOO_HARD)
-				return ret;
+				goto invalidate_exit;
 
 			WARN_ON_ONCE_RM(1);
 			kvmppc_rm_clear_tce(vcpu->kvm, stit->tbl, entry);
@@ -628,7 +642,11 @@ long kvmppc_rm_h_stuff_tce(struct kvm_vcpu *vcpu,
 	for (i = 0; i < npages; ++i, ioba += (1ULL << stt->page_shift))
 		kvmppc_rm_tce_put(stt, ioba >> stt->page_shift, tce_value);
 
-	return H_SUCCESS;
+invalidate_exit:
+	list_for_each_entry_lockless(stit, &stt->iommu_tables, next)
+		iommu_tce_kill_rm(stit->tbl, ioba >> stt->page_shift, npages);
+
+	return ret;
 }
 
 /* This can be called in either virtual mode or real mode */
-- 
2.17.1

