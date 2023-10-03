Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD5B7B708A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 20:07:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J/SKV7Bx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0Qll2rtzz3cJW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 05:07:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J/SKV7Bx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0Qkq5q7dz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 05:06:59 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 393Hre1g007670;
	Tue, 3 Oct 2023 18:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=1Chg+dAO7ZyaoaMon6oDQvJoPb9jB8R1ynJEe3hSZ3M=;
 b=J/SKV7BxpmPUMeYnlw58TBTxi5AYITUFCX5vAlkCMTrSF50fL6stk0lb5O6GTKIgJDua
 uKCd62NnHqL1J9111aYvsGkb5lxzF6bjnMOLMn6JVK2umLt04vmOc+th4Z75WAs8Qtlz
 wytwaX/cN1qMK2Tgo0qV7GbCi7Ic4fW+XhjzWrw+RzStxKG57VD9cUjTEkXqgz7W1Md1
 mVW4jJc3LpYTCfqSLBKqzBKN3d4ZdjSZ36ZBpbXW5wPLTC4vdXlSDsuKKwaHVr5WEZ83
 0x3QV1Fkwl6RofkDCyiORWLO3HXyzZUBgqi6Tj5G3fdvPkW7bEmzhfh32uP+i4jOH/gD wA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tgqrr8fmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Oct 2023 18:06:32 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 393HsoxS009218;
	Tue, 3 Oct 2023 18:06:27 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tgqrr8f95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Oct 2023 18:06:26 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 393H0wKu005859;
	Tue, 3 Oct 2023 18:06:22 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tex0smr3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Oct 2023 18:06:22 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 393I6Kkx43188916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Oct 2023 18:06:20 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DA0C2004B;
	Tue,  3 Oct 2023 18:06:20 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8ED182004E;
	Tue,  3 Oct 2023 18:06:18 +0000 (GMT)
Received: from in.ibm.com (unknown [9.171.82.237])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  3 Oct 2023 18:06:18 +0000 (GMT)
Date: Tue, 3 Oct 2023 23:36:15 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Pingfan Liu <piliu@redhat.com>
Subject: Re: [PATCHv7 4/4] powerpc/setup: alloc extra paca_ptrs to hold
 boot_cpuid
Message-ID: <zuptut5gbcd3cyaphv5axgrqrful2knkzkmxxjslgtgb75n6yi@l5ndw6ajw6im>
References: <20230925075348.16654-1-piliu@redhat.com>
 <20230925075348.16654-5-piliu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925075348.16654-5-piliu@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dWk9GSvWMTp_rhi3bIImD5MQSIY2OGbv
X-Proofpoint-ORIG-GUID: DzN-R5mlOZ3CRgqTWAqCQf8JzoyPJCVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-03_15,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310030136
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
Reply-To: mahesh@linux.ibm.com
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-09-25 15:53:48 Mon, Pingfan Liu wrote:
> paca_ptrs should be large enough to hold the boot_cpuid, hence, its
> lower boundary is set to the bigger one between boot_cpuid+1 and
> nr_cpus.
> 
> On the other hand, some kernel component: -1. the timer assumes cpu0
> online since the timer_list->flags subfield 'TIMER_CPUMASK' is zero if
> not initialized to a proper present cpu.  -2. power9_idle_stop() assumes
> the primary thread's paca is allocated.
> 
> Hence lift nr_cpu_ids from one to two to ensure cpu0 is onlined, if the
> boot cpu is not cpu0.
> 
> Result:
> When nr_cpus=1, taskset -c 14 bash -c 'echo c > /proc/sysrq-trigger'
> the kdump kernel brings up two cpus.
> While when taskset -c 4 bash -c 'echo c > /proc/sysrq-trigger',
> the kdump kernel brings up one cpu.

I tried your changes on power9 and power10 systems. However, on power10 lpar I
see bellow backtrace in kdump kernel bootup with nr_cpus=1.

$ taskset -c 4 bash -c 'echo c > /proc/sysrq-trigger'
[...]
[    0.000000] Hardware name: IBM,9105-22A POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1040.00 (NL1040_005) hv:phyp pSeries
[    0.000000] printk: bootconsole [udbg0] enabled
[    0.000000] the round shift between dt seq and the cpu logic number: 8
[    0.000000] Partition configured for 16 cpus, operating system maximum is 2.
[    0.000000] CPU maps initialized for 8 threads per core
[...]
[    0.002249] BUG: Unable to handle kernel data access at 0x88888888888888c0
[    0.002260] Faulting instruction address: 0xc00000001201226c
[    0.002268] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.002274] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
[    0.002282] Modules linked in:
[    0.002288] CPU: 4 PID: 1 Comm: swapper/4 Not tainted 6.6.0-rc4 #1
[    0.002296] Hardware name: IBM,9105-22A POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1040.00 (NL1040_005) hv:phyp pSeries
[    0.002305] NIP:  c00000001201226c LR: c000000012012234 CTR: 0000000000000004
[    0.002312] REGS: c0000000167ff8f0 TRAP: 0380   Not tainted  (6.6.0-rc4)
[    0.002321] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 24000844  XER: 0000000a
[    0.002346] CFAR: c00000001201231c IRQMASK: 0
[    0.002346] GPR00: c000000012012234 c0000000167ffb90 c000000011b61900 0000000000000002
[    0.002346] GPR04: 0000000000000000 0000000000000001 0000000000000001 c00000004ffeff80
[    0.002346] GPR08: 0000000000000000 8888888888888888 0000000000000002 0000000000000000
[    0.002346] GPR12: 0000000000000000 c000000013141000 c000000010011058 0000000000000000
[    0.002346] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.002346] GPR20: 0000000000000028 c000000012170968 c0000000120a3e80 0000000000000016
[    0.002346] GPR24: c00000004ffdcfd0 0000000000000000 c000000012b82058 0000000000000000
[    0.002346] GPR28: c00000004fc80a68 c000000012bf0350 c0000000120a3e2c 0000000000000000
[    0.002426] NIP [c00000001201226c] update_mask_from_threadgroup+0x98/0x174
[    0.002437] LR [c000000012012234] update_mask_from_threadgroup+0x60/0x174
[    0.002444] Call Trace:
[    0.002451] [c0000000167ffb90] [c000000012012234] update_mask_from_threadgroup+0x60/0x174 (unreliable)
[    0.002464] [c0000000167ffbe0] [c0000000120125f8] init_thread_group_cache_map+0x2b0/0x328
[    0.002477] [c0000000167ffc50] [c00000001201296c] smp_prepare_cpus+0x2fc/0x4f0
[    0.002497] [c0000000167ffd10] [c000000012004e40] kernel_init_freeable+0x198/0x3cc
[    0.002509] [c0000000167ffde0] [c000000010011084] kernel_init+0x34/0x1b0
[    0.002531] [c0000000167ffe50] [c00000001000dd3c] ret_from_kernel_user_thread+0x14/0x1c
[    0.002547] --- interrupt: 0 at 0x0
[    0.002553] NIP:  0000000000000000 LR: 0000000000000000 CTR: 0000000000000000
[    0.002563] REGS: c0000000167ffe80 TRAP: 0000   Not tainted  (6.6.0-rc4)
[    0.002569] MSR:  0000000000000000 <>  CR: 00000000  XER: 00000000
[    0.002576] CFAR: 0000000000000000 IRQMASK: 0
[    0.002576] GPR00: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.002576] GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.002576] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.002576] GPR12: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.002576] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.002576] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.002576] GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.002576] GPR28: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.002671] NIP [0000000000000000] 0x0
[    0.002680] LR [0000000000000000] 0x0
[    0.002689] --- interrupt: 0
[    0.002697] Code: 7feafb78 813d0000 7d29fa14 7f895000 409d00d4 3ce20102 38e74758 79491f24 e87e0006 39000000 e8e70000 7d27482a <a8890038> 7f834000 79090020 419e005c
[    0.002727] ---[ end trace 0000000000000000 ]---
[    0.002739]
[    1.002749] Kernel panic - not syncing: Fatal exception
[    1.002795] Rebooting in 10 seconds..

Thanks,
-Mahesh.

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
>  arch/powerpc/kernel/paca.c | 10 ++++++----
>  arch/powerpc/kernel/prom.c |  9 ++++++---
>  2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
> index cda4e00b67c1..91e2401de1bd 100644
> --- a/arch/powerpc/kernel/paca.c
> +++ b/arch/powerpc/kernel/paca.c
> @@ -242,9 +242,10 @@ static int __initdata paca_struct_size;
>  
>  void __init allocate_paca_ptrs(void)
>  {
> -	paca_nr_cpu_ids = nr_cpu_ids;
> +	int n = (boot_cpuid + 1) > nr_cpu_ids ? (boot_cpuid + 1) : nr_cpu_ids;
>  
> -	paca_ptrs_size = sizeof(struct paca_struct *) * nr_cpu_ids;
> +	paca_nr_cpu_ids = n;
> +	paca_ptrs_size = sizeof(struct paca_struct *) * n;
>  	paca_ptrs = memblock_alloc_raw(paca_ptrs_size, SMP_CACHE_BYTES);
>  	if (!paca_ptrs)
>  		panic("Failed to allocate %d bytes for paca pointers\n",
> @@ -287,13 +288,14 @@ void __init allocate_paca(int cpu)
>  void __init free_unused_pacas(void)
>  {
>  	int new_ptrs_size;
> +	int n = (boot_cpuid + 1) > nr_cpu_ids ? (boot_cpuid + 1) : nr_cpu_ids;
>  
> -	new_ptrs_size = sizeof(struct paca_struct *) * nr_cpu_ids;
> +	new_ptrs_size = sizeof(struct paca_struct *) * n;
>  	if (new_ptrs_size < paca_ptrs_size)
>  		memblock_phys_free(__pa(paca_ptrs) + new_ptrs_size,
>  				   paca_ptrs_size - new_ptrs_size);
>  
> -	paca_nr_cpu_ids = nr_cpu_ids;
> +	paca_nr_cpu_ids = n;
>  	paca_ptrs_size = new_ptrs_size;
>  
>  #ifdef CONFIG_PPC_64S_HASH_MMU
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 87272a2d8c10..15c994f54bf9 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -362,9 +362,12 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
>  			 */
>  			boot_cpuid = i;
>  			found = true;
> -			/* This works around the hole in paca_ptrs[]. */
> -			if (nr_cpu_ids < nthreads)
> -				set_nr_cpu_ids(nthreads);
> +			/*
> +			 * Ideally, nr_cpus=1 can be achieved if each kernel
> +			 * component does not assume cpu0 is onlined.
> +			 */
> +			if (boot_cpuid != 0 && nr_cpu_ids < 2)
> +				set_nr_cpu_ids(2);
>  		}
>  #ifdef CONFIG_SMP
>  		/* logical cpu id is always 0 on UP kernels */
> -- 
> 2.31.1
> 

-- 
Mahesh J Salgaonkar
