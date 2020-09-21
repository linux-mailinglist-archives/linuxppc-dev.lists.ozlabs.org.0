Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC32271F86
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 12:00:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw0LH5LGGzDqcW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 20:00:23 +1000 (AEST)
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
 header.s=pp1 header.b=JSxZ5xfo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw0Gq32r7zDqWy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 19:57:22 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08L9hAGh011370; Mon, 21 Sep 2020 05:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Qf5Ugw/zS5LyGUsbKzyOHBwbo/Wc79tImo1PZBg5K30=;
 b=JSxZ5xfo3c4I1VR/IVbhw05vDDSQz++Nj1tYg8x+yfZw7NEcG05XotXZyWlz6HWOYXRc
 VWIB7AxP69zDxKggw4coZINtVgYH4o3kxnPiQZ5kseVqrs9hW30T3a/XwlWEvHuPipwx
 oijCQ8ytnlT4HOEA7qzDaPn0qjutFJObiwmkl4Vu6GA/MrCzKYNdPGiRtVN03zEQoymS
 1wVPLD0A2Y2NbKKql920z/cfP1E37DDbbAe/Ny1PhD6Mb4oWRh7CyQk8IAO+upCMh2jv
 n+R3uxUfp2nmOPwbmUNpZJ9JUR8jnYltUPgQpuvTIUbZ2HyMbRXaFWzRZe+4R5jdmj3r /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33pssr09c1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 05:57:09 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08L9iDr1017790;
 Mon, 21 Sep 2020 05:57:08 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33pssr09af-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 05:57:08 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08L9q7OV004716;
 Mon, 21 Sep 2020 09:57:06 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 33payu8msp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 09:57:06 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08L9v35p33554750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Sep 2020 09:57:03 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A589D5204E;
 Mon, 21 Sep 2020 09:57:03 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.77.192.225])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0AEF752052;
 Mon, 21 Sep 2020 09:56:59 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 00/11] Optimization to improve CPU online/offline on Powerpc
Date: Mon, 21 Sep 2020 15:26:42 +0530
Message-Id: <20200921095653.9701-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-21_01:2020-09-21,
 2020-09-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009210069
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Here are some optimizations and fixes to make CPU online/offline
faster and hence result in faster bootup.

Its based on top of my v5 coregroup support patchset.
https://lore.kernel.org/linuxppc-dev/20200810071834.92514-1-srikar@linux.vnet.ibm.com/t/#u

Anton reported that his 4096 cpu (1024 cores in a socket) was taking too
long to boot. He also analyzed that most of the time was being spent on
updating cpu_core_mask.

The first two patches should solve Anton's immediate problem.
On the unofficial patches, Anton reported that the boot time came from 30
mins to 6 seconds. (Basically a high core count in a single socket
configuration). Satheesh also reported similar numbers.

The rest are cleanups/optimizations.

Since cpu_core_mask is an exported symbol for a long duration, lets retain
as a snapshot of cpumask_of_node.

$ lscpu
Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              1024
On-line CPU(s) list: 0-1023
Thread(s) per core:  8
Core(s) per socket:  8
Socket(s):           16
NUMA node(s):        16
Model:               2.0 (pvr 004d 0200)
Model name:          POWER8 (architected), altivec supported
Hypervisor vendor:   pHyp
Virtualization type: para
L1d cache:           64K
L1i cache:           32K
L2 cache:            512K
L3 cache:            8192K
NUMA node0 CPU(s):   0-63
NUMA node1 CPU(s):   64-127
NUMA node2 CPU(s):   128-191
NUMA node3 CPU(s):   192-255
NUMA node4 CPU(s):   256-319
NUMA node5 CPU(s):   320-383
NUMA node6 CPU(s):   384-447
NUMA node7 CPU(s):   448-511
NUMA node8 CPU(s):   512-575
NUMA node9 CPU(s):   576-639
NUMA node10 CPU(s):  640-703
NUMA node11 CPU(s):  704-767
NUMA node12 CPU(s):  768-831
NUMA node13 CPU(s):  832-895
NUMA node14 CPU(s):  896-959
NUMA node15 CPU(s):  960-1023

$ dmesg -k | grep -i -e Bringing -e Brought -e sysrq -e bug
With powerp/next
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.354971] smp: Bringing up secondary CPUs ...
[  233.354676] smp: Brought up 16 nodes, 1024 CPUs
[  330.023073] sysrq: Changing Loglevel
[  330.023101] sysrq: Loglevel set to 9

With +patchset
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.351703] smp: Bringing up secondary CPUs ...
[    4.059859] smp: Brought up 16 nodes, 1024 CPUs
[   98.309015] sysrq: Changing Loglevel
[   98.309044] sysrq: Loglevel set to 9

Observations:
CPU bringup time reduced to 4 seconds from 233 seconds on this 1024 CPU
system. This resulted in System boot up time reducing to 98 seconds from
330 seconds. The actual improvement would depend on your system topology.

Topology verification post patchset on a 2 node Power9 PowerVM LPAR

powerpc/next                                                        +patchset
------------                                                        ---------
$ lscpu
Architecture:        ppc64le                                        Architecture:        ppc64le
Byte Order:          Little Endian                                  Byte Order:          Little Endian
CPU(s):              128                                            CPU(s):              128
On-line CPU(s) list: 0-127                                          On-line CPU(s) list: 0-127
Thread(s) per core:  8                                              Thread(s) per core:  8
Core(s) per socket:  8                                              Core(s) per socket:  8
Socket(s):           2                                              Socket(s):           2
NUMA node(s):        2                                              NUMA node(s):        2
Model:               2.2 (pvr 004e 0202)                            Model:               2.2 (pvr 004e 0202)
Model name:          POWER9 (architected), altivec supported        Model name:          POWER9 (architected), altivec supported
Hypervisor vendor:   pHyp                                           Hypervisor vendor:   pHyp
Virtualization type: para                                           Virtualization type: para
L1d cache:           32K                                            L1d cache:           32K
L1i cache:           32K                                            L1i cache:           32K
L2 cache:            512K                                           L2 cache:            512K
L3 cache:            10240K                                         L3 cache:            10240K
NUMA node0 CPU(s):   0-63                                           NUMA node0 CPU(s):   0-63
NUMA node1 CPU(s):   64-127                                         NUMA node1 CPU(s):   64-127

$ tail -f /proc/cpuinfo
processor	: 127                                               processor	: 127
cpu		: POWER9 (architected), altivec supported           cpu		: POWER9 (architected), altivec supported
clock		: 3000.000000MHz                                    clock		: 3000.000000MHz
revision	: 2.2 (pvr 004e 0202)                               revision	: 2.2 (pvr 004e 0202)

timebase	: 512000000                                         timebase	: 512000000
platform	: pSeries                                           platform	: pSeries
model		: IBM,9008-22L                                      model		: IBM,9008-22L
machine		: CHRP IBM,9008-22L                                 machine		: CHRP IBM,9008-22L
MMU		: Radix                                             MMU		: Radix

$ grep . /proc/sys/kernel/sched_domain/cpu0/domain*/name
--------------------------------------------------------
/proc/sys/kernel/sched_domain/cpu0/domain0/name:SMT                 /proc/sys/kernel/sched_domain/cpu0/domain0/name:SMT
/proc/sys/kernel/sched_domain/cpu0/domain1/name:CACHE               /proc/sys/kernel/sched_domain/cpu0/domain1/name:CACHE
/proc/sys/kernel/sched_domain/cpu0/domain2/name:DIE                 /proc/sys/kernel/sched_domain/cpu0/domain2/name:DIE
/proc/sys/kernel/sched_domain/cpu0/domain3/name:NUMA                /proc/sys/kernel/sched_domain/cpu0/domain3/name:NUMA

$ grep . /proc/sys/kernel/sched_domain/cpu0/domain*/flags
---------------------------------------------------------
/proc/sys/kernel/sched_domain/cpu0/domain0/flags:2391               /proc/sys/kernel/sched_domain/cpu0/domain0/flags:2391
/proc/sys/kernel/sched_domain/cpu0/domain1/flags:2327               /proc/sys/kernel/sched_domain/cpu0/domain1/flags:2327
/proc/sys/kernel/sched_domain/cpu0/domain2/flags:2071               /proc/sys/kernel/sched_domain/cpu0/domain2/flags:2071
/proc/sys/kernel/sched_domain/cpu0/domain3/flags:12801              /proc/sys/kernel/sched_domain/cpu0/domain3/flags:12801

Post ppc64_cpu --smt=1
$ tail -f /proc/cpuinfo
processor	: 120                                               processor	: 120
cpu		: POWER9 (architected), altivec supported           cpu		: POWER9 (architected), altivec supported
clock		: 3000.000000MHz                                    clock		: 3000.000000MHz
revision	: 2.2 (pvr 004e 0202)                               revision	: 2.2 (pvr 004e 0202)

timebase	: 512000000                                         timebase	: 512000000
platform	: pSeries                                           platform	: pSeries
model		: IBM,9008-22L                                      model	: IBM,9008-22L
machine		: CHRP IBM,9008-22L                                 machine	: CHRP IBM,9008-22L
MMU		: Radix                                             MMU		: Radix

$ grep . /proc/sys/kernel/sched_domain/cpu0/domain*/name
--------------------------------------------------------
/proc/sys/kernel/sched_domain/cpu0/domain0/name:DIE                 /proc/sys/kernel/sched_domain/cpu0/domain0/name:DIE
/proc/sys/kernel/sched_domain/cpu0/domain1/name:NUMA                /proc/sys/kernel/sched_domain/cpu0/domain1/name:NUMA

$ grep . /proc/sys/kernel/sched_domain/cpu0/domain*/flags
---------------------------------------------------------
/proc/sys/kernel/sched_domain/cpu0/domain0/flags:2071               /proc/sys/kernel/sched_domain/cpu0/domain0/flags:2071
/proc/sys/kernel/sched_domain/cpu0/domain1/flags:12801              /proc/sys/kernel/sched_domain/cpu0/domain1/flags:12801

Performance impact post +patchset
---------------------------------
100 iterations of ebizzy
Units: Records/second : higher is better
-----------------------------------------
kernel        N    Min     Max     Median  Avg        Stddev
powerpc/next  100  753917  870520  819054  817636.56  22649.7
+patchset     100  746258  874984  816681  813876.74  26424.351


100 iterations of perf bench sched pipe -l 10000000 (aka Hackbench)
units: usec/ops: lesser is better
--------------------------------
kernel        N    Min        Max        Median     Avg        Stddev
powerpc/next  100  13.845834  14.569539  14.06263   14.086167  0.17512607
+patchset     100  13.637611  18.097744  13.862656  13.9257    0.43872453


schbench Latency percentiles (usec)
units: usec : lesser is better
-----------------------------------
powerpc/next      	+patchset
50.0000th: 48     	50.0000th: 49
75.0000th: 65     	75.0000th: 66
90.0000th: 77     	90.0000th: 79
95.0000th: 84     	95.0000th: 85
*99.0000th: 101   	*99.0000th: 99
99.5000th: 113    	99.5000th: 104
99.9000th: 159    	99.9000th: 129
min=0, max=15221  	min=0, max=7666

100 interations of ppc64_cpu --smt=1 / ppc64_cpu --smt=8
Units: seconds : lesser is better
---------------------------------
ppc64_cpu --smt=1
kernel        N    Min    Max    Median  Avg      Stddev
powerpc/next  100  13.39  17.55  14.71   14.7658  0.69184745
+patchset     100  13.3   16.27  14.33   14.4179  0.5427433

ppc64_cpu --smt=8
kernel        N    Min    Max    Median  Avg      Stddev
powerpc/next  100  21.65  26.17  23.71   23.7111  0.8589786
+patchset     100  21.88  25.79  23.16   23.2945  0.86394839


Observations:
Performance of ebizzy/ perf_sched_bench / schbench remain the
same with and without the patchset.

Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Anton Blanchard <anton@ozlabs.org>
Cc: Oliver O'Halloran <oohall@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Neuling <mikey@neuling.org>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

Changelog v1->v2:
v1 link: https://lore.kernel.org/linuxppc-dev/20200727075532.30058-1-srikar@linux.vnet.ibm.com/t/#u
	Added five more patches on top of Seven.
	Rebased to 19th Sept 2020 powerpc/next (based on v5.9-rc2)

Srikar Dronamraju (11):
  powerpc/topology: Update topology_core_cpumask
  powerpc/smp: Stop updating cpu_core_mask
  powerpc/smp: Remove get_physical_package_id
  powerpc/smp: Optimize remove_cpu_from_masks
  powerpc/smp: Limit CPUs traversed to within a node.
  powerpc/smp: Stop passing mask to update_mask_by_l2
  powerpc/smp: Depend on cpu_l1_cache_map when adding CPUs
  powerpc/smp: Check for duplicate topologies and consolidate
  powerpc/smp: Optimize update_mask_by_l2
  powerpc/smp: Move coregroup mask updation to a new function
  powerpc/smp: Optimize update_coregroup_mask

 arch/powerpc/include/asm/smp.h      |   5 -
 arch/powerpc/include/asm/topology.h |   7 +-
 arch/powerpc/kernel/smp.c           | 186 ++++++++++++++++++----------
 3 files changed, 120 insertions(+), 78 deletions(-)

-- 
2.17.1

