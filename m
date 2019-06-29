Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C9B5A99F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 10:39:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bRrw1lNMzDqww
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 18:39:44 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bRnc0F4MzDqtQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 18:36:51 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5T8aYEY063650
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 04:36:48 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2te25638as-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 04:36:47 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Sat, 29 Jun 2019 09:36:47 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 29 Jun 2019 09:36:43 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5T8ahh853084620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Jun 2019 08:36:43 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01EBB124052;
 Sat, 29 Jun 2019 08:36:43 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6313124053;
 Sat, 29 Jun 2019 08:36:40 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.87.55])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 29 Jun 2019 08:36:40 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: ["RFC PATCH" 2/2] powerpc/mm: Conslidate numa_enable check and
 min_common_depth check
Date: Sat, 29 Jun 2019 14:06:29 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190629083629.29037-1-aneesh.kumar@linux.ibm.com>
References: <20190629083629.29037-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062908-0060-0000-0000-00000356FFAC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011350; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01224863; UDB=6.00644711; IPR=6.01006065; 
 MB=3.00027520; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-29 08:36:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062908-0061-0000-0000-000049F2FF67
Message-Id: <20190629083629.29037-2-aneesh.kumar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-29_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906290108
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update min_common_depth = -1 if numa is disabled. This
help us to avoid checking for both in different code paths.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index f6d68baeaa96..c84062a390cc 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -212,7 +212,7 @@ static int associativity_to_nid(const __be32 *associativity)
 {
 	int nid = NUMA_NO_NODE;
 
-	if (min_common_depth == -1 || !numa_enabled)
+	if (min_common_depth == -1)
 		goto out;
 
 	if (of_read_number(associativity, 1) >= min_common_depth)
@@ -625,6 +625,7 @@ static int __init parse_numa_properties(void)
 
 	if (numa_enabled == 0) {
 		printk(KERN_WARNING "NUMA disabled by user\n");
+		min_common_depth = -1;
 		return -1;
 	}
 
@@ -747,7 +748,7 @@ void __init dump_numa_cpu_topology(void)
 	unsigned int node;
 	unsigned int cpu, count;
 
-	if (min_common_depth == -1 || !numa_enabled)
+	if (min_common_depth == -1)
 		return;
 
 	for_each_online_node(node) {
@@ -812,7 +813,7 @@ static void __init find_possible_nodes(void)
 	struct device_node *rtas;
 	u32 numnodes, i;
 
-	if (min_common_depth <= 0 || !numa_enabled)
+	if (min_common_depth <= 0)
 		return;
 
 	rtas = of_find_node_by_path("/rtas");
@@ -1014,7 +1015,7 @@ int hot_add_scn_to_nid(unsigned long scn_addr)
 	struct device_node *memory = NULL;
 	int nid;
 
-	if (!numa_enabled || (min_common_depth < 0))
+	if (min_common_depth < 0)
 		return first_online_node;
 
 	memory = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
-- 
2.21.0

