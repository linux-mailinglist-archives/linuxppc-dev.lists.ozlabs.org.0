Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4049220CA8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 14:09:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6GQF5PvJzDq5n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 22:09:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6GMR4GfPzDqgj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 22:06:43 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06FC2D8f133838; Wed, 15 Jul 2020 08:06:36 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 329r1hrfdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 08:06:36 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06FC62lf008370;
 Wed, 15 Jul 2020 12:06:34 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 327527j80v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 12:06:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06FC6WFc56098904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jul 2020 12:06:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB29C4C044;
 Wed, 15 Jul 2020 12:06:31 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 765C14C052;
 Wed, 15 Jul 2020 12:06:30 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.85.111.3])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Jul 2020 12:06:30 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] powerpc/numa: Limit possible nodes to within
 num_possible_nodes
Date: Wed, 15 Jul 2020 17:35:33 +0530
Message-Id: <20200715120534.3673-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <871rljfet9.fsf@linux.ibm.com>
References: <871rljfet9.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_10:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 adultscore=0 mlxscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007150098
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

MAX_NUMNODES is a theoretical maximum number of nodes thats is supported
by the kernel. Device tree properties exposes the number of possible
nodes on the current platform. The kernel would detected this and would
use it for most of its resource allocations.  If the platform now
increases the nodes to over what was already exposed, then it may lead
to inconsistencies. Hence limit it to the already exposed nodes.

Suggested-by: Nathan Lynch <nathanl@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Michael Ellerman <michaele@au1.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/mm/numa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 8ec7ff05ae47..a2c5fe0d0cad 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -221,7 +221,7 @@ static void initialize_distance_lookup_table(int nid,
 	}
 }
 
-/* Returns nid in the range [0..MAX_NUMNODES-1], or -1 if no useful numa
+/* Returns nid in the range [0..num_possible_nodes()-1], or -1 if no useful numa
  * info is found.
  */
 static int associativity_to_nid(const __be32 *associativity)
@@ -235,7 +235,7 @@ static int associativity_to_nid(const __be32 *associativity)
 		nid = of_read_number(&associativity[min_common_depth], 1);
 
 	/* POWER4 LPAR uses 0xffff as invalid node */
-	if (nid == 0xffff || nid >= MAX_NUMNODES)
+	if (nid == 0xffff || nid >= num_possible_nodes())
 		nid = NUMA_NO_NODE;
 
 	if (nid > 0 &&
@@ -448,7 +448,7 @@ static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 		index = lmb->aa_index * aa.array_sz + min_common_depth - 1;
 		nid = of_read_number(&aa.arrays[index], 1);
 
-		if (nid == 0xffff || nid >= MAX_NUMNODES)
+		if (nid == 0xffff || nid >= num_possible_nodes())
 			nid = default_nid;
 
 		if (nid > 0) {
-- 
2.18.2

