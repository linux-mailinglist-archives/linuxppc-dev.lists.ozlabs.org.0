Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 901D47BF216
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 07:09:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=apL95odL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4P823fx7z3cby
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 16:09:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=apL95odL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4P785sncz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 16:08:20 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39A4lQiw028572;
	Tue, 10 Oct 2023 05:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=J0CAfjeJKUb2GYAgk66N6s5rpslE6Zwyp0s9znuTxCo=;
 b=apL95odLHGyfoQWrMBDhrFmHfaD1bI/Rm0uIHF+y1NIg/wl95i0oSXfVDSDeSUKKDbs+
 4yBTssW2oIjJo9PnnRisrOqxmfjS1Reo0MV8s8or+4EIpNU90Fsc+l3+RVnixn/fYvEh
 onjZcU6am45Aisy3DELasgXq2eBQGR53YEaWM1wwWfenntOwvMceEPf+10YX/xH8vltK
 SEF+y7Bzn/L37NXrdVtMB5shJVVTYMpu/j6qPloJaV9KagB+AXMTtZhoRpc4WblznmPF
 tgRkIK0pnBIM+vwuKLfd4a1Tk/r2jjIOik9cNhVf71yHObpblsQMvh8pWgdYV/Slr8jo gA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmyw1rgrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 05:08:04 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39A4lqwx030016;
	Tue, 10 Oct 2023 05:08:03 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmyw1rgms-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 05:08:03 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39A41LuM024452;
	Tue, 10 Oct 2023 04:44:06 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkhnse868-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 04:44:06 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39A4i5B215139478
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Oct 2023 04:44:05 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB58D20043;
	Tue, 10 Oct 2023 04:44:04 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 074BF2004B;
	Tue, 10 Oct 2023 04:44:03 +0000 (GMT)
Received: from [9.43.8.81] (unknown [9.43.8.81])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Oct 2023 04:44:02 +0000 (GMT)
Message-ID: <36b2aa11-dfd9-529d-0386-aa181caeb93f@linux.ibm.com>
Date: Tue, 10 Oct 2023 10:14:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCHv8 1/5] powerpc/setup : Enable boot_cpu_hwid for PPC32
Content-Language: en-US
To: Pingfan Liu <piliu@redhat.com>, linuxppc-dev@lists.ozlabs.org
References: <20231009113036.45988-1-piliu@redhat.com>
 <20231009113036.45988-2-piliu@redhat.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20231009113036.45988-2-piliu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JZpe2JNdYkZF2ezyaklCDr554ccBgyQU
X-Proofpoint-ORIG-GUID: x99qO0W2zTOWgzZ6HQd77qCXr6tkHrQN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_03,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 mlxscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310100037
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
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Ming Lei <ming.lei@redhat.com>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Pingfan,

With this patch series applied, the kdump kernel fails to boot on 
powerpc with nr_cpus=1.

Console logs:
-------------------
[root]# echo c > /proc/sysrq-trigger
[   74.783235] sysrq: Trigger a crash
[   74.783244] Kernel panic - not syncing: sysrq triggered crash
[   74.783252] CPU: 58 PID: 3838 Comm: bash Kdump: loaded Not tainted 
6.6.0-rc5pf-nr-cpus+ #3
[   74.783259] Hardware name: POWER10 (raw) phyp pSeries
[   74.783275] Call Trace:
[   74.783280] [c00000020f4ebac0] [c000000000ed9f38] 
dump_stack_lvl+0x6c/0x9c (unreliable)
[   74.783291] [c00000020f4ebaf0] [c000000000150300] panic+0x178/0x438
[   74.783298] [c00000020f4ebb90] [c000000000936d48] 
sysrq_handle_crash+0x28/0x30
[   74.783304] [c00000020f4ebbf0] [c00000000093773c] 
__handle_sysrq+0x10c/0x250
[   74.783309] [c00000020f4ebc90] [c000000000937fa8] 
write_sysrq_trigger+0xc8/0x168
[   74.783314] [c00000020f4ebcd0] [c000000000665d8c] 
proc_reg_write+0x10c/0x1b0
[   74.783321] [c00000020f4ebd00] [c00000000058da54] vfs_write+0x104/0x4b0
[   74.783326] [c00000020f4ebdc0] [c00000000058dfdc] ksys_write+0x7c/0x140
[   74.783331] [c00000020f4ebe10] [c000000000033a64] 
system_call_exception+0x144/0x3a0
[   74.783337] [c00000020f4ebe50] [c00000000000c554] 
system_call_common+0xf4/0x258
[   74.783343] --- interrupt: c00 at 0x7fffa0721594
[   74.783352] NIP:  00007fffa0721594 LR: 00007fffa0697bf4 CTR: 
0000000000000000
[   74.783364] REGS: c00000020f4ebe80 TRAP: 0c00   Not tainted 
(6.6.0-rc5pf-nr-cpus+)
[   74.783376] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28222202  XER: 00000000
[   74.783394] IRQMASK: 0
[   74.783394] GPR00: 0000000000000004 00007ffffc4b6800 00007fffa0807300 
0000000000000001
[   74.783394] GPR04: 000000013549ea60 0000000000000002 0000000000000010 
0000000000000000
[   74.783394] GPR08: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[   74.783394] GPR12: 0000000000000000 00007fffa0abaf70 0000000040000000 
000000011a0f9798
[   74.783394] GPR16: 000000011a0f9724 000000011a097688 000000011a02ff70 
000000011a0fd568
[   74.783394] GPR20: 0000000135554bf0 0000000000000001 000000011a0aa478 
00007ffffc4b6a24
[   74.783394] GPR24: 00007ffffc4b6a20 000000011a0faf94 0000000000000002 
000000013549ea60
[   74.783394] GPR28: 0000000000000002 00007fffa08017a0 000000013549ea60 
0000000000000002
[   74.783440] NIP [00007fffa0721594] 0x7fffa0721594
[   74.783443] LR [00007fffa0697bf4] 0x7fffa0697bf4
[   74.783447] --- interrupt: c00
I'm in purgatory
[    0.000000] radix-mmu: Page sizes from device-tree:
[    0.000000] radix-mmu: Page size shift = 12 AP=0x0
[    0.000000] radix-mmu: Page size shift = 16 AP=0x5
[    0.000000] radix-mmu: Page size shift = 21 AP=0x1
[    0.000000] radix-mmu: Page size shift = 30 AP=0x2
[    0.000000] Activating Kernel Userspace Access Prevention
[    0.000000] Activating Kernel Userspace Execution Prevention
[    0.000000] radix-mmu: Mapped 0x0000000000000000-0x0000000000010000 
with 64.0 KiB pages (exec)
[    0.000000] radix-mmu: Mapped 0x0000000000010000-0x0000000000200000 
with 64.0 KiB pages
[    0.000000] radix-mmu: Mapped 0x0000000000200000-0x0000000020000000 
with 2.00 MiB pages
[    0.000000] radix-mmu: Mapped 0x0000000020000000-0x0000000022600000 
with 2.00 MiB pages (exec)
[    0.000000] radix-mmu: Mapped 0x0000000022600000-0x0000000040000000 
with 2.00 MiB pages
[    0.000000] radix-mmu: Mapped 0x0000000040000000-0x0000000180000000 
with 1.00 GiB pages
[    0.000000] radix-mmu: Mapped 0x0000000180000000-0x00000001a0000000 
with 2.00 MiB pages
[    0.000000] lpar: Using radix MMU under hypervisor
[    0.000000] Linux version 6.6.0-rc5pf-nr-cpus+ 
(root@ltcever7x0-lp1.aus.stglabs.ibm.com) (gcc (GCC) 8.5.0 20210514 (Red 
Hat 8.5.0-20), GNU ld version 2.30-123.el8) #3 SMP Mon Oct  9 11:07:
41 CDT 2023
[    0.000000] Found initrd at 0xc000000022e60000:0xc0000000248f08d8
[    0.000000] Hardware name: IBM,9043-MRX POWER10 (raw) 0x800200 
0xf000006 of:IBM,FW1060.00 (NM1060_016) hv:phyp pSeries
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] the round shift between dt seq and the cpu logic number: 56
[    0.000000] BUG: Unable to handle kernel data access on write at 
0xc0000001a0000000
[    0.000000] Faulting instruction address: 0xc000000022009c64
[    0.000000] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.000000] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
[    0.000000] Modules linked in:
[    0.000000] CPU: 2 PID: 0 Comm: swapper Not tainted 
6.6.0-rc5pf-nr-cpus+ #3
[    0.000000] Hardware name:  POWER10 (raw)  hv:phyp pSeries
[    0.000000] NIP:  c000000022009c64 LR: c000000022009c54 CTR: 
c0000000201ff348
[    0.000000] REGS: c000000022aebb00 TRAP: 0300   Not tainted 
(6.6.0-rc5pf-nr-cpus+)
[    0.000000] MSR:  8000000000001033 <SF,ME,IR,DR,RI,LE> CR: 28222824  
XER: 00000001
[    0.000000] CFAR: c000000020031574 DAR: c0000001a0000000 DSISR: 
42000000 IRQMASK: 1
[    0.000000] GPR00: c000000022009ba0 c000000022aebda0 c0000000213d1300 
0000000000000004
[    0.000000] GPR04: 0000000000000001 c000000022aebbc0 c000000022aebbb8 
0000000000000000
[    0.000000] GPR08: 0000000000000001 c00000019ffffff8 000000000000003a 
c0000000229c8a78
[    0.000000] GPR12: 0000000000002000 c000000022e4a800 c0000000211d34b8 
c0000000211d3aa8
[    0.000000] GPR16: c0000000211d75a0 c0000000211d75b0 c0000000225f3b98 
0000000000000000
[    0.000000] GPR20: 0000000000000001 0000000000000001 0000000000000001 
0000000000000001
[    0.000000] GPR24: 0000000000000008 0000000000000000 0000000000000001 
c00000019ffffdc0
[    0.000000] GPR28: 0000000000000002 c000000022b368e0 c000000022aebe08 
0000000000000008
[    0.000000] NIP [c000000022009c64] smp_setup_cpu_maps+0x420/0x724
[    0.000000] LR [c000000022009c54] smp_setup_cpu_maps+0x410/0x724
[    0.000000] Call Trace:
[    0.000000] [c000000022aebda0] [c000000022009ba0] 
smp_setup_cpu_maps+0x35c/0x724 (unreliable)
[    0.000000] [c000000022aebeb0] [c00000002200a19c] setup_arch+0x1b8/0x54c
[    0.000000] [c000000022aebf30] [c000000022003f88] start_kernel+0xb0/0x768
[    0.000000] [c000000022aebfe0] [c00000002000d888] 
start_here_common+0x1c/0x20
[    0.000000] Code: 3929ffff 7f89e040 409c002c 7ec4b378 7f83e378 
4a027939 7f83e378 4a0278e5 e95b0018 3d22017d e929f028 7d4ac42c 
<7d49c12e> eb7b0000 7e99a378 4bffff3c
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000]
[    0.000000] Kernel panic - not syncing: Fatal exception
[    0.000000] Rebooting in 180 seconds..

However, the kdump kernel boots fine if the kernel crashes on CPU 0.

Thanks,
Sourabh Jain


On 09/10/23 17:00, Pingfan Liu wrote:
> In order to identify the boot cpu, its intserv[] should be recorded and
> checked in smp_setup_cpu_maps().
>
> smp_setup_cpu_maps() is shared between PPC64 and PPC32. Since PPC64 has
> already used boot_cpu_hwid to carry that information, enabling this
> variable on PPC32 so later it can also be used to carry that information
> for PPC32 in the coming patch.
>
> Signed-off-by: Pingfan Liu <piliu@redhat.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Wen Xiong <wenxiong@us.ibm.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Ming Lei <ming.lei@redhat.com>
> Cc: kexec@lists.infradead.org
> To: linuxppc-dev@lists.ozlabs.org
> ---
>   arch/powerpc/include/asm/smp.h     | 2 +-
>   arch/powerpc/kernel/prom.c         | 3 +--
>   arch/powerpc/kernel/setup-common.c | 2 --
>   3 files changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
> index aaaa576d0e15..5db9178cc800 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -26,7 +26,7 @@
>   #include <asm/percpu.h>
>   
>   extern int boot_cpuid;
> -extern int boot_cpu_hwid; /* PPC64 only */
> +extern int boot_cpu_hwid;
>   extern int spinning_secondaries;
>   extern u32 *cpu_to_phys_id;
>   extern bool coregroup_enabled;
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 0b5878c3125b..ec82f5bda908 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -372,8 +372,7 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
>   	    be32_to_cpu(intserv[found_thread]));
>   	boot_cpuid = found;
>   
> -	if (IS_ENABLED(CONFIG_PPC64))
> -		boot_cpu_hwid = be32_to_cpu(intserv[found_thread]);
> +	boot_cpu_hwid = be32_to_cpu(intserv[found_thread]);
>   
>   	/*
>   	 * PAPR defines "logical" PVR values for cpus that
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index d2a446216444..1b19a9815672 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -87,9 +87,7 @@ EXPORT_SYMBOL(machine_id);
>   int boot_cpuid = -1;
>   EXPORT_SYMBOL_GPL(boot_cpuid);
>   
> -#ifdef CONFIG_PPC64
>   int boot_cpu_hwid = -1;
> -#endif
>   
>   /*
>    * These are used in binfmt_elf.c to put aux entries on the stack

