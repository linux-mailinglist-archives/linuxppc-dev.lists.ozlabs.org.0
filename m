Return-Path: <linuxppc-dev+bounces-6399-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B63A4150E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 07:05:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1VZk5cksz300V;
	Mon, 24 Feb 2025 17:05:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740377118;
	cv=none; b=JEQHJnWXJEWiP/VaQCvHlhTg6wTeWlQEmWMtytAHNe4+FYOv7eIANqGeX1ckVBxrxY1oi3mH1S56FfqU4PKLOBU4zZDskzWXZ5sb6p4tJiOWFN3CgF6elgepAvFv+kaArxijlBzr/hsM6oNva4ru+kYDPrFUbBYJNcGvquNXNLr57yjviX2Zm8Wt2wKOu6LyIa9pl2p9KIwVnU4w5Q+OaSqQcTZ2sRS4SxqWv/cy6j0ojsHPipirQbo2Ho8hIQmQK6UtePLVug2EIbNESO/RK0xbw/AASoSWjidko8lFJbfNj21Jvv6UiA7uxaMqVxERrHz75aSU+vYjcoryKp9g2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740377118; c=relaxed/relaxed;
	bh=kUvDXcgcVsNIBu+7os+iz2f26uZPlI9qjMhXAqTVjC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YizzavoJjuFzJ5P2g9CgS3xqoN3SlORwW+n5Rkn+niqsgomH5920qsCNuHjBjXnDDI8iMgWTBkM0Ha5LL8+H4wEZalpLJq51Y/6F0kF843ZDRF5JS9o/KNkB3KUV/3cizVKMvppI/XYuDyUHaBwgGpizVKKfAQ9duotD8ucg3cofcP3IEj6+bJQlhf552L6oRsBNz2QF/QyxqgT67Bhfj/wKv3cGzBu3pVW1zatgWgLgmY8fZUlURig9W9U6Fedzy27qOEUCA/dhP3MShOIqgDn/oYsS4+OVnO4G/HQT4+5NVPXDk65aOkRC/gceANJuV1CrUcu4sVag5zQQCIThUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WNp5jPB8; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WNp5jPB8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1VZj3rDSz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 17:05:17 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O2DXap025399;
	Mon, 24 Feb 2025 06:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kUvDXc
	gcVsNIBu+7os+iz2f26uZPlI9qjMhXAqTVjC0=; b=WNp5jPB8vaTFVCbPoWG3gL
	Kyg3g5DzpmzF1puQu6UqCXLehfcU/w3WdBhzU61huV4nTyJdw+r/tiY0oNUNogKz
	uAIDGZDSnK+I6csJ1fglwFMe//JrQOOZ9tJAUtYv5AQPwoV/1BQGYhqezeFp3r82
	ULEHSHxM7lAwNNTY0muH3rEXur3KG33G1iRrBYGv8/7xFGcCdF5gTX7YZoojQpjS
	lMUGDY6DHKhTM6oFVxn9AurEF7IiZXzW1+wIc1KqMYU5WmjfrVfCM6XJGuh9zlye
	6p9DFYdpSZrKV5mE1W9S0ncSTrn0Gxw/+ix0FwRaaVrdD5TFEy8U9UoCS5jD70FA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 450eu9rwpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 06:05:08 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51O2h9vM012131;
	Mon, 24 Feb 2025 06:05:07 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44ys9y5uym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 06:05:07 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51O655fd19071344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Feb 2025 06:05:05 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 666662004B;
	Mon, 24 Feb 2025 06:05:05 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31F8720040;
	Mon, 24 Feb 2025 06:05:04 +0000 (GMT)
Received: from [9.171.7.41] (unknown [9.171.7.41])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Feb 2025 06:05:03 +0000 (GMT)
Message-ID: <b3338ed3-1e42-4f7f-8a0c-26e8fd7aa25d@linux.ibm.com>
Date: Mon, 24 Feb 2025 11:35:02 +0530
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
Subject: Re: [linux-next][next-20250207]Observing Kernel Softlock up's while
 running kselftest
To: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sfr@canb.auug.org.au
References: <8d1ebe64-f5df-43d4-8e4d-20f934daff45@linux.vnet.ibm.com>
Content-Language: en-US
From: Ganesh G R <ganeshgr@linux.ibm.com>
In-Reply-To: <8d1ebe64-f5df-43d4-8e4d-20f934daff45@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lziwejAHuUOY2hohjt1fjopqWZZBD-8h
X-Proofpoint-ORIG-GUID: lziwejAHuUOY2hohjt1fjopqWZZBD-8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_02,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 clxscore=1011 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240042
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2/10/25 10:04 AM, Venkat Rao Bagalkote wrote:
> Greetings!!!
> 
> I am observing kernel soft lock up's while running kselftest on IBM 
> Power Servers.
> 
> Though, I colud not reporduce this consistently, but CI has detected 
> this error twice now. Hence reporting.
> 
> This error was reported firat time, while running signal component tests 
> and second time while running EEH component.
> 
> linux-next/tools/testing/selftests/powerpc/signal
> 
> linux-next/tools/testing/selftests/powerpc/eeh
> 
> 
> 
> Traces:
> 
> [11480.019928] watchdog: BUG: soft lockup - CPU#0 stuck for 26s! 
> [swapper/0:0]
> [11480.019935] Modules linked in: nvram(E) rpadlpar_io(E) rpaphp(E) 
> dm_mod(E) bonding(E) tls(E) nft_fib_inet(E) nft_fib_ipv4(E) 
> nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) 
> nf_reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) nf_nat(E) 
> nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) rfkill(E) ip_set(E) 
> nf_tables(E) nfnetlink(E) hvcs(E) pseries_rng(E) hvcserver(E) 
> vmx_crypto(E) drm(E) drm_panel_orientation_quirks(E) xfs(E) lpfc(E) 
> sr_mod(E) sd_mod(E) cdrom(E) sg(E) nvmet_fc(E) ibmvscsi(E) nvmet(E) 
> ibmveth(E) scsi_transport_srp(E) nvme_fc(E) nvme_fabrics(E) bnx2x(E) 
> nvme_core(E) be2net(E) mdio(E) scsi_transport_fc(E) fuse(E) [last 
> unloaded: test_cpuidle_latency(OE)]
> [11480.019990] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Kdump: loaded 
> Tainted: G           OE      6.14.0-rc1-next-20250207 #1
> [11480.019995] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
> [11480.019996] Hardware name: IBM,8375-42A POWER9 (architected) 0x4e0202 
> 0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
> [11480.019997] NIP:  c00000000003a2d0 LR: c00000000003a644 CTR: 
> c0000000002a912c
> [11480.020000] REGS: c0000003bffffb28 TRAP: 0900   Tainted: G OE       
> (6.14.0-rc1-next-20250207)
> [11480.020002] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
> 22042442  XER: 20040000
> [11480.020009] CFAR: 0000000000000000 IRQMASK: 0
> [11480.020009] GPR00: c00000000003a644 c0000003bffffb00 c000000001667500 
> c0000003bffffaf8
> [11480.020009] GPR04: c000000004062940 c0000003bffffd20 0000000000000001 
> c000000002277ca0
> [11480.020009] GPR08: 0000000000000003 0000000000000049 0000000000000000 
> 0000000000002000
> [11480.020009] GPR12: c0000000002a912c c000000003000000 0000000000000000 
> 0000000000000000
> [11480.020009] GPR16: 0000000000000001 0000000000000082 0000000000000001 
> 0000000000000100
> [11480.020009] GPR20: 0000000004200002 0000000000000000 0000000000000000 
> 0000000100110511
> [11480.020009] GPR24: 7fffffffffffffff 0000000000000001 00000003bd5a0000 
> 0000000000000000
> [11480.020009] GPR28: 0000000000000002 0000000000000003 fcffffffffffffff 
> fcffffffffffffff
> [11480.020036] NIP [c00000000003a2d0] __replay_soft_interrupts+0x5c/0x22c
> [11480.020048] LR [c00000000003a644] arch_local_irq_restore+0x1a4/0x280
> [11480.020053] Call Trace:
> [11480.020054] [c0000003bffffb00] [c00000000003a358] 
> __replay_soft_interrupts+0xe4/0x22c (unreliable)
> [11480.020060] [c0000003bffffcb0] [c00000000003a644] 
> arch_local_irq_restore+0x1a4/0x280
> [11480.020064] [c0000003bffffcf0] [c0000000002a9d60] 
> tmigr_handle_remote_cpu+0x24c/0x318
> [11480.020071] [c0000003bffffda0] [c0000000002aa034] 
> tmigr_handle_remote_up+0x208/0x2d0
> [11480.020075] [c0000003bffffe10] [c0000000002a7d34] 
> __walk_groups.isra.0+0x6c/0x100
> [11480.020079] [c0000003bffffe50] [c0000000002aa2d0] 
> tmigr_handle_remote+0xf0/0x170
> [11480.020083] [c0000003bffffed0] [c0000000002876a4] 
> run_timer_softirq+0x54/0x68
> [11480.020089] [c0000003bffffef0] [c000000000179128] 
> handle_softirqs+0x148/0x3b4
> [11480.020094] [c0000003bfffffe0] [c000000000017f30] 
> do_softirq_own_stack+0x3c/0x50
> [11480.020100] [c000000002c87900] [c000000000178688] 
> __irq_exit_rcu+0x18c/0x1b4
> [11480.020102] [c000000002c87930] [c000000000179758] irq_exit+0x20/0x38
> [11480.020105] [c000000002c87950] [c00000000002b004] 
> timer_interrupt+0x128/0x300
> [11480.020108] [c000000002c879b0] [c000000000009ffc] 
> decrementer_common_virt+0x28c/0x290
> [11480.020113] --- interrupt: 900 at plpar_hcall_norets_notrace+0x18/0x2c
> [11480.020119] NIP:  c0000000000fb9d4 LR: c0000000010c2348 CTR: 
> 0000000000000000
> [11480.020120] REGS: c000000002c879e0 TRAP: 0900   Tainted: G OE       
> (6.14.0-rc1-next-20250207)
> [11480.020122] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> 
> CR: 22000248  XER: 20040000
> [11480.020129] CFAR: 0000000000000000 IRQMASK: 0
> [11480.020129] GPR00: 0000000000000000 c000000002c87c80 c000000001667500 
> 0000000000000000
> [11480.020129] GPR04: 000000000000ffff 0000000000000000 0000000000000000 
> 0000000000000000
> [11480.020129] GPR08: 0000000000000000 0000000000000000 80000000c7a3fc00 
> ffffffffffffffff
> [11480.020129] GPR12: 0000000000000000 c000000003000000 0000000000000000 
> 0000000000000000
> [11480.020129] GPR16: 0000000000000000 0000000000000000 0000000000000000 
> 0000000000000000
> [11480.020129] GPR20: 0000000000c00000 0000000000000008 0000000000000000 
> 0000000000000000
> [11480.020129] GPR24: 0000000000000000 0000000000000000 00000a6adcf558a4 
> 0000000000000000
> [11480.020129] GPR28: 0000000000000000 0000000000000001 c0000000022618e0 
> c0000000022618e8
> [11480.020155] NIP [c0000000000fb9d4] plpar_hcall_norets_notrace+0x18/0x2c
> [11480.020158] LR [c0000000010c2348] check_and_cede_processor+0x48/0x5c
> [11480.020162] --- interrupt: 900
> [11480.020163] [c000000002c87c80] [c00000000028a8b0] 
> __hrtimer_start_range_ns+0x160/0x2ec (unreliable)
> [11480.020168] [c000000002c87ce0] [c0000000010c2790] 
> dedicated_cede_loop+0x94/0x1a0
> [11480.020171] [c000000002c87d30] [c0000000010c1d80] 
> cpuidle_enter_state+0x3b4/0x5b4
> [11480.020174] [c000000002c87dd0] [c000000000cac55c] 
> cpuidle_enter+0x4c/0x68
> [11480.020178] [c000000002c87e10] [c0000000001eb5b4] call_cpuidle+0x4c/0x94
> [11480.020184] [c000000002c87e30] [c0000000001f3798] 
> cpuidle_idle_call+0x164/0x240
> [11480.020188] [c000000002c87e90] [c0000000001f3974] do_idle+0x100/0x1ac
> [11480.020192] [c000000002c87ee0] [c0000000001f3ca4] 
> cpu_startup_entry+0x48/0x50
> [11480.020196] [c000000002c87f10] [c000000000011280] rest_init+0xf0/0xf4
> [11480.020199] [c000000002c87f40] [c000000002006604] 
> start_kernel+0x50c/0x5e0
> [11480.020204] [c000000002c87fe0] [c00000000000ea9c] 
> start_here_common+0x1c/0x20
> [11480.020207] Code: 71298000 408201ec 892d0933 7d2a48f8 554a07fe 
> 0b0a0000 792ad7e2 0b0a0000 61290040 38610028 992d0933 480421c9 
> <60000000> 39200000 e9410130 f9210160
> 
> 
> Regards,
> 
> Venkat.
> 
Hi Venkat,

I tried reproducing this by running EEH self-tests, I did not observe 
any softlockup and no significant changes are made to EEH recently, So, 
I think this issue is less likely to be linked with EEH handling.

Thanks
Ganesh


