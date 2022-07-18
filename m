Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1866D577A26
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 06:42:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmTnx6mv5z3c5j
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 14:41:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CHSSgVtr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmTnN3L0kz302S
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 14:41:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CHSSgVtr;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LmTnN1vs1z4xhn;
	Mon, 18 Jul 2022 14:41:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658119288;
	bh=HfoMlxVHe2GNGL+Z3nwT14HwbjZ1aAk2Dtdo9PNK1VQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CHSSgVtrop/Y7cdYxGnGHQMtrhKN6M4mfFF179p31b8WbnOsj/tE+V4NpwgwwMx6Z
	 lAxnw5V0oEwFWQHxLcv1B6bI5z1F/0jZJUZF8lOXvvdrW2gdzcmjD82sB1YUESQ6/p
	 UdxgKYYEzGQkBFqlT4kEHzSkxqzJLL2NY/5jd5D81xFH+s7tK6VFrwLGcSjuYuCBFx
	 qkWjqmqY6wfvZ2SaiuOOFLRcPhrliuW3A25gQvyztz/W7IdV3Qxi05NsHd07cIIRHj
	 eGjTRoqhbkPIhrlFr2oWYWmlUqM2BZYAWGLTPf8St8pzZX16L+C1KxjYFfSRV9COaQ
	 bJo7pdgo4/H+w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Kees Cook
 <keescook@chromium.org>
Subject: Re: mainline build failure of powerpc allmodconfig for prom_init_check
In-Reply-To: <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com>
References: <Ys/aDKZNhhsENH9S@debian>
 <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com>
Date: Mon, 18 Jul 2022 14:41:23 +1000
Message-ID: <87cze3docs.fsf@mpe.ellerman.id.au>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sudip Mukherjee <sudipm.mukherjee@gmail.com> writes:
> On Thu, Jul 14, 2022 at 9:55 AM Sudip Mukherjee (Codethink)
> <sudipm.mukherjee@gmail.com> wrote:
>>
>> Hi All,
>>
>> Not sure if it has been reported before but the latest mainline kernel
>> branch fails to build for powerpc allmodconfig with gcc-12 and the error is:
>>
>> Error: External symbol 'memset' referenced from prom_init.c
>> make[2]: *** [arch/powerpc/kernel/Makefile:204: arch/powerpc/kernel/prom_init_check] Error 1
>
> I was trying to check it. With gcc-11 the assembly code generated is
> not using memset, but using __memset.
> But with gcc-12, I can see the assembly code is using memset. One
> example from the assembly:
>
> call_prom:
>         .quad   .call_prom,.TOC.@tocbase,0
>         .previous
>         .size   call_prom,24
>         .type   .call_prom,@function
> .call_prom:
>         mflr 0           #,
>         std 29,-24(1)    #,
>         std 30,-16(1)    #,
>         std 31,-8(1)     #,
>         mr 29,3          # tmp166, service
>         mr 31,4          # nargs, tmp167
>         mr 30,5          # tmp168, nret
>  # arch/powerpc/kernel/prom_init.c:396:         struct prom_args args;
>         li 4,254                 #,

Here we load 254 into r4, which is the 2nd parameter to memset (c).

>         li 5,52          #,

This is r5, the 3rd parameter (n), ie. the size of the structure.

That tells us we're memsetting the entire structure, ie. the 10 x 4
bytes of args.args plus 3 x 4 bytes for the other members.

>  # arch/powerpc/kernel/prom_init.c:394: {
>         std 0,16(1)      #,
>         stdu 1,-208(1)   #,,
>  # arch/powerpc/kernel/prom_init.c:396:         struct prom_args args;
>         addi 3,1,112     # tmp174,,

Here we load (calculate) the address of "args" into r3, the first
parameter to memset.

>  # arch/powerpc/kernel/prom_init.c:394: {
>         std 9,304(1)     #,
>         std 10,312(1)    #,
>         std 6,280(1)     #,
>         std 7,288(1)     #,
>         std 8,296(1)     #,
>  # arch/powerpc/kernel/prom_init.c:396:         struct prom_args args;
>         bl .memset       #

So we're memsetting all of args to 254, not zero.

That's happening because allmodconfig with gcc 12 enables
CONFIG_INIT_STACK_ALL_PATTERN, whereas gcc 11 doesn't.

I think the simplest fix in the short term is to just disable stack
initialisation for prom_init.c. It only runs at boot so there's no real
security impact to disabling it.

cheers
