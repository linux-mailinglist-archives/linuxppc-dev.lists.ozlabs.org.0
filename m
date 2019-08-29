Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B49ADA1147
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 07:56:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JsKr3Kf8zDrDN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 15:56:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JsCy655PzDrCs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 15:50:54 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7T5mXI1017953
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 01:50:52 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2up5buwa3t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 01:50:52 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Thu, 29 Aug 2019 06:50:49 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 29 Aug 2019 06:50:47 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7T5okl431391926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 05:50:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92BFC42041;
 Thu, 29 Aug 2019 05:50:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0ED7442049;
 Thu, 29 Aug 2019 05:50:45 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.204.205.139])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 29 Aug 2019 05:50:44 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 3/4] powerpc/numa: Early request for home node associativity
Date: Thu, 29 Aug 2019 11:20:22 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829055023.6171-1-srikar@linux.vnet.ibm.com>
References: <20190829055023.6171-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19082905-4275-0000-0000-0000035E8E7F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082905-4276-0000-0000-00003870C468
Message-Id: <20190829055023.6171-4-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-29_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908290063
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

While here, fix a problem where of_node_put could be called even when
of_get_cpu_node was not successful.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
---
Changelog (v2->v1):
- Handled comments from Nathan Lynch
  * Dont depend on pacas to be setup for the hwid

 arch/powerpc/mm/numa.c | 43 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 8fbe57c..de4a1a1 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -461,14 +461,33 @@ static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 	return nid;
 }
 
+static int vphn_get_nid(unsigned long cpu, bool get_hwid)
+{
+	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
+	long rc, hwid;
+
+	if (get_hwid)
+		hwid = get_hard_smp_processor_id(cpu);
+	else
+		hwid = cpu_to_phys_id[cpu];
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
 	int nid = NUMA_NO_NODE;
-	struct device_node *cpu;
+	struct device_node *cpu = NULL;
 
 	/*
 	 * If a valid cpu-to-node mapping is already available, use it
@@ -480,6 +499,20 @@ static int numa_setup_cpu(unsigned long lcpu)
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
+	if (firmware_has_feature(FW_FEATURE_VPHN))
+		nid = vphn_get_nid(lcpu, get_hwid);
+
+	if (nid != NUMA_NO_NODE)
+		goto out_present;
+
 	cpu = of_get_cpu_node(lcpu, NULL);
 
 	if (!cpu) {
@@ -491,13 +524,13 @@ static int numa_setup_cpu(unsigned long lcpu)
 	}
 
 	nid = of_node_to_nid_single(cpu);
+	of_node_put(cpu);
 
 out_present:
 	if (nid < 0 || !node_possible(nid))
 		nid = first_online_node;
 
 	map_cpu_to_node(lcpu, nid);
-	of_node_put(cpu);
 out:
 	return nid;
 }
@@ -528,7 +561,7 @@ static int ppc_numa_cpu_prepare(unsigned int cpu)
 {
 	int nid;
 
-	nid = numa_setup_cpu(cpu);
+	nid = numa_setup_cpu(cpu, true);
 	verify_cpu_node_mapping(cpu, nid);
 	return 0;
 }
@@ -875,7 +908,7 @@ void __init mem_topology_setup(void)
 	reset_numa_cpu_lookup_table();
 
 	for_each_present_cpu(cpu)
-		numa_setup_cpu(cpu);
+		numa_setup_cpu(cpu, false);
 }
 
 void __init initmem_init(void)
-- 
1.8.3.1

