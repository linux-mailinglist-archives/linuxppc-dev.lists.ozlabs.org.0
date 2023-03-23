Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E366C69B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 14:41:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj61c09Lyz3f7Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 00:41:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CJt42yXR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CJt42yXR;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj60d1MkNz3cjJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 00:40:16 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32NDKeU8028263;
	Thu, 23 Mar 2023 13:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=KUH4bgOiK8AMH7tFF3CTLrGAYot0rMXIgbVLcbI9yrI=;
 b=CJt42yXR+wRmVImzas2a26MiKxq5wDXCexE2SgPWMZv9EHWzSjyUJAAVd0uCtGi3FxUS
 i3YJih5z1xhAHae1fkRXDyCyDeKXAF1LJZwAKMSrSlDrJNpdMQfmP5bjDSVPDFriI6XN
 95qCURVB6dsuXsTGu/lEBe/th2qpj66f8Z6/IQhJTbW4lqtquisniOYH2gWiUohvhdmZ
 DqnFCXqrlW5//FSc7DyV4TyQ4sXEDtgt1QhahTpEgWUsZ97yGkMLzP3MN7Zrv2awrPAC
 YJHTpIet7+KVBOQslJawukK5e6JpgkvdVxjE+qboko58zhQA3iL3c0N/ZlAGMz/skwdS hA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgk65qfgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 13:40:07 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32NCvZ0S026924;
	Thu, 23 Mar 2023 13:40:07 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgk65qfgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 13:40:07 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32NCe3pq032034;
	Thu, 23 Mar 2023 13:40:06 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x7652b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 13:40:06 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32NDe4ut27460280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Mar 2023 13:40:04 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1ED858050;
	Thu, 23 Mar 2023 13:40:04 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9638C58054;
	Thu, 23 Mar 2023 13:40:04 +0000 (GMT)
Received: from localhost (unknown [9.211.90.228])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Mar 2023 13:40:04 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 8/8] powerpc/rtas: consume retry statuses in sys_rtas()
In-Reply-To: <87pm8zu7ij.fsf@mpe.ellerman.id.au>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
 <20230220-rtas-queue-for-6-4-v1-8-010e4416f13f@linux.ibm.com>
 <87pm8zu7ij.fsf@mpe.ellerman.id.au>
Date: Thu, 23 Mar 2023 08:40:04 -0500
Message-ID: <87jzz77fij.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: E9yLsHwH4RkIGfh4HlbnA8PKZSLdVktB
X-Proofpoint-GUID: PyoLhJebvpKfne9VVRmNwwsKFYSSVSvc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=946 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230102
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org> writes:
>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>
>> The kernel can handle retrying RTAS function calls in response to
>> -2/990x in the sys_rtas() handler instead of relaying the intermediate
>> status to user space.
>
> This looks good in general.
>
> One query ...
>
>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>> index 47a2aa43d7d4..c330a22ccc70 100644
>> --- a/arch/powerpc/kernel/rtas.c
>> +++ b/arch/powerpc/kernel/rtas.c
>> @@ -1798,7 +1798,6 @@ static bool block_rtas_call(int token, int nargs,
>>  /* We assume to be passed big endian arguments */
>>  SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
>>  {
>> -	struct pin_cookie cookie;
>>  	struct rtas_args args;
>>  	unsigned long flags;
>>  	char *buff_copy, *errbuf = NULL;
>> @@ -1866,20 +1865,25 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
>>  
>>  	buff_copy = get_errorlog_buffer();
>>  
>> -	raw_spin_lock_irqsave(&rtas_lock, flags);
>> -	cookie = lockdep_pin_lock(&rtas_lock);
>> +	do {
>> +		struct pin_cookie cookie;
>>  
>> -	rtas_args = args;
>> -	do_enter_rtas(&rtas_args);
>> -	args = rtas_args;
>> +		raw_spin_lock_irqsave(&rtas_lock, flags);
>> +		cookie = lockdep_pin_lock(&rtas_lock);
>>  
>> -	/* A -1 return code indicates that the last command couldn't
>> -	   be completed due to a hardware error. */
>> -	if (be32_to_cpu(args.rets[0]) == -1)
>> -		errbuf = __fetch_rtas_last_error(buff_copy);
>> +		rtas_args = args;
>> +		do_enter_rtas(&rtas_args);
>> +		args = rtas_args;
>>  
>> -	lockdep_unpin_lock(&rtas_lock, cookie);
>> -	raw_spin_unlock_irqrestore(&rtas_lock, flags);
>> +		/*
>> +		 * Handle error record retrieval before releasing the lock.
>> +		 */
>> +		if (be32_to_cpu(args.rets[0]) == -1)
>> +			errbuf = __fetch_rtas_last_error(buff_copy);
>> +
>> +		lockdep_unpin_lock(&rtas_lock, cookie);
>> +		raw_spin_unlock_irqrestore(&rtas_lock, flags);
>> +	} while (rtas_busy_delay(be32_to_cpu(args.rets[0])));
>
> rtas_busy_delay_early() has the successive_ext_delays case that will
> break out eventually. But if we keep getting plain RTAS_BUSY back from
> RTAS I *think* this loop will never terminate?

Yes, but if this happens, then there is a serious bug in Linux or
RTAS. The only time I've seen something like that on PowerVM is when
Linux corrupted internal RTAS state by not serializing calls correctly.

rtas_busy_delay_early() has a bail-out heuristic, not for RTAS_BUSY, but
for extended delay statuses (990x), which I suspect happen rarely (if
ever) that early. That's there in order to allow boot to proceed and
hopefully get useful messages out in a truly unexpected circumstance.

That said...

> To avoid that, and just as good manners, I think we should have a
> fatal_signal_pending() check, and if that returns true we bail out of
> the syscall with -EINTR ?

That probably makes sense. In its current state, I could see
this patch preventing or delaying OS shutdown in situations where it
wouldn't have occurred before.

I think I would want the bailout condition in this case to be
(fatal_signal_pending() && retries > some_threshold), to reduce the
likelihood of non-"stuck" operations from being left unfinished. And it
should dump a stack trace.
