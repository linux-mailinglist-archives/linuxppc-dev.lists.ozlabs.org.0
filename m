Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1F7807D8B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 02:03:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=loWB6L6b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlwxF6s4Tz3cTT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 12:02:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=loWB6L6b;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlwwN5cslz3bPM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 12:02:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701910928;
	bh=j/ba/ghyLsIZ3yidUWsq6+1PtYqosOF6FIHgmBLm4Go=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=loWB6L6bNfywNWJuRLWQ6SDqBSNat9dF7v4Skspmd726/+8u/IiZ42tbTn+NsozJq
	 I/8952TJtWTp9ooqVVtpLilvzcvfJgU64LJ7PHPJCWDkrZ05rk27pJKv39sAVo7DJB
	 DQa2ubBNuZPGyvEPW6D0hnXRHofBbn3JnAxRJDNtC1YIIsbnlMyQ90Mfl0MYq1Jtin
	 bjvRAVGsrBAua+gtXE7Zs5+uBorHQd4gyPmf6hBWDdPvvyzbh/iSOWVWOosNPWiOoY
	 Kv/xITis26SiYnb+VwuC6ZK02ckDdFPVgzr3nSvEe/cuJNZpdXRa/dhGnXkiK3FyDt
	 E5PFrjgIhSklw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SlwwH4wNVz4wcH;
	Thu,  7 Dec 2023 12:02:07 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 05/13] powerpc/rtas: Facilitate high-level call
 sequences
In-Reply-To: <87sf4gk2y5.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-5-b794d8cb8502@linux.ibm.com>
 <87sf4p33zg.fsf@mail.lhotse>
 <87jzq11nsj.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <874jh43dcn.fsf@mail.lhotse>
 <877clz14ii.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <87plzq271r.fsf@mail.lhotse>
 <871qc623z2.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <87sf4gk2y5.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Date: Thu, 07 Dec 2023 12:02:02 +1100
Message-ID: <871qbyg705.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>>>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>>>>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>>>>>> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
>>>>>>> writes:
>>>>>>>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>>>>>>>
>>>>>>>> On RTAS platforms there is a general restriction that the OS must not
>>>>>>>> enter RTAS on more than one CPU at a time. This low-level
>>>>>>>> serialization requirement is satisfied by holding a spin
>>>>>>>> lock (rtas_lock) across most RTAS function invocations.
>>>>>>> ...
>>>>>>>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>>>>>>>> index 1fc0b3fffdd1..52f2242d0c28 100644
>>>>>>>> --- a/arch/powerpc/kernel/rtas.c
>>>>>>>> +++ b/arch/powerpc/kernel/rtas.c
>>>>>>>> @@ -581,6 +652,28 @@ static const struct rtas_function *rtas_token_to_function(s32 token)
>>>>>>>>  	return NULL;
>>>>>>>>  }
>>>>>>>>  
>>>>>>>> +static void __rtas_function_lock(struct rtas_function *func)
>>>>>>>> +{
>>>>>>>> +	if (func && func->lock)
>>>>>>>> +		mutex_lock(func->lock);
>>>>>>>> +}
>>>>>>>
>>>>>>> This is obviously going to defeat most static analysis tools.
>>>>>>
>>>>>> I guess it's not that obvious to me :-) Is it because the mutex_lock()
>>>>>> is conditional? I'll improve this if it's possible.
>>>>>
>>>>> Well maybe I'm not giving modern static analysis tools enough credit :)
>>>>>
>>>>> But what I mean that it's not easy to reason about what the function
>>>>> does in isolation. ie. all you can say is that it may or may not lock a
>>>>> mutex, and you can't say which mutex.
>>>>
>>>> I've pulled the thread on this a little bit and here is what I can do:
>>>>
>>>> * Discard rtas_lock_function() and rtas_unlock_function() and make the
>>>>   function mutexes extern as needed. As of now only
>>>>   rtas_ibm_get_vpd_lock will need to be exposed. This enables us to put
>>>>   __acquires(), __releases(), and __must_hold() annotations in
>>>>   papr-vpd.c since it explicitly manipulates the mutex.
>>>>
>>>> * Then sys_rtas() becomes the only site that needs
>>>>   __rtas_function_lock() and __rtas_function_unlock(), which can be
>>>>   open-coded and commented (and, one hopes, not emulated elsewhere).
>>>>
>>>> This will look something like:
>>>>
>>>> SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
>>>> {
>>>>         struct rtas_function *func = rtas_token_to_function(token);
>>>>
>>>>         if (func->lock)
>>>>                 mutex_lock(func->lock);
>>>>
>>>>         [ ... acquire rtas_lock, enter RTAS, fetch any errors ... ]
>>>>
>>>>         if (func->lock)
>>>>                 mutex_unlock(func->lock);
>>>>
>>>> The indirection seems unavoidable since we're working backwards from a
>>>> token value (supplied by the user and not known at build time) to the
>>>> function descriptor.
>>>>
>>>> Is that tolerable for now?
>>>
>>> Yeah. Thanks for looking into it.
>>>
>>> I wasn't unhappy with the original version, but just slightly uneasy
>>> about the locking via pointer.
>>>
>>> But that new proposal sounds good, more code will have static lock
>>> annotations, and only sys_rtas() which is already weird, will have the
>>> dynamic stuff.
>>
>> OK, I'll work that up then.
>
> Well, apparently the annotations aren't useful with mutexes; see these
> threads:
>
> https://lore.kernel.org/all/8e8d93ee2125c739caabe5986f40fa2156c8b4ce.1579893447.git.jbi.octave@gmail.com/
> https://lore.kernel.org/all/20200601184552.23128-5-jbi.octave@gmail.com/
>
> And indeed I can't get sparse to accept them when added to the papr-vpd
> code:
>
> $ make C=2 arch/powerpc/platforms/pseries/papr-vpd.o
>   CHECK   scripts/mod/empty.c
>   CALL    scripts/checksyscalls.sh
>   CHECK   arch/powerpc/platforms/pseries/papr-vpd.c
>     arch/powerpc/platforms/pseries/papr-vpd.c:235:13: warning: context
>       imbalance in 'vpd_sequence_begin' - wrong count at exit
>     arch/powerpc/platforms/pseries/papr-vpd.c:269:13: warning: context
>       imbalance in 'vpd_sequence_end' - wrong count at exit

Oof. Sorry to send you on that goose chase.

> I don't think it's my own mistake since I see existing code with the
> same problem, such as net/core/sock.c:
>
> static void *proto_seq_start(struct seq_file *seq, loff_t *pos)
> 	__acquires(proto_list_mutex)
> {
> 	mutex_lock(&proto_list_mutex);
> 	return seq_list_start_head(&proto_list, *pos);
> }
>
> static void proto_seq_stop(struct seq_file *seq, void *v)
> 	__releases(proto_list_mutex)
> {
> 	mutex_unlock(&proto_list_mutex);
> }
>
> which yields:
>
> net/core/sock.c:4018:13: warning: context imbalance in 'proto_seq_start'
>   - wrong count at exit
> net/core/sock.c:4030:13: warning: context imbalance in 'proto_seq_stop'
>   - wrong count at exit
>
> So I'll give up on static annotations for this series and look for
> opportunities to add lockdep_assert_held() etc.

OK. There are other static analysers than sparse, and even for lockdep
having more of the locks taken statically is probably still preferable.

But feel free to ignore me and just repost what you had :)

cheers
