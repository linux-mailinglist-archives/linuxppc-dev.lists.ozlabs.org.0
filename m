Return-Path: <linuxppc-dev+bounces-5735-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6345A239A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 07:54:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ykmq238c5z30VN;
	Fri, 31 Jan 2025 17:54:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738306494;
	cv=none; b=P9kkrf24KzdJOoBWE4Sx3h86rncgO/d5tI2ub6tC2uLHint5vUpfCrtuQ041QPALr2bltnZIWyh4tRLtwn1WiP4mZnQ79TFODfoKdNYJ3BFZnyojIMx3tyf6EIK+PA2FSa7b/JZac2Q2DwyAFrcFDdnKdJv65RvwOHjb2mU7xf6jtJb1rn64kBh8guHDcXS4fdy8L3pa4Plmn6twjPqmf80JdskBfHKbvR416E1Xf49SkVhBgwHP8C19tCHrDnj/7oMGCK0uNeX4H43iKniIJGAIGf6ChkdB4IrusJDL1gzkx6kdsXducOWo1MdnNtxXUnsCerfqL4EKtiyyNceNbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738306494; c=relaxed/relaxed;
	bh=pdT6BWuty8tFs7wtb0wObYnkLDYoD1Aszv9GuAcjP0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQ41rrsfYm0/xVAPLXrxFEc24MjqGqANymHraYjZesS7AlScUPpqkphAsQx24vmkUNVPYoP+lWB1A+wUrFWgHMMH0tTspj+q6mlwR7Yt1qmJuMHFYYy2s8Dts9Ry12P3YGPrEs43U8g3YH1zrXsqyzD66akXmv6ouGjERimdpYFjdIbfOVBkQSdbrUASgyZR98m6hm4JI+1ND8zH8uo5nsREYwRTa1r4VannKc9CB1JP6xNbqi4QKuthGjlcOUMaU5vYHoaMJcy1ypwyOfF2On6OB9ZtA0xoXLq+2FoHyeqbsNYNJPZy3he3mmN73w0PLqEzpYoLm1cs6HIKtcWoDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ASm5xZBC; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ASm5xZBC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ykmq11v95z30MM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 17:54:52 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V5NoTT013241;
	Fri, 31 Jan 2025 06:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=pdT6BW
	uty8tFs7wtb0wObYnkLDYoD1Aszv9GuAcjP0I=; b=ASm5xZBClDDEXXguDOe2tH
	d7GQEw2tlLeCk8jGO3rmCfrGML9PKK5aig9lgbGRFvZDDxxOJgcQkNE4TMBoBYwj
	06J3V0TpaQ7R6/CxmsX/e6GQHoBSiu8Yliv+UaZuMj5n5i8XHVweAargM/m7KLPy
	I2PK43d9Lu0Kvzl237xKHC9IEV6HnzngpbRVMczFFbHVOmd8W9+6dSgfnJetDL1k
	uG9FoqmXWieBNS1b3qDVUFWfUHRS9DrFtmen9xmQRk8EsGFTyPJvdX2AR/jjQ6xd
	Ys4Um0k8sfLrC2FIZ4uYId7Akf8MmAIJn/aBUxb81NGZLnvgm/eyxcs7Iadg6luw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44grb7898t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 06:54:37 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50V6sbUl002694;
	Fri, 31 Jan 2025 06:54:37 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44grb7898r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 06:54:36 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50V3faCQ024517;
	Fri, 31 Jan 2025 06:54:35 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44gf912bx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 06:54:35 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50V6sXNb16515536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 06:54:33 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B414F200D3;
	Fri, 31 Jan 2025 06:54:33 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BA7B200D1;
	Fri, 31 Jan 2025 06:54:32 +0000 (GMT)
Received: from [9.124.214.179] (unknown [9.124.214.179])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 Jan 2025 06:54:31 +0000 (GMT)
Message-ID: <5c47950a-0102-4555-b056-e85f2abc2011@linux.ibm.com>
Date: Fri, 31 Jan 2025 12:24:31 +0530
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
Subject: Re: [PATCH v3 1/1] powerpc: Enable dynamic preemption
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: mpe@ellerman.id.au, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        npiggin@gmail.com, linux-kernel@vger.kernel.org
References: <20250106051919.55020-1-sshegde@linux.ibm.com>
 <20250106051919.55020-2-sshegde@linux.ibm.com>
 <20250130145409.D_so_mR1@linutronix.de>
 <b73b5143-1a7f-4032-ac06-43db3bf4abea@linux.ibm.com>
 <20250130202634.eeb9TfkW@linutronix.de>
 <01bc9e5c-fd47-4c26-8af3-59f10f3b9c76@csgroup.eu>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <01bc9e5c-fd47-4c26-8af3-59f10f3b9c76@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Cwn0zcJz5QuZgr2YkEjkhu31-Jb-mGvY
X-Proofpoint-ORIG-GUID: 12JBoN9nPZsP7JSMdhEY3--Tq7KDkLFs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_02,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2501310047
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 1/31/25 11:39, Christophe Leroy wrote:
> 
> 
> Le 30/01/2025 à 21:26, Sebastian Andrzej Siewior a écrit :
>> On 2025-01-30 22:27:07 [+0530], Shrikanth Hegde wrote:
>>>> | #DEFINE need_irq_preemption() \
>>>> |          
>>>> (static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
>>>> |
>>>> |     if (need_irq_preemption()) {
>>>>
>>>> be a bit smaller/ quicker? This could be a fast path ;)
>>>
>>> I am okay with either way. I did try both[1], there wasn't any 
>>> significant difference,
>>> hence chose a simpler one. May be system size, workload pattern might 
>>> matter.
>>>
>>> Let me do some more testing to see which one wins.
>>> Is there any specific benchmark which might help here?
>>
>> No idea. As per bean counting: preempt_model_preemptible() should
>> resolve in two function calls + conditional in the dynamic case. This
>> should be more expensive compared to a nop/ branch ;)
> 
> I did a build comparison on pmac32_defconfig + dynamic preemption, the 
> static branch looks definitely more optimal:
> 
> Without static branch:
> 
> ...
>   294:    7c 08 02 a6     mflr    r0
>   298:    90 01 00 24     stw     r0,36(r1)
>   29c:    48 00 00 01     bl      29c <interrupt_exit_kernel_prepare+0x50>
>              29c: R_PPC_REL24    preempt_model_full
>   2a0:    2c 03 00 00     cmpwi   r3,0
>   2a4:    41 82 00 a4     beq     348 <interrupt_exit_kernel_prepare+0xfc>
> ...
>   2a8:    81 22 00 4c     lwz     r9,76(r2)
>   2ac:    71 29 00 04     andi.   r9,r9,4
>   2b0:    40 82 00 d4     bne     384 <interrupt_exit_kernel_prepare+0x138>
> ...
>   2b4:    7d 20 00 a6     mfmsr   r9
>   2b8:    55 29 07 fa     rlwinm  r9,r9,0,31,29
> ...
>   348:    48 00 00 01     bl      348 <interrupt_exit_kernel_prepare+0xfc>
>              348: R_PPC_REL24    preempt_model_lazy
>   34c:    2c 03 00 00     cmpwi   r3,0
>   350:    40 a2 ff 58     bne     2a8 <interrupt_exit_kernel_prepare+0x5c>
>   354:    4b ff ff 60     b       2b4 <interrupt_exit_kernel_prepare+0x68>
> 
> With the static branch:
> 
> ...
>   294:    48 00 00 58     b       2ec <interrupt_exit_kernel_prepare+0xa0>
> ...
>   298:    7d 20 00 a6     mfmsr   r9
>   29c:    55 29 07 fa     rlwinm  r9,r9,0,31,29
> ...
>   2ec:    81 22 00 4c     lwz     r9,76(r2)
>   2f0:    71 29 00 04     andi.   r9,r9,4
>   2f4:    41 82 ff a4     beq     298 <interrupt_exit_kernel_prepare+0x4c>
> ...
> 
> With the static branch it is just an unconditional branch being later 
> replaced by a NOP. It must be more efficient.
> 
> So in first case we need to get and save LR, call preempt_model_full(), 
> compare with 0, call preempt_model_lazy() and compare again, and at some 
> point read and restore LR.
> 
> And the preempt_model_() functions are not tiny functions:
> 
> 00003620 <preempt_model_full>:
>      3620:    3d 20 00 00     lis     r9,0
>              3622: R_PPC_ADDR16_HA    preempt_dynamic_mode
>      3624:    94 21 ff f0     stwu    r1,-16(r1)
>      3628:    80 69 00 00     lwz     r3,0(r9)
>              362a: R_PPC_ADDR16_LO    preempt_dynamic_mode
>      362c:    2c 03 ff ff     cmpwi   r3,-1
>      3630:    41 82 00 18     beq     3648 <preempt_model_full+0x28>
>      3634:    68 63 00 02     xori    r3,r3,2
>      3638:    38 21 00 10     addi    r1,r1,16
>      363c:    7c 63 00 34     cntlzw  r3,r3
>      3640:    54 63 d9 7e     srwi    r3,r3,5
>      3644:    4e 80 00 20     blr
> ...
>      3648:    0f e0 00 00     twui    r0,0
>      364c:    68 63 00 02     xori    r3,r3,2
>      3650:    38 21 00 10     addi    r1,r1,16
>      3654:    7c 63 00 34     cntlzw  r3,r3
>      3658:    54 63 d9 7e     srwi    r3,r3,5
>      365c:    4e 80 00 20     blr
> 
> 00003660 <preempt_model_lazy>:
>      3660:    3d 20 00 00     lis     r9,0
>              3662: R_PPC_ADDR16_HA    preempt_dynamic_mode
>      3664:    94 21 ff f0     stwu    r1,-16(r1)
>      3668:    80 69 00 00     lwz     r3,0(r9)
>              366a: R_PPC_ADDR16_LO    preempt_dynamic_mode
>      366c:    2c 03 ff ff     cmpwi   r3,-1
>      3670:    41 82 00 18     beq     3688 <preempt_model_lazy+0x28>
>      3674:    68 63 00 03     xori    r3,r3,3
>      3678:    38 21 00 10     addi    r1,r1,16
>      367c:    7c 63 00 34     cntlzw  r3,r3
>      3680:    54 63 d9 7e     srwi    r3,r3,5
>      3684:    4e 80 00 20     blr
> ...
>      3688:    0f e0 00 00     twui    r0,0
>      368c:    68 63 00 03     xori    r3,r3,3
>      3690:    38 21 00 10     addi    r1,r1,16
>      3694:    7c 63 00 34     cntlzw  r3,r3
>      3698:    54 63 d9 7e     srwi    r3,r3,5
>      369c:    4e 80 00 20     blr
> 
> 
> 

That's convincing. Thanks for the pointers. I will move it into static 
branch method.

That makes the code same for arm64/powerpc. Maybe its worth moving it 
into sched/core. Let me try that as well.

PS: on leave next week, so will be sending the patches after i get back.

>> But you would still need preempt_model_preemptible() for the !DYN case.
>>
>>>>> +           preempt_model_voluntary() ? "voluntary" :
>>>>> +           preempt_model_full()      ? "full" :
>>>>> +           preempt_model_lazy()      ? "lazy" :
>>>>> +           "",
>>>>
>>>> So intend to rework this part. I have patches stashed at
>>>>     https://eur01.safelinks.protection.outlook.com/? 
>>>> url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fbigeasy%2Fstaging.git%2Flog%2F%3Fh%3Dpreemption_string&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C553a8f640a9c4514597d08dd416c6534%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638738655988556429%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=ZfVQi1iRYaVCTrZ5vIhOQ7yAKaDnOwFi0NRjycfrI5A%3D&reserved=0
>>>>
>>>> which I didn't sent yet due to the merge window. Just a heads up ;)
>>>
>>> Makes sense. I had seen at-least two places where this code was 
>>> there, ftrace/powerpc.
>>> There were way more places..
>>>
>>> You want me to remove this part?
>>
>> No, just be aware.
>> I don't know how this will be routed I guess we merge the sched pieces
>> first and then I submit the other pieces via the relevant maintainer
>> tree. In that case please be aware that all parts get removed/ replaced
>> properly.
>>
>> Sebastian
> 


