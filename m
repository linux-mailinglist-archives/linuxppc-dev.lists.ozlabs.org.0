Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE71023DA72
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 14:51:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMpJf599JzDqDX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 22:51:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMnzg1yjbzDqD7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 22:36:31 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 076CZ9ec194013; Thu, 6 Aug 2020 08:36:26 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32qu0w5p77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 08:36:26 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 076CZgXn023159;
 Thu, 6 Aug 2020 12:36:25 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 32n019hckp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 12:36:25 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 076CaOww46072230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Aug 2020 12:36:24 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7DB8C605B;
 Thu,  6 Aug 2020 12:36:23 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9ADFC6055;
 Thu,  6 Aug 2020 12:36:21 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.71.228])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  6 Aug 2020 12:36:21 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH 3/3] powerpc/lmb-size: Use addr #size-cells value when
 fetching lmb-size
Date: Thu,  6 Aug 2020 18:06:04 +0530
Message-Id: <20200806123604.248361-3-aneesh.kumar@linux.ibm.com>
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
 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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

Make it consistent with other usages.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c        |  7 ++++---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 10 ++++++----
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index ca76d9d6372a..a48e6618a27b 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -497,7 +497,7 @@ static int __init probe_memory_block_size(unsigned long node, const char *uname,
 					  depth, void *data)
 {
 	unsigned long *mem_block_size = (unsigned long *)data;
-	const __be64 *prop;
+	const __be32 *prop;
 	int len;
 
 	if (depth != 1)
@@ -507,13 +507,14 @@ static int __init probe_memory_block_size(unsigned long node, const char *uname,
 		return 0;
 
 	prop = of_get_flat_dt_prop(node, "ibm,lmb-size", &len);
-	if (!prop || len < sizeof(__be64))
+
+	if (!prop || len < dt_root_size_cells * sizeof(__be32))
 		/*
 		 * Nothing in the device tree
 		 */
 		*mem_block_size = MIN_MEMORY_BLOCK_SIZE;
 	else
-		*mem_block_size = be64_to_cpup(prop);
+		*mem_block_size = of_read_number(prop, dt_root_size_cells);
 	return 1;
 }
 
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 5d545b78111f..aba23ef8dfdd 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -30,12 +30,14 @@ unsigned long pseries_memory_block_size(void)
 
 	np = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
 	if (np) {
-		const __be64 *size;
+		int len;
+		const __be32 *prop;
 
-		size = of_get_property(np, "ibm,lmb-size", NULL);
-		if (size)
-			memblock_size = be64_to_cpup(size);
+		prop = of_get_property(np, "ibm,lmb-size", &len);
+		if (prop && len >= mem_size_cells * sizeof(__be32))
+			memblock_size = of_read_number(prop, mem_size_cells);
 		of_node_put(np);
+
 	} else  if (machine_is(pseries)) {
 		/* This fallback really only applies to pseries */
 		unsigned int memzero_size = 0;
-- 
2.26.2

