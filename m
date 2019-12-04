Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F22C7112CEA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 14:51:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SgHs3wX7zDqQH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 00:51:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Sg8c535NzDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 00:45:19 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB4Dg6Ps146131
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 4 Dec 2019 08:45:15 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wnp670a2u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Dec 2019 08:45:15 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Wed, 4 Dec 2019 13:45:13 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 4 Dec 2019 13:45:10 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xB4DiTED41943382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Dec 2019 13:44:29 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB69CA406A;
 Wed,  4 Dec 2019 13:45:09 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 948B3A4068;
 Wed,  4 Dec 2019 13:45:08 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.122.211.200])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 Dec 2019 13:45:08 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] powerpc/vcpu: Assume dedicated processors as non-preempt
Date: Wed,  4 Dec 2019 19:14:58 +0530
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
x-cbid: 19120413-0008-0000-0000-0000033CFF9B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120413-0009-0000-0000-00004A5C1F34
Message-Id: <20191204134459.22470-1-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-04_03:2019-12-04,2019-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912040112
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Parth Shah <parth@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>, Waiman Long <longman@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With commit 247f2f6f3c70 ("sched/core: Don't schedule threads on pre-empted
vCPUs"), scheduler avoids preempted vCPUs to schedule tasks on wakeup.
This leads to wrong choice of CPU, which in-turn leads to larger wakeup
latencies. Eventually, it leads to performance regression in latency
sensitive benchmarks like soltp, schbench etc.

On Powerpc, vcpu_is_preempted only looks at yield_count. If the
yield_count is odd, the vCPU is assumed to be preempted. However
yield_count is increased whenever LPAR enters CEDE state. So any CPU
that has entered CEDE state is assumed to be preempted.

Even if vCPU of dedicated LPAR is preempted/donated, it should have
right of first-use since they are suppose to own the vCPU.

On a Power9 System with 32 cores
 # lscpu
Architecture:        ppc64le
Byte Order:          Little Endian
CPU(s):              128
On-line CPU(s) list: 0-127
Thread(s) per core:  8
Core(s) per socket:  1
Socket(s):           16
NUMA node(s):        2
Model:               2.2 (pvr 004e 0202)
Model name:          POWER9 (architected), altivec supported
Hypervisor vendor:   pHyp
Virtualization type: para
L1d cache:           32K
L1i cache:           32K
L2 cache:            512K
L3 cache:            10240K
NUMA node0 CPU(s):   0-63
NUMA node1 CPU(s):   64-127
 

  # perf stat -a -r 5 ./schbench
v5.4				                v5.4 + patch
Latency percentiles (usec)                      Latency percentiles (usec)
	49.0000th: 47                           	50.0000th: 33
	74.0000th: 64                           	75.0000th: 44
	89.0000th: 76                           	90.0000th: 50
	94.0000th: 83                           	95.0000th: 53
	*98.0000th: 103                         	*99.0000th: 57
	98.5000th: 2124                         	99.5000th: 59
	98.9000th: 7976                         	99.9000th: 83
	min=-1, max=10519                       	min=0, max=117
Latency percentiles (usec)                      Latency percentiles (usec)
	49.0000th: 45                           	50.0000th: 34
	74.0000th: 61                           	75.0000th: 45
	89.0000th: 70                           	90.0000th: 52
	94.0000th: 77                           	95.0000th: 56
	*98.0000th: 504                         	*99.0000th: 62
	98.5000th: 4012                         	99.5000th: 64
	98.9000th: 8168                         	99.9000th: 79
	min=-1, max=14500                       	min=0, max=123
Latency percentiles (usec)                      Latency percentiles (usec)
	49.0000th: 48                           	50.0000th: 35
	74.0000th: 65                           	75.0000th: 47
	89.0000th: 76                           	90.0000th: 55
	94.0000th: 82                           	95.0000th: 59
	*98.0000th: 1098                        	*99.0000th: 67
	98.5000th: 3988                         	99.5000th: 71
	98.9000th: 9360                         	99.9000th: 98
	min=-1, max=19283                       	min=0, max=137
Latency percentiles (usec)                      Latency percentiles (usec)
	49.0000th: 46                           	50.0000th: 35
	74.0000th: 63                           	75.0000th: 46
	89.0000th: 73                           	90.0000th: 53
	94.0000th: 78                           	95.0000th: 57
	*98.0000th: 113                         	*99.0000th: 63
	98.5000th: 2316                         	99.5000th: 65
	98.9000th: 7704                         	99.9000th: 83
	min=-1, max=17976                       	min=0, max=139
Latency percentiles (usec)                      Latency percentiles (usec)
	49.0000th: 46                           	50.0000th: 34
	74.0000th: 62                           	75.0000th: 46
	89.0000th: 73                           	90.0000th: 53
	94.0000th: 79                           	95.0000th: 57
	*98.0000th: 97                          	*99.0000th: 64
	98.5000th: 1398                         	99.5000th: 70
	98.9000th: 8136                         	99.9000th: 100
	min=-1, max=10008                       	min=0, max=142

Performance counter stats for 'system wide' (4 runs):

context-switches       42,604 ( +-  0.87% )       45,397 ( +-  0.25% )
cpu-migrations          0,195 ( +-  2.70% )          230 ( +-  7.23% )
page-faults            16,783 ( +- 14.87% )       16,781 ( +-  9.77% )

Waiman Long suggested using static_keys.

Reported-by: Parth Shah <parth@linux.ibm.com>
Reported-by: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
Cc: Parth Shah <parth@linux.ibm.com>
Cc: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Waiman Long <longman@redhat.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/spinlock.h | 5 +++--
 arch/powerpc/mm/numa.c              | 4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
index e9a960e28f3c..866f6ca0427a 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -35,11 +35,12 @@
 #define LOCK_TOKEN	1
 #endif
 
-#ifdef CONFIG_PPC_PSERIES
+#if defined(CONFIG_PPC_PSERIES) && defined(CONFIG_PPC_SPLPAR)
+DECLARE_STATIC_KEY_FALSE(shared_processor);
 #define vcpu_is_preempted vcpu_is_preempted
 static inline bool vcpu_is_preempted(int cpu)
 {
-	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
+	if (!static_branch_unlikely(&shared_processor))
 		return false;
 	return !!(be32_to_cpu(lppaca_of(cpu).yield_count) & 1);
 }
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 50d68d21ddcc..ffb971f3a63c 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1568,9 +1568,13 @@ int prrn_is_enabled(void)
 	return prrn_enabled;
 }
 
+DEFINE_STATIC_KEY_FALSE(shared_processor);
+EXPORT_SYMBOL_GPL(shared_processor);
+
 void __init shared_proc_topology_init(void)
 {
 	if (lppaca_shared_proc(get_lppaca())) {
+		static_branch_enable(&shared_processor);
 		bitmap_fill(cpumask_bits(&cpu_associativity_changes_mask),
 			    nr_cpumask_bits);
 		numa_update_cpu_topology(false);
-- 
2.18.1

