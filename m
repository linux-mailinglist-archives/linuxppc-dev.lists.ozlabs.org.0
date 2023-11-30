Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B547D7FF94F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 19:27:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kCTnnBss;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sh4S11hjGz3dH1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 05:27:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kCTnnBss;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sh4R857GSz2ys9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 05:27:00 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AUHRTjl020347;
	Thu, 30 Nov 2023 18:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=twz/TpNckKKWfURA7ZbF584tULNAS6XFwi5DomePaP0=;
 b=kCTnnBssbvgJgmGaWdhGAqgoRYqtTVafPoWspJAI5mcLiqqMoKWA0uZfeDN1UrNxyGUX
 ppKqS3+iHazyo43YrytOMI99gT07UoXlO9liGEIM/INED2k4OKeEuhhMLjqEUKlCiZEQ
 tUvsfxloZ/CldoDsLRCX231HvU96nXE5IoR6AzZkNglw8RxvgDEhNmX5CEOka9GDZy2M
 d1kDiq4dWtZAPwMKRIlz0iLhmpdyifSb1LXJ5VNQkZfesaESoeBce3c7eoipJbkEpGRX
 39u8mnFz1pjk86XK2Jk+BRx1pRr4F68QXXrJMAIlfxTUsE01PkCBBSfvSF/4gL3j4Cbk xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3upxta9fcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 18:26:48 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AUHfptT030324;
	Thu, 30 Nov 2023 18:26:47 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3upxta9fbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 18:26:47 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AUHJFQB018947;
	Thu, 30 Nov 2023 18:26:46 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ukwfkfmpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 18:26:46 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AUIQkCV18219680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Nov 2023 18:26:46 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0870A5805C;
	Thu, 30 Nov 2023 18:26:46 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E79115805A;
	Thu, 30 Nov 2023 18:26:45 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Nov 2023 18:26:45 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nathan Lynch via B4 Relay
 <devnull+nathanl.linux.ibm.com@kernel.org>,
        Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH v4 05/13] powerpc/rtas: Facilitate high-level call
 sequences
In-Reply-To: <874jh43dcn.fsf@mail.lhotse>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-5-b794d8cb8502@linux.ibm.com>
 <87sf4p33zg.fsf@mail.lhotse>
 <87jzq11nsj.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <874jh43dcn.fsf@mail.lhotse>
Date: Thu, 30 Nov 2023 12:26:45 -0600
Message-ID: <877clz14ii.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eTBpb8gHF9JseH9Sjcf6dA7mD5JJuE-7
X-Proofpoint-GUID: gMVx1dacNY6PSvlLRGlhpsHe0fzu6naS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_18,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300135
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
Cc: tyreld@linux.ibm.com, Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>
>>> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
>>> writes:
>>>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>>>
>>>> On RTAS platforms there is a general restriction that the OS must not
>>>> enter RTAS on more than one CPU at a time. This low-level
>>>> serialization requirement is satisfied by holding a spin
>>>> lock (rtas_lock) across most RTAS function invocations.
>>> ...
>>>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>>>> index 1fc0b3fffdd1..52f2242d0c28 100644
>>>> --- a/arch/powerpc/kernel/rtas.c
>>>> +++ b/arch/powerpc/kernel/rtas.c
>>>> @@ -581,6 +652,28 @@ static const struct rtas_function *rtas_token_to_function(s32 token)
>>>>  	return NULL;
>>>>  }
>>>>  
>>>> +static void __rtas_function_lock(struct rtas_function *func)
>>>> +{
>>>> +	if (func && func->lock)
>>>> +		mutex_lock(func->lock);
>>>> +}
>>>
>>> This is obviously going to defeat most static analysis tools.
>>
>> I guess it's not that obvious to me :-) Is it because the mutex_lock()
>> is conditional? I'll improve this if it's possible.
>
> Well maybe I'm not giving modern static analysis tools enough credit :)
>
> But what I mean that it's not easy to reason about what the function
> does in isolation. ie. all you can say is that it may or may not lock a
> mutex, and you can't say which mutex.

I've pulled the thread on this a little bit and here is what I can do:

* Discard rtas_lock_function() and rtas_unlock_function() and make the
  function mutexes extern as needed. As of now only
  rtas_ibm_get_vpd_lock will need to be exposed. This enables us to put
  __acquires(), __releases(), and __must_hold() annotations in
  papr-vpd.c since it explicitly manipulates the mutex.

* Then sys_rtas() becomes the only site that needs
  __rtas_function_lock() and __rtas_function_unlock(), which can be
  open-coded and commented (and, one hopes, not emulated elsewhere).

This will look something like:

SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
{
        struct rtas_function *func = rtas_token_to_function(token);

        if (func->lock)
                mutex_lock(func->lock);

        [ ... acquire rtas_lock, enter RTAS, fetch any errors ... ]

        if (func->lock)
                mutex_unlock(func->lock);

The indirection seems unavoidable since we're working backwards from a
token value (supplied by the user and not known at build time) to the
function descriptor.

Is that tolerable for now?

Alternatively, sys_rtas() could be refactored into locking and
non-locking paths, e.g.

static long __do_sys_rtas(struct rtas_function *func)
{
	// [ ... acquire rtas_lock, enter RTAS, fetch any error etc ... ]
}

static long do_sys_rtas(struct rtas_function *func, struct mutex *mtx)
{
	mutex_lock(mtx);
	ret = __do_sys_rtas(func);
	mutex_unlock(mtx);

	return ret;
}

SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
{
	// real code does copy_from_user etc
	struct rtas_function *func = rtas_token_to_function(uargs->token);
	long ret;

	// [ ... input validation and filtering ... ]

	if (func->lock)
		ret = do_sys_rtas(func, func->lock);
	else
		ret = __do_sys_rtas(func);

	// [ ... copy out results ... ]

	return ret;
}
