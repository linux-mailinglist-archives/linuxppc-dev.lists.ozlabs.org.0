Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F69A2677E6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 06:48:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpKr54LS3zDqvh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 14:48:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dXFn7g5G; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpKpH5YShzDqfC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 14:46:31 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08C4WHEB181031; Sat, 12 Sep 2020 00:46:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=G9XvE80KhaMv3fDI1rDw1eoNjebY4knYnYfZS0fiD08=;
 b=dXFn7g5GM6qb1zmggyDiFTee2BuVXAB2161B2MIx9/confTL4Tr2LSiTOIPxwctgY8sr
 FH/wueRBhz1SYpnE6ZHtH1fO4Xvh4kwCQ2IYkh2pLeKOj1nVDDZCij4B7V3YZ43l6teQ
 zX/kpM4q7ldPvwkiAt9MQEPdbcB0V1pstIuqE0eocOckGX8fe/g7lLrGiaKPvJdOgwZ2
 G4/wlDv+ctNoI839EO515QnX0YEWPKHBhG6ZVCfvN9JFJ1qWj5LWQ6a2CwYsaluucC6W
 wp19aRBtaiWvUNIs5vfdbf5DnUjfEket5OkqLk2KJyjL8ZcbPIv9MbPXkSLwEzjmufDv jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33gq3w0fgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Sep 2020 00:46:12 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08C4jQUB012875;
 Sat, 12 Sep 2020 00:46:12 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33gq3w0fgc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Sep 2020 00:46:11 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08C4hder012233;
 Sat, 12 Sep 2020 04:46:10 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 33gnkh82hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Sep 2020 04:46:10 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08C4k7Hl35783154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Sep 2020 04:46:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E7C042049;
 Sat, 12 Sep 2020 04:46:07 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 820024203F;
 Sat, 12 Sep 2020 04:46:04 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sat, 12 Sep 2020 04:46:04 +0000 (GMT)
Date: Sat, 12 Sep 2020 10:16:03 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 05/10] powerpc/smp: Dont assume l2-cache to be
 superset of sibling
Message-ID: <20200912044603.GA11808@linux.vnet.ibm.com>
References: <20200810071834.92514-1-srikar@linux.vnet.ibm.com>
 <20200810071834.92514-6-srikar@linux.vnet.ibm.com>
 <87y2lgr0ic.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87y2lgr0ic.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-12_01:2020-09-10,
 2020-09-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009120039
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michael Ellerman <mpe@ellerman.id.au> [2020-09-11 21:55:23]:

> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> > Current code assumes that cpumask of cpus sharing a l2-cache mask will
> > always be a superset of cpu_sibling_mask.
> >
> > Lets stop that assumption. cpu_l2_cache_mask is a superset of
> > cpu_sibling_mask if and only if shared_caches is set.
> 
> I'm seeing oopses with this:
> 
> [    0.117392][    T1] smp: Bringing up secondary CPUs ...
> [    0.156515][    T1] smp: Brought up 2 nodes, 2 CPUs
> [    0.158265][    T1] numa: Node 0 CPUs: 0
> [    0.158520][    T1] numa: Node 1 CPUs: 1
> [    0.167453][    T1] BUG: Unable to handle kernel data access on read at 0x8000000041228298
> [    0.167992][    T1] Faulting instruction address: 0xc00000000018c128
> [    0.168817][    T1] Oops: Kernel access of bad area, sig: 11 [#1]
> [    0.168964][    T1] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> [    0.169417][    T1] Modules linked in:
> [    0.170047][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc2-00095-g7430ad5aa700 #209
> [    0.170305][    T1] NIP:  c00000000018c128 LR: c00000000018c0cc CTR: c00000000004dce0
> [    0.170498][    T1] REGS: c00000007e343880 TRAP: 0380   Not tainted  (5.9.0-rc2-00095-g7430ad5aa700)
> [    0.170602][    T1] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 44002222  XER: 00000000
> [    0.170985][    T1] CFAR: c00000000018c288 IRQMASK: 0
> [    0.170985][    T1] GPR00: 0000000000000000 c00000007e343b10 c00000000173e400 0000000000004000
> [    0.170985][    T1] GPR04: 0000000000000000 0000000000000800 0000000000000800 0000000000000000
> [    0.170985][    T1] GPR08: 0000000000000000 c00000000122c298 c00000003fffc000 c00000007fd05ce8
> [    0.170985][    T1] GPR12: c00000007e0119f8 c000000001930000 00000000ffff8ade 0000000000000000
> [    0.170985][    T1] GPR16: c00000007e3c0640 0000000000000917 c00000007e3c0658 0000000000000008
> [    0.170985][    T1] GPR20: c0000000015d0bb8 00000000ffff8ade c000000000f57400 c000000001817c28
> [    0.170985][    T1] GPR24: c00000000176dc80 c00000007e3c0890 c00000007e3cfe00 0000000000000000
> [    0.170985][    T1] GPR28: c000000001772310 c00000007e011900 c00000007e3c0800 0000000000000001
> [    0.172750][    T1] NIP [c00000000018c128] build_sched_domains+0x808/0x14b0
> [    0.172900][    T1] LR [c00000000018c0cc] build_sched_domains+0x7ac/0x14b0
> [    0.173186][    T1] Call Trace:
> [    0.173484][    T1] [c00000007e343b10] [c00000000018bfe8] build_sched_domains+0x6c8/0x14b0 (unreliable)
> [    0.173821][    T1] [c00000007e343c50] [c00000000018dcdc] sched_init_domains+0xec/0x130
> [    0.174037][    T1] [c00000007e343ca0] [c0000000010d59d8] sched_init_smp+0x50/0xc4
> [    0.174207][    T1] [c00000007e343cd0] [c0000000010b45c4] kernel_init_freeable+0x1b4/0x378
> [    0.174378][    T1] [c00000007e343db0] [c0000000000129fc] kernel_init+0x24/0x158
> [    0.174740][    T1] [c00000007e343e20] [c00000000000d9d0] ret_from_kernel_thread+0x5c/0x6c
> [    0.175050][    T1] Instruction dump:
> [    0.175626][    T1] 554905ee 71480040 7d2907b4 4182016c 2c290000 3920006e 913e002c 41820034
> [    0.175841][    T1] 7c6307b4 e9300020 78631f24 7d58182a <7d2a482a> f93e0080 7d404828 314a0001
> [    0.178340][    T1] ---[ end trace 6876b88dd1d4b3bb ]---
> [    0.178512][    T1]
> [    1.180458][    T1] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> 
> That's qemu:
> 
> qemu-system-ppc64 -nographic -vga none -M pseries -cpu POWER8 \
>   -kernel build~/vmlinux \
>   -m 2G,slots=2,maxmem=4G \
>   -object memory-backend-ram,size=1G,id=m0 \
>   -object memory-backend-ram,size=1G,id=m1 \
>   -numa node,nodeid=0,memdev=m0 \
>   -numa node,nodeid=1,memdev=m1 \
>   -smp 2,sockets=2,maxcpus=2  \
> 

Thanks Michael for the report and also for identifying the patch and also
giving an easy reproducer. That made my task easy. (My only problem was all
my PowerKVM hosts had a old compiler that refuse to compile never kernels.)

So in this setup, CPU doesn't have a l2-cache. And in that scenario, we
miss updating the l2-cache domain. Actually the initial patch had this
exact code. However it was my mistake. I should have reassessed it before
making changes suggested by Gautham.

Patch below. Do let me know if you want me to send the patch separately.

> 
> On mambo I get:
> 
> [    0.005069][    T1] smp: Bringing up secondary CPUs ...
> [    0.011656][    T1] smp: Brought up 2 nodes, 8 CPUs
> [    0.011682][    T1] numa: Node 0 CPUs: 0-3
> [    0.011709][    T1] numa: Node 1 CPUs: 4-7
> [    0.012015][    T1] BUG: arch topology borken
> [    0.012040][    T1]      the SMT domain not a subset of the CACHE domain
> [    0.012107][    T1] BUG: Unable to handle kernel data access on read at 0x80000001012e7398
> [    0.012142][    T1] Faulting instruction address: 0xc0000000001aa4f0
> [    0.012174][    T1] Oops: Kernel access of bad area, sig: 11 [#1]
> [    0.012206][    T1] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
> [    0.012236][    T1] Modules linked in:
> [    0.012264][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.9.0-rc2-00095-g7430ad5aa700 #1
> [    0.012304][    T1] NIP:  c0000000001aa4f0 LR: c0000000001aa498 CTR: 0000000000000000
> [    0.012341][    T1] REGS: c0000000ef583880 TRAP: 0380   Not tainted  (5.9.0-rc2-00095-g7430ad5aa700)
> [    0.012379][    T1] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 44002222  XER: 00040000
> [    0.012439][    T1] CFAR: c0000000000101b0 IRQMASK: 0
> [    0.012439][    T1] GPR00: 0000000000000000 c0000000ef583b10 c0000000017fd000 0000000000004000
> [    0.012439][    T1] GPR04: 0000000000000000 0000000000000800 0000000000000000 0000000000000000
> [    0.012439][    T1] GPR08: 0000000000000000 c0000000012eb398 c0000000ffffc000 0000000000000000
> [    0.012439][    T1] GPR12: 0000000000000020 c0000000019f0000 00000000ffff8ad1 0000000000000000
> [    0.012439][    T1] GPR16: c0000000ef068658 c0000000018d7ba8 0000000000000008 c000000001690bb8
> [    0.012439][    T1] GPR20: c00000000182dc80 c0000000ef06be90 00000000ffff8ad1 c000000001014aa8
> [    0.012439][    T1] GPR24: 0000000000000917 c0000000ef068e00 0000000000000000 c0000000ef06be00
> [    0.012439][    T1] GPR28: 0000000000000001 c0000000ef068640 c0000000ef4a1800 c000000001832310
> [    0.012774][    T1] NIP [c0000000001aa4f0] build_sched_domains+0x5c0/0x14f0
> [    0.012812][    T1] LR [c0000000001aa498] build_sched_domains+0x568/0x14f0
> [    0.012842][    T1] Call Trace:
> [    0.012872][    T1] [c0000000ef583b10] [c0000000001aa3b4] build_sched_domains+0x484/0x14f0 (unreliable)
> [    0.012922][    T1] [c0000000ef583c50] [c0000000001ac3d8] sched_init_domains+0xd8/0x120
> [    0.012966][    T1] [c0000000ef583ca0] [c0000000011962d0] sched_init_smp+0x50/0xc4
> [    0.013008][    T1] [c0000000ef583cd0] [c00000000117451c] kernel_init_freeable+0x1b4/0x378
> [    0.013051][    T1] [c0000000ef583db0] [c000000000012994] kernel_init+0x2c/0x158
> [    0.013092][    T1] [c0000000ef583e20] [c00000000000d9d0] ret_from_kernel_thread+0x5c/0x6c
> [    0.013128][    T1] Instruction dump:
> [    0.013151][    T1] e93b003a 712a0040 552a05ee 418203c4 2c2a0000 3920006e 913b002c 41820034
> [    0.013206][    T1] 7c6307b4 e93d0020 78631f24 7d54182a <7d2a482a> f93b0080 7d404828 314a0001
> [    0.013267][    T1] ---[ end trace 1bf5f6f38a9fd096 ]---
> 

I haven't tried Mambo. But the problem report looks similar.

> 
> Did I miss a lead-up patch?
> 

No

-- 
Thanks and Regards
Srikar Dronamraju

------------------------->8--------------------------------------------8<------------

From b25d47b01b7195b1df19083a4043fa6a87a901a3 Mon Sep 17 00:00:00 2001
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Date: Thu, 9 Jul 2020 13:33:38 +0530
Subject: [PATCH v5.1 05/10] powerpc/smp: Dont assume l2-cache to be superset of
 sibling

Current code assumes that cpumask of cpus sharing a l2-cache mask will
always be a superset of cpu_sibling_mask.

Lets stop that assumption. cpu_l2_cache_mask is a superset of
cpu_sibling_mask if and only if shared_caches is set.

Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Anton Blanchard <anton@ozlabs.org>
Cc: Oliver O'Halloran <oohall@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Neuling <mikey@neuling.org>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Jordan Niethe <jniethe5@gmail.com>
Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog v1 -> v2:
	Set cpumask after verifying l2-cache. (Gautham)

Changelog v5 -> v5.1:
	Set cpumask before verifying l2-cache. (Michael Ellerman)

 arch/powerpc/kernel/smp.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 9f4333d..a87afdf 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1185,6 +1185,7 @@ static bool update_mask_by_l2(int cpu, struct cpumask *(*mask_fn)(int))
 	struct device_node *l2_cache, *np;
 	int i;
 
+	cpumask_set_cpu(cpu, mask_fn(cpu));
 	l2_cache = cpu_to_l2cache(cpu);
 	if (!l2_cache)
 		return false;
@@ -1271,29 +1272,30 @@ static void add_cpu_to_masks(int cpu)
 	 * add it to it's own thread sibling mask.
 	 */
 	cpumask_set_cpu(cpu, cpu_sibling_mask(cpu));
+	cpumask_set_cpu(cpu, cpu_core_mask(cpu));
 
 	for (i = first_thread; i < first_thread + threads_per_core; i++)
 		if (cpu_online(i))
 			set_cpus_related(i, cpu, cpu_sibling_mask);
 
 	add_cpu_to_smallcore_masks(cpu);
-	/*
-	 * Copy the thread sibling mask into the cache sibling mask
-	 * and mark any CPUs that share an L2 with this CPU.
-	 */
-	for_each_cpu(i, cpu_sibling_mask(cpu))
-		set_cpus_related(cpu, i, cpu_l2_cache_mask);
 	update_mask_by_l2(cpu, cpu_l2_cache_mask);
 
-	/*
-	 * Copy the cache sibling mask into core sibling mask and mark
-	 * any CPUs on the same chip as this CPU.
-	 */
-	for_each_cpu(i, cpu_l2_cache_mask(cpu))
-		set_cpus_related(cpu, i, cpu_core_mask);
+	if (pkg_id == -1) {
+		struct cpumask *(*mask)(int) = cpu_sibling_mask;
+
+		/*
+		 * Copy the sibling mask into core sibling mask and
+		 * mark any CPUs on the same chip as this CPU.
+		 */
+		if (shared_caches)
+			mask = cpu_l2_cache_mask;
+
+		for_each_cpu(i, mask(cpu))
+			set_cpus_related(cpu, i, cpu_core_mask);
 
-	if (pkg_id == -1)
 		return;
+	}
 
 	for_each_cpu(i, cpu_online_mask)
 		if (get_physical_package_id(i) == pkg_id)
-- 
2.17.1

