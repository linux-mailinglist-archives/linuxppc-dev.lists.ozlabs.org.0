Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D9438B373
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 17:45:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmDbP6xPjz3bvd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 01:45:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DN+HwzDA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DN+HwzDA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmDZw0D4pz2yWp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 01:45:11 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14KFYkWb001554; Thu, 20 May 2021 11:44:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=f/Ijhp5BbeF9ZR4d7uFbrh+RPrYVsMiQ6YiGUTVRzN8=;
 b=DN+HwzDAEvXTCkyQqob3YQmWAIKdGFl0Bi0ZqnnIsJowWYUU+8/7iCGIPImv9/8678Bf
 GlK7D2e/PLwC2p1WeZx09LSaqbiuAwCnjKrf0LEK7eCLHfSx4jq6rWm8rKuu+KlVvFM/
 E3ik4WLa64FwuXOPa8uOq8ymzn3enae0cJIYHr0AWEmHBNGlYasxFOF8SoFFi7OfUCO3
 1vQp0Pwk0FCjp8EMIJLEjJvRYZeeYikA29z59AQs48EO2Um/Qo2qJYOLy7sFkOP9G/WS
 BKCEaMXD1flMpLCLWYGz+IvRfFcMFYpquB5GVMcSbcQRK4iRLZFbX9f9uZQbklaBSK9S RA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38nrms4wwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 11:44:43 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14KFagG5001560;
 Thu, 20 May 2021 15:44:41 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 38j5jgtqe8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 15:44:41 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14KFicXw31457692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 15:44:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96CF5A405D;
 Thu, 20 May 2021 15:44:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF1C1A406F;
 Thu, 20 May 2021 15:44:35 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.77.198.25])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 May 2021 15:44:35 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH 0/3] Skip numa distance for offline nodes
Date: Thu, 20 May 2021 21:14:24 +0530
Message-Id: <20210520154427.1041031-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qipuVRt3mAVylK396hRqmcea3StPvS8H
X-Proofpoint-GUID: qipuVRt3mAVylK396hRqmcea3StPvS8H
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_04:2021-05-20,
 2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200104
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
 linuxppc-dev@lists.ozlabs.org, Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@techsingularity.net>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
Cc: Scott Cheloha <cheloha@linux.ibm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Rik van Riel <riel@surriel.com>
Cc: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>

Srikar Dronamraju (3):
  sched/topology: Allow archs to populate distance map
  powerpc/numa: Populate distance map correctly
  sched/topology: Skip updating masks for non-online nodes

 arch/powerpc/include/asm/topology.h |  3 +++
 arch/powerpc/mm/numa.c              | 19 +++++++++++++++
 kernel/sched/topology.c             | 38 +++++++++++++++++++++--------
 3 files changed, 50 insertions(+), 10 deletions(-)


base-commit: 1699949d3314e5d1956fb082e4cd4798bf6149fc
-- 
2.27.0

