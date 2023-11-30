Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BF77FFEB7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 23:47:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TEy4HKJp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShBCb0hKQz3dBd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 09:47:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TEy4HKJp;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShBBn0L0wz2xwH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 09:46:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701384400;
	bh=moskZvSb4BF9mas0IlGag6HgLPlgR0ekNP5m2ySRmNw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TEy4HKJpAlyx39eqv1hyPt3qTmZxupcsxxsExXzb1t+lxvV7TJYRsx0dPkJZDyKy9
	 5qk3lj7q6N3r312dd6rMG4LAz+GQTAWyXvmrR/iOR7M1KOCYs/yO/UqHVZVz2Q2jXM
	 f6rHGitLnBzr5W5RS6bYKvJ2RGdfZogiZ8x3RdyFBDQDK20kZlO7C7iYDuchIf1jRu
	 85jjKOEt6QVSz92xgqxX+2hIA36Fy1LgYsw4ZHm0E83AlUdG0Of1EnvhiPvy2y/His
	 GMQ2mGjrBsCdUUuQ4+atfN7Owbo4Lr+HVNgUumNNWfE+Ejttid1199vq67rM62oYEy
	 3i0ZCQR3ECi6g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ShBBm4dRRz4xWc;
	Fri,  1 Dec 2023 09:46:40 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Nathan Lynch via B4 Relay
 <devnull+nathanl.linux.ibm.com@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH v4 05/13] powerpc/rtas: Facilitate high-level call
 sequences
In-Reply-To: <877clz14ii.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-5-b794d8cb8502@linux.ibm.com>
 <87sf4p33zg.fsf@mail.lhotse>
 <87jzq11nsj.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <874jh43dcn.fsf@mail.lhotse>
 <877clz14ii.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Date: Fri, 01 Dec 2023 09:46:40 +1100
Message-ID: <87plzq271r.fsf@mail.lhotse>
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
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>>> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
>>>> writes:
>>>>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>>>>
>>>>> On RTAS platforms there is a general restriction that the OS must not
>>>>> enter RTAS on more than one CPU at a time. This low-level
>>>>> serialization requirement is satisfied by holding a spin
>>>>> lock (rtas_lock) across most RTAS function invocations.
>>>> ...
>>>>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>>>>> index 1fc0b3fffdd1..52f2242d0c28 100644
>>>>> --- a/arch/powerpc/kernel/rtas.c
>>>>> +++ b/arch/powerpc/kernel/rtas.c
>>>>> @@ -581,6 +652,28 @@ static const struct rtas_function *rtas_token_to_function(s32 token)
>>>>>  	return NULL;
>>>>>  }
>>>>>  
>>>>> +static void __rtas_function_lock(struct rtas_function *func)
>>>>> +{
>>>>> +	if (func && func->lock)
>>>>> +		mutex_lock(func->lock);
>>>>> +}
>>>>
>>>> This is obviously going to defeat most static analysis tools.
>>>
>>> I guess it's not that obvious to me :-) Is it because the mutex_lock()
>>> is conditional? I'll improve this if it's possible.
>>
>> Well maybe I'm not giving modern static analysis tools enough credit :)
>>
>> But what I mean that it's not easy to reason about what the function
>> does in isolation. ie. all you can say is that it may or may not lock a
>> mutex, and you can't say which mutex.
>
> I've pulled the thread on this a little bit and here is what I can do:
>
> * Discard rtas_lock_function() and rtas_unlock_function() and make the
>   function mutexes extern as needed. As of now only
>   rtas_ibm_get_vpd_lock will need to be exposed. This enables us to put
>   __acquires(), __releases(), and __must_hold() annotations in
>   papr-vpd.c since it explicitly manipulates the mutex.
>
> * Then sys_rtas() becomes the only site that needs
>   __rtas_function_lock() and __rtas_function_unlock(), which can be
>   open-coded and commented (and, one hopes, not emulated elsewhere).
>
> This will look something like:
>
> SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
> {
>         struct rtas_function *func = rtas_token_to_function(token);
>
>         if (func->lock)
>                 mutex_lock(func->lock);
>
>         [ ... acquire rtas_lock, enter RTAS, fetch any errors ... ]
>
>         if (func->lock)
>                 mutex_unlock(func->lock);
>
> The indirection seems unavoidable since we're working backwards from a
> token value (supplied by the user and not known at build time) to the
> function descriptor.
>
> Is that tolerable for now?

Yeah. Thanks for looking into it.

I wasn't unhappy with the original version, but just slightly uneasy
about the locking via pointer.

But that new proposal sounds good, more code will have static lock
annotations, and only sys_rtas() which is already weird, will have the
dynamic stuff.

> Alternatively, sys_rtas() could be refactored into locking and
> non-locking paths, e.g.
>
> static long __do_sys_rtas(struct rtas_function *func)
> {
> 	// [ ... acquire rtas_lock, enter RTAS, fetch any error etc ... ]
> }
>
> static long do_sys_rtas(struct rtas_function *func, struct mutex *mtx)
> {
> 	mutex_lock(mtx);
> 	ret = __do_sys_rtas(func);
> 	mutex_unlock(mtx);
>
> 	return ret;
> }
>
> SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
> {
> 	// real code does copy_from_user etc
> 	struct rtas_function *func = rtas_token_to_function(uargs->token);
> 	long ret;
>
> 	// [ ... input validation and filtering ... ]
>
> 	if (func->lock)
> 		ret = do_sys_rtas(func, func->lock);
> 	else
> 		ret = __do_sys_rtas(func);
>
> 	// [ ... copy out results ... ]
>
> 	return ret;
> }

You could go even further and switch on the token, and handle each case
separately so that you can then statically take the appropriate lock.
But that's probably overkill.

cheers
