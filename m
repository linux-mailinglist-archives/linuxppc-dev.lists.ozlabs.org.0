Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C014223CB09
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 15:37:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMCNP1NRtzDqfS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 23:37:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMCKv6X6bzDqS4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 23:35:15 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 075DMYiJ001183; Wed, 5 Aug 2020 09:35:09 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32qwkcrar0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Aug 2020 09:35:09 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 075DZ7d8014782;
 Wed, 5 Aug 2020 13:35:07 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 32n018aq0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Aug 2020 13:35:06 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 075DZ4aO26280306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Aug 2020 13:35:04 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA59C11C058;
 Wed,  5 Aug 2020 13:35:03 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 992E911C064;
 Wed,  5 Aug 2020 13:35:03 +0000 (GMT)
Received: from pomme.tlslab.ibm.com (unknown [9.145.52.198])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  5 Aug 2020 13:35:03 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] powerpc/drmem: Don't compute the NUMA node for each LMB
Date: Wed,  5 Aug 2020 15:35:02 +0200
Message-Id: <20200805133502.33723-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <202008051807.Vi8NDJtX%lkp@intel.com>
References: <202008051807.Vi8NDJtX%lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-05_09:2020-08-03,
 2020-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008050108
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
Cc: nathanl@linux.ibm.com, cheloha@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All the LMB from the same set of ibm,dynamic-memory-v2 property are
sharing the same NUMA node. Don't compute that node for each one.

Tested on a system with 1022 LMBs spread on 4 NUMA nodes, only 4 calls to
lmb_set_nid() have been made instead of 1022.

This should prevent some soft lockups when starting large guests

Code has meaning only if CONFIG_MEMORY_HOTPLUG is set, otherwise the nid
field is not present in the drmem_lmb structure.

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/mm/drmem.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
index b2eeea39684c..c11b6ec99ea3 100644
--- a/arch/powerpc/mm/drmem.c
+++ b/arch/powerpc/mm/drmem.c
@@ -402,6 +402,9 @@ static void __init init_drmem_v2_lmbs(const __be32 *prop)
 	const __be32 *p;
 	u32 i, j, lmb_sets;
 	int lmb_index;
+#ifdef CONFIG_MEMORY_HOTPLUG
+	struct drmem_lmb *first = NULL;
+#endif
 
 	lmb_sets = of_read_number(prop++, 1);
 	if (lmb_sets == 0)
@@ -426,6 +429,15 @@ static void __init init_drmem_v2_lmbs(const __be32 *prop)
 	for (i = 0; i < lmb_sets; i++) {
 		read_drconf_v2_cell(&dr_cell, &p);
 
+#ifdef CONFIG_MEMORY_HOTPLUG
+		/*
+		 * Fetch the NUMA node id for the fist set or if the
+		 * associativity index is different from the previous set.
+		 */
+		if (first && dr_cell.aa_index != first->aa_index)
+			first = NULL;
+#endif
+
 		for (j = 0; j < dr_cell.seq_lmbs; j++) {
 			lmb = &drmem_info->lmbs[lmb_index++];
 
@@ -438,7 +450,18 @@ static void __init init_drmem_v2_lmbs(const __be32 *prop)
 			lmb->aa_index = dr_cell.aa_index;
 			lmb->flags = dr_cell.flags;
 
-			lmb_set_nid(lmb);
+#ifdef CONFIG_MEMORY_HOTPLUG
+			/*
+			 * All the LMB in the set share the same NUMA
+			 * associativity property. So read that node only once.
+			 */
+			if (!first) {
+				lmb_set_nid(lmb);
+				first = lmb;
+			} else {
+				lmb->nid = first->nid;
+			}
+#endif
 		}
 	}
 }
-- 
2.28.0

