Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BBBFE69F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 21:53:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47F9Y46NdSzF5v1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 07:53:12 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47F9Sh6Pc5zF7c8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 07:49:24 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFKlgEQ057472
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 15:49:22 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w9nsepery-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 15:49:22 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Fri, 15 Nov 2019 20:49:20 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 15 Nov 2019 20:49:15 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xAFKnELH45941086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Nov 2019 20:49:14 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5132042042;
 Fri, 15 Nov 2019 20:49:14 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D91B34203F;
 Fri, 15 Nov 2019 20:49:10 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.181.122])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Nov 2019 20:49:10 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [v3 1/2] powerpc/pseries/iommu: Share the per-cpu TCE page with the
 hypervisor.
Date: Fri, 15 Nov 2019 12:48:30 -0800
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1573850911-19590-1-git-send-email-linuxram@us.ibm.com>
References: <1573850911-19590-1-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19111520-0016-0000-0000-000002C439E4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111520-0017-0000-0000-00003325E349
Message-Id: <1573850911-19590-2-git-send-email-linuxram@us.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_06:2019-11-15,2019-11-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501 mlxlogscore=304
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911150185
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
Cc: andmike@us.ibm.com, pasic@linux.ibm.com, mst@redhat.com, aik@ozlabs.ru,
 linuxram@us.ibm.com, mdroth@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
 ram.n.pai@gmail.com, cai@lca.pw, tglx@linutronix.de,
 sukadev@linux.vnet.ibm.com, hch@lst.de, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

H_PUT_TCE_INDIRECT hcall uses a page filled with TCE entries, as one of
its parameters. One page is dedicated per cpu, for the lifetime of the
kernel for this purpose. On secure VMs, contents of this page, when
accessed by the hypervisor, retrieves encrypted TCE entries.  Hypervisor
needs to know the unencrypted entries, to update the TCE table
accordingly.  There is nothing secret or sensitive about these entries.
Hence share the page with the hypervisor.

Signed-off-by: Ram Pai <linuxram@us.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 6ba081d..0720831 100644
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

