Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 822C323D544
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 04:05:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMWzK6KN4zDqBY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 12:05:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMWxT4dn8zDqJt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 12:03:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ATC+m0yl; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BMWxQ0tC6z9sPC;
 Thu,  6 Aug 2020 12:03:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596679421;
 bh=L//yJHWbHVRpreWBMXxnk8oP5TZkpSP3UMUfWWjPDB4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ATC+m0ylO/cnYUwq5zBrFLw4yIqF8B38lyf13k+5sws6nAXv+IfWsPlr0/8ggd0S0
 Z3Kq0xYNwERrKWngZbb6FC5Pl7W4MK4QRPjK8eO8UiYNAK8LK3FpQcJ74wbO66n0fz
 UA9n64PmnfdllxDpQdP5OP9ydjogwSPi6RbmSOY9wsIhA1ahx9xmwR8P9Budg5TrYq
 8C+lzNb8gjr+d9uOT03UnI7mS3aMLsepebQeddvmYYKEXfiyXfjEgd2OEAHUqwQl+l
 K0soc0YNNG1IVRKNX2INYuszYCeijMhLt19v8BLK4uUCRXZXSil9IluUq8VIzi6alx
 Ysz2L2iNN2c1g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v8 5/8] powerpc/vdso: Prepare for switching VDSO to
 generic C implementation.
In-Reply-To: <20200805133505.GN6753@gate.crashing.org>
References: <cover.1588079622.git.christophe.leroy@c-s.fr>
 <2a67c333893454868bbfda773ba4b01c20272a5d.1588079622.git.christophe.leroy@c-s.fr>
 <878sflvbad.fsf@mpe.ellerman.id.au>
 <65fd7823-cc9d-c05a-0816-c34882b5d55a@csgroup.eu>
 <87wo2dy5in.fsf@mpe.ellerman.id.au> <20200805133505.GN6753@gate.crashing.org>
Date: Thu, 06 Aug 2020 12:03:33 +1000
Message-ID: <87r1sky1hm.fsf@mpe.ellerman.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, nathanl@linux.ibm.com,
 arnd@arndb.de, linux-kernel@vger.kernel.org,
 Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, luto@kernel.org, linux-arch@vger.kernel.org,
 tglx@linutronix.de, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Wed, Aug 05, 2020 at 04:24:16PM +1000, Michael Ellerman wrote:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> > Indeed, 32-bit doesn't have a redzone, so I believe it needs a stack 
>> > frame whenever it has anything to same.
>> 
>> Yeah OK that would explain it.
>> 
>> > Here is what I have in libc.so:
>> >
>> > 000fbb60 <__clock_gettime>:
>> >     fbb60:	94 21 ff e0 	stwu    r1,-32(r1)
>
> This is the *only* place where you can use a negative offset from r1:
> in the stwu to extend the stack (set up a new stack frame, or make the
> current one bigger).

(You're talking about 32-bit code here right?)

>> > diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h 
>> > b/arch/powerpc/include/asm/vdso/gettimeofday.h
>> > index a0712a6e80d9..0b6fa245d54e 100644
>> > --- a/arch/powerpc/include/asm/vdso/gettimeofday.h
>> > +++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
>> > @@ -10,6 +10,7 @@
>> >     .cfi_startproc
>> >   	PPC_STLU	r1, -STACK_FRAME_OVERHEAD(r1)
>> >   	mflr		r0
>> > +	PPC_STLU	r1, -STACK_FRAME_OVERHEAD(r1)
>> >     .cfi_register lr, r0
>> 
>> The cfi_register should come directly after the mflr I think.
>
> That is the idiomatic way to write it, and most obviously correct.  But
> as long as the value in LR at function entry is available in multiple
> places (like, in LR and in R0 here), it is fine to use either for
> unwinding.  Sometimes you can use this to optimise the unwind tables a
> bit -- not really worth it in hand-written code, it's more important to
> make it legible ;-)

OK. Because LR still holds the LR value until it's clobbered later, by
which point the cfi_register has taken effect.

But yeah I think for readability it's best to keep the cfi_register next
to the mflr.

>> >> There's also no code to load/restore the TOC pointer on BE, which I
>> >> think we'll need to handle.
>> >
>> > I see no code in the generated vdso64.so doing anything with r2, but if 
>> > you think that's needed, just let's do it:
>> 
>> Hmm, true.
>> 
>> The compiler will use the toc for globals (and possibly also for large
>> constants?)
>
> And anything else it bloody well wants to, yeah :-)

Haha yeah OK.

>> AFAIK there's no way to disable use of the toc, or make it a build error
>> if it's needed.
>
> Yes.
>
>> At the same time it's much safer for us to just save/restore r2, and
>> probably in the noise performance wise.
>
> If you want a function to be able to work with ABI-compliant code safely
> (in all cases), you'll have to make it itself ABI-compliant as well,
> yes :-)

True. Except this is the VDSO which has previously been a bit wild west
as far as ABI goes :)

>> So yeah we should probably do as below.
>
> [ snip ]
>
> Looks good yes.

Thanks for reviewing.

cheers
