Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D715A73AD58
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 01:47:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FzYsYuup;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnH975mJSz3bfS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 09:47:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FzYsYuup;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnH8C45QRz3bW1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 09:46:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QnH8950mXz4x07;
	Fri, 23 Jun 2023 09:46:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1687477593;
	bh=1GkVmI2ZymlguPlcm5XdtFDKqqR1lEdsMN3q3f3nGcI=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=FzYsYuupc4aSO9oC+rfh4nbh/7ryMqmsCOw5IQxuSjansoSTg227L9bVw9F7Us9n2
	 bbZYIjW+C71TlpZrLF4whYnsPI3jJ8i5YYZnSxh79CFtEsS2jCdX5Q0/L8jam2kCYP
	 luDWpHqJZADif1GeLIlHdeHVjh+f2ldOLnPkoff9CJtxcq2IgIaIYS/p8kNgbHUZf/
	 yGvkNSJPpm4Dje91xSykyjFj9CtDWP8mjGKjg2nJ74FsoXwcFxoI3C75wLhKMIf5Xt
	 342QStR3e0G1lpTCaRWQp2i79kFhWarIiFk3YSRWxyEOn/dH4K9naZ1ar/3/N0bvnF
	 UlyEyxh8HYFpA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/64e: Fix obtool warnings in exceptions-64e.S
In-Reply-To: <11d08617-8fe6-5d5e-866c-5e30517363f3@csgroup.eu>
References: <20230622112451.735268-1-mpe@ellerman.id.au>
 <11d08617-8fe6-5d5e-866c-5e30517363f3@csgroup.eu>
Date: Fri, 23 Jun 2023 09:46:32 +1000
Message-ID: <875y7fnjqf.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 22/06/2023 =C3=A0 13:24, Michael Ellerman a =C3=A9crit=C2=A0:
>> Since commit aec0ba7472a7 ("powerpc/64: Use -mprofile-kernel for big
>> endian ELFv2 kernels"), this file is checked by objtool. Fix warnings
>> such as:
>>=20
>>    arch/powerpc/kernel/idle_64e.o: warning: objtool: .text+0x20: unannot=
ated intra-function call
>>    arch/powerpc/kernel/exceptions-64e.o: warning: objtool: .text+0x218: =
unannotated intra-function call
>>=20
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>   arch/powerpc/kernel/exceptions-64e.S | 31 ++++++++++++++++------------
>>   1 file changed, 18 insertions(+), 13 deletions(-)
>>=20
>> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/=
exceptions-64e.S
>> index 3f86091e68b3..7ab4c8c0f1ab 100644
>> --- a/arch/powerpc/kernel/exceptions-64e.S
>> +++ b/arch/powerpc/kernel/exceptions-64e.S
>> @@ -1030,8 +1037,7 @@ BAD_STACK_TRAMPOLINE(0xe00)
>>   BAD_STACK_TRAMPOLINE(0xf00)
>>   BAD_STACK_TRAMPOLINE(0xf20)
>>=20=20=20
>> -	.globl	bad_stack_book3e
>> -bad_stack_book3e:
>> +_GLOBAL(bad_stack_book3e)
>>   	/* XXX: Needs to make SPRN_SPRG_GEN depend on exception type */
>>   	mfspr	r10,SPRN_SRR0;		  /* read SRR0 before touching stack */
>>   	ld	r1,PACAEMERGSP(r13)
>
> If we start playing with that now, allthough I have a patch in my=20
> UACCESS validation series that totally disables OBJTOOL for ASM files,

Yeah I saw that, and it's probably a good idea in the interim while
we're getting all the uaccess stuff sorted out.

Though these warnings are firing today in my next branch, so I'll plan
to merge this patch for 6.5 to squash them.

> can we ban _GLOBAL macro and use SYM_FUNC_START / SYM_FUNC_END instead ?

Yeah, I'm not a fan of _GLOBAL, it does too much.

We'd obviously need to override the generic SYMC_FUNC_START to do all
the TOC setup and so on when it's needed.

cheers
