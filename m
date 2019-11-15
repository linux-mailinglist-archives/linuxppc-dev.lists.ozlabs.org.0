Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B045FE6A1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 21:55:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47F9bM3WJnzF7fr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 07:55:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47F9Sp1hTczF7cG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 07:49:29 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFKlgZw083892
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 15:49:26 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w9qmk2b82-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 15:49:26 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Fri, 15 Nov 2019 20:49:24 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 15 Nov 2019 20:49:19 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAFKnIul27787346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Nov 2019 20:49:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2314342049;
 Fri, 15 Nov 2019 20:49:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A47CF4203F;
 Fri, 15 Nov 2019 20:49:14 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.85.181.122])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Nov 2019 20:49:14 +0000 (GMT)
From: Ram Pai <linuxram@us.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [v3 2/2] powerpc/pseries/iommu: Use dma_iommu_ops for Secure VMs
 aswell.
Date: Fri, 15 Nov 2019 12:48:31 -0800
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1573850911-19590-2-git-send-email-linuxram@us.ibm.com>
References: <1573850911-19590-1-git-send-email-linuxram@us.ibm.com>
 <1573850911-19590-2-git-send-email-linuxram@us.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19111520-4275-0000-0000-0000037E4E39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111520-4276-0000-0000-00003891B93E
Message-Id: <1573850911-19590-3-git-send-email-linuxram@us.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_06:2019-11-15,2019-11-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 mlxlogscore=877 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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

Commit edea902c1c1e ("powerpc/pseries/iommu: Don't use dma_iommu_ops on
	       secure guests")
disabled dma_iommu_ops path, for secure VMs. The rationale for disabling
the dma_iommu_ops path, was to use the dma_direct path, since it had
inbuilt support for bounce-buffering through SWIOTLB.

However dma_iommu_ops is functionally much richer. Depending on the
capabilities of the platform, it can handle direct DMA; with or without
bounce buffering, and it can handle indirect DMA. Hence its better to
leverage the richer functionality supported by dma_iommu_ops.

Renable dma_iommu_ops path for pseries Secure VMs.

Signed-off-by: Ram Pai <linuxram@us.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 0720831..6adf4d3 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -36,7 +36,6 @@
 #include <asm/udbg.h>
 #include <asm/mmzone.h>
 #include <asm/plpar_wrappers.h>
-#include <asm/svm.h>
 #include <asm/ultravisor.h>
 
 #include "pseries.h"
@@ -1337,15 +1336,7 @@ void iommu_init_early_pSeries(void)
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

