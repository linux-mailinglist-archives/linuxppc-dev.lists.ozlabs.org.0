Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF3429D88
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 19:53:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459Yqt3ZvCzDqWp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2019 03:52:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=oracle.com
 (client-ip=156.151.31.85; helo=userp2120.oracle.com;
 envelope-from=daniel.m.jordan@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.b="WRq6xvQw"; 
 dkim-atps=neutral
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459YpT30SYzDqVJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2019 03:51:45 +1000 (AEST)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4OHid1s163522;
 Fri, 24 May 2019 17:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2018-07-02;
 bh=7vuX+qLSDF+L/aw7CkW4XQIwT+Zsosi+4x6E1CdJqU0=;
 b=WRq6xvQwrn3UxZiRHcHj8N8nt5ywmFL7Y1xdJXO6XhoeFVDVU5pc93gcQ7fZAGAcbbAz
 z9t7lehxIzm71uor5SqMmis8BDtjvFFimeYFVX/9o3jabViXAgdNbBw6/E8lNa7VlVbn
 7fzLOi/4n/RUad/TWMvug9cOYE2orCR53fLjYBFl0lXt+U2hG14/HZ6KuWFh7WLi/ZBm
 84KaiSShOyi8iLumvqyaQZkw6o07FfcMdQS3A5T4ojpcSgQeJqg9eGiKlk9g7UdoPXlQ
 iNlMHt03jlH2jfQ9zCHEtZbG3PXeougk3x/iLg5zdxztZ5uYUlDxnhVLwKCMZFfUg6eA yQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2smsk5jmuf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 May 2019 17:51:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4OHoCob159922;
 Fri, 24 May 2019 17:51:21 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2smsh31865-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 May 2019 17:51:21 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4OHpD8K026709;
 Fri, 24 May 2019 17:51:13 GMT
Received: from localhost.localdomain (/73.60.114.248)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 24 May 2019 17:51:12 +0000
From: Daniel Jordan <daniel.m.jordan@oracle.com>
To: akpm@linux-foundation.org
Subject: [PATCH v2] mm: add account_locked_vm utility function
Date: Fri, 24 May 2019 13:50:45 -0400
Message-Id: <20190524175045.26897-1-daniel.m.jordan@oracle.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <de375582-2c35-8e8a-4737-c816052a8e58@ozlabs.ru>
References: <de375582-2c35-8e8a-4737-c816052a8e58@ozlabs.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9267
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=62
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905240115
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9267
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=62 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905240115
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
Cc: Mark Rutland <mark.rutland@arm.com>, Davidlohr Bueso <dave@stgolabs.net>,
 kvm@vger.kernel.org, Alan Tull <atull@kernel.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, linux-fpga@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>, linux-mm@kvack.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Moritz Fischer <mdf@kernel.org>,
 Steve Sistare <steven.sistare@oracle.com>, Christoph Lameter <cl@linux.com>,
 linuxppc-dev@lists.ozlabs.org, Wu Hao <hao.wu@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

locked_vm accounting is done roughly the same way in five places, so
unify them in a helper.  Standardize the debug prints, which vary
slightly, but include the helper's caller to disambiguate between
callsites.

Error codes stay the same, so user-visible behavior does too.  The one
exception is that the -EPERM case in tce_account_locked_vm is removed
because Alexey has never seen it triggered.

Signed-off-by: Daniel Jordan <daniel.m.jordan@oracle.com>
Tested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: Alan Tull <atull@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Christoph Lameter <cl@linux.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Davidlohr Bueso <dave@stgolabs.net>
Cc: Jason Gunthorpe <jgg@mellanox.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Moritz Fischer <mdf@kernel.org>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Steve Sistare <steven.sistare@oracle.com>
Cc: Wu Hao <hao.wu@intel.com>
Cc: linux-mm@kvack.org
Cc: kvm@vger.kernel.org
Cc: kvm-ppc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-fpga@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---

Against v5.2-rc1.

v2:
 - applied review comments from Alexey
 - added _RET_IP_ to debug print to disambiguate callers

 arch/powerpc/kvm/book3s_64_vio.c     | 44 +++--------------------
 arch/powerpc/mm/book3s64/iommu_api.c | 41 +++------------------
 drivers/fpga/dfl-afu-dma-region.c    | 53 +++------------------------
 drivers/vfio/vfio_iommu_spapr_tce.c  | 54 +++-------------------------
 drivers/vfio/vfio_iommu_type1.c      | 17 ++-------
 include/linux/mm.h                   | 19 ++++++++++
 mm/util.c                            | 46 ++++++++++++++++++++++++
 7 files changed, 84 insertions(+), 190 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index 66270e07449a..768b645c7edf 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -30,6 +30,7 @@
 #include <linux/anon_inodes.h>
 #include <linux/iommu.h>
 #include <linux/file.h>
+#include <linux/mm.h>
 
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s.h>
@@ -56,43 +57,6 @@ static unsigned long kvmppc_stt_pages(unsigned long tce_pages)
 	return tce_pages + ALIGN(stt_bytes, PAGE_SIZE) / PAGE_SIZE;
 }
 
-static long kvmppc_account_memlimit(unsigned long stt_pages, bool inc)
-{
-	long ret = 0;
-
-	if (!current || !current->mm)
-		return ret; /* process exited */
-
-	down_write(&current->mm->mmap_sem);
-
-	if (inc) {
-		unsigned long locked, lock_limit;
-
-		locked = current->mm->locked_vm + stt_pages;
-		lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
-		if (locked > lock_limit && !capable(CAP_IPC_LOCK))
-			ret = -ENOMEM;
-		else
-			current->mm->locked_vm += stt_pages;
-	} else {
-		if (WARN_ON_ONCE(stt_pages > current->mm->locked_vm))
-			stt_pages = current->mm->locked_vm;
-
-		current->mm->locked_vm -= stt_pages;
-	}
-
-	pr_debug("[%d] RLIMIT_MEMLOCK KVM %c%ld %ld/%ld%s\n", current->pid,
-			inc ? '+' : '-',
-			stt_pages << PAGE_SHIFT,
-			current->mm->locked_vm << PAGE_SHIFT,
-			rlimit(RLIMIT_MEMLOCK),
-			ret ? " - exceeded" : "");
-
-	up_write(&current->mm->mmap_sem);
-
-	return ret;
-}
-
 static void kvm_spapr_tce_iommu_table_free(struct rcu_head *head)
 {
 	struct kvmppc_spapr_tce_iommu_table *stit = container_of(head,
@@ -302,7 +266,7 @@ static int kvm_spapr_tce_release(struct inode *inode, struct file *filp)
 
 	kvm_put_kvm(stt->kvm);
 
-	kvmppc_account_memlimit(
+	account_locked_vm(current->mm,
 		kvmppc_stt_pages(kvmppc_tce_pages(stt->size)), false);
 	call_rcu(&stt->rcu, release_spapr_tce_table);
 
@@ -327,7 +291,7 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 		return -EINVAL;
 
 	npages = kvmppc_tce_pages(size);
-	ret = kvmppc_account_memlimit(kvmppc_stt_pages(npages), true);
+	ret = account_locked_vm(current->mm, kvmppc_stt_pages(npages), true);
 	if (ret)
 		return ret;
 
@@ -373,7 +337,7 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
 
 	kfree(stt);
  fail_acct:
-	kvmppc_account_memlimit(kvmppc_stt_pages(npages), false);
+	account_locked_vm(current->mm, kvmppc_stt_pages(npages), false);
 	return ret;
 }
 
diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
index 5c521f3924a5..18d22eec0ebd 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -19,6 +19,7 @@
 #include <linux/hugetlb.h>
 #include <linux/swap.h>
 #include <linux/sizes.h>
+#include <linux/mm.h>
 #include <asm/mmu_context.h>
 #include <asm/pte-walk.h>
 #include <linux/mm_inline.h>
@@ -51,40 +52,6 @@ struct mm_iommu_table_group_mem_t {
 	u64 dev_hpa;		/* Device memory base address */
 };
 
-static long mm_iommu_adjust_locked_vm(struct mm_struct *mm,
-		unsigned long npages, bool incr)
-{
-	long ret = 0, locked, lock_limit;
-
-	if (!npages)
-		return 0;
-
-	down_write(&mm->mmap_sem);
-
-	if (incr) {
-		locked = mm->locked_vm + npages;
-		lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
-		if (locked > lock_limit && !capable(CAP_IPC_LOCK))
-			ret = -ENOMEM;
-		else
-			mm->locked_vm += npages;
-	} else {
-		if (WARN_ON_ONCE(npages > mm->locked_vm))
-			npages = mm->locked_vm;
-		mm->locked_vm -= npages;
-	}
-
-	pr_debug("[%d] RLIMIT_MEMLOCK HASH64 %c%ld %ld/%ld\n",
-			current ? current->pid : 0,
-			incr ? '+' : '-',
-			npages << PAGE_SHIFT,
-			mm->locked_vm << PAGE_SHIFT,
-			rlimit(RLIMIT_MEMLOCK));
-	up_write(&mm->mmap_sem);
-
-	return ret;
-}
-
 bool mm_iommu_preregistered(struct mm_struct *mm)
 {
 	return !list_empty(&mm->context.iommu_group_mem_list);
@@ -101,7 +68,7 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
 	unsigned long entry, chunk;
 
 	if (dev_hpa == MM_IOMMU_TABLE_INVALID_HPA) {
-		ret = mm_iommu_adjust_locked_vm(mm, entries, true);
+		ret = account_locked_vm(mm, entries, true);
 		if (ret)
 			return ret;
 
@@ -216,7 +183,7 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
 	kfree(mem);
 
 unlock_exit:
-	mm_iommu_adjust_locked_vm(mm, locked_entries, false);
+	account_locked_vm(mm, locked_entries, false);
 
 	return ret;
 }
@@ -316,7 +283,7 @@ long mm_iommu_put(struct mm_struct *mm, struct mm_iommu_table_group_mem_t *mem)
 unlock_exit:
 	mutex_unlock(&mem_list_mutex);
 
-	mm_iommu_adjust_locked_vm(mm, unlock_entries, false);
+	account_locked_vm(mm, unlock_entries, false);
 
 	return ret;
 }
diff --git a/drivers/fpga/dfl-afu-dma-region.c b/drivers/fpga/dfl-afu-dma-region.c
index c438722bf4e1..0a532c602d8f 100644
--- a/drivers/fpga/dfl-afu-dma-region.c
+++ b/drivers/fpga/dfl-afu-dma-region.c
@@ -12,6 +12,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/sched/signal.h>
 #include <linux/uaccess.h>
+#include <linux/mm.h>
 
 #include "dfl-afu.h"
 
@@ -31,52 +32,6 @@ void afu_dma_region_init(struct dfl_feature_platform_data *pdata)
 	afu->dma_regions = RB_ROOT;
 }
 
-/**
- * afu_dma_adjust_locked_vm - adjust locked memory
- * @dev: port device
- * @npages: number of pages
- * @incr: increase or decrease locked memory
- *
- * Increase or decrease the locked memory size with npages input.
- *
- * Return 0 on success.
- * Return -ENOMEM if locked memory size is over the limit and no CAP_IPC_LOCK.
- */
-static int afu_dma_adjust_locked_vm(struct device *dev, long npages, bool incr)
-{
-	unsigned long locked, lock_limit;
-	int ret = 0;
-
-	/* the task is exiting. */
-	if (!current->mm)
-		return 0;
-
-	down_write(&current->mm->mmap_sem);
-
-	if (incr) {
-		locked = current->mm->locked_vm + npages;
-		lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
-
-		if (locked > lock_limit && !capable(CAP_IPC_LOCK))
-			ret = -ENOMEM;
-		else
-			current->mm->locked_vm += npages;
-	} else {
-		if (WARN_ON_ONCE(npages > current->mm->locked_vm))
-			npages = current->mm->locked_vm;
-		current->mm->locked_vm -= npages;
-	}
-
-	dev_dbg(dev, "[%d] RLIMIT_MEMLOCK %c%ld %ld/%ld%s\n", current->pid,
-		incr ? '+' : '-', npages << PAGE_SHIFT,
-		current->mm->locked_vm << PAGE_SHIFT, rlimit(RLIMIT_MEMLOCK),
-		ret ? "- exceeded" : "");
-
-	up_write(&current->mm->mmap_sem);
-
-	return ret;
-}
-
 /**
  * afu_dma_pin_pages - pin pages of given dma memory region
  * @pdata: feature device platform data
@@ -92,7 +47,7 @@ static int afu_dma_pin_pages(struct dfl_feature_platform_data *pdata,
 	struct device *dev = &pdata->dev->dev;
 	int ret, pinned;
 
-	ret = afu_dma_adjust_locked_vm(dev, npages, true);
+	ret = account_locked_vm(current->mm, npages, true);
 	if (ret)
 		return ret;
 
@@ -121,7 +76,7 @@ static int afu_dma_pin_pages(struct dfl_feature_platform_data *pdata,
 free_pages:
 	kfree(region->pages);
 unlock_vm:
-	afu_dma_adjust_locked_vm(dev, npages, false);
+	account_locked_vm(current->mm, npages, false);
 	return ret;
 }
 
@@ -141,7 +96,7 @@ static void afu_dma_unpin_pages(struct dfl_feature_platform_data *pdata,
 
 	put_all_pages(region->pages, npages);
 	kfree(region->pages);
-	afu_dma_adjust_locked_vm(dev, npages, false);
+	account_locked_vm(current->mm, npages, false);
 
 	dev_dbg(dev, "%ld pages unpinned\n", npages);
 }
diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
index 40ddc0c5f677..d06e8e291924 100644
--- a/drivers/vfio/vfio_iommu_spapr_tce.c
+++ b/drivers/vfio/vfio_iommu_spapr_tce.c
@@ -22,6 +22,7 @@
 #include <linux/vmalloc.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/signal.h>
+#include <linux/mm.h>
 
 #include <asm/iommu.h>
 #include <asm/tce.h>
@@ -34,51 +35,6 @@
 static void tce_iommu_detach_group(void *iommu_data,
 		struct iommu_group *iommu_group);
 
-static long try_increment_locked_vm(struct mm_struct *mm, long npages)
-{
-	long ret = 0, locked, lock_limit;
-
-	if (WARN_ON_ONCE(!mm))
-		return -EPERM;
-
-	if (!npages)
-		return 0;
-
-	down_write(&mm->mmap_sem);
-	locked = mm->locked_vm + npages;
-	lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
-	if (locked > lock_limit && !capable(CAP_IPC_LOCK))
-		ret = -ENOMEM;
-	else
-		mm->locked_vm += npages;
-
-	pr_debug("[%d] RLIMIT_MEMLOCK +%ld %ld/%ld%s\n", current->pid,
-			npages << PAGE_SHIFT,
-			mm->locked_vm << PAGE_SHIFT,
-			rlimit(RLIMIT_MEMLOCK),
-			ret ? " - exceeded" : "");
-
-	up_write(&mm->mmap_sem);
-
-	return ret;
-}
-
-static void decrement_locked_vm(struct mm_struct *mm, long npages)
-{
-	if (!mm || !npages)
-		return;
-
-	down_write(&mm->mmap_sem);
-	if (WARN_ON_ONCE(npages > mm->locked_vm))
-		npages = mm->locked_vm;
-	mm->locked_vm -= npages;
-	pr_debug("[%d] RLIMIT_MEMLOCK -%ld %ld/%ld\n", current->pid,
-			npages << PAGE_SHIFT,
-			mm->locked_vm << PAGE_SHIFT,
-			rlimit(RLIMIT_MEMLOCK));
-	up_write(&mm->mmap_sem);
-}
-
 /*
  * VFIO IOMMU fd for SPAPR_TCE IOMMU implementation
  *
@@ -336,7 +292,7 @@ static int tce_iommu_enable(struct tce_container *container)
 		return ret;
 
 	locked = table_group->tce32_size >> PAGE_SHIFT;
-	ret = try_increment_locked_vm(container->mm, locked);
+	ret = account_locked_vm(container->mm, locked, true);
 	if (ret)
 		return ret;
 
@@ -355,7 +311,7 @@ static void tce_iommu_disable(struct tce_container *container)
 	container->enabled = false;
 
 	BUG_ON(!container->mm);
-	decrement_locked_vm(container->mm, container->locked_pages);
+	account_locked_vm(container->mm, container->locked_pages, false);
 }
 
 static void *tce_iommu_open(unsigned long arg)
@@ -659,7 +615,7 @@ static long tce_iommu_create_table(struct tce_container *container,
 	if (!table_size)
 		return -EINVAL;
 
-	ret = try_increment_locked_vm(container->mm, table_size >> PAGE_SHIFT);
+	ret = account_locked_vm(container->mm, table_size >> PAGE_SHIFT, true);
 	if (ret)
 		return ret;
 
@@ -678,7 +634,7 @@ static void tce_iommu_free_table(struct tce_container *container,
 	unsigned long pages = tbl->it_allocated_size >> PAGE_SHIFT;
 
 	iommu_tce_table_put(tbl);
-	decrement_locked_vm(container->mm, pages);
+	account_locked_vm(container->mm, pages, false);
 }
 
 static long tce_iommu_create_window(struct tce_container *container,
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 3ddc375e7063..bf449ace1676 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -275,21 +275,8 @@ static int vfio_lock_acct(struct vfio_dma *dma, long npage, bool async)
 
 	ret = down_write_killable(&mm->mmap_sem);
 	if (!ret) {
-		if (npage > 0) {
-			if (!dma->lock_cap) {
-				unsigned long limit;
-
-				limit = task_rlimit(dma->task,
-						RLIMIT_MEMLOCK) >> PAGE_SHIFT;
-
-				if (mm->locked_vm + npage > limit)
-					ret = -ENOMEM;
-			}
-		}
-
-		if (!ret)
-			mm->locked_vm += npage;
-
+		ret = __account_locked_vm(mm, abs(npage), npage > 0, dma->task,
+					  dma->lock_cap);
 		up_write(&mm->mmap_sem);
 	}
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0e8834ac32b7..72c1034d2ec7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1564,6 +1564,25 @@ long get_user_pages_unlocked(unsigned long start, unsigned long nr_pages,
 int get_user_pages_fast(unsigned long start, int nr_pages,
 			unsigned int gup_flags, struct page **pages);
 
+int __account_locked_vm(struct mm_struct *mm, unsigned long pages, bool inc,
+			struct task_struct *task, bool bypass_rlim);
+
+static inline int account_locked_vm(struct mm_struct *mm, unsigned long pages,
+				    bool inc)
+{
+	int ret;
+
+	if (pages == 0 || !mm)
+		return 0;
+
+	down_write(&mm->mmap_sem);
+	ret = __account_locked_vm(mm, pages, inc, current,
+				  capable(CAP_IPC_LOCK));
+	up_write(&mm->mmap_sem);
+
+	return ret;
+}
+
 /* Container for pinned pfns / pages */
 struct frame_vector {
 	unsigned int nr_allocated;	/* Number of frames we have space for */
diff --git a/mm/util.c b/mm/util.c
index e2e4f8c3fa12..bd3bdf16a084 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -6,6 +6,7 @@
 #include <linux/err.h>
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
+#include <linux/sched/signal.h>
 #include <linux/sched/task_stack.h>
 #include <linux/security.h>
 #include <linux/swap.h>
@@ -346,6 +347,51 @@ int __weak get_user_pages_fast(unsigned long start,
 }
 EXPORT_SYMBOL_GPL(get_user_pages_fast);
 
+/**
+ * __account_locked_vm - account locked pages to an mm's locked_vm
+ * @mm:          mm to account against, may be NULL
+ * @pages:       number of pages to account
+ * @inc:         %true if @pages should be considered positive, %false if not
+ * @task:        task used to check RLIMIT_MEMLOCK
+ * @bypass_rlim: %true if checking RLIMIT_MEMLOCK should be skipped
+ *
+ * Assumes @task and @mm are valid (i.e. at least one reference on each), and
+ * that mmap_sem is held as writer.
+ *
+ * Return:
+ * * 0       on success
+ * * 0       if @mm is NULL (can happen for example if the task is exiting)
+ * * -ENOMEM if RLIMIT_MEMLOCK would be exceeded.
+ */
+int __account_locked_vm(struct mm_struct *mm, unsigned long pages, bool inc,
+			struct task_struct *task, bool bypass_rlim)
+{
+	unsigned long locked_vm, limit;
+	int ret = 0;
+
+	locked_vm = mm->locked_vm;
+	if (inc) {
+		if (!bypass_rlim) {
+			limit = task_rlimit(task, RLIMIT_MEMLOCK) >> PAGE_SHIFT;
+			if (locked_vm + pages > limit)
+				ret = -ENOMEM;
+		}
+		if (!ret)
+			mm->locked_vm = locked_vm + pages;
+	} else {
+		WARN_ON_ONCE(pages > locked_vm);
+		mm->locked_vm = locked_vm - pages;
+	}
+
+	pr_debug("%s: [%d] caller %ps %c%lu %lu/%lu%s\n", __func__, task->pid,
+		 (void *)_RET_IP_, (inc) ? '+' : '-', pages << PAGE_SHIFT,
+		 locked_vm << PAGE_SHIFT, task_rlimit(task, RLIMIT_MEMLOCK),
+		 ret ? " - exceeded" : "");
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(__account_locked_vm);
+
 unsigned long vm_mmap_pgoff(struct file *file, unsigned long addr,
 	unsigned long len, unsigned long prot,
 	unsigned long flag, unsigned long pgoff)

base-commit: a188339ca5a396acc588e5851ed7e19f66b0ebd9
-- 
2.21.0

