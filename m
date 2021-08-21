Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D283F39E4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 11:27:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GsCnk5w2Gz3dFt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 19:27:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oRzAyNgJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oRzAyNgJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GsClV2JTmz306h
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Aug 2021 19:25:09 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17L948Yc048932; Sat, 21 Aug 2021 05:24:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7XUqnh5A+r30snVW06o+l6cYUrYfEptk+AJgOQtUFbU=;
 b=oRzAyNgJnVbO3VOP7A8W9C9QaOrmtRC+kWHBEJi//mcJYgYLyci1/w7nyEqqFq5BEYLY
 2/l04ZZLKJBVsfZN+DgwicJdqMVskzgJudoXLNRrbq3jEOoz6kwJpU4nx4Rhys1gFmC5
 vl5AseMRqOA0J++AzkEzndKlZYNd31RE5EMM/RuTXKIsLb629g4nBGy/x706+pqCW8F1
 eN++M9P3CTSrTQtKlMzCXeiLvSH0tg9EPLH2n9bOCvTSDyrgxYDwDL4y4DiOF9CGvOo+
 gBxFxB6RsfVknw5AX9c7v5ZmZ78BAPCWfcz0NMhlgY8sjqdNG6VqlWcZQiMcnbLG/9Gd Sw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ajwrvs24e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Aug 2021 05:24:58 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17L9Cuth031453;
 Sat, 21 Aug 2021 09:24:57 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3ajs488ayx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Aug 2021 09:24:56 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17L9LHpR54788540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 21 Aug 2021 09:21:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4668711C017;
 Sat, 21 Aug 2021 09:24:54 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BF7811C015;
 Sat, 21 Aug 2021 09:24:51 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.85.90.43])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 21 Aug 2021 09:24:50 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/3] powerpc/smp: Update cpu_core_map on PowerVM lpars.
Date: Sat, 21 Aug 2021 14:54:18 +0530
Message-Id: <20210821092419.167454-3-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210821092419.167454-1-srikar@linux.vnet.ibm.com>
References: <20210821092419.167454-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tZIijtvjosYJIMWoGn2nHD9pwLOW0ojj
X-Proofpoint-ORIG-GUID: tZIijtvjosYJIMWoGn2nHD9pwLOW0ojj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-21_03:2021-08-20,
 2021-08-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 mlxscore=0 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108210052
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
 Vincent Guittot <vincent.guittot@linaro.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

lscpu() uses core_siblings to list the number of sockets in the
system. core_siblings is set using topology_core_cpumask.

While optimizing the powerpc bootup path, Commit 4ca234a9cbd7
("powerpc/smp: Stop updating cpu_core_mask").  it was found that
updating cpu_core_mask() ended up taking a lot of time. It was thought
that on Powerpc, cpu_core_mask() would always be same as
cpu_cpu_mask() i.e number of sockets will always be equal to number of
nodes. As an optimization, cpu_core_mask() was made a snapshot of
cpu_cpu_mask().

However that was found to be false with PowerPc KVM guests, where each
node could have more than one socket. So with Commit c47f892d7aa6
("powerpc/smp: Reintroduce cpu_core_mask"), cpu_core_mask was updated
based on chip_id but in an optimized way using some mask manipulations
and chip_id caching.

However PowerVM based lpars (and other not implementing
cpu_to_chip_id(), continued to use a copy of cpu_cpu_mask().

There are two issues that were noticed on PowerVM lpars.
1. lscpu would report one extra socket.
On a IBM,9009-42A (aka zz system) which has only 2 chips/ sockets/
nodes, lscpu would report
Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              160
On-line CPU(s) list: 0-159
Thread(s) per core:  8
Core(s) per socket:  6
Socket(s):           3                <--------------
NUMA node(s):        2
Model:               2.2 (pvr 004e 0202)
Model name:          POWER9 (architected), altivec supported
Hypervisor vendor:   pHyp
Virtualization type: para
L1d cache:           32K
L1i cache:           32K
L2 cache:            512K
L3 cache:            10240K
NUMA node0 CPU(s):   0-79
NUMA node1 CPU(s):   80-159

2. Currently cpu_cpu_mask is updated when a core is
added/removed. However its not updated when smt mode switching or on
CPUs are explicitly offlined. However all other percpu masks are
updated to ensure only active/online CPUs are in the masks.
This results in build_sched_domain traces since there will be CPUs in
cpu_cpu_mask() but those CPUs are not present in SMT / CACHE / MC /
NUMA domains. A loop of threads running smt mode switching and core
add/remove will soon show this trace.
Hence cpu_cpu_mask has to be update at smt mode switch.

This will have impact on cpu_core_mask(). cpu_core_mask() is a
snapshot of cpu_cpu_mask. Different CPUs within the same socket will
end up having different cpu_core_masks since they are snapshots at
different points of time. This means when lscpu will start reporting
many more sockets than the actual number of sockets/ nodes / chips.

Different ways to handle this problem:
A. Update the snapshot aka cpu_core_mask for all CPUs whenever
   cpu_cpu_mask is updated. This would a non-optimal solution.
B. Instead of a cpumask_var_t, make cpu_core_map a cpumask pointer
   pointing to cpu_cpu_mask. However percpu cpumask pointer is frowned
   upon and we need a clean way to handle PowerPc KVM guest which is
   not a snapshot.
C. Update cpu_core_masks in PowerVM like in PowerPc KVM guests using
   mask manipulations. This approach is relatively simple and unifies
   with the existing code.
D. On top of 3, we could also resurrect get_physical_package_id which
   could return a nid for the said CPU. However this is not needed at this
   time.

Option C is the preferred approach for now.

While this is somewhat a revert of Commit 4ca234a9cbd7 ("powerpc/smp:
Stop updating cpu_core_mask").

1. Plain revert has some conflicts
2. For chip_id == -1, the cpu_core_mask is made identical to
cpu_cpu_mask, unlike previously where cpu_core_mask was set to a core
if chip_id doesn't exist.

This goes by the principle that if chip_id is not exposed, then
sockets / chip / node share the same set of CPUs.

With the fix, lscpu o/p would be
Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              160
On-line CPU(s) list: 0-159
Thread(s) per core:  8
Core(s) per socket:  6
Socket(s):           2                     <--------------
NUMA node(s):        2
Model:               2.2 (pvr 004e 0202)
Model name:          POWER9 (architected), altivec supported
Hypervisor vendor:   pHyp
Virtualization type: para
L1d cache:           32K
L1i cache:           32K
L2 cache:            512K
L3 cache:            10240K
NUMA node0 CPU(s):   0-79
NUMA node1 CPU(s):   80-159

Cc: linuxppc-dev@lists.ozlabs.org
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Fixes: 4ca234a9cbd7 ("powerpc/smp: Stop updating cpu_core_mask")
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/smp.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 3d6874fe1937..3d26d3c61e94 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1492,6 +1492,7 @@ static void add_cpu_to_masks(int cpu)
 	 * add it to it's own thread sibling mask.
 	 */
 	cpumask_set_cpu(cpu, cpu_sibling_mask(cpu));
+	cpumask_set_cpu(cpu, cpu_core_mask(cpu));
 
 	for (i = first_thread; i < first_thread + threads_per_core; i++)
 		if (cpu_online(i))
@@ -1509,11 +1510,6 @@ static void add_cpu_to_masks(int cpu)
 	if (chip_id_lookup_table && ret)
 		chip_id = cpu_to_chip_id(cpu);
 
-	if (chip_id == -1) {
-		cpumask_copy(per_cpu(cpu_core_map, cpu), cpu_cpu_mask(cpu));
-		goto out;
-	}
-
 	if (shared_caches)
 		submask_fn = cpu_l2_cache_mask;
 
@@ -1523,6 +1519,10 @@ static void add_cpu_to_masks(int cpu)
 	/* Skip all CPUs already part of current CPU core mask */
 	cpumask_andnot(mask, cpu_online_mask, cpu_core_mask(cpu));
 
+	/* If chip_id is -1; limit the cpu_core_mask to within DIE*/
+	if (chip_id == -1)
+		cpumask_and(mask, mask, cpu_cpu_mask(cpu));
+
 	for_each_cpu(i, mask) {
 		if (chip_id == cpu_to_chip_id(i)) {
 			or_cpumasks_related(cpu, i, submask_fn, cpu_core_mask);
@@ -1532,7 +1532,6 @@ static void add_cpu_to_masks(int cpu)
 		}
 	}
 
-out:
 	free_cpumask_var(mask);
 }
 
-- 
2.18.2

