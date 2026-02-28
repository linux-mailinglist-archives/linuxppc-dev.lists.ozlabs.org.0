Return-Path: <linuxppc-dev+bounces-17454-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM/IKCH1ommG8QQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17454-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 15:01:05 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 606491C3677
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 15:01:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fNRgJ2kXJz3bmc;
	Sun, 01 Mar 2026 01:01:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772287260;
	cv=none; b=SJO7/S9jh3yi/BJteICCsXGnixAfroPiGTfZc/juGJNnfEK4cwFpCVKj0T/HN3jSSpOElqK+uCZRVxn1dQyoK6nZ1haaF2fYC/1ZxXbhyOBTIqVdey0bQIVZ0rC//501zeifh40lN72LkAHk4XXS5rGij5ZehVMparYX9CsnOoSluJoJ21VsJslK8IzWrI/CkVW65MpPQU0PrOz4hwD3n7I+Vs0y+iEpVPB8lseplEtZKwMdMunFKAB1HatZ8Spe7S9k6iDVQDZ+oIzOlD2/tS7akKUZkHu4pLn/V1lr+2h34wl75dhuaqEe4Q4pJSBZXfyvbG6Bw6Jnh+zByHx/Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772287260; c=relaxed/relaxed;
	bh=M1z/8SR8f2JC1Khjg0vh2DY9m4MjlnJrGX0kUvmR584=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=WdQ5H9w8SEVy0BvGvG2Q0QFXdh9CiEcY4j619jSDgpuCX2phRDG48sIIuzcRoaEIqTpyrIMRoJxuVnz+BSFAsZ4iSh44Z02eWr+FU8lD4JeWrWJdX/QM1p2wwQ4mKOAvseWmgZ0MfrJBg4xTkVOeourSdKZWVHQ2rjODO13KTpXz2o7GKOOWyxtnGDvZ/JOHu7AbXEA1cTP5HlivJ8BsoM+1qSibcWfH06LG82UOclZTn7U6v/fBltYn0BNk3NZk1J9F14FDePrsdON6xF6aPg1M40enrud18Zzs2CmWoZ1voL50eNdM3qvmc134vcM8ID03v0FquGzjE3tFfGTvAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qAXmRBUJ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qAXmRBUJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sayalip@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fNRgG731vz30BR
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2026 01:00:58 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6KFCV1922555;
	Sat, 28 Feb 2026 14:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=M1z/8SR8f2JC1Khjg0vh2DY9m4Mjln
	JrGX0kUvmR584=; b=qAXmRBUJmOzC+5e6fyjKXjCBsxf0roN89ncSyAUlhtSXbY
	6F1VyDx6FfI28yJE7t0ovIxeQpcUmc55vIirtHxGwn+1gdQKaOCvAPPuoAu08PM+
	Bd/FI1mYph1TDwSIA+g3qVWJPGWzdYq2jOnMPTV1T/QHQqsUQc9QOeCXCFX9B7wk
	10S2M3e2ZJ5zzOZGR0OdCuu3mvCF6WJO+r1FV05eAMi2eQLzNaIYUV9hS/cbkZDS
	sRV0y81GBiOIi+0SavomxCbSgrefC1NqPJGapxwttpTOQ21dGsmJ0gdkNvD5FhPa
	j3SfJWjv8aOmNnBxiK7D44nnsBxNd3qBA/mbNf0g==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckssm8xrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 14:00:53 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61S9ikXf030267;
	Sat, 28 Feb 2026 14:00:52 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfrhkxqxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 14:00:52 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61SE0owQ28639942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 28 Feb 2026 14:00:51 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C796258051;
	Sat, 28 Feb 2026 14:00:50 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 438EA5805A;
	Sat, 28 Feb 2026 14:00:45 +0000 (GMT)
Received: from [9.124.210.20] (unknown [9.124.210.20])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 28 Feb 2026 14:00:44 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------HDuPOS5il4C3ODsGpqeSQ06p"
Message-ID: <4fb3fa18-5e5b-4d52-9496-7803ada34ec1@linux.ibm.com>
Date: Sat, 28 Feb 2026 19:30:42 +0530
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
Subject: Re: [PATCH 1/2] powerpc: fix KUAP warning in VMX usercopy path
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Cc: aboorvad@linux.ibm.com, sshegde@linux.ibm.com, riteshh@linux.ibm.com
References: <20260217124457.89219-1-sayalip@linux.ibm.com>
 <a8f8fd17-7746-46da-8ae7-439d1e8f1f23@kernel.org>
Content-Language: en-IN
From: Sayali Patil <sayalip@linux.ibm.com>
In-Reply-To: <a8f8fd17-7746-46da-8ae7-439d1e8f1f23@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDEyNiBTYWx0ZWRfXwYMwg0jiIET4
 13al1eY9SkINRow6tq2IARhs1l/Wh8XMqwJdtqmuaT/7+bPJd3ImJMqF/bbQvkxLJbbad24oYnW
 1mMEH+Z+N5r9tUKRMrGvs4czIrvOVm34twah0WDxyZ46bCnxpm/Yqx/4UgHOSgR1ToD3cA9m+rB
 3qaEnjwzFa7NiGPcjjZ2xt05LJJZSZmGq6fwsMIBfwDr1hlyNuRIEnwnS4NGOGANdO1oZOfF/oT
 tbrtOZSbER75pM3UYx3+kdUa6gnDVUmdDbMHIv0YJJa7Ub8ulyvXYXyPCaB6CqtiiXUGGs9u82a
 Wlur+jD7zC1HXhfUqLWk4ONm4FAQQYzifBKWLEhNvQhSFuTskyZnVDl4d7NiVFdRTR1JeRAsGKE
 GAHADOfG09rEwc6ofNR4g7RrruTjwEaNgi1b1lNkeox3iGGd1MAGbMOKpfV6z8hpNy9EPGpQpMT
 tYYML8TJSOn3FUzy8Hg==
X-Proofpoint-ORIG-GUID: zkUPq_XvBjkqoe_fafoFCAMAdihWC33S
X-Proofpoint-GUID: zkUPq_XvBjkqoe_fafoFCAMAdihWC33S
X-Authority-Analysis: v=2.4 cv=AobjHe9P c=1 sm=1 tr=0 ts=69a2f515 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=r77TgQKjGQsHNAKrUKIA:9 a=_EeEMxcBAAAA:8
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=AmunyhDgqjaQfk9uA1sA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=czjwGCTIUPoA:10 a=gQVbT2YkzWVCTatK_uMA:9
 a=srdQgT3uWDt6Zlph:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280126
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17454-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:aboorvad@linux.ibm.com,m:sshegde@linux.ibm.com,m:riteshh@linux.ibm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sayalip@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sayalip@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 606491C3677
X-Rspamd-Action: no action

This is a multi-part message in MIME format.
--------------HDuPOS5il4C3ODsGpqeSQ06p
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 27/02/26 14:52, Christophe Leroy (CS GROUP) wrote:
> Hi,
>
> Le 17/02/2026 à 13:44, Sayali Patil a écrit :
>> [Vous ne recevez pas souvent de courriers de sayalip@linux.ibm.com. 
>> Découvrez pourquoi ceci est important à 
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> On powerpc with PREEMPT_FULL or PREEMPT_LAZY and function tracing 
>> enabled,
>> KUAP warnings can be triggered from the VMX usercopy path under memory
>> stress workloads.
>>
>> KUAP requires that no subfunctions are called once userspace access has
>> been enabled. The existing VMX copy implementation violates this
>> requirement by invoking enter_vmx_usercopy() from the assembly path 
>> after
>> userspace access has already been enabled. If preemption occurs
>> in this window, the AMR state may not be preserved correctly,
>> leading to unexpected userspace access state and resulting in
>> KUAP warnings.
>>
>> Fix this by moving VMX selection and enter_vmx_usercopy()/
>> exit_vmx_usercopy() handling into the raw_copy_{to,from,in}_user()
>> wrappers in uaccess.h. The new flow is:
>>
>>    - Decide whether to use the VMX path based on size and CPU capability
>>    - Call enter_vmx_usercopy() before enabling userspace access
>>    - Enable userspace access and perform the VMX copy
>>    - Disable userspace access
>>    - Call exit_vmx_usercopy()
>>    - Fall back to the base copy routine if the VMX copy faults
>>
>> With this change, the VMX assembly routines no longer perform VMX state
>> management or call helper functions; they only implement the
>> copy operations.
>> The previous feature-section based VMX selection inside
>> __copy_tofrom_user_power7() is removed, and a dedicated
>> __copy_tofrom_user_power7_vmx() entry point is introduced.
>>
>> This ensures correct KUAP ordering, avoids subfunction calls
>> while KUAP is unlocked, and eliminates the warnings while preserving
>> the VMX fast path.
>
> You patch conflicts with the changes for adding masked user access.
>
> Can you rebase on top of v7.0-rc1 ?
>
> Comments below
>
>>
>> Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel Userspace 
>> Access Protection")
>> Reported-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> Closes: 
>> https://lore.kernel.org/all/20260109064917.777587-2-sshegde@linux.ibm.com/
>> Suggested-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
>> Co-developed-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
>> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
>> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/uaccess.h | 67 ++++++++++++++++++++++++++++++
>>   arch/powerpc/lib/copyuser_64.S     |  1 +
>>   arch/powerpc/lib/copyuser_power7.S | 45 +++++++-------------
>>   arch/powerpc/lib/vmx-helper.c      |  2 +
>>   4 files changed, 85 insertions(+), 30 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/uaccess.h 
>> b/arch/powerpc/include/asm/uaccess.h
>> index 784a00e681fa..52e4a784d148 100644
>> --- a/arch/powerpc/include/asm/uaccess.h
>> +++ b/arch/powerpc/include/asm/uaccess.h
>> @@ -13,6 +13,11 @@
>>   #define TASK_SIZE_MAX          TASK_SIZE_USER64
>>   #endif
>>
>> +#ifdef CONFIG_ALTIVEC
>
> remove the ifdef to avoid matching ifdef later
>
>> +/* Threshold above which VMX copy path is used */
>> +#define VMX_COPY_THRESHOLD 3328
>> +#endif
>> +
>>   #include <asm-generic/access_ok.h>
>>
>>   /*
>> @@ -323,12 +328,42 @@ do 
>> {                                                              \
>>   extern unsigned long __copy_tofrom_user(void __user *to,
>>                  const void __user *from, unsigned long size);
>>
>> +extern unsigned long __copy_tofrom_user_base(void __user *to,
>> +               const void __user *from, unsigned long size);
>> +
>
> extern keywork is pointless for function prototypes, don't add new ones.
>
>> +#ifdef CONFIG_ALTIVEC
>
> Remove the ifdef
>
>> +extern unsigned long __copy_tofrom_user_power7_vmx(void __user *to,
>> +               const void __user *from, unsigned long size);
>> +
>> +static inline bool will_use_vmx(unsigned long n)
>> +{
>> +       return cpu_has_feature(CPU_FTR_VMX_COPY) &&
>> +               n > VMX_COPY_THRESHOLD;
>
> Change to
>
>     return IS_ENABLED(CONFIG_ALTIVEC) && 
> cpu_has_feature(CPU_FTR_VMX_COPY) &&  n > VMX_COPY_THRESHOLD;
>
> Then will_use_vmx() will return false when CONFIG_ALTIVEC is not set
>
>> +}
>> +#endif
>> +
>>   #ifdef __powerpc64__
>>   static inline unsigned long
>>   raw_copy_in_user(void __user *to, const void __user *from, unsigned 
>> long n)
>>   {
>>          unsigned long ret;
>>
>> +#ifdef CONFIG_ALTIVEC
>
> Remove the ifdef, will_use_vmx() will return false with the above 
> change when CONFIG_ALTIVEC is not set
>
>> +       if (will_use_vmx(n) && enter_vmx_usercopy()) {
>> +               allow_read_write_user(to, from, n);
>> +               ret = __copy_tofrom_user_power7_vmx(to, from, n);
>> +               prevent_read_write_user(to, from, n);
>> +               exit_vmx_usercopy();
>> +               if (unlikely(ret)) {
>> +                       allow_read_write_user(to, from, n);
>> +                       ret = __copy_tofrom_user_base(to, from, n);
>> +                       prevent_read_write_user(to, from, n);
>> +               }
>> +
>> +               return ret;
>> +       }
>
> This block is starting to be a bit big for an inline function.
> I think we should just have:
>
>     if (will_use_vmx(n))
>         return __copy_tofrom_user_vmx()
>
> and then define a __copy_tofrom_user_vmx() in for instance 
> arch/powerpc/lib/vmx-helper.c
>
> This would also avoid having to export enter_vmx_usercopy() and 
> exit_vmx_usercopy()
>
> Christophe
>
Thanks Christophe for the review and suggestions. We have incorporated
  these changes in v2.

v2: 
https://lore.kernel.org/all/20260228135319.238985-1-sayalip@linux.ibm.com/

Regards,
Sayali
>> +#endif
>> +
>>          allow_read_write_user(to, from, n);
>>          ret = __copy_tofrom_user(to, from, n);
>>          prevent_read_write_user(to, from, n);
>> @@ -341,6 +376,22 @@ static inline unsigned long 
>> raw_copy_from_user(void *to,
>>   {
>>          unsigned long ret;
>>
>> +#ifdef CONFIG_ALTIVEC
>> +       if (will_use_vmx(n) && enter_vmx_usercopy()) {
>> +               allow_read_from_user(from, n);
>> +               ret = __copy_tofrom_user_power7_vmx((__force void 
>> __user *)to, from, n);
>> +               prevent_read_from_user(from, n);
>> +               exit_vmx_usercopy();
>> +               if (unlikely(ret)) {
>> +                       allow_read_from_user(from, n);
>> +                       ret = __copy_tofrom_user_base((__force void 
>> __user *)to, from, n);
>> +                       prevent_read_from_user(from, n);
>> +               }
>> +
>> +               return ret;
>> +       }
>> +#endif
>> +
>>          allow_read_from_user(from, n);
>>          ret = __copy_tofrom_user((__force void __user *)to, from, n);
>>          prevent_read_from_user(from, n);
>> @@ -352,6 +403,22 @@ raw_copy_to_user(void __user *to, const void 
>> *from, unsigned long n)
>>   {
>>          unsigned long ret;
>>
>> +#ifdef CONFIG_ALTIVEC
>> +       if (will_use_vmx(n) && enter_vmx_usercopy()) {
>> +               allow_write_to_user(to, n);
>> +               ret = __copy_tofrom_user_power7_vmx(to, (__force 
>> const void __user *)from, n);
>> +               prevent_write_to_user(to, n);
>> +               exit_vmx_usercopy();
>> +               if (unlikely(ret)) {
>> +                       allow_write_to_user(to, n);
>> +                       ret = __copy_tofrom_user_base(to, (__force 
>> const void __user *)from, n);
>> +                       prevent_write_to_user(to, n);
>> +               }
>> +
>> +               return ret;
>> +       }
>> +#endif
>> +
>>          allow_write_to_user(to, n);
>>          ret = __copy_tofrom_user(to, (__force const void __user 
>> *)from, n);
>>          prevent_write_to_user(to, n);
>> diff --git a/arch/powerpc/lib/copyuser_64.S 
>> b/arch/powerpc/lib/copyuser_64.S
>> index 9af969d2cc0c..25a99108caff 100644
>> --- a/arch/powerpc/lib/copyuser_64.S
>> +++ b/arch/powerpc/lib/copyuser_64.S
>> @@ -562,3 +562,4 @@ exc;        std     r10,32(3)
>>          li      r5,4096
>>          b       .Ldst_aligned
>>   EXPORT_SYMBOL(__copy_tofrom_user)
>> +EXPORT_SYMBOL(__copy_tofrom_user_base)
>> diff --git a/arch/powerpc/lib/copyuser_power7.S 
>> b/arch/powerpc/lib/copyuser_power7.S
>> index 8474c682a178..17dbcfbae25f 100644
>> --- a/arch/powerpc/lib/copyuser_power7.S
>> +++ b/arch/powerpc/lib/copyuser_power7.S
>> @@ -5,13 +5,9 @@
>>    *
>>    * Author: Anton Blanchard <anton@au.ibm.com>
>>    */
>> +#include <linux/export.h>
>>   #include <asm/ppc_asm.h>
>>
>> -#ifndef SELFTEST_CASE
>> -/* 0 == don't use VMX, 1 == use VMX */
>> -#define SELFTEST_CASE  0
>> -#endif
>> -
>>   #ifdef __BIG_ENDIAN__
>>   #define LVS(VRT,RA,RB)         lvsl    VRT,RA,RB
>>   #define VPERM(VRT,VRA,VRB,VRC) vperm   VRT,VRA,VRB,VRC
>> @@ -47,10 +43,14 @@
>>          ld      r15,STK_REG(R15)(r1)
>>          ld      r14,STK_REG(R14)(r1)
>>   .Ldo_err3:
>> -       bl      CFUNC(exit_vmx_usercopy)
>> +       ld      r6,STK_REG(R31)(r1)     /* original destination 
>> pointer */
>> +       ld      r5,STK_REG(R29)(r1)     /* original number of bytes */
>> +       subf    r7,r6,r3                /* #bytes copied */
>> +       subf    r3,r7,r5                /* #bytes not copied in r3 */
>>          ld      r0,STACKFRAMESIZE+16(r1)
>>          mtlr    r0
>> -       b       .Lexit
>> +       addi    r1,r1,STACKFRAMESIZE
>> +       blr
>>   #endif /* CONFIG_ALTIVEC */
>>
>>   .Ldo_err2:
>> @@ -74,7 +74,6 @@
>>
>>   _GLOBAL(__copy_tofrom_user_power7)
>>          cmpldi  r5,16
>> -       cmpldi  cr1,r5,3328
>>
>>          std     r3,-STACKFRAMESIZE+STK_REG(R31)(r1)
>>          std     r4,-STACKFRAMESIZE+STK_REG(R30)(r1)
>> @@ -82,12 +81,6 @@ _GLOBAL(__copy_tofrom_user_power7)
>>
>>          blt     .Lshort_copy
>>
>> -#ifdef CONFIG_ALTIVEC
>> -test_feature = SELFTEST_CASE
>> -BEGIN_FTR_SECTION
>> -       bgt     cr1,.Lvmx_copy
>> -END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
>> -#endif
>>
>>   .Lnonvmx_copy:
>>          /* Get the source 8B aligned */
>> @@ -263,23 +256,14 @@ err1;     stb     r0,0(r3)
>>   15:    li      r3,0
>>          blr
>>
>> -.Lunwind_stack_nonvmx_copy:
>> -       addi    r1,r1,STACKFRAMESIZE
>> -       b       .Lnonvmx_copy
>> -
>> -.Lvmx_copy:
>>   #ifdef CONFIG_ALTIVEC
>> +_GLOBAL(__copy_tofrom_user_power7_vmx)
>>          mflr    r0
>>          std     r0,16(r1)
>>          stdu    r1,-STACKFRAMESIZE(r1)
>> -       bl      CFUNC(enter_vmx_usercopy)
>> -       cmpwi   cr1,r3,0
>> -       ld      r0,STACKFRAMESIZE+16(r1)
>> -       ld      r3,STK_REG(R31)(r1)
>> -       ld      r4,STK_REG(R30)(r1)
>> -       ld      r5,STK_REG(R29)(r1)
>> -       mtlr    r0
>>
>> +       std     r3,STK_REG(R31)(r1)
>> +       std     r5,STK_REG(R29)(r1)
>>          /*
>>           * We prefetch both the source and destination using 
>> enhanced touch
>>           * instructions. We use a stream ID of 0 for the load side and
>> @@ -300,8 +284,6 @@ err1;       stb     r0,0(r3)
>>
>>          DCBT_SETUP_STREAMS(r6, r7, r9, r10, r8)
>>
>> -       beq     cr1,.Lunwind_stack_nonvmx_copy
>> -
>>          /*
>>           * If source and destination are not relatively aligned we 
>> use a
>>           * slower permute loop.
>> @@ -478,7 +460,8 @@ err3;       lbz     r0,0(r4)
>>   err3;  stb     r0,0(r3)
>>
>>   15:    addi    r1,r1,STACKFRAMESIZE
>> -       b       CFUNC(exit_vmx_usercopy)        /* tail call optimise */
>> +       li r3,0
>> +       blr
>>
>>   .Lvmx_unaligned_copy:
>>          /* Get the destination 16B aligned */
>> @@ -681,5 +664,7 @@ err3;       lbz     r0,0(r4)
>>   err3;  stb     r0,0(r3)
>>
>>   15:    addi    r1,r1,STACKFRAMESIZE
>> -       b       CFUNC(exit_vmx_usercopy)        /* tail call optimise */
>> +       li r3,0
>> +       blr
>> +EXPORT_SYMBOL(__copy_tofrom_user_power7_vmx)
>>   #endif /* CONFIG_ALTIVEC */
>> diff --git a/arch/powerpc/lib/vmx-helper.c 
>> b/arch/powerpc/lib/vmx-helper.c
>> index 54340912398f..554b248002b4 100644
>> --- a/arch/powerpc/lib/vmx-helper.c
>> +++ b/arch/powerpc/lib/vmx-helper.c
>> @@ -27,6 +27,7 @@ int enter_vmx_usercopy(void)
>>
>>          return 1;
>>   }
>> +EXPORT_SYMBOL(enter_vmx_usercopy);
>>
>>   /*
>>    * This function must return 0 because we tail call optimise when 
>> calling
>> @@ -49,6 +50,7 @@ int exit_vmx_usercopy(void)
>>                  set_dec(1);
>>          return 0;
>>   }
>> +EXPORT_SYMBOL(exit_vmx_usercopy);
>>
>>   int enter_vmx_ops(void)
>>   {
>> -- 
>> 2.52.0
>>
>
>
--------------HDuPOS5il4C3ODsGpqeSQ06p
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 27/02/26 14:52, Christophe Leroy (CS
      GROUP) wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a8f8fd17-7746-46da-8ae7-439d1e8f1f23@kernel.org">Hi,
      <br>
      <br>
      Le 17/02/2026 à 13:44, Sayali Patil a écrit :
      <br>
      <blockquote type="cite">[Vous ne recevez pas souvent de courriers
        de <a class="moz-txt-link-abbreviated" href="mailto:sayalip@linux.ibm.com">sayalip@linux.ibm.com</a>. Découvrez pourquoi ceci est important
        à <a class="moz-txt-link-freetext" href="https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/LearnAboutSenderIdentification</a> ]
        <br>
        <br>
        On powerpc with PREEMPT_FULL or PREEMPT_LAZY and function
        tracing enabled,
        <br>
        KUAP warnings can be triggered from the VMX usercopy path under
        memory
        <br>
        stress workloads.
        <br>
        <br>
        KUAP requires that no subfunctions are called once userspace
        access has
        <br>
        been enabled. The existing VMX copy implementation violates this
        <br>
        requirement by invoking enter_vmx_usercopy() from the assembly
        path after
        <br>
        userspace access has already been enabled. If preemption occurs
        <br>
        in this window, the AMR state may not be preserved correctly,
        <br>
        leading to unexpected userspace access state and resulting in
        <br>
        KUAP warnings.
        <br>
        <br>
        Fix this by moving VMX selection and enter_vmx_usercopy()/
        <br>
        exit_vmx_usercopy() handling into the
        raw_copy_{to,from,in}_user()
        <br>
        wrappers in uaccess.h. The new flow is:
        <br>
        <br>
           - Decide whether to use the VMX path based on size and CPU
        capability
        <br>
           - Call enter_vmx_usercopy() before enabling userspace access
        <br>
           - Enable userspace access and perform the VMX copy
        <br>
           - Disable userspace access
        <br>
           - Call exit_vmx_usercopy()
        <br>
           - Fall back to the base copy routine if the VMX copy faults
        <br>
        <br>
        With this change, the VMX assembly routines no longer perform
        VMX state
        <br>
        management or call helper functions; they only implement the
        <br>
        copy operations.
        <br>
        The previous feature-section based VMX selection inside
        <br>
        __copy_tofrom_user_power7() is removed, and a dedicated
        <br>
        __copy_tofrom_user_power7_vmx() entry point is introduced.
        <br>
        <br>
        This ensures correct KUAP ordering, avoids subfunction calls
        <br>
        while KUAP is unlocked, and eliminates the warnings while
        preserving
        <br>
        the VMX fast path.
        <br>
      </blockquote>
      <br>
      You patch conflicts with the changes for adding masked user
      access.
      <br>
      <br>
      Can you rebase on top of v7.0-rc1 ?
      <br>
      <br>
      Comments below
      <br>
      <br>
      <blockquote type="cite">
        <br>
        Fixes: de78a9c42a79 ("powerpc: Add a framework for Kernel
        Userspace Access Protection")
        <br>
        Reported-by: Shrikanth Hegde <a class="moz-txt-link-rfc2396E" href="mailto:sshegde@linux.ibm.com">&lt;sshegde@linux.ibm.com&gt;</a>
        <br>
        Closes:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20260109064917.777587-2-sshegde@linux.ibm.com/">https://lore.kernel.org/all/20260109064917.777587-2-sshegde@linux.ibm.com/</a><br>
        Suggested-by: Christophe Leroy (CS GROUP)
        <a class="moz-txt-link-rfc2396E" href="mailto:chleroy@kernel.org">&lt;chleroy@kernel.org&gt;</a>
        <br>
        Co-developed-by: Aboorva Devarajan
        <a class="moz-txt-link-rfc2396E" href="mailto:aboorvad@linux.ibm.com">&lt;aboorvad@linux.ibm.com&gt;</a>
        <br>
        Signed-off-by: Aboorva Devarajan <a class="moz-txt-link-rfc2396E" href="mailto:aboorvad@linux.ibm.com">&lt;aboorvad@linux.ibm.com&gt;</a>
        <br>
        Signed-off-by: Sayali Patil <a class="moz-txt-link-rfc2396E" href="mailto:sayalip@linux.ibm.com">&lt;sayalip@linux.ibm.com&gt;</a>
        <br>
        ---
        <br>
          arch/powerpc/include/asm/uaccess.h | 67
        ++++++++++++++++++++++++++++++
        <br>
          arch/powerpc/lib/copyuser_64.S     |  1 +
        <br>
          arch/powerpc/lib/copyuser_power7.S | 45 +++++++-------------
        <br>
          arch/powerpc/lib/vmx-helper.c      |  2 +
        <br>
          4 files changed, 85 insertions(+), 30 deletions(-)
        <br>
        <br>
        diff --git a/arch/powerpc/include/asm/uaccess.h
        b/arch/powerpc/include/asm/uaccess.h
        <br>
        index 784a00e681fa..52e4a784d148 100644
        <br>
        --- a/arch/powerpc/include/asm/uaccess.h
        <br>
        +++ b/arch/powerpc/include/asm/uaccess.h
        <br>
        @@ -13,6 +13,11 @@
        <br>
          #define TASK_SIZE_MAX          TASK_SIZE_USER64
        <br>
          #endif
        <br>
        <br>
        +#ifdef CONFIG_ALTIVEC
        <br>
      </blockquote>
      <br>
      remove the ifdef to avoid matching ifdef later
      <br>
      <br>
      <blockquote type="cite">+/* Threshold above which VMX copy path is
        used */
        <br>
        +#define VMX_COPY_THRESHOLD 3328
        <br>
        +#endif
        <br>
        +
        <br>
          #include &lt;asm-generic/access_ok.h&gt;
        <br>
        <br>
          /*
        <br>
        @@ -323,12 +328,42 @@ do
        {                                                              \
        <br>
          extern unsigned long __copy_tofrom_user(void __user *to,
        <br>
                         const void __user *from, unsigned long size);
        <br>
        <br>
        +extern unsigned long __copy_tofrom_user_base(void __user *to,
        <br>
        +               const void __user *from, unsigned long size);
        <br>
        +
        <br>
      </blockquote>
      <br>
      extern keywork is pointless for function prototypes, don't add new
      ones.
      <br>
      <br>
      <blockquote type="cite">+#ifdef CONFIG_ALTIVEC
        <br>
      </blockquote>
      <br>
      Remove the ifdef
      <br>
      <br>
      <blockquote type="cite">+extern unsigned long
        __copy_tofrom_user_power7_vmx(void __user *to,
        <br>
        +               const void __user *from, unsigned long size);
        <br>
        +
        <br>
        +static inline bool will_use_vmx(unsigned long n)
        <br>
        +{
        <br>
        +       return cpu_has_feature(CPU_FTR_VMX_COPY) &amp;&amp;
        <br>
        +               n &gt; VMX_COPY_THRESHOLD;
        <br>
      </blockquote>
      <br>
      Change to
      <br>
      <br>
          return IS_ENABLED(CONFIG_ALTIVEC) &amp;&amp;
      cpu_has_feature(CPU_FTR_VMX_COPY) &amp;&amp;  n &gt;
      VMX_COPY_THRESHOLD;
      <br>
      <br>
      Then will_use_vmx() will return false when CONFIG_ALTIVEC is not
      set
      <br>
      <br>
      <blockquote type="cite">+}
        <br>
        +#endif
        <br>
        +
        <br>
          #ifdef __powerpc64__
        <br>
          static inline unsigned long
        <br>
          raw_copy_in_user(void __user *to, const void __user *from,
        unsigned long n)
        <br>
          {
        <br>
                 unsigned long ret;
        <br>
        <br>
        +#ifdef CONFIG_ALTIVEC
        <br>
      </blockquote>
      <br>
      Remove the ifdef, will_use_vmx() will return false with the above
      change when CONFIG_ALTIVEC is not set
      <br>
      <br>
      <blockquote type="cite">+       if (will_use_vmx(n) &amp;&amp;
        enter_vmx_usercopy()) {
        <br>
        +               allow_read_write_user(to, from, n);
        <br>
        +               ret = __copy_tofrom_user_power7_vmx(to, from,
        n);
        <br>
        +               prevent_read_write_user(to, from, n);
        <br>
        +               exit_vmx_usercopy();
        <br>
        +               if (unlikely(ret)) {
        <br>
        +                       allow_read_write_user(to, from, n);
        <br>
        +                       ret = __copy_tofrom_user_base(to, from,
        n);
        <br>
        +                       prevent_read_write_user(to, from, n);
        <br>
        +               }
        <br>
        +
        <br>
        +               return ret;
        <br>
        +       }
        <br>
      </blockquote>
      <br>
      This block is starting to be a bit big for an inline function.
      <br>
      I think we should just have:
      <br>
      <br>
          if (will_use_vmx(n))
      <br>
              return __copy_tofrom_user_vmx()
      <br>
      <br>
      and then define a __copy_tofrom_user_vmx() in for instance
      arch/powerpc/lib/vmx-helper.c
      <br>
      <br>
      This would also avoid having to export enter_vmx_usercopy() and
      exit_vmx_usercopy()
      <br>
      <br>
      Christophe <br>
      <br>
    </blockquote>
    <font face="monospace" size="4">Thanks Christophe for the review and
      suggestions. We have incorporated<br aria-hidden="true">
       these changes in v2.<br>
      <br aria-hidden="true">
      v2:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20260228135319.238985-1-sayalip@linux.ibm.com/">https://lore.kernel.org/all/20260228135319.238985-1-sayalip@linux.ibm.com/</a><br>
      <br>
      Regards,<br>
      Sayali</font>
    <blockquote type="cite"
      cite="mid:a8f8fd17-7746-46da-8ae7-439d1e8f1f23@kernel.org">
      <blockquote type="cite">+#endif
        <br>
        +
        <br>
                 allow_read_write_user(to, from, n);
        <br>
                 ret = __copy_tofrom_user(to, from, n);
        <br>
                 prevent_read_write_user(to, from, n);
        <br>
        @@ -341,6 +376,22 @@ static inline unsigned long
        raw_copy_from_user(void *to,
        <br>
          {
        <br>
                 unsigned long ret;
        <br>
        <br>
        +#ifdef CONFIG_ALTIVEC
        <br>
        +       if (will_use_vmx(n) &amp;&amp; enter_vmx_usercopy()) {
        <br>
        +               allow_read_from_user(from, n);
        <br>
        +               ret = __copy_tofrom_user_power7_vmx((__force
        void __user *)to, from, n);
        <br>
        +               prevent_read_from_user(from, n);
        <br>
        +               exit_vmx_usercopy();
        <br>
        +               if (unlikely(ret)) {
        <br>
        +                       allow_read_from_user(from, n);
        <br>
        +                       ret = __copy_tofrom_user_base((__force
        void __user *)to, from, n);
        <br>
        +                       prevent_read_from_user(from, n);
        <br>
        +               }
        <br>
        +
        <br>
        +               return ret;
        <br>
        +       }
        <br>
        +#endif
        <br>
        +
        <br>
                 allow_read_from_user(from, n);
        <br>
                 ret = __copy_tofrom_user((__force void __user *)to,
        from, n);
        <br>
                 prevent_read_from_user(from, n);
        <br>
        @@ -352,6 +403,22 @@ raw_copy_to_user(void __user *to, const
        void *from, unsigned long n)
        <br>
          {
        <br>
                 unsigned long ret;
        <br>
        <br>
        +#ifdef CONFIG_ALTIVEC
        <br>
        +       if (will_use_vmx(n) &amp;&amp; enter_vmx_usercopy()) {
        <br>
        +               allow_write_to_user(to, n);
        <br>
        +               ret = __copy_tofrom_user_power7_vmx(to, (__force
        const void __user *)from, n);
        <br>
        +               prevent_write_to_user(to, n);
        <br>
        +               exit_vmx_usercopy();
        <br>
        +               if (unlikely(ret)) {
        <br>
        +                       allow_write_to_user(to, n);
        <br>
        +                       ret = __copy_tofrom_user_base(to,
        (__force const void __user *)from, n);
        <br>
        +                       prevent_write_to_user(to, n);
        <br>
        +               }
        <br>
        +
        <br>
        +               return ret;
        <br>
        +       }
        <br>
        +#endif
        <br>
        +
        <br>
                 allow_write_to_user(to, n);
        <br>
                 ret = __copy_tofrom_user(to, (__force const void __user
        *)from, n);
        <br>
                 prevent_write_to_user(to, n);
        <br>
        diff --git a/arch/powerpc/lib/copyuser_64.S
        b/arch/powerpc/lib/copyuser_64.S
        <br>
        index 9af969d2cc0c..25a99108caff 100644
        <br>
        --- a/arch/powerpc/lib/copyuser_64.S
        <br>
        +++ b/arch/powerpc/lib/copyuser_64.S
        <br>
        @@ -562,3 +562,4 @@ exc;        std     r10,32(3)
        <br>
                 li      r5,4096
        <br>
                 b       .Ldst_aligned
        <br>
          EXPORT_SYMBOL(__copy_tofrom_user)
        <br>
        +EXPORT_SYMBOL(__copy_tofrom_user_base)
        <br>
        diff --git a/arch/powerpc/lib/copyuser_power7.S
        b/arch/powerpc/lib/copyuser_power7.S
        <br>
        index 8474c682a178..17dbcfbae25f 100644
        <br>
        --- a/arch/powerpc/lib/copyuser_power7.S
        <br>
        +++ b/arch/powerpc/lib/copyuser_power7.S
        <br>
        @@ -5,13 +5,9 @@
        <br>
           *
        <br>
           * Author: Anton Blanchard <a class="moz-txt-link-rfc2396E" href="mailto:anton@au.ibm.com">&lt;anton@au.ibm.com&gt;</a>
        <br>
           */
        <br>
        +#include &lt;linux/export.h&gt;
        <br>
          #include &lt;asm/ppc_asm.h&gt;
        <br>
        <br>
        -#ifndef SELFTEST_CASE
        <br>
        -/* 0 == don't use VMX, 1 == use VMX */
        <br>
        -#define SELFTEST_CASE  0
        <br>
        -#endif
        <br>
        -
        <br>
          #ifdef __BIG_ENDIAN__
        <br>
          #define LVS(VRT,RA,RB)         lvsl    VRT,RA,RB
        <br>
          #define VPERM(VRT,VRA,VRB,VRC) vperm   VRT,VRA,VRB,VRC
        <br>
        @@ -47,10 +43,14 @@
        <br>
                 ld      r15,STK_REG(R15)(r1)
        <br>
                 ld      r14,STK_REG(R14)(r1)
        <br>
          .Ldo_err3:
        <br>
        -       bl      CFUNC(exit_vmx_usercopy)
        <br>
        +       ld      r6,STK_REG(R31)(r1)     /* original destination
        pointer */
        <br>
        +       ld      r5,STK_REG(R29)(r1)     /* original number of
        bytes */
        <br>
        +       subf    r7,r6,r3                /* #bytes copied */
        <br>
        +       subf    r3,r7,r5                /* #bytes not copied in
        r3 */
        <br>
                 ld      r0,STACKFRAMESIZE+16(r1)
        <br>
                 mtlr    r0
        <br>
        -       b       .Lexit
        <br>
        +       addi    r1,r1,STACKFRAMESIZE
        <br>
        +       blr
        <br>
          #endif /* CONFIG_ALTIVEC */
        <br>
        <br>
          .Ldo_err2:
        <br>
        @@ -74,7 +74,6 @@
        <br>
        <br>
          _GLOBAL(__copy_tofrom_user_power7)
        <br>
                 cmpldi  r5,16
        <br>
        -       cmpldi  cr1,r5,3328
        <br>
        <br>
                 std     r3,-STACKFRAMESIZE+STK_REG(R31)(r1)
        <br>
                 std     r4,-STACKFRAMESIZE+STK_REG(R30)(r1)
        <br>
        @@ -82,12 +81,6 @@ _GLOBAL(__copy_tofrom_user_power7)
        <br>
        <br>
                 blt     .Lshort_copy
        <br>
        <br>
        -#ifdef CONFIG_ALTIVEC
        <br>
        -test_feature = SELFTEST_CASE
        <br>
        -BEGIN_FTR_SECTION
        <br>
        -       bgt     cr1,.Lvmx_copy
        <br>
        -END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
        <br>
        -#endif
        <br>
        <br>
          .Lnonvmx_copy:
        <br>
                 /* Get the source 8B aligned */
        <br>
        @@ -263,23 +256,14 @@ err1;     stb     r0,0(r3)
        <br>
          15:    li      r3,0
        <br>
                 blr
        <br>
        <br>
        -.Lunwind_stack_nonvmx_copy:
        <br>
        -       addi    r1,r1,STACKFRAMESIZE
        <br>
        -       b       .Lnonvmx_copy
        <br>
        -
        <br>
        -.Lvmx_copy:
        <br>
          #ifdef CONFIG_ALTIVEC
        <br>
        +_GLOBAL(__copy_tofrom_user_power7_vmx)
        <br>
                 mflr    r0
        <br>
                 std     r0,16(r1)
        <br>
                 stdu    r1,-STACKFRAMESIZE(r1)
        <br>
        -       bl      CFUNC(enter_vmx_usercopy)
        <br>
        -       cmpwi   cr1,r3,0
        <br>
        -       ld      r0,STACKFRAMESIZE+16(r1)
        <br>
        -       ld      r3,STK_REG(R31)(r1)
        <br>
        -       ld      r4,STK_REG(R30)(r1)
        <br>
        -       ld      r5,STK_REG(R29)(r1)
        <br>
        -       mtlr    r0
        <br>
        <br>
        +       std     r3,STK_REG(R31)(r1)
        <br>
        +       std     r5,STK_REG(R29)(r1)
        <br>
                 /*
        <br>
                  * We prefetch both the source and destination using
        enhanced touch
        <br>
                  * instructions. We use a stream ID of 0 for the load
        side and
        <br>
        @@ -300,8 +284,6 @@ err1;       stb     r0,0(r3)
        <br>
        <br>
                 DCBT_SETUP_STREAMS(r6, r7, r9, r10, r8)
        <br>
        <br>
        -       beq     cr1,.Lunwind_stack_nonvmx_copy
        <br>
        -
        <br>
                 /*
        <br>
                  * If source and destination are not relatively aligned
        we use a
        <br>
                  * slower permute loop.
        <br>
        @@ -478,7 +460,8 @@ err3;       lbz     r0,0(r4)
        <br>
          err3;  stb     r0,0(r3)
        <br>
        <br>
          15:    addi    r1,r1,STACKFRAMESIZE
        <br>
        -       b       CFUNC(exit_vmx_usercopy)        /* tail call
        optimise */
        <br>
        +       li r3,0
        <br>
        +       blr
        <br>
        <br>
          .Lvmx_unaligned_copy:
        <br>
                 /* Get the destination 16B aligned */
        <br>
        @@ -681,5 +664,7 @@ err3;       lbz     r0,0(r4)
        <br>
          err3;  stb     r0,0(r3)
        <br>
        <br>
          15:    addi    r1,r1,STACKFRAMESIZE
        <br>
        -       b       CFUNC(exit_vmx_usercopy)        /* tail call
        optimise */
        <br>
        +       li r3,0
        <br>
        +       blr
        <br>
        +EXPORT_SYMBOL(__copy_tofrom_user_power7_vmx)
        <br>
          #endif /* CONFIG_ALTIVEC */
        <br>
        diff --git a/arch/powerpc/lib/vmx-helper.c
        b/arch/powerpc/lib/vmx-helper.c
        <br>
        index 54340912398f..554b248002b4 100644
        <br>
        --- a/arch/powerpc/lib/vmx-helper.c
        <br>
        +++ b/arch/powerpc/lib/vmx-helper.c
        <br>
        @@ -27,6 +27,7 @@ int enter_vmx_usercopy(void)
        <br>
        <br>
                 return 1;
        <br>
          }
        <br>
        +EXPORT_SYMBOL(enter_vmx_usercopy);
        <br>
        <br>
          /*
        <br>
           * This function must return 0 because we tail call optimise
        when calling
        <br>
        @@ -49,6 +50,7 @@ int exit_vmx_usercopy(void)
        <br>
                         set_dec(1);
        <br>
                 return 0;
        <br>
          }
        <br>
        +EXPORT_SYMBOL(exit_vmx_usercopy);
        <br>
        <br>
          int enter_vmx_ops(void)
        <br>
          {
        <br>
        --
        <br>
        2.52.0
        <br>
        <br>
      </blockquote>
      <br>
      <br>
    </blockquote>
  </body>
</html>

--------------HDuPOS5il4C3ODsGpqeSQ06p--


