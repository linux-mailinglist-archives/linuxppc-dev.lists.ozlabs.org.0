Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A49813977
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 19:10:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G2tJypmN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrgP729pjz3dVb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 05:10:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G2tJypmN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrgMM72qvz3cV5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 05:08:31 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BEHHcYf007550;
	Thu, 14 Dec 2023 18:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=EaNoWI8SI1SXaSWVAi6FVwRogSbOhH6qXVjk4Ig6Rd8=;
 b=G2tJypmNnHsNPiKYFUyDxCYIStDbxveDFU9G6RJ4LzSWxPxWyHpxTAkzzW4U6MBnI/2F
 UN3Pt+0UBjsnAk8WwI0OKMHkze/aGLg118nsCkqU8IiTGQTHWaIMFgtw37Ia/x5vqdjT
 kD1XKg+BaYR8yTPckGR0QQQLMSckgXWMLSgwN0VrEyjKVGykWnlbfwX1Wo4SzUdcGtGJ
 dq3Ew785JH7OkP5WTf/nVeCaDpZgTZ17hyRVNdcTpmC8NTlz06Z9GgjDvqg+Bbfy7v93
 /Q/+Gpymz//SloKdrxfSDwUH1KMrxp5xHJnZdawHVQE3oV4FjwRnsNKT6sAeWQOl5WHx pA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v04rxbxvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 18:08:00 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BEHrMH3020720;
	Thu, 14 Dec 2023 18:08:00 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v04rxbxvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 18:08:00 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BEH01XH008442;
	Thu, 14 Dec 2023 18:07:59 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uw2jttr9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 18:07:59 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BEI7vnA4063766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Dec 2023 18:07:57 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 541EF20049;
	Thu, 14 Dec 2023 18:07:57 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DE4620040;
	Thu, 14 Dec 2023 18:07:54 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.43.25.55])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Dec 2023 18:07:54 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v5 0/5] powerpc/smp: Topology and shared processor optimizations
Date: Thu, 14 Dec 2023 23:37:10 +0530
Message-ID: <20231214180720.310852-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.43.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: j6c8xqUKI9MnKzeTDbHrBiVnoqIQtbpi
X-Proofpoint-ORIG-GUID: XmxWE_-nvbY_MDVLUjW84i3xUEd3fLkk
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-14_12,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312140128
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Aneesh <aneesh.kumar@kernel.org>, Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerVM systems configured in shared processors mode have some unique
challenges. Some device-tree properties will be missing on a shared
processor. Hence some sched domains may not make sense for shared processor
systems.

Most shared processor systems are over-provisioned. Underlying PowerVM
Hypervisor would schedule at a Big Core granularity. The most recent power
processors support two almost independent cores. In a lightly loaded
condition, it helps the overall system performance if we pack to lesser
number of Big Cores.

Since each thread-group is independent, running threads on both the
thread-groups of a SMT8 core, should have a minimal adverse impact in
non over provisioned scenarios. These changes in this patchset will not
affect in the over provisioned scenario.  If there are more threads than
SMT domains, then asym_packing will not kick-in

System Configuration
type=Shared mode=Uncapped smt=8 lcpu=96 mem=1066409344 kB cpus=96 ent=64.00
So *64 Entitled cores/ 96 Virtual processor* Scenario

lscpu
Architecture:                       ppc64le
Byte Order:                         Little Endian
CPU(s):                             768
On-line CPU(s) list:                0-767
Model name:                         POWER10 (architected), altivec supported
Model:                              2.0 (pvr 0080 0200)
Thread(s) per core:                 8
Core(s) per socket:                 16
Socket(s):                          6
Hypervisor vendor:                  pHyp
Virtualization type:                para
L1d cache:                          6 MiB (192 instances)
L1i cache:                          9 MiB (192 instances)
NUMA node(s):                       6
NUMA node0 CPU(s):                  0-7,32-39,80-87,128-135,176-183,224-231,272-279,320-327,368-375,416-423,464-471,512-519,560-567,608-615,656-663,704-711,752-759
NUMA node1 CPU(s):                  8-15,40-47,88-95,136-143,184-191,232-239,280-287,328-335,376-383,424-431,472-479,520-527,568-575,616-623,664-671,712-719,760-767
NUMA node4 CPU(s):                  64-71,112-119,160-167,208-215,256-263,304-311,352-359,400-407,448-455,496-503,544-551,592-599,640-647,688-695,736-743
NUMA node5 CPU(s):                  16-23,48-55,96-103,144-151,192-199,240-247,288-295,336-343,384-391,432-439,480-487,528-535,576-583,624-631,672-679,720-727
NUMA node6 CPU(s):                  72-79,120-127,168-175,216-223,264-271,312-319,360-367,408-415,456-463,504-511,552-559,600-607,648-655,696-703,744-751
NUMA node7 CPU(s):                  24-31,56-63,104-111,152-159,200-207,248-255,296-303,344-351,392-399,440-447,488-495,536-543,584-591,632-639,680-687,728-735

ebizzy -t 32 -S 200 (5 iterations) Records per second. (Higher is better)
Kernel     N  Min      Max      Median   Avg        Stddev     %Change
6.6.0-rc3  5  3840178  4059268  3978042  3973936.6  84264.456
+patch     5  3768393  3927901  3874994  3854046    71532.926  -3.01692

>From lparstat (when the workload stabilized)
Kernel     %user  %sys  %wait  %idle  physc  %entc  lbusy  app    vcsw       phint
6.6.0-rc3  4.16   0.00  0.00   95.84  26.06  40.72  4.16   69.88  276906989  578
+patch     4.16   0.00  0.00   95.83  17.70  27.66  4.17   78.26  70436663   119

ebizzy -t 128 -S 200 (5 iterations) Records per second. (Higher is better)
Kernel     N Min      Max      Median   Avg        Stddev     %Change
6.6.0-rc3  5 5520692  5981856  5717709  5727053.2  176093.2
+patch     5 5305888  6259610  5854590  5843311    375917.03  2.02998

>From lparstat (when the workload stabilized)
Kernel     %user  %sys  %wait  %idle  physc  %entc  lbusy  app    vcsw       phint
6.6.0-rc3  16.66  0.00  0.00   83.33  45.49  71.08  16.67  50.50  288778533  581
+patch     16.65  0.00  0.00   83.35  30.15  47.11  16.65  65.76  85196150   133

ebizzy -t 512 -S 200 (5 iterations) Records per second. (Higher is better)
Kernel     N  Min       Max       Median    Avg       Stddev     %Change
6.6.0-rc3  5  19563921  20049955  19701510  19728733  198295.18
+patch     5  19455992  20176445  19718427  19832017  304094.05  0.523521

>From lparstat (when the workload stabilized)
%Kernel     user  %sys  %wait  %idle  physc  %entc   lbusy  app   vcsw       phint
66.6.0-rc3  6.44  0.01  0.00   33.55  94.14  147.09  66.45  1.33  313345175  621
6+patch     6.44  0.01  0.00   33.55  94.15  147.11  66.45  1.33  109193889  309

System Configuration
type=Shared mode=Uncapped smt=8 lcpu=40 mem=1067539392 kB cpus=96 ent=40.00
So *40 Entitled cores/ 40 Virtual processor* Scenario

lscpu
Architecture:                       ppc64le
Byte Order:                         Little Endian
CPU(s):                             320
On-line CPU(s) list:                0-319
Model name:                         POWER10 (architected), altivec supported
Model:                              2.0 (pvr 0080 0200)
Thread(s) per core:                 8
Core(s) per socket:                 10
Socket(s):                          4
Hypervisor vendor:                  pHyp
Virtualization type:                para
L1d cache:                          2.5 MiB (80 instances)
L1i cache:                          3.8 MiB (80 instances)
NUMA node(s):                       4
NUMA node0 CPU(s):                  0-7,32-39,64-71,96-103,128-135,160-167,192-199,224-231,256-263,288-295
NUMA node1 CPU(s):                  8-15,40-47,72-79,104-111,136-143,168-175,200-207,232-239,264-271,296-303
NUMA node4 CPU(s):                  16-23,48-55,80-87,112-119,144-151,176-183,208-215,240-247,272-279,304-311
NUMA node5 CPU(s):                  24-31,56-63,88-95,120-127,152-159,184-191,216-223,248-255,280-287,312-319

ebizzy -t 32 -S 200 (5 iterations) Records per second. (Higher is better)
Kernel     N   Min      Max      Median   Avg        Stddev     %Change
6.6.0-rc3  5   3535518  3864532  3745967  3704233.2  130216.76
+patch     5   3608385  3708026  3649379  3651596.6  37862.163  -1.42099

%Kernel    user   %sys  %wait  %idle  physc  %entc  lbusy  app    vcsw     phint
6.6.0-rc3  10.00  0.01  0.00   89.99  22.98  57.45  10.01  41.01  1135139  262
+patch     10.00  0.00  0.00   90.00  16.95  42.37  10.00  47.05  925561   19

ebizzy -t 64 -S 200 (5 iterations) Records per second. (Higher is better)
Kernel     N   Min      Max      Median   Avg        Stddev     %Change
6.6.0-rc3  5   4434984  4957281  4548786  4591298.2  211770.2
+patch     5   4461115  4835167  4544716  4607795.8  151474.85  0.359323

%Kernel    user   %sys  %wait  %idle  physc  %entc  lbusy  app    vcsw     phint
6.6.0-rc3  20.01  0.00  0.00   79.99  38.22  95.55  20.01  25.77  1287553  265
+patch     19.99  0.00  0.00   80.01  25.55  63.88  19.99  38.44  1077341  20

ebizzy -t 256 -S 200 (5 iterations) Records per second. (Higher is better)
Kernel     N   Min      Max      Median   Avg        Stddev     %Change
6.6.0-rc3  5   8850648  8982659  8951911  8936869.2  52278.031
+patch     5   8751038  9060510  8981409  8942268.4  117070.6   0.0604149

%Kernel    user   %sys  %wait  %idle  physc  %entc   lbusy  app    vcsw     phint
6.6.0-rc3  80.02  0.01  0.01   19.96  40.00  100.00  80.03  24.00  1597665  276
+patch     80.02  0.01  0.01   19.96  40.00  100.00  80.03  23.99  1383921  63

Observation:
We are able to see Improvement in ebizzy throughput even with lesser
core utilization (almost half the core utilization) in low utilization
scenarios while still retaining throughput in mid and higher utilization
scenarios.
Note: The numbers are with Uncapped + no-noise case. In the Capped and/or
noise case, due to contention on the Cores, the numbers are expected to
further improve.

Note: The numbers included (sched/fair: Enable group_asym_packing in find_idlest_group)
https://lore.kernel.org/all/20231018155036.2314342-1-srikar@linux.vnet.ibm.com/

Changelog
v4
1. Updated commit msg of patch 1 based on comments from Aneesh

v3 (https://lore.kernel.org/all/20231026101843.56784-1-srikar@linux.vnet.ibm.com) ->v4:
1. SPLAR specific Asym packing only for MC and DIE domains.
2. Changes due to rebase (DIE became PKG)

v2 (https://lore.kernel.org/all/20231018163751.2423181-1-srikar@linux.vnet.ibm.com) ->v3:
1. Handle comments from Peter Zijlstra / Michael Ellerman
2. Use __ro_after_init attribute instead of read_mostly
3. Use cpu_has_feature static_key instead of a new one.
4. Build topology dynamically patch added to this patchset.

v1 (https://lore.kernel.org/all/20230830105244.62477-1-srikar@linux.vnet.ibm.com) -> v2:
1. Last two patches were added in this version
2. This version uses static keys

Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Rohan McLure <rmclure@linux.ibm.com>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
CC: Aneesh <aneesh.kumar@kernel.org>

Srikar Dronamraju (5):
  powerpc/smp: Enable Asym packing for cores on shared processor
  powerpc/smp: Disable MC domain for shared processor
  powerpc/smp: Add __ro_after_init attribute
  powerpc/smp: Avoid asym packing within thread_group of a core
  powerpc/smp: Dynamically build Powerpc topology

 arch/powerpc/kernel/smp.c | 124 +++++++++++++++++++++-----------------
 1 file changed, 70 insertions(+), 54 deletions(-)


base-commit: 3c0fd4382b584d4bdc9564526841df32e9b6d817
-- 
2.35.3

