Return-Path: <linuxppc-dev+bounces-15877-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C458D2C0C6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 06:39:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dspZ865wQz2xSN;
	Fri, 16 Jan 2026 16:39:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768541952;
	cv=none; b=Z3ZCKGpPNMUW3Wq5jIyHiYQmoEQeErLWckuWcCj6AZl3SF8M9b28Q18WoCUBI3UGWYbTqpIH9xFdDaFgOYICkaM2fN6WL52GN8Vaj5cn6tzQVVDeZZHv03zBMMUyGklcdvQCtnxcm1eOAnI7XHAVPre58EIH7Bpl4BSgjoz1p3b2iQFu2h2H4tnexjVUgKjbCuRzMEqqLkXUSkXeMC/Enjbv3s2NZbYPmSjC2YSdczBgUTLbG2QDOfc0rHPty3sunWmSXttZtwuVMbuTj1FkCEMbD+tKgIKMKyc8W+sI/IFNCEqHNru9j3aAanob/r3mVsFCNfiYsdPAe01CvzHnug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768541952; c=relaxed/relaxed;
	bh=+Qw6+8EwTEg8x19YdYYbMQsXqO5XG8J0H7fwMnQWZsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gOZeDD70gMHFQdssrKqZXyGVxJ2e5sBYkBckipdGBvfpDRm+szfi7U7A3rUA6pYh37a6GMwyKZ0rMdHvR2t4VLI3uhj8UsSXBOyz1LDjkXyfznfVxsAipALxSWYwsc41cVL5ABkbN5hQ3q+jJrwhZVs3ozKdVaARAOR+hy/G2i6Pa+iNoeFyyDn/H8pnazoGJh+CH3txWoeEEvmDgF3N3RLafIQaETfD9dC+gFNuWeuLmmve4GMG8o0psdYoUjfEywR7pIB0D7FUaDpYzEQyOZrKzItRb2S+mV+PRtSrPrw7eEqg9kphusjrHmvPY16WUD4y577Auyr+S6c4Fwz0gg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UjB32P8e; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UjB32P8e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dspZ7417zz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 16:39:11 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60FMsW6g012171;
	Fri, 16 Jan 2026 05:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+Qw6+8
	EwTEg8x19YdYYbMQsXqO5XG8J0H7fwMnQWZsc=; b=UjB32P8ek2zhGT9Q8IzJRA
	zt50skPyfQWg6l5hkwUrXlcW65PSvTHvL69H/r7n1dDnP/i0H7maYqUmk3iLcInd
	P4UYbIlzPm+kuyaQQctoHe4TqXMaI9rxYSLN/uMYywkTF5dlFozkKXLya2+Rj2tT
	L+Dlnw22okV0SkzSCtOp0o+YbbVqmcGL8l5il1+Aa0rFYJmiIyjjVxyoHYwf5fvA
	uxsOgvL+E7ZD1ZgRHPo+sJdfsE3ZGRsRawnvXwGYD+PU02UiWgxIvCrbUD/5hX+B
	PIo2WWdmNXqe0c9gz60RAxstrJCXIsudE5636SiBSVUYcFDNyR9zfPH3OeJfv2Tw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bq9ems1yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 05:38:42 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60G5VwEr016974;
	Fri, 16 Jan 2026 05:38:42 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bq9ems1ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 05:38:41 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60G4I6TW025866;
	Fri, 16 Jan 2026 05:38:41 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bm2kkvb6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 05:38:41 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60G5cakq18546982
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jan 2026 05:38:36 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1A042004D;
	Fri, 16 Jan 2026 05:38:36 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BBD720040;
	Fri, 16 Jan 2026 05:38:30 +0000 (GMT)
Received: from [9.43.87.191] (unknown [9.43.87.191])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jan 2026 05:38:29 +0000 (GMT)
Message-ID: <6581bdf8-9894-487d-8af9-6a2c1835f928@linux.ibm.com>
Date: Fri, 16 Jan 2026 11:08:29 +0530
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
Subject: Re: [PATCH v2 4/6] powerpc64/bpf: Add arch_bpf_stack_walk() for BPF
 JIT
To: adubey <adubey@imap.linux.ibm.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: adubey@linux.ibm.com, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        sachinpb@linux.ibm.com, venkat88@linux.ibm.com, andrii@kernel.org,
        eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        naveen@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, memxor@gmail.com, iii@linux.ibm.com,
        shuah@kernel.org
References: <20260114114450.30405-1-adubey@linux.ibm.com>
 <20260114114450.30405-5-adubey@linux.ibm.com>
 <18dacad3-ec1d-4c91-adfb-2ee8d592de29@kernel.org>
 <bec1dfbacced0198fa76bc59e73811c6@imap.linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <bec1dfbacced0198fa76bc59e73811c6@imap.linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=KvJAGGWN c=1 sm=1 tr=0 ts=6969cee2 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=lYxblflcVYe3kxWlPs0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA0MSBTYWx0ZWRfXyXZg9DW4MZUw
 xt9toPifdcKfFmlCwtHJtx+AwHz4RfGAX4trJbJ+BJeMm+uv8XE4BM/wouUG4wQMoTZLXS0YcEo
 a9bb8Ths3qxHcYRW17QtT/MR1xbhY9lYcAU47PO+7ViM96cL1kcPFyoD9gOoON0yOfysh7taTJ3
 ONbN2XBx+MZcwvr5oZp71Qo1Q0VEr+5yuY85fOuBUgxn9mcYp2VBtv3kuRWmWYXOzAZBJrZMtmL
 3rPvxBOouPBEaeS4TJAgvmFxbMP/jpFImxj8ix7i4u9+bBVIbYeocbgfpFH4Qzd3mwwhj1GdgO9
 dEqcgC1nqfGBeBGuBbjgQmUpkF2b2IppGJYkWG4P7Hc4sQ3MRkI7m4vCuDiH8EKOGga6ZjOQHcp
 pRuBz+P8fH/jErkjmR7JvCYNUh2/BbrqAHvepRHO5PYGeVDhMagJNrM+yF8ABpUsVeSXuGLqDbv
 R9DB4zDMvNAjwQ8BPxA==
X-Proofpoint-GUID: eIoYnUEObe_7qWne2iLAqzI3t2kKt8Xs
X-Proofpoint-ORIG-GUID: Af97WJLKubpArLrWsKGXjjHPG2-iARZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601160041
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 14/01/26 6:50 pm, adubey wrote:
> On 2026-01-14 18:07, Christophe Leroy (CS GROUP) wrote:
>> Le 14/01/2026 à 12:44, adubey@linux.ibm.com a écrit :
>>> From: Abhishek Dubey <adubey@linux.ibm.com>
>>>
>>> This function is used by bpf_throw() to unwind the stack
>>> until frame of exception-boundary during BPF exception
>>> handling.
>>>
>>> This function is necessary to support BPF exceptions on
>>> PowerPC.
>>>
>>> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
>>> ---
>>>   arch/powerpc/net/bpf_jit_comp64.c | 28 ++++++++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/ 
>>> bpf_jit_comp64.c
>>> index cebf81fbd59f..ec58395f74f7 100644
>>> --- a/arch/powerpc/net/bpf_jit_comp64.c
>>> +++ b/arch/powerpc/net/bpf_jit_comp64.c
>>> @@ -247,6 +247,34 @@ void bpf_jit_build_epilogue(u32 *image, struct 
>>> codegen_context *ctx)
>>>       bpf_jit_build_fentry_stubs(image, ctx);
>>>   }
>>>   +void arch_bpf_stack_walk(bool (*consume_fn)(void *, u64, u64, 
>>> u64), void *cookie)
>>> +{
>>> +    // callback processing always in current context
>>> +    unsigned long fp = current_stack_frame();
>>> +
>>> +    for (;;) {
>>> +        unsigned long *frame = (unsigned long *) fp;
>>> +        unsigned long ip;
>>> +
>>> +        if (!validate_sp(fp, current))
>>> +            return;
>>> +
>>> +        ip = frame[STACK_FRAME_LR_SAVE];
>>> +        if (!ip)
>>> +            break;
>>> +
>>> +        /*
>>> +         * consume_fn common code expects stack pointer(sp) in third
>>> +         * argument. There is no sp in ppc64, rather pass frame
>>> +         * pointer.
>>> +         */
>>> +        if (ip && !consume_fn(cookie, ip, fp, fp))
>>> +            break;
>>> +
>>> +        fp = frame[0];
>>> +    }
>>> +}
>>> +
>>
>> This fonction looks very close to arch_stack_walk(). Would it be
>> possible to refactor and have a common part used by both functions,
>> like ARM64 for instance ?
> Yes, its inspired from arch_stack_walk(). consume_entry() have different 
> parameter count in both cases.
> If merged, it need additional handling to identify which call_back to 
> invoke.
> Also, we need to define arch-specific weak function 
> arch_bpf_stack_walk(), so renaming of arch_stack_walk is needed on merge.
> Stack walker logic with "bpf" name might be confusing when used at other 
> places. Thoughts?

Not sure what you mean by renaming of arch_stack_walk is needed on
merge but refactoring does not have to change API signature or any
common code for that matter..

- Hari


