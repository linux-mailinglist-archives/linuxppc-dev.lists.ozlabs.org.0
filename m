Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6761F738B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 07:34:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jqCl43xszDqNw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 15:34:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jplF24JWzDqhD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 15:12:57 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05C52ABx139058; Fri, 12 Jun 2020 01:12:53 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31kyekndsg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:52 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05C52sox141465;
 Fri, 12 Jun 2020 01:12:51 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31kyekndrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:51 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05C5B447009886;
 Fri, 12 Jun 2020 05:12:50 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 31g2s98563-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 05:12:50 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05C5Cn8w50200916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jun 2020 05:12:49 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B7F26A047;
 Fri, 12 Jun 2020 05:12:49 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD3AB6A051;
 Fri, 12 Jun 2020 05:12:48 +0000 (GMT)
Received: from localhost (unknown [9.65.252.60])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 12 Jun 2020 05:12:48 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/18] powerpc/numa: remove timed_topology_update()
Date: Fri, 12 Jun 2020 00:12:30 -0500
Message-Id: <20200612051238.1007764-11-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200612051238.1007764-1-nathanl@linux.ibm.com>
References: <20200612051238.1007764-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_23:2020-06-11,
 2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=1
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 cotscore=-2147483648 phishscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006110174
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
Cc: tyreld@linux.ibm.com, srikar@linux.vnet.ibm.com, ego@linux.vnet.ibm.com,
 npiggin@gmail.com, svaidy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

timed_topology_update is a no-op now, so remove it and all call sites.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/topology.h          | 5 -----
 arch/powerpc/mm/numa.c                       | 9 ---------
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 2 --
 3 files changed, 16 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 2db7ba789720..379e2cc3789f 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -97,7 +97,6 @@ extern int start_topology_update(void);
 extern int stop_topology_update(void);
 extern int prrn_is_enabled(void);
 extern int find_and_online_cpu_nid(int cpu);
-extern int timed_topology_update(int nsecs);
 #else
 static inline int start_topology_update(void)
 {
@@ -115,10 +114,6 @@ static inline int find_and_online_cpu_nid(int cpu)
 {
 	return 0;
 }
-static inline int timed_topology_update(int nsecs)
-{
-	return 0;
-}
 
 #endif /* CONFIG_NUMA && CONFIG_PPC_SPLPAR */
 
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index b220e5b60140..6c579ac3e679 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1124,14 +1124,6 @@ u64 memory_hotplug_max(void)
 #ifdef CONFIG_PPC_SPLPAR
 static int topology_inited;
 
-/*
- * Change polling interval for associativity changes.
- */
-int timed_topology_update(int nsecs)
-{
-	return 0;
-}
-
 /*
  * Retrieve the new associativity information for a virtual processor's
  * home node.
@@ -1147,7 +1139,6 @@ static long vphn_get_associativity(unsigned long cpu,
 	switch (rc) {
 	case H_SUCCESS:
 		dbg("VPHN hcall succeeded. Reset polling...\n");
-		timed_topology_update(0);
 		goto out;
 
 	case H_FUNCTION:
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index d4b346355bb9..dbfabb185eb5 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -263,7 +263,6 @@ static int dlpar_offline_cpu(struct device_node *dn)
 				break;
 
 			cpu_maps_update_done();
-			timed_topology_update(1);
 			rc = device_offline(get_cpu_device(cpu));
 			if (rc)
 				goto out;
@@ -302,7 +301,6 @@ static int dlpar_online_cpu(struct device_node *dn)
 			if (get_hard_smp_processor_id(cpu) != thread)
 				continue;
 			cpu_maps_update_done();
-			timed_topology_update(1);
 			find_and_online_cpu_nid(cpu);
 			rc = device_online(get_cpu_device(cpu));
 			if (rc) {
-- 
2.25.4

