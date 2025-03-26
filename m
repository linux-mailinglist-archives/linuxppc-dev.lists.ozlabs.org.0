Return-Path: <linuxppc-dev+bounces-7344-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D915A71D2B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Mar 2025 18:32:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNDQ34Jw9z2yr3;
	Thu, 27 Mar 2025 04:32:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743010363;
	cv=none; b=Q1qfGTmGtk50qFNP620sWtdhsdewaqVQXkLbfeIiMzkwkYthlB0YGMIHmdmPtcRxTn0t0pnvEKKMTDid8xp4MuL82LssC/qAsVWmgJuL8Z+WvpjLj/ud2O6mKeI1b2MJC2pnQee1+VS1z5fBpBTeBYSh7pdMM1VL86SQeWdYpxjMSWMGPV4SHoRGlER5NJF5FnhLnrqGZFh5PY+K1eW2W3mEWJitku85+MlmATwGKoDRwOQCXlPm/ZhNsTpBz43GHb5iGFd5dGY60eeoNyXG+/xAx4GYfq5gv/GCcNJOo3Ahy8xFFmoBePGK8UwYgrowpes90f+z9hqc4jwjcbK0Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743010363; c=relaxed/relaxed;
	bh=JRJPBumc1+FM6+8fAv369eRK7mabAxE89OtSbd+D3xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jK/ScCUhxdk5XJuIq4OQh4VDzOgqn5kpkii1RJD7Cu5q759OewR4BqhfENSkl7srovUpScjZiWLJRyCNstNyTIFAPGZGcwcXnA0f9El0ctlDQdL4erR1704nt1Xo1A58Dp8kj1F7r68rzemJTY83gS0+i/jAZJt1gwD1Vduafv1yrUQ+OD2U0dBTWFoRvBAxG9YLdlar1EhqZzSyD1twQxTPqqsanxVY/Owlyqhjn/oeYKtMr/5Myh8gMSESSefKdhYqTVkD2XbhTOTcimDy6R4iCnBz6o9aXrHeTl1sV75tNdZbgpEtfZFzS+kif1dpQq6Q02JcTNoq0fVMBLLYLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NFt5MHY5; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NFt5MHY5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZNDQ24zpCz2yr0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 04:32:41 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QCS2D3002539;
	Wed, 26 Mar 2025 17:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JRJPBu
	mc1+FM6+8fAv369eRK7mabAxE89OtSbd+D3xk=; b=NFt5MHY5/G4aNo2dV/oQIT
	K5P49xoevf1n9HeUTr3OgMvSP4uYL69r6+CJ7mTSI7vyME+KXcMopzkwV/jqFjf+
	IQEuvIxHspekMRIimIGbHD+dKvM6ubuFA+b6yZhuQT1Xugwx7H1yCFaHzdHlccNL
	kMlBMe62fi6P/tqdJXqzMBlmxB7eR0T4CQXnr4E2jKT+AwO7Xptu9Mqzng5Kk14Z
	HI84BH/kcEvwW4dePWki8tOco6YVOez78mdUQAjEZuiGH4kUyNCW4WcgwItHEfo4
	SHakXrtijM34bMete9qzp3fi0ppxhJZA8wU959OZM/BW+vJQ9pMU/c28xihzSoPw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45mhm3spev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 17:32:27 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52QHRXfb028085;
	Wed, 26 Mar 2025 17:32:26 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45mhm3spep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 17:32:26 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52QESgmJ020082;
	Wed, 26 Mar 2025 17:32:25 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45j8hp1f9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 17:32:25 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52QHWNID30868108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Mar 2025 17:32:24 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE4BB58043;
	Wed, 26 Mar 2025 17:32:23 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DD6A58055;
	Wed, 26 Mar 2025 17:32:21 +0000 (GMT)
Received: from [9.61.254.184] (unknown [9.61.254.184])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Mar 2025 17:32:20 +0000 (GMT)
Message-ID: <0baf5da4-3cf9-47d0-a4da-68e50a0fce80@linux.ibm.com>
Date: Wed, 26 Mar 2025 23:02:19 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/pseries/msi: Avoid reading PCI device registers
 in reduced power states
Content-Language: en-GB
To: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Gautam Menghani <gautam@linux.ibm.com>, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250305090237.294633-1-gautam@linux.ibm.com>
 <87tt81tr8t.fsf@vajain21.in.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <87tt81tr8t.fsf@vajain21.in.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dWszvmrqjfzVeCOlnp73cEvFThETmkby
X-Proofpoint-GUID: je6N-GH6nVAhVmslWfrMt-Wux3Qf3kzZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_08,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503260107
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 10/03/25 10:30 am, Vaibhav Jain wrote:
> Gautam Menghani <gautam@linux.ibm.com> writes:
>
>> When a system is being suspended to RAM, the PCI devices are also
>> suspended and the PPC code ends up calling pseries_msi_compose_msg() and
>> this triggers the BUG_ON() in __pci_read_msi_msg() because the device at
>> this point is in reduced power state. In reduced power state, the memory
>> mapped registers of the PCI device are not accessible.
>>
>> To replicate the bug:
>> 1. Make sure deep sleep is selected
>> 	# cat /sys/power/mem_sleep
>> 	s2idle [deep]
>>
>> 2. Make sure console is not suspended (so that dmesg logs are visible)
>> 	echo N > /sys/module/printk/parameters/console_suspend
>>
>> 3. Suspend the system
>> 	echo mem > /sys/power/state
>>
>> To fix this behaviour, read the cached msi message of the device when the
>> device is not in PCI_D0 power state instead of touching the hardware.
>>
>> Fixes: a5f3d2c17b07 ("powerpc/pseries/pci: Add MSI domains")
>> Cc: stable@vger.kernel.org # v5.15+
>> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
I am able to reporduce this issue without this patch and with this 
pacth, there is no BUG_ON() in __pci_read_msi_msg(), but did see kernel 
warnings. not sure if its side effect of this patch or a seperate issue.

Without this patch: [ 96.888399] ------------[ cut here ]------------ [ 
96.888402] kernel BUG at drivers/pci/msi/msi.c:158! [ 96.888407] Oops: 
Exception in kernel mode, sig: 5 [#1] [ 96.888410] LE PAGE_SIZE=64K 
MMU=Hash SMP NR_CPUS=8192 NUMA pSeries [ 96.888414] Modules linked in: 
nft_compat nf_tables nfnetlink bonding tls rfkill binfmt_misc kmem 
device_dax pseries_rng vmx_crypto dax_pmem drm 
drm_panel_orientation_quirks xfs dm_service_time sd_mod sg nd_pmem 
ibmvfc nd_btt ibmvscsi scsi_transport_fc ibmveth scsi_transport_srp 
papr_scm libnvdimm tg3 dm_multipath dm_mirror dm_region_hash dm_log 
dm_mod fuse [ 96.888473] CPU: 14 UID: 0 PID: 89 Comm: migration/14 
Kdump: loaded Not tainted 6.14.0-auto #3 [ 96.888479] Hardware name: 
IBM,9009-42A POWER9 (architected) 0x4e0202 0xf000005 of:IBM,FW950.A0 
(VL950_141) hv:phyp pSeries [ 96.888481] Stopper: 
multi_cpu_stop+0x0/0x22c <- __stop_cpus.constprop.0+0x68/0xc0 [ 
96.888494] NIP: c000000000995aec LR: c00000000010ec20 CTR: 
c00000000010ebf8 [ 96.888498] REGS: c00000000680f830 TRAP: 0700 Not 
tainted (6.14.0-auto) [ 96.888501] MSR: 8000000002823033 
<SF,VEC,VSX,FP,ME,IR,DR,RI,LE> CR: 44004208 XER: 00000000 [ 96.888520] 
CFAR: c00000000010ec1c IRQMASK: 3 GPR00: c00000000010ec20 
c00000000680fad0 c000000001668100 c000000006c537e0 GPR04: 
c00000000680fb80 0000000000000000 0000000000000000 c009ffffff8325f0 
GPR08: 0000000000000001 0000000000000001 0000000000000003 
0000000000001003 GPR12: c00000000010ebf8 c00000000f7beb00 
c0000000001acbe0 c000000004056d40 GPR16: 0000000000000000 
0000000000000000 0000000000000000 0000000000000000 GPR20: 
0000000000000000 0000000000000003 000000000000001d c000000002cfaa88 
GPR24: c00000006545b800 c000000002cfc080 c000000001126bb0 
0000000000000000 GPR28: 0000000000000010 c00000000ce790c8 
c00000000680fb80 c000000006c537e0 [ 96.888586] NIP [c000000000995aec] 
__pci_read_msi_msg+0x48/0x278 [ 96.888592] LR [c00000000010ec20] 
pseries_msi_compose_msg+0x28/0x3c [ 96.888599] Call Trace: [ 96.888600] 
[c00000000680fad0] [000000000000001d] 0x1d (unreliable) [ 96.888608] 
[c00000000680fb20] [c00000006545b820] 0xc00000006545b820 [ 96.888613] 
[c00000000680fb40] [c00000000023b41c] irq_chip_compose_msi_msg+0x5c/0x90 
[ 96.888620] [c00000000680fb60] [c000000000242aec] 
msi_domain_set_affinity+0xb8/0xf4 [ 96.888627] [c00000000680fbb0] 
[c000000000234634] irq_do_set_affinity+0x14c/0x25c [ 96.888633] 
[c00000000680fc10] [c000000000234870] 
irq_set_affinity_locked+0x12c/0x1c4 [ 96.888639] [c00000000680fc60] 
[c000000000234a84] irq_set_affinity+0x64/0xa0 [ 96.888644] 
[c00000000680fca0] [c0000000000c9d40] xics_migrate_irqs_away+0x27c/0x30c 
[ 96.888650] [c00000000680fd60] [c000000000111834] 
pseries_cpu_disable+0xc8/0xf0 [ 96.888657] [c00000000680fd90] 
[c0000000000611e0] __cpu_disable+0x54/0xb0 [ 96.888662] 
[c00000000680fdc0] [c0000000001715e8] take_cpu_down+0x4c/0xcc [ 
96.888669] [c00000000680fe10] [c0000000002ebbc4] 
multi_cpu_stop+0xd8/0x22c [ 96.888676] [c00000000680fe80] 
[c0000000002eb898] cpu_stopper_thread+0x158/0x24c [ 96.888683] 
[c00000000680ff30] [c0000000001b7a0c] smpboot_thread_fn+0x1ec/0x25c [ 
96.888691] [c00000000680ff90] [c0000000001acd04] kthread+0x12c/0x14c [ 
96.888697] [c00000000680ffe0] [c00000000000df98] 
start_kernel_thread+0x14/0x18 [ 96.888703] Code: fba1ffe8 39200001 
f821ffb1 7c7f1b78 7c9e2378 e94d0c78 f9410028 39400000 eba30008 815dffd8 
2c0a0000 7d20489e <0b090000> a123004c 712a0001 41820168 [ 96.888730] 
---[ end trace 0000000000000000 ]---

With this patch: No System crash observed. But below warnings were observed.

[ 99.450644] ------------[ cut here ]------------ [ 99.450648] WARNING: 
CPU: 0 PID: 17 at arch/powerpc/sysdev/xics/icp-hv.c:55 
icp_hv_eoi+0xc4/0x120 [ 99.450659] Modules linked in: nft_compat 
nf_tables nfnetlink bonding tls rfkill binfmt_misc kmem device_dax 
pseries_rng vmx_crypto dax_pmem drm drm_panel_orientation_quirks xfs 
dm_service_time sd_mod sg nd_pmem ibmvfc nd_btt ibmvscsi 
scsi_transport_fc ibmveth scsi_transport_srp papr_scm libnvdimm tg3 
dm_multipath dm_mirror dm_region_hash dm_log dm_mod fuse [ 99.450704] 
CPU: 0 UID: 0 PID: 17 Comm: ksoftirqd/0 Kdump: loaded Not tainted 
6.14.0-auto-00001-g03419579f433 #4 [ 99.450712] Hardware name: 
IBM,9009-42A POWER9 (architected) 0x4e0202 0xf000005 of:IBM,FW950.A0 
(VL950_141) hv:phyp pSeries [ 99.450717] NIP: c0000000000cadd4 LR: 
c0000000000cadd0 CTR: 00000000007088ec [ 99.450722] REGS: 
c000000004a2fa20 TRAP: 0700 Not tainted 
(6.14.0-auto-00001-g03419579f433) [ 99.450727] MSR: 800000000282b033 
<SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> CR: 2804424f XER: 00000010 [ 
99.450743] CFAR: c000000000224da8 IRQMASK: 1 GPR00: c0000000000cadd0 
c000000004a2fcc0 c000000001668100 000000000000003f GPR04: 
c0000007fd907c88 c0000007fd916000 c000000004a2fb08 00000007fb6a0000 
GPR08: 0000000000000027 0000000000000000 0000000000000000 
0000000000000001 GPR12: c000000002a37d48 c000000003000000 
c0000000001acc60 c000000004052080 GPR16: 0000000000000006 
0000000000000040 0000000000000006 0000000000000100 GPR20: 
0000000004208040 0000000000000000 0000000000000001 c0000000002382c0 
GPR24: 0000000000000001 0000000000000000 0000000000000006 
0000000000000002 GPR28: c0000007fd9078b8 0000000000000000 
c0000000010e69e8 00000000050a0002 [ 99.450802] NIP [c0000000000cadd4] 
icp_hv_eoi+0xc4/0x120 [ 99.450808] LR [c0000000000cadd0] 
icp_hv_eoi+0xc0/0x120 [ 99.450814] Call Trace: [ 99.450816] 
[c000000004a2fcc0] [c0000000000cadd0] icp_hv_eoi+0xc0/0x120 (unreliable) 
[ 99.450824] [c000000004a2fd30] [c000000000239eac] 
handle_fasteoi_irq+0x16c/0x344 [ 99.450832] [c000000004a2fd70] 
[c000000000238380] resend_irqs+0xc0/0x188 [ 99.450838] 
[c000000004a2fdb0] [c00000000017b054] tasklet_action_common+0x154/0x418 
[ 99.450845] [c000000004a2fe20] [c00000000017a788] 
handle_softirqs+0x148/0x3b4 [ 99.450852] [c000000004a2ff10] 
[c00000000017aa58] run_ksoftirqd+0x64/0xa0 [ 99.450858] 
[c000000004a2ff30] [c0000000001b7a8c] smpboot_thread_fn+0x1ec/0x25c [ 
99.450866] [c000000004a2ff90] [c0000000001acd84] kthread+0x12c/0x14c [ 
99.450873] [c000000004a2ffe0] [c00000000000df98] 
start_kernel_thread+0x14/0x18 [ 99.450879] Code: ebe1fff8 7c0803a6 
4e800020 3c82ffa8 3c62ffdc 7fc5f378 3fc2ffa8 3884e908 38632268 3bdee8e8 
48159f95 60000000 <0fe00000> 7bff4622 38600068 7fe4fb78 [ 99.450900] 
---[ end trace 0000000000000000 ]---

Please add below tag:

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,

Venkat.

> LGTM. Hence
> Reviewed-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>

