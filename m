Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBD55BED2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 16:57:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cr7T1lJCzDqTd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 00:57:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cqhJ0svczDqX6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 00:37:03 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x61ERP12073116
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 1 Jul 2019 10:37:00 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tfkmba1v4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 10:37:00 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Mon, 1 Jul 2019 15:36:59 +0100
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 1 Jul 2019 15:36:39 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x61Eacos9044558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jul 2019 14:36:38 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18DC9AC05F;
 Mon,  1 Jul 2019 14:36:38 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A90F5AC05B;
 Mon,  1 Jul 2019 14:36:35 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.81.231])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  1 Jul 2019 14:36:35 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: [PATCH v2 3/3] powerpc/mm: Consolidate numa_enable check and
 min_common_depth check
Date: Mon,  1 Jul 2019 20:06:26 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701143626.17628-1-aneesh.kumar@linux.ibm.com>
References: <20190701143626.17628-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070114-0052-0000-0000-000003D8F5AD
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011360; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01225932; UDB=6.00645359; IPR=6.01007144; 
 MB=3.00027536; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-01 14:36:58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070114-0053-0000-0000-000061873321
Message-Id: <20190701143626.17628-3-aneesh.kumar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907010179
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If we fail to parse min_common_depth from device tree we boot with
numa disabled. Reflect the same by updating numa_enabled variable
to false. Also, switch all min_common_depth failure check to
if (!numa_enabled) check.

This helps us to avoid checking for both in different code paths.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 27f792c0df68..848b4663c7ad 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -212,7 +212,7 @@ static int associativity_to_nid(const __be32 *associativity)
 {
 	int nid = NUMA_NO_NODE;
 
-	if (min_common_depth == -1 || !numa_enabled)
+	if (!numa_enabled)
 		goto out;
 
 	if (of_read_number(associativity, 1) >= min_common_depth)
@@ -628,8 +628,14 @@ static int __init parse_numa_properties(void)
 
 	min_common_depth = find_min_common_depth();
 
-	if (min_common_depth < 0)
+	if (min_common_depth < 0) {
+		/*
+		 * if we fail to parse min_common_depth from device tree
+		 * mark the numa disabled, boot with numa disabled.
+		 */
+		numa_enabled = false;
 		return min_common_depth;
+	}
 
 	dbg("NUMA associativity depth for CPU/Memory: %d\n", min_common_depth);
 
@@ -745,7 +751,7 @@ void __init dump_numa_cpu_topology(void)
 	unsigned int node;
 	unsigned int cpu, count;
 
-	if (min_common_depth == -1 || !numa_enabled)
+	if (!numa_enabled)
 		return;
 
 	for_each_online_node(node) {
@@ -810,7 +816,7 @@ static void __init find_possible_nodes(void)
 	struct device_node *rtas;
 	u32 numnodes, i;
 
-	if (min_common_depth <= 0 || !numa_enabled)
+	if (!numa_enabled)
 		return;
 
 	rtas = of_find_node_by_path("/rtas");
@@ -1012,7 +1018,7 @@ int hot_add_scn_to_nid(unsigned long scn_addr)
 	struct device_node *memory = NULL;
 	int nid;
 
-	if (!numa_enabled || (min_common_depth < 0))
+	if (!numa_enabled)
 		return first_online_node;
 
 	memory = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
-- 
2.21.0

