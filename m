Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA98BF5B9C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 00:05:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478wpM6WsfzF6Rc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 10:04:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478wjj49VQzF7SL
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 10:00:57 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA8MvGVe111956
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 8 Nov 2019 18:00:54 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w5he7gd4k-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2019 18:00:53 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Fri, 8 Nov 2019 23:00:51 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 8 Nov 2019 23:00:47 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA8N0ksT29032452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Nov 2019 23:00:46 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A80F9AE04D;
 Fri,  8 Nov 2019 23:00:46 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41FF4AE057;
 Fri,  8 Nov 2019 23:00:43 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.217.215])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  8 Nov 2019 23:00:43 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC v2 1/2] powerpc/pseries/iommu: Share the per-cpu TCE page with
 the hypervisor.
Date: Fri,  8 Nov 2019 15:00:10 -0800
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1573254011-1604-1-git-send-email-linuxram@us.ibm.com>
References: <1573254011-1604-1-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19110823-0016-0000-0000-000002C20A74
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110823-0017-0000-0000-0000332393FB
Message-Id: <1573254011-1604-2-git-send-email-linuxram@us.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-08_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=574 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911080221
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
 cai@lca.pw, tglx@linutronix.de, sukadev@linux.vnet.ibm.com, hch@lst.de,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The hypervisor needs to access the contents of the page holding the TCE
entries while setting up the TCE entries in the IOMMU's TCE table.

For SecureVMs, since this page is encrypted, the hypervisor cannot
access valid entries. Share the page with the hypervisor. This ensures
that the hypervisor sees those valid entries.

Why is this safe?
   The page contains only TCE entries; not any sensitive data
   belonging to the Secure VM. The hypervisor has a genuine need to know
   the value of the TCE entries, without which it will not be able to
   DMA to/from the pages pointed to by the TCE entries. In a Secure
   VM the TCE entries point to pages that are also shared with the
   hypervisor; example: pages containing bounce buffers.

Signed-off-by: Ram Pai <linuxram@us.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 8d9c2b1..a302aaa 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -37,6 +37,7 @@
 #include <asm/mmzone.h>
 #include <asm/plpar_wrappers.h>
 #include <asm/svm.h>
+#include <asm/ultravisor.h>
 
 #include "pseries.h"
 
@@ -179,6 +180,23 @@ static int tce_build_pSeriesLP(struct iommu_table *tbl, long tcenum,
 
 static DEFINE_PER_CPU(__be64 *, tce_page);
 
+/*
+ * Allocate a tce page.  If secure VM, share the page with the hypervisor.
+ *
+ * NOTE: the TCE page is shared with the hypervisor explicitly and remains
+ * shared for the lifetime of the kernel. It is implicitly unshared at kernel
+ * shutdown through a UV_UNSHARE_ALL_PAGES ucall.
+ */
+static __be64 *alloc_tce_page(void)
+{
+	__be64 *tcep = (__be64 *)__get_free_page(GFP_ATOMIC);
+
+	if (tcep && is_secure_guest())
+		uv_share_page(PHYS_PFN(__pa(tcep)), 1);
+
+	return tcep;
+}
+
 static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
 				     long npages, unsigned long uaddr,
 				     enum dma_data_direction direction,
@@ -206,8 +224,7 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
 	 * from iommu_alloc{,_sg}()
 	 */
 	if (!tcep) {
-		tcep = (__be64 *)__get_free_page(GFP_ATOMIC);
-		/* If allocation fails, fall back to the loop implementation */
+		tcep = alloc_tce_page();
 		if (!tcep) {
 			local_irq_restore(flags);
 			return tce_build_pSeriesLP(tbl, tcenum, npages, uaddr,
@@ -405,7 +422,7 @@ static int tce_setrange_multi_pSeriesLP(unsigned long start_pfn,
 	tcep = __this_cpu_read(tce_page);
 
 	if (!tcep) {
-		tcep = (__be64 *)__get_free_page(GFP_ATOMIC);
+		tcep = alloc_tce_page();
 		if (!tcep) {
 			local_irq_enable();
 			return -ENOMEM;
-- 
1.8.3.1

