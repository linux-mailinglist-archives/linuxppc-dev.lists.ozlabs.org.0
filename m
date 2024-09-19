Return-Path: <linuxppc-dev+bounces-1464-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF0D97CB16
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 16:39:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8dTH4NvWz2yHL;
	Fri, 20 Sep 2024 00:39:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726756787;
	cv=none; b=Ir0wjyQmg2AckrhHxfRd06pEplMe+TaS/NPkIAx3pfU4iKuiAdApnLIGVcV6orwzxmy0hpuF1IXzrcDbZDdW1YUYXxyZbaBTBOWA/EqCncHRnm01dp2A0jsKfYoLeptoxzp1YG6ChZnZVuDg1i3Sl+75H5aRxb60j3Wo0aHOAzePYLnvxpPrAHujJR8zTEl8Fcp/JjQ/un/InaVxzQtr/huOtBi7xffHPkqAct/822bJK31/w1SEwBfpvKn/Q10EmAtkFqFDulNUHsZzZgr9+KjLecVdIq2MPFVEF8c63DGPi53UrUzLDqb7p9TDLyuAMJviwmrNuauVEakS7e20hA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726756787; c=relaxed/relaxed;
	bh=zrYW14xeKA5arYuq7CrZ2lrT50VUFKTmwcSm+Y0QXTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ikD9lzcm008fGK+qTuoqb8vCBpAHM+BBYCGD7ITuEScxODzVD6riwfxOM/1OphnwkMXJAlgnL9TG6t3FtsGJk57k+BbCWT9rrqyQyrtLNhFEwKV4j/ebMku5CEHG8JLcEmTUA1HTqz0JBcssiZdWTjBxkfhyar2G7G1wEvIJqzZstmEC+DgvOB9Lh5t6Dpsq5eVetE88lZwdNFTpqs/Lmtde/BUdF3NAwJAQ4e2dvbs7zhyw1IMy64d+GXfMkvd0hY+/5OefHfF06VLHCeos8pxMhjL1CDNxKQXZX7vEILIeL0suvdOwlNdJ/hsPDjgK1HnYurhBOqD9jEBVh/eVsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=acuMU3PX; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=acuMU3PX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8dTG6gTnz2xYw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 00:39:46 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JDodSe019533;
	Thu, 19 Sep 2024 14:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=z
	rYW14xeKA5arYuq7CrZ2lrT50VUFKTmwcSm+Y0QXTs=; b=acuMU3PXExVuBefZh
	hsnyYP5UUmrspbNmB1ph7/naz/D0ClFBIbtirP27inYLRPGMAjUbiwTK9M84lkQP
	sYDSyx3mL2d4vdBCZ+Oq9+SYpFNTUdGQoRF4+wGtcLf3nB+FcpdBI3rGgYx8guZj
	/WfonT30aTNysxCK3xfzNge8LVW1sdiFXwoPu8+ImbjijHkvXhf9vc3+/GOy8wRi
	QcK5ekbYriVsfy5fXPD6uL+t/0QtZ3ywbn11mMCHKqP9TNqinkvZ13+vMugtI5ty
	p5UIOxjEuN+cPvZ7rrX8ArkC+37tATpb8n+kImU0oM4/DUOag/6bxXJQ0m7etKgA
	R+aVw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n41awafg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 14:39:30 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48JEdUax006078;
	Thu, 19 Sep 2024 14:39:30 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n41awafa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 14:39:30 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48JEMCcf001822;
	Thu, 19 Sep 2024 14:39:29 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 41nqh41ma4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 14:39:29 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48JEdT9336372920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Sep 2024 14:39:29 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1002858056;
	Thu, 19 Sep 2024 14:39:29 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 067F658052;
	Thu, 19 Sep 2024 14:39:27 +0000 (GMT)
Received: from [9.61.250.147] (unknown [9.61.250.147])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Sep 2024 14:39:26 +0000 (GMT)
Message-ID: <c8c28050-8c6e-45b1-8b70-06cf5e0921e6@linux.vnet.ibm.com>
Date: Thu, 19 Sep 2024 20:09:25 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch] Re: [PowerPC][Linux-next][6.11.0-rc4-next-20240820] OOPs
 while running LTP FS Stress
To: Mike Galbraith <efault@gmx.de>, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, peterz@infradead.org,
        vschneid@redhat.com, mingo@kernel.org, sfr@canb.auug.org.au
References: <82b9c434-a0fd-4488-95be-a45b8cd4b6e6@linux.vnet.ibm.com>
 <2fb24ab402d9de45e3cf16e6ba0ad23a7843e5c1.camel@gmx.de>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
In-Reply-To: <2fb24ab402d9de45e3cf16e6ba0ad23a7843e5c1.camel@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jLpS5dmX7wLMCiCabYL8ztCV_WAk7tQs
X-Proofpoint-ORIG-GUID: RYY-D4qbZEgZA8Y4uTORzmLegqGOCUzV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_10,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409190095

Hello Mike,

Thanks for the patch. I applied your patch and verified the issue, and 
can confirm your patch fixes the issue.


Please add the below tags.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>

Tested-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>


Regards,

Venkat.

On 19/09/24 11:39 am, Mike Galbraith wrote:
> On Mon, 2024-09-16 at 12:00 +0530, Venkat Rao Bagalkote wrote:
>> Greetings!!!
> Greetings,
>
>> I am seeing below kernel crash from 6.11.0-rc4-next-20240820.
>>
>>
>> Tried to do git bisect, but it didnt point to right patch. Attached is
>> the bisect log.
>>
>> Any help in fixing this is much appriciated.
> I met this, as well as other ways the wheels can fall off that turned
> out to have the same root.  I gave Peter a heads up with diag offline,
> but having now convinced myself that all is well, I'll go ahead and
> post a patchlet.
>
> At the very least it's worth putting out for wider testing.. and should
> anyone have something prettier in mind, yeah, do that instead.
>
> sched: Fix sched_delayed vs cfs_bandwidth
>
> Meeting an unfinished DELAY_DEQUEUE treated entity in unthrottle_cfs_rq()
> leads to a couple terminal scenarios.  Finish it first, so ENQUEUE_WAKEUP
> can proceed as it would have sans DELAY_DEQUEUE treatment.
>
> Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
> Signed-off-by: Mike Galbraith <efault@gmx.de>
> ---
>   kernel/sched/fair.c |   10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -6049,10 +6049,14 @@ void unthrottle_cfs_rq(struct cfs_rq *cf
>   	for_each_sched_entity(se) {
>   		struct cfs_rq *qcfs_rq = cfs_rq_of(se);
>
> -		if (se->on_rq) {
> -			SCHED_WARN_ON(se->sched_delayed);
> -			break;
> +		/* Handle any unfinished DELAY_DEQUEUE business first. */
> +		if (unlikely(se->on_rq && se->sched_delayed)) {
> +			int flags = DEQUEUE_SLEEP | DEQUEUE_SPECIAL;
> +
> +			dequeue_entity(qcfs_rq, se, flags | DEQUEUE_DELAYED);
>   		}
> +		if (se->on_rq)
> +			break;
>   		enqueue_entity(qcfs_rq, se, ENQUEUE_WAKEUP);
>
>   		if (cfs_rq_is_idle(group_cfs_rq(se)))
>
>

