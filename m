Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DFA4637D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 17:58:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QQHV0JxmzDqyH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 01:57:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QQ070BkczDrg1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 01:44:38 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5EFhJ32039774
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 11:44:36 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t4e17s8wv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 11:44:35 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Fri, 14 Jun 2019 16:44:34 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 14 Jun 2019 16:44:32 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5EFiUqf54657188
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2019 15:44:30 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74F4311C054;
 Fri, 14 Jun 2019 15:44:30 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F211211C052;
 Fri, 14 Jun 2019 15:44:28 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.70.176])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Jun 2019 15:44:28 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 5/9] powerpc/pseries: Generalize hcall_vphn()
Date: Fri, 14 Jun 2019 21:14:03 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1560526066.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1560526066.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061415-4275-0000-0000-000003425D1A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061415-4276-0000-0000-000038527B41
Message-Id: <abcb1314522d21ca0360c7a2005fb48e792bf4df.1560526066.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-14_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906140130
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
 Mingming Cao <mingming.cao@ibm.com>, linuxppc-dev@lists.ozlabs.org
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
index 917904d2fe97..42ea79514420 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1083,6 +1083,17 @@ static void reset_topology_timer(void);
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
@@ -1161,25 +1172,13 @@ static int update_cpu_associativity_changes_mask(void)
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

