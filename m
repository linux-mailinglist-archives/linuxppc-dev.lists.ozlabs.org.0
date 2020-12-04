Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 658882CE72D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 05:57:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnL6D151JzDrBZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 15:57:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ur7SpceI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnKyh0JDTzDrMb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 15:50:35 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B44arTU018626; Thu, 3 Dec 2020 23:50:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=R0i9+wxuiJShJrMueiOY/u2GCafpNRq4IhXXqNZAv94=;
 b=Ur7SpceI7cih5L7H/MbaMbJetpdgnuxupgxf2ieJDXZtAggp87sm+NUnD9rDtAevtQzA
 +7C6ZMiiJ8Z3q3kmk9Dv/haEWSJO4O65zDKsCpuCewxPjgcyTne0dJpnTAKyrm1wOrsP
 1pwNdDFHewOo7VHxDIEhk5CqKVYUEilWFy2s1+DHf0seXvoolS12lbTn0fJNF8KSCt/2
 tgUqCKxuRS1oAQ82yrT+1sIw2Pm5LGBbHlZjSidjiYV860qNLagTiRfoQkJAo2LjyeRI
 i8Qtn/PGk3hYCA1VvlbqZ4jh8OtvVYZiO7yIaG17dgMFa/tKN9K2nXDhGiJpjHKv/v/w gA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357d3pj21h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 23:50:24 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B44lYAg082262;
 Thu, 3 Dec 2020 23:50:23 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 357d3pj20v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 23:50:23 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B44dhco019978;
 Fri, 4 Dec 2020 04:50:22 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 355vrg7cng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 04:50:22 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B44n65i18350426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 04:49:06 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B5D9136063;
 Fri,  4 Dec 2020 04:49:06 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8A79136053;
 Fri,  4 Dec 2020 04:49:05 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.56.248])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 04:49:05 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id A82902E3889; Fri,  4 Dec 2020 10:19:01 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Anton Blanchard <anton@ozlabs.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Subject: [PATCH 1/3] powerpc/smp: Parse ibm,
 thread-groups with multiple properties
Date: Fri,  4 Dec 2020 10:18:45 +0530
Message-Id: <1607057327-29822-2-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1607057327-29822-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1607057327-29822-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_01:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=2 malwarescore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040024
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

The "ibm,thread-groups" device-tree property is an array that is used
to indicate if groups of threads within a core share certain
properties. It provides details of which property is being shared by
which groups of threads. This array can encode information about
multiple properties being shared by different thread-groups within the
core.

Example: Suppose,
"ibm,thread-groups" = [1,2,4,8,10,12,14,9,11,13,15,2,2,4,8,10,12,14,9,11,13,15]

This can be decomposed up into two consecutive arrays:

a) [1,2,4,8,10,12,14,9,11,13,15]
b) [2,2,4,8,10,12,14,9,11,13,15]

where in,

a) provides information of Property "1" being shared by "2" groups,
   each with "4" threads each. The "ibm,ppc-interrupt-server#s" of the
   first group is {8,10,12,14} and the "ibm,ppc-interrupt-server#s" of
   the second group is {9,11,13,15}. Property "1" is indicative of
   the thread in the group sharing L1 cache, translation cache and
   Instruction Data flow.

b) provides information of Property "2" being shared by "2" groups,
   each group with "4" threads. The "ibm,ppc-interrupt-server#s" of
   the first group is {8,10,12,14} and the
   "ibm,ppc-interrupt-server#s" of the second group is
   {9,11,13,15}. Property "2" indicates that the threads in each group
   share the L2-cache.
   
The existing code assumes that the "ibm,thread-groups" encodes
information about only one property. Hence even on platforms which
encode information about multiple properties being shared by the
corresponding groups of threads, the current code will only pick the
first one. (In the above example, it will only consider
[1,2,4,8,10,12,14,9,11,13,15] but not [2,2,4,8,10,12,14,9,11,13,15]).

This patch extends the parsing support on platforms which encode
information about multiple properties being shared by the
corresponding groups of threads.

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/smp.c | 146 +++++++++++++++++++++++++++++-----------------
 1 file changed, 92 insertions(+), 54 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 8c2857c..6a242a3 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -106,6 +106,15 @@ struct thread_groups {
 	unsigned int thread_list[MAX_THREAD_LIST_SIZE];
 };
 
+/* Maximum number of properties that groups of threads within a core can share */
+#define MAX_THREAD_GROUP_PROPERTIES 1
+
+struct thread_groups_list {
+	unsigned int nr_properties;
+	struct thread_groups property_tgs[MAX_THREAD_GROUP_PROPERTIES];
+};
+
+static struct thread_groups_list tgl[NR_CPUS] __initdata;
 /*
  * On big-cores system, cpu_l1_cache_map for each CPU corresponds to
  * the set its siblings that share the L1-cache.
@@ -695,81 +704,94 @@ static void or_cpumasks_related(int i, int j, struct cpumask *(*srcmask)(int),
 /*
  * parse_thread_groups: Parses the "ibm,thread-groups" device tree
  *                      property for the CPU device node @dn and stores
- *                      the parsed output in the thread_groups
- *                      structure @tg if the ibm,thread-groups[0]
- *                      matches @property.
+ *                      the parsed output in the thread_groups_list
+ *                      structure @tglp.
  *
  * @dn: The device node of the CPU device.
- * @tg: Pointer to a thread group structure into which the parsed
+ * @tglp: Pointer to a thread group list structure into which the parsed
  *      output of "ibm,thread-groups" is stored.
- * @property: The property of the thread-group that the caller is
- *            interested in.
  *
  * ibm,thread-groups[0..N-1] array defines which group of threads in
  * the CPU-device node can be grouped together based on the property.
  *
- * ibm,thread-groups[0] tells us the property based on which the
+ * This array can represent thread groupings for multiple properties.
+ *
+ * ibm,thread-groups[i + 0] tells us the property based on which the
  * threads are being grouped together. If this value is 1, it implies
  * that the threads in the same group share L1, translation cache.
  *
- * ibm,thread-groups[1] tells us how many such thread groups exist.
+ * ibm,thread-groups[i+1] tells us how many such thread groups exist for the
+ * property ibm,thread-groups[i]
  *
- * ibm,thread-groups[2] tells us the number of threads in each such
+ * ibm,thread-groups[i+2] tells us the number of threads in each such
  * group.
+ * Suppose k = (ibm,thread-groups[i+1] * ibm,thread-groups[i+2]), then,
  *
- * ibm,thread-groups[3..N-1] is the list of threads identified by
+ * ibm,thread-groups[i+3..i+k+2] (is the list of threads identified by
  * "ibm,ppc-interrupt-server#s" arranged as per their membership in
  * the grouping.
  *
- * Example: If ibm,thread-groups = [1,2,4,5,6,7,8,9,10,11,12] it
- * implies that there are 2 groups of 4 threads each, where each group
- * of threads share L1, translation cache.
+ * Example:
+ * If ibm,thread-groups = [1,2,4,5,6,7,8,9,10,11,12,2,2,4,5,7,9,11,6,8,10,12]
+ * This can be decomposed up into two consecutive arrays:
+ * a) [1,2,4,5,6,7,8,9,10,11,12]
+ * b) [2,2,4,5,7,9,11,6,8,10,12]
+ * where in,
  *
- * The "ibm,ppc-interrupt-server#s" of the first group is {5,6,7,8}
- * and the "ibm,ppc-interrupt-server#s" of the second group is {9, 10,
- * 11, 12} structure
+ * a) there are 2 groups of 4 threads each, where each group of
+ * threads share Property 1 (L1, translation cache). The
+ * "ibm,ppc-interrupt-server#s" of the first group is {5,6,7,8} and
+ * the "ibm,ppc-interrupt-server#s" of the second group is {9, 10, 11,
+ * 12}.
+ *
+ * b) there are 2 groups of 4 threads each, where each group of
+ *    threads share some property indicated by the first value 2. The
+ *    "ibm,ppc-interrupt-server#s" of the first group is {5,7,9,11}
+ *    and the "ibm,ppc-interrupt-server#s" of the second group is
+ *    {6,8,10,12} structure
  *
  * Returns 0 on success, -EINVAL if the property does not exist,
  * -ENODATA if property does not have a value, and -EOVERFLOW if the
  * property data isn't large enough.
  */
 static int parse_thread_groups(struct device_node *dn,
-			       struct thread_groups *tg,
-			       unsigned int property)
+			       struct thread_groups_list *tglp)
 {
-	int i;
-	u32 thread_group_array[3 + MAX_THREAD_LIST_SIZE];
+	int i = 0;
+	u32 *thread_group_array;
 	u32 *thread_list;
 	size_t total_threads;
-	int ret;
+	int ret = 0, count;
+	unsigned int property_idx = 0;
 
+	count = of_property_count_u32_elems(dn, "ibm,thread-groups");
+	thread_group_array = kcalloc(count, sizeof(u32), GFP_KERNEL);
 	ret = of_property_read_u32_array(dn, "ibm,thread-groups",
-					 thread_group_array, 3);
+					 thread_group_array, count);
 	if (ret)
-		return ret;
-
-	tg->property = thread_group_array[0];
-	tg->nr_groups = thread_group_array[1];
-	tg->threads_per_group = thread_group_array[2];
-	if (tg->property != property ||
-	    tg->nr_groups < 1 ||
-	    tg->threads_per_group < 1)
-		return -ENODATA;
+		goto out_free;
 
-	total_threads = tg->nr_groups * tg->threads_per_group;
+	while (i < count && property_idx < MAX_THREAD_GROUP_PROPERTIES) {
+		int j;
+		struct thread_groups *tg = &tglp->property_tgs[property_idx++];
 
-	ret = of_property_read_u32_array(dn, "ibm,thread-groups",
-					 thread_group_array,
-					 3 + total_threads);
-	if (ret)
-		return ret;
+		tg->property = thread_group_array[i];
+		tg->nr_groups = thread_group_array[i + 1];
+		tg->threads_per_group = thread_group_array[i + 2];
+		total_threads = tg->nr_groups * tg->threads_per_group;
+
+		thread_list = &thread_group_array[i + 3];
 
-	thread_list = &thread_group_array[3];
+		for (j = 0; j < total_threads; j++)
+			tg->thread_list[j] = thread_list[j];
+		i = i + 3 + total_threads;
+	}
 
-	for (i = 0 ; i < total_threads; i++)
-		tg->thread_list[i] = thread_list[i];
+	tglp->nr_properties = property_idx;
 
-	return 0;
+out_free:
+	kfree(thread_group_array);
+	return ret;
 }
 
 /*
@@ -805,24 +827,39 @@ static int get_cpu_thread_group_start(int cpu, struct thread_groups *tg)
 	return -1;
 }
 
-static int init_cpu_l1_cache_map(int cpu)
+static int init_cpu_cache_map(int cpu, unsigned int cache_property)
 
 {
 	struct device_node *dn = of_get_cpu_node(cpu, NULL);
-	struct thread_groups tg = {.property = 0,
-				   .nr_groups = 0,
-				   .threads_per_group = 0};
+	struct thread_groups *tg = NULL;
 	int first_thread = cpu_first_thread_sibling(cpu);
 	int i, cpu_group_start = -1, err = 0;
+	cpumask_var_t *mask;
+	struct thread_groups_list *cpu_tgl = &tgl[cpu];
 
 	if (!dn)
 		return -ENODATA;
 
-	err = parse_thread_groups(dn, &tg, THREAD_GROUP_SHARE_L1);
-	if (err)
-		goto out;
+	if (!(cache_property == THREAD_GROUP_SHARE_L1))
+		return -EINVAL;
 
-	cpu_group_start = get_cpu_thread_group_start(cpu, &tg);
+	if (!cpu_tgl->nr_properties) {
+		err = parse_thread_groups(dn, cpu_tgl);
+		if (err)
+			goto out;
+	}
+
+	for (i = 0; i < cpu_tgl->nr_properties; i++) {
+		if (cpu_tgl->property_tgs[i].property == cache_property) {
+			tg = &cpu_tgl->property_tgs[i];
+			break;
+		}
+	}
+
+	if (!tg)
+		return -EINVAL;
+
+	cpu_group_start = get_cpu_thread_group_start(cpu, tg);
 
 	if (unlikely(cpu_group_start == -1)) {
 		WARN_ON_ONCE(1);
@@ -830,11 +867,12 @@ static int init_cpu_l1_cache_map(int cpu)
 		goto out;
 	}
 
-	zalloc_cpumask_var_node(&per_cpu(cpu_l1_cache_map, cpu),
-				GFP_KERNEL, cpu_to_node(cpu));
+	mask = &per_cpu(cpu_l1_cache_map, cpu);
+
+	zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cpu));
 
 	for (i = first_thread; i < first_thread + threads_per_core; i++) {
-		int i_group_start = get_cpu_thread_group_start(i, &tg);
+		int i_group_start = get_cpu_thread_group_start(i, tg);
 
 		if (unlikely(i_group_start == -1)) {
 			WARN_ON_ONCE(1);
@@ -843,7 +881,7 @@ static int init_cpu_l1_cache_map(int cpu)
 		}
 
 		if (i_group_start == cpu_group_start)
-			cpumask_set_cpu(i, per_cpu(cpu_l1_cache_map, cpu));
+			cpumask_set_cpu(i, *mask);
 	}
 
 out:
@@ -924,7 +962,7 @@ static int init_big_cores(void)
 	int cpu;
 
 	for_each_possible_cpu(cpu) {
-		int err = init_cpu_l1_cache_map(cpu);
+		int err = init_cpu_cache_map(cpu, THREAD_GROUP_SHARE_L1);
 
 		if (err)
 			return err;
-- 
1.9.4

