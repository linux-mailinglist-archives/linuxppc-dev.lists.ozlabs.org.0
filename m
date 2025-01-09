Return-Path: <linuxppc-dev+bounces-4892-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 150B4A06D97
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 06:32:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTD283kjbz30gd;
	Thu,  9 Jan 2025 16:32:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736400752;
	cv=none; b=UN1YGAIQtsVmKYtd02pKsOogyrFFCQ7r/82C6L6G2BDm2EAh4t6flb0xRbf+x6qxrQhBvm127oTjgOPnJqZpumMGfl5f0ysdRtPIf4kABUesK6WsIxEARxjgwDz03WioCXE264MlQqb1q3AchzX8agQ9IQ7dPXMu+vLxUGdifqlVd2bT6LLXtnaLN3AxD7SJn1N+Sph4rSvNNZIY0IMwaIKY0u7C7L/Srq+vfKb4TgILRcb6llC1QhVBawE4uDCAoFp806ZbCbKI4N7Vx7iUnQPp3qVrh2m3DpkZe3txEKvnv1qNEAkitnHDxhQ6ErFjPKq639I9yWpMfGh9nd+XRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736400752; c=relaxed/relaxed;
	bh=h5j9sM6ZygV6v/cZEi3e0Oz3FL1wLmqSFPtHaDymFco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F9MPpAIpZ+nyUNO6fHEbqGGKBRsFRleB08WpWrYv06fdojzHrJRna/Hf0WsNXtV2bXZmzbBNHkpF4rVKnbqYfYy8guT66SAk+ASreEYNyZ3ebpheAMY9/sYGHF2sVwKjD/YqwX8AwWXpVophkCzBQ+2iGGN6ZPM+1KwVmuWB3TKXh/6QoJXPmyRg0c13Rm9F0JSFu4JRkaY1CBUG15bb3oaRgWmDny/IA5AqZ6hZtnl6t/zi+yMT3xhcN1sZtIAxJE+o6IlW8XiSsX4IYdAEBLV/vfT/Ii3oIZTKOtumYKPLra+5icOsMsvACgARTrOaA6mIwG6Ehkh/5jqhWRGCnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nbHkyLGS; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nbHkyLGS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTD271MGWz30gL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 16:32:30 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508Nx5Sk017951;
	Thu, 9 Jan 2025 05:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=h5j9sM
	6ZygV6v/cZEi3e0Oz3FL1wLmqSFPtHaDymFco=; b=nbHkyLGS//ZO/uZG07+aBh
	3l3E1fwMlY0/zZ98hcYe9aQMNUWJ/uDYrvgJUs9F2RsIgZzMVXRfDKBwnOFCpo72
	XnneLjhgCMrmYgamp40G3ZBivYcSSeDoaBMDPVIp+gVoMiXzYMANbYSXi1z8D3AU
	gILv05gAyBr9vv67vbmYFIdcL6/spPXYxntK8YbSDjxAg57W91RtZFZFBNs8NVP3
	SV68vj9LBWEfrMqMramHm53zBMhQaGXTkI1xlDbYJD6YnyqWz2sapbsESkuG/oX4
	FL1XIr26HnD0QeX8imzHc9i+YrdvN6nN+L3Ymdtgkh+JSzGob2bOokD0JZb2mDDg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4423ghs47e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 05:32:17 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5093IKj7004143;
	Thu, 9 Jan 2025 05:32:16 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yfatbt2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 05:32:16 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5095WD6i49217824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 05:32:13 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0820D2004B;
	Thu,  9 Jan 2025 05:32:13 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5852620049;
	Thu,  9 Jan 2025 05:32:10 +0000 (GMT)
Received: from [9.43.18.121] (unknown [9.43.18.121])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jan 2025 05:32:10 +0000 (GMT)
Message-ID: <5c814eef-b4e4-4afc-a394-c17857da8a07@linux.ibm.com>
Date: Thu, 9 Jan 2025 11:02:08 +0530
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
Subject: Re: [PATCH] kexec: Initialize ELF lowest address to ULONG_MAX
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>, ebiederm@xmission.com,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20241210091314.185785-1-sourabhjain@linux.ibm.com>
 <Z1pQoh7IwtERIWe5@MiWiFi-R3L-srv>
 <ea2d2f5d-5410-4f7e-a3f5-258c432e9be9@linux.ibm.com>
 <20250108212813.ebc0014e384e9996ab72db40@linux-foundation.org>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20250108212813.ebc0014e384e9996ab72db40@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WTn7GuVs0jUb3wRC6a6crfU-Oz7_JEjL
X-Proofpoint-ORIG-GUID: WTn7GuVs0jUb3wRC6a6crfU-Oz7_JEjL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090043
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Andrew,

On 09/01/25 10:58, Andrew Morton wrote:
> On Thu, 9 Jan 2025 09:42:14 +0530 Sourabh Jain <sourabhjain@linux.ibm.com> wrote:
>
>> Hello Baoquan and Eric,
>>
>>
>> On 12/12/24 08:25, Baoquan he wrote:
>>> On 12/10/24 at 02:43pm, Sourabh Jain wrote:
>>>> kexec_elf_load() loads an ELF executable and sets the address of the
>>>> lowest PT_LOAD section to the address held by the lowest_load_addr
>>>> function argument.
>>>>
>>>> To determine the lowest PT_LOAD address, a local variable lowest_addr
>>>> (type unsigned long) is initialized to UINT_MAX. After loading each
>>>> PT_LOAD, its address is compared to lowest_addr. If a loaded PT_LOAD
>>>> address is lower, lowest_addr is updated. However, setting lowest_addr
>>>> to UINT_MAX won't work when the kernel image is loaded above 4G, as the
>>>> returned lowest PT_LOAD address would be invalid. This is resolved by
>>>> initializing lowest_addr to ULONG_MAX instead.
>>>>
>>>> This issue was discovered while implementing crashkernel high/low
>>>> reservation on the PowerPC architecture.
>>>>
>>>> Fixes: a0458284f062 ("powerpc: Add support code for kexec_file_load()")
>>>> Cc: Baoquan he <bhe@redhat.com>
>>>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>>>> CC: Madhavan Srinivasan <maddy@linux.ibm.com>
>>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>>> Cc: kexec@lists.infradead.org
>>>> Cc: linuxppc-dev@lists.ozlabs.org
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>>> ---
>>>>    kernel/kexec_elf.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/kernel/kexec_elf.c b/kernel/kexec_elf.c
>>>> index d3689632e8b9..3a5c25b2adc9 100644
>>>> --- a/kernel/kexec_elf.c
>>>> +++ b/kernel/kexec_elf.c
>>>> @@ -390,7 +390,7 @@ int kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
>>>>    			 struct kexec_buf *kbuf,
>>>>    			 unsigned long *lowest_load_addr)
>>>>    {
>>>> -	unsigned long lowest_addr = UINT_MAX;
>>>> +	unsigned long lowest_addr = ULONG_MAX;
>>> Great catch.
>>>
>>> Acked-by: Baoquan He <bhe@redhat.com>
>> Thank you for the Ack! The upcoming two patch series, which aim to
>> enable generic crashkernel reservation, depends on this fix. One of them
>> is already posted for upstream review:
>> https://lore.kernel.org/all/20250108101458.406806-1-sourabhjain@linux.ibm.com/
>> I was wondering if you could guide us on how to get this fix pushed to
>> the mainline tree.
> Please include this patch (with Baoquan's ack) in whichever tree
> contains the powerpc patches which depend upon it.

Sure, I will include this patch in the respective patch series.

Thanks,
Sourabh Jain

