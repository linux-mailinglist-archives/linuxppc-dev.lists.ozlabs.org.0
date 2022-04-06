Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643514F5304
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 06:04:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KY9rV1pL0z3bYw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 14:04:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KY9r60glSz2xjY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 14:04:22 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 4252F818B7;
 Wed,  6 Apr 2022 00:04:19 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] KVM: PPC: Fix TCE handling for VFIO
Date: Wed,  6 Apr 2022 14:04:16 +1000
Message-Id: <20220406040416.3608518-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At the moment the IOMMU page size in a pseries VM is 16MB (the biggest
allowed by LoPAPR), this page size is used for an emulated TCE table.
If there is a passed though PCI device, that there are hardware IOMMU
tables with equal or smaller IOMMU page sizes so one emulated IOMMU pages
is backed by power-of-two hardware pages.

The code wrongly uses the emulated TCE index instead of hardware TCE
index in error handling. The problem is easier to see on POWER8 with
multi-level TCE tables (when only the first level is preallocated)
as hash mode uses real mode TCE hypercalls handlers.
The kernel starts using indirect tables when VMs get bigger than 128GB
(depends on the max page order).
The very first real mode hcall is going to fail with H_TOO_HARD as
in the real mode we cannot allocate memory for TCEs (we can in the virtual
mode) but on the way out the code attempts to clear hardware TCEs using
emulated TCE indexes which corrupts random kernel memory because
it_offset==1<<59 is subtracted from those indexes and the resulting index
is out of the TCE table bounds.

This fixes kvmppc_clear_tce() to use the correct TCE indexes.

While at it, this fixes TCE cache invalidation which uses emulated TCE
indexes instead of the hardware ones. This went unnoticed as 64bit DMA
is used these days and VMs map all RAM in one go and only then do DMA
and this is when the TCE cache gets populated.

Potentially this could slow down mapping, however normally 16MB
emulated pages are backed by 64K hardware pages so it is one write to
the "TCE Kill" per 256 updates which is not that bad considering the size
of the cache (1024 TCEs or so).

Fixes: ca1fc489cfa0 ("KVM: PPC: Book3S: Allow backing bigger guest IOMMU pages with smaller physical pages")
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kvm/book3s_64_vio.c    | 45 +++++++++++++++--------------
 arch/powerpc/kvm/book3s_64_vio_hv.c | 44 ++++++++++++++--------------
 2 files changed, 45 insertions(+), 44 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index d42b4b6d4a79..85cfa6328222 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -420,13 +420,19 @@ static void kvmppc_tce_put(struct kvmppc_spapr_tce_table *stt,
 	tbl[idx % TCES_PER_PAGE] = tce;
 }
 
-static void kvmppc_clear_tce(struct mm_struct *mm, struct iommu_table *tbl,
-		unsigned long entry)
+static void kvmppc_clear_tce(struct mm_struct *mm, struct kvmppc_spapr_tce_table *stt,
+		struct iommu_table *tbl, unsigned long entry)
 {
-	unsigned long hpa = 0;
-	enum dma_data_direction dir = DMA_NONE;
+	unsigned long i;
+	unsigned long subpages = 1ULL << (stt->page_shift - tbl->it_page_shift);
+	unsigned long io_entry = entry << (stt->page_shift - tbl->it_page_shift);
 
-	iommu_tce_xchg_no_kill(mm, tbl, entry, &hpa, &dir);
+	for (i = 0; i < subpages; ++i) {
+		unsigned long hpa = 0;
+		enum dma_data_direction dir = DMA_NONE;
+
+		iommu_tce_xchg_no_kill(mm, tbl, io_entry + i, &hpa, &dir);
+	}
 }
 
 static long kvmppc_tce_iommu_mapped_dec(struct kvm *kvm,
@@ -485,6 +491,8 @@ static long kvmppc_tce_iommu_unmap(struct kvm *kvm,
 			break;
 	}
 
+	iommu_tce_kill(tbl, io_entry, subpages);
+
 	return ret;
 }
 
@@ -544,6 +552,8 @@ static long kvmppc_tce_iommu_map(struct kvm *kvm,
 			break;
 	}
 
+	iommu_tce_kill(tbl, io_entry, subpages);
+
 	return ret;
 }
 
@@ -590,10 +600,9 @@ long kvmppc_h_put_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
 			ret = kvmppc_tce_iommu_map(vcpu->kvm, stt, stit->tbl,
 					entry, ua, dir);
 
-		iommu_tce_kill(stit->tbl, entry, 1);
 
 		if (ret != H_SUCCESS) {
-			kvmppc_clear_tce(vcpu->kvm->mm, stit->tbl, entry);
+			kvmppc_clear_tce(vcpu->kvm->mm, stt, stit->tbl, entry);
 			goto unlock_exit;
 		}
 	}
@@ -669,13 +678,13 @@ long kvmppc_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 		 */
 		if (get_user(tce, tces + i)) {
 			ret = H_TOO_HARD;
-			goto invalidate_exit;
+			goto unlock_exit;
 		}
 		tce = be64_to_cpu(tce);
 
 		if (kvmppc_tce_to_ua(vcpu->kvm, tce, &ua)) {
 			ret = H_PARAMETER;
-			goto invalidate_exit;
+			goto unlock_exit;
 		}
 
 		list_for_each_entry_lockless(stit, &stt->iommu_tables, next) {
@@ -684,19 +693,15 @@ long kvmppc_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 					iommu_tce_direction(tce));
 
 			if (ret != H_SUCCESS) {
-				kvmppc_clear_tce(vcpu->kvm->mm, stit->tbl,
-						entry);
-				goto invalidate_exit;
+				kvmppc_clear_tce(vcpu->kvm->mm, stt, stit->tbl,
+						 entry + i);
+				goto unlock_exit;
 			}
 		}
 
 		kvmppc_tce_put(stt, entry + i, tce);
 	}
 
-invalidate_exit:
-	list_for_each_entry_lockless(stit, &stt->iommu_tables, next)
-		iommu_tce_kill(stit->tbl, entry, npages);
-
 unlock_exit:
 	srcu_read_unlock(&vcpu->kvm->srcu, idx);
 
@@ -735,20 +740,16 @@ long kvmppc_h_stuff_tce(struct kvm_vcpu *vcpu,
 				continue;
 
 			if (ret == H_TOO_HARD)
-				goto invalidate_exit;
+				return ret;
 
 			WARN_ON_ONCE(1);
-			kvmppc_clear_tce(vcpu->kvm->mm, stit->tbl, entry);
+			kvmppc_clear_tce(vcpu->kvm->mm, stt, stit->tbl, entry + i);
 		}
 	}
 
 	for (i = 0; i < npages; ++i, ioba += (1ULL << stt->page_shift))
 		kvmppc_tce_put(stt, ioba >> stt->page_shift, tce_value);
 
-invalidate_exit:
-	list_for_each_entry_lockless(stit, &stt->iommu_tables, next)
-		iommu_tce_kill(stit->tbl, ioba >> stt->page_shift, npages);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(kvmppc_h_stuff_tce);
diff --git a/arch/powerpc/kvm/book3s_64_vio_hv.c b/arch/powerpc/kvm/book3s_64_vio_hv.c
index 870b7f0c7ea5..fdeda6a9cff4 100644
--- a/arch/powerpc/kvm/book3s_64_vio_hv.c
+++ b/arch/powerpc/kvm/book3s_64_vio_hv.c
@@ -247,13 +247,19 @@ static void iommu_tce_kill_rm(struct iommu_table *tbl,
 		tbl->it_ops->tce_kill(tbl, entry, pages, true);
 }
 
-static void kvmppc_rm_clear_tce(struct kvm *kvm, struct iommu_table *tbl,
-		unsigned long entry)
+static void kvmppc_rm_clear_tce(struct kvm *kvm, struct kvmppc_spapr_tce_table *stt,
+		struct iommu_table *tbl, unsigned long entry)
 {
-	unsigned long hpa = 0;
-	enum dma_data_direction dir = DMA_NONE;
+	unsigned long i;
+	unsigned long subpages = 1ULL << (stt->page_shift - tbl->it_page_shift);
+	unsigned long io_entry = entry << (stt->page_shift - tbl->it_page_shift);
 
-	iommu_tce_xchg_no_kill_rm(kvm->mm, tbl, entry, &hpa, &dir);
+	for (i = 0; i < subpages; ++i) {
+		unsigned long hpa = 0;
+		enum dma_data_direction dir = DMA_NONE;
+
+		iommu_tce_xchg_no_kill_rm(kvm->mm, tbl, io_entry + i, &hpa, &dir);
+	}
 }
 
 static long kvmppc_rm_tce_iommu_mapped_dec(struct kvm *kvm,
@@ -316,6 +322,8 @@ static long kvmppc_rm_tce_iommu_unmap(struct kvm *kvm,
 			break;
 	}
 
+	iommu_tce_kill_rm(tbl, io_entry, subpages);
+
 	return ret;
 }
 
@@ -379,6 +387,8 @@ static long kvmppc_rm_tce_iommu_map(struct kvm *kvm,
 			break;
 	}
 
+	iommu_tce_kill_rm(tbl, io_entry, subpages);
+
 	return ret;
 }
 
@@ -420,10 +430,8 @@ long kvmppc_rm_h_put_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
 			ret = kvmppc_rm_tce_iommu_map(vcpu->kvm, stt,
 					stit->tbl, entry, ua, dir);
 
-		iommu_tce_kill_rm(stit->tbl, entry, 1);
-
 		if (ret != H_SUCCESS) {
-			kvmppc_rm_clear_tce(vcpu->kvm, stit->tbl, entry);
+			kvmppc_rm_clear_tce(vcpu->kvm, stt, stit->tbl, entry);
 			return ret;
 		}
 	}
@@ -561,7 +569,7 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 		ua = 0;
 		if (kvmppc_rm_tce_to_ua(vcpu->kvm, tce, &ua)) {
 			ret = H_PARAMETER;
-			goto invalidate_exit;
+			goto unlock_exit;
 		}
 
 		list_for_each_entry_lockless(stit, &stt->iommu_tables, next) {
@@ -570,19 +578,15 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 					iommu_tce_direction(tce));
 
 			if (ret != H_SUCCESS) {
-				kvmppc_rm_clear_tce(vcpu->kvm, stit->tbl,
-						entry);
-				goto invalidate_exit;
+				kvmppc_rm_clear_tce(vcpu->kvm, stt, stit->tbl,
+						entry + i);
+				goto unlock_exit;
 			}
 		}
 
 		kvmppc_rm_tce_put(stt, entry + i, tce);
 	}
 
-invalidate_exit:
-	list_for_each_entry_lockless(stit, &stt->iommu_tables, next)
-		iommu_tce_kill_rm(stit->tbl, entry, npages);
-
 unlock_exit:
 	if (!prereg)
 		arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
@@ -620,20 +624,16 @@ long kvmppc_rm_h_stuff_tce(struct kvm_vcpu *vcpu,
 				continue;
 
 			if (ret == H_TOO_HARD)
-				goto invalidate_exit;
+				return ret;
 
 			WARN_ON_ONCE_RM(1);
-			kvmppc_rm_clear_tce(vcpu->kvm, stit->tbl, entry);
+			kvmppc_rm_clear_tce(vcpu->kvm, stt, stit->tbl, entry + i);
 		}
 	}
 
 	for (i = 0; i < npages; ++i, ioba += (1ULL << stt->page_shift))
 		kvmppc_rm_tce_put(stt, ioba >> stt->page_shift, tce_value);
 
-invalidate_exit:
-	list_for_each_entry_lockless(stit, &stt->iommu_tables, next)
-		iommu_tce_kill_rm(stit->tbl, ioba >> stt->page_shift, npages);
-
 	return ret;
 }
 
-- 
2.30.2

