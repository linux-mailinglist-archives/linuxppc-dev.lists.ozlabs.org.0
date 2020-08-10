Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C94C24025C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 09:21:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ6pK5LgYzDqND
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 17:21:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IR81Pkqq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ6lW014FzDqN1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 17:19:02 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07A74Bdh091019; Mon, 10 Aug 2020 03:18:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=sc2aFeTlwNNRQaV6EqjqY2AOugkKoWxg/2qhZ+kbzF8=;
 b=IR81Pkqq1Lnn/8ET+KeZfaElI9tYlRbiVE8mizWqDBJvVHqNwTD+tED5BZ2+AEgW9/N7
 ksElgP4ikCSE8m19CP3f2bjsDwBlKsfF4zT1QQLBPA0U77Tx4wPqp4ASSnzezCw065nf
 VZQ+c4nzTfelr95RVBC22a28Nl4AdX7jB6tST/k2qeEN3lTMHO7skg9+RybSnNwZwf11
 zK6FeEsCsgo++kN6mEVoPnitPhZUVynq/rgl6zhQcC/BzV7BiPiZAtU3QP3HTKiGCvmK
 5X1QSNI6oiirhiTMRiaUG+BXINb6H59G/mYYUbjrzcIR13dXwSFcLIRHW7h8QNgIGRn5 Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32sr6rbrgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 03:18:50 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07A75Ags094463;
 Mon, 10 Aug 2020 03:18:50 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32sr6rbrg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 03:18:50 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07A7Exwm012651;
 Mon, 10 Aug 2020 07:18:47 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 32skp89ygb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 07:18:47 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07A7IgrC23003628
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Aug 2020 07:18:43 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF1B211C052;
 Mon, 10 Aug 2020 07:18:42 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C187D11C050;
 Mon, 10 Aug 2020 07:18:39 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.102.18.208])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 10 Aug 2020 07:18:39 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v5 00/10] Coregroup support on Powerpc
Date: Mon, 10 Aug 2020 12:48:24 +0530
Message-Id: <20200810071834.92514-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-10_02:2020-08-06,
 2020-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008100046
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jordan Niethe <jniethe5@gmail.com>, Anton Blanchard <anton@au1.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Nick Piggin <npiggin@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changelog v4->v5:
v4: http://lore.kernel.org/lkml/20200727053230.19753-1-srikar@linux.vnet.ibm.com/t/#u

Changelog v4 ->v5:
powerpc/smp: Optimize start_secondary
	Retain cache domain, no need for generalization
		 (Michael Ellerman, Peter Zijlstra,
		 Valentin Schneider, Gautham R. Shenoy)

powerpc/numa: Detect support for coregroup
	Updated commit msg with current abstract nature of the coregroups
						(Michael Ellerman)
powerpc/smp: Allocate cpumask only after searching thread group
	Updated commit msg on why cpumask need not be freed.
						(Michael Ellerman)

powerpc/smp: Create coregroup domain
	Updated commit msg to specify actual implementation of
	cpu_to_coregroup_id is in a subsequent patch (Michael Ellerman)

Changelog v3 ->v4:
v3: https://lore.kernel.org/lkml/20200723085116.4731-1-srikar@linux.vnet.ibm.com/t/#u

powerpc/smp: Create coregroup domain
	if coregroup_support doesn't exist, update MC mask to the next
	smaller domain mask.

Changelog v2 -> v3:
v2: https://lore.kernel.org/linuxppc-dev/20200721113814.32284-1-srikar@linux.vnet.ibm.com/t/#u

powerpc/smp: Cache node for reuse
	Removed node caching part. Rewrote the Commit msg (Michael Ellerman)
	Renamed to powerpc/smp: Fix a warning under !NEED_MULTIPLE_NODES

powerpc/smp: Enable small core scheduling sooner
	Rewrote changelog (Gautham)
	Renamed to powerpc/smp: Move topology fixups into  a new function

powerpc/smp: Create coregroup domain
	Add optimization for mask updation under coregroup_support

Changelog v1 -> v2:
v1: https://lore.kernel.org/linuxppc-dev/20200714043624.5648-1-srikar@linux.vnet.ibm.com/t/#u

powerpc/smp: Merge Power9 topology with Power topology
	Replaced a reference to cpu_smt_mask with per_cpu(cpu_sibling_map, cpu)
	since cpu_smt_mask is only defined under CONFIG_SCHED_SMT

powerpc/smp: Enable small core scheduling sooner
	Restored the previous info msg (Jordan)
	Moved big core topology fixup to fixup_topology (Gautham)

powerpc/smp: Dont assume l2-cache to be superset of sibling
	Set cpumask after verifying l2-cache. (Gautham)

powerpc/smp: Generalize 2nd sched domain
	Moved shared_cache topology fixup to fixup_topology (Gautham)

Powerpc/numa: Detect support for coregroup
	Explained Coregroup in commit msg (Michael Ellerman)

Powerpc/smp: Create coregroup domain
	Moved coregroup topology fixup to fixup_topology (Gautham)

powerpc/smp: Implement cpu_to_coregroup_id
	Move coregroup_enabled before getting associativity (Gautham)

powerpc/smp: Provide an ability to disable coregroup
	Patch dropped (Michael Ellerman)

Cleanup of existing powerpc topologies and add coregroup support on
Powerpc. Coregroup is a group of (subset of) cores of a DIE that share
a resource.

Patch 7 of this patch series: "Powerpc/numa: Detect support for coregroup"
depends on
https://lore.kernel.org/linuxppc-dev/20200707140644.7241-1-srikar@linux.vnet.ibm.com/t/#u
However it should be easy to rebase the patch without the above patch.

This patch series is based on top of current powerpc/next tree + the
above patch.

Summary of some of the testing done with coregroup patchset.
It includes ebizzy, schbench, perf bench sched pipe and topology verification.
One the left side are results from powerpc/next tree and on the right are the
results with the patchset applied.  Topological verification clearly shows that
there is no change in topology with and without the patches on all the 3 class
of systems that were tested.

On PowerPc/Next                                                            On Powerpc/next + Coregroup Support v5 patchset

Power 9 PowerNV (2 Node/ 160 Cpu System)
---------------------------------
ebizzy (Throughput of 100 iterations of 30 seconds higher throughput is better)
  N      Min       Max    Median       Avg        Stddev                  N      Min       Max    Median       Avg      Stddev
100   993884   1276090   1173476   1165914     54867.201                100   910470   1279820   1171095   1162091    67363.28

schbench (latency hence lower is better)
Latency percentiles (usec)                                              Latency percentiles (usec)
        50.0th: 455                                                             50.0th: 454
        75.0th: 533                                                             75.0th: 543
        90.0th: 683                                                             90.0th: 701
        95.0th: 743                                                             95.0th: 737
        *99.0th: 815                                                            *99.0th: 805
        99.5th: 839                                                             99.5th: 835
        99.9th: 913                                                             99.9th: 893
        min=0, max=1011                                                         min=0, max=2833

perf bench sched pipe (lesser time and higher ops/sec is better)
# Running 'sched/pipe' benchmark:                                       # Running 'sched/pipe' benchmark:
# Executed 1000000 pipe operations between two processes                # Executed 1000000 pipe operations between two processes

     Total time: 6.083 [sec]                                                 Total time: 6.303 [sec]

       6.083576 usecs/op                                                       6.303318 usecs/op
         164377 ops/sec                                                          158646 ops/sec


Power 9 LPAR (2 Node/ 128 Cpu System)
---------------------------------
ebizzy (Throughput of 100 iterations of 30 seconds higher throughput is better)
  N       Min       Max    Median         Avg      Stddev                 N       Min       Max    Median         Avg      Stddev
100   1058029   1295393   1200414   1188306.7   56786.538               100    943264   1287619   1180522   1168473.2   64469.955

schbench (latency hence lower is better)
Latency percentiles (usec)                                                Latency percentiles (usec)
        50.0000th: 34                                                             50.0000th: 39
        75.0000th: 46                                                             75.0000th: 52
        90.0000th: 53                                                             90.0000th: 68
        95.0000th: 56                                                             95.0000th: 77
        *99.0000th: 61                                                            *99.0000th: 89
        99.5000th: 63                                                             99.5000th: 94
        99.9000th: 81                                                             99.9000th: 169
        min=0, max=8405                                                           min=0, max=23674

perf bench sched pipe (lesser time and higher ops/sec is better)
# Running 'sched/pipe' benchmark:                                        # Running 'sched/pipe' benchmark:
# Executed 1000000 pipe operations between two processes                 # Executed 1000000 pipe operations between two processes

     Total time: 8.768 [sec]                                                      Total time: 5.217 [sec]

       8.768400 usecs/op                                                            5.217625 usecs/op
         114045 ops/sec                                                               191658 ops/sec

Power 8 LPAR (8 Node/ 256 Cpu System)
---------------------------------
ebizzy (Throughput of 100 iterations of 30 seconds higher throughput is better)
  N       Min       Max    Median         Avg      Stddev               N      Min      Max   Median        Avg     Stddev
100   1267615   1965234   1707423   1689137.6   144363.29             100  1175357  1924262  1691104  1664792.1   145876.4

schbench (latency hence lower is better)
Latency percentiles (usec)                                             Latency percentiles (usec)
        50.0th: 37                                                             50.0th: 36
        75.0th: 51                                                             75.0th: 48
        90.0th: 59                                                             90.0th: 55
        95.0th: 63                                                             95.0th: 59
        *99.0th: 71                                                            *99.0th: 67
        99.5th: 75                                                             99.5th: 72
        99.9th: 105                                                            99.9th: 170
        min=0, max=18560                                                       min=0, max=27031

perf bench sched pipe (lesser time and higher ops/sec is better)
# Running 'sched/pipe' benchmark:                                       # Running 'sched/pipe' benchmark:
# Executed 1000000 pipe operations between two processes               # Executed 1000000 pipe operations between two processes

     Total time: 6.013 [sec]                                                 Total time: 5.930 [sec]

       6.013963 usecs/op                                                        5.930724 usecs/op
         166279 ops/sec                                                           168613 ops/sec

Topology verification on Power9
Power9/ PowerNV / SMT4

tail -f /proc/cpuinfo
---------------------
cpu                : POWER9, altivec supported
clock                : 3600.000000MHz
revision        : 2.2 (pvr 004e 1202)

timebase        : 512000000
platform        : PowerNV
model                : 9006-22P
machine                : PowerNV 9006-22P
firmware        : OPAL
MMU                : Radix

On PowerPc/Next                                                            On Powerpc/next + Coregroup Support v5 patchset
lscpu                                                                      lscpu
------                                                                     ------
Architecture:        ppc64le                                               Architecture:        ppc64le
Byte Order:          Little Endian                                         Byte Order:          Little Endian
CPU(s):              160                                                   CPU(s):              160
On-line CPU(s) list: 0-159                                                 On-line CPU(s) list: 0-159
Thread(s) per core:  4                                                     Thread(s) per core:  4
Core(s) per socket:  20                                                    Core(s) per socket:  20
Socket(s):           2                                                     Socket(s):           2
NUMA node(s):        2                                                     NUMA node(s):        2
Model:               2.2 (pvr 004e 1202)                                   Model:               2.2 (pvr 004e 1202)
Model name:          POWER9, altivec supported                             Model name:          POWER9, altivec supported
CPU max MHz:         3800.0000                                             CPU max MHz:         3800.0000
CPU min MHz:         2166.0000                                             CPU min MHz:         2166.0000
L1d cache:           32K                                                   L1d cache:           32K
L1i cache:           32K                                                   L1i cache:           32K
L2 cache:            512K                                                  L2 cache:            512K
L3 cache:            10240K                                                L3 cache:            10240K
NUMA node0 CPU(s):   0-79                                                  NUMA node0 CPU(s):   0-79
NUMA node8 CPU(s):   80-159                                                NUMA node8 CPU(s):   80-159

grep . /proc/sys/kernel/sched_domain/cpu0/domain*/name                     grep . /proc/sys/kernel/sched_domain/cpu0/domain*/name
-----------------------------------------------------                      -----------------------------------------------------
/proc/sys/kernel/sched_domain/cpu0/domain0/name:SMT                        /proc/sys/kernel/sched_domain/cpu0/domain0/name:SMT
/proc/sys/kernel/sched_domain/cpu0/domain1/name:CACHE                      /proc/sys/kernel/sched_domain/cpu0/domain1/name:CACHE
/proc/sys/kernel/sched_domain/cpu0/domain2/name:DIE                        /proc/sys/kernel/sched_domain/cpu0/domain2/name:DIE
/proc/sys/kernel/sched_domain/cpu0/domain3/name:NUMA                       /proc/sys/kernel/sched_domain/cpu0/domain3/name:NUMA

grep . /proc/sys/kernel/sched_domain/cpu0/domain*/flags                    grep . /proc/sys/kernel/sched_domain/cpu0/domain*/flags
------------------------------------------------------                     ------------------------------------------------------
/proc/sys/kernel/sched_domain/cpu0/domain0/flags:2391                      /proc/sys/kernel/sched_domain/cpu0/domain0/flags:2391
/proc/sys/kernel/sched_domain/cpu0/domain1/flags:2327                      /proc/sys/kernel/sched_domain/cpu0/domain1/flags:2327
/proc/sys/kernel/sched_domain/cpu0/domain2/flags:2071                      /proc/sys/kernel/sched_domain/cpu0/domain2/flags:2071
/proc/sys/kernel/sched_domain/cpu0/domain3/flags:12801                     /proc/sys/kernel/sched_domain/cpu0/domain3/flags:12801


On PowerPc/Next
head /proc/schedstat
--------------------
version 15
timestamp 4295043536
cpu0 0 0 0 0 0 0 9597119314 2408913694 11897
domain0 00000000,00000000,00000000,00000000,0000000f 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain1 00000000,00000000,00000000,00000000,000000ff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain2 00000000,00000000,0000ffff,ffffffff,ffffffff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain3 ffffffff,ffffffff,ffffffff,ffffffff,ffffffff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
cpu1 0 0 0 0 0 0 4941435230 11106132 1583
domain0 00000000,00000000,00000000,00000000,0000000f 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain1 00000000,00000000,00000000,00000000,000000ff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

On Powerpc/next + Coregroup Support v5 patchset
head /proc/schedstat
--------------------
version 15
timestamp 4296311826
cpu0 0 0 0 0 0 0 3353674045024 3781680865826 297483
domain0 00000000,00000000,00000000,00000000,0000000f 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain1 00000000,00000000,00000000,00000000,000000ff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain2 00000000,00000000,0000ffff,ffffffff,ffffffff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain3 ffffffff,ffffffff,ffffffff,ffffffff,ffffffff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
cpu1 0 0 0 0 0 0 3337873293332 4231590033856 229090
domain0 00000000,00000000,00000000,00000000,0000000f 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain1 00000000,00000000,00000000,00000000,000000ff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0


Post sudo ppc64_cpu --smt=1                                                     Post sudo ppc64_cpu --smt=1
---------------------                                                           ---------------------
grep . /proc/sys/kernel/sched_domain/cpu0/domain*/name                          grep . /proc/sys/kernel/sched_domain/cpu0/domain*/name
-----------------------------------------------------                           -----------------------------------------------------
/proc/sys/kernel/sched_domain/cpu0/domain0/name:CACHE                           /proc/sys/kernel/sched_domain/cpu0/domain0/name:CACHE
/proc/sys/kernel/sched_domain/cpu0/domain1/name:DIE                             /proc/sys/kernel/sched_domain/cpu0/domain1/name:DIE
/proc/sys/kernel/sched_domain/cpu0/domain2/name:NUMA                            /proc/sys/kernel/sched_domain/cpu0/domain2/name:NUMA

grep . /proc/sys/kernel/sched_domain/cpu0/domain*/flags                         grep . /proc/sys/kernel/sched_domain/cpu0/domain*/flags
------------------------------------------------------                          ------------------------------------------------------
/proc/sys/kernel/sched_domain/cpu0/domain0/flags:2327                           /proc/sys/kernel/sched_domain/cpu0/domain0/flags:2327
/proc/sys/kernel/sched_domain/cpu0/domain1/flags:2071                           /proc/sys/kernel/sched_domain/cpu0/domain1/flags:2071
/proc/sys/kernel/sched_domain/cpu0/domain2/flags:12801                          /proc/sys/kernel/sched_domain/cpu0/domain2/flags:12801


On Powerpc/next
head /proc/schedstat
--------------------
version 15
timestamp 4295046242
cpu0 0 0 0 0 0 0 10978610020 2658997390 13068
domain0 00000000,00000000,00000000,00000000,00000011 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain1 00000000,00000000,00001111,11111111,11111111 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain2 91111111,11111111,11111111,11111111,11111111 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
cpu4 0 0 0 0 0 0 5408663896 95701034 7697
domain0 00000000,00000000,00000000,00000000,00000011 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain1 00000000,00000000,00001111,11111111,11111111 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain2 91111111,11111111,11111111,11111111,11111111 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

On Powerpc/next + Coregroup Support v5 patchset
head /proc/schedstat
--------------------
version 15
timestamp 4296314905
cpu0 0 0 0 0 0 0 3355392013536 3781975150576 298723
domain0 00000000,00000000,00000000,00000000,00000011 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain1 00000000,00000000,00001111,11111111,11111111 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain2 91111111,11111111,11111111,11111111,11111111 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
cpu4 0 0 0 0 0 0 3351637920996 4427329763050 256776
domain0 00000000,00000000,00000000,00000000,00000011 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain1 00000000,00000000,00001111,11111111,11111111 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain2 91111111,11111111,11111111,11111111,11111111 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0


Similar verification was done on Power 8 (8 Node 256 CPU LPAR) and Power 9 (2
node 128 Cpu LPAR) and they showed the topology before and after the patch to be
identical. If Interested, I could provide the same.

On Power 9 (with device-tree enablement to show coregroups).
(hunks for mimicing a coregroup was posted at
https://lore.kernel.org/linuxppc-dev/20200714043624.5648-1-srikar@linux.vnet.ibm.com/t/#m2cb09bb11c7a93257d6123d1d27edb8212f8af21)
-----------------------------------------------------------
$ tail /proc/cpuinfo
processor	: 127
cpu		: POWER9 (architected), altivec supported
clock		: 3000.000000MHz
revision	: 2.2 (pvr 004e 0202)

timebase	: 512000000
platform	: pSeries
model		: IBM,9008-22L
machine		: CHRP IBM,9008-22L
MMU		: Hash

Before patchset
--------------
$ cat /proc/sys/kernel/sched_domain/cpu0/domain*/name
SMT
CACHE
DIE
NUMA

$ head /proc/schedstat
version 15
timestamp 4318242208
cpu0 0 0 0 0 0 0 28077107004 4773387362 78205
domain0 00000000,00000000,00000000,00000055 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain1 00000000,00000000,00000000,000000ff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain2 00000000,00000000,ffffffff,ffffffff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain3 ffffffff,ffffffff,ffffffff,ffffffff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
cpu1 0 0 0 0 0 0 24177439200 413887604 75393
domain0 00000000,00000000,00000000,000000aa 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain1 00000000,00000000,00000000,000000ff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

After patchset
--------------
$ cat /proc/sys/kernel/sched_domain/cpu0/domain*/name
SMT
CACHE
MC
DIE
NUMA

$ head /proc/schedstat
version 15
timestamp 4318242208
cpu0 0 0 0 0 0 0 28077107004 4773387362 78205
domain0 00000000,00000000,00000000,00000055 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain1 00000000,00000000,00000000,000000ff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain2 00000000,00000000,00000000,ffffffff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain3 00000000,00000000,ffffffff,ffffffff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain4 ffffffff,ffffffff,ffffffff,ffffffff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
cpu1 0 0 0 0 0 0 24177439200 413887604 75393
domain0 00000000,00000000,00000000,000000aa 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <michaele@au1.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Nick Piggin <npiggin@au1.ibm.com>
Cc: Oliver OHalloran <oliveroh@au1.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Neuling <mikey@linux.ibm.com>
Cc: Anton Blanchard <anton@au1.ibm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
Cc: Jordan Niethe <jniethe5@gmail.com>

Srikar Dronamraju (10):
  powerpc/smp: Fix a warning under !NEED_MULTIPLE_NODES
  powerpc/smp: Merge Power9 topology with Power topology
  powerpc/smp: Move powerpc_topology above
  powerpc/smp: Move topology fixups into  a new function
  powerpc/smp: Dont assume l2-cache to be superset of sibling
  powerpc/smp: Optimize start_secondary
  powerpc/numa: Detect support for coregroup
  powerpc/smp: Allocate cpumask only after searching thread group
  powerpc/smp: Create coregroup domain
  powerpc/smp: Implement cpu_to_coregroup_id

 arch/powerpc/include/asm/smp.h      |   1 +
 arch/powerpc/include/asm/topology.h |  10 ++
 arch/powerpc/kernel/smp.c           | 235 +++++++++++++++++-----------
 arch/powerpc/mm/numa.c              |  59 +++++--
 4 files changed, 198 insertions(+), 107 deletions(-)

-- 
2.18.2

