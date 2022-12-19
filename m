Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 216D8650795
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 07:33:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nb8zw1hWmz3c7N
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 17:33:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HGPaK+8T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HGPaK+8T;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nb8yw4m64z2x9C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Dec 2022 17:32:55 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJ6Kp1C038913;
	Mon, 19 Dec 2022 06:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=LZR2tFAtF7nOaSU8cE5oJYxhKUK+GqhpZh8WMxI2F8I=;
 b=HGPaK+8Tu4lGyY1PkPVcPvLehetB/2KFb2DWsD3n6C7fwTGgVab0ljH2/yPJygd//rvq
 en3Ph3Ui3hs8WTh/slMqWy9WDZ/gjV7ZnretAs7xOkonXITPfj5iPXz7eMKOqb6RJLLx
 MtlaTTdk9/XYZaLmTRbR9t0MY5P8vM/5jIEtRAoNiMWOGfjpZyyZXkEWLnnzWc3yf7Km
 PTT6KZ8DHI2Ky93LcUdzFYQdaoloGv5YqlewcODsgeIBLSVgtpqFvcBu1jIND9V7ZdsY
 NHXWFOS4l/COIXoHCCHaSj0jGkdzfFjNDFJkDUlWbARrfsLCZ1wHHzk+iufOmOyRvQRd Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjjm086kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Dec 2022 06:32:45 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BJ6QFWe014375;
	Mon, 19 Dec 2022 06:32:45 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjjm086jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Dec 2022 06:32:44 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJ2aE9Q023068;
	Mon, 19 Dec 2022 06:32:42 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3mh6yxherf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Dec 2022 06:32:42 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BJ6Weg938732060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Dec 2022 06:32:40 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16D7E2004E;
	Mon, 19 Dec 2022 06:32:40 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EFB520040;
	Mon, 19 Dec 2022 06:32:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 19 Dec 2022 06:32:39 +0000 (GMT)
Received: from [10.61.2.106] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4B7AA6043C;
	Mon, 19 Dec 2022 17:32:34 +1100 (AEDT)
Message-ID: <ed0bea9b-99a7-ec18-9ff2-845de5be816f@linux.ibm.com>
Date: Mon, 19 Dec 2022 17:32:19 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] powerpc/64: Implement arch_within_stack_frames
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20221214044252.1910657-1-nicholas@linux.ibm.com>
 <0dfbaab8-c962-9127-b56d-8f9989c095d8@csgroup.eu>
 <CP1IFJNCTTZ4.33ROBE5VAFAKM@bobo>
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
In-Reply-To: <CP1IFJNCTTZ4.33ROBE5VAFAKM@bobo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e_xPq2d7KC58BLQiItmK2MzsRR2wXG9H
X-Proofpoint-ORIG-GUID: 6vOsEFiTCOOU2GHEFULZ0qEcozjqgDow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 adultscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212190056
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 14/12/2022 10:39 pm, Nicholas Piggin wrote:
> On Wed Dec 14, 2022 at 6:39 PM AEST, Christophe Leroy wrote:
>>
>>
>> Le 14/12/2022 à 05:42, Nicholas Miehlbradt a écrit :
>>> Walks the stack when copy_{to,from}_user address is in the stack to
>>> ensure that the object being copied is entirely within a single stack
>>> frame.
>>>
>>> Substatially similar to the x86 implementation except using the back
>>> chain to traverse the stack and identify stack frame boundaries.
>>>
>>> Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
>>> ---
>>>    arch/powerpc/Kconfig                   |  1 +
>>>    arch/powerpc/include/asm/thread_info.h | 38 ++++++++++++++++++++++++++
>>>    2 files changed, 39 insertions(+)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index 2ca5418457ed..4c59d139ea83 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -198,6 +198,7 @@ config PPC
>>>    	select HAVE_ARCH_KASAN_VMALLOC		if HAVE_ARCH_KASAN
>>>    	select HAVE_ARCH_KFENCE			if ARCH_SUPPORTS_DEBUG_PAGEALLOC
>>>    	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
>>> +	select HAVE_ARCH_WITHIN_STACK_FRAMES	if PPC64
>>
>> Why don't you do something that works for both PPC32 and PPC64 ?
> 
> +1

I'm not familiar with the 32bit ABI, but from a quick glance through it 
seems like the only thing that would need to change is to set then 
PARAMETER_SAVE_OFFSET (to be renamed in the next version as per 
suggestions) to 8 bytes, the layout of the stack and the back chain 
remains the same. Is there something else that I am missing or is that it?

> 
>>>    	select HAVE_ARCH_KGDB
>>>    	select HAVE_ARCH_MMAP_RND_BITS
>>>    	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
>>> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
>>> index af58f1ed3952..efdf39e07884 100644
>>> --- a/arch/powerpc/include/asm/thread_info.h
>>> +++ b/arch/powerpc/include/asm/thread_info.h
>>> @@ -186,6 +186,44 @@ static inline bool test_thread_local_flags(unsigned int flags)
>>>    #define is_elf2_task() (0)
>>>    #endif
>>>    
>>> +#ifdef CONFIG_PPC64
>>> +
>>> +#ifdef CONFIG_PPC64_ELF_ABI_V1
>>> +#define PARAMETER_SAVE_OFFSET 48
>>> +#else
>>> +#define PARAMETER_SAVE_OFFSET 32
>>> +#endif
>>
>> Why not use STACK_INT_FRAME_REGS, defined in asm/ptrace.h ?
> 
> I think use a STACK_FRAME prefixed define in asm/ptrace.h, but maybe
> avoid overloading the STACK_INT_ stuff for this.
> 
>>
>>> +
>>> +/*
>>> + * Walks up the stack frames to make sure that the specified object is
>>> + * entirely contained by a single stack frame.
>>> + *
>>> + * Returns:
>>> + *	GOOD_FRAME	if within a frame
>>> + *	BAD_STACK	if placed across a frame boundary (or outside stack)
>>> + */
>>> +static inline int arch_within_stack_frames(const void * const stack,
>>> +					   const void * const stackend,
>>> +					   const void *obj, unsigned long len)
>>> +{
>>> +	const void *frame;
>>> +	const void *oldframe;
>>> +
>>> +	oldframe = (const void *)current_stack_pointer;
>>> +	frame = *(const void * const *)oldframe;
> 
> This is not the same as x86, they start with the parent of the current
> frame. I assume because the way the caller is set up (with a noinline
> function from an out of line call), then there must be at least one
> stack frame that does not have to be checked, but if I'm wrong about
> that and there is some reason we need to be different it should be
> commented..
> 

Yes, this is something that I overlooked, the current frame is created 
as a result of the call to copy_{to,from}_user and should therefore not 
contain any data being copied.

>>> +
>>> +	while (stack <= frame && frame < stackend) {
>>> +		if (obj + len <= frame)
>>> +			return obj >= oldframe + PARAMETER_SAVE_OFFSET ?
>>> +				GOOD_FRAME : BAD_STACK;
>>> +		oldframe = frame;
>>> +		frame = *(const void * const *)oldframe;
>>> +	}
>>> +
>>> +	return BAD_STACK;
>>> +}
>>
>> What about:
>>
>> +	const void *frame;
>> +	const void *params;
>> +
>> +	params = (const void *)current_stack_pointer + STACK_INT_FRAME_REGS;
>> +	frame = *(const void * const *)current_stack_pointer;
>> +
>> +	while (stack <= frame && frame < stackend) {
>> +		if (obj + len <= frame)
>> +			return obj >= params ? GOOD_FRAME : BAD_STACK;
>> +		params = frame + STACK_INT_FRAME_REGS;
>> +		frame = *(const void * const *)frame;
>> +	}
>> +
>> +	return BAD_STACK;
> 
> What about just copying x86's implementation including using
> __builtin_frame_address(1/2)? Are those builtins reliable for all
> our targets and compiler versions?
> From what I found it has undefined behavior. Since x86 has it's use 
guarded behind CONFIG_FRAME_POINTER which I couldn't find used in the 
ppc code I decided it was best to avoid them. Could be wrong though.

> For bonus points, extract the x86 code out into asm-generic and
> make it usable by both -
> 
> static inline int generic_within_stack_frames(unsigned int ptr_offset,
> 					      unsigned int vars_offset,
>                                                const void * const stack,
>                                                const void * const stackend,
>                                                const void *obj, unsigned long len)
> 
> And our arch_within_stack_frames can just be
> 
>      return generic_within_stack_frames(0, STACK_FRAME_ARGS_OFFSET,
>                                         stack, stackend, obj, len);
> 
> Thanks,
> Nick
