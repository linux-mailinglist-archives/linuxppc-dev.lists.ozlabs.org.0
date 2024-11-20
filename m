Return-Path: <linuxppc-dev+bounces-3452-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A83809D41D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2024 19:10:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtqCt24cHz2ydW;
	Thu, 21 Nov 2024 05:10:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732126234;
	cv=none; b=lX42+DoQuiw108xJlv6a40NtsgStlynOK7lPW6SUD/usYzYsPmtzgjM0QnXItD7OotsvHemqRixCkPxVSbgnAnenC4dMqaoMLfKHyJO7BaWNfgoUziVL2qjYhnyJKv9nF0sl2W37lssa/sZnU5yQKaWPQNZWLlt/T2NBo5/+LApuzZtkNhCu8qUkKQFI/QOeQbCLPJC7Wmzi1OIkfFU1TtcehpYMu7R9Lu21NBBjtGc0IDXQ2C0gHKOrWYLGq29pnQWZLpWpUZ6hFXHoJwx59ou8Gkx2itw3DoWDGMUrN4zx1/hUxgqjI/onpz8ieaEVFi0/Ii5Z49pzK9QmFXjQKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732126234; c=relaxed/relaxed;
	bh=SUfQZCWYXODzuuIo14/FBJYtySvBgY9P7Ynrc0sg77o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mx3HsulkSSnb/s9na7WHQ4fkSN2RIsAp3cOgGDeOJVADNnk/50Z5CmdMI/tn4Trx2JrJcYdfFuBzWmiA9qpjwRF3KnCHpiAO0Ntc4J7IQ8a7rJzhw1LeMbTOfh3KM3RAI3Nrr3rnb598jxQ3E1c53CNPVBOs7LivStvskqrMkza/y23go1k1te+N+mXAsFdqz7W4YKhRYNOKz/9ZvADV3Ia/jVakIU1q203iecgAHQShkCSNw7o1SQcfTf9kYE0fQK78EdYVMWpRNzx43JQISQbi9XJJh12/1ALeBWydT8lfyTj4AKi5NF0bpVJzl7FJKYJ+PzfgQtBc5o1lzfivCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=heq4V9Zh; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=heq4V9Zh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtqCr3xWZz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2024 05:10:31 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK82NZ7008481;
	Wed, 20 Nov 2024 18:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SUfQZC
	WYXODzuuIo14/FBJYtySvBgY9P7Ynrc0sg77o=; b=heq4V9ZhfTMHRd2JwPXOLc
	0qPp0jWYmfTEB1eS7rV80YhblvNAKrhgVAoWQVowmn5BA3Kvvz6uppy1SFNL2FM1
	kCILnrKnmV5wRdhiST5KcuN1e6FB3NIm4ksLE9fBt+NG+Nk7BUHsFf+XFfMPqj2l
	P7dOksiK/t2yV/9brf75/ShSrvWz9lMttUUjeplN0kadcatU/lFFdFCDcfhTaU6L
	suHjT8QvuLd9UTonMWqll6u/24/kFioOv0q8EgksH0/Vm74BtoFLMjY0o2MUCiPs
	64zXKXmWTyKb9HNxWgMMN3d/rre91yjaWtBVAvr3ndWdoTDAmhHe++Dvj/GsWEEg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42xk216cd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 18:10:09 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AKHxZdG019706;
	Wed, 20 Nov 2024 18:10:08 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42xk216cd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 18:10:08 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKH8LAZ030970;
	Wed, 20 Nov 2024 18:10:08 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42y63yx7hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 18:10:08 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AKIA6AD33817104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Nov 2024 18:10:06 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1081820043;
	Wed, 20 Nov 2024 18:10:06 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2205F20040;
	Wed, 20 Nov 2024 18:10:04 +0000 (GMT)
Received: from [9.39.17.146] (unknown [9.39.17.146])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 20 Nov 2024 18:10:03 +0000 (GMT)
Message-ID: <5733e508-f503-46cd-8874-d0c82355ae11@linux.ibm.com>
Date: Wed, 20 Nov 2024 23:40:03 +0530
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
Subject: Re: [PATCH v2 2/2] powerpc: Large user copy aware of full:rt:lazy
 preemption
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, maddy@linux.ibm.com,
        ankur.a.arora@oracle.com, linux-kernel@vger.kernel.org
References: <20241116192306.88217-1-sshegde@linux.ibm.com>
 <20241116192306.88217-3-sshegde@linux.ibm.com>
 <20241120080041.aNFNqWCz@linutronix.de>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20241120080041.aNFNqWCz@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IK3UphI6nllhhhVGFQWdEnBf_ObDnm6Y
X-Proofpoint-GUID: y09NOR_0zNxj7KvIFErNtz_TijExyeub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200124
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 11/20/24 13:30, Sebastian Andrzej Siewior wrote:
> On 2024-11-17 00:53:06 [+0530], Shrikanth Hegde wrote:
>> Large user copy_to/from (more than 16 bytes) uses vmx instructions to
>> speed things up. Once the copy is done, it makes sense to try schedule
>> as soon as possible for preemptible kernels. So do this for
>> preempt=full/lazy and rt kernel.
>>
>> Not checking for lazy bit here, since it could lead to unnecessary
>> context switches.
>>
>> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   arch/powerpc/lib/vmx-helper.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
>> index d491da8d1838..58ed6bd613a6 100644
>> --- a/arch/powerpc/lib/vmx-helper.c
>> +++ b/arch/powerpc/lib/vmx-helper.c
>> @@ -45,7 +45,7 @@ int exit_vmx_usercopy(void)
>>   	 * set and we are preemptible. The hack here is to schedule a
>>   	 * decrementer to fire here and reschedule for us if necessary.
>>   	 */
>> -	if (IS_ENABLED(CONFIG_PREEMPT) && need_resched())
>> +	if (IS_ENABLED(CONFIG_PREEMPTION) && need_resched())
>>   		set_dec(1);
> 
> Now looking at this again there is a comment why preempt_enable() is
> bad. An interrupt between preempt_enable_no_resched() and set_dec() is
> fine because irq-exit would preempt properly?

I think so. AFAIU the comment says issue lies with amr register not being saved across
context switch. interrupt_exit_kernel_prepare saves it and restore using kuap_kernel_restore.

  Regular preemption works
> again once copy_to_user() is done? So if you copy 1GiB, you are blocked
> for that 1GiB?


yes, regular preemption would work on exit of copy_to_user. Since the preempt_disable was done
before copy starts, i think yes, it would be blocked until it is complete.

> 
>>   	return 0;
>>   }
> 
> Sebastian

nick, mpe; please correct me if i am wrong.


