Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B926A3B8CDA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 06:17:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFlKX5FqPz3bjf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 14:17:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sai8wSsI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Sai8wSsI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFlK31qmXz2yN3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 14:16:38 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16143RVX142440; Thu, 1 Jul 2021 00:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=8Y1pJhcEdfTX8ByyHeVOiPCrmi/ljWqFUx98MB0fCMo=;
 b=Sai8wSsIlVjGEAMGtFrjyi2+i8e7qVWwSB+lGY2k/GFIHE131OSDT3lBKd8nex/GwOXD
 md8Z/ZV6JsxSZH85Cps2vml41LBbeNM6JDj3LOcb/sogpedCaTHN6k5ThOHjsiHpgvFe
 Q1ZsL2A+pfC3Xco9A+LxdA6t90sikeIeE3eBawo1QS+SyUqQfLmMIjsDofZxsIlYlAs+
 LQDdM494IRB9S4CV7V7v6z5ImUbrAnFVg2QtQCSqOm42G36s3Yye8h8LdAowudtgljLv
 1vnymEUyeYxM1/R/DQZZqWfBC4qb/Sl/yiFJwHDumxxLXwOc9qVtE9/7eLhdEV2MKOkm Qw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39h514hy5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 00:16:17 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1614CNVd009622;
 Thu, 1 Jul 2021 04:16:14 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 39duv8h4sk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 04:16:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1614GA4X22413606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 04:16:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D03BB11C06C;
 Thu,  1 Jul 2021 04:16:10 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 795C111C069;
 Thu,  1 Jul 2021 04:16:07 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.85.122.203])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Jul 2021 04:16:07 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 0/2]  Skip numa distance for offline nodes
Date: Thu,  1 Jul 2021 09:45:50 +0530
Message-Id: <20210701041552.112072-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hEJwWindf7BtteiaVGFkck3ixuBoFvy7
X-Proofpoint-GUID: hEJwWindf7BtteiaVGFkck3ixuBoFvy7
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1011 suspectscore=0 malwarescore=0 mlxlogscore=951
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010027
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
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Rik van Riel <riel@surriel.com>,
 linuxppc-dev@lists.ozlabs.org,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Laurent Dufour <ldufour@linux.ibm.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changelog v1->v2:
v1: http://lore.kernel.org/lkml/20210520154427.1041031-1-srikar@linux.vnet.ibm.com/t/#u
- Update the numa masks, whenever 1st CPU is added to cpuless node
- Populate all possible nodes distances in boot in a
powerpc specific function

Geetika reported yet another trace while doing a dlpar CPU add
operation. This was true even on top of a recent commit
6980d13f0dd1 ("powerpc/smp: Set numa node before updating mask") which fixed
a similar trace.

WARNING: CPU: 40 PID: 2954 at kernel/sched/topology.c:2088 build_sched_domains+0x6e8/0x1540
Modules linked in: nft_counter nft_compat rpadlpar_io rpaphp mptcp_diag
xsk_diag tcp_diag udp_diag raw_diag inet_diag unix_diag af_packet_diag
netlink_diag bonding tls nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat
nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables
nfnetlink dm_multipath pseries_rng xts vmx_crypto binfmt_misc ip_tables xfs
libcrc32c sd_mod t10_pi sg ibmvscsi ibmveth scsi_transport_srp dm_mirror
dm_region_hash dm_log dm_mod fuse
CPU: 40 PID: 2954 Comm: kworker/40:0 Not tainted 5.13.0-rc1+ #19
Workqueue: events cpuset_hotplug_workfn
NIP:  c0000000001de588 LR: c0000000001de584 CTR: 00000000006cd36c
REGS: c00000002772b250 TRAP: 0700   Not tainted  (5.12.0-rc5-master+)
MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28828422  XER: 0000000d
CFAR: c00000000020c2f8 IRQMASK: 0 #012GPR00: c0000000001de584 c00000002772b4f0
c000000001f55400 0000000000000036 #012GPR04: c0000063c6368010 c0000063c63f0a00
0000000000000027 c0000063c6368018 #012GPR08: 0000000000000023 c0000063c636ef48
00000063c4de0000 c0000063bfe9ffe8 #012GPR12: 0000000028828424 c0000063fe68fe80
0000000000000000 0000000000000417 #012GPR16: 0000000000000028 c00000000740dcd8
c00000000205db68 c000000001a3a4a0 #012GPR20: c000000091ed7d20 c000000091ed8520
0000000000000001 0000000000000000 #012GPR24: c0000000113a9600 0000000000000190
0000000000000028 c0000000010e3ac0 #012GPR28: 0000000000000000 c00000000740dd00
c0000000317b5900 0000000000000190
NIP [c0000000001de588] build_sched_domains+0x6e8/0x1540
LR [c0000000001de584] build_sched_domains+0x6e4/0x1540
Call Trace:
[c00000002772b4f0] [c0000000001de584] build_sched_domains+0x6e4/0x1540 (unreliable)
[c00000002772b640] [c0000000001e08dc] partition_sched_domains_locked+0x3ec/0x530
[c00000002772b6e0] [c0000000002a2144] rebuild_sched_domains_locked+0x524/0xbf0
[c00000002772b7e0] [c0000000002a5620] rebuild_sched_domains+0x40/0x70
[c00000002772b810] [c0000000002a58e4] cpuset_hotplug_workfn+0x294/0xe20
[c00000002772bc30] [c000000000187510] process_one_work+0x300/0x670
[c00000002772bd10] [c0000000001878f8] worker_thread+0x78/0x520
[c00000002772bda0] [c0000000001937f0] kthread+0x1a0/0x1b0
[c00000002772be10] [c00000000000d6ec] ret_from_kernel_thread+0x5c/0x70
Instruction dump:
7ee5bb78 7f0ac378 7f29cb78 7f68db78 7f46d378 7f84e378 f8610068 3c62ff19
fbe10060 3863e558 4802dd31 60000000 <0fe00000> 3920fff4 f9210080 e86100b0

Detailed analysis of the failing scenario showed that the span in
question belongs to NODE domain and further the cpumasks for some
cpus in NODE overlapped. There are two possible reasons how we ended
up here:

(1) The numa node was offline or blank with no CPUs or memory. Hence
the sched_max_numa_distance could not be set correctly, or the
sched_domains_numa_distance happened to be partially populated.

(2) Depending on a bogus node_distance of an offline node to populate
cpumasks is the issue.  On POWER platform the node_distance is
correctly available only for an online node which has some CPU or
memory resource associated with it.

For example distance info from numactl from a fully populated 8 node
system at boot may look like this.

node distances:
node   0   1   2   3   4   5   6   7
  0:  10  20  40  40  40  40  40  40
  1:  20  10  40  40  40  40  40  40
  2:  40  40  10  20  40  40  40  40
  3:  40  40  20  10  40  40  40  40
  4:  40  40  40  40  10  20  40  40
  5:  40  40  40  40  20  10  40  40
  6:  40  40  40  40  40  40  10  20
  7:  40  40  40  40  40  40  20  10

However the same system when only two nodes are online at boot, then the
numa topology will look like
node distances:
node   0   1
  0:  10  20
  1:  20  10

This series tries to fix both these problems.
Note: These problems are now visible, thanks to
Commit ccf74128d66c ("sched/topology: Assert non-NUMA topology masks don't
(partially) overlap")

Cc: LKML <linux-kernel@vger.kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
Cc: Laurent Dufour <ldufour@linux.ibm.com>

Srikar Dronamraju (2):
  sched/topology: Skip updating masks for non-online nodes
  powerpc/numa: Fill distance_lookup_table for offline nodes

 arch/powerpc/mm/numa.c  | 70 +++++++++++++++++++++++++++++++++++++++++
 kernel/sched/topology.c | 25 +++++++++++++--
 2 files changed, 93 insertions(+), 2 deletions(-)


base-commit: 031e3bd8986fffe31e1ddbf5264cccfe30c9abd7
-- 
2.27.0

