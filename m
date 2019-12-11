Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 863DB11A006
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 01:33:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XdFT0TnGzDqf0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 11:33:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Xd8x1WrzzDqZV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 11:29:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="Jn2SQvPi"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47Xd8v5C5Hz9sP3;
 Wed, 11 Dec 2019 11:29:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1576024160;
 bh=kmbp6MpyHsnC/owM/o4yDj8cWLNwjC0odjA8A0F3r2Y=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Jn2SQvPiqev5TL35DBK5lCO8mnXg+BTtXzArbhl7WqrvTJu5M+ZoiCVATKvHzLOLD
 /490q3sNuoaS8RrCEOiJfUlfiOE7FyR1xupxy+LuXjQrlnNee0sKWSvxRdwvkmFzJL
 8cX9BG/37iHETX+SK6OEUNldhJo0kpLbionDwCbFGHrNEr/2bHr8GHHP8EvBJp2w5d
 Oq7Yqge4fyyFATWKyy/JiMHOdF3ZSJiokdKFsNzkoblZu7BIUOmrVNWAjFd0ArDVZD
 MSOu1H54hdcXdP2PAhbK8MNYDb646YZe392xvS8NArPz8yhZ0UaP34j/Lsl3ab+Us5
 zD/LY1lWBWRBw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.5-2 tag
 (topic/kasan-bitops)
In-Reply-To: <20191210101545.GL2844@hirez.programming.kicks-ass.net>
References: <87blslei5o.fsf@mpe.ellerman.id.au>
 <20191206131650.GM2827@hirez.programming.kicks-ass.net>
 <87wob4pwnl.fsf@mpe.ellerman.id.au>
 <20191210101545.GL2844@hirez.programming.kicks-ass.net>
Date: Wed, 11 Dec 2019 11:29:16 +1100
Message-ID: <87lfrjpuw3.fsf@mpe.ellerman.id.au>
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
Cc: linux-s390@vger.kernel.org, elver@google.com, Will Deacon <will@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-arch@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Zijlstra <peterz@infradead.org> writes:
> On Tue, Dec 10, 2019 at 04:38:54PM +1100, Michael Ellerman wrote:
>
>> Good question, I'll have a look.
>> 
>> There seems to be confusion about what the type of the bit number is,
>> which is leading to sign extension in some cases and not others.
>
> Shiny.
>
>> It looks like the type should be unsigned long?
>
> I'm thinking unsigned makes most sense, I mean, negative bit offsets
> should 'work' but that's almost always guaranteed to be an out-of-bound
> operation.

Yeah I agree.

> As to 'long' vs 'int', I'm not sure, 4G bits is a long bitmap. But I
> suppose since the bitmap itself is 'unsigned long', we might as well use
> 'unsigned long' for the bitnr too.

4G is a lot of bits, but it's not *that* many.

eg. If we had a bit per 4K page on a 32T machine that would be 8G bits.

So unsigned long seems best.

>>   Documentation/core-api/atomic_ops.rst:  void __clear_bit_unlock(unsigned long nr, unsigned long *addr);
>>   arch/mips/include/asm/bitops.h:static inline void __clear_bit_unlock(unsigned long nr, volatile unsigned long *addr)
>>   arch/powerpc/include/asm/bitops.h:static inline void arch___clear_bit_unlock(int nr, volatile unsigned long *addr)
>>   arch/riscv/include/asm/bitops.h:static inline void __clear_bit_unlock(unsigned long nr, volatile unsigned long *addr)
>>   arch/s390/include/asm/bitops.h:static inline void arch___clear_bit_unlock(unsigned long nr,
>>   include/asm-generic/bitops/instrumented-lock.h:static inline void __clear_bit_unlock(long nr, volatile unsigned long *addr)
>>   include/asm-generic/bitops/lock.h:static inline void __clear_bit_unlock(unsigned int nr,
>> 
>> So I guess step one is to convert our versions to use unsigned long, so
>> we're at least not tripping over that difference when comparing the
>> assembly.
>
> Yeah, I'll look at fixing the generic code, bitops/atomic.h and
> bitops/non-atomic.h don't even agree on the type of bitnr.

Thanks.

cheers
