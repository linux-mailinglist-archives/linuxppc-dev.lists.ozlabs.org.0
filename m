Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D482378D546
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 12:55:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l35Ji+gU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbLmX5ZrBz3c9t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 20:55:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l35Ji+gU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbLkl18SKz2yjD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 20:53:50 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37UAgdxc018678;
	Wed, 30 Aug 2023 10:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=KQiunxAt3GAzkFyTmkk9J/Bg2HostiIX8gOslX8Lv1o=;
 b=l35Ji+gUaM1Bn7/ebC5igqZa5NQpMJ6Oi3obdMiCaj4nDU+2h2nTqWKT/4fwhBzrQ2XB
 +QOWlJfZ6d04/75Hs2G104DsfiG2d4gqQZQaA3cOuA63xHZDusxVVOJL5oK6/mQTboto
 RgTt6rrnf69OuYyW0WwwalepwG7OC9VRzF5ogkabqC6uxCLaAN2ykQCCHxBhcl9VI+7n
 9AoK+zarEwL0Q9vzl+0zRG7mhXSaZjLc68SvAb3ijAdLGP2QbMaDFtUkHh8NSDYNkPgr
 6oQG0eVW2UZyB9vUjI6jYgDRzN5FX6DY/irKJaLuhV7MopL+Lmz8BnSvrYecovttjpOK YA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3st48dg7ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 10:53:26 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37UAhXY5021263;
	Wed, 30 Aug 2023 10:53:26 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3st48dg7hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 10:53:26 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37UA6Ebm019258;
	Wed, 30 Aug 2023 10:53:25 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sqxe1tnjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 10:53:25 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37UArN694456988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Aug 2023 10:53:23 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B4DB20043;
	Wed, 30 Aug 2023 10:53:23 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8849E20040;
	Wed, 30 Aug 2023 10:53:19 +0000 (GMT)
Received: from saptarishi.in.ibm.com (unknown [9.43.8.96])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Aug 2023 10:53:19 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/4] powerpc/smp: Shared processor sched optimizations
Date: Wed, 30 Aug 2023 16:22:40 +0530
Message-ID: <20230830105244.62477-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JC5RyEvDYgX-tILjQ8KZzJL29-7YxDeR
X-Proofpoint-GUID: P2BtmLZBwqLXFsE2ClfSs9XXol4AHv4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308300098
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
Cc: Juergen Gross <jgross@suse.com>, Nathan Lynch <nathanl@linux.ibm.com>, Valentin Schneider <vschneid@redhat.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Paul E McKenney <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
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

System Configuration
type=Shared mode=Capped smt=8 lcpu=128 mem=1066732224 kB cpus=96 ent=40.00
So *40 Entitled cores / 128 Virtual processors* scenario.

lscpu
Architecture:                    ppc64le
Byte Order:                      Little Endian
CPU(s):                          1024
On-line CPU(s) list:             0-1023
Model name:                      POWER10 (architected), altivec supported
Model:                           2.0 (pvr 0080 0200)
Thread(s) per core:              8
Core(s) per socket:              16
Socket(s):                       8
Hypervisor vendor:               pHyp
Virtualization type:             para
L1d cache:                       8 MiB (256 instances)
L1i cache:                       12 MiB (256 instances)
NUMA node(s):                    8
NUMA node0 CPU(s): 0-7,64-71,128-135,192-199,256-263,320-327,384-391,448-455,512-519,576-583,640-647,704-711,768-775,832-839,896-903,960-967
NUMA node1 CPU(s): 8-15,72-79,136-143,200-207,264-271,328-335,392-399,456-463,520-527,584-591,648-655,712-719,776-783,840-847,904-911,968-975
NUMA node2 CPU(s): 16-23,80-87,144-151,208-215,272-279,336-343,400-407,464-471,528-535,592-599,656-663,720-727,784-791,848-855,912-919,976-983
NUMA node3 CPU(s): 24-31,88-95,152-159,216-223,280-287,344-351,408-415,472-479,536-543,600-607,664-671,728-735,792-799,856-863,920-927,984-991
NUMA node4 CPU(s): 32-39,96-103,160-167,224-231,288-295,352-359,416-423,480-487,544-551,608-615,672-679,736-743,800-807,864-871,928-935,992-999
NUMA node5 CPU(s): 40-47,104-111,168-175,232-239,296-303,360-367,424-431,488-495,552-559,616-623,680-687,744-751,808-815,872-879,936-943,1000-1007
NUMA node6 CPU(s): 48-55,112-119,176-183,240-247,304-311,368-375,432-439,496-503,560-567,624-631,688-695,752-759,816-823,880-887,944-951,1008-1015
NUMA node7 CPU(s): 56-63,120-127,184-191,248-255,312-319,376-383,440-447,504-511,568-575,632-639,696-703,760-767,824-831,888-895,952-959,1016-1023

ebizzy -t 40 -S 200 (5 iterations) Records per second. (Higher is better)
Kernel     N  Min       Max       Median    Avg        Stddev     %Change
v6.5       5  4664647   5148125   5130549   5043050.2  211756.06
+patch     5  4769453   5220808   5137476   5040333.8  193586.43  -0.0538642

From lparstat (when the workload stabilized)
Kernel  %user  %sys  %wait  %idle  physc  %entc   lbusy  app    vcsw       phint
v6.5    6.23   0.00  0.00   93.77  40.06  100.15  6.23   55.92  138699651  100
+patch  6.26   0.01  0.00   93.73  21.15  52.87   6.27   74.78  71743299   148

ebizzy -t 80 -S 200 (5 iterations) Records per second. (Higher is better)
Kernel     N  Min       Max       Median    Avg        Stddev     %Change
v6.5       5  8735907   9121401   8986218   8967125.6  152793.38
+patch     5  9636679   9990229   9765958   9770081.8  143913.29  8.95444

From lparstat (when the workload stabilized)
Kernel  %user  %sys  %wait  %idle  physc  %entc   lbusy  app    vcsw      phint
v6.5    12.40  0.01  0.00   87.60  71.05  177.62  12.40  24.61  98047012  85
+patch  12.47  0.02  0.00   87.50  41.06  102.65  12.50  54.90  77821678  158

ebizzy -t 160 -S 200 (5 iterations) Records per second. (Higher is better)
Kernel     N  Min       Max       Median    Avg        Stddev     %Change
v6.5       5  12378356  12946633  12780732  12682369   266135.73
+patch     5  16756702  17676670  17406971  17341585   346054.89  36.7377

From lparstat (when the workload stabilized)
Kernel  %user  %sys  %wait  %idle  physc  %entc   lbusy  app    vcsw       phint
v6.5    24.56  0.09  0.15   75.19  77.42  193.55  24.65  17.94  135625276  98
+patch  24.78  0.03  0.00   75.19  78.33  195.83  24.81  17.17  107826112  215
-------------------------------------------------------------------------

System Configuration
type=Shared mode=Capped smt=8 lcpu=40 mem=1066732672 kB cpus=96 ent=40.00
So *40 Entitled cores / 40 Virtual processors* scenario.

lscpu
Architecture:                    ppc64le
Byte Order:                      Little Endian
CPU(s):                          320
On-line CPU(s) list:             0-319
Model name:                      POWER10 (architected), altivec supported
Model:                           2.0 (pvr 0080 0200)
Thread(s) per core:              8
Core(s) per socket:              10
Socket(s):                       4
Hypervisor vendor:               pHyp
Virtualization type:             para
L1d cache:                       2.5 MiB (80 instances)
L1i cache:                       3.8 MiB (80 instances)
NUMA node(s):                    4
NUMA node0 CPU(s):               0-7,32-39,64-71,96-103,128-135,160-167,192-199,224-231,256-263,288-295
NUMA node1 CPU(s):               8-15,40-47,72-79,104-111,136-143,168-175,200-207,232-239,264-271,296-303
NUMA node2 CPU(s):               16-23,48-55,80-87,112-119,144-151,176-183,208-215,240-247,272-279,304-311
NUMA node3 CPU(s):               24-31,56-63,88-95,120-127,152-159,184-191,216-223,248-255,280-287,312-319

ebizzy -t 40 -S 200 (5 iterations) Records per second. (Higher is better)
Kernel    N  Min       Max       Median    Avg        Stddev     %Change
v6.5      5  4966196   5148045   5078348   5072977.4  66572.122
+patch    5  5035210   5232882   5158456   5151734    78906.893  1.55247

From lparstat (when the workload stabilized)
Kernel  %user  %sys  %wait  %idle  physc  %entc   lbusy  app    vcsw     phint
v6.5    12.58  0.02  0.00   87.41  40.00  100.00  12.59  55.97  1029603  82
+patch  12.58  0.02  0.00   87.40  21.16  52.90   12.60  74.82  1188571  657

ebizzy -t 80 -S 200 (5 iterations) Records per second. (Higher is better)
Kernel    N  Min       Max       Median    Avg        Stddev     %Change
v6.5      5  10081713  10162128  10145721  10128119   35603.196
+patch    5  9928483   10430256  10338097  10218466   221155.16  0.892041

From lparstat (when the workload stabilized)
Kernel  %user  %sys  %wait  %idle  physc  %entc   lbusy  app    vcsw     phint
v6.5    25.02  0.06  0.00   74.93  40.00  100.00  25.07  55.99  1530297  92
+patch  25.03  0.04  0.00   74.93  40.00  100.00  25.07  55.99  2475875  667

ebizzy -t 160 -S 200 (5 iterations) Records per second. (Higher is better)
Kernel    N  Min       Max       Median    Avg        Stddev     %Change
v6.5      5  9064802   9169798   9115250   9123968.2  44901.261
+patch    5  9064533   9235200   9072374   9119558.2  76260.411  -0.0483342

From lparstat (when the workload stabilized)
Kernel  %user  %sys  %wait  %idle  physc  %entc   lbusy  app    vcsw     phint
v6.5    49.94  0.03  0.00   50.03  40.06  100.15  49.97  55.99  2058879  93
+patch  49.94  0.03  0.00   50.03  40.06  100.15  49.97  55.99  2058879  93
-------------------------------------------------------------------------

Observation:
We are able to see Improvement in ebizzy throughput even with lesser
core utilization (almost half the core utilization) in low utilization
scenarios while still retaining throughput in mid and higher utilization
scenarios.
Note: The numbers are with Uncapped + no-noise case. In the Capped and/or
noise case, due to contention on the Cores, the numbers are expected to
further improve.

Srikar Dronamraju (4):
  powerpc/smp: Cache CPU has Asymmetric SMP
  powerpc/smp: Move shared_processor static key to smp.h
  powerpc/smp: Enable Asym packing for cores on shared processor
  powerpc/smp: Disable MC domain for shared processor

 arch/powerpc/include/asm/paravirt.h | 12 -----------
 arch/powerpc/include/asm/smp.h      | 14 +++++++++++++
 arch/powerpc/kernel/smp.c           | 31 +++++++++++++++++++----------
 3 files changed, 35 insertions(+), 22 deletions(-)

-- 
2.41.0

