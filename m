Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5078C75A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 14:07:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g0n6ddhI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vg83z3JFbz3dX4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 22:07:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g0n6ddhI;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vg83C2cpyz3ccX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 22:07:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1715861221;
	bh=eNAEbz0fp/gY1nhw1dpy1yORqplQKqdzXReDnu/+e4g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=g0n6ddhIF7/0X29LcsUDo8Z4BWeTQgdK8scAYY/1iaMbeN5vvDA0gHJNo1eeCezYx
	 gkjsu6a+zNqBDJvvlQUSZp48sk4wwJMUTseU6EDA3ocYioVRc89Of0YdyaemMdRi6M
	 pWkga5jzFG+2LKvxwY+QnrOVi2mT6JYVc5zKFbZ7B197AhdehtvTv8lpa+Ac6SukZh
	 FdFSbRKfBsiJa8RGwmiXUVQM8mwe71xs14qZkSaa+jnMkKjFoP5ooC/d2/iAoAecZb
	 BNJjc1oxZAyhmSfHKtoknrWEBy5sQLAZN6PjXhjyRFnON6TASlKnqfu5Ea31RdZyYA
	 dAULMCr282Ugg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vg8380233z4wby;
	Thu, 16 May 2024 22:06:59 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andy Polyakov <appro@cryptogams.org>, Danny Tsen <dtsen@linux.ibm.com>,
 linux-crypto@vger.kernel.org
Subject: Re: [PATCH 1/3] crypto: X25519 low-level primitives for ppc64le.
In-Reply-To: <89e7b4b0-9804-41be-b9b1-aeba57cd3cc6@cryptogams.org>
References: <20240514173835.4814-1-dtsen@linux.ibm.com>
 <20240514173835.4814-2-dtsen@linux.ibm.com> <87a5kqwe59.fsf@mail.lhotse>
 <89e7b4b0-9804-41be-b9b1-aeba57cd3cc6@cryptogams.org>
Date: Thu, 16 May 2024 22:06:58 +1000
Message-ID: <875xvevu3h.fsf@mail.lhotse>
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andy Polyakov <appro@cryptogams.org> writes:
> Hi,
>
>>> +.abiversion	2
>>
>> I'd prefer that was left to the compiler flags.
>
> Problem is that it's the compiler that is responsible for providing this
> directive in the intermediate .s prior invoking the assembler. And there
> is no assembler flag to pass through -Wa.

Hmm, right. But none of our existing .S files include .abiversion
directives.

We build .S files with gcc, passing -mabi=elfv2, but it seems to have no
effect.

So all the intermediate .o's generated from .S files are not ELFv2:

  $ find .build/ -name '*.o' | xargs file | grep Unspecified
  .build/arch/powerpc/kernel/vdso/note-64.o:                        ELF 64-bit LSB relocatable, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 (SYSV), not stripped
  .build/arch/powerpc/kernel/vdso/sigtramp64-64.o:                  ELF 64-bit LSB relocatable, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 (SYSV), not stripped
  .build/arch/powerpc/kernel/vdso/getcpu-64.o:                      ELF 64-bit LSB relocatable, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 (SYSV), not stripped
  .build/arch/powerpc/kernel/vdso/gettimeofday-64.o:                ELF 64-bit LSB relocatable, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 (SYSV), not stripped
  .build/arch/powerpc/kernel/vdso/datapage-64.o:                    ELF 64-bit LSB relocatable, 64-bit PowerPC or cisco 7500, Unspecified or Power ELF V1 ABI, version 1 (SYSV), not stripped
  ...

But the actual code follows ELFv2, because we wrote it that way, and I
guess the linker doesn't look at the actual ABI version of the .o ?

So it currently works. But it's kind of gross that those .o files are
not ELFv2 for an ELFv2 build.

> If concern is ABI neutrality,
> then solution would rather be #if (_CALL_ELF-0) == 2/#endif. One can
> also make a case for
>
> #ifdef _CALL_ELF
> .abiversion _CALL_ELF
> #endif

Is .abiversion documented anywhere? I can't see it in the manual.

We used to use _CALL_ELF, but the kernel config is supposed to be the
source of truth, so we'd use:

  #ifdef CONFIG_PPC64_ELF_ABI_V2
  .abiversion 2
  #endif

And probably put it in a macro like:

  #ifdef CONFIG_PPC64_ELF_ABI_V2
  #define ASM_ABI_VERSION .abiversion 2
  #else
  #define ASM_ABI_VERSION
  #endif

Or something like that. But it's annoying that we need to go and
sprinkle that in every .S file.

Anyway, my comment can be ignored as far as this series is concerned,
seems we have to clean this up everywhere.

cheers
