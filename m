Return-Path: <linuxppc-dev+bounces-15347-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 485EDCFBD08
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 04:12:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmCks6M4Yz2yFq;
	Wed, 07 Jan 2026 14:12:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767755541;
	cv=none; b=EOd/jqUQvx0UInYnqBv7SU14PgaXZvSf5MqFev6BRLhU6TkqLtpcGuaTalh8D26eo5SFLsFflGUOd0CBXq66pJrpI3C7cv5fLJe60EYTAHGmPghHdBHbwSvrhyd99zNiR4XWoSCfBOY2JRjjHk7bJwsDJ9s3zPb5WuZvOczXrx1Acr3BZdwOIFYfy4alcwprMN3OgBqeN43AD9PjtSSE4CPY0Ii5ENdJzNzFPqyYhrM4q9hOGhQ9etYkokRC1k9mOJ/4i/DZXGLxdr+ruOOk43Plsbwo1mFE65n0/jL2q24ljNXcFacEobqYUpKI/M+4qbdU9cg4NZqTSe0UJ1+DOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767755541; c=relaxed/relaxed;
	bh=3pdEtf5PGuiqs9+a/E85cEteIo2F6atXr/LDASHbo+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HPP/6KN8Ocb8xNIDrOSbEZL+XeOgXrey8aVjfWddbwRNqT5R+fs5VEf1vUTW3ZJqg0LwGt2FRIskl8lyIMdTB5EsOUvPsFW1JwVvNwKNTmiI0aKbbx89pPfqK6qCEBPG55XD1PsGoffFVlkBkUFbjmxdwouv7bKH7lC5SR8O+D7IXQYjSDVBX6RR+K52DaQeqOeWCPGgxEF5zcn2e30tPMBGYxUhUOcwfHVpNZfhqqA+4PZ7YB1Rt1LmOvjXKby6Nb828nEMPRUiittANONiJ2X5TusQ7+P2m4ahkvt4OZqdMJqetn6LvND5YGY3lVkg6Kx8lpn/gO4T1lzTJWHE5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ejseCAVR; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ejseCAVR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmCkr6370z2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 14:12:20 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 606HKf4c018509;
	Wed, 7 Jan 2026 03:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=3pdEtf
	5PGuiqs9+a/E85cEteIo2F6atXr/LDASHbo+I=; b=ejseCAVRngkEh/zQcGbAVm
	HxF4BH3etAL9V56hT3cw/DXdlB4ZBQoZWg14v92L+nfK/TEmXOPHJRPNov689vMO
	CYVem2aP72CWtaITmBXOy7UsNdSxZLobs7A56cDUXG+3RQIsz9aT2beUl58UNTCD
	rBFKR8FJWMeHI/AgedJK3QwlzbvoQKTA3nmqDF2Ww5gBQqdSP1oV84SYB7HGffCo
	PcGHfmDXQvZUFUM+dBC6LtQifGFe2LUS5N7ygYNUvC1v5p+7MYokY6JgAHQGuWgw
	vc0YCOZps3aFmpMe6bDCsykvUm0IpFZm88nI/PCk5oWeAp6nMJMHKKPEDdWBmxWQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betu66s9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 03:11:34 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60735nAC011705;
	Wed, 7 Jan 2026 03:11:34 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betu66s9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 03:11:33 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60738ece005206;
	Wed, 7 Jan 2026 03:11:32 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bfexk6us5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 03:11:32 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6073BDA58454670
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jan 2026 03:11:13 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 360755826C;
	Wed,  7 Jan 2026 03:11:31 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D1B958263;
	Wed,  7 Jan 2026 03:11:22 +0000 (GMT)
Received: from [9.109.209.83] (unknown [9.109.209.83])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jan 2026 03:11:22 +0000 (GMT)
Message-ID: <6419f23b-01bb-4ccd-89a9-2a606bc984eb@linux.ibm.com>
Date: Wed, 7 Jan 2026 08:41:16 +0530
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
Subject: Re: [PATCH bpf-next v4 0/2] powerpc64/bpf: Inline helper in powerpc
 JIT
To: Hari Bathini <hbathini@linux.ibm.com>,
        Andrii Nakryiko <andrii.nakryiko@gmail.com>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, sachinpb@linux.ibm.com,
        venkat88@linux.ibm.com, andrii@kernel.org, eddyz87@gmail.com,
        ast@kernel.org, daniel@iogearbox.net, martin.lau@linux.dev,
        song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
        kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
        jolsa@kernel.org, christophe.leroy@csgroup.eu, naveen@kernel.org,
        mpe@ellerman.id.au, npiggin@gmail.com
References: <cover.1765343385.git.skb99@linux.ibm.com>
 <CAEf4BzbiyJwSoaSRDtSRetze-yST-NQX83FyECSmRex9szx0NQ@mail.gmail.com>
 <aca5ed6d-8d39-4968-aef2-d5ab6c8cfb60@linux.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <aca5ed6d-8d39-4968-aef2-d5ab6c8cfb60@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=QbNrf8bv c=1 sm=1 tr=0 ts=695dcee6 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=Z0ByAkKCtCMuyWjYBMoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: gX-3G8r6ILoIAHtb1Ncg7n4IG0NJ5FS6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDAyMSBTYWx0ZWRfXwTH1qfpW6GPY
 UqlcFcquFTX9rVoZ6S5imz/IeJ0enxiG5VxSxU4ZTHyte8Fb+d2fKKsXXNrBcg1HKV2shxNjU0E
 qpDVoF53QA1bePRzDw0OlEzwru01F0/Yrf3L0StxtXVP0rzRINDAjP4IxV0ALtRRjCiQ2lNQBXn
 9L8DdtHiYEUJ/aKF/aqlnKqh2oC/nvgPF72nGIHzXwm+WP+B0Z+PPpilmMZqbM/wzd48B1xuEoA
 SwodtZgnm0mDwdlDmrOkSUcJCSpg+Rd5T6qJeRBsAK7oWKdsdqSvta+2VCatuGPoELRG7DY10Gr
 tmcThxdHd+d+v5jCBMCpuNAgkBI68N1Odl6B2SRPGcDtu3cRc9emq1OQsfsDShBMBsHIukqoIdY
 VVRNUlBLRRHs7DXVj3ebwxmjtHJC6PFXbo4BOFV8oOYQtOe9qGA/DgCfV2tax32dhav3z3oCioh
 oCx875ShypZW43ZvLHg==
X-Proofpoint-GUID: uOONuWptlDBKye8tgyCDCEf4NVW109OR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601070021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 12/17/25 10:43 AM, Hari Bathini wrote:
>
>
> On 16/12/25 11:46 pm, Andrii Nakryiko wrote:
>> On Tue, Dec 9, 2025 at 10:51 PM Saket Kumar Bhaskar 
>> <skb99@linux.ibm.com> wrote:
>>>
>>> This series add support for internal only per-CPU instructions,
>>> inlines the bpf_get_smp_processor_id() and bpf_get_current_task()
>>> helper calls for powerpc BPF JIT.
>>>
>>
>> This is marked for bpf-next tree, but I think this should actually go
>> through ppc64-specific tree, is that right?
>
> Yeah.
> Maddy, can you pick it via powerpc tree?

Yep, will pull this via powerpc tree.
Maddy


>
> - Hari

