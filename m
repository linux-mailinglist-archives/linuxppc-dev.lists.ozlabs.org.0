Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBCAABABB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 16:21:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Q09q59gVzDr3h
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 00:21:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PzV22Z7hzDqQ8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 23:50:50 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x86Dl1rj058246
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 Sep 2019 09:50:45 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uuqcdk1t1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Sep 2019 09:50:44 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Fri, 6 Sep 2019 14:50:42 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 6 Sep 2019 14:50:40 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x86Dod5332440468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Sep 2019 13:50:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 332544C050;
 Fri,  6 Sep 2019 13:50:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A6394C044;
 Fri,  6 Sep 2019 13:50:38 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.122.211.241])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Sep 2019 13:50:37 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 5/5] powerpc/numa: Remove late request for home node
 associativity
Date: Fri,  6 Sep 2019 19:20:20 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190906135020.19772-1-srikar@linux.vnet.ibm.com>
References: <20190906135020.19772-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19090613-4275-0000-0000-00000361FA7F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090613-4276-0000-0000-000038744667
Message-Id: <20190906135020.19772-6-srikar@linux.vnet.ibm.com>
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
index 5bb11ef..22a7bf5 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1625,15 +1625,6 @@ int prrn_is_enabled(void)
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

