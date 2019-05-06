Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A745D147D0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 11:50:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yHzw14NKzDqQM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 19:50:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yHrZ07fVzDqK5
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 19:44:29 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x469hFDX014713
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 6 May 2019 05:44:27 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sajd18ehy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2019 05:44:27 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Mon, 6 May 2019 10:44:25 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 May 2019 10:44:23 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x469iLRp43188442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 May 2019 09:44:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62DAD42041;
 Mon,  6 May 2019 09:44:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 919734204C;
 Mon,  6 May 2019 09:44:18 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.199.155.34])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 May 2019 09:44:18 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Lynch <nathanl@linux.ibm.com>, Mingming Cao <mingming.cao@ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: [RFC PATCH 4/6] powerpc/pseries: Generalize hcall_vphn()
Date: Mon,  6 May 2019 15:13:47 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1557134488.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1557134488.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19050609-0008-0000-0000-000002E3BE6B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050609-0009-0000-0000-0000225035D6
Message-Id: <4d28c93861ebb1f36d25d68ca4fd34a9fdff6029.1557134488.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905060085
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

H_HOME_NODE_ASSOCIATIVITY hcall can take two different flags and return
different associativity information in each case. Generalize the
existing hcall_vphn() function to take flags as an argument and to
return the result. Update the only existing user to pass the proper
arguments.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/mm/book3s64/vphn.h |  8 ++++++++
 arch/powerpc/mm/numa.c          | 27 +++++++++++++--------------
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/vphn.h b/arch/powerpc/mm/book3s64/vphn.h
index f0b93c2dd578..f7ff1e0c3801 100644
--- a/arch/powerpc/mm/book3s64/vphn.h
+++ b/arch/powerpc/mm/book3s64/vphn.h
@@ -11,6 +11,14 @@
  */
 #define VPHN_ASSOC_BUFSIZE (VPHN_REGISTER_COUNT*sizeof(u64)/sizeof(u16) + 1)
 
+/*
+ * The H_HOME_NODE_ASSOCIATIVITY hcall takes two values for flags:
+ * 1 for retrieving associativity information for a guest cpu
+ * 2 for retrieving associativity information for a host/hypervisor cpu
+ */
+#define VPHN_FLAG_VCPU	1
+#define VPHN_FLAG_PCPU	2
+
 extern int vphn_unpack_associativity(const long *packed, __be32 *unpacked);
 
 #endif
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 57e64273cb33..57f006b6214b 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1087,6 +1087,17 @@ static void reset_topology_timer(void);
 static int topology_timer_secs = 1;
 static int topology_inited;
 
+static long hcall_vphn(unsigned long cpu, u64 flags, __be32 *associativity)
+{
+	long rc;
+	long retbuf[PLPAR_HCALL9_BUFSIZE] = {0};
+
+	rc = plpar_hcall9(H_HOME_NODE_ASSOCIATIVITY, retbuf, flags, cpu);
+	vphn_unpack_associativity(retbuf, associativity);
+
+	return rc;
+}
+
 /*
  * Change polling interval for associativity changes.
  */
@@ -1165,25 +1176,13 @@ static int update_cpu_associativity_changes_mask(void)
  * Retrieve the new associativity information for a virtual processor's
  * home node.
  */
-static long hcall_vphn(unsigned long cpu, __be32 *associativity)
-{
-	long rc;
-	long retbuf[PLPAR_HCALL9_BUFSIZE] = {0};
-	u64 flags = 1;
-	int hwcpu = get_hard_smp_processor_id(cpu);
-
-	rc = plpar_hcall9(H_HOME_NODE_ASSOCIATIVITY, retbuf, flags, hwcpu);
-	vphn_unpack_associativity(retbuf, associativity);
-
-	return rc;
-}
-
 static long vphn_get_associativity(unsigned long cpu,
 					__be32 *associativity)
 {
 	long rc;
 
-	rc = hcall_vphn(cpu, associativity);
+	rc = hcall_vphn(get_hard_smp_processor_id(cpu),
+				VPHN_FLAG_VCPU, associativity);
 
 	switch (rc) {
 	case H_FUNCTION:
-- 
2.21.0

