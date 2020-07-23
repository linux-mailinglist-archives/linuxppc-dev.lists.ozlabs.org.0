Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D705822AB8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 11:14:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC68Z63jqzDqyn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 19:14:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC5gl0DmpzDrDp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 18:52:34 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06N8XGhF177802; Thu, 23 Jul 2020 04:52:25 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32bvqxes5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 04:52:23 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06N8XbF8178769;
 Thu, 23 Jul 2020 04:52:23 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32bvqxes50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 04:52:23 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N8qKpU006941;
 Thu, 23 Jul 2020 08:52:20 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 32brq7nydq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 08:52:20 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06N8o6Td31457670
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 08:50:06 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 255D9AE059;
 Thu, 23 Jul 2020 08:51:30 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65A08AE058;
 Thu, 23 Jul 2020 08:51:25 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.199.56.65])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jul 2020 08:51:24 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 00/10] Coregroup support on Powerpc
Date: Thu, 23 Jul 2020 14:21:06 +0530
Message-Id: <20200723085116.4731-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_02:2020-07-22,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230065
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

On Power 8 Systems
------------------
$ tail /proc/cpuinfo
processor	: 255
cpu		: POWER8 (architected), altivec supported
clock		: 3724.000000MHz
revision	: 2.1 (pvr 004b 0201)

timebase	: 512000000
platform	: pSeries
model		: IBM,8408-E8E
machine		: CHRP IBM,8408-E8E
MMU		: Hash

Before the patchset
-------------------
$ cat /proc/sys/kernel/sched_domain/cpu0/domain*/name
SMT
DIE
NUMA
NUMA
$ head /proc/schedstat
version 15
timestamp 4295534931
cpu0 0 0 0 0 0 0 41389823338 17682779896 14117
domain0 00000000,00000000,00000000,00000000,00000000,00000000,00000000,000000ff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain1 00000000,00000000,00000000,00000000,00000000,00000000,00000000,ffffffff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain2 00000000,00000000,00000000,00000000,00000000,00000000,ffffffff,ffffffff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain3 ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
cpu1 0 0 0 0 0 0 27087859050 152273672 10396
domain0 00000000,00000000,00000000,00000000,00000000,00000000,00000000,000000ff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain1 00000000,00000000,00000000,00000000,00000000,00000000,00000000,ffffffff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

After the patchset
------------------
$ cat /proc/sys/kernel/sched_domain/cpu0/domain*/name
SMT
DIE
NUMA
NUMA
$ head /proc/schedstat
version 15
timestamp 4295534931
cpu0 0 0 0 0 0 0 41389823338 17682779896 14117
domain0 00000000,00000000,00000000,00000000,00000000,00000000,00000000,000000ff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain1 00000000,00000000,00000000,00000000,00000000,00000000,00000000,ffffffff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain2 00000000,00000000,00000000,00000000,00000000,00000000,ffffffff,ffffffff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain3 ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff,ffffffff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
cpu1 0 0 0 0 0 0 27087859050 152273672 10396
domain0 00000000,00000000,00000000,00000000,00000000,00000000,00000000,000000ff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
domain1 00000000,00000000,00000000,00000000,00000000,00000000,00000000,ffffffff 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

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
  powerpc/smp: Generalize 2nd sched domain
  powerpc/numa: Detect support for coregroup
  powerpc/smp: Allocate cpumask only after searching thread group
  powerpc/smp: Create coregroup domain
  powerpc/smp: Implement cpu_to_coregroup_id

 arch/powerpc/include/asm/smp.h      |   1 +
 arch/powerpc/include/asm/topology.h |  10 ++
 arch/powerpc/kernel/smp.c           | 245 +++++++++++++++++-----------
 arch/powerpc/mm/numa.c              |  59 +++++--
 4 files changed, 210 insertions(+), 105 deletions(-)

-- 
2.18.2

