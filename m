Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7BE2D47BD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 18:20:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrkMQ2YzjzDqv1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 04:20:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=euDfzr5V; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Crk7V5yN0zDqts
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 04:09:58 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9H25eY057469; Wed, 9 Dec 2020 12:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=6uSbHcpSaoYBdEBNb/No1VYRzs2Ng4+6qOahQsHEX/A=;
 b=euDfzr5VdTb2jkoO4X57PrFUmwfThcDHMYHAcI0tmNzo39+CWfiTXi11fJ1RZ89ONj5t
 RyZ5AleX9rfkwZP9T+BgAfs2pw8pDAza9HepYd4MFucq8grVu7I5mbcsHdXfMERA5qtj
 p8sblKx+Ms2Ah29nQrFw3fPvcWI+kLroZkgJtPxNESlNrZsyD2ou+pfccw8yVUvcv167
 f5nBG3Epdg/Z+ljYItjK/JaksLEqkQuN2f3Wf6XAlWV5OnrP2m/oqwQS3x6CcYx0kOcg
 FibXgBNEHi7dMNrcSxsIG2wCfdLHhz9AtZUuqCTq1YnZFhVahGRbLzwb0bDEvPxkP2FK vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35amchhd36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:09:50 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B9H7Dln084102;
 Wed, 9 Dec 2020 12:09:50 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35amchhd2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:09:50 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B9H7TEc016252;
 Wed, 9 Dec 2020 17:09:49 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01wdc.us.ibm.com with ESMTP id 3581u9f2yb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 17:09:49 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B9H8WxS24248796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 17:08:32 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 278356E054;
 Wed,  9 Dec 2020 17:08:32 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B97066E058;
 Wed,  9 Dec 2020 17:08:31 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.58.223])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 17:08:31 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 67FBE2E35A8; Wed,  9 Dec 2020 22:38:28 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Anton Blanchard <anton@ozlabs.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Subject: [PATCH v2 2/5] powerpc/smp: Rename cpu_l1_cache_map as
 thread_group_l1_cache_map
Date: Wed,  9 Dec 2020 22:38:17 +0530
Message-Id: <1607533700-5546-3-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607533700-5546-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1607533700-5546-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_14:2020-12-09,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090116
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

On platforms which have the "ibm,thread-groups" property, the per-cpu
variable cpu_l1_cache_map keeps a track of which group of threads
within the same core share the L1 cache, Instruction and Data flow.

This patch renames the variable to "thread_group_l1_cache_map" to make
it consistent with a subsequent patch which will introduce
thread_group_l2_cache_map.

This patch introduces no functional change.

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/smp.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 88d88ad..f3290d5 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -116,10 +116,10 @@ struct thread_groups_list {
 
 static struct thread_groups_list tgl[NR_CPUS] __initdata;
 /*
- * On big-cores system, cpu_l1_cache_map for each CPU corresponds to
+ * On big-cores system, thread_group_l1_cache_map for each CPU corresponds to
  * the set its siblings that share the L1-cache.
  */
-DEFINE_PER_CPU(cpumask_var_t, cpu_l1_cache_map);
+DEFINE_PER_CPU(cpumask_var_t, thread_group_l1_cache_map);
 
 /* SMP operations for this machine */
 struct smp_ops_t *smp_ops;
@@ -866,7 +866,7 @@ static struct thread_groups *__init get_thread_groups(int cpu,
 	return tg;
 }
 
-static int init_cpu_l1_cache_map(int cpu)
+static int init_thread_group_l1_cache_map(int cpu)
 
 {
 	int first_thread = cpu_first_thread_sibling(cpu);
@@ -885,7 +885,7 @@ static int init_cpu_l1_cache_map(int cpu)
 		return -ENODATA;
 	}
 
-	zalloc_cpumask_var_node(&per_cpu(cpu_l1_cache_map, cpu),
+	zalloc_cpumask_var_node(&per_cpu(thread_group_l1_cache_map, cpu),
 				GFP_KERNEL, cpu_to_node(cpu));
 
 	for (i = first_thread; i < first_thread + threads_per_core; i++) {
@@ -897,7 +897,7 @@ static int init_cpu_l1_cache_map(int cpu)
 		}
 
 		if (i_group_start == cpu_group_start)
-			cpumask_set_cpu(i, per_cpu(cpu_l1_cache_map, cpu));
+			cpumask_set_cpu(i, per_cpu(thread_group_l1_cache_map, cpu));
 	}
 
 	return 0;
@@ -976,7 +976,7 @@ static int init_big_cores(void)
 	int cpu;
 
 	for_each_possible_cpu(cpu) {
-		int err = init_cpu_l1_cache_map(cpu);
+		int err = init_thread_group_l1_cache_map(cpu);
 
 		if (err)
 			return err;
@@ -1372,7 +1372,7 @@ static inline void add_cpu_to_smallcore_masks(int cpu)
 
 	cpumask_set_cpu(cpu, cpu_smallcore_mask(cpu));
 
-	for_each_cpu(i, per_cpu(cpu_l1_cache_map, cpu)) {
+	for_each_cpu(i, per_cpu(thread_group_l1_cache_map, cpu)) {
 		if (cpu_online(i))
 			set_cpus_related(i, cpu, cpu_smallcore_mask);
 	}
-- 
1.9.4

