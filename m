Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAF566B4EE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 01:21:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwCPk2THYz3cGd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 11:21:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LhY5/bEi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwCNn53gxz3c2q
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 11:20:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LhY5/bEi;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NwCNn3LdRz4xN6;
	Mon, 16 Jan 2023 11:20:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1673828457;
	bh=52nFIwKeEQcYByXCONHswUZf4ScCbGXOEUOFwopA0q4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LhY5/bEivg+F0DFpzSustsR80Fy76zyLAyS7q+1BCcmMWBxYEOK12g6NQIaNWh8dD
	 BJCrfL2ifxX+VzryqPCCm7T2YL6or+fqEKXc4E79cbWMYBSmxV1IVB0UYgqSduscpV
	 eyKu8Vv0tP+vRVNQvG/MGZWWEUpnH9J/xIiGUVw12nkNlREh7WdS+JnEsl4FU8/VoX
	 +RbQ2CBsb8B0ryoQ+HrUQPoh0lT5U704me2jojH4bns0Kwh8z1O2AW6+6eXvsw28Qf
	 HZ5CrrTTNwo9VyEKEl4f95Cw/OphtmoUfAteP+cm2VbZYxSCH4UD1WazCGnQFjKr+1
	 8i26oTPPNMKBA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Laurent Dufour
 <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/rtas: upgrade internal arch spinlocks
In-Reply-To: <87zganpsvy.fsf@linux.ibm.com>
References: <20230110044255.122616-1-nathanl@linux.ibm.com>
 <3c4f68a0-b1f9-d456-ab12-9ea75263d94c@linux.ibm.com>
 <87zganpsvy.fsf@linux.ibm.com>
Date: Mon, 16 Jan 2023 11:20:56 +1100
Message-ID: <87k01n9vo7.fsf@mpe.ellerman.id.au>
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Laurent Dufour <ldufour@linux.ibm.com> writes:
>> On 10/01/2023 05:42:55, Nathan Lynch wrote:
>>> --- a/arch/powerpc/include/asm/rtas-types.h
>>> +++ b/arch/powerpc/include/asm/rtas-types.h
>>> @@ -18,7 +18,7 @@ struct rtas_t {
>>>  	unsigned long entry;		/* physical address pointer */
>>>  	unsigned long base;		/* physical address pointer */
>>>  	unsigned long size;
>>> -	arch_spinlock_t lock;
>>> +	raw_spinlock_t lock;
>>>  	struct rtas_args args;
>>>  	struct device_node *dev;	/* virtual address pointer */
>>>  };
>>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>>> index deded51a7978..a834726f18e3 100644
>>> --- a/arch/powerpc/kernel/rtas.c
>>> +++ b/arch/powerpc/kernel/rtas.c
>>> @@ -61,7 +61,7 @@ static inline void do_enter_rtas(unsigned long args)
>>>  }
>>>  
>>>  struct rtas_t rtas = {
>>> -	.lock = __ARCH_SPIN_LOCK_UNLOCKED
>>> +	.lock = __RAW_SPIN_LOCK_UNLOCKED(rtas.lock),
>>>  };
>>>  EXPORT_SYMBOL(rtas);
>>
>> This is not the scope of this patch, but the RTAS's lock is externalized
>> through the structure rtas_t, while it is only used in that file.
>>
>> I think, this would be good, in case of future change about that lock, and
>> in order to not break KABI, to move it out of that structure, and to define
>> it statically in that file.
>
> Thanks for pointing this out.
>
> /* rtas-types.h */
> struct rtas_t {
> 	unsigned long entry;		/* physical address pointer */
> 	unsigned long base;		/* physical address pointer */
> 	unsigned long size;
> 	raw_spinlock_t lock;
> 	struct rtas_args args;
> 	struct device_node *dev;	/* virtual address pointer */
> };
>
> /* rtas.h */
> extern struct rtas_t rtas;
>
> There's C and asm code outside of rtas.c that accesses rtas.entry,
> rtas.base, rtas.size, and rtas.dev. But as you say, rtas.lock is used
> only in rtas.c, and it's hard to imagine any legitimate external
> use. This applies to the args member as well, since accesses must occur
> under the lock.
>
> Making the lock and args private to rtas.c seems desirable on its own,
> so I think that should be done first as a cleanup, followed by the
> riskier arch -> raw lock conversion.

I don't see any reason why `rtas` is exported at all.

There might have been in the past, but I don't see one any more.

So I'd be happy if we removed the EXPORT entirely. If it breaks
something we can always put it back.

cheers
