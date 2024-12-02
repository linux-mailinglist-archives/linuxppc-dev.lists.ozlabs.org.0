Return-Path: <linuxppc-dev+bounces-3672-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 517839E0459
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 15:06:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y25DJ6Zxpz2xg3;
	Tue,  3 Dec 2024 01:06:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733148368;
	cv=none; b=Wrl48gJ7sF7GLSrSxiS+8SQrZlCJfOFfgPIPFeM2MB2J7cn/UyOVsVOZVm0rNjZFF3G26mZaK7oM0CqKz7d99SyEKyPaUcZnpfr+wIpEYWrH2ZvAObAzPfy/XgaLv0sU1pWkLr+/hZnHob2Verb5Hw04QUV665GP2AwAbN0w86NgctNQvjoDhVeMwY+T5yTO1zSMDx4rzrfhike0BgHeINn1r9djviwiRHdEoKaEj+2AKEYMKr/21wqsxcxEMhrzv7Xw72YKYFQJzWIxcNhgAIqgVqhnpgFU3SyxEDoxpI9fiddcdDZ320KC3ZoVmPNNkJUiOrlpnsjMXQLHuCJdEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733148368; c=relaxed/relaxed;
	bh=STOv/zZNVc5lN2iOrksyKCSZc9jg0+HvTYnbwsToZxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GHY9fVQIFIbExcr8BK3MhRq4+eqVTQ47xjyUPdlOlEF7rOKzYsHQ4CPuAjjTRhBe00TIBcHSQQlCFgSoszp4xsmq2+djlYaiqt12Fs2uvCs7wcJak9BhrFPVux4u2TuRJHV6GBPl6JWFNX6gG4JPMOBUbpcXgCZicte/LkXBHBvyPpm0JxSi5W9LaggxsVivZfH+b57fhD93cd/Sr331+uC9KqBy/ONbWq+tQuY1+BibWYTrzPfJcRlQlfssa8w/6XB5GuNok32ipLkpFyi1jjXg+6ga3m5qDQdcvQsrJy3YNsxfaPhkryHWf7rVrJ6mu9LHyR9wRjoZIo8hBSKbhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B/T6nbrP; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B/T6nbrP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y25DB64Sjz2xf2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 01:06:02 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2BRMTf008503;
	Mon, 2 Dec 2024 14:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=STOv/z
	ZNVc5lN2iOrksyKCSZc9jg0+HvTYnbwsToZxg=; b=B/T6nbrPzV/+mPRoFIo2Aw
	sJQJ1QDOYmO/WNkIHzitzUYZdlaBx65c9bYQOt9pr6OBAl8bxS4+SwDi83dxDJPl
	6vXJOF+orUSENkZcirCf5k/7/HMw0hfllKZZJFsxQKVdLt/ND54qgn221mCY2C35
	wNVaKV3zFCan9KVNjHcH15P5MeSwURLYxDNc3UXbdJBwp9yeigfDUupja7J1xE5F
	s5x6xC7QXJy31ldpiym7TVQbZ0AHgvOHfn4rAa3dxaltKt+0lxasFwtAW9ALqdUO
	k8aG/S29CNUNWfre6go8zHPPA/RXM2tEB0PZ7GY1Sm/FCiA9W68X6a6ko5Bbd4sA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 438kfgdk79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 14:05:42 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B2DwnUb013298;
	Mon, 2 Dec 2024 14:05:42 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 438kfgdk6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 14:05:42 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2DdVgb029512;
	Mon, 2 Dec 2024 14:05:40 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 438ddy69qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 14:05:40 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B2E5cdw33882626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2024 14:05:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B46FC20071;
	Mon,  2 Dec 2024 14:05:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6293D2006E;
	Mon,  2 Dec 2024 14:05:36 +0000 (GMT)
Received: from [9.124.223.110] (unknown [9.124.223.110])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  2 Dec 2024 14:05:36 +0000 (GMT)
Message-ID: <026ad776-a889-4213-8e0e-1da9065dc5ef@linux.ibm.com>
Date: Mon, 2 Dec 2024 19:35:35 +0530
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
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, maddy@linux.ibm.com, bigeasy@linutronix.de,
        ankur.a.arora@oracle.com, linux-kernel@vger.kernel.org,
        mark.rutland@arm.com, vschneid@redhat.com, peterz@infradead.org,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20241125042212.1522315-1-sshegde@linux.ibm.com>
 <20241125042212.1522315-2-sshegde@linux.ibm.com>
 <b5c152a3-d459-4744-84ec-846153de1652@csgroup.eu>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <b5c152a3-d459-4744-84ec-846153de1652@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: x2HNJZwtANCojRXB-TRdEdwvabPOdSpU
X-Proofpoint-GUID: qgBBeHP1TUnNBtJaQz1_yXfIg6df90lw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=975 impostorscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020121
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 11/27/24 12:07, Christophe Leroy wrote:
> 
> 
> Le 25/11/2024 à 05:22, Shrikanth Hegde a écrit :
>> PowerPC uses asm-generic preempt definitions as of now.
>> Copy that into arch/asm so that arch specific changes can be done.
>> This would help the next patch for enabling dynamic preemption.
> 

The reason I want the content instead was to allow future patches where 
I thought of making preempt count per paca for ppc64 atleast. generic 
code assumes it is per thread. If this change is to be done at that 
point, that is fair too. I am okay with it.


> Instead of copying all the content of asm-generic version, can you just 
> create a receptacle for your new macros, that will include asm-generic/ 
> preempt.h ?
> 
> Look at arch/powerpc/include/asm/percpu.h for exemple.
>

You mean something like below right?


#ifndef __ASM_POWERPC_PREEMPT_H
#define __ASM_POWERPC_PREEMPT_H

#include <asm-generic/preempt.h>

#if defined(CONFIG_PREEMPT_DYNAMIC) && 
defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
#endif

#endif /* __ASM_POWERPC_PREEMPT_H */



>>
>> No functional changes intended.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/preempt.h | 100 +++++++++++++++++++++++++++++
>>   1 file changed, 100 insertions(+)
>>   create mode 100644 arch/powerpc/include/asm/preempt.h
>>
>> diff --git a/arch/powerpc/include/asm/preempt.h b/arch/powerpc/ 
>> include/asm/preempt.h
>> new file mode 100644
>> index 000000000000..51f8f3881523
>> --- /dev/null
>> +++ b/arch/powerpc/include/asm/preempt.h
>> @@ -0,0 +1,100 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef __ASM_PREEMPT_H
>> +#define __ASM_PREEMPT_H
> 
> Should be __ASM_POWERPC_PREEMPT_H

thanks for catching this.

> 
>> +
>> +#include <linux/thread_info.h>
>> +
>> +#define PREEMPT_ENABLED    (0)
>> +
>> +static __always_inline int preempt_count(void)
>> +{
>> +    return READ_ONCE(current_thread_info()->preempt_count);
>> +}
>> +
>> +static __always_inline volatile int *preempt_count_ptr(void)
>> +{
>> +    return &current_thread_info()->preempt_count;
>> +}
>> +
>> +static __always_inline void preempt_count_set(int pc)
>> +{
>> +    *preempt_count_ptr() = pc;
>> +}
>> +
>> +/*
>> + * must be macros to avoid header recursion hell
>> + */
>> +#define init_task_preempt_count(p) do { \
>> +    task_thread_info(p)->preempt_count = FORK_PREEMPT_COUNT; \
>> +} while (0)
>> +
>> +#define init_idle_preempt_count(p, cpu) do { \
>> +    task_thread_info(p)->preempt_count = PREEMPT_DISABLED; \
>> +} while (0)
>> +
>> +static __always_inline void set_preempt_need_resched(void)
>> +{
>> +}
>> +
>> +static __always_inline void clear_preempt_need_resched(void)
>> +{
>> +}
>> +
>> +static __always_inline bool test_preempt_need_resched(void)
>> +{
>> +    return false;
>> +}
>> +
>> +/*
>> + * The various preempt_count add/sub methods
>> + */
>> +
>> +static __always_inline void __preempt_count_add(int val)
>> +{
>> +    *preempt_count_ptr() += val;
>> +}
>> +
>> +static __always_inline void __preempt_count_sub(int val)
>> +{
>> +    *preempt_count_ptr() -= val;
>> +}
>> +
>> +static __always_inline bool __preempt_count_dec_and_test(void)
>> +{
>> +    /*
>> +     * Because of load-store architectures cannot do per-cpu atomic
>> +     * operations; we cannot use PREEMPT_NEED_RESCHED because it 
>> might get
>> +     * lost.
>> +     */
>> +    return !--*preempt_count_ptr() && tif_need_resched();
>> +}
>> +
>> +/*
>> + * Returns true when we need to resched and can (barring IRQ state).
>> + */
>> +static __always_inline bool should_resched(int preempt_offset)
>> +{
>> +    return unlikely(preempt_count() == preempt_offset &&
>> +            tif_need_resched());
>> +}
>> +
>> +#ifdef CONFIG_PREEMPTION
>> +extern asmlinkage void preempt_schedule(void);
>> +extern asmlinkage void preempt_schedule_notrace(void);
>> +
>> +#if defined(CONFIG_PREEMPT_DYNAMIC) && 
>> defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
>> +
>> +void dynamic_preempt_schedule(void);
>> +void dynamic_preempt_schedule_notrace(void);
>> +#define __preempt_schedule()        dynamic_preempt_schedule()
>> +#define __preempt_schedule_notrace()    
>> dynamic_preempt_schedule_notrace()
>> +
>> +#else /* !CONFIG_PREEMPT_DYNAMIC || !CONFIG_HAVE_PREEMPT_DYNAMIC_KEY*/
>> +
>> +#define __preempt_schedule() preempt_schedule()
>> +#define __preempt_schedule_notrace() preempt_schedule_notrace()
>> +
>> +#endif /* CONFIG_PREEMPT_DYNAMIC && CONFIG_HAVE_PREEMPT_DYNAMIC_KEY*/
>> +#endif /* CONFIG_PREEMPTION */
>> +
>> +#endif /* __ASM_PREEMPT_H */


