Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D54B3526BB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 08:50:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBVzX4sMvz3c5N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 17:50:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OMpeQROF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OMpeQROF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBVz34wgkz3bp5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 17:49:35 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1326Yao2124081; Fri, 2 Apr 2021 02:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version; s=pp1;
 bh=PgsCIrL2mu+iOD/Qn3wSfwzSnmZ681wYYsBIYHt4Sd0=;
 b=OMpeQROFjZxDBZagTyhct1wpstYaFIfnvpXBKtACSW3eyU+ZKj1+0uHgGnCjM8EgVaZo
 5iI7sv9MlQzdrpl82vWezFozfzCtRiigL30eLMlVq5LXYGulDEamsm1WryCwewKNzHwU
 zdXXMVZUfVYhXl7t37gOqGgbioJ3tI25E1AB4cEtMHkq0gRvDwZw1MvWm//Fu7TElHSI
 nkT+wvt8As4/g59Q20H8qjvWzIUK6nqOB2IxDT1mp+W1slYsYGH5ZDHwc01p6PtrP577
 hPqUF22JMdNtHobl3mZT/MUI/YxHopgE6+zRlPhH3FPZNgt2ZFBBiJefR+clBdkG7ltg 9w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37ng725gpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Apr 2021 02:49:24 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1326hXC6150669;
 Fri, 2 Apr 2021 02:49:23 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37ng725gp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Apr 2021 02:49:23 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1326mXG5006749;
 Fri, 2 Apr 2021 06:49:22 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 37n28w1j5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Apr 2021 06:49:22 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1326nL8c32440650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Apr 2021 06:49:21 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF542124055;
 Fri,  2 Apr 2021 06:49:21 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16436124052;
 Fri,  2 Apr 2021 06:49:21 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.102.0.8])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  2 Apr 2021 06:49:21 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id C394D2E334A; Fri,  2 Apr 2021 11:08:10 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Mel Gorman <mgorman@techsingularity.net>, Rik van Riel <riel@surriel.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anton Blanchard <anton@ozlabs.org>, Parth Shah <parth@linux.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Subject: [RFC/PATCH] powerpc/smp: Add SD_SHARE_PKG_RESOURCES flag to MC
 sched-domain
Date: Fri,  2 Apr 2021 11:07:54 +0530
Message-Id: <1617341874-1205-1-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oc07bL_3JD_xgY0qcnN0ZrN3oJ2K2XEZ
X-Proofpoint-ORIG-GUID: DnlfZnzz3zWfKUY19Xz1vcWH5rbVke4Y
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-02_03:2021-04-01,
 2021-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103310000 definitions=main-2104020047
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
 LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

On POWER10 systems, the L2 cache is at the SMT4 small core level. The
following commits ensure that L2 cache gets correctly discovered and
the Last-Level-Cache domain (LLC) is set to the SMT sched-domain.

    790a166 powerpc/smp: Parse ibm,thread-groups with multiple properties
    1fdc1d6 powerpc/smp: Rename cpu_l1_cache_map as thread_group_l1_cache_map
    fbd2b67 powerpc/smp: Rename init_thread_group_l1_cache_map() to make
                         it generic
    538abe powerpc/smp: Add support detecting thread-groups sharing L2 cache
    0be4763 powerpc/cacheinfo: Print correct cache-sibling map/list for L2 cache

However, with the LLC now on the SMT sched-domain, we are seeing some
regressions in the performance of applications that requires
single-threaded performance. The reason for this is as follows:

Prior to the change (we call this P9-sched below), the sched-domain
hierarchy was:

	  SMT (SMT4) --> CACHE (SMT8)[LLC] --> MC (Hemisphere) --> DIE

where the CACHE sched-domain is defined to be the Last Level Cache (LLC).

On the upstream kernel, with the aforementioned commmits (P10-sched),
the sched-domain hierarchy is:

    	  SMT (SMT4)[LLC] --> MC (Hemisphere) --> DIE

with the SMT sched-domain as the LLC.

When the scheduler tries to wakeup a task, it chooses between the
waker-CPU and the wakee's previous-CPU. Suppose this choice is called
the "target", then in the target's LLC domain, the scheduler

a) tries to find an idle core in the LLC. This helps exploit the
   SMT folding that the wakee task can benefit from. If an idle
   core is found, the wakee is woken up on it.

b) Failing to find an idle core, the scheduler tries to find an idle
   CPU in the LLC. This helps minimise the wakeup latency for the
   wakee since it gets to run on the CPU immediately.

c) Failing this, it will wake it up on target CPU.

Thus, with P9-sched topology, since the CACHE domain comprises of two
SMT4 cores, there is a decent chance that we get an idle core, failing
which there is a relatively higher probability of finding an idle CPU
among the 8 threads in the domain.

However, in P10-sched topology, since the SMT domain is the LLC and it
contains only a single SMT4 core, the probability that we find that
core to be idle is less. Furthermore, since there are only 4 CPUs to
search for an idle CPU, there is lower probability that we can get an
idle CPU to wake up the task on.

Thus applications which require single threaded performance will end
up getting woken up on potentially busy core, even though there are
idle cores in the system.

To remedy this, this patch proposes that the LLC be moved to the MC
level which is a group of cores in one half of the chip.

      SMT (SMT4) --> MC (Hemisphere)[LLC] --> DIE

While there is no cache being shared at this level, this is still the
level where some amount of cache-snooping takes place and it is
relatively faster to access the data from the caches of the cores
within this domain. With this change, we no longer see regressions on
P10 for applications which require single threaded performance.

The patch also improves the tail latencies on schbench and the
usecs/op on "perf bench sched pipe"

On a 10 core P10 system with 80 CPUs,

schbench
============
(https://git.kernel.org/pub/scm/linux/kernel/git/mason/schbench.git/)

Values : Lower the better.
99th percentile is the tail latency.


99th percentile
~~~~~~~~~~~~~~~~~~
No. messenger
threads       5.12-rc4    5.12-rc4
              P10-sched   MC-LLC
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1             70 us         85 us
2             81 us        101 us
3             92 us        107 us
4             96 us        110 us
5            103 us        123 us
6           3412 us ---->  122 us
7           1490 us        136 us
8           6200 us       3572 us


Hackbench
============
(perf bench sched pipe)
values: lower the better

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
No. of
parallel
instances   5.12-rc4       5.12-rc4
            P10-sched      MC-LLC 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1           24.04 us/op    18.72 us/op 
2           24.04 us/op    18.65 us/op 
4           24.01 us/op    18.76 us/op 
8           24.10 us/op    19.11 us/op 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/smp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5a4d59a..c75dbd4 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -976,6 +976,13 @@ static bool has_coregroup_support(void)
 	return coregroup_enabled;
 }
 
+static int powerpc_mc_flags(void)
+{
+	if(has_coregroup_support())
+		return SD_SHARE_PKG_RESOURCES;
+	return 0;
+}
+
 static const struct cpumask *cpu_mc_mask(int cpu)
 {
 	return cpu_coregroup_mask(cpu);
@@ -986,7 +993,7 @@ static const struct cpumask *cpu_mc_mask(int cpu)
 	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
 #endif
 	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
-	{ cpu_mc_mask, SD_INIT_NAME(MC) },
+	{ cpu_mc_mask, powerpc_mc_flags, SD_INIT_NAME(MC) },
 	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
 	{ NULL, },
 };
-- 
1.9.4

