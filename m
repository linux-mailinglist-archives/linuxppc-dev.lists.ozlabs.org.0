Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E82B1C1E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 13:26:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VCxf0PjSzF4QG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 21:25:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VCcN6jKyzF50K
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 21:11:00 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8DB941Z094676
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 07:10:55 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v079bp1rc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 07:10:37 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Fri, 13 Sep 2019 12:10:03 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 13 Sep 2019 12:10:00 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8DB9Yh244237064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 11:09:34 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F1BF42052;
 Fri, 13 Sep 2019 11:09:59 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 822FC42042;
 Fri, 13 Sep 2019 11:09:58 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.122.211.212])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 13 Sep 2019 11:09:58 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v4 5/5] powerpc/numa: Remove late request for home node
 associativity
Date: Fri, 13 Sep 2019 16:39:45 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913110945.12564-1-srikar@linux.vnet.ibm.com>
References: <20190913110945.12564-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19091311-4275-0000-0000-0000036546B4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091311-4276-0000-0000-00003877A446
Message-Id: <20190913110945.12564-6-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-13_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909130107
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

With commit ("powerpc/numa: Early request for home node associativity"),
commit 2ea626306810 ("powerpc/topology: Get topology for shared
processors at boot") which was requesting home node associativity
becomes redundant.

Hence remove the late request for home node associativity.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/topology.h | 4 ----
 arch/powerpc/kernel/smp.c           | 5 -----
 arch/powerpc/mm/numa.c              | 9 ---------
 3 files changed, 18 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 2f7e1ea..9bd396f 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -98,7 +98,6 @@ static inline int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 extern int prrn_is_enabled(void);
 extern int find_and_online_cpu_nid(int cpu);
 extern int timed_topology_update(int nsecs);
-extern void __init shared_proc_topology_init(void);
 #else
 static inline int start_topology_update(void)
 {
@@ -121,9 +120,6 @@ static inline int timed_topology_update(int nsecs)
 	return 0;
 }
 
-#ifdef CONFIG_SMP
-static inline void shared_proc_topology_init(void) {}
-#endif
 #endif /* CONFIG_NUMA && CONFIG_PPC_SPLPAR */
 
 #include <asm-generic/topology.h>
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index ea6adbf..cdd39a0 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1359,11 +1359,6 @@ void __init smp_cpus_done(unsigned int max_cpus)
 	if (smp_ops && smp_ops->bringup_done)
 		smp_ops->bringup_done();
 
-	/*
-	 * On a shared LPAR, associativity needs to be requested.
-	 * Hence, get numa topology before dumping cpu topology
-	 */
-	shared_proc_topology_init();
 	dump_numa_cpu_topology();
 
 #ifdef CONFIG_SCHED_SMT
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index f837a0e..3ba8dc0 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1628,15 +1628,6 @@ int prrn_is_enabled(void)
 	return prrn_enabled;
 }
 
-void __init shared_proc_topology_init(void)
-{
-	if (lppaca_shared_proc(get_lppaca())) {
-		bitmap_fill(cpumask_bits(&cpu_associativity_changes_mask),
-			    nr_cpumask_bits);
-		numa_update_cpu_topology(false);
-	}
-}
-
 static int topology_read(struct seq_file *file, void *v)
 {
 	if (vphn_enabled || prrn_enabled)
-- 
1.8.3.1

