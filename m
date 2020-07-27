Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B051B22E73F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 10:05:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFXR94NlSzF1Rc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 18:05:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFXFJ6fKNzDqJq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 17:56:36 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06R7hZEO195271; Mon, 27 Jul 2020 03:56:26 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32htsjr9rf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 03:56:26 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06R7i0cG196081;
 Mon, 27 Jul 2020 03:56:25 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32htsjr9qp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 03:56:25 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06R7tNoo015936;
 Mon, 27 Jul 2020 07:56:22 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 32gcy4hxrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 07:56:22 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06R7uKqh30409212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 07:56:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62ABBAE04D;
 Mon, 27 Jul 2020 07:56:20 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9CB2AE051;
 Mon, 27 Jul 2020 07:56:17 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.199.36.96])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jul 2020 07:56:17 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/7] Optimization to improve cpu online/offline on Powerpc
Date: Mon, 27 Jul 2020 13:25:25 +0530
Message-Id: <20200727075532.30058-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_04:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270053
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

Anton reported that his 4096 cpu (1024 cores in a socket) was taking too
long to boot. He also analyzed that most of the time was being spent on
updating cpu_core_mask.

Here are some optimizations and fixes to make ppc64_cpu --smt=8/ppc64_cpu
--smt=1 run faster and hence boot the kernel also faster.

Its based on top of my v4 coregroup support patchset.
http://lore.kernel.org/lkml/20200727053230.19753-1-srikar@linux.vnet.ibm.com/t/#u

The first two patches should solve Anton's immediate problem.
On the unofficial patches, Anton reported that the boot time came from 30
mins to 6 seconds. (Basically a high core count in a single socket
configuration). Satheesh also reported similar numbers.

The rest are simple cleanups/optimizations.

Since cpu_core_mask is an exported symbol for a long duration, lets retain
as a snapshot of cpumask_of_node.

Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              160
On-line CPU(s) list: 0-159
Thread(s) per core:  4
Core(s) per socket:  20
Socket(s):           2
NUMA node(s):        2
Model:               2.2 (pvr 004e 1202)
Model name:          POWER9, altivec supported
CPU max MHz:         3800.0000
CPU min MHz:         2166.0000
L1d cache:           32K
L1i cache:           32K
L2 cache:            512K
L3 cache:            10240K
NUMA node0 CPU(s):   0-79
NUMA node8 CPU(s):   80-159

without patch (powerpc/next)
[    0.099347] smp: Bringing up secondary CPUs ...
[    0.832513] smp: Brought up 2 nodes, 160 CPUs

with powerpc/next + coregroup support patchset
[    0.099241] smp: Bringing up secondary CPUs ...
[    0.835627] smp: Brought up 2 nodes, 160 CPUs

with powerpc/next + coregroup + this patchset
[    0.097232] smp: Bringing up secondary CPUs ...
[    0.528457] smp: Brought up 2 nodes, 160 CPUs

x ppc64_cpu --smt=1
+ ppc64_cpu --smt=4

without patch
    N           Min           Max        Median           Avg        Stddev
x 100         11.82         17.06         14.01         14.05     1.2665247
+ 100         12.25         16.59         13.86       14.1143      1.164293

with patch
    N           Min           Max        Median           Avg        Stddev
x 100         12.68         16.15         14.24        14.238    0.75489246
+ 100         12.93         15.85         14.35       14.2897    0.60041813

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

Srikar Dronamraju (7):
  powerpc/topology: Update topology_core_cpumask
  powerpc/smp: Stop updating cpu_core_mask
  powerpc/smp: Remove get_physical_package_id
  powerpc/smp: Optimize remove_cpu_from_masks
  powerpc/smp: Limit cpus traversed to within a node.
  powerpc/smp: Stop passing mask to update_mask_by_l2
  powerpc/smp: Depend on cpu_l1_cache_map when adding cpus

 arch/powerpc/include/asm/smp.h      |  5 --
 arch/powerpc/include/asm/topology.h |  7 +--
 arch/powerpc/kernel/smp.c           | 79 +++++++++--------------------
 3 files changed, 24 insertions(+), 67 deletions(-)

-- 
2.17.1

