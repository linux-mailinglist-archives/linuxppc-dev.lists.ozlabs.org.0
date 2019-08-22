Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF5099780
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 16:57:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DnhB1ygPzDqPK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 00:57:46 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DnMJ0bCjzDqZQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 00:43:07 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7MEdo3N117556
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 10:43:06 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uhv9wteqs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 10:43:05 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Thu, 22 Aug 2019 15:43:03 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 22 Aug 2019 15:43:01 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7MEh0lm40894658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 14:43:00 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A193C4C04E;
 Thu, 22 Aug 2019 14:43:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A23334C052;
 Thu, 22 Aug 2019 14:42:59 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.122.211.52])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Aug 2019 14:42:59 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/numa: Early request for home node associativity
Date: Thu, 22 Aug 2019 20:12:34 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822144235.19398-1-srikar@linux.vnet.ibm.com>
References: <20190822144235.19398-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19082214-0008-0000-0000-0000030BE21C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082214-0009-0000-0000-00004A2A1132
Message-Id: <20190822144235.19398-3-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220148
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
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the kernel detects if its running on a shared lpar platform
and requests home node associativity before the scheduler sched_domains
are setup. However between the time NUMA setup is initialized and the
request for home node associativity, workqueue initializes its per node
cpumask. The per node workqueue possible cpumask may turn invalid
after home node associativity resulting in weird situations like
workqueue possible cpumask being a subset of workqueue online cpumask.

This can be fixed by requesting home node associativity earlier just
before NUMA setup. However at the NUMA setup time, kernel may not be in
a position to detect if its running on a shared lpar platform. So
request for home node associativity and if the request fails, fallback
on the device tree property.

However home node associativity requires cpu's hwid which is set in
smp_setup_pacas. Hence call smp_setup_pacas before numa_setup_cpus.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/setup-common.c |  5 +++--
 arch/powerpc/mm/numa.c             | 28 +++++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 1f8db66..9135dba 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -888,6 +888,9 @@ void __init setup_arch(char **cmdline_p)
 	/* Check the SMT related command line arguments (ppc64). */
 	check_smt_enabled();
 
+#ifdef CONFIG_SMP
+	smp_setup_pacas();
+#endif
 	/* Parse memory topology */
 	mem_topology_setup();
 
@@ -899,8 +902,6 @@ void __init setup_arch(char **cmdline_p)
 	 * so smp_release_cpus() does nothing for them.
 	 */
 #ifdef CONFIG_SMP
-	smp_setup_pacas();
-
 	/* On BookE, setup per-core TLB data structures. */
 	setup_tlb_core_data();
 
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 88b5157..7965d3b 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -461,6 +461,21 @@ static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 	return nid;
 }
 
+static int vphn_get_nid(unsigned long cpu)
+{
+	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
+	long rc;
+
+	/* Use associativity from first thread for all siblings */
+	rc = hcall_vphn(get_hard_smp_processor_id(cpu),
+				VPHN_FLAG_VCPU, associativity);
+
+	if (rc == H_SUCCESS)
+		return  associativity_to_nid(associativity);
+
+	return NUMA_NO_NODE;
+}
+
 /*
  * Figure out to which domain a cpu belongs and stick it there.
  * Return the id of the domain used.
@@ -490,7 +505,18 @@ static int numa_setup_cpu(unsigned long lcpu)
 			goto out;
 	}
 
-	nid = of_node_to_nid_single(cpu);
+	/*
+	 * On a shared lpar, the device tree might not have the correct node
+	 * associativity.  At this time lppaca, or its __old_status field
+	 * may not be updated. Hence request an explicit associativity
+	 * irrespective of whether the lpar is shared or dedicated.  Use the
+	 * device tree property as a fallback.
+	 */
+	if (firmware_has_feature(FW_FEATURE_VPHN))
+		nid = vphn_get_nid(lcpu);
+
+	if (nid == NUMA_NO_NODE)
+		nid = of_node_to_nid_single(cpu);
 
 out_present:
 	if (nid < 0 || !node_possible(nid))
-- 
1.8.3.1

