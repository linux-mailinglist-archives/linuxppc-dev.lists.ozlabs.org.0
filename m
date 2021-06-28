Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D1A3B64D6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 17:14:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDB3J6JRNz3bfp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 01:14:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=inx6v31h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=inx6v31h; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDB0R6KRrz3bTG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 01:11:51 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SF4RwS123742; Mon, 28 Jun 2021 11:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=V2d9y9UJBNz/03zsL1CzX6SDQfq6jpVxhZ7Q68boxqk=;
 b=inx6v31hMmeunoDrZa+FIkKnMFEzdbHmcwEysCgnH8XHtTl/LOYECYP9wakN1da/jWrr
 fEBGMhYrw/r2O7bftWZFT5vUR7HqxellzWuFnow846Pcl56mA0jvZNNOPMrj/h9ZHFeA
 wrT9SYCtBBpH0U4qhxxyWEAroDFp55sXLjy+hRqbSmLQrldp/BZNVOFc0wboRS5t7IV5
 dHcvJ7FIO5wsMsNwoPU1R37ReQE2ZmwYAV5Ez2Rs0vmzjX2ZaJytgAVFbNvmkiUVeJKy
 ketLqycsfID9VA61u/mXSBMTIHMv23cE1lTNb6Qa9TlhsnUOg9V4WN9+k0mLj4524Qpn ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fgf90ysm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 11:11:46 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15SF4acK124603;
 Mon, 28 Jun 2021 11:11:45 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fgf90yrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 11:11:45 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15SF2ifa013487;
 Mon, 28 Jun 2021 15:11:44 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 39duvam1n3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 15:11:44 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15SFBhVL27132212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Jun 2021 15:11:43 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B16328064;
 Mon, 28 Jun 2021 15:11:43 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F01D28066;
 Mon, 28 Jun 2021 15:11:41 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.75.58])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 28 Jun 2021 15:11:40 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 5/6] powerpc/pseries: Add a helper for form1 cpu distance
Date: Mon, 28 Jun 2021 20:41:16 +0530
Message-Id: <20210628151117.545935-6-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
References: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yS1gyT_1ARkObYQM3sIExRrk-PQ6HZhu
X-Proofpoint-GUID: Z3FdUE8vOavR8kPFZe0Y4pLzJgEYXAuf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_12:2021-06-25,
 2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106280104
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
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This helper is only used with the dispatch trace log collection.
A later patch will add Form2 affinity support and this change helps
in keeping that simpler. Also add a comment explaining we don't expect
the code to be called with FORM0

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/topology.h   |  4 ++--
 arch/powerpc/mm/numa.c                | 10 +++++++++-
 arch/powerpc/platforms/pseries/lpar.c |  4 ++--
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index e4db64c0e184..ac8b5ed79832 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -36,7 +36,7 @@ static inline int pcibus_to_node(struct pci_bus *bus)
 				 cpu_all_mask :				\
 				 cpumask_of_node(pcibus_to_node(bus)))
 
-extern int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc);
+int cpu_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc);
 extern int __node_distance(int, int);
 #define node_distance(a, b) __node_distance(a, b)
 
@@ -83,7 +83,7 @@ static inline void sysfs_remove_device_from_node(struct device *dev,
 
 static inline void update_numa_cpu_lookup_table(unsigned int cpu, int node) {}
 
-static inline int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
+static inline int cpu_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 {
 	return 0;
 }
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 7b142f79d600..c6293037a103 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -166,7 +166,7 @@ static void unmap_cpu_from_node(unsigned long cpu)
 }
 #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
 
-int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
+static int __cpu_form1_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 {
 	int dist = 0;
 
@@ -182,6 +182,14 @@ int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 	return dist;
 }
 
+int cpu_relative_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
+{
+	/* We should not get called with FORM0 */
+	VM_WARN_ON(affinity_form == FORM0_AFFINITY);
+
+	return __cpu_form1_relative_distance(cpu1_assoc, cpu2_assoc);
+}
+
 /* must hold reference to node during call */
 static const __be32 *of_get_associativity(struct device_node *dev)
 {
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index dab356e3ff87..afefbdfe768d 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -261,7 +261,7 @@ static int cpu_relative_dispatch_distance(int last_disp_cpu, int cur_disp_cpu)
 	if (!last_disp_cpu_assoc || !cur_disp_cpu_assoc)
 		return -EIO;
 
-	return cpu_distance(last_disp_cpu_assoc, cur_disp_cpu_assoc);
+	return cpu_relative_distance(last_disp_cpu_assoc, cur_disp_cpu_assoc);
 }
 
 static int cpu_home_node_dispatch_distance(int disp_cpu)
@@ -281,7 +281,7 @@ static int cpu_home_node_dispatch_distance(int disp_cpu)
 	if (!disp_cpu_assoc || !vcpu_assoc)
 		return -EIO;
 
-	return cpu_distance(disp_cpu_assoc, vcpu_assoc);
+	return cpu_relative_distance(disp_cpu_assoc, vcpu_assoc);
 }
 
 static void update_vcpu_disp_stat(int disp_cpu)
-- 
2.31.1

