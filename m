Return-Path: <linuxppc-dev+bounces-1967-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 397CA9982B4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 11:47:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPPzm5zTfz3bpG;
	Thu, 10 Oct 2024 20:47:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728553620;
	cv=none; b=F+SMfzQYnnbPhzazj88f+b7XiaPdU6oh0zXUnzTVPSR7/kTh52eAmMoEE0wO6v5Elc5pXzrM0IvO5yr0nhV+PUjx8Wq3rOCUQYkxYEElsts7R/0KOqUGk2x8mtQjSt5Krxbm09cOpliB/cUVWBja9LjjyClwwhxv9P0akvgS1Enx6Wsm2AsLZJ3cNUGB6+BpXYbh8Lzhgl2Q/JJcZZFN3ze2mgU6biWOc6chFwNE+fUOagoNmB/MeTOCGxys7BCW8klh9mlzpn1Jfr5x//IhI567Ind9m8TYDQOG0cSBV/Iau9I5gavrxQm+TgBgcpfzyn5zM5tE8xa1YlA6RxeqEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728553620; c=relaxed/relaxed;
	bh=BterrWOXz6RbsFdUQwzWlQ/tsGwOKvoD4Fd5Pc0Z+M0=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KlG+9cuDPk3+koiiKdU56DOtL+0qIL34VGXjSopn9p+aKNMIQ16ZcHfBlNCNF5t09DzS+Z5gdZMDMWdVqf9WZxK+7/iNn/wXXG2O2TW3p9teh31psMwrxeQjaE7LyxFmg9/XEckwTveLHvguOlOxDbMG5AXx0qio6D4DNC2Hiork7H2kti3MS0Kle25akQR4HjvQs+5NofsXNNysaF/L3X0HFCe/V/r8OLljkgz1KVGt5J1o0t/T1S8RdcitVAuK+Z9R1iC8fwR6xxsokJeBifJ8/Y5a7PiFWU5S6Ew8cU2xJVB3JvTgecG5L//uNM/4AtUpRPv3giHOCPfyVGuu0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c85pzuTy; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c85pzuTy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPPzl5fzPz3bmY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 20:46:59 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A9JVPg000410;
	Thu, 10 Oct 2024 09:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:from:to:cc:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	BterrWOXz6RbsFdUQwzWlQ/tsGwOKvoD4Fd5Pc0Z+M0=; b=c85pzuTyvH/E6pWK
	he9hJdKudrRjZCkNyt8bT2Vx/o/n9fJAoprHFOLdYyIhVhOCiKWnpfRUt+WUHxJc
	/S8oX6c/2A3FRYmHD7mdRoORHSMinaH41kM7qVX71KtqFZS8F03vBWz0VK0DYlkl
	V5838FNLR6n/SpRHWlIs+ui9fvU/3q4tETEFtNWJJMiFUnp8b7PCnHnQyP5zW3Bo
	2xlf8d0He8CmGe0D50RVKY5oV5vPaI8pmAo69VyOJ9COh0nqC6UHbG8ByTXRZiV2
	g3YRA6KFy9nZE7glqqAJG2+KBow6D8T6C216HxRbpnEsIv3ePSwN6TOCbSOmz6or
	xnTRxw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426c6fr436-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 09:46:28 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49A9fcnh013158;
	Thu, 10 Oct 2024 09:46:27 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426c6fr432-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 09:46:27 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49A9T3fE022632;
	Thu, 10 Oct 2024 09:46:26 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 423h9k6x26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 09:46:25 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49A9kMGF40305150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 09:46:22 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D92620040;
	Thu, 10 Oct 2024 09:46:22 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53B052004E;
	Thu, 10 Oct 2024 09:46:17 +0000 (GMT)
Received: from [9.43.111.131] (unknown [9.43.111.131])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 10 Oct 2024 09:46:17 +0000 (GMT)
Message-ID: <a00df08a-605f-41c9-ba0d-2060e0d1e8b4@linux.ibm.com>
Date: Thu, 10 Oct 2024 15:16:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/17] powerpc64/bpf: Add support for bpf trampolines
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>
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
 <875xq07qv6.fsf@mail.lhotse>
 <28d39117-c512-4165-b082-4ca54da7ba6c@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <28d39117-c512-4165-b082-4ca54da7ba6c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4BZXRvYqLwjtB52HRBSl84dnnhbmreHK
X-Proofpoint-GUID: KRtK3293tfzCxCEIysNW578ME7sT4khl
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_05,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100062
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 10/10/24 3:09 pm, Hari Bathini wrote:
> 
> 
> On 10/10/24 5:48 am, Michael Ellerman wrote:
>> Alexei Starovoitov <alexei.starovoitov@gmail.com> writes:
>>> On Tue, Oct 1, 2024 at 12:18 AM Hari Bathini <hbathini@linux.ibm.com> 
>>> wrote:
>>>> On 30/09/24 6:25 pm, Alexei Starovoitov wrote:
>>>>> On Sun, Sep 29, 2024 at 10:33 PM Hari Bathini 
>>>>> <hbathini@linux.ibm.com> wrote:
>>>>>> On 17/09/24 1:20 pm, Alexei Starovoitov wrote:
>>>>>>> On Sun, Sep 15, 2024 at 10:58 PM Hari Bathini 
>>>>>>> <hbathini@linux.ibm.com> wrote:
>>>>>>>>
>>>>>>>> +
>>>>>>>> +       /*
>>>>>>>> +        * Generated stack layout:
>>>>>>>> +        *
>>>>>>>> +        * func prev back chain         [ back chain        ]
>>>>>>>> +        *                              [                   ]
>>>>>>>> +        * bpf prog redzone/tailcallcnt [ ...               ] 64 
>>>>>>>> bytes (64-bit powerpc)
>>>>>>>> +        *                              [                   ] --
>>>>>>> ...
>>>>>>>> +
>>>>>>>> +       /* Dummy frame size for proper unwind - includes 64- 
>>>>>>>> bytes red zone for 64-bit powerpc */
>>>>>>>> +       bpf_dummy_frame_size = STACK_FRAME_MIN_SIZE + 64;
>>>>>>>
>>>>>>> What is the goal of such a large "red zone" ?
>>>>>>> The kernel stack is a limited resource.
>>>>>>> Why reserve 64 bytes ?
>>>>>>> tail call cnt can probably be optional as well.
>>>>>>
>>>>>> Hi Alexei, thanks for reviewing.
>>>>>> FWIW, the redzone on ppc64 is 288 bytes. BPF JIT for ppc64 was using
>>>>>> a redzone of 80 bytes since tailcall support was introduced [1].
>>>>>> It came down to 64 bytes thanks to [2]. The red zone is being used
>>>>>> to save NVRs and tail call count when a stack is not setup. I do
>>>>>> agree that we should look at optimizing it further. Do you think
>>>>>> the optimization should go as part of PPC64 trampoline enablement
>>>>>> being done here or should that be taken up as a separate item, maybe?
>>>>>
>>>>> The follow up is fine.
>>>>> It just odd to me that we currently have:
>>>>>
>>>>> [   unused red zone ] 208 bytes protected
>>>>>
>>>>> I simply don't understand why we need to waste this much stack space.
>>>>> Why can't it be zero today ?
>>>>
>>>> The ABI for ppc64 has a redzone of 288 bytes below the current
>>>> stack pointer that can be used as a scratch area until a new
>>>> stack frame is created. So, no wastage of stack space as such.
>>>> It is just red zone that can be used before a new stack frame
>>>> is created. The comment there is only to show how redzone is
>>>> being used in ppc64 BPF JIT. I think the confusion is with the
>>>> mention of "208 bytes" as protected. As not all of that scratch
>>>> area is used, it mentions the remaining as unused. Essentially
>>>> 288 bytes below current stack pointer is protected from debuggers
>>>> and interrupt code (red zone). Note that it should be 224 bytes
>>>> of unused red zone instead of 208 bytes as red zone usage in
>>>> ppc64 BPF JIT come down from 80 bytes to 64 bytes since [2].
>>>> Hope that clears the misunderstanding..
>>>
>>> I see. That makes sense. So it's similar to amd64 red zone,
>>> but there we have an issue with irqs, hence the kernel is
>>> compiled with -mno-red-zone.
>>
>> I assume that issue is that the interrupt entry unconditionally writes
>> some data below the stack pointer, disregarding the red zone?
>>
>>> I guess ppc always has a different interrupt stack and
>>> it's not an issue?
>>
>> No, the interrupt entry allocates a frame that is big enough to cover
>> the red zone as well as the space it needs to save registers.
>>
>> See STACK_INT_FRAME_SIZE which includes KERNEL_REDZONE_SIZE:
>>
>>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
>> tree/arch/powerpc/include/asm/ptrace.h? 
>> commit=8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b#n165
>>
>> Which is renamed to INT_FRAME_SIZE in asm-offsets.c and then is used in
>> the interrupt entry here:
>>
>>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
>> tree/arch/powerpc/kernel/exceptions-64s.S? 
>> commit=8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b#n497
> 
> Thanks for clarifying that, Michael.
> Only async interrupt handlers use different interrupt stacks, right?

... and separate emergency stack for some special cases...

Thanks
Hari

