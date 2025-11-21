Return-Path: <linuxppc-dev+bounces-14405-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DEEC77737
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 06:49:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCPRL3Ktxz2yD5;
	Fri, 21 Nov 2025 16:49:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763704142;
	cv=none; b=oKp3zsVO/GsVQRgfRq3mgO8MqNMQeme3kIioLkjfLnLAkwT5RWxSL7AB5Eyn3OjtjVBZ9z2tcg0G3/lFUupFaod6ouTLjjfChEBYFxcg8iqMBEfeyoypMnGzEUD2qHwHgJlCk+e1SrOesezksWePJPxaZZBnwKx9+vKbARVafcpiYPdQGnf1Btd64aMKWRgnMFLbicIH8OJ3TAyCvO6BlGzPGuhs+TmcpupbQe7fPs6ZBgQrlP0iPhmHVf45iyqoSPCnUKF1q/fMUIjdxpodLQ23GFc0oGDty3y1qy/gmjUHSqRUTaCgs76Z4h/ey4HbqaHCkAySWfr71JZ2ZUnDag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763704142; c=relaxed/relaxed;
	bh=tPe+R6xoc3RK4Wke+uL/FSSghPtoZ7Fkp1UZ99AW3CA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FxKHis8EY7JevtIGBfJFe61KmFIbQOhLUseNTyAPapMnkbAPqdbN8oqdH9Fq0tob5Wds2IZ9lv0r6eKJE1ziJ6ApsxHRIBR/djMtpiuNtJ33WfDRyFmhXCi7Jexp0N87EPXJL/IMSqmnB/9J5VkZza/yNpvzbXnzRp6nTj9jc8T31YnkvnC3BGS8yK7SBifAbzjeYjUbTSBo+viQJ63r7+dejBX84CrIX4NgCVPt/F8yPprGzOcEAKkXFKVdlEKVzEGa4WShI4dXsQT5HNcvGMaDB72yvw4/IahwOztgHE9sIbmQnanIKIbHcBQ2hsELXa9MEQZCbFQ3K8t/wJ1Dfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bHc+9wZk; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bHc+9wZk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCPRH63nJz2xSY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 16:48:58 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL2RPn4002709;
	Fri, 21 Nov 2025 05:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=tPe+R6
	xoc3RK4Wke+uL/FSSghPtoZ7Fkp1UZ99AW3CA=; b=bHc+9wZkBgAdJaFEHFGCQ2
	NrUr4kfr3H6ZbobGE/S5oIbcihVDNZFg/qNF0FGaebO37uaWUWuGgSq4AE7QvH/+
	w1f+H2EdG9Us/26CvrA34XnwMbSnWqwCXhprH2Dl/uFKZKz+ekx0TeA1Hjqrn/dv
	/W5QipXxc6DEMXlSIyhyUdMkzDNqFLm8rgwbfX/QDKkR16FZYk8xQ4iBrM14vD9u
	/o0VVGYbns7zWjGSSF8G53eR5Fv61VXmXZ+w6oeWH65a4PBtiaMBoyrR1ql1jtYL
	vHRnCoKFY8VslAKUyfX+aa/H/Mp+sAo+1Txv0REWTDHA4lO0UA6G/pLW0rtL2BsQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejju8pjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 05:48:21 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AL5jUGT029063;
	Fri, 21 Nov 2025 05:48:20 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejju8pjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 05:48:20 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL3fgin010448;
	Fri, 21 Nov 2025 05:48:19 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af3usjrdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 05:48:19 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AL5mFwW36438424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 05:48:15 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82FA120040;
	Fri, 21 Nov 2025 05:48:15 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5EE220043;
	Fri, 21 Nov 2025 05:48:10 +0000 (GMT)
Received: from [9.124.217.18] (unknown [9.124.217.18])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 05:48:10 +0000 (GMT)
Message-ID: <5b3923ca-fd0c-4093-87fc-67fbb9634705@linux.ibm.com>
Date: Fri, 21 Nov 2025 11:18:09 +0530
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
Subject: Re: [PATCH 0/8] Generic IRQ entry/exit support for powerpc
To: Thomas Gleixner <tglx@linutronix.de>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com
Cc: christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, akpm@linux-foundation.org, macro@orcam.me.uk,
        ldv@strace.io, deller@gmx.de, charlie@rivosinc.com,
        bigeasy@linutronix.de, segher@kernel.crashing.org,
        thomas.weissschuh@linutronix.de, menglong8.dong@gmail.com,
        ankur.a.arora@oracle.com, peterz@infradead.org, namcao@linutronix.de,
        kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        coltonlewis@google.com, rppt@kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20251102115358.1744304-1-mkchauras@linux.ibm.com>
 <5a2678a6-66e5-4c15-b95a-ce9f977f79e5@linux.ibm.com> <87ms4hlxci.ffs@tglx>
Content-Language: en-US, en-IN, en-GB
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
In-Reply-To: <87ms4hlxci.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Md_r9StZMFVpsB50zczt1ZUOD9vHi4ua
X-Proofpoint-ORIG-GUID: bNvLbwle2BcZsEkAThEnVaAAaUXhOAQ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXzyb/Oy3zIoTZ
 19FF+Sloz8y3d0pN7Q8YSR4dEaTmDrhoNqYlHjMnVRPIrjHJce44bBIeS/GmrOdbos5qQwzScnm
 /IdjLbKx+FQeOadalHtTB0MxpZqBvtmodevgik5GNB1D7bA+RvEL1M1DCcaWCQtnYtOXdxPy7wH
 R95vVlIE5h+OT0XjfedzlinYvDnyWfriU+XL5P/RON8s0PNWnQ9SWwykOH737nNCeta04cGyQVJ
 cr8Lh+NNy0F4WE5J2oUSkkgnGroBaJN9LtETn/Ty66qoy221HKqaJdwrRLwKo68l9a562UA8uSE
 eUeQ/If9gYbJIRapzcEbX2yYI13iVukzUBK4uKXJm7pUEbzHTGlVzkqCwgE4bN6oCBcS9CN3ri9
 frXh1VKUYBBIj8F/O5HRIGkxTb2jqQ==
X-Authority-Analysis: v=2.4 cv=SvOdKfO0 c=1 sm=1 tr=0 ts=691ffd25 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=-cEj43ATgG-OF8y901IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 11/19/25 11:27 PM, Thomas Gleixner wrote:
> On Fri, Nov 07 2025 at 21:53, Shrikanth Hegde wrote:
>> On 11/2/25 5:23 PM, Mukesh Kumar Chaurasiya wrote:
>> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
>> index ce59431f977c..c7cf9a3f1202 100644
>> --- a/arch/powerpc/kernel/interrupt.c
>> +++ b/arch/powerpc/kernel/interrupt.c
>> @@ -118,16 +118,18 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>>                   regs->exit_flags |= _TIF_RESTOREALL;
>>           }
>>    
>> -again:
>> +       local_irq_disable();
>> +
>> +       user_exit_irqoff();
>>           syscall_exit_to_user_mode(regs);
>>    
>> -       user_enter_irqoff();
>> -       if (!prep_irq_for_enabled_exit(true)) {
>> -               user_exit_irqoff();
>> -               local_irq_enable();
>> -               local_irq_disable();
>> -               goto again;
>> -       }
>> +again:
>> +       if (!prep_irq_for_enabled_exit(true)) {
>> +               local_irq_enable();
>> +               local_irq_disable();
>> +               goto again;
>> +       }
>> +
> This does not look right at all.
>
>            syscall_exit_to_user_mode(regs)
>                  syscall_exit_to_user_mode_work()
>                  exit_to_user_mode()
>                     user_exit_irqoff()
yeah we also found an issue with context tracking here. I am working on 
fixing it.
>
> What you really want to do here is:
>
>   again:
> 	syscall_exit_to_user_mode_work(regs);
>   
> 	exit_to_user_mode(regs);
>   	if (!prep_irq_for_enabled_exit(true)) {
>          	// Re-establishes the full state required
>                  // to restart
> 		enter_from_user_mode(regs);
>   		local_irq_enable();
>   		local_irq_disable();
>   		goto again;
>
> That should cure it. Same issue in the other places.
This helps. Let me try this and i'll send a new version out as soon as 
we are done with testing.
> Thanks,
>
>          tglx

Thanks for the review.

Regards,

Mukesh


