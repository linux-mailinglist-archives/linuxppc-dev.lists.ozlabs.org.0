Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F8214CC1D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 15:09:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4875204ccvzDqSv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 01:08:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4874l55flrzDqQy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 00:56:01 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TDnw0W075645
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 08:55:59 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xu5qb36vg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 08:55:59 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Wed, 29 Jan 2020 13:53:22 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 Jan 2020 13:53:20 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00TDrJCT43843606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2020 13:53:20 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC524A405F;
 Wed, 29 Jan 2020 13:53:19 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31B45A405B;
 Wed, 29 Jan 2020 13:53:18 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.193.110.254])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jan 2020 13:53:17 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v6 4/5] powerpc/numa: Early request for home node associativity
Date: Wed, 29 Jan 2020 19:23:00 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200129135301.24739-1-srikar@linux.vnet.ibm.com>
References: <20200129135301.24739-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20012913-0028-0000-0000-000003D5803D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012913-0029-0000-0000-00002499CBAA
Message-Id: <20200129135301.24739-5-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_03:2020-01-28,
 2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001290115
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
Changelog (v5->v6):
- Handled comments from Michael Ellerman
  * hardware-id is now deciphered in vphn_get_nid
  * No need to pass extra bool

Changelog (v2->v3):
- Handled comments from Nathan Lynch
  * Use first thread of the core for cpu-to-node map.
  * get hardware-id in numa_setup_cpu

Changelog (v1->v2):
- Handled comments from Nathan Lynch
  * Dont depend on pacas to be setup for the hwid

 arch/powerpc/mm/numa.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 63ec0c3..ee7400f 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -461,6 +461,41 @@ static int of_drconf_to_nid_single(struct drmem_lmb *lmb)
 	return nid;
 }
 
+#ifdef CONFIG_PPC_SPLPAR
+static int vphn_get_nid(long lcpu)
+{
+	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
+	long rc, hwid;
+
+	/*
+	 * On a shared lpar, device tree will not have node associativity.
+	 * At this time lppaca, or its __old_status field may not be
+	 * updated. Hence kernel cannot detect if its on a shared lpar. So
+	 * request an explicit associativity irrespective of whether the
+	 * lpar is shared or dedicated. Use the device tree property as a
+	 * fallback. cpu_to_phys_id is only valid between
+	 * smp_setup_cpu_maps() and smp_setup_pacas().
+	 */
+	if (firmware_has_feature(FW_FEATURE_VPHN)) {
+		if (cpu_to_phys_id)
+			hwid = cpu_to_phys_id[lcpu];
+		else
+			hwid = get_hard_smp_processor_id(lcpu);
+
+		rc = hcall_vphn(hwid, VPHN_FLAG_VCPU, associativity);
+		if (rc == H_SUCCESS)
+			return associativity_to_nid(associativity);
+	}
+
+	return NUMA_NO_NODE;
+}
+#else
+static int vphn_get_nid(long unused)
+{
+	return NUMA_NO_NODE;
+}
+#endif  /* CONFIG_PPC_SPLPAR */
+
 /*
  * Figure out to which domain a cpu belongs and stick it there.
  * Return the id of the domain used.
@@ -485,6 +520,10 @@ static int numa_setup_cpu(unsigned long lcpu)
 		return nid;
 	}
 
+	nid = vphn_get_nid(lcpu);
+	if (nid != NUMA_NO_NODE)
+		goto out_present;
+
 	cpu = of_get_cpu_node(lcpu, NULL);
 
 	if (!cpu) {
@@ -496,6 +535,7 @@ static int numa_setup_cpu(unsigned long lcpu)
 	}
 
 	nid = of_node_to_nid_single(cpu);
+	of_node_put(cpu);
 
 out_present:
 	if (nid < 0 || !node_possible(nid))
@@ -515,7 +555,6 @@ static int numa_setup_cpu(unsigned long lcpu)
 	}
 
 	map_cpu_to_node(lcpu, nid);
-	of_node_put(cpu);
 out:
 	return nid;
 }
-- 
1.8.3.1

