Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B871F7385
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 07:32:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jq9d5kQdzDqw6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 15:32:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jplF0vN6zDqgC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 15:12:56 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05C52iHL034806; Fri, 12 Jun 2020 01:12:52 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31kvmvh76q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:52 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05C535hq037029;
 Fri, 12 Jun 2020 01:12:51 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31kvmvh76j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:51 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05C5B448009886;
 Fri, 12 Jun 2020 05:12:51 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 31g2s98566-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 05:12:51 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05C5Co9b22216968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jun 2020 05:12:50 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D1C678060;
 Fri, 12 Jun 2020 05:12:50 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7B9A7805F;
 Fri, 12 Jun 2020 05:12:49 +0000 (GMT)
Received: from localhost (unknown [9.65.252.60])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 12 Jun 2020 05:12:49 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/18] powerpc/numa: remove start/stop_topology_update()
Date: Fri, 12 Jun 2020 00:12:31 -0500
Message-Id: <20200612051238.1007764-12-nathanl@linux.ibm.com>
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
 phishscore=0 suspectscore=1
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 cotscore=-2147483648 bulkscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006110174
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

These APIs have become no-ops, so remove them and all call sites.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/topology.h       | 10 ----------
 arch/powerpc/mm/numa.c                    | 20 --------------------
 arch/powerpc/platforms/pseries/mobility.c |  4 ----
 arch/powerpc/platforms/pseries/suspend.c  |  5 +----
 4 files changed, 1 insertion(+), 38 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 379e2cc3789f..537c638582eb 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -93,19 +93,9 @@ static inline int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 #endif /* CONFIG_NUMA */
 
 #if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
-extern int start_topology_update(void);
-extern int stop_topology_update(void);
 extern int prrn_is_enabled(void);
 extern int find_and_online_cpu_nid(int cpu);
 #else
-static inline int start_topology_update(void)
-{
-	return 0;
-}
-static inline int stop_topology_update(void)
-{
-	return 0;
-}
 static inline int prrn_is_enabled(void)
 {
 	return 0;
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 6c579ac3e679..dec7ce3b5e67 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1157,8 +1157,6 @@ static long vphn_get_associativity(unsigned long cpu,
 			, rc);
 		break;
 	}
-
-	stop_topology_update();
 out:
 	return rc;
 }
@@ -1212,22 +1210,6 @@ int arch_update_cpu_topology(void)
 	return numa_update_cpu_topology(true);
 }
 
-/*
- * Start polling for associativity changes.
- */
-int start_topology_update(void)
-{
-	return 0;
-}
-
-/*
- * Disable polling for VPHN associativity changes.
- */
-int stop_topology_update(void)
-{
-	return 0;
-}
-
 int prrn_is_enabled(void)
 {
 	return 0;
@@ -1235,8 +1217,6 @@ int prrn_is_enabled(void)
 
 static int topology_update_init(void)
 {
-	start_topology_update();
-
 	topology_inited = 1;
 	return 0;
 }
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 10d982997736..c0b09f6f0ae3 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -388,8 +388,6 @@ static ssize_t migration_store(struct class *class,
 	if (rc)
 		return rc;
 
-	stop_topology_update();
-
 	do {
 		rc = rtas_ibm_suspend_me(streamid);
 		if (rc == -EAGAIN)
@@ -401,8 +399,6 @@ static ssize_t migration_store(struct class *class,
 
 	post_mobility_fixup();
 
-	start_topology_update();
-
 	return count;
 }
 
diff --git a/arch/powerpc/platforms/pseries/suspend.c b/arch/powerpc/platforms/pseries/suspend.c
index f789693f61f4..81e0ac58d620 100644
--- a/arch/powerpc/platforms/pseries/suspend.c
+++ b/arch/powerpc/platforms/pseries/suspend.c
@@ -145,11 +145,8 @@ static ssize_t store_hibernate(struct device *dev,
 			ssleep(1);
 	} while (rc == -EAGAIN);
 
-	if (!rc) {
-		stop_topology_update();
+	if (!rc)
 		rc = pm_suspend(PM_SUSPEND_MEM);
-		start_topology_update();
-	}
 
 	stream_id = 0;
 
-- 
2.25.4

