Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC087FFFBA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 00:54:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q2q7K9a5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShChV412Tz3cbl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 10:54:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q2q7K9a5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShCgg1N9Rz2xqq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 10:53:18 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AUNFKN5002912;
	Thu, 30 Nov 2023 23:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Xg/5Jwa4n66NeTQv5QtiAd0C3u0Bwv45C0DOAuN8E9c=;
 b=q2q7K9a5+fUH+NOGtUohKfXhIpxe7Sg5TISuRJpRaXLkzCC5qQOFX8XODpvCTwTUkJXr
 ugs8YXGllFpu6wX11XGBnkVcnKpY9RP6kj2TuoTJB5mFMDuwZIWGg6KHH24cfUbuLCXe
 w/xhPDUNvB6GS4x7WWsv/Nxz0GTROqG0xFQk0cXrNHsypa8rxRG63ixYQgNmSoF8YTvJ
 7U8HOEkpzU6wgOY3yN9QWp15FRnsOif4Pjen+evzvf0LAS8SVXRdRXMaG+ha1hv0nBXb
 SLPLcklrcumaTDwZvDIXtXjNw4vagdnBfexyV0yvp12iitFwUVgQrS1RxtFjUP7wvY/Y kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uq3ds98ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 23:53:08 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AUNkwlq024757;
	Thu, 30 Nov 2023 23:53:08 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uq3ds98cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 23:53:07 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AUMdoX0012763;
	Thu, 30 Nov 2023 23:53:07 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uku8thxdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 23:53:07 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AUNr6Sw33686262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Nov 2023 23:53:06 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 019C85805B;
	Thu, 30 Nov 2023 23:53:06 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D2C4058059;
	Thu, 30 Nov 2023 23:53:05 +0000 (GMT)
Received: from localhost (unknown [9.61.1.199])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Nov 2023 23:53:05 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nathan Lynch via B4 Relay
 <devnull+nathanl.linux.ibm.com@kernel.org>,
        Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH v4 05/13] powerpc/rtas: Facilitate high-level call
 sequences
In-Reply-To: <87plzq271r.fsf@mail.lhotse>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-5-b794d8cb8502@linux.ibm.com>
 <87sf4p33zg.fsf@mail.lhotse>
 <87jzq11nsj.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <874jh43dcn.fsf@mail.lhotse>
 <877clz14ii.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <87plzq271r.fsf@mail.lhotse>
Date: Thu, 30 Nov 2023 17:53:05 -0600
Message-ID: <871qc623z2.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KpHuHxGZ9SBymDcoHyHTAXv933YW2D_X
X-Proofpoint-GUID: jsnazGe-iZVRvOqIcvaVWN6qJqcSWRCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300177
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
>>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>>>> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
>>>>> writes:
>>>>>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>>>>>
>>>>>> On RTAS platforms there is a general restriction that the OS must not
>>>>>> enter RTAS on more than one CPU at a time. This low-level
>>>>>> serialization requirement is satisfied by holding a spin
>>>>>> lock (rtas_lock) across most RTAS function invocations.
>>>>> ...
>>>>>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>>>>>> index 1fc0b3fffdd1..52f2242d0c28 100644
>>>>>> --- a/arch/powerpc/kernel/rtas.c
>>>>>> +++ b/arch/powerpc/kernel/rtas.c
>>>>>> @@ -581,6 +652,28 @@ static const struct rtas_function *rtas_token_to_function(s32 token)
>>>>>>  	return NULL;
>>>>>>  }
>>>>>>  
>>>>>> +static void __rtas_function_lock(struct rtas_function *func)
>>>>>> +{
>>>>>> +	if (func && func->lock)
>>>>>> +		mutex_lock(func->lock);
>>>>>> +}
>>>>>
>>>>> This is obviously going to defeat most static analysis tools.
>>>>
>>>> I guess it's not that obvious to me :-) Is it because the mutex_lock()
>>>> is conditional? I'll improve this if it's possible.
>>>
>>> Well maybe I'm not giving modern static analysis tools enough credit :)
>>>
>>> But what I mean that it's not easy to reason about what the function
>>> does in isolation. ie. all you can say is that it may or may not lock a
>>> mutex, and you can't say which mutex.
>>
>> I've pulled the thread on this a little bit and here is what I can do:
>>
>> * Discard rtas_lock_function() and rtas_unlock_function() and make the
>>   function mutexes extern as needed. As of now only
>>   rtas_ibm_get_vpd_lock will need to be exposed. This enables us to put
>>   __acquires(), __releases(), and __must_hold() annotations in
>>   papr-vpd.c since it explicitly manipulates the mutex.
>>
>> * Then sys_rtas() becomes the only site that needs
>>   __rtas_function_lock() and __rtas_function_unlock(), which can be
>>   open-coded and commented (and, one hopes, not emulated elsewhere).
>>
>> This will look something like:
>>
>> SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
>> {
>>         struct rtas_function *func = rtas_token_to_function(token);
>>
>>         if (func->lock)
>>                 mutex_lock(func->lock);
>>
>>         [ ... acquire rtas_lock, enter RTAS, fetch any errors ... ]
>>
>>         if (func->lock)
>>                 mutex_unlock(func->lock);
>>
>> The indirection seems unavoidable since we're working backwards from a
>> token value (supplied by the user and not known at build time) to the
>> function descriptor.
>>
>> Is that tolerable for now?
>
> Yeah. Thanks for looking into it.
>
> I wasn't unhappy with the original version, but just slightly uneasy
> about the locking via pointer.
>
> But that new proposal sounds good, more code will have static lock
> annotations, and only sys_rtas() which is already weird, will have the
> dynamic stuff.

OK, I'll work that up then.
