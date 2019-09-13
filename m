Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CADC0B1C17
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 13:18:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VCmw2ZnwzF5R1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 21:18:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VCbL4NCCzF3mY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 21:10:06 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8DB8D0t139612
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 07:10:03 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v06sa75ab-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 07:10:03 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Fri, 13 Sep 2019 12:10:00 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 13 Sep 2019 12:09:57 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8DB9ufk59834490
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 11:09:56 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C442C4204F;
 Fri, 13 Sep 2019 11:09:56 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10D234204C;
 Fri, 13 Sep 2019 11:09:56 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.122.211.212])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 13 Sep 2019 11:09:55 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v4 3/5] powerpc/numa: Use cpu node map of first sibling thread
Date: Fri, 13 Sep 2019 16:39:43 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913110945.12564-1-srikar@linux.vnet.ibm.com>
References: <20190913110945.12564-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19091311-0016-0000-0000-000002AAD289
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091311-0017-0000-0000-0000330B68A7
Message-Id: <20190913110945.12564-4-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-13_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909130107
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All the sibling threads of a core have to be part of the same node.
To ensure that all the sibling threads map to the same node, always
lookup/update the cpu-to-node map of the first thread in the core.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog: v3->v4
As suggested by Nathan, add a warning while mapping offline cpu.

 arch/powerpc/mm/numa.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 8fbe57c..63ec0c3 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -467,15 +467,20 @@ static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
  */
 static int numa_setup_cpu(unsigned long lcpu)
 {
-	int nid = NUMA_NO_NODE;
 	struct device_node *cpu;
+	int fcpu = cpu_first_thread_sibling(lcpu);
+	int nid = NUMA_NO_NODE;
 
 	/*
 	 * If a valid cpu-to-node mapping is already available, use it
 	 * directly instead of querying the firmware, since it represents
 	 * the most recent mapping notified to us by the platform (eg: VPHN).
+	 * Since cpu_to_node binding remains the same for all threads in the
+	 * core. If a valid cpu-to-node mapping is already available, for
+	 * the first thread in the core, use it.
 	 */
-	if ((nid = numa_cpu_lookup_table[lcpu]) >= 0) {
+	nid = numa_cpu_lookup_table[fcpu];
+	if (nid >= 0) {
 		map_cpu_to_node(lcpu, nid);
 		return nid;
 	}
@@ -496,6 +501,19 @@ static int numa_setup_cpu(unsigned long lcpu)
 	if (nid < 0 || !node_possible(nid))
 		nid = first_online_node;
 
+	/*
+	 * Update for the first thread of the core. All threads of a core
+	 * have to be part of the same node. This not only avoids querying
+	 * for every other thread in the core, but always avoids a case
+	 * where virtual node associativity change causes subsequent threads
+	 * of a core to be associated with different nid. However if first
+	 * thread is already online, expect it to have a valid mapping.
+	 */
+	if (fcpu != lcpu) {
+		WARN_ON(cpu_online(fcpu));
+		map_cpu_to_node(fcpu, nid);
+	}
+
 	map_cpu_to_node(lcpu, nid);
 	of_node_put(cpu);
 out:
-- 
1.8.3.1

