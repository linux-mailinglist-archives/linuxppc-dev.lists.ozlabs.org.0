Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A98115A98
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 02:17:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47VBPq2dXrzDqTD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 12:17:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47VBKP6nkgzDqSj
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2019 12:13:13 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB71CQlb124476
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Dec 2019 20:13:11 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wq9hph2y5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Dec 2019 20:13:10 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Sat, 7 Dec 2019 01:13:09 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 7 Dec 2019 01:13:04 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB71D2T747841386
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 7 Dec 2019 01:13:02 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB42A4C046;
 Sat,  7 Dec 2019 01:13:02 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E4EF4C044;
 Sat,  7 Dec 2019 01:12:58 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.215.155])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat,  7 Dec 2019 01:12:58 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v5 1/2] powerpc/pseries/iommu: Share the per-cpu TCE page with
 the hypervisor.
Date: Fri,  6 Dec 2019 17:12:38 -0800
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575681159-30356-1-git-send-email-linuxram@us.ibm.com>
References: <1575681159-30356-1-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19120701-0020-0000-0000-000003952446
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120701-0021-0000-0000-000021EC59A1
Message-Id: <1575681159-30356-2-git-send-email-linuxram@us.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_08:2019-12-05,2019-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 mlxlogscore=944 suspectscore=3 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912070004
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
Cc: andmike@us.ibm.com, mst@redhat.com, aik@ozlabs.ru, linuxram@us.ibm.com,
 mdroth@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, ram.n.pai@gmail.com,
 leonardo@linux.ibm.com, cai@lca.pw, tglx@linutronix.de,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

H_PUT_TCE_INDIRECT hcall uses a page filled with TCE entries, as one of
its parameters.  On secure VMs, hypervisor cannot access the contents of
this page since it gets encrypted.  Hence share the page with the
hypervisor, and unshare when done.

Signed-off-by: Ram Pai <linuxram@us.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 6ba081d..67b5009 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -37,6 +37,7 @@
 #include <asm/mmzone.h>
 #include <asm/plpar_wrappers.h>
 #include <asm/svm.h>
+#include <asm/ultravisor.h>
 
 #include "pseries.h"
 
@@ -179,6 +180,18 @@ static int tce_build_pSeriesLP(struct iommu_table *tbl, long tcenum,
 
 static DEFINE_PER_CPU(__be64 *, tce_page);
 
+static void pre_process_tce_page(__be64 *tcep)
+{
+	if (tcep && is_secure_guest())
+		uv_share_page(PHYS_PFN(__pa(tcep)), 1);
+}
+
+static void post_process_tce_page(__be64 *tcep)
+{
+	if (tcep && is_secure_guest())
+		uv_unshare_page(PHYS_PFN(__pa(tcep)), 1);
+}
+
 static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
 				     long npages, unsigned long uaddr,
 				     enum dma_data_direction direction,
@@ -187,7 +200,7 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
 	u64 rc = 0;
 	u64 proto_tce;
 	__be64 *tcep;
-	u64 rpn;
+	u64 rpn, tcep0;
 	long l, limit;
 	long tcenum_start = tcenum, npages_start = npages;
 	int ret = 0;
@@ -216,6 +229,8 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
 		__this_cpu_write(tce_page, tcep);
 	}
 
+	pre_process_tce_page(tcep);
+
 	rpn = __pa(uaddr) >> TCE_SHIFT;
 	proto_tce = TCE_PCI_READ;
 	if (direction != DMA_TO_DEVICE)
@@ -243,6 +258,14 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
 		tcenum += limit;
 	} while (npages > 0 && !rc);
 
+	/*
+	 * if "tcep" is shared, post_process_tce_page() will unshare the page,
+	 * which will zero the page. Grab any interesting content, before it
+	 * disappears.
+	 */
+	tcep0 = tcep[0];
+	post_process_tce_page(tcep);
+
 	local_irq_restore(flags);
 
 	if (unlikely(rc == H_NOT_ENOUGH_RESOURCES)) {
@@ -256,7 +279,7 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
 		printk("tce_buildmulti_pSeriesLP: plpar_tce_put failed. rc=%lld\n", rc);
 		printk("\tindex   = 0x%llx\n", (u64)tbl->it_index);
 		printk("\tnpages  = 0x%llx\n", (u64)npages);
-		printk("\ttce[0] val = 0x%llx\n", tcep[0]);
+		printk("\ttce[0] val = 0x%llx\n", tcep0);
 		dump_stack();
 	}
 	return ret;
@@ -280,7 +303,6 @@ static void tce_free_pSeriesLP(struct iommu_table *tbl, long tcenum, long npages
 	}
 }
 
-
 static void tce_freemulti_pSeriesLP(struct iommu_table *tbl, long tcenum, long npages)
 {
 	u64 rc;
@@ -413,6 +435,8 @@ static int tce_setrange_multi_pSeriesLP(unsigned long start_pfn,
 		__this_cpu_write(tce_page, tcep);
 	}
 
+	pre_process_tce_page(tcep);
+
 	proto_tce = TCE_PCI_READ | TCE_PCI_WRITE;
 
 	liobn = (u64)be32_to_cpu(maprange->liobn);
@@ -451,6 +475,8 @@ static int tce_setrange_multi_pSeriesLP(unsigned long start_pfn,
 		num_tce -= limit;
 	} while (num_tce > 0 && !rc);
 
+	post_process_tce_page(tcep);
+
 	/* error cleanup: caller will clear whole range */
 
 	local_irq_enable();
-- 
1.8.3.1

