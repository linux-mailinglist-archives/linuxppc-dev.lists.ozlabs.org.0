Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1021423C92E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 11:31:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BM5wF2CvPzDqbX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 19:31:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BM5t26kvjzDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 19:29:14 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07593bLX140147; Wed, 5 Aug 2020 05:29:05 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32qkenswe1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Aug 2020 05:29:05 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0759FupD009998;
 Wed, 5 Aug 2020 09:29:03 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 32n01847h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Aug 2020 09:29:03 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0759T0eg27394370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Aug 2020 09:29:01 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF2B1A4053;
 Wed,  5 Aug 2020 09:29:00 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 799E0A4055;
 Wed,  5 Aug 2020 09:29:00 +0000 (GMT)
Received: from pomme.tlslab.ibm.com (unknown [9.145.52.198])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  5 Aug 2020 09:29:00 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/drmem: Don't compute the NUMA node for each LMB
Date: Wed,  5 Aug 2020 11:28:58 +0200
Message-Id: <20200805092858.64143-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-05_05:2020-08-03,
 2020-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008050072
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

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/mm/drmem.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
index b2eeea39684c..3819c523c65b 100644
--- a/arch/powerpc/mm/drmem.c
+++ b/arch/powerpc/mm/drmem.c
@@ -397,7 +397,7 @@ static void __init init_drmem_v1_lmbs(const __be32 *prop)
 
 static void __init init_drmem_v2_lmbs(const __be32 *prop)
 {
-	struct drmem_lmb *lmb;
+	struct drmem_lmb *lmb, *first;
 	struct of_drconf_cell_v2 dr_cell;
 	const __be32 *p;
 	u32 i, j, lmb_sets;
@@ -422,10 +422,18 @@ static void __init init_drmem_v2_lmbs(const __be32 *prop)
 	/* second pass, read in the LMB information */
 	lmb_index = 0;
 	p = prop;
+	first = NULL;
 
 	for (i = 0; i < lmb_sets; i++) {
 		read_drconf_v2_cell(&dr_cell, &p);
 
+		/*
+		 * Fetch the NUMA node id for the fist set or if the
+		 * associativity index is different from the previous set.
+		 */
+		if (first && dr_cell.aa_index != first->aa_index)
+			first = NULL;
+
 		for (j = 0; j < dr_cell.seq_lmbs; j++) {
 			lmb = &drmem_info->lmbs[lmb_index++];
 
@@ -438,7 +446,16 @@ static void __init init_drmem_v2_lmbs(const __be32 *prop)
 			lmb->aa_index = dr_cell.aa_index;
 			lmb->flags = dr_cell.flags;
 
-			lmb_set_nid(lmb);
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
 		}
 	}
 }
-- 
2.28.0

