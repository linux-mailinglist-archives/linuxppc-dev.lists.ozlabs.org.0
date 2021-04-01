Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B02C1351648
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:42:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB6rw55Z6z3c7B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:42:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bpMWPMqk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bpMWPMqk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB6rS44Zqz2xb5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:42:31 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 131FYD0L104620; Thu, 1 Apr 2021 11:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=HAiQha4J2H7ru6W7G0BuEfx3Wr7TBGtDphyGPQ0og2c=;
 b=bpMWPMqkQec2m1je054NzoLCL24pDG/mMSs+//hbUWnLmMa6slz7FKi0BXg14PCrv88J
 Krh2OgpSmL97TkTfEq+N/SL5grAQNL2OW/DSFv2ClrrIcWPcT7JQ2izU3vPw0OCoW2EE
 nGqzMsOX2sPvQjYv8KPTQ0ycjKvMhdjkAPLVqcrQfOODT60PSX/Daev++H0+1cQr1Jj3
 U+nmW1y/Xd5xb/J33Cqe729QdZ2S1oDJgaVLMQsyrpMyfLzvSs6GSnOkoQfVnOIahZ9W
 HZDM0Ac01Q/JbELBE8KGvsN9cUAeKEB/KLzWYmgegXBSxu8fqE2alAC+ncijNi/sbtRk sA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37n9nxexp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 11:42:10 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 131FMIEu028713;
 Thu, 1 Apr 2021 15:42:08 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 37n28v8mb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 15:42:08 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 131Fg5iY39977368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Apr 2021 15:42:05 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74060A4053;
 Thu,  1 Apr 2021 15:42:05 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34D98A4040;
 Thu,  1 Apr 2021 15:42:03 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.77.207.199])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Apr 2021 15:42:02 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/1] powerpc/smp: Set numa node before updating mask
Date: Thu,  1 Apr 2021 21:12:00 +0530
Message-Id: <20210401154200.150077-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tQGnHTQ_GUVcKp6GNfgwrRNPzfA4zRXv
X-Proofpoint-ORIG-GUID: tQGnHTQ_GUVcKp6GNfgwrRNPzfA4zRXv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-01_07:2021-04-01,
 2021-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103310000 definitions=main-2104010103
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
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Ingo Molnar <mingo@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Geethika reported a trace when doing a dlpar CPU add.

------------[ cut here ]------------
WARNING: CPU: 152 PID: 1134 at kernel/sched/topology.c:2057
CPU: 152 PID: 1134 Comm: kworker/152:1 Not tainted 5.12.0-rc5-master #5
Workqueue: events cpuset_hotplug_workfn
NIP:  c0000000001cfc14 LR: c0000000001cfc10 CTR: c0000000007e3420
REGS: c0000034a08eb260 TRAP: 0700   Not tainted  (5.12.0-rc5-master+)
MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28828422  XER: 00000020
CFAR: c0000000001fd888 IRQMASK: 0 #012GPR00: c0000000001cfc10
c0000034a08eb500 c000000001f35400 0000000000000027 #012GPR04:
c0000035abaa8010 c0000035abb30a00 0000000000000027 c0000035abaa8018
#012GPR08: 0000000000000023 c0000035abaaef48 00000035aa540000
c0000035a49dffe8 #012GPR12: 0000000028828424 c0000035bf1a1c80
0000000000000497 0000000000000004 #012GPR16: c00000000347a258
0000000000000140 c00000000203d468 c000000001a1a490 #012GPR20:
c000000001f9c160 c0000034adf70920 c0000034aec9fd20 0000000100087bd3
#012GPR24: 0000000100087bd3 c0000035b3de09f8 0000000000000030
c0000035b3de09f8 #012GPR28: 0000000000000028 c00000000347a280
c0000034aefe0b00 c0000000010a2a68
NIP [c0000000001cfc14] build_sched_domains+0x6a4/0x1500
LR [c0000000001cfc10] build_sched_domains+0x6a0/0x1500
Call Trace:
[c0000034a08eb500] [c0000000001cfc10] build_sched_domains+0x6a0/0x1500 (unreliable)
[c0000034a08eb640] [c0000000001d1e6c] partition_sched_domains_locked+0x3ec/0x530
[c0000034a08eb6e0] [c0000000002936d4] rebuild_sched_domains_locked+0x524/0xbf0
[c0000034a08eb7e0] [c000000000296bb0] rebuild_sched_domains+0x40/0x70
[c0000034a08eb810] [c000000000296e74] cpuset_hotplug_workfn+0x294/0xe20
[c0000034a08ebc30] [c000000000178dd0] process_one_work+0x300/0x670
[c0000034a08ebd10] [c0000000001791b8] worker_thread+0x78/0x520
[c0000034a08ebda0] [c000000000185090] kthread+0x1a0/0x1b0
[c0000034a08ebe10] [c00000000000ccec] ret_from_kernel_thread+0x5c/0x70
Instruction dump:
7d2903a6 4e800421 e8410018 7f67db78 7fe6fb78 7f45d378 7f84e378 7c681b78
3c62ff1a 3863c6f8 4802dc35 60000000 <0fe00000> 3920fff4 f9210070 e86100a0
---[ end trace 532d9066d3d4d7ec ]---

Some of the per-CPU masks use cpu_cpu_mask as a filter to limit the search
for related CPUs. On a dlpar add of a CPU, update cpu_cpu_mask before
updating the per-CPU masks. This will ensure the cpu_cpu_mask is updated
correctly before its used in setting the masks. Setting the numa_node will
ensure that when cpu_cpu_mask() gets called, the correct node number is
used. This code movement helped fix the above call trace.

Cc: linuxppc-dev@lists.ozlabs.org
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Scott Cheloha <cheloha@linux.ibm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
Reported-by: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/smp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5a4d59a1070d..1a99d75679a8 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1521,6 +1521,9 @@ void start_secondary(void *unused)
 
 	vdso_getcpu_init();
 #endif
+	set_numa_node(numa_cpu_lookup_table[cpu]);
+	set_numa_mem(local_memory_node(numa_cpu_lookup_table[cpu]));
+
 	/* Update topology CPU masks */
 	add_cpu_to_masks(cpu);
 
@@ -1539,9 +1542,6 @@ void start_secondary(void *unused)
 			shared_caches = true;
 	}
 
-	set_numa_node(numa_cpu_lookup_table[cpu]);
-	set_numa_mem(local_memory_node(numa_cpu_lookup_table[cpu]));
-
 	smp_wmb();
 	notify_cpu_starting(cpu);
 	set_cpu_online(cpu, true);
-- 
2.27.0

