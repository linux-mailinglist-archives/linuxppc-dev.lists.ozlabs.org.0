Return-Path: <linuxppc-dev+bounces-14939-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ACDCD5F2D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Dec 2025 13:16:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZcZB5d9Tz2xpm;
	Mon, 22 Dec 2025 23:16:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766405794;
	cv=none; b=ccr6An5V6ZA4mdbpLkv3aTlCuJXH2H8JftpwckltFd5KZ938PTeIdUgEOWxJo73TK/4xfK4qLUJBkUtSAfQ1oBuuVew01kWeYRrRhBb3hfBZtBMDIJb4AgqfjzD4Co3LntkcA9U2TDaPs8MfVqAVNQ0UQArBgKz0KRsKMW5LF0NrHSoKgtolr4nbhxPRtCkXEzd/IteL9YPT2YYlmmMNftAA3kV/aUqxRA4Ri120p4A3XiI7/S4WqwUWeRxtWSjx1DYJIi8LIsV6KrThoRCNdDwKHMjhD/SCnHuUVMj02lhuVbQkpysjU8w9mfXeRk34jc4sXiXvtogdNmrotqkveg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766405794; c=relaxed/relaxed;
	bh=PVmd4WnzDvqWGErWhbgvnBylR0OTTW3br2Ekc0bi4vQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eeWDpfyoUnkxH4c2k0QZh25c8hwm83E4shOhXQnGJL4Riq6ipjjLmU0NnPZDiAbt+0rzRy6WiYEDm4hJ/KpDF0bOeV4hGDHsQPGTNaaM9pwyFsAn32gxkH6zzdV9+QoBSpfb+FhKz6mzSxswWuPEZh6TIVkmLCviaBgrIAYPxvUPwU3wFil+h2UTlMIkLONY40MATDm42r4exUEcxklKyp4Yg+gkNs6D3G/T9B256+G+VEd7PW0pSnRKBMFfWgOAsnEblktZTR17spVC/IVEFTuOb92PSgZCw7iD4SfwxvkkK0kyNLlOfrDgpOmGYK5tahJBuF6UAb6FMnp2+xEC/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IGQrRXu2; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IGQrRXu2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dZcZ96Jkxz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Dec 2025 23:16:33 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BM509WT020260;
	Mon, 22 Dec 2025 12:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PVmd4W
	nzDvqWGErWhbgvnBylR0OTTW3br2Ekc0bi4vQ=; b=IGQrRXu27btuwRNX6XgjMx
	6M9xoaU6prd1YxTIiPff1DBnRqKt5hiCfr+QPV9N5tL0kfjiVMGl3IDfy9vJwj8k
	VTdoyJVsPgRIMqZ1fb5C1pZnchgJcQtQmqzdM9cBtjNZSLWHSiTFrwb9G/aEQ1gB
	4yFAdz7tiv61cC6TG4rWu522FrjMJb0X9r6Fox0gjM4TGujnkf0F3fEBgZsIs7G7
	V5TErhd9AIupcoSa+wWcqZK8hk53xmjVSr3Gfe9VZMuwXKgd3ldw31Z7ZAGa2Gkx
	bjVT0dbUsxI0E29ktgOHrhRWZcHcZ9tkzvJddFZtoTnZF6X96z8RGhvw2HVA8R5w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5j7dytev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 12:16:21 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BMCDnL0014990;
	Mon, 22 Dec 2025 12:16:21 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b5j7dyter-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 12:16:21 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BM9co79004869;
	Mon, 22 Dec 2025 12:16:20 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b67mjwxem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 12:16:20 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BMCGKFS32440916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Dec 2025 12:16:20 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0898158052;
	Mon, 22 Dec 2025 12:16:20 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3ADAF58045;
	Mon, 22 Dec 2025 12:16:16 +0000 (GMT)
Received: from [9.124.210.13] (unknown [9.124.210.13])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Dec 2025 12:16:15 +0000 (GMT)
Message-ID: <cf8e12ba-804f-40d8-a9b7-2041cc0872d0@linux.ibm.com>
Date: Mon, 22 Dec 2025 17:46:14 +0530
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
Subject: Re: [PATCH] powerpc/32: Restore disabling of interrupts at
 interrupt/syscall exit
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Guenter Roeck <linux@roeck-us.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
        mad skateman <madskateman@gmail.com>, hypexed@yahoo.com.au,
        Christian Zigotzky <info@xenosoft.de>
References: <585ea521b2be99d293b539bbfae148366cfb3687.1766146895.git.chleroy@kernel.org>
 <0cce7da7-9524-05c6-11bb-2f0f1977ca94@xenosoft.de>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <0cce7da7-9524-05c6-11bb-2f0f1977ca94@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=G8YR0tk5 c=1 sm=1 tr=0 ts=69493695 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=xa41fQdhSR1rhVgc42YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-ORIG-GUID: 7sJXATlTNSdoSfAj6RM0h-1Awdlil0sk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEwMyBTYWx0ZWRfX38PFw6mkuu8V
 DWFnpNG1z7PZxNFkycneep1BwQ680hOWCVQH0qC8EHUwSamQ/2zwBpehWjdD57NLFzJ9B2ekfkD
 Kg7OrvfoDnzyqmfj6D3YU7roXAsLR7CYBuaFwKYnYjZgaX5p1UOd4Ne1eMDdXZvFDxTrPeK5vjS
 w/rP6UKVgH8n+yTfxCiyUAs08KU8HhbiZoWh52liz+Qhx/UxY+BD/CnoTWy0QivoI8182+FGNFR
 v541+xqdbV2u/FyZzkYtMTQcpKusnJFmsniH0M12+XmjWCDO//gGlK0EDl1c3E6Xpe7B+d0X7kI
 NX2cMO6c1O1H+IGOm9KqOv6rhqkif4N0aO/VypOQP0FwGxcfIfukJgV/xtURLCOB3ETaqOI2fvd
 rbIfgIsroXQJ/ZczfV4LJrz6JVUhz+bTL4CGuxQO5H/R+I1k9XqL+yNQTW96fUWc/lvwLaXEEBn
 yuvTOazyM98N8ABBrFg==
X-Proofpoint-GUID: GlrFP-i8ToMqNWN4eX8riWsqPhRDa13Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1011 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2512220103
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 12/20/25 4:47 PM, Christian Zigotzky wrote:
> On 19/12/25 13:23, Christophe Leroy (CS GROUP) wrote:
>> Commit 2997876c4a1a ("powerpc/32: Restore clearing of MSR[RI] at
>> interrupt/syscall exit") delayed clearing of MSR[RI], but missed that
>> both MSR[RI] and MSR[EE] are cleared at the same time, so the commit
>> also delayed the disabling of interrupts, leading to unexpected
>> behaviour.
>>
>> To fix that, mostly revert the blamed commit and restore the clearing
>> of MSR[RI] in interrupt_exit_kernel_prepare() instead. For 8xx it
>> implies adding a synchronising instruction after the mtspr in order to
>> make sure no instruction counter interrupt (used for perf events) will
>> fire just after clearing MSR[RI].
>>
>> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
>> Closes: 
>> https://lore.kernel.org/all/4d0bd05d-6158-1323-3509-744d3fbe8fc7@xenosoft.de/
>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>> Closes: 
>> https://lore.kernel.org/all/6b05eb1c-fdef-44e0-91a7-8286825e68f1@roeck-us.net/
>> Fixes: 2997876c4a1a ("powerpc/32: Restore clearing of MSR[RI] at 
>> interrupt/syscall exit")
>> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> ---
>>   arch/powerpc/include/asm/hw_irq.h |  2 +-
>>   arch/powerpc/include/asm/reg.h    |  1 +
>>   arch/powerpc/kernel/entry_32.S    | 15 ---------------
>>   arch/powerpc/kernel/interrupt.c   |  5 ++++-
>>   4 files changed, 6 insertions(+), 17 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/hw_irq.h 
>> b/arch/powerpc/include/asm/hw_irq.h
>> index 1078ba88efaf..9cd945f2acaf 100644
>> --- a/arch/powerpc/include/asm/hw_irq.h
>> +++ b/arch/powerpc/include/asm/hw_irq.h
>> @@ -90,7 +90,7 @@ static inline void __hard_EE_RI_disable(void)
>>       if (IS_ENABLED(CONFIG_BOOKE))
>>           wrtee(0);
>>       else if (IS_ENABLED(CONFIG_PPC_8xx))
>> -        wrtspr(SPRN_NRI);
>> +        wrtspr_sync(SPRN_NRI);
>>       else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
>>           __mtmsrd(0, 1);
>>       else
>> diff --git a/arch/powerpc/include/asm/reg.h 
>> b/arch/powerpc/include/asm/reg.h
>> index 3fe186635432..3449dd2b577d 100644
>> --- a/arch/powerpc/include/asm/reg.h
>> +++ b/arch/powerpc/include/asm/reg.h
>> @@ -1400,6 +1400,7 @@ static inline void mtmsr_isync(unsigned long val)
>>                        : "r" ((unsigned long)(v)) \
>>                        : "memory")
>>   #define wrtspr(rn)    asm volatile("mtspr " __stringify(rn) ",2" : 
>> : : "memory")
>> +#define wrtspr_sync(rn)    asm volatile("mtspr " __stringify(rn) 
>> ",2; sync" : : : "memory")
>>     static inline void wrtee(unsigned long val)
>>   {
>> diff --git a/arch/powerpc/kernel/entry_32.S 
>> b/arch/powerpc/kernel/entry_32.S
>> index 16f8ee6cb2cd..d8426251b1cd 100644
>> --- a/arch/powerpc/kernel/entry_32.S
>> +++ b/arch/powerpc/kernel/entry_32.S
>> @@ -101,17 +101,6 @@ SYM_FUNC_END(__kuep_unlock)
>>   .endm
>>   #endif
>>   -.macro    clr_ri trash
>> -#ifndef CONFIG_BOOKE
>> -#ifdef CONFIG_PPC_8xx
>> -    mtspr   SPRN_NRI, \trash
>> -#else
>> -    li    \trash, MSR_KERNEL & ~MSR_RI
>> -    mtmsr    \trash
>> -#endif
>> -#endif
>> -.endm
>> -
>>       .globl    transfer_to_syscall
>>   transfer_to_syscall:
>>       stw    r3, ORIG_GPR3(r1)
>> @@ -160,7 +149,6 @@ ret_from_syscall:
>>       cmpwi    r3,0
>>       REST_GPR(3, r1)
>>   syscall_exit_finish:
>> -    clr_ri    r4
>>       mtspr    SPRN_SRR0,r7
>>       mtspr    SPRN_SRR1,r8
>>   @@ -237,7 +225,6 @@ fast_exception_return:
>>       /* Clear the exception marker on the stack to avoid confusing 
>> stacktrace */
>>       li    r10, 0
>>       stw    r10, 8(r11)
>> -    clr_ri    r10
>>       mtspr    SPRN_SRR1,r9
>>       mtspr    SPRN_SRR0,r12
>>       REST_GPR(9, r11)
>> @@ -270,7 +257,6 @@ interrupt_return:
>>   .Lfast_user_interrupt_return:
>>       lwz    r11,_NIP(r1)
>>       lwz    r12,_MSR(r1)
>> -    clr_ri    r4
>>       mtspr    SPRN_SRR0,r11
>>       mtspr    SPRN_SRR1,r12
>>   @@ -313,7 +299,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
>>       cmpwi    cr1,r3,0
>>       lwz    r11,_NIP(r1)
>>       lwz    r12,_MSR(r1)
>> -    clr_ri    r4
>>       mtspr    SPRN_SRR0,r11
>>       mtspr    SPRN_SRR1,r12
>>   diff --git a/arch/powerpc/kernel/interrupt.c 
>> b/arch/powerpc/kernel/interrupt.c
>> index aea6f7e8e9c6..e63bfde13e03 100644
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -38,7 +38,7 @@ static inline bool exit_must_hard_disable(void)
>>   #else
>>   static inline bool exit_must_hard_disable(void)
>>   {
>> -    return false;
>> +    return true;
>>   }
>>   #endif
>>   @@ -443,6 +443,9 @@ notrace unsigned long 
>> interrupt_exit_kernel_prepare(struct pt_regs *regs)
>>             if (unlikely(stack_store))
>>               __hard_EE_RI_disable();
>> +#else
>> +    } else {
>> +        __hard_EE_RI_disable();
>>   #endif /* CONFIG_PPC64 */
>>       }
>
> The patched kernel 6.19.0-rc1 boots without any problems. Thank you.
>
> Tested-by Christian Zigotzky <chzigotzky@xenosoft.de>


Thanks for testing, Will pull this as part of rc fixes
Maddy

