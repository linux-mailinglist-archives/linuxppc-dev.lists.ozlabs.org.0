Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF6E23DA6F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 14:48:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMpFs59VnzDqpf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 22:48:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMnzf18sWzDqC5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 22:36:29 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 076CXq1p044650; Thu, 6 Aug 2020 08:36:24 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32ra0rmnw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 08:36:23 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 076CZ16A018039;
 Thu, 6 Aug 2020 12:36:23 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 32n019uph4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 12:36:23 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 076CaLht60096956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Aug 2020 12:36:21 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50AB8C6057;
 Thu,  6 Aug 2020 12:36:21 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46864C6055;
 Thu,  6 Aug 2020 12:36:19 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.71.228])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  6 Aug 2020 12:36:18 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH 2/3] powerpc/numa: Use global variable instead of fetching
 again
Date: Thu,  6 Aug 2020 18:06:03 +0530
Message-Id: <20200806123604.248361-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200806123604.248361-1-aneesh.kumar@linux.ibm.com>
References: <20200806123604.248361-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-06_06:2020-08-06,
 2020-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008060091
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

use mem_addr_cells/mem_size_cells instead of fetching the values
again from device tree.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 36 ++++++++++--------------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 77d41d9775d2..c420872acd61 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -52,7 +52,6 @@ EXPORT_SYMBOL(node_to_cpumask_map);
 EXPORT_SYMBOL(node_data);
 
 static int min_common_depth;
-static int n_mem_addr_cells, n_mem_size_cells;
 static int form1_affinity;
 
 #define MAX_DISTANCE_REF_POINTS 4
@@ -355,19 +354,6 @@ static int __init find_min_common_depth(void)
 	return -1;
 }
 
-static void __init get_n_mem_cells(int *n_addr_cells, int *n_size_cells)
-{
-	struct device_node *memory = NULL;
-
-	memory = of_find_node_by_type(memory, "memory");
-	if (!memory)
-		panic("numa.c: No memory nodes found!");
-
-	*n_addr_cells = of_n_addr_cells(memory);
-	*n_size_cells = of_n_size_cells(memory);
-	of_node_put(memory);
-}
-
 /*  dt_mem_next_cell is __init  */
 static unsigned long read_n_cells(int n, const __be32 **buf)
 {
@@ -639,12 +625,12 @@ static inline int __init read_usm_ranges(const __be32 **usm)
 	 * a counter followed by that many (base, size) duple.
 	 * read the counter from linux,drconf-usable-memory
 	 */
-	return read_n_cells(n_mem_size_cells, usm);
+	return read_n_cells(mem_size_cells, usm);
 }
 
 /*
  * Extract NUMA information from the ibm,dynamic-reconfiguration-memory
- * node.  This assumes n_mem_{addr,size}_cells have been set.
+ * node.  This assumes mem_{addr,size}_cells have been set.
  */
 static int __init numa_setup_drmem_lmb(struct drmem_lmb *lmb,
 					const __be32 **usm,
@@ -677,8 +663,8 @@ static int __init numa_setup_drmem_lmb(struct drmem_lmb *lmb,
 
 	do {
 		if (is_kexec_kdump) {
-			base = read_n_cells(n_mem_addr_cells, usm);
-			size = read_n_cells(n_mem_size_cells, usm);
+			base = read_n_cells(mem_addr_cells, usm);
+			size = read_n_cells(mem_size_cells, usm);
 		}
 
 		nid = of_drconf_to_nid_single(lmb);
@@ -741,8 +727,6 @@ static int __init parse_numa_properties(void)
 		node_set_online(nid);
 	}
 
-	get_n_mem_cells(&n_mem_addr_cells, &n_mem_size_cells);
-
 	for_each_node_by_type(memory, "memory") {
 		unsigned long start;
 		unsigned long size;
@@ -759,11 +743,11 @@ static int __init parse_numa_properties(void)
 			continue;
 
 		/* ranges in cell */
-		ranges = (len >> 2) / (n_mem_addr_cells + n_mem_size_cells);
+		ranges = (len >> 2) / (mem_addr_cells + mem_size_cells);
 new_range:
 		/* these are order-sensitive, and modify the buffer pointer */
-		start = read_n_cells(n_mem_addr_cells, &memcell_buf);
-		size = read_n_cells(n_mem_size_cells, &memcell_buf);
+		start = read_n_cells(mem_addr_cells, &memcell_buf);
+		size = read_n_cells(mem_size_cells, &memcell_buf);
 
 		/*
 		 * Assumption: either all memory nodes or none will
@@ -1042,11 +1026,11 @@ static int hot_add_node_scn_to_nid(unsigned long scn_addr)
 			continue;
 
 		/* ranges in cell */
-		ranges = (len >> 2) / (n_mem_addr_cells + n_mem_size_cells);
+		ranges = (len >> 2) / (mem_addr_cells + mem_size_cells);
 
 		while (ranges--) {
-			start = read_n_cells(n_mem_addr_cells, &memcell_buf);
-			size = read_n_cells(n_mem_size_cells, &memcell_buf);
+			start = read_n_cells(mem_addr_cells, &memcell_buf);
+			size = read_n_cells(mem_size_cells, &memcell_buf);
 
 			if ((scn_addr < start) || (scn_addr >= (start + size)))
 				continue;
-- 
2.26.2

