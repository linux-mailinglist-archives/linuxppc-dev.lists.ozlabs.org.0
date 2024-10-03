Return-Path: <linuxppc-dev+bounces-1741-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD01498E95F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2024 07:34:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nKnywCZN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XK0k42SGJz2yRD;
	Thu,  3 Oct 2024 15:34:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727933692;
	cv=none; b=SjC8rfJaPs2putGnpuBM24MpkT5q8Jgo3bmiB/v/zUGEyDK4vVI1wRe+8uQguj7YxfxUckRffPZ+R1++0KhTy9mwAG2Dnr8+szMpRKYJQmIzilPFH2M+aqyugLGKka4JxdIYxo25uR2g13GkOKWA7Oc/ML5YqQvdMZB3K3eQKa35U3UTcq4Sv0K49atckkhmCIZy3kJ6PT8S9jdVMzhr2+4bI0R6Bh433PDv95LHrro3P7j9oPQ6OW8Sr2pGsTYlX5p6F051zAi5PEE8QqI1oLIncFv7B6DlXKgIHU/eoRgE4hzNTzjp6V3wHmB/pX+bKWQPJ4uGOtbPm3OIoGnwhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727933692; c=relaxed/relaxed;
	bh=DU2EVq/dJRHq3kbfnrGZl+Z6bZudmAtCY8KaXHsKQKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eWHDCtSdMovtgaEg2ooKzZHZz/ftvI1ZBxd+VpMhgFTEvztg4I3ID7x72xqgni1uYOICzUeds3Acnd08TjYuF6LicPPepJKO4giXvtBCFBFXIem1Gn+6QvSwYoyUuxwtXFl8BFoKU9PicGKiUXfgwQIxHYpbU9IIT7KhadnJ4785SvpWni1IAw8DS39v1t0OQ9Woh+99MSffJNJRa4+dTMVifjfImMPkqYuhzclg/ITWh9dyk5t6epfEWIM+tOs0aqRBuf510BYO0jM7a+YRUb7xPYMUszLu7HBDUqUV/Arn7RFBl3KK8aM17fOtmSYdhIs/W6G1+81MoWyAydAPVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nKnywCZN; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nKnywCZN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XK0k24Xhpz2yQ9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2024 15:34:49 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4935NeYB029655;
	Thu, 3 Oct 2024 05:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=D
	U2EVq/dJRHq3kbfnrGZl+Z6bZudmAtCY8KaXHsKQKU=; b=nKnywCZNvHuWuJeNp
	JvE0Noncqn8uGVyji3dy61l31fH4SBnGRHLx5cy//eCoTlz8j2RsdBEd8RoYszp3
	GwNWgerApi3F3VllB30HglkF0KIznGE2zBjW9Rx4NLpKF4O4Aq8HA6RUtAd1rqAB
	G7GWUjfSjLIiN/R3/yREVa05TYXXvWnBL1RjSoOKB3BAYQoLYlsPVbRpdi/ULF4f
	M4IOMuZEzJaIe9tqJz1VYx4Js6qqgB+dGhC0aBrHv82GppxSoNnf89ppRoFaddIN
	9qaVkifnlXhgUKJsVZGPRPSuuo0B4cnWjBRxjE03F2jhYKLr8YAGtJfUyUMTfXX3
	5lf5w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 421n2q00xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Oct 2024 05:34:01 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4935Y0mG021923;
	Thu, 3 Oct 2024 05:34:00 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 421n2q00xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Oct 2024 05:34:00 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49313JW6013047;
	Thu, 3 Oct 2024 05:33:59 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 41xxbjny5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Oct 2024 05:33:59 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4935Xu4M53477772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Oct 2024 05:33:56 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 306CC2004B;
	Thu,  3 Oct 2024 05:33:56 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57E5E20040;
	Thu,  3 Oct 2024 05:33:52 +0000 (GMT)
Received: from [9.43.34.175] (unknown [9.43.34.175])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  3 Oct 2024 05:33:52 +0000 (GMT)
Message-ID: <0b10ef55-bb70-4000-b028-2f38c1879b4a@linux.ibm.com>
Date: Thu, 3 Oct 2024 11:03:51 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/17] powerpc64/bpf: Add support for bpf trampolines
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf <bpf@vger.kernel.org>,
        linux-trace-kernel <linux-trace-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Naveen N. Rao" <naveen@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
References: <20240915205648.830121-1-hbathini@linux.ibm.com>
 <20240915205648.830121-18-hbathini@linux.ibm.com>
 <CAADnVQL60XXW95tgwKn3kVgSQAN7gr1STy=APuO1xQD7mz-aXA@mail.gmail.com>
 <32249e74-633d-4757-8931-742b682a63d3@linux.ibm.com>
 <CAADnVQKfSH_zkP0-TwOB_BLxCBH9efot9mk03uRuooCTMmWnWA@mail.gmail.com>
 <7afc9cc7-95cd-45c7-b748-28040206d9a0@linux.ibm.com>
 <CAADnVQJjqnSVqq2n70-uqfrYRHH3n=5s9=t3D2AMooxxAHYfJQ@mail.gmail.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <CAADnVQJjqnSVqq2n70-uqfrYRHH3n=5s9=t3D2AMooxxAHYfJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nfk4x77q3uIih6IxVoMQw5vL6RKfZNVa
X-Proofpoint-ORIG-GUID: AOTm3W-XTbmLTZO3OzmfxPQdAdP4Ygbv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-03_04,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxlogscore=907 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410030035
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 01/10/24 8:23 pm, Alexei Starovoitov wrote:
> On Tue, Oct 1, 2024 at 12:18 AM Hari Bathini <hbathini@linux.ibm.com> wrote:
>>
>>
>>
>> On 30/09/24 6:25 pm, Alexei Starovoitov wrote:
>>> On Sun, Sep 29, 2024 at 10:33 PM Hari Bathini <hbathini@linux.ibm.com> wrote:
>>>>
>>>>
>>>>
>>>> On 17/09/24 1:20 pm, Alexei Starovoitov wrote:
>>>>> On Sun, Sep 15, 2024 at 10:58 PM Hari Bathini <hbathini@linux.ibm.com> wrote:
>>>>>>
>>>>>> +
>>>>>> +       /*
>>>>>> +        * Generated stack layout:
>>>>>> +        *
>>>>>> +        * func prev back chain         [ back chain        ]
>>>>>> +        *                              [                   ]
>>>>>> +        * bpf prog redzone/tailcallcnt [ ...               ] 64 bytes (64-bit powerpc)
>>>>>> +        *                              [                   ] --
>>>>> ...
>>>>>> +
>>>>>> +       /* Dummy frame size for proper unwind - includes 64-bytes red zone for 64-bit powerpc */
>>>>>> +       bpf_dummy_frame_size = STACK_FRAME_MIN_SIZE + 64;
>>>>>
>>>>> What is the goal of such a large "red zone" ?
>>>>> The kernel stack is a limited resource.
>>>>> Why reserve 64 bytes ?
>>>>> tail call cnt can probably be optional as well.
>>>>
>>>> Hi Alexei, thanks for reviewing.
>>>> FWIW, the redzone on ppc64 is 288 bytes. BPF JIT for ppc64 was using
>>>> a redzone of 80 bytes since tailcall support was introduced [1].
>>>> It came down to 64 bytes thanks to [2]. The red zone is being used
>>>> to save NVRs and tail call count when a stack is not setup. I do
>>>> agree that we should look at optimizing it further. Do you think
>>>> the optimization should go as part of PPC64 trampoline enablement
>>>> being done here or should that be taken up as a separate item, maybe?
>>>
>>> The follow up is fine.
>>> It just odd to me that we currently have:
>>>
>>> [   unused red zone ] 208 bytes protected
>>>
>>> I simply don't understand why we need to waste this much stack space.
>>> Why can't it be zero today ?
>>>
>>
>> The ABI for ppc64 has a redzone of 288 bytes below the current
>> stack pointer that can be used as a scratch area until a new
>> stack frame is created. So, no wastage of stack space as such.
>> It is just red zone that can be used before a new stack frame
>> is created. The comment there is only to show how redzone is
>> being used in ppc64 BPF JIT. I think the confusion is with the
>> mention of "208 bytes" as protected. As not all of that scratch
>> area is used, it mentions the remaining as unused. Essentially
>> 288 bytes below current stack pointer is protected from debuggers
>> and interrupt code (red zone). Note that it should be 224 bytes
>> of unused red zone instead of 208 bytes as red zone usage in
>> ppc64 BPF JIT come down from 80 bytes to 64 bytes since [2].
>> Hope that clears the misunderstanding..
> 
> I see. That makes sense. So it's similar to amd64 red zone,
> but there we have an issue with irqs, hence the kernel is
> compiled with -mno-red-zone.
> 
> I guess ppc always has a different interrupt stack and
> it's not an issue?

Yeah. On ppc64, kernel also uses redzone.
Interrupts use a different stack..

Thanks
Hari


