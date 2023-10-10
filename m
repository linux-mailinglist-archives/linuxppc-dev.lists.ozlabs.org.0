Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4A17BF5B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 10:25:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dm+9gr+4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4TW45TQbz3c8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 19:25:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dm+9gr+4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4TVC0BGSz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 19:25:06 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39A8O3dP019499;
	Tue, 10 Oct 2023 08:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Z68Vio3Fx/cOI2NjI9d6Rcmo4nN7ca9XdXfyZioO0O0=;
 b=Dm+9gr+4g0oTblqOLRTN2QD+0vGU/Hh3tovflFQ6tpeFIiq2MEs9hrrPA8lgJ/QaYark
 jqESJUkzGcjyTIthhY+MaPcttmAEkx/DUtbMZ+rsLi/J9C15O03WO5dEIEn0cMJsELAb
 dRNQEDatZRJOIkPTHe9IWAfvTFtrYLaXe3V3Zn6TC7x2ncXvRwnGGGdAT5FtHsBPV8NA
 nwSafYIDqS0ixqS1fK6z/XuvjfI0X8xcLeAFUxX2mMESL5hqqo469f16trRkBolKsqNI
 qUq+piv2YebRCiPdbP1JEVMPlAII5NJtrEbo7B5fvppgd70Lierc4FwcfQ80HGnCJ0sp hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tn32k80yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 08:25:00 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39A8O4NX019515;
	Tue, 10 Oct 2023 08:24:59 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tn32k80xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 08:24:59 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39A6etD8023018;
	Tue, 10 Oct 2023 08:24:59 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkmc1ehhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Oct 2023 08:24:58 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39A8OvqF11993628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Oct 2023 08:24:57 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42B4120043;
	Tue, 10 Oct 2023 08:24:57 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4BC5520040;
	Tue, 10 Oct 2023 08:24:55 +0000 (GMT)
Received: from [9.43.8.81] (unknown [9.43.8.81])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Oct 2023 08:24:55 +0000 (GMT)
Message-ID: <4d5e2634-6c5b-bc31-5a1d-5f79b682016b@linux.ibm.com>
Date: Tue, 10 Oct 2023 13:54:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCHv8 1/5] powerpc/setup : Enable boot_cpu_hwid for PPC32
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: Pingfan Liu <piliu@redhat.com>, linuxppc-dev@lists.ozlabs.org
References: <20231009113036.45988-1-piliu@redhat.com>
 <20231009113036.45988-2-piliu@redhat.com>
 <36b2aa11-dfd9-529d-0386-aa181caeb93f@linux.ibm.com>
In-Reply-To: <36b2aa11-dfd9-529d-0386-aa181caeb93f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tahjZBUbs2_EIAInhfbjuUu-DygSuKob
X-Proofpoint-GUID: Y4m9ZYlWsCMy1TGqQJ4vpIDqbcwvnvlZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_04,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310100062
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

>
> With this patch series applied, the kdump kernel fails to boot on 
> powerpc with nr_cpus=1.
>
> Console logs:
> -------------------
> [root]# echo c > /proc/sysrq-trigger
> [   74.783235] sysrq: Trigger a crash
> [   74.783244] Kernel panic - not syncing: sysrq triggered crash
> [   74.783252] CPU: 58 PID: 3838 Comm: bash Kdump: loaded Not tainted 
> 6.6.0-rc5pf-nr-cpus+ #3
> [   74.783259] Hardware name: POWER10 (raw) phyp pSeries
> [   74.783275] Call Trace:
> [   74.783280] [c00000020f4ebac0] [c000000000ed9f38] 
> dump_stack_lvl+0x6c/0x9c (unreliable)
> [   74.783291] [c00000020f4ebaf0] [c000000000150300] panic+0x178/0x438
> [   74.783298] [c00000020f4ebb90] [c000000000936d48] 
> sysrq_handle_crash+0x28/0x30
> [   74.783304] [c00000020f4ebbf0] [c00000000093773c] 
> __handle_sysrq+0x10c/0x250
> [   74.783309] [c00000020f4ebc90] [c000000000937fa8] 
> write_sysrq_trigger+0xc8/0x168
> [   74.783314] [c00000020f4ebcd0] [c000000000665d8c] 
> proc_reg_write+0x10c/0x1b0
> [   74.783321] [c00000020f4ebd00] [c00000000058da54] 
> vfs_write+0x104/0x4b0
> [   74.783326] [c00000020f4ebdc0] [c00000000058dfdc] 
> ksys_write+0x7c/0x140
> [   74.783331] [c00000020f4ebe10] [c000000000033a64] 
> system_call_exception+0x144/0x3a0
> [   74.783337] [c00000020f4ebe50] [c00000000000c554] 
> system_call_common+0xf4/0x258
> [   74.783343] --- interrupt: c00 at 0x7fffa0721594
> [   74.783352] NIP:  00007fffa0721594 LR: 00007fffa0697bf4 CTR: 
> 0000000000000000
> [   74.783364] REGS: c00000020f4ebe80 TRAP: 0c00   Not tainted 
> (6.6.0-rc5pf-nr-cpus+)
> [   74.783376] MSR:  800000000280f033 
> <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28222202  XER: 00000000
> [   74.783394] IRQMASK: 0
> [   74.783394] GPR00: 0000000000000004 00007ffffc4b6800 
> 00007fffa0807300 0000000000000001
> [   74.783394] GPR04: 000000013549ea60 0000000000000002 
> 0000000000000010 0000000000000000
> [   74.783394] GPR08: 0000000000000000 0000000000000000 
> 0000000000000000 0000000000000000
> [   74.783394] GPR12: 0000000000000000 00007fffa0abaf70 
> 0000000040000000 000000011a0f9798
> [   74.783394] GPR16: 000000011a0f9724 000000011a097688 
> 000000011a02ff70 000000011a0fd568
> [   74.783394] GPR20: 0000000135554bf0 0000000000000001 
> 000000011a0aa478 00007ffffc4b6a24
> [   74.783394] GPR24: 00007ffffc4b6a20 000000011a0faf94 
> 0000000000000002 000000013549ea60
> [   74.783394] GPR28: 0000000000000002 00007fffa08017a0 
> 000000013549ea60 0000000000000002
> [   74.783440] NIP [00007fffa0721594] 0x7fffa0721594
> [   74.783443] LR [00007fffa0697bf4] 0x7fffa0697bf4
> [   74.783447] --- interrupt: c00
> I'm in purgatory
> [    0.000000] radix-mmu: Page sizes from device-tree:
> [    0.000000] radix-mmu: Page size shift = 12 AP=0x0
> [    0.000000] radix-mmu: Page size shift = 16 AP=0x5
> [    0.000000] radix-mmu: Page size shift = 21 AP=0x1
> [    0.000000] radix-mmu: Page size shift = 30 AP=0x2
> [    0.000000] Activating Kernel Userspace Access Prevention
> [    0.000000] Activating Kernel Userspace Execution Prevention
> [    0.000000] radix-mmu: Mapped 0x0000000000000000-0x0000000000010000 
> with 64.0 KiB pages (exec)
> [    0.000000] radix-mmu: Mapped 0x0000000000010000-0x0000000000200000 
> with 64.0 KiB pages
> [    0.000000] radix-mmu: Mapped 0x0000000000200000-0x0000000020000000 
> with 2.00 MiB pages
> [    0.000000] radix-mmu: Mapped 0x0000000020000000-0x0000000022600000 
> with 2.00 MiB pages (exec)
> [    0.000000] radix-mmu: Mapped 0x0000000022600000-0x0000000040000000 
> with 2.00 MiB pages
> [    0.000000] radix-mmu: Mapped 0x0000000040000000-0x0000000180000000 
> with 1.00 GiB pages
> [    0.000000] radix-mmu: Mapped 0x0000000180000000-0x00000001a0000000 
> with 2.00 MiB pages
> [    0.000000] lpar: Using radix MMU under hypervisor
> [    0.000000] Linux version 6.6.0-rc5pf-nr-cpus+ 
> (root@ltcever7x0-lp1.aus.stglabs.ibm.com) (gcc (GCC) 8.5.0 20210514 
> (Red Hat 8.5.0-20), GNU ld version 2.30-123.el8) #3 SMP Mon Oct  9 11:07:
> 41 CDT 2023
> [    0.000000] Found initrd at 0xc000000022e60000:0xc0000000248f08d8
> [    0.000000] Hardware name: IBM,9043-MRX POWER10 (raw) 0x800200 
> 0xf000006 of:IBM,FW1060.00 (NM1060_016) hv:phyp pSeries
> [    0.000000] printk: bootconsole [udbg0] enabled
> [    0.000000] the round shift between dt seq and the cpu logic 
> number: 56
> [    0.000000] BUG: Unable to handle kernel data access on write at 
> 0xc0000001a0000000
> [    0.000000] Faulting instruction address: 0xc000000022009c64
> [    0.000000] Oops: Kernel access of bad area, sig: 11 [#1]
> [    0.000000] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 2 PID: 0 Comm: swapper Not tainted 
> 6.6.0-rc5pf-nr-cpus+ #3
> [    0.000000] Hardware name:  POWER10 (raw)  hv:phyp pSeries
> [    0.000000] NIP:  c000000022009c64 LR: c000000022009c54 CTR: 
> c0000000201ff348
> [    0.000000] REGS: c000000022aebb00 TRAP: 0300   Not tainted 
> (6.6.0-rc5pf-nr-cpus+)
> [    0.000000] MSR:  8000000000001033 <SF,ME,IR,DR,RI,LE> CR: 
> 28222824  XER: 00000001
> [    0.000000] CFAR: c000000020031574 DAR: c0000001a0000000 DSISR: 
> 42000000 IRQMASK: 1
> [    0.000000] GPR00: c000000022009ba0 c000000022aebda0 
> c0000000213d1300 0000000000000004
> [    0.000000] GPR04: 0000000000000001 c000000022aebbc0 
> c000000022aebbb8 0000000000000000
> [    0.000000] GPR08: 0000000000000001 c00000019ffffff8 
> 000000000000003a c0000000229c8a78
> [    0.000000] GPR12: 0000000000002000 c000000022e4a800 
> c0000000211d34b8 c0000000211d3aa8
> [    0.000000] GPR16: c0000000211d75a0 c0000000211d75b0 
> c0000000225f3b98 0000000000000000
> [    0.000000] GPR20: 0000000000000001 0000000000000001 
> 0000000000000001 0000000000000001
> [    0.000000] GPR24: 0000000000000008 0000000000000000 
> 0000000000000001 c00000019ffffdc0
> [    0.000000] GPR28: 0000000000000002 c000000022b368e0 
> c000000022aebe08 0000000000000008
> [    0.000000] NIP [c000000022009c64] smp_setup_cpu_maps+0x420/0x724
> [    0.000000] LR [c000000022009c54] smp_setup_cpu_maps+0x410/0x724
> [    0.000000] Call Trace:
> [    0.000000] [c000000022aebda0] [c000000022009ba0] 
> smp_setup_cpu_maps+0x35c/0x724 (unreliable)
> [    0.000000] [c000000022aebeb0] [c00000002200a19c] 
> setup_arch+0x1b8/0x54c
> [    0.000000] [c000000022aebf30] [c000000022003f88] 
> start_kernel+0xb0/0x768
> [    0.000000] [c000000022aebfe0] [c00000002000d888] 
> start_here_common+0x1c/0x20
> [    0.000000] Code: 3929ffff 7f89e040 409c002c 7ec4b378 7f83e378 
> 4a027939 7f83e378 4a0278e5 e95b0018 3d22017d e929f028 7d4ac42c 
> <7d49c12e> eb7b0000 7e99a378 4bffff3c
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000]
> [    0.000000] Kernel panic - not syncing: Fatal exception
> [    0.000000] Rebooting in 180 seconds..
>
> However, the kdump kernel boots fine if the kernel crashes on CPU 0.

Found a pattern in kdump kernel failure with nr_cpus=1.

On CPU 0, 8, 16, 24, 32, 40, it boots fine.
On CPUs 1-7, 9-15, 17-23, 25-31, 33-39, it fails to boot.

Hope this helps.

Thanks,
Sourabh
