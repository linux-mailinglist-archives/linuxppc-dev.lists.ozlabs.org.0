Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE34115A9D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 02:18:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47VBRn3FHgzDqjH
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 12:18:45 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47VBKT5Z9NzDqf4
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2019 12:13:17 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB71CRPS071085
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Dec 2019 20:13:14 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wq9g6sew3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Dec 2019 20:13:14 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Sat, 7 Dec 2019 01:13:12 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 7 Dec 2019 01:13:08 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB71D7X430474474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 7 Dec 2019 01:13:07 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 108264C04A;
 Sat,  7 Dec 2019 01:13:07 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A4104C040;
 Sat,  7 Dec 2019 01:13:03 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.215.155])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat,  7 Dec 2019 01:13:02 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v5 2/2] powerpc/pseries/iommu: Use dma_iommu_ops for Secure VM.
Date: Fri,  6 Dec 2019 17:12:39 -0800
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1575681159-30356-2-git-send-email-linuxram@us.ibm.com>
References: <1575681159-30356-1-git-send-email-linuxram@us.ibm.com>
 <1575681159-30356-2-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19120701-0020-0000-0000-000003952448
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120701-0021-0000-0000-000021EC59A3
Message-Id: <1575681159-30356-3-git-send-email-linuxram@us.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_08:2019-12-05,2019-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=519 suspectscore=1 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Commit edea902c1c1e ("powerpc/pseries/iommu: Don't use dma_iommu_ops on
		secure guests")
disabled dma_iommu_ops path, for secure VMs. Disabling dma_iommu_ops
path for secure VMs, helped enable dma_direct path.  This enabled
support for bounce-buffering through SWIOTLB.  However it fails to
operate when IOMMU is enabled, since I/O pages are not TCE mapped.

Renable dma_iommu_ops path for pseries Secure VMs.  It handles all
cases including, TCE mapping I/O pages, in the presence of a
IOMMU.

Signed-off-by: Ram Pai <linuxram@us.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 67b5009..4e27d66 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -36,7 +36,6 @@
 #include <asm/udbg.h>
 #include <asm/mmzone.h>
 #include <asm/plpar_wrappers.h>
-#include <asm/svm.h>
 #include <asm/ultravisor.h>
 
 #include "pseries.h"
@@ -1346,15 +1345,7 @@ void iommu_init_early_pSeries(void)
 	of_reconfig_notifier_register(&iommu_reconfig_nb);
 	register_memory_notifier(&iommu_mem_nb);
 
-	/*
-	 * Secure guest memory is inacessible to devices so regular DMA isn't
-	 * possible.
-	 *
-	 * In that case keep devices' dma_map_ops as NULL so that the generic
-	 * DMA code path will use SWIOTLB to bounce buffers for DMA.
-	 */
-	if (!is_secure_guest())
-		set_pci_dma_ops(&dma_iommu_ops);
+	set_pci_dma_ops(&dma_iommu_ops);
 }
 
 static int __init disable_multitce(char *str)
-- 
1.8.3.1

