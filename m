Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF741FDC1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 04:38:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454FwP2LSdzDqY6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 12:38:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tyreld@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454Fv65tRyzDqX7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 12:37:21 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4G2bHBm025493
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 22:37:17 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sgv2hppk6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 22:37:17 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <tyreld@linux.ibm.com>;
 Thu, 16 May 2019 03:37:11 +0100
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 May 2019 03:37:10 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4G2b9W112976256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 May 2019 02:37:09 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0636C2805A;
 Thu, 16 May 2019 02:37:09 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 634CE28058;
 Thu, 16 May 2019 02:37:08 +0000 (GMT)
Received: from ltcalpine2-lp11.aus.stglabs.ibm.com (unknown [9.40.195.194])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 16 May 2019 02:37:08 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 1/3] powerpc/pseries: Simplify cpu readd to use drc_index
Date: Wed, 15 May 2019 21:37:04 -0500
X-Mailer: git-send-email 2.18.1
X-TM-AS-GCONF: 00
x-cbid: 19051602-0060-0000-0000-00000340F1F5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011103; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01203939; UDB=6.00631989; IPR=6.00984869; 
 MB=3.00026909; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-16 02:37:11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051602-0061-0000-0000-0000495D8275
Message-Id: <20190516023706.50118-1-tyreld@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-16_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905160017
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
Cc: nathanl@linux.ibm.com, Tyrel Datwyler <tyreld@linux.ibm.com>,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, mingming.cao@ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The current dlpar_cpu_readd() takes in a cpu_id and uses that to look up
the cpus device_node so that we can get at the ibm,my-drc-index
property. The only user of cpu readd is an OF notifier call back. This
call back already has a reference to the device_node and therefore can
retrieve the drc_index from the device_node.

This patch simplifies dlpar_cpu_readd() to take a drc_index directly and
does away with an uneccsary device_node lookup.

Signed-off-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/topology.h          |  2 +-
 arch/powerpc/mm/numa.c                       |  6 +++---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 10 +---------
 3 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index f85e2b01c3df..c906d9ec9013 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -133,7 +133,7 @@ static inline void shared_proc_topology_init(void) {}
 #define topology_core_cpumask(cpu)	(per_cpu(cpu_core_map, cpu))
 #define topology_core_id(cpu)		(cpu_to_core_id(cpu))
 
-int dlpar_cpu_readd(int cpu);
+int dlpar_cpu_readd(u32 drc_index);
 #endif
 #endif
 
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 57e64273cb33..40c0b6da12c2 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1479,9 +1479,9 @@ static int dt_update_callback(struct notifier_block *nb,
 	case OF_RECONFIG_UPDATE_PROPERTY:
 		if (of_node_is_type(update->dn, "cpu") &&
 		    !of_prop_cmp(update->prop->name, "ibm,associativity")) {
-			u32 core_id;
-			of_property_read_u32(update->dn, "reg", &core_id);
-			rc = dlpar_cpu_readd(core_id);
+			u32 drc_index;
+			of_property_read_u32(update->dn, "ibm,my-drc-index", &drc_index);
+			rc = dlpar_cpu_readd(drc_index);
 			rc = NOTIFY_OK;
 		}
 		break;
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 97feb6e79f1a..2dfa9416ce54 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -802,18 +802,10 @@ static int dlpar_cpu_add_by_count(u32 cpus_to_add)
 	return rc;
 }
 
-int dlpar_cpu_readd(int cpu)
+int dlpar_cpu_readd(u32 drc_index)
 {
-	struct device_node *dn;
-	struct device *dev;
-	u32 drc_index;
 	int rc;
 
-	dev = get_cpu_device(cpu);
-	dn = dev->of_node;
-
-	rc = of_property_read_u32(dn, "ibm,my-drc-index", &drc_index);
-
 	rc = dlpar_cpu_remove_by_index(drc_index);
 	if (!rc)
 		rc = dlpar_cpu_add(drc_index);
-- 
2.18.1

