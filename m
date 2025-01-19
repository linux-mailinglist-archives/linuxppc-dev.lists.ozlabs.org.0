Return-Path: <linuxppc-dev+bounces-5380-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DE0A162F5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jan 2025 17:36:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YbfJ42yH4z2xH8;
	Mon, 20 Jan 2025 03:36:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737304612;
	cv=none; b=VzjN2r+9JHTDPKFzXnznruFgQ/cgwVeDRdUl4C/IumBmV2pXX0nyBbegGoA2zKndylXL2UjjJ+Wl5f7A2dsHa1ShhE/WO++4gls5lq5mjvqsFBgcJWVING/wWJoglKeLeNXI9H2e6ecbUIKZ++8PiQowRbzkhRapFnDBEpFLlZDs1+WyWFuUoFhRCKdWASteIAYRZRlXMk6rDWHSdcFDgwFDtOr3pNcPfeJZY+rGoAVBPAWdxrQDifRhhVYUu424ANbnVosh2m9jwesLUi99PpKaish+GMZFOumo1F5495zexL11raGRDwkrjbY7cbH+uh6KladFZHQCZr483y9BIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737304612; c=relaxed/relaxed;
	bh=40bhPo8FzN3SovIqKpsDUG2Zub8dePgDNJlg8sHYt6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OEJNhDlpH84fja7HR/YjNBcJp777U5T71KedzkQvS+87wpmsvx45w8vHE7qMEq834w1sRHZqDT/0pqZM3ChME79Ow+qesulf8KJUQJWy1Et0FOLQ2RqTqmS+Jerkm6QtCd6yWS8vKq6/Opch542jcFjYgruzS+5/gqgyBt4txIq2wzMzoZh/shxbMCuDP5k7LRIyA80dYcAZOIC3FOZ5NEjxcE2HC9oXM7slQYQFuDd5x2eHvAj51oASSXxVwfVKmIMY0+u7G1VEKFHXW4QjyrCaFjDWDJRHLd1nYUILbJhR+IsPmLugqws6WS3L2estjQ1w9aEAU7d3wCpN+Uc1QA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lPoE5JTa; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lPoE5JTa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YbfJ3449Hz2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 03:36:51 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JFeNdE028959;
	Sun, 19 Jan 2025 16:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=40bhPo
	8FzN3SovIqKpsDUG2Zub8dePgDNJlg8sHYt6s=; b=lPoE5JTak4cgME/dQva7D/
	HzmwEIHY6JGTAaphMKHxH7a2oRFMTgLG73SdbKj8HgtsfoVz6Si/RSbyHRJQp7G3
	3LY+BxkGc82US+cDaO62ibmF6ePTOSe8tktKiAagZmLgAFIBuelhGn6w6ZehKrLC
	PE2uU2dyb1L2dJS88wkX1OPHtmWwWYud+CIPf798MC1ePogvDayIe+KRJxvoP7Zv
	Te2SjltS02ssLiwsrJUjKrQBAJwIiFotui0mQ7PKlNQhVPjy82KRj3DRrUPGXdbe
	22qDpppyzws61y89aj7paQ2BC4Kvo4u2KMVFb0qPKUcnKR8M/L+2bAVXgLSCMjWg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44947sr41p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 16:36:48 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50JCKUHD022449;
	Sun, 19 Jan 2025 16:36:48 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448r4jtev5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 16:36:48 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50JGalcZ27853452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 19 Jan 2025 16:36:48 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E435658055;
	Sun, 19 Jan 2025 16:36:47 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2CF875804B;
	Sun, 19 Jan 2025 16:36:46 +0000 (GMT)
Received: from [9.43.71.72] (unknown [9.43.71.72])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 19 Jan 2025 16:36:45 +0000 (GMT)
Message-ID: <af04e91f-0f44-457e-9550-d1d49789158e@linux.ibm.com>
Date: Sun, 19 Jan 2025 22:06:42 +0530
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
Subject: Re: BUG: KASAN: vmalloc-out-of-bounds in
 copy_to_kernel_nofault+0xd8/0x1c8 (v6.13-rc6, PowerMac G4)
To: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org
References: <20250112135832.57c92322@yea>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20250112135832.57c92322@yea>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: x5sBIss0bzzGu3Y7-RTcO8QQEmjn9Ttz
X-Proofpoint-ORIG-GUID: x5sBIss0bzzGu3Y7-RTcO8QQEmjn9Ttz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-19_03,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=482
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1011 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501190129
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 1/12/25 6:28 PM, Erhard Furtner wrote:
> Greetings!
> 
> I am getting this at bootup on my PowerMac G4 with a KASAN-enabled kernel 6.13-rc6:

Sorry for the delayed response,

Are you seeing this only in this kernel or this is the recent
kernel you tried to boot?

Maddy

> 
> [...]
> BUG: KASAN: vmalloc-out-of-bounds in copy_to_kernel_nofault+0xd8/0x1c8
> Write of size 8 at addr f1000000 by task chronyd/1293
> 
> CPU: 0 UID: 123 PID: 1293 Comm: chronyd Tainted: G        W          6.13.0-rc6-PMacG4 #2
> Tainted: [W]=WARN
> Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
> Call Trace:
> [c2437590] [c1631a84] dump_stack_lvl+0x70/0x8c (unreliable)
> [c24375b0] [c0504998] print_report+0xdc/0x504
> [c2437610] [c050475c] kasan_report+0xf8/0x108
> [c2437690] [c0505a3c] kasan_check_range+0x24/0x18c
> [c24376a0] [c03fb5e4] copy_to_kernel_nofault+0xd8/0x1c8
> [c24376c0] [c004c014] patch_instructions+0x15c/0x16c
> [c2437710] [c00731a8] bpf_arch_text_copy+0x60/0x7c
> [c2437730] [c0281168] bpf_jit_binary_pack_finalize+0x50/0xac
> [c2437750] [c0073cf4] bpf_int_jit_compile+0xb30/0xdec
> [c2437880] [c0280394] bpf_prog_select_runtime+0x15c/0x478
> [c24378d0] [c1263428] bpf_prepare_filter+0xbf8/0xc14
> [c2437990] [c12677ec] bpf_prog_create_from_user+0x258/0x2b4
> [c24379d0] [c027111c] do_seccomp+0x3dc/0x1890
> [c2437ac0] [c001d8e0] system_call_exception+0x2dc/0x420
> [c2437f30] [c00281ac] ret_from_syscall+0x0/0x2c
> --- interrupt: c00 at 0x5a1274
> NIP:  005a1274 LR: 006a3b3c CTR: 005296c8
> REGS: c2437f40 TRAP: 0c00   Tainted: G        W           (6.13.0-rc6-PMacG4)
> MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 24004422  XER: 00000000
> 
> GPR00: 00000166 af8f3fa0 a7ee3540 00000001 00000000 013b6500 005a5858 0200f932 
> GPR08: 00000000 00001fe9 013d5fc8 005296c8 2822244c 00b2fcd8 00000000 af8f4b57 
> GPR16: 00000000 00000001 00000000 00000000 00000000 00000001 00000000 00000002 
> GPR24: 00afdbb0 00000000 00000000 00000000 006e0004 013ce060 006e7c1c 00000001 
> NIP [005a1274] 0x5a1274
> LR [006a3b3c] 0x6a3b3c
> --- interrupt: c00
> 
> The buggy address belongs to the virtual mapping at
>  [f1000000, f1002000) created by:
>  text_area_cpu_up+0x20/0x190
> 
> The buggy address belongs to the physical page:
> page: refcount:1 mapcount:0 mapping:00000000 index:0x0 pfn:0x76e30
> flags: 0x80000000(zone=2)
> raw: 80000000 00000000 00000122 00000000 00000000 00000000 ffffffff 00000001
> raw: 00000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>  f0ffff00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>  f0ffff80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>> f1000000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>            ^
>  f1000080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>  f1000100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
> ==================================================================
> Disabling lock debugging due to kernel taint
> 
> 
> Kernel .config and full dmesg attached. The other 2 warnings in the dmesg, "workqueue: work disable count underflowed" are https://lore.kernel.org/all/CA+G9fYsQmFT3m1J0uGfWGJjci8MQoB7BNcmhBR175PAbxx9fBg@mail.gmail.com/ (offending commit should be reverted in next -rc) and "Missing '#size-cells'" is fixed by https://lore.kernel.org/all/87jzbqpnd9.fsf@mpe.ellerman.id.au/ (not yet merged)
> 
> Regards,
> Erhard


