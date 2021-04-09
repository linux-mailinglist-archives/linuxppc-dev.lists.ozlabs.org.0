Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACA0359B91
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 12:15:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGvBq2QK1z3bsb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 20:14:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a537wZT3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=a537wZT3; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGvBN0BbBz30Kb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 20:14:35 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 139A4HrG122510; Fri, 9 Apr 2021 06:14:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=FveSHCPb6h3AgwzCWc3M+7W3thxq1+F9/4rz4Tg68hc=;
 b=a537wZT35GBkO23ukKfIK2sxfrKIvB7HiVA4vOldek/AKjyBLy3MpTJPIwjpUaFAL3AO
 IUjwmPbDclu5hVihZAmc6A0fRuytmR25ftcT9U8WFsgxrVwWviEz6DO4iLsX8AUbx04G
 t+a1w4Es86CkrihACRm9z09F9dTBseqOmN8d5QjktxFz8Mx5HQk29KvGp5LvvO6ioEvU
 xRUxnzK+KfRVfQbaxd/yJGOixUS3l94lmOr0MDBbWp+3MrBQ0cQ/SPJEuW4ZSBrLLBZ1
 RHHT4t/cMkGNGmNoK4XrxUvaNiczDOHkeiqeQlGLW++eZAwkhzTRSl9Z1rCJ6qAFMX28 mw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37t8fmm130-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 06:14:16 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 139ADapJ031793;
 Fri, 9 Apr 2021 10:14:14 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 37rvbuabv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Apr 2021 10:14:14 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 139ADoUt27328912
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Apr 2021 10:13:50 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC7EEA405C;
 Fri,  9 Apr 2021 10:14:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E71E4A405B;
 Fri,  9 Apr 2021 10:14:09 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  9 Apr 2021 10:14:09 +0000 (GMT)
Date: Fri, 9 Apr 2021 15:44:09 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/smp: Set numa node before updating mask
Message-ID: <20210409101409.GA2633526@linux.vnet.ibm.com>
References: <20210401154200.150077-1-srikar@linux.vnet.ibm.com>
 <87czvdbova.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87czvdbova.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pvCLLugckR2Re8qurimXumM2XZ0keu8w
X-Proofpoint-ORIG-GUID: pvCLLugckR2Re8qurimXumM2XZ0keu8w
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-09_05:2021-04-09,
 2021-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090072
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hey Nathan,

>
> Regardless of your change: at boot time, this set of calls to
> set_numa_node() and set_numa_mem() is redundant, right? Because
> smp_prepare_cpus() has:
>
> 	for_each_possible_cpu(cpu) {
> 		...
> 		if (cpu_present(cpu)) {
> 			set_cpu_numa_node(cpu, numa_cpu_lookup_table[cpu]);
> 			set_cpu_numa_mem(cpu,
> 				local_memory_node(numa_cpu_lookup_table[cpu]));
> 		}
>
> I would rather that, when onlining a CPU that happens to have been
> dynamically added after boot, we enter start_secondary() with conditions
> equivalent to those at boot time. Or as close to that as is practical.
>
> So I'd suggest that pseries_add_processor() be made to update
> these things when the CPUs are marked present, before onlining them.

I did try updating at pseries_add_processor when things were being marked as
present. But looks like the zonelists may not be updated at that time.
I saw couple of crashes in local_memory_node() when dplar adding CPUs.
(Appending the patch that causes these crash to this mail for your reference)

[  293.669901] Kernel attempted to read user page (1508) - exploit attempt? (uid: 0)                                                                                                                     [1309/17174]
[  293.669925] BUG: Kernel NULL pointer dereference on read at 0x00001508
[  293.669935] Faulting instruction address: 0xc000000000484ae0
[  293.669947] Oops: Kernel access of bad area, sig: 11 [#1]
[  293.669956] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
[  293.669969] Modules linked in: nft_counter nft_compat rpadlpar_io rpaphp
mptcp_diag xsk_diag tcp_diag udp_diag raw_diag inet_diag unix_diag
af_packet_diag netlink_diag bonding tls nft_fib_inet nft_fib_ipv4 nft_ fib_ipv6
nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set
nf_tables nfnetlink dm_multipath pseries_rng xts vmx_c rypto uio_pdrv_genirq
uio binfmt_misc ip_tables xfs libcrc32c sd_mod t10_pi sg ibmvscsi ibmveth
scsi_transport_srp dm_mirror dm_region_hash dm_log dm_mod fuse
[  293.670101] CPU: 17 PID: 3183 Comm: drmgr Not tainted 5.12.0-rc5-master+ #2
[  293.670113] NIP:  c000000000484ae0 LR: c00000000010a548 CTR: 00000000006dd130
[  293.670121] REGS: c0000025a9997160 TRAP: 0300   Not tainted  (5.12.0-rc5-master+)
[  293.670131] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 48008422  XER: 00000008
[  293.670155] CFAR: c00000000010a544 DAR: 0000000000001508 DSISR: 40000000 IRQMASK: 0
[  293.670155] GPR00: c00000000010a548 c0000025a9997400 c000000001f55500 0000000000000000
[  293.670155] GPR04: c000000001a3c598 0000000000000006 0000000000000027 c0000035873b8018
[  293.670155] GPR08: 0000000000000023 c0000000020464f8 00000035894d0000 c000003584c8ffe8
[  293.670155] GPR12: 0000000028008424 c0000035bf22ce80 0000000000000000 0000000000000000
[  293.670155] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[  293.670155] GPR20: 0000000000000000 0000000000000000 0000000000000000 c000000001fbc160
[  293.670155] GPR24: 0000000000000002 0000000000000200 c000000001fc04c8 0000000000000001
[  293.670155] GPR28: c0000000010c6fc8 c000000001fc08a0 c000002f8fb99e60 0000000000000040
[  293.670263] NIP [c000000000484ae0] local_memory_node+0x20/0x80
[  293.670281] LR [c00000000010a548] pseries_add_processor+0x368/0x3b0
[  293.670292] Call Trace:
[  293.670297] [c0000025a9997400] [c00000000010a524] pseries_add_processor+0x344/0x3b0 (unreliable)
[  293.670311] [c0000025a99976c0] [c00000000010a790] pseries_smp_notifier+0x200/0x2a0
[  293.670322] [c0000025a9997780] [c000000000197288] blocking_notifier_call_chain+0xa8/0x110
[  293.670335] [c0000025a99977d0] [c000000000b27010] of_attach_node+0xc0/0x110
[  293.670347] [c0000025a9997830] [c0000000001032a0] dlpar_attach_node+0x30/0x70
[  293.670358] [c0000025a99978a0] [c000000000109ac0] dlpar_cpu_add+0x1d0/0x510
[  293.670368] [c0000025a9997980] [c00000000010a898] dlpar_cpu+0x68/0x6e0
[  293.670377] [c0000025a9997a80] [c0000000001036b8] handle_dlpar_errorlog+0xf8/0x190
[  293.670388] [c0000025a9997af0] [c000000000103928] dlpar_store+0x178/0x4a0
[  293.670396] [c0000025a9997bb0] [c0000000007df050] kobj_attr_store+0x30/0x50
[  293.670408] [c0000025a9997bd0] [c00000000062f0b0] sysfs_kf_write+0x70/0xb0
[  293.670421] [c0000025a9997c10] [c00000000062d4e0] kernfs_fop_write_iter+0x1d0/0x280
[  293.670432] [c0000025a9997c60] [c00000000051673c] new_sync_write+0x14c/0x1d0
[  293.670445] [c0000025a9997d00] [c000000000519df4] vfs_write+0x264/0x380
[  293.670455] [c0000025a9997d60] [c00000000051a0ec] ksys_write+0x7c/0x140
[  293.670464] [c0000025a9997db0] [c000000000032af0] system_call_exception+0x150/0x290
[  293.670475] [c0000025a9997e10] [c00000000000d45c] system_call_common+0xec/0x278
[  293.670486] --- interrupt: c00 at 0x20000025bd74

That leaves us with just 2 options for now.
1. Update numa_mem later and only update numa_node here.
- Over a longer period of time, this would be more confusing since we
may lose track of why we are splitting the set of numa_node and numa_mem.

or
2. Use my earlier patch.

My choice would be to go with my earlier patch.
Please do let me know your thoughts on the same.

-- 
Thanks and Regards
Srikar Dronamraju

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 3beeb030cd78..1cdd83703f93 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -44,6 +44,7 @@ extern void __init dump_numa_cpu_topology(void);
 
 extern int sysfs_add_device_to_node(struct device *dev, int nid);
 extern void sysfs_remove_device_from_node(struct device *dev, int nid);
+extern int numa_setup_cpu(unsigned long cpu);
 
 static inline void update_numa_cpu_lookup_table(unsigned int cpu, int node)
 {
@@ -81,6 +82,11 @@ static inline void sysfs_remove_device_from_node(struct device *dev,
 {
 }
 
+static int numa_setup_cpu(unsigned long cpu)
+{
+	return first_online_node;
+}
+
 static inline void update_numa_cpu_lookup_table(unsigned int cpu, int node) {}
 
 static inline int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5a4d59a1070d..0d0c71ba4672 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1539,9 +1539,6 @@ void start_secondary(void *unused)
 			shared_caches = true;
 	}
 
-	set_numa_node(numa_cpu_lookup_table[cpu]);
-	set_numa_mem(local_memory_node(numa_cpu_lookup_table[cpu]));
-
 	smp_wmb();
 	notify_cpu_starting(cpu);
 	set_cpu_online(cpu, true);
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index f2bf98bdcea2..11914a28db67 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -501,7 +501,7 @@ static int vphn_get_nid(long unused)
  * Figure out to which domain a cpu belongs and stick it there.
  * Return the id of the domain used.
  */
-static int numa_setup_cpu(unsigned long lcpu)
+int numa_setup_cpu(unsigned long lcpu)
 {
 	struct device_node *cpu;
 	int fcpu = cpu_first_thread_sibling(lcpu);
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 12cbffd3c2e3..311fbe916d5b 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -198,9 +198,14 @@ static int pseries_add_processor(struct device_node *np)
 	}
 
 	for_each_cpu(cpu, tmp) {
+		int nid;
+
 		BUG_ON(cpu_present(cpu));
 		set_cpu_present(cpu, true);
 		set_hard_smp_processor_id(cpu, be32_to_cpu(*intserv++));
+		nid = numa_setup_cpu(cpu);
+		set_cpu_numa_node(cpu, nid);
+		set_cpu_numa_mem(cpu, local_memory_node(nid));
 	}
 	err = 0;
 out_unlock:

