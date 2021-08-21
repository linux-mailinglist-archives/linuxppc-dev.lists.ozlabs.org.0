Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8F13F3A32
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 12:26:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GsF6W3XPTz3cXq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 20:26:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AxVofwzP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AxVofwzP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GsF5k6BCwz2yPB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Aug 2021 20:26:02 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17LA4Whs167038; Sat, 21 Aug 2021 06:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=7pUqVq1qqVheKMTAWyVJYW/rKrVVL4WZvQj3A14DdH8=;
 b=AxVofwzPUMwh9Jf94QU3b4LRfWhrSBYRaAia2TxHmOTHu1rQD3QwrZsbKu+rQKGeK2Lv
 ExOzwXQ3jRzozllfLfEN8jiR9QdghRYyqpxmz+DrPwsVWwnjOy8CJvzFSik4hKJ+TSSD
 vQi4lAK1psSvQGL9w3U5XxS5rnxaYjQFpnvzGcnGPEM8Um498RKB9yIGCvl3Xx4pxoUy
 3ZeaW2xBDnr4INVRfdqnK69MGsNoqRmf49ggbNiLtZSi37iRM5VubvI9pRVQmRLi/nPT
 u6B1EZ6yXFUtX1/GEEEtkgH4jbqBp8F/hhza/IhA7SshO6cgOfEQWr7F5+3FLgtYevkJ LA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aju3ucqxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Aug 2021 06:25:47 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17LA8m29011392;
 Sat, 21 Aug 2021 10:25:45 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3ajs488ehv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 21 Aug 2021 10:25:45 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17LAM8ep55771448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 21 Aug 2021 10:22:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3ECD711C016;
 Sat, 21 Aug 2021 10:25:42 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6D4411C017;
 Sat, 21 Aug 2021 10:25:38 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.85.90.43])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 21 Aug 2021 10:25:38 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 0/3] Updates to powerpc for robust CPU online/offline
Date: Sat, 21 Aug 2021 15:55:32 +0530
Message-Id: <20210821102535.169643-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2zZ_TJH5Dh2IvH9X2imVtemBy6ecE59E
X-Proofpoint-ORIG-GUID: 2zZ_TJH5Dh2IvH9X2imVtemBy6ecE59E
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-21_03:2021-08-20,
 2021-08-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108210059
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
 Peter Zijlstra <peterz@infradead.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Ingo Molnar <mingo@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Scheduler expects unique number of node distances to be available
at boot. It uses node distance to calculate this unique node
distances. On Power Servers, node distances for offline nodes is not
available. However, Power Servers already knows unique possible node
distances. Fake the offline node's distance_lookup_table entries so
that all possible node distances are updated.

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

However the same system when only two nodes are online at boot, then
distance info from numactl will look like
node distances:
node   0   1
  0:  10  20
  1:  20  10

With the faked numa distance at boot, the node distance table will look
like
node   0   1   2
  0:  10  20  40
  1:  20  10  40
  2:  40  40  10

The actual distance will be populated once the nodes are onlined.

Also when simultaneously running CPU online/offline with CPU
add/remove in a loop, we see a WARNING messages.

WARNING: CPU: 13 PID: 1142 at kernel/sched/topology.c:898 build_sched_domains+0xd48/0x1720
Modules linked in: rpadlpar_io rpaphp mptcp_diag xsk_diag tcp_diag udp_diag
raw_diag inet_diag unix_diag af_packet_diag netlink_diag bonding tls
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables nfnetlink
pseries_rng xts vmx_crypto uio_pdrv_genirq uio binfmt_misc ip_tables xfs
libcrc32c dm_service_time sd_mod t10_pi sg ibmvfc scsi_transport_fc ibmveth
dm_multipath dm_mirror dm_region_hash dm_log dm_mod fuse
CPU: 13 PID: 1142 Comm: kworker/13:2 Not tainted 5.13.0-rc6+ #28
Workqueue: events cpuset_hotplug_workfn
NIP:  c0000000001caac8 LR: c0000000001caac4 CTR: 00000000007088ec
REGS: c00000005596f220 TRAP: 0700   Not tainted  (5.13.0-rc6+)
MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 48828222  XER: 00000009
CFAR: c0000000001ea698 IRQMASK: 0
GPR00: c0000000001caac4 c00000005596f4c0 c000000001c4a400 0000000000000036
GPR04: 00000000fffdffff c00000005596f1d0 0000000000000027 c0000018cfd07f90
GPR08: 0000000000000023 0000000000000001 0000000000000027 c0000018fe68ffe8
GPR12: 0000000000008000 c00000001e9d1880 c00000013a047200 0000000000000800
GPR16: c000000001d3c7d0 0000000000000240 0000000000000048 c000000010aacd18
GPR20: 0000000000000001 c000000010aacc18 c00000013a047c00 c000000139ec2400
GPR24: 0000000000000280 c000000139ec2520 c000000136c1b400 c000000001c93060
GPR28: c00000013a047c20 c000000001d3c6c0 c000000001c978a0 000000000000000d
NIP [c0000000001caac8] build_sched_domains+0xd48/0x1720
LR [c0000000001caac4] build_sched_domains+0xd44/0x1720
Call Trace:
[c00000005596f4c0] [c0000000001caac4] build_sched_domains+0xd44/0x1720 (unreliable)
[c00000005596f670] [c0000000001cc5ec] partition_sched_domains_locked+0x3ac/0x4b0
[c00000005596f710] [c0000000002804e4] rebuild_sched_domains_locked+0x404/0x9e0
[c00000005596f810] [c000000000283e60] rebuild_sched_domains+0x40/0x70
[c00000005596f840] [c000000000284124] cpuset_hotplug_workfn+0x294/0xf10
[c00000005596fc60] [c000000000175040] process_one_work+0x290/0x590
[c00000005596fd00] [c0000000001753c8] worker_thread+0x88/0x620
[c00000005596fda0] [c000000000181704] kthread+0x194/0x1a0
[c00000005596fe10] [c00000000000ccec] ret_from_kernel_thread+0x5c/0x70
Instruction dump:
485af049 60000000 2fa30800 409e0028 80fe0000 e89a00f8 e86100e8 38da0120
7f88e378 7ce53b78 4801fb91 60000000 <0fe00000> 39000000 38e00000 38c00000

This was because cpu_cpu_mask() was not getting updated on CPU
online/offline but would be only updated when add/remove of CPUs.
Other cpumasks get updated both on CPU online/offline and add/remove
Update cpu_cpu_mask() on CPU online/offline too.

Cc: linuxppc-dev@lists.ozlabs.org
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
Cc: Laurent Dufour <ldufour@linux.ibm.com>

Srikar Dronamraju (3):
  powerpc/numa: Print debug statements only when required
  powerpc/numa: Update cpu_cpu_map on CPU online/offline
  powerpc/numa: Fill distance_lookup_table for offline nodes

 arch/powerpc/include/asm/topology.h | 12 ++++
 arch/powerpc/kernel/smp.c           |  3 +
 arch/powerpc/mm/numa.c              | 88 +++++++++++++++++++++++++----
 3 files changed, 92 insertions(+), 11 deletions(-)

-- 
2.18.2

