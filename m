Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95563917CDA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 11:47:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RIC+gnW/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8H1D6tSfz3bpN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 19:47:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RIC+gnW/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8H0X623cz2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2024 19:46:52 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45Q8v037027019;
	Wed, 26 Jun 2024 09:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=r
	b18LISnn2nawatlvPrv9OzaNMNHsMFk1LVi9O9kcDY=; b=RIC+gnW/OVMsmoHtC
	0AORnXlvF84GDeDL9qjUvBTvC1vZUbijZN16ilT3susgWODCr+tP7II/lP1grkwp
	jICy8b/OkmE4SNyN7NIfMUlbEomTGuR8UdxHeVKJ+iObb1OwVKibfG0sPtO43dCp
	6vQfCo6rBN9hIqheL+xkJHdYv9n77WQKvYMc9xon8Jt3Ih2E0DFsZLiJnwSkeyeK
	FSpG54ackKdtJoTXHMiPK9KMBZgIhH8RnUh2Qf5gnHaBSaVEIc5IuaAjArYkJx5V
	hFHITsS67pv5as84x4n/JZCEWD0qfYp09AHRaS2xLOIMPRZyjGBVVJE/3KFYngX9
	bU2Qw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 400emg0acy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 09:46:47 +0000 (GMT)
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45Q9kldD007201;
	Wed, 26 Jun 2024 09:46:47 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 400emg0acu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 09:46:47 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45Q8L7qK008196;
	Wed, 26 Jun 2024 09:46:46 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yx9b0upwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 09:46:46 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45Q9kgwO50332134
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2024 09:46:44 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D12420040;
	Wed, 26 Jun 2024 09:46:42 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5342320067;
	Wed, 26 Jun 2024 09:46:41 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Jun 2024 09:46:41 +0000 (GMT)
Message-ID: <3b4b2943-49ad-4619-b195-bc416f1d1409@linux.ibm.com>
Date: Wed, 26 Jun 2024 15:16:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/pseries: Fix scv instruction crash with kexec
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20240625134047.298759-1-npiggin@gmail.com>
 <87sex0oxym.fsf@mail.lhotse>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87sex0oxym.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: E1PreOq558mqmZeTsQx-tFYTBjzidmT8
X-Proofpoint-GUID: WvcBgqvBx8LtgvKIs0VRzTcQSCBz0OWW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_03,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0 mlxscore=0
 clxscore=1011 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260071
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michael,

On 26/06/24 14:57, Michael Ellerman wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> kexec on pseries disables AIL (reloc_on_exc), required for scv
>> instruction support, before other CPUs have been shut down. This means
>> they can execute scv instructions after AIL is disabled, which causes an
>> interrupt at an unexpected entry location that crashes the kernel.
>>
>> Change the kexec sequence to disable AIL after other CPUs have been
>> brought down.
>>
>> As a refresher, the real-mode scv interrupt vector is 0x17000, and the
>> fixed-location head code probably couldn't easily deal with implementing
>> such high addresses so it was just decided not to support that interrupt
>> at all.
>>
>> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>   
> Was this reported publicly? I don't remember it.

No, I didn't report this issue publicly.

While debugging a kexec issue, the git bisect pointed to the commit 
mentioned
in the patch description. So, I contacted Nick directly.

`kexec -e` with --smt=off the first kernel hits exception when 
wake_offline_cpus() -> add_cpu() is called
to bring up offline CPUs.

Console log:

[   68.824514] restraintd[899]: * Parsing recipe
[   68.825546] restraintd[899]: * Running recipe
[   68.825591] restraintd[899]: ** Continuing task: 20291 
[/mnt/tests/distribution/reservesys]
[   68.834095] restraintd[899]: ** Preparing metadata
[   68.872927] restraintd[899]: ** Refreshing peer role hostnames: Retries 0
[   68.911107] restraintd[899]: ** Updating env vars
[   68.911737] restraintd[899]: *** Current Time: Tue May 21 09:09:42 
2024  Localwatchdog at:  * Disabled! *
[   68.922803] restraintd[899]: ** Running task: 20291 
[/distribution/reservesys]
[   78.027943] Removing IBM Power 842 compression device
[   78.093777] XFS (sda2): Block device removal (0x20) detected at 
xfs_fs_shutdown+0x34/0x50 [xfs] (fs/xfs/xfs_super.c:1179). Shutting down 
filesystem.
[   78.093894] XFS (sda2): Please unmount the filesystem and rectify the 
problem(s)
[   83.450854] dm-0: writeback error on inode 17086756, offset 569344, 
sector 11026136
[   83.450910] dm-0: writeback error on inode 36421601, offset 0, sector 
20772504
[   84.021819] dm-0: writeback error on inode 36382045, offset 0, sector 
20772536
[   84.094348] dm-0: writeback error on inode 18703102, offset 0, sector 
11021000
[   84.601228] dm-0: writeback error on inode 51268015, offset 0, sector 
27663152
[   84.601468] dm-0: writeback error on inode 58225471, offset 0, sector 
34636080
[   85.370996] kexec_core: Starting new kernel
[   85.391013] kexec: Waking offline cpu 1.
[   85.391038] ------------[ cut here ]------------
[   85.391042] kernel BUG at arch/powerpc/kernel/exceptions-64s.S:501!
[   85.391047] Oops: Exception in kernel mode, sig: 5 [#1]
[   85.391051] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
[   85.391056] Modules linked in: bonding tls rfkill pseries_rng 
vmx_crypto drm fuse drm_panel_orientation_quirks xfs libcrc32c sr_mod 
sd_mod cdrom t10_pi sg ibmvscsi ibmveth scsi_transport_srp dm_mirror 
dm_region_hash dm_log dm_mod
[   85.391086] CPU: 0 PID: 565 Comm: systemd-journal Kdump: loaded Not 
tainted 6.9.0+ #1
[   85.391092] Hardware name: IBM,9008-22L POWER9 (raw) 0x4e0202 
0xf000005 of:IBM,FW950.A0 (VL950_144) hv:phyp pSeries
[   85.391096] NIP:  c0000000000089a4 LR: 000000000001703c CTR: 
c000000000008980
[   85.391101] REGS: c00000000f76fd60 TRAP: 0700   Not tainted (6.9.0+)
[   85.391106] MSR:  8000000000021031 <SF,ME,IR,DR,LE>  CR: 240022d4  
XER: 00000000
[   85.391116] CFAR: c00000000000899c IRQMASK: 0
[   85.391116] GPR00: 0000000000000003 00007fffc4f783a0 00007fff9f0a7200 
0000010014331bb8
[   85.391116] GPR04: 00007fffc4f7b078 000000000000c4f6 00007fffc4f7b1d0 
00000100143469a0
[   85.391116] GPR08: 00007fff9f489268 00000000440022d4 00007fffc4f78670 
00000000000ac588
[   85.391116] GPR12: 8000000000009003 c000000002f50000 0000000000000000 
0000000000000000
[   85.391116] GPR16: 0000000000000000 0000000000000000 0000000000000000 
0000000000000000
[   85.391116] GPR20: 0000000000000000 0000000000000000 0000000127117b48 
00000001271185b8
[   85.391116] GPR24: 0000000127117b90 00007fffc4f7b070 0000010014331540 
00007fffc4f7b078
[   85.391116] GPR28: 0000000000000000 00007fffc4f78f80 000000000000c4f6 
0000010014331ba0
[   85.391173] NIP [c0000000000089a4] data_access_common_virt+0x14/0x220
[   85.391181] LR [000000000001703c] 0x1703c
[   85.391186] Call Trace:
[   85.391189] Code: 48024df9 48000000 60000000 e94d0020 694a0002 
7d400164 60000000 718a4000 7c2a0b78 3821fd30 41c20008 e82d0910 
<0981fd30> f9210160 f9610130 f9810138
[   85.391208] ---[ end trace 0000000000000000 ]---
[   85.394302] pstore: backend (nvram) writing error (-1)
[   85.394306]
[   86.394309] Kernel panic - not syncing: Fatal exception
[   86.399970] Rebooting in 10 seconds..


Thanks,
Sourabh Jain
