Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B62D6805A87
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 17:54:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QT91pOiE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sl67c1Tz2z3d8S
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 03:54:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QT91pOiE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sl66l2qW4z3cLQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 03:53:19 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B5GRKAR021718;
	Tue, 5 Dec 2023 16:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=6z+4aSGkX0C8sh32Dh4puLLnTPzHE0UepW2m2Y8DuKs=;
 b=QT91pOiE0ReUKPsQCvXofwgWmX6XnDAZSq8S6z+uk2X1CPuU/zT2J43xwpFdMxnYcc+m
 OuqqSwg0WZ5liljmlLwDGWw+gYZGbRjZ1kh/pQ+YWdzebh5aXcMgaMQOh/NgZsv4aHN6
 YhK2ZDnwq/+MBtWgq8KDOVTdQARt9JQ/5LUt+4DhHTVNjHqxTa9+saGO2EY0N2WslVSI
 e/odk4Xvwn6I3HPeucbYgJ8gZGY1EZF79RR8gcgOWjgrNEzG4MBHgDFl2WIT6Z7Qy3XR
 CMYRVqdd24SVinQllXdr561awuVcAeB58uswCQ0CVvn0eP0HzokCWjlxSaKi358taJHJ gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ut7d68u8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 16:53:13 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B5GT6Kh028010;
	Tue, 5 Dec 2023 16:53:12 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ut7d68twp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 16:53:12 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B5GjAZd009150;
	Tue, 5 Dec 2023 16:51:31 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3urgdkythn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 16:51:31 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B5GpUWt41877996
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Dec 2023 16:51:31 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96C4C58056;
	Tue,  5 Dec 2023 16:51:30 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FD5958065;
	Tue,  5 Dec 2023 16:51:30 +0000 (GMT)
Received: from localhost (unknown [9.61.95.155])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 Dec 2023 16:51:30 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 05/13] powerpc/rtas: Facilitate high-level call
 sequences
In-Reply-To: <871qc623z2.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-5-b794d8cb8502@linux.ibm.com>
 <87sf4p33zg.fsf@mail.lhotse>
 <87jzq11nsj.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <874jh43dcn.fsf@mail.lhotse>
 <877clz14ii.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <87plzq271r.fsf@mail.lhotse>
 <871qc623z2.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Date: Tue, 05 Dec 2023 10:51:30 -0600
Message-ID: <87sf4gk2y5.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mQy7zw5r-uTkYocVf9tpvsQs4zOBRSzg
X-Proofpoint-GUID: IKNJuBgp9YkyOL-Y55Llbhkszt1lF-3P
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-05_12,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312050133
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

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>>>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>>>>> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
>>>>>> writes:
>>>>>>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>>>>>>
>>>>>>> On RTAS platforms there is a general restriction that the OS must not
>>>>>>> enter RTAS on more than one CPU at a time. This low-level
>>>>>>> serialization requirement is satisfied by holding a spin
>>>>>>> lock (rtas_lock) across most RTAS function invocations.
>>>>>> ...
>>>>>>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>>>>>>> index 1fc0b3fffdd1..52f2242d0c28 100644
>>>>>>> --- a/arch/powerpc/kernel/rtas.c
>>>>>>> +++ b/arch/powerpc/kernel/rtas.c
>>>>>>> @@ -581,6 +652,28 @@ static const struct rtas_function *rtas_token_to_function(s32 token)
>>>>>>>  	return NULL;
>>>>>>>  }
>>>>>>>  
>>>>>>> +static void __rtas_function_lock(struct rtas_function *func)
>>>>>>> +{
>>>>>>> +	if (func && func->lock)
>>>>>>> +		mutex_lock(func->lock);
>>>>>>> +}
>>>>>>
>>>>>> This is obviously going to defeat most static analysis tools.
>>>>>
>>>>> I guess it's not that obvious to me :-) Is it because the mutex_lock()
>>>>> is conditional? I'll improve this if it's possible.
>>>>
>>>> Well maybe I'm not giving modern static analysis tools enough credit :)
>>>>
>>>> But what I mean that it's not easy to reason about what the function
>>>> does in isolation. ie. all you can say is that it may or may not lock a
>>>> mutex, and you can't say which mutex.
>>>
>>> I've pulled the thread on this a little bit and here is what I can do:
>>>
>>> * Discard rtas_lock_function() and rtas_unlock_function() and make the
>>>   function mutexes extern as needed. As of now only
>>>   rtas_ibm_get_vpd_lock will need to be exposed. This enables us to put
>>>   __acquires(), __releases(), and __must_hold() annotations in
>>>   papr-vpd.c since it explicitly manipulates the mutex.
>>>
>>> * Then sys_rtas() becomes the only site that needs
>>>   __rtas_function_lock() and __rtas_function_unlock(), which can be
>>>   open-coded and commented (and, one hopes, not emulated elsewhere).
>>>
>>> This will look something like:
>>>
>>> SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
>>> {
>>>         struct rtas_function *func = rtas_token_to_function(token);
>>>
>>>         if (func->lock)
>>>                 mutex_lock(func->lock);
>>>
>>>         [ ... acquire rtas_lock, enter RTAS, fetch any errors ... ]
>>>
>>>         if (func->lock)
>>>                 mutex_unlock(func->lock);
>>>
>>> The indirection seems unavoidable since we're working backwards from a
>>> token value (supplied by the user and not known at build time) to the
>>> function descriptor.
>>>
>>> Is that tolerable for now?
>>
>> Yeah. Thanks for looking into it.
>>
>> I wasn't unhappy with the original version, but just slightly uneasy
>> about the locking via pointer.
>>
>> But that new proposal sounds good, more code will have static lock
>> annotations, and only sys_rtas() which is already weird, will have the
>> dynamic stuff.
>
> OK, I'll work that up then.

Well, apparently the annotations aren't useful with mutexes; see these
threads:

https://lore.kernel.org/all/8e8d93ee2125c739caabe5986f40fa2156c8b4ce.1579893447.git.jbi.octave@gmail.com/
https://lore.kernel.org/all/20200601184552.23128-5-jbi.octave@gmail.com/

And indeed I can't get sparse to accept them when added to the papr-vpd
code:

$ make C=2 arch/powerpc/platforms/pseries/papr-vpd.o
  CHECK   scripts/mod/empty.c
  CALL    scripts/checksyscalls.sh
  CHECK   arch/powerpc/platforms/pseries/papr-vpd.c
    arch/powerpc/platforms/pseries/papr-vpd.c:235:13: warning: context
      imbalance in 'vpd_sequence_begin' - wrong count at exit
    arch/powerpc/platforms/pseries/papr-vpd.c:269:13: warning: context
      imbalance in 'vpd_sequence_end' - wrong count at exit

I don't think it's my own mistake since I see existing code with the
same problem, such as net/core/sock.c:

static void *proto_seq_start(struct seq_file *seq, loff_t *pos)
	__acquires(proto_list_mutex)
{
	mutex_lock(&proto_list_mutex);
	return seq_list_start_head(&proto_list, *pos);
}

static void proto_seq_stop(struct seq_file *seq, void *v)
	__releases(proto_list_mutex)
{
	mutex_unlock(&proto_list_mutex);
}

which yields:

net/core/sock.c:4018:13: warning: context imbalance in 'proto_seq_start'
  - wrong count at exit
net/core/sock.c:4030:13: warning: context imbalance in 'proto_seq_stop'
  - wrong count at exit

So I'll give up on static annotations for this series and look for
opportunities to add lockdep_assert_held() etc.
