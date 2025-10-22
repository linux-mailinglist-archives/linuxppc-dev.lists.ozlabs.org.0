Return-Path: <linuxppc-dev+bounces-13142-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AFFBFAE14
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 10:26:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cs2Lj3p0yz3069;
	Wed, 22 Oct 2025 19:26:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761121581;
	cv=none; b=MXehK7adA6aZdDM+qHU8JaSt4CN5Xc3fkAbsT0bF4/YtUSOjEwMb0HQ/JSgyrglQfFAuFmnRQztlvXMH20J/p+lD+KRNuyzQN1M6QvHeOKQgptDoVadrBUG1MaHHgLNbAkQUaiyVpvwIHjhdk2BuhB9OF9F/oujEvkkHK2VMt2zDs/Tdf+3l4znHLjEZKDHr1ckvGS7pK5vj0IWZGgwZ11Cgz46/oBnBkPQAYlNCFSX8syeR4kXLpzsb03ISzz2A5KHBuBFu70sQOu9HzUghtCEeCJ8fVJuS/Weuo1LWs51SX+jz5GZw4qIGygc6pV1aMVbkwHMDTidi/DARXbbIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761121581; c=relaxed/relaxed;
	bh=hHGdoXqZF7p6UDhW/i+tZoTr2H6F6ejSfwgRGcZOc5c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=myddLkRvCnlKBBQNPzqAGfcyE+MX3NJX+6xVxEv3ls53604Q6O8Ow5h4TR+76KDEfq9PAZALttaDhOPI6abWBidmqA1SkwZxG/KKXKDOhm8j6BOi9UdmZwa9Y67kOSNRPoc6aZLx3ZGIvs7pfsqzWUdun4gCiyu9isNpNl5iYSJrDFNIqPtbedj/q7kK2prGxhsCxF2Tkx+0Ejlgm6lI1RiLjZunHD+qU9GNA9oIYJi3AGUfQnufWXNskm3/OwieiNEzcfYSe3esSJ2jPubumoa2OfhDJcPQgVW1taBJu9s31pX0iAOeNCJRxvUWLY02YxwLSJ1i4MERMXkv++j9IA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L7RZBvqq; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L7RZBvqq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cs2Lh5bMCz2yjx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 19:26:20 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LLRIV1026091;
	Wed, 22 Oct 2025 08:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hHGdoX
	qZF7p6UDhW/i+tZoTr2H6F6ejSfwgRGcZOc5c=; b=L7RZBvqqbpnqWUNDB01Z3E
	rngskuawqQClfBRtjEzgW0d6HpLehjpsPJ+gGBzxl0o7yzMGp7Ly7Z6RZqEXvNrw
	gYKnAGiMnIvDgYh3inKc1AsQFQn4RENkRM7m4cTrHOAUiSi6O827nUv5yqiFC2fD
	ToFCGFTYlAd7S+xDnPs+ncHnDh2ak5Twg3pqs9vJUhJ0UCYGWLlluIVytSs5kFjA
	MbsfI53BwW96krPWmNOaTJSZbF4sCn1Phjj1h/SuycKmAxrzNK5ssqeZzY0bEV/T
	0rm7Rp/yd/JeKd6GOHMVyRGMTIsWjt66rWWO3WyzIMJXXqjGO5bqDzNqa2rryPTA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v326uk7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 08:26:10 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59M7kOMc024686;
	Wed, 22 Oct 2025 08:26:09 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49vpqjy7xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Oct 2025 08:26:09 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59M8Q8xq31654550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Oct 2025 08:26:08 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9049C58065;
	Wed, 22 Oct 2025 08:26:08 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F56858056;
	Wed, 22 Oct 2025 08:26:06 +0000 (GMT)
Received: from [9.61.248.143] (unknown [9.61.248.143])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 Oct 2025 08:26:05 +0000 (GMT)
Message-ID: <d718ee80-d97e-4f0f-b1f2-692626a19b1d@linux.ibm.com>
Date: Wed, 22 Oct 2025 13:56:04 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [next-20251022] Kernel Boot Warnings at
 arch/powerpc/kernel/trace/ftrace.c:234
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
To: LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>, joe.lawrence@redhat.com,
        Naveen N Rao <naveen@kernel.org>
References: <72469502-ca37-4287-90b9-a751cecc498c@linux.ibm.com>
In-Reply-To: <72469502-ca37-4287-90b9-a751cecc498c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=EJELElZC c=1 sm=1 tr=0 ts=68f89523 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=X1xm8aspWHkySpns4nUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX9s8ifp2QaYSY
 CByUZt9PumhdzLOI60y53WVLdcLEBs5znyEBD2LisChdT8PRy+oc+L373U+rmBqFBv7xAit+ghV
 rnFXaMC3WGulA7xJ/72/Hen6lO7fesMCZ/pY820HV9f/iQ2HbFHHVOaeXG0YXy7t/zoBNme8LTn
 FcL/8yOtWdy8wIZzDd5k6GuFGUtwl9WqfOBByntxVB93k/OH0n9LyJLZKRJ1ajkyFUFzUKgdGHn
 kgpguB+o5tDqRyb0vh69Smk365qHkNlwAYSCC/UBNlJjIk978fuR5hxfKYYig4XB+CSzJJ22Y2i
 1bwtzHf6Q0+DMXeDYLLqei9EpqK/puKcv88yBt3VsVcDfJ8I2gZpBal/Z+xLsBHnPwJp2kciYbt
 GSAyIQAwhwIl/IVoS6P8Heiz1UKQug==
X-Proofpoint-GUID: LXwn_AOwU_brLL-RRXisZ0RQKSQPJm8z
X-Proofpoint-ORIG-GUID: LXwn_AOwU_brLL-RRXisZ0RQKSQPJm8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 22/10/25 1:52 pm, Venkat Rao Bagalkote wrote:
> Greetings!!!
>
>
> IBM CI has reported kernel boot warnings with next-20251022 kernel. I 
> see there are couple of warnings hit and eventually system boots to 
> emergency mode.
>
>
> Traces:
>
>
> [    0.000000] stackdepot: allocating space for 8191 stack pools via 
> memblock
> [    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=48, 
> Nodes=32
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: arch/powerpc/kernel/trace/ftrace.c:234 at 
> ftrace_init_ool_stub+0x188/0x3f4, CPU#0: swapper/0
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 
> 6.18.0-rc2-next-20251022+ #1 VOLUNTARY
> [    0.000000] Hardware name: IBM,9080-HEX Power11 (architected) 
> 0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
> [    0.000000] NIP:  c000000000092430 LR: c000000000092414 CTR: 
> 0000000000000000
> [    0.000000] REGS: c000000004ba7a70 TRAP: 0700   Not tainted 
> (6.18.0-rc2-next-20251022+)
> [    0.000000] MSR:  8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 
> 44022224  XER: 00000001
> [    0.000000] CFAR: c0000000008d7114 IRQMASK: 3
> [    0.000000] GPR00: c000000000508de0 c000000004ba7d10 
> c00000000248a400 c000000004ce9720
> [    0.000000] GPR04: c000000007335df8 00000000000000c0 
> c000000000092414 0000000000000000
> [    0.000000] GPR08: 0000000000000003 0000000000000001 
> 0000000000000000 0000000000002000
> [    0.000000] GPR12: c00e0000008ce3a6 c0000000050b0000 
> 0000000000000003 0000000000000001
> [    0.000000] GPR16: c000000007335df8 0000000000000000 
> c0000000045a8ac0 c000000004c2d450
> [    0.000000] GPR20: c0000000070e0108 c0000000070e0110 
> 0000000000000013 000000000000c869
> [    0.000000] GPR24: c000000004ce9720 000000000000393f 
> c000000007335e08 c000000001879a78
> [    0.000000] GPR28: c000000001a10230 0000000000003940 
> 0000000000000000 c000000007335df8
> [    0.000000] NIP [c000000000092430] ftrace_init_ool_stub+0x188/0x3f4
> [    0.000000] LR [c000000000092414] ftrace_init_ool_stub+0x16c/0x3f4
> [    0.000000] Call Trace:
> [    0.000000] [c000000004ba7d10] [c0000000000925c0] 
> ftrace_init_ool_stub+0x318/0x3f4 (unreliable)
> [    0.000000] [c000000004ba7de0] [c000000000508de0] 
> ftrace_process_locs+0x364/0x8e0
> [    0.000000] [c000000004ba7ee0] [c000000003060908] 
> ftrace_init+0x68/0x1c8
> [    0.000000] [c000000004ba7f50] [c00000000300ee6c] 
> start_kernel+0x1e4/0x4fc
> [    0.000000] [c000000004ba7fe0] [c00000000000e9a0] 
> start_here_common+0x1c/0x20
> [    0.000000] Code: 1d290018 7f9c4a14 3bbd0001 7f03c378 48844ca5 
> 60000000 39400000 7f9dc800 39200001 7c1dc800 93b80000 7d29575e 
> <0b090000> 4181005c 7fe3fb78 3b3c0008
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] ------------[ ftrace bug ]------------
> [    0.000000] ftrace failed to modify
> [    0.000000] [<c000000001879a78>] ip6mr_vif_seq_stop+0x0/0x8
> [    0.000000]  actual:   00:00:00:60
> [    0.000000] Initializing ftrace call sites
> [    0.000000] ftrace record flags: 0
> [    0.000000]  (0)
> [    0.000000]  expected tramp: c000000000093490
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: kernel/trace/ftrace.c:2209 at 
> ftrace_bug+0x168/0x49c, CPU#0: swapper/0
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Tainted: G   W       
>    6.18.0-rc2-next-20251022+ #1 VOLUNTARY
> [    0.000000] Tainted: [W]=WARN
> [    0.000000] Hardware name: IBM,9080-HEX Power11 (architected) 
> 0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
> [    0.000000] NIP:  c000000000508748 LR: c000000000508744 CTR: 
> 0000000000000000
> [    0.000000] REGS: c000000004ba7a90 TRAP: 0700   Tainted: G   W     
>       (6.18.0-rc2-next-20251022+)
> [    0.000000] MSR:  8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 
> 28028220  XER: 00000001
> [    0.000000] CFAR: c0000000003880f8 IRQMASK: 3
> [    0.000000] GPR00: c000000000508744 c000000004ba7d30 
> c00000000248a400 0000000000000022
> [    0.000000] GPR04: 0000000000000004 0000000000000000 
> c00000000027abec 0000000000000001
> [    0.000000] GPR08: 0000000000000001 0000000000000000 
> 0000000000000000 a80e000000000000
> [    0.000000] GPR12: c00e00000081c5d8 c0000000050b0000 
> 0000000000000003 0000000000000001
> [    0.000000] GPR16: c000000007335df8 0000000000000000 
> c0000000045a8ac0 c000000004c2d450
> [    0.000000] GPR20: c0000000070e0108 c0000000070e0110 
> 0000000000000013 000000000000c869
> [    0.000000] GPR24: 0000000000000000 0000000000000000 
> 000000000000b93f 0000000000000000
> [    0.000000] GPR28: c000000001879a78 c000000001b93d20 
> c000000007335df8 c000000007335e00
> [    0.000000] NIP [c000000000508748] ftrace_bug+0x168/0x49c
> [    0.000000] LR [c000000000508744] ftrace_bug+0x164/0x49c
> [    0.000000] Call Trace:
> [    0.000000] [c000000004ba7d30] [c000000000508744] 
> ftrace_bug+0x164/0x49c (unreliable)
> [    0.000000] [c000000004ba7de0] [c000000000508dfc] 
> ftrace_process_locs+0x380/0x8e0
> [    0.000000] [c000000004ba7ee0] [c000000003060908] 
> ftrace_init+0x68/0x1c8
> [    0.000000] [c000000004ba7f50] [c00000000300ee6c] 
> start_kernel+0x1e4/0x4fc
> [    0.000000] [c000000004ba7fe0] [c00000000000e9a0] 
> start_here_common+0x1c/0x20
> [    0.000000] Code: 7fe3fb78 483cea79 60000000 e93e0008 75290800 
> 40820164 7fc3f378 4bfffa19 7c641b78 387d0fe0 4be7f975 60000000 
> <0fe00000> 39000001 3ce2027a 3d22fdc1
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] ftrace: allocating 51305 entries in 19 pages

Pasting the traces in more legible form.


[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] stackdepot: allocating hash table via alloc_large_system_hash
[    0.000000] stackdepot hash table entries: 1048576 (order: 8, 
16777216 bytes, linear)
[    0.000000] stackdepot: allocating space for 8191 stack pools via 
memblock
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=48, Nodes=32
[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: arch/powerpc/kernel/trace/ftrace.c:234 at 
ftrace_init_ool_stub+0x188/0x3f4, CPU#0: swapper/0
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 
6.18.0-rc2-next-20251022+ #1 VOLUNTARY
[    0.000000] Hardware name: IBM,9080-HEX Power11 (architected) 
0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
[    0.000000] NIP:  c000000000092430 LR: c000000000092414 CTR: 
0000000000000000
[    0.000000] REGS: c000000004ba7a70 TRAP: 0700   Not tainted 
(6.18.0-rc2-next-20251022+)
[    0.000000] MSR:  8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 
44022224  XER: 00000001
[    0.000000] CFAR: c0000000008d7114 IRQMASK: 3
[    0.000000] GPR00: c000000000508de0 c000000004ba7d10 c00000000248a400 
c000000004ce9720
[    0.000000] GPR04: c000000007335df8 00000000000000c0 c000000000092414 
0000000000000000
[    0.000000] GPR08: 0000000000000003 0000000000000001 0000000000000000 
0000000000002000
[    0.000000] GPR12: c00e0000008ce3a6 c0000000050b0000 0000000000000003 
0000000000000001
[    0.000000] GPR16: c000000007335df8 0000000000000000 c0000000045a8ac0 
c000000004c2d450
[    0.000000] GPR20: c0000000070e0108 c0000000070e0110 0000000000000013 
000000000000c869
[    0.000000] GPR24: c000000004ce9720 000000000000393f c000000007335e08 
c000000001879a78
[    0.000000] GPR28: c000000001a10230 0000000000003940 0000000000000000 
c000000007335df8
[    0.000000] NIP [c000000000092430] ftrace_init_ool_stub+0x188/0x3f4
[    0.000000] LR [c000000000092414] ftrace_init_ool_stub+0x16c/0x3f4
[    0.000000] Call Trace:
[    0.000000] [c000000004ba7d10] [c0000000000925c0] 
ftrace_init_ool_stub+0x318/0x3f4 (unreliable)
[    0.000000] [c000000004ba7de0] [c000000000508de0] 
ftrace_process_locs+0x364/0x8e0
[    0.000000] [c000000004ba7ee0] [c000000003060908] ftrace_init+0x68/0x1c8
[    0.000000] [c000000004ba7f50] [c00000000300ee6c] 
start_kernel+0x1e4/0x4fc
[    0.000000] [c000000004ba7fe0] [c00000000000e9a0] 
start_here_common+0x1c/0x20
[    0.000000] Code: 1d290018 7f9c4a14 3bbd0001 7f03c378 48844ca5 
60000000 39400000 7f9dc800 39200001 7c1dc800 93b80000 7d29575e 
<0b090000> 4181005c 7fe3fb78 3b3c0008
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ------------[ ftrace bug ]------------
[    0.000000] ftrace failed to modify
[    0.000000] [<c000000001879a78>] ip6mr_vif_seq_stop+0x0/0x8
[    0.000000]  actual:   00:00:00:60
[    0.000000] Initializing ftrace call sites
[    0.000000] ftrace record flags: 0
[    0.000000]  (0)
[    0.000000]  expected tramp: c000000000093490
[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: kernel/trace/ftrace.c:2209 at 
ftrace_bug+0x168/0x49c, CPU#0: swapper/0
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Tainted: G   W        
    6.18.0-rc2-next-20251022+ #1 VOLUNTARY
[    0.000000] Tainted: [W]=WARN
[    0.000000] Hardware name: IBM,9080-HEX Power11 (architected) 
0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
[    0.000000] NIP:  c000000000508748 LR: c000000000508744 CTR: 
0000000000000000
[    0.000000] REGS: c000000004ba7a90 TRAP: 0700   Tainted: G   W        
     (6.18.0-rc2-next-20251022+)
[    0.000000] MSR:  8000000002021033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 
28028220  XER: 00000001
[    0.000000] CFAR: c0000000003880f8 IRQMASK: 3
[    0.000000] GPR00: c000000000508744 c000000004ba7d30 c00000000248a400 
0000000000000022
[    0.000000] GPR04: 0000000000000004 0000000000000000 c00000000027abec 
0000000000000001
[    0.000000] GPR08: 0000000000000001 0000000000000000 0000000000000000 
a80e000000000000
[    0.000000] GPR12: c00e00000081c5d8 c0000000050b0000 0000000000000003 
0000000000000001
[    0.000000] GPR16: c000000007335df8 0000000000000000 c0000000045a8ac0 
c000000004c2d450
[    0.000000] GPR20: c0000000070e0108 c0000000070e0110 0000000000000013 
000000000000c869
[    0.000000] GPR24: 0000000000000000 0000000000000000 000000000000b93f 
0000000000000000
[    0.000000] GPR28: c000000001879a78 c000000001b93d20 c000000007335df8 
c000000007335e00
[    0.000000] NIP [c000000000508748] ftrace_bug+0x168/0x49c
[    0.000000] LR [c000000000508744] ftrace_bug+0x164/0x49c
[    0.000000] Call Trace:
[    0.000000] [c000000004ba7d30] [c000000000508744] 
ftrace_bug+0x164/0x49c (unreliable)
[    0.000000] [c000000004ba7de0] [c000000000508dfc] 
ftrace_process_locs+0x380/0x8e0
[    0.000000] [c000000004ba7ee0] [c000000003060908] ftrace_init+0x68/0x1c8
[    0.000000] [c000000004ba7f50] [c00000000300ee6c] 
start_kernel+0x1e4/0x4fc
[    0.000000] [c000000004ba7fe0] [c00000000000e9a0] 
start_here_common+0x1c/0x20
[    0.000000] Code: 7fe3fb78 483cea79 60000000 e93e0008 75290800 
40820164 7fc3f378 4bfffa19 7c641b78 387d0fe0 4be7f975 60000000 
<0fe00000> 39000001 3ce2027a 3d22fdc1
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] ftrace: allocating 51305 entries in 19 pages
[    0.000000] ftrace: allocated 19 pages with 3 groups
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.

>
>
>
> Attached is the config file.
>
>
> If you happen to fix this, please add below tag.
>
>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>
>
> Regards,
>
> Venkat.
>

