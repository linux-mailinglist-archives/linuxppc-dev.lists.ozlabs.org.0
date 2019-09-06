Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18682ABA89
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 16:17:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Q04R2DRgzDrBd
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 00:17:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PzV45BQ7zDqQw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 23:50:52 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x86DlQoW125186
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Sep 2019 09:50:49 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uuns4xugx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Sep 2019 09:50:48 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Fri, 6 Sep 2019 14:50:39 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 6 Sep 2019 14:50:37 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x86DoaoY34800034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Sep 2019 13:50:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DC474C04A;
 Fri,  6 Sep 2019 13:50:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 221844C046;
 Fri,  6 Sep 2019 13:50:35 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.122.211.241])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Sep 2019 13:50:34 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 3/5] powerpc/numa: Use cpu node map of first sibling thread
Date: Fri,  6 Sep 2019 19:20:18 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190906135020.19772-1-srikar@linux.vnet.ibm.com>
References: <20190906135020.19772-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19090613-0020-0000-0000-00000368897C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090613-0021-0000-0000-000021BE02F4
Message-Id: <20190906135020.19772-4-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-06_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909060147
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
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All the sibling threads of a core have to be part of the same node.
To ensure that all the sibling threads map to the same node, always
lookup/update the cpu-to-node map of the first thread in the core.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
---
 arch/powerpc/mm/numa.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 8fbe57c..d0af9a2 100644
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
@@ -496,6 +501,16 @@ static int numa_setup_cpu(unsigned long lcpu)
 	if (nid < 0 || !node_possible(nid))
 		nid = first_online_node;
 
+	/*
+	 * Update for the first thread of the core. All threads of a core
+	 * have to be part of the same node. This not only avoids querying
+	 * for every other thread in the core, but always avoids a case
+	 * where virtual node associativity change causes subsequent threads
+	 * of a core to be associated with different nid.
+	 */
+	if (fcpu != lcpu)
+		map_cpu_to_node(fcpu, nid);
+
 	map_cpu_to_node(lcpu, nid);
 	of_node_put(cpu);
 out:
-- 
1.8.3.1

