Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3392522FAF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 11:06:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456tLd4b1CzDqKX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 19:06:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anju@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456tJn1D7tzDqJN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 19:05:12 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4K8rURS047512
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 05:05:09 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2skrrq9dwb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 05:05:09 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Mon, 20 May 2019 10:05:07 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 May 2019 10:05:04 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4K953BU54198292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 May 2019 09:05:03 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C606A4054;
 Mon, 20 May 2019 09:05:03 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DE38A405C;
 Mon, 20 May 2019 09:05:02 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.72])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 May 2019 09:05:02 +0000 (GMT)
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Use cpumask_last() to determine the
Date: Mon, 20 May 2019 14:35:01 +0530
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19052009-0020-0000-0000-0000033E823B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052009-0021-0000-0000-00002191579F
Message-Id: <20190520090501.20415-1-anju@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905200065
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
Cc: aravinda@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, anju@linux.vnet.ibm.com, ego@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nest and core imc(In-memory Collection counters) assigns a particular
cpu as the designated target for counter data collection.
During system boot, the first online cpu in a chip gets assigned as
the designated cpu for that chip(for nest-imc) and the first online cpu
in a core gets assigned as the designated cpu for that core(for core-imc).

If the designated cpu goes offline, the next online cpu from the same
chip(for nest-imc)/core(for core-imc) is assigned as the next target,
and the event context is migrated to the target cpu.
Currently, cpumask_any_but() function is used to find the target cpu.
Though this function is expected to return a `random` cpu, this always
returns the next online cpu.

If all cpus in a chip/core is offlined in a sequential manner, starting
from the first cpu, the event migration has to happen for all the cpus
which goes offline. Since the migration process involves a grace period,
the total time taken to offline all the cpus will be significantly high.

Example:
In a system which has 2 sockets, with
NUMA node0 CPU(s):     0-87
NUMA node8 CPU(s):     88-175

Time taken to offline cpu 88-175:
real    2m56.099s
user    0m0.191s
sys     0m0.000s

Use cpumask_last() to choose the target cpu, when the designated cpu
goes online, so the migration will happen only when the last_cpu in the
mask goes offline. This way the time taken to offline all cpus in a
chip/core can be reduced.

With the patch, 

Time taken  to offline cpu 88-175:
real    0m12.207s
user    0m0.171s
sys     0m0.000s

cpumask_last() is a better way to find the target cpu, since in most of the
cases cpuhotplug is performed in an increasing order(even in ppc64_cpu).

cpumask_any_but() can still be used to check the possibility of other
online cpus from the same chip/core if the last cpu in the mask goes
offline.

Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
---
 arch/powerpc/perf/imc-pmu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index 31fa753..fbfd6e7 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -366,7 +366,14 @@ static int ppc_nest_imc_cpu_offline(unsigned int cpu)
 	 */
 	nid = cpu_to_node(cpu);
 	l_cpumask = cpumask_of_node(nid);
-	target = cpumask_any_but(l_cpumask, cpu);
+	target = cpumask_last(l_cpumask);
+
+	/*
+	 * If this(target) is the last cpu in the cpumask for this chip,
+	 * check for any possible online cpu in the chip.
+	 */
+	if (unlikely(target == cpu))
+		target = cpumask_any_but(l_cpumask, cpu);
 
 	/*
 	 * Update the cpumask with the target cpu and
@@ -671,7 +678,10 @@ static int ppc_core_imc_cpu_offline(unsigned int cpu)
 		return 0;
 
 	/* Find any online cpu in that core except the current "cpu" */
-	ncpu = cpumask_any_but(cpu_sibling_mask(cpu), cpu);
+	ncpu = cpumask_last(cpu_sibling_mask(cpu));
+
+	if (unlikely(ncpu == cpu))
+		ncpu = cpumask_any_but(cpu_sibling_mask(cpu), cpu);
 
 	if (ncpu >= 0 && ncpu < nr_cpu_ids) {
 		cpumask_set_cpu(ncpu, &core_imc_cpumask);
-- 
1.8.3.1

