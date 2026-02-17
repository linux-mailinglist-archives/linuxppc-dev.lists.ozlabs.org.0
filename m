Return-Path: <linuxppc-dev+bounces-16895-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM0uOzpAlGlhBQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16895-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 11:17:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0859314AC20
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 11:17:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFbDQ37txz2yS4;
	Tue, 17 Feb 2026 21:17:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771323446;
	cv=none; b=InYMqKqC4rZrI86yNSQ3MRRXHgBrQzOJe9cxymhHmfwDK6G7umZiO0zwFPQ3Vu+6rInWgZVutpQBb3TDNZx6fR3vU2NIB+iWDdoMGPHU6LM7nGD5/Qu6mecBHln+Sqyr98cPpuDf5BS5G7kO8FQd569HWwAQ5AOepLTqsLdpydMcpvgzQW1OMh55DeDJumz/FftIx5mKNEFmlQKndwbrM5pdHWnDoA4FHV1lSjHOk/BoyCN51Hyy73jTh7jL5tJJV9s0KwtV5SZz5Ya484EM2a002clvERnPt5hDuLeyEKQhRgIwP99d677cdpeLZVg5evznTaQUwTzD/Oy7Z9hOKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771323446; c=relaxed/relaxed;
	bh=+6iA2uNRmnZSVEpafscIuv5WMCH1FcjhX/ZZhkOReuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qsatc0WI7tVDF/blOZBKF0RtR6vRQiUFAwtlKSjANWBdaLgunSflG2GVqyzZQSKsi56sK0FmFKi9P2gnr8CXJqZwIuKnYe7O5gqdiYCGC3XmnZuaVmhhsITyw7Rliw/wiqvYkgzqy1NDOjmN5qzs9HQNUJa1L/oRTDK9VqtffH35juEqtbiyjFTn7yR3tK424oH2LPWyHv+gzxdfdOY8eP1eWblpbj7qG0t2VyYQwgRWwwfMoKYnJxwwnjK/T7+NDdqPnYV+UbyV6lS+qK+VjaTdYK1BK6iZ9XACE1aO3VGuT22MvZp6zFQwEZVFZxWghDTyQ2xcETgWAcUqjJxqTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XIftwzLG; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XIftwzLG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFbDP1lhSz2xN5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 21:17:24 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GKZeMp1711698;
	Tue, 17 Feb 2026 10:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+6iA2u
	NRmnZSVEpafscIuv5WMCH1FcjhX/ZZhkOReuQ=; b=XIftwzLGIdwvnFQevgDrXt
	r/VQdibOn+UpPq7PJmRbwQ4MUG5iJ8ItCcSN6u40N41uomURDvoa/iKTZoj+bZ7L
	SWXhljdzY8PoLQit2lliRGPIwuF3vrvJMZ23az+3rDTSQiktlujGKMemkVNJnli6
	VkdLTUFPAf0Qw2u+47VqPMeA52B/w4ljQ6+xtVoB19TcO+fYpGPJYxEbW/maLdDB
	lMa2nhyJYNY9x09e4MzEEQc0O0pNK1JqN8nCdvPlGdHMdxWkBvoFsf/3S/MZY8QV
	JHKYpriGYBH69E+t1QbVRHW8Vz/vefujzldTNLqDf+bpbXZBZ75gWk/4MYUU964w
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cajcjan1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 10:17:21 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61H8e9Jj017834;
	Tue, 17 Feb 2026 10:17:20 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ccb28a0ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 10:17:20 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61HAHJPm26215012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Feb 2026 10:17:19 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D28458053;
	Tue, 17 Feb 2026 10:17:19 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D149058043;
	Tue, 17 Feb 2026 10:17:15 +0000 (GMT)
Received: from [9.43.121.63] (unknown [9.43.121.63])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Feb 2026 10:17:15 +0000 (GMT)
Message-ID: <843b7c60-23f1-47d0-b4e8-2147c3e40c23@linux.ibm.com>
Date: Tue, 17 Feb 2026 15:47:14 +0530
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
Subject: Re: [Linux PPC] KVM PR and KVM HV do not work if the kernel was
 compiled with PREEMPT
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
        mad skateman <madskateman@gmail.com>,
        Christian Zigotzky <info@xenosoft.de>
References: <b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de>
 <185d7a42-f7b4-44e1-a129-f5989d211c74@linux.ibm.com>
 <40154f6a-39da-959d-e039-5ab9ff62db3c@xenosoft.de>
 <709b864f-9daa-4a48-b3d6-39baedce63b2@linux.ibm.com>
 <dbbb7998-5245-170f-626b-81bc75a32591@xenosoft.de>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <dbbb7998-5245-170f-626b-81bc75a32591@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: oreMLe4WS3_esCK7anyMavWBWdp5vZsY
X-Authority-Analysis: v=2.4 cv=Md9hep/f c=1 sm=1 tr=0 ts=69944031 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=tfuwDhRL1dsP2gdC5dUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA4NCBTYWx0ZWRfX/33nIj0QoIkx
 66tVpNwP7NfGJvkhbOxCWUfx/KCNvRagisUA6PaFPt/kQaetM73YZON+bzGDhI8cHqP0KYFLJmt
 dyJEtEp24JMvS0J4B13ZcHvaJ2F37pQ3LZfTrzWNAa0nxR53dmLIXKDSP7z34Uj1wMKV9tpbCLB
 LRRbVFHWODGDCU0VFYUsBekyDoj98n62tcfwxhGlkF2r/e1ah3/6FY0aWwo5Pn4Y07oldumtPm/
 AGOEJTLYmL9sAOmEH1WSagWmlVMWFIkWJYm0KDNMndwhMA4J7gieGlkNoTWK6JkotJ34M9h+VAW
 uh8E/H2oVPj2xZX5DuEBRwTvA0gxNwKvghc8yMbmG+yfiTDmhLdxZ6HytAGCjT7AhWA9Jcbb0Jd
 IiJz8o0KWymnPTsq8lkpFVeSFvbjORTcJnXKeUHuSyrMmBxzH+GEpzedN9Ie4ryxKP6U5hWAS4H
 bDVT4QeTRfc7KbDqFoA==
X-Proofpoint-GUID: jigts_LGIG5LnNiw4PGQWrA2zHLFBym-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170084
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16895-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chzigotzky@xenosoft.de,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[maddy@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[maddy@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0859314AC20
X-Rspamd-Action: no action


On 2/17/26 3:14 PM, Christian Zigotzky wrote:
> On 17/02/26 10:03, Shrikanth Hegde wrote:
>>
>>
>> On 2/17/26 2:22 PM, Christian Zigotzky wrote:
>>> Hi,
>>>
>>> Thank you for your patch. I tested the latest git kernel with your 
>>> patch today. Unfortunately the system freezes while booting the VM 
>>> with KVM HV.
>>>
>>> Cheers,
>>> Christian
>>>
>>>
>> Would it be possible to share the console log or boot log of KVM to the
>> point it freezes?
>
> Unfortunately there aren't any error messages.
>
> I also tried it with:
>
> gdb --args qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel 
> uImage-7.0-preempt -drive 
> format=raw,file=void-live-powerpc-20230317-updated2.img,index=0,if=virtio 
> -netdev user,id=mynet0 -device virtio-net,netdev=mynet0 -append "rw 
> root=/dev/vda" -device virtio-gpu-pci -device virtio-mouse-pci -device 
> virtio-keyboard-pci -enable-kvm -smp 4
>
> and with gdb in the guest:
>
> qemu-system-ppc64 -s -S -M ppce500 -cpu e5500 -m 1024 -kernel 
> uImage-7.0-preempt -drive 
> format=raw,file=void-live-powerpc-20230317-updated2.img,index=0,if=virtio 
> -netdev user,id=mynet0 -device virtio-net,netdev=mynet0 -append "rw 
> root=/dev/vda" -device virtio-gpu-pci -device virtio-mouse-pci -device 
> virtio-keyboard-pci -enable-kvm -smp 4
>
> The system freezed without any error messages.
can you please share the config.
I tried kvm-hv in my power8/power9 and seems to boot fine without any 
issues with today's upstream
Maddy

