Return-Path: <linuxppc-dev+bounces-3727-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 223A39E1E8D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 15:01:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2j4703bHz2xtK;
	Wed,  4 Dec 2024 01:01:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733234470;
	cv=none; b=ozNxLbzEywYuBBnybrl0j5PonuHOJZF2RHfH+3uPJFEZ1dW0iLRpjm2HNWKPLysY9ygMkaKPJvPu/HW7WDHgiq46brhwdwKblxE4mBkLyBBozHm6VERUT+D3E34O0980neK+GrtKQO/n8Hryp+SIhtLO+YUQ80oQdpHIy378flAvkxTqLUvUMEcfZs3aK8F2FQ0VT1bU+vwzkzKR6zbDa1wK9E1LiNOVqasAHdmN1lO2IApptYGnQ6Dr666kysqlLQ7nhfygDFXuKcenDm8RnansZmzY4NoHnPORUlGgrLCTHE1GiriYuM6MiWlzceztSqMKDC5TbFmpbzEAkb21Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733234470; c=relaxed/relaxed;
	bh=IN+RB0zLXbRxgzA2VNRjOvofy5Rv13Wnv4i3uGnWw6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bibl1yYXCqI/9xEIVvoimHF6EH1HW3WMeDP2e3Umj3mN3e3JRN4Hy0dntj0jgQfyNwTcG1lac14yo5c5qWdwYebwd6IG++cgQuCLLePZaVHie+LsBI1j3GNtUUzFj2bU3OpX8b23QVflq00zapbOSbebvtnbjvdV4h3cvFV5hHaGxf4K08MiX9jFFTTZmPdpoNqOtWhvkFnOxBHkB6AGdHKuwJtlIUfQqr1vKLTs5B+rS8nT72IToXFl9fozaJ1x5ddgU3cbSoin4NMQRVzRutaQQzQQJxljE6qyLZw124a7tS7N9EP11yAT/S6J6zTJdZ6VeFcirkfAAbCWSMEUJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d2q93GpE; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d2q93GpE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2j425jLNz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 01:01:06 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3CpwEX009568;
	Tue, 3 Dec 2024 14:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=IN+RB0
	zLXbRxgzA2VNRjOvofy5Rv13Wnv4i3uGnWw6s=; b=d2q93GpEj7r3Geu2di6kOw
	H1ROaQmhYPHZ+6ETk9xXjxvfXnqIxRr5F1DLMp0CP0CTbGguK4A7+8iZgNxy/Vcs
	2ixba6oY14s0zBFVcbC6WtPnNBk4HGA1Sq/KKHnH4TeF8q9bejBNcmsfl707sfMK
	Ur58B3gvZpU+YRjEoCKQn3EKo3QcqwcChUlhSJ60pDUoE/bJ8V2YGV7OIcTKS8H/
	CRgM1zz6bkMx8d66lnQUJBsNwPW0i7wf1tGFShuGe5hZzbjrEJS9hSnmlbmCzPTM
	iZlwjyROutOW7+x1r0FBfXfjl4fgOaHN9BVgbNRzBaXXa4EMMqs6+zYtwVN9ctwg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 438kfgpvg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 14:00:29 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B3Dq4Yv003383;
	Tue, 3 Dec 2024 14:00:29 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 438kfgpvft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 14:00:29 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3D9HxY005226;
	Tue, 3 Dec 2024 14:00:28 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43a2kxg1d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 14:00:27 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B3E0PDn53281058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Dec 2024 14:00:26 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1BFF20043;
	Tue,  3 Dec 2024 14:00:25 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A49D120040;
	Tue,  3 Dec 2024 14:00:23 +0000 (GMT)
Received: from [9.39.25.90] (unknown [9.39.25.90])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Dec 2024 14:00:23 +0000 (GMT)
Message-ID: <8715eb95-e142-4b42-83d1-7e4cc2fa8650@linux.ibm.com>
Date: Tue, 3 Dec 2024 19:30:22 +0530
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
Subject: Re: [PATCH 1/3] powerpc: copy preempt.h into arch/include/asm
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: npiggin@gmail.com, maddy@linux.ibm.com, bigeasy@linutronix.de,
        ankur.a.arora@oracle.com, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, vschneid@redhat.com, peterz@infradead.org,
        Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20241125042212.1522315-1-sshegde@linux.ibm.com>
 <20241125042212.1522315-2-sshegde@linux.ibm.com>
 <b5c152a3-d459-4744-84ec-846153de1652@csgroup.eu>
 <026ad776-a889-4213-8e0e-1da9065dc5ef@linux.ibm.com>
 <3de6bf25-fb3c-49a9-b06b-5e2e527ec90c@csgroup.eu>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <3de6bf25-fb3c-49a9-b06b-5e2e527ec90c@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ATa0YLbNsuUd5vcZRWUJlyZc1ptob-9s
X-Proofpoint-GUID: HWiY1GPopAyIe0NNbTvOCcW3KikpscZy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=570 impostorscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030116
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 12/2/24 23:47, Christophe Leroy wrote:
> 
> 
> Le 02/12/2024 à 15:05, Shrikanth Hegde a écrit :
>>
>>
>> On 11/27/24 12:07, Christophe Leroy wrote:
>>>
>>>
>>> Le 25/11/2024 à 05:22, Shrikanth Hegde a écrit :
>>>> PowerPC uses asm-generic preempt definitions as of now.
>>>> Copy that into arch/asm so that arch specific changes can be done.
>>>> This would help the next patch for enabling dynamic preemption.
>>>
>>
>> The reason I want the content instead was to allow future patches 
>> where I thought of making preempt count per paca for ppc64 atleast. 
>> generic code assumes it is per thread. If this change is to be done at 
>> that point, that is fair too. I am okay with it.
> 
> I think it is better to keep series minimal and consistent. If you have 
> a futur plan, no problem, keep it future and do everything at once 
> unless it is heavy and better done in two steps.
> 
> As we say in French, a lot of water will have flowed under the bridge by 
> then.
> 
> I'm sure there will be a lot of discussion when you do that and maybe at 
> the end you will end up with something completely different than what 
> you have in mind at the moment.
> 

ok.

>>
>>
>>> Instead of copying all the content of asm-generic version, can you 
>>> just create a receptacle for your new macros, that will include asm- 
>>> generic/ preempt.h ?
>>>
>>> Look at arch/powerpc/include/asm/percpu.h for exemple.
>>>
>>
>> You mean something like below right?
>>
>>
>> #ifndef __ASM_POWERPC_PREEMPT_H
>> #define __ASM_POWERPC_PREEMPT_H
>>
>> #include <asm-generic/preempt.h>
>>
>> #if defined(CONFIG_PREEMPT_DYNAMIC) && 
>> defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
>> DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>> #endif
>>
>> #endif /* __ASM_POWERPC_PREEMPT_H */
> 
> Yes exactly.
> 
> 

Should I send v2 with this and using DYNAMIC_KEY?

