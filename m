Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5D112093B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 16:03:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47c4K74nyczDqFm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 02:03:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47c41268BDzDqSH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 01:49:26 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBGEbvfl130111
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 09:49:24 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wwe3nenj2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 09:49:24 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Mon, 16 Dec 2019 14:49:22 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 16 Dec 2019 14:49:19 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBGEnIPR64421940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Dec 2019 14:49:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 714C942041;
 Mon, 16 Dec 2019 14:49:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EB894204D;
 Mon, 16 Dec 2019 14:49:16 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.102.1.133])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 16 Dec 2019 14:49:16 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v5 4/5] powerpc/numa: Early request for home node associativity
Date: Mon, 16 Dec 2019 20:19:03 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191216144904.6776-1-srikar@linux.vnet.ibm.com>
References: <20191216144904.6776-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19121614-0016-0000-0000-000002D56B04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121614-0017-0000-0000-000033379F77
Message-Id: <20191216144904.6776-5-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-16_05:2019-12-16,2019-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912160131
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
 Nicholas Piggin <npiggin@gmail.com>,
 Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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
Cc: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
---
Changelog (v2->v3):
- Handled comments from Nathan Lynch
  * Use first thread of the core for cpu-to-node map.
  * get hardware-id in numa_setup_cpu

Changelog (v1->v2):
- Handled comments from Nathan Lynch
  * Dont depend on pacas to be setup for the hwid


 arch/powerpc/mm/numa.c | 45 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 63ec0c3c817f..f837a0e725bc 100644
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
@@ -515,7 +551,6 @@ static int numa_setup_cpu(unsigned long lcpu)
 	}
 
 	map_cpu_to_node(lcpu, nid);
-	of_node_put(cpu);
 out:
 	return nid;
 }
@@ -546,7 +581,7 @@ static int ppc_numa_cpu_prepare(unsigned int cpu)
 {
 	int nid;
 
-	nid = numa_setup_cpu(cpu);
+	nid = numa_setup_cpu(cpu, true);
 	verify_cpu_node_mapping(cpu, nid);
 	return 0;
 }
@@ -893,7 +928,7 @@ void __init mem_topology_setup(void)
 	reset_numa_cpu_lookup_table();
 
 	for_each_present_cpu(cpu)
-		numa_setup_cpu(cpu);
+		numa_setup_cpu(cpu, false);
 }
 
 void __init initmem_init(void)
-- 
2.18.1

