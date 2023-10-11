Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D41797C509B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 12:54:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R3N18PxZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S58m75Brjz3ckg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 21:54:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R3N18PxZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S58lB1lR0z3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 21:53:41 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BAmASn020989;
	Wed, 11 Oct 2023 10:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=x1nNkY/UKSukPvfs45clPyBrKkls/9lNiW+tpKC8mbo=;
 b=R3N18PxZUORnrcxT9epp7bOJ7kesPovBx9fBVR9oxPZwuRvLx3l7rmYLC97C1MJzTh8u
 QZcWwpUdvfzZGatqqxVycenBDM6k7DXo9IbJebnqiGQ5SA9Ob3Hr+R6GiIIJGuwDRg4m
 XKAE3HRBmVvH+mTEdspdgbEo7/oWkSSqbg1ATeTLR0dY0WR/IrRf5hWqlUG+aa2wGuMg
 88LEyMtq30uzccpUvK9xNj0jWoIN2H4wbpOpfhqE4z66UlwW3BGeSmgkJhjDBjxu0V5G
 0zUnKoKhnNtWSgJ6auVzG2HQz9iYipmElaAPdPfJtZVK1y17IwyQyCbAxSKbePm3ufQZ yA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnt9183wf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 10:53:32 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39BAoA94028539;
	Wed, 11 Oct 2023 10:53:31 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnt9183vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 10:53:31 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39BA3AM2023032;
	Wed, 11 Oct 2023 10:53:31 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkmc1pxsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 10:53:30 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39BArTfm24380094
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Oct 2023 10:53:29 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C5A32004B;
	Wed, 11 Oct 2023 10:53:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74E1C20043;
	Wed, 11 Oct 2023 10:53:26 +0000 (GMT)
Received: from [9.43.21.178] (unknown [9.43.21.178])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Oct 2023 10:53:26 +0000 (GMT)
Message-ID: <4bb6a4a0-525b-d36d-c5ac-127357e96eb3@linux.ibm.com>
Date: Wed, 11 Oct 2023 16:23:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCHv8 1/5] powerpc/setup : Enable boot_cpu_hwid for PPC32
Content-Language: en-US
To: Pingfan Liu <piliu@redhat.com>, linuxppc-dev@lists.ozlabs.org
References: <20231009113036.45988-1-piliu@redhat.com>
 <20231009113036.45988-2-piliu@redhat.com>
 <36b2aa11-dfd9-529d-0386-aa181caeb93f@linux.ibm.com>
 <7da645c3-2899-fb01-bf11-392b9bd52e38@linux.ibm.com>
 <ZSYIrNRSxzkiPqv+@piliu.users.ipa.redhat.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <ZSYIrNRSxzkiPqv+@piliu.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: B0mh-h6G1tEfokoWgjrW-oiDiXNIKU9z
X-Proofpoint-ORIG-GUID: meEowEEfSJCJg8QWZkXjIMn2jNyQv6aA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_08,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110095
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
>>> With this patch series applied, the kdump kernel fails to boot on
>>> powerpc with nr_cpus=1.
>>>
>>> Console logs:
>>> -------------------
>>> [root]# echo c > /proc/sysrq-trigger
>>> [   74.783235] sysrq: Trigger a crash
>>> [   74.783244] Kernel panic - not syncing: sysrq triggered crash
>>> [   74.783252] CPU: 58 PID: 3838 Comm: bash Kdump: loaded Not tainted
>>> 6.6.0-rc5pf-nr-cpus+ #3
>>> [   74.783259] Hardware name: POWER10 (raw) phyp pSeries
>>> [   74.783275] Call Trace:
>>> [   74.783280] [c00000020f4ebac0] [c000000000ed9f38]
>>> dump_stack_lvl+0x6c/0x9c (unreliable)
>>> [   74.783291] [c00000020f4ebaf0] [c000000000150300] panic+0x178/0x438
>>> [   74.783298] [c00000020f4ebb90] [c000000000936d48]
>>> sysrq_handle_crash+0x28/0x30
>>> [   74.783304] [c00000020f4ebbf0] [c00000000093773c]
>>> __handle_sysrq+0x10c/0x250
>>> [   74.783309] [c00000020f4ebc90] [c000000000937fa8]
>>> write_sysrq_trigger+0xc8/0x168
>>> [   74.783314] [c00000020f4ebcd0] [c000000000665d8c]
>>> proc_reg_write+0x10c/0x1b0
>>> [   74.783321] [c00000020f4ebd00] [c00000000058da54]
>>> vfs_write+0x104/0x4b0
>>> [   74.783326] [c00000020f4ebdc0] [c00000000058dfdc]
>>> ksys_write+0x7c/0x140
>>> [   74.783331] [c00000020f4ebe10] [c000000000033a64]
>>> system_call_exception+0x144/0x3a0
>>> [   74.783337] [c00000020f4ebe50] [c00000000000c554]
>>> system_call_common+0xf4/0x258
>>> [   74.783343] --- interrupt: c00 at 0x7fffa0721594
>>> [   74.783352] NIP:  00007fffa0721594 LR: 00007fffa0697bf4 CTR:
>>> 0000000000000000
>>> [   74.783364] REGS: c00000020f4ebe80 TRAP: 0c00   Not tainted
>>> (6.6.0-rc5pf-nr-cpus+)
>>> [   74.783376] MSR:  800000000280f033
>>> <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28222202  XER: 00000000
>>> [   74.783394] IRQMASK: 0
>>> [   74.783394] GPR00: 0000000000000004 00007ffffc4b6800 00007fffa0807300
>>> 0000000000000001
>>> [   74.783394] GPR04: 000000013549ea60 0000000000000002 0000000000000010
>>> 0000000000000000
>>> [   74.783394] GPR08: 0000000000000000 0000000000000000 0000000000000000
>>> 0000000000000000
>>> [   74.783394] GPR12: 0000000000000000 00007fffa0abaf70 0000000040000000
>>> 000000011a0f9798
>>> [   74.783394] GPR16: 000000011a0f9724 000000011a097688 000000011a02ff70
>>> 000000011a0fd568
>>> [   74.783394] GPR20: 0000000135554bf0 0000000000000001 000000011a0aa478
>>> 00007ffffc4b6a24
>>> [   74.783394] GPR24: 00007ffffc4b6a20 000000011a0faf94 0000000000000002
>>> 000000013549ea60
>>> [   74.783394] GPR28: 0000000000000002 00007fffa08017a0 000000013549ea60
>>> 0000000000000002
>>> [   74.783440] NIP [00007fffa0721594] 0x7fffa0721594
>>> [   74.783443] LR [00007fffa0697bf4] 0x7fffa0697bf4
>>> [   74.783447] --- interrupt: c00
>>> I'm in purgatory
>>> [    0.000000] radix-mmu: Page sizes from device-tree:
>>> [    0.000000] radix-mmu: Page size shift = 12 AP=0x0
>>> [    0.000000] radix-mmu: Page size shift = 16 AP=0x5
>>> [    0.000000] radix-mmu: Page size shift = 21 AP=0x1
>>> [    0.000000] radix-mmu: Page size shift = 30 AP=0x2
>>> [    0.000000] Activating Kernel Userspace Access Prevention
>>> [    0.000000] Activating Kernel Userspace Execution Prevention
>>> [    0.000000] radix-mmu: Mapped 0x0000000000000000-0x0000000000010000
>>> with 64.0 KiB pages (exec)
>>> [    0.000000] radix-mmu: Mapped 0x0000000000010000-0x0000000000200000
>>> with 64.0 KiB pages
>>> [    0.000000] radix-mmu: Mapped 0x0000000000200000-0x0000000020000000
>>> with 2.00 MiB pages
>>> [    0.000000] radix-mmu: Mapped 0x0000000020000000-0x0000000022600000
>>> with 2.00 MiB pages (exec)
>>> [    0.000000] radix-mmu: Mapped 0x0000000022600000-0x0000000040000000
>>> with 2.00 MiB pages
>>> [    0.000000] radix-mmu: Mapped 0x0000000040000000-0x0000000180000000
>>> with 1.00 GiB pages
>>> [    0.000000] radix-mmu: Mapped 0x0000000180000000-0x00000001a0000000
>>> with 2.00 MiB pages
>>> [    0.000000] lpar: Using radix MMU under hypervisor
>>> [    0.000000] Linux version 6.6.0-rc5pf-nr-cpus+
>>> (root@ltcever7x0-lp1.aus.stglabs.ibm.com) (gcc (GCC) 8.5.0 20210514 (Red
>>> Hat 8.5.0-20), GNU ld version 2.30-123.el8) #3 SMP Mon Oct  9 11:07:
>>> 41 CDT 2023
>>> [    0.000000] Found initrd at 0xc000000022e60000:0xc0000000248f08d8
>>> [    0.000000] Hardware name: IBM,9043-MRX POWER10 (raw) 0x800200
>>> 0xf000006 of:IBM,FW1060.00 (NM1060_016) hv:phyp pSeries
>>> [    0.000000] printk: bootconsole [udbg0] enabled
>>> [    0.000000] the round shift between dt seq and the cpu logic number:
>>> 56
>>> [    0.000000] BUG: Unable to handle kernel data access on write at
>>> 0xc0000001a0000000
>>> [    0.000000] Faulting instruction address: 0xc000000022009c64
>>> [    0.000000] Oops: Kernel access of bad area, sig: 11 [#1]
>>> [    0.000000] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
>>> [    0.000000] Modules linked in:
>>> [    0.000000] CPU: 2 PID: 0 Comm: swapper Not tainted
>>> 6.6.0-rc5pf-nr-cpus+ #3
>>> [    0.000000] Hardware name:  POWER10 (raw)  hv:phyp pSeries
>>> [    0.000000] NIP:  c000000022009c64 LR: c000000022009c54 CTR:
>>> c0000000201ff348
>>> [    0.000000] REGS: c000000022aebb00 TRAP: 0300   Not tainted
>>> (6.6.0-rc5pf-nr-cpus+)
>>> [    0.000000] MSR:  8000000000001033 <SF,ME,IR,DR,RI,LE> CR: 28222824
>>> XER: 00000001
>>> [    0.000000] CFAR: c000000020031574 DAR: c0000001a0000000 DSISR:
>>> 42000000 IRQMASK: 1
>>> [    0.000000] GPR00: c000000022009ba0 c000000022aebda0 c0000000213d1300
>>> 0000000000000004
>>> [    0.000000] GPR04: 0000000000000001 c000000022aebbc0 c000000022aebbb8
>>> 0000000000000000
>>> [    0.000000] GPR08: 0000000000000001 c00000019ffffff8 000000000000003a
>>> c0000000229c8a78
>>> [    0.000000] GPR12: 0000000000002000 c000000022e4a800 c0000000211d34b8
>>> c0000000211d3aa8
>>> [    0.000000] GPR16: c0000000211d75a0 c0000000211d75b0 c0000000225f3b98
>>> 0000000000000000
>>> [    0.000000] GPR20: 0000000000000001 0000000000000001 0000000000000001
>>> 0000000000000001
>>> [    0.000000] GPR24: 0000000000000008 0000000000000000 0000000000000001
>>> c00000019ffffdc0
>>> [    0.000000] GPR28: 0000000000000002 c000000022b368e0 c000000022aebe08
>>> 0000000000000008
>>> [    0.000000] NIP [c000000022009c64] smp_setup_cpu_maps+0x420/0x724
>>> [    0.000000] LR [c000000022009c54] smp_setup_cpu_maps+0x410/0x724
>>> [    0.000000] Call Trace:
>>> [    0.000000] [c000000022aebda0] [c000000022009ba0]
>>> smp_setup_cpu_maps+0x35c/0x724 (unreliable)
>>> [    0.000000] [c000000022aebeb0] [c00000002200a19c]
>>> setup_arch+0x1b8/0x54c
>>> [    0.000000] [c000000022aebf30] [c000000022003f88]
>>> start_kernel+0xb0/0x768
>>> [    0.000000] [c000000022aebfe0] [c00000002000d888]
>>> start_here_common+0x1c/0x20
>>> [    0.000000] Code: 3929ffff 7f89e040 409c002c 7ec4b378 7f83e378
>>> 4a027939 7f83e378 4a0278e5 e95b0018 3d22017d e929f028 7d4ac42c
>>> <7d49c12e> eb7b0000 7e99a378 4bffff3c
>> The faulting instruction address, 0xc000000022009c6, corresponds to the code
>> below:
>>
>> File:
>> arch/powerpc/kernel/setup-common.c
>>
>> Function
>> void __init smp_setup_cpu_maps(void)
>> {
>>              ...
>>              cpu_to_phys_id[bt_thread] =
>> be32_to_cpu(intserv_node->intserv[bt_thread]);
>>              ...
>> }
>>
>> Hope it helps.
>>
> Appreciate your help.
>
> This issue should be linked with the capability of cpu_to_phys_id[].
>
> Could you please to try the fix suggested at the end of the email?
> It should be a fix for
> [PATCHv8 3/5] powerpc/setup: Handle the case when boot_cpuid greater than nr_cpus
>
>
> Thanks,
>
> Pingfan
>
> ---
>
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index bd7853a4bc91..849adc7a4b47 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -464,12 +464,6 @@ void __init smp_setup_cpu_maps(void)
>   	DBG("smp_setup_cpu_maps()\n");
>   
>   	INIT_LIST_HEAD(&head);
> -	cpu_to_phys_id = memblock_alloc(nr_cpu_ids * sizeof(u32),
> -					__alignof__(u32));
> -	if (!cpu_to_phys_id)
> -		panic("%s: Failed to allocate %zu bytes align=0x%zx\n",
> -		      __func__, nr_cpu_ids * sizeof(u32), __alignof__(u32));
> -
>   	for_each_node_by_type(dn, "cpu") {
>   		const __be32 *intserv;
>   		__be32 cpu_be;
> @@ -533,6 +527,16 @@ void __init smp_setup_cpu_maps(void)
>   		}
>   
>   	}
> +
> +	/* There may be hole between cpu0 and boot cpu */
> +	j = (bt_thread + 1) > nr_cpu_ids ? (bt_thread + 1) : nr_cpu_ids;
> +	cpu_to_phys_id = memblock_alloc(j * sizeof(u32),
> +					__alignof__(u32));
> +	if (!cpu_to_phys_id)
> +		panic("%s: Failed to allocate %zu bytes align=0x%zx\n",
> +		      __func__, nr_cpu_ids * sizeof(u32), __alignof__(u32));
> +
> +
>   	cpu = 0;
>   	list_del_init(&head);
>   	/* Select the primary thread, the boot cpu's slibing, as the logic 0 */

With the above changes applied, kdump kernel boots fine with a WARNING:

[root]# echo c > /proc/sysrq-trigger
[  310.748248] sysrq: Trigger a crash
[  310.748256] Kernel panic - not syncing: sysrq triggered crash
[  310.748266] CPU: 26 PID: 2610 Comm: bash Kdump: loaded Not tainted 
6.6.0-rc5-fix-setup-common+ #3
[  310.748273] Hardware name: IBM,9043-MRX POWER10  hv:phyp pSeries
[  310.748280] Call Trace:
[  310.748284] [c000000184717ac0] [c000000000ecf8d8] 
dump_stack_lvl+0x6c/0x9c (unreliable)
[  310.748298] [c000000184717af0] [c000000000150310] panic+0x178/0x438
[  310.748307] [c000000184717b90] [c00000000092c8b8] 
sysrq_handle_crash+0x28/0x30
[  310.748316] [c000000184717bf0] [c00000000092d2ac] 
__handle_sysrq+0x10c/0x250
[  310.748330] [c000000184717c90] [c00000000092db18] 
write_sysrq_trigger+0xc8/0x168
[  310.748339] [c000000184717cd0] [c00000000065c21c] 
proc_reg_write+0x10c/0x1b0
[  310.748349] [c000000184717d00] [c000000000583f94] vfs_write+0x104/0x4b0
[  310.748356] [c000000184717dc0] [c00000000058451c] ksys_write+0x7c/0x140
[  310.748365] [c000000184717e10] [c000000000033a54] 
system_call_exception+0x144/0x3a0
[  310.748377] [c000000184717e50] [c00000000000c554] 
system_call_common+0xf4/0x258
[  310.748389] --- interrupt: c00 at 0x7fff97720c34
[  310.748395] NIP:  00007fff97720c34 LR: 00007fff97697c74 CTR: 
0000000000000000
[  310.748404] REGS: c000000184717e80 TRAP: 0c00   Not tainted 
(6.6.0-rc5-fix-setup-common+)
[  310.748413] MSR:  800000000280f033 
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28222202  XER: 00000000
[  310.748430] IRQMASK: 0
[  310.748430] GPR00: 0000000000000004 00007fffffabc510 00007fff97807300 
0000000000000001
[  310.748430] GPR04: 00000001624f7910 0000000000000002 0000000000000010 
00007fff97669724
[  310.748430] GPR08: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[  310.748430] GPR12: 0000000000000000 00007fff97a5aee0 0000000040000000 
0000000125c39798
[  310.748430] GPR16: 0000000125c39724 0000000125bd8128 0000000125b70370 
0000000125c3d568
[  310.748430] GPR20: 0000000162551030 0000000000000001 0000000125beaf18 
00007fffffabc734
[  310.748430] GPR24: 00007fffffabc730 0000000125c3af94 0000000000000002 
00000001624f7910
[  310.748430] GPR28: 0000000000000002 00007fff97801798 00000001624f7910 
0000000000000002
[  310.748475] NIP [00007fff97720c34] 0x7fff97720c34
[  310.748478] LR [00007fff97697c74] 0x7fff97697c74
[  310.748482] --- interrupt: c00
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

Trimmed logs ....

[    0.001738] Mount-cache hash table entries: 16384 (order: 1, 131072 
bytes, linear)
[    0.001751] Mountpoint-cache hash table entries: 16384 (order: 1, 
131072 bytes, linear)
[    0.007339] ------------[ cut here ]------------
[    0.007356] WARNING: CPU: 2 PID: 1 at arch/powerpc/kernel/smp.c:941 
update_mask_from_threadgroup+0x128/0x1a0
[    0.007371] Modules linked in:
[    0.007377] CPU: 2 PID: 1 Comm: swapper/2 Not tainted 
6.6.0-rc5-fix-setup-common+ #3
[    0.007385] Hardware name: IBM,9043-MRX POWER10 hv:phyp pSeries
[    0.007393] NIP:  c000000022011ed8 LR: c000000022011e10 CTR: 
0000000000000000
[    0.007411] REGS: c0000000256338f0 TRAP: 0700   Not tainted 
(6.6.0-rc5-fix-setup-common+)
[    0.007425] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 
44000842  XER: 0000000c
[    0.007444] CFAR: c000000022011e78 IRQMASK: 0
[    0.007444] GPR00: c000000022011e10 c000000025633b90 c0000000213c1300 
0000000000000002
[    0.007444] GPR04: 0000000000000000 0000000000000005 0000000000000001 
0000000000000002
[    0.007444] GPR08: 0000000000000008 0000000000000001 0000000000000002 
0000000000000004
[    0.007444] GPR12: 0000000000000000 c000000022e3ac00 c000000020010138 
0000000000000000
[    0.007444] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[    0.007444] GPR20: 0000000000000018 c000000022150968 c000000022093580 
c0000000253df000
[    0.007444] GPR24: 0000000000000002 0000000000000000 c000000022b32058 
0000000000000000
[    0.007444] GPR28: c00000015fca0a68 c000000022ba0330 c00000002209352c 
0000000000000000
[    0.007520] NIP [c000000022011ed8] 
update_mask_from_threadgroup+0x128/0x1a0
[    0.007528] LR [c000000022011e10] update_mask_from_threadgroup+0x60/0x1a0
[    0.007536] Call Trace:
[    0.007539] [c000000025633b90] [c000000022011e10] 
update_mask_from_threadgroup+0x60/0x1a0 (unreliable)
[    0.007550] [c000000025633be0] [c000000022012210] 
init_thread_group_cache_map+0x2c0/0x338
[    0.007559] [c000000025633c50] [c0000000220125a0] 
smp_prepare_cpus+0x318/0x510
[    0.007568] [c000000025633d10] [c000000022004874] 
kernel_init_freeable+0x198/0x3cc
[    0.007578] [c000000025633de0] [c000000020010164] kernel_init+0x34/0x1b0
[    0.007586] [c000000025633e50] [c00000002000cd94] 
ret_from_kernel_user_thread+0x14/0x1c
[    0.007596] --- interrupt: 0 at 0x0
[    0.007601] NIP:  0000000000000000 LR: 0000000000000000 CTR: 
0000000000000000
[    0.007608] REGS: c000000025633e80 TRAP: 0000   Not tainted 
(6.6.0-rc5-fix-setup-common+)
[    0.007632] MSR:  0000000000000000 <>  CR: 00000000  XER: 00000000
[    0.007651] CFAR: 0000000000000000 IRQMASK: 0
[    0.007651] GPR00: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[    0.007651] GPR04: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[    0.007651] GPR08: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[    0.007651] GPR12: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[    0.007651] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[    0.007651] GPR20: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[    0.007651] GPR24: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[    0.007651] GPR28: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[    0.007742] NIP [0000000000000000] 0x0
[    0.007756] LR [0000000000000000] 0x0
[    0.007769] --- interrupt: 0
[    0.007779] Code: 7ca507b4 79081764 7d1e4214 8108000c 7f882000 
409effdc 48000010 38e70001 7ce707b4 4bffffa4 2f8affff 409e0010 
<0fe00000> 3860ffc3 4800004c 7f9b5000
[    0.007805] ---[ end trace 0000000000000000 ]---
[    0.007997] RCU Tasks Rude: Setting shift to 2 and lim to 1 
rcu_task_cb_adjust=1.
[    0.008018] RCU Tasks Trace: Setting shift to 2 and lim to 1 
rcu_task_cb_adjust=1.
[    0.008043] POWER10 performance monitor hardware support registered
[    0.008071] rcu: Hierarchical SRCU implementation.
[    0.008078] rcu:     Max phase no-delay instances is 1000.
[    0.008516] smp: Bringing up secondary CPUs ...
[    0.008735] smp: Brought up 1 node, 2 CPUs
...

Note: no warning observed if crashing CPU is 0, 8, 16, 24, 32, ....

Code that generates warning:

File: arch/powerpc/kernel/smp.c
Function: update_mask_from_threadgroup
...
         if (unlikely(i_group_start == -1)) {
             WARN_ON_ONCE(1);
             return -ENODATA;
         }


Thanks,
Sourabh
