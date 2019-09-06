Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC912ABA75
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 16:14:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Q00n5QBTzDqvK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 00:14:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PzTy5zk4zDqPj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 23:50:46 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x86Dl1gs001326
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Sep 2019 09:50:43 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uunkse91h-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Sep 2019 09:50:42 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Fri, 6 Sep 2019 14:50:41 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 6 Sep 2019 14:50:38 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x86DoEXt11993490
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Sep 2019 13:50:14 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA4E84C04E;
 Fri,  6 Sep 2019 13:50:37 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91F8B4C04A;
 Fri,  6 Sep 2019 13:50:36 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.122.211.241])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Sep 2019 13:50:36 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 4/5] powerpc/numa: Early request for home node associativity
Date: Fri,  6 Sep 2019 19:20:19 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190906135020.19772-1-srikar@linux.vnet.ibm.com>
References: <20190906135020.19772-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19090613-4275-0000-0000-00000361FA7E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090613-4276-0000-0000-000038744666
Message-Id: <20190906135020.19772-5-srikar@linux.vnet.ibm.com>
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

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
---
Changelog (v1->v2):
- Handled comments from Nathan Lynch
  * Dont depend on pacas to be setup for the hwid

Changelog (v2->v3):
- Handled comments from Nathan Lynch
  * Use first thread of the core for cpu-to-node map.
  * get hardware-id in numa_setup_cpu

 arch/powerpc/mm/numa.c | 45 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index d0af9a2..5bb11ef 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -461,13 +461,27 @@ static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 	return nid;
 }
 
+static int vphn_get_nid(long hwid)
+{
+	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
+	long rc;
+
+	rc = hcall_vphn(hwid, VPHN_FLAG_VCPU, associativity);
+	if (rc == H_SUCCESS)
+		return associativity_to_nid(associativity);
+
+	return NUMA_NO_NODE;
+}
+
 /*
  * Figure out to which domain a cpu belongs and stick it there.
+ * cpu_to_phys_id is only valid between smp_setup_cpu_maps() and
+ * smp_setup_pacas(). If called outside this window, set get_hwid to true.
  * Return the id of the domain used.
  */
-static int numa_setup_cpu(unsigned long lcpu)
+static int numa_setup_cpu(unsigned long lcpu, bool get_hwid)
 {
-	struct device_node *cpu;
+	struct device_node *cpu = NULL;
 	int fcpu = cpu_first_thread_sibling(lcpu);
 	int nid = NUMA_NO_NODE;
 
@@ -485,6 +499,27 @@ static int numa_setup_cpu(unsigned long lcpu)
 		return nid;
 	}
 
+	/*
+	 * On a shared lpar, device tree will not have node associativity.
+	 * At this time lppaca, or its __old_status field may not be
+	 * updated. Hence kernel cannot detect if its on a shared lpar. So
+	 * request an explicit associativity irrespective of whether the
+	 * lpar is shared or dedicated. Use the device tree property as a
+	 * fallback.
+	 */
+	if (firmware_has_feature(FW_FEATURE_VPHN)) {
+		long hwid;
+
+		if (get_hwid)
+			hwid = get_hard_smp_processor_id(lcpu);
+		else
+			hwid = cpu_to_phys_id[lcpu];
+		nid = vphn_get_nid(hwid);
+	}
+
+	if (nid != NUMA_NO_NODE)
+		goto out_present;
+
 	cpu = of_get_cpu_node(lcpu, NULL);
 
 	if (!cpu) {
@@ -496,6 +531,7 @@ static int numa_setup_cpu(unsigned long lcpu)
 	}
 
 	nid = of_node_to_nid_single(cpu);
+	of_node_put(cpu);
 
 out_present:
 	if (nid < 0 || !node_possible(nid))
@@ -512,7 +548,6 @@ static int numa_setup_cpu(unsigned long lcpu)
 		map_cpu_to_node(fcpu, nid);
 
 	map_cpu_to_node(lcpu, nid);
-	of_node_put(cpu);
 out:
 	return nid;
 }
@@ -543,7 +578,7 @@ static int ppc_numa_cpu_prepare(unsigned int cpu)
 {
 	int nid;
 
-	nid = numa_setup_cpu(cpu);
+	nid = numa_setup_cpu(cpu, true);
 	verify_cpu_node_mapping(cpu, nid);
 	return 0;
 }
@@ -890,7 +925,7 @@ void __init mem_topology_setup(void)
 	reset_numa_cpu_lookup_table();
 
 	for_each_present_cpu(cpu)
-		numa_setup_cpu(cpu);
+		numa_setup_cpu(cpu, false);
 }
 
 void __init initmem_init(void)
-- 
1.8.3.1

