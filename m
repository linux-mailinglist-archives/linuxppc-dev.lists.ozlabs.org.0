Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED59823379F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 19:25:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHcjh5L8LzDr7F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 03:24:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHcgc5fngzDr7C
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 03:23:08 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06UH3QD4004733; Thu, 30 Jul 2020 13:22:52 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32m16stfrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 13:22:52 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06UH3T5J004872;
 Thu, 30 Jul 2020 13:22:52 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32m16stfqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 13:22:51 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06UHLfV3028477;
 Thu, 30 Jul 2020 17:22:49 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 32gcpwbwvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 17:22:49 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06UHMiWU30015818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 17:22:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FBED52052;
 Thu, 30 Jul 2020 17:22:44 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 531BB52050;
 Thu, 30 Jul 2020 17:22:41 +0000 (GMT)
Date: Thu, 30 Jul 2020 22:52:40 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4 00/10] Coregroup support on Powerpc
Message-ID: <20200730172240.GE14603@linux.vnet.ibm.com>
References: <20200727053230.19753-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200727053230.19753-1-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-30_13:2020-07-30,
 2020-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007300122
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jordan Niethe <jniethe5@gmail.com>, Anton Blanchard <anton@au1.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Nick Piggin <npiggin@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Srikar Dronamraju <srikar@linux.vnet.ibm.com> [2020-07-27 11:02:20]:

> Changelog v3 ->v4:
> v3: https://lore.kernel.org/lkml/20200723085116.4731-1-srikar@linux.vnet.ibm.com/t/#u
>

Here is a summary of some of the testing done with coregroup v4 patchsets.
It includes ebizzy, schbench, perf bench sched pipe and topology verification.
One the left side are results from powerpc/next tree and on the right are the
results with the patchset applied.  Topological verification clearly shows that
there is no change in topology with and without the patches on all the 3 class
of systems that were tested.

On PowerPc/Next                                                            On Powerpc/next + Coregroup Support v4 patchset

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

On PowerPc/Next                                                            On Powerpc/next + Coregroup Support v4 patchset
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

On Powerpc/next + Coregroup Support v4 patchset
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

On Powerpc/next + Coregroup Support v4 patchset
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

