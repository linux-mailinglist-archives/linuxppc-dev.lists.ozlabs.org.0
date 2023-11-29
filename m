Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D66F67FD7F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 14:24:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fts1g4mc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgKmd2PZnz3vcy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 00:24:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fts1g4mc;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgKh96X9qz3d8y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 00:20:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701264041;
	bh=OKAi9zgo4g/bQmTQBdSLrAuecjEinmMfHE8kTBND2a4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fts1g4mcy4taQ5OHfOyhbSUVs1VaZeepZzt/j252B/6z2thNSOWbTMrW4blrtMRLD
	 /61egxE82F1NBJmTzR44XvykIn11Tc8rG1CSoiAxOpLoShN93wrVpl4WdCm1C6MFr0
	 yJG2u/WYaLk5ayZuhO0TcB8JF+du+4JaVqUqFNN12wEmfx6N0q+kYrGu4lht3j9Vky
	 mwuGKJVHIvQbMZY+xqGdzAm94IF/Uoo+x6sIfaZ9vAT6muBfcJkGRztj5lPZraHnA9
	 TNkFCzIzDs0vCyqzZzlkHgL4EhMTyoYD1DVd04NAtqkG5IiM8yfm9HP4/1XWAgAimX
	 Efe/nAtm9uYsA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SgKh91f3Hz4x5q;
	Thu, 30 Nov 2023 00:20:41 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Nathan Lynch via B4 Relay
 <devnull+nathanl.linux.ibm.com@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH v4 05/13] powerpc/rtas: Facilitate high-level call
 sequences
In-Reply-To: <87jzq11nsj.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-5-b794d8cb8502@linux.ibm.com>
 <87sf4p33zg.fsf@mail.lhotse>
 <87jzq11nsj.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Date: Thu, 30 Nov 2023 00:20:40 +1100
Message-ID: <874jh43dcn.fsf@mail.lhotse>
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
>
>> Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
>> writes:
>>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>>
>>> On RTAS platforms there is a general restriction that the OS must not
>>> enter RTAS on more than one CPU at a time. This low-level
>>> serialization requirement is satisfied by holding a spin
>>> lock (rtas_lock) across most RTAS function invocations.
>> ...
>>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>>> index 1fc0b3fffdd1..52f2242d0c28 100644
>>> --- a/arch/powerpc/kernel/rtas.c
>>> +++ b/arch/powerpc/kernel/rtas.c
>>> @@ -581,6 +652,28 @@ static const struct rtas_function *rtas_token_to_function(s32 token)
>>>  	return NULL;
>>>  }
>>>  
>>> +static void __rtas_function_lock(struct rtas_function *func)
>>> +{
>>> +	if (func && func->lock)
>>> +		mutex_lock(func->lock);
>>> +}
>>
>> This is obviously going to defeat most static analysis tools.
>
> I guess it's not that obvious to me :-) Is it because the mutex_lock()
> is conditional? I'll improve this if it's possible.

Well maybe I'm not giving modern static analysis tools enough credit :)

But what I mean that it's not easy to reason about what the function
does in isolation. ie. all you can say is that it may or may not lock a
mutex, and you can't say which mutex.

>> I assume lockdep is OK with it though?
>
> Seems to be, yes.

OK.

cheers
