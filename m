Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2F5117FE0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 06:40:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47X86b4n7zzDqX0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 16:40:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47X84h0sDczDqVk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 16:39:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="oh0C7uIz"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47X84f2hMWz9sPh;
 Tue, 10 Dec 2019 16:38:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1575956339;
 bh=AJJmChoZySTIyWE83Z5yC6HwYtTJxCcMfpSc/t0wIek=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=oh0C7uIziTe2KFhQXT/UZFD1ykXWT3KzZy2GcDl1bv9Dgscgs8Vy/RZzaP7VAcTpC
 MMq0t512TOWxCJMxZiqCmYyfxgXuYG0l0ciZpHbcB65d0iqoYz9SwBckWY7nsM6Zt5
 3XuNlzQzqy3qCrJoLgqqIbX2n/S45HM+FCZaBqnfwny6IzhU6rLZU0fqE0AztOyY4M
 ymIjtDnrIpmw8cYROGAFOQUBDQUTaUf43JYHGh1Cr3NDFu0zNTHdCwiqVc3dEMVBMt
 vOVYhCat2y1NcuEBHN6KiMqCofdccvmhbtopsyDcjwCt0mBXDAYzn3t0WCRK01gEG3
 uKc9wTuBc4Dqw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.5-2 tag
 (topic/kasan-bitops)
In-Reply-To: <20191206131650.GM2827@hirez.programming.kicks-ass.net>
References: <87blslei5o.fsf@mpe.ellerman.id.au>
 <20191206131650.GM2827@hirez.programming.kicks-ass.net>
Date: Tue, 10 Dec 2019 16:38:54 +1100
Message-ID: <87wob4pwnl.fsf@mpe.ellerman.id.au>
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
> On Fri, Dec 06, 2019 at 11:46:11PM +1100, Michael Ellerman wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA256
>> 
>> Hi Linus,
>> 
>> Please pull another powerpc update for 5.5.
>> 
>> As you'll see from the diffstat this is mostly not powerpc code. In order to do
>> KASAN instrumentation of bitops we needed to juggle some of the generic bitops
>> headers.
>> 
>> Because those changes potentially affect several architectures I wasn't
>> confident putting them directly into my tree, so I've had them sitting in a
>> topic branch. That branch (topic/kasan-bitops) has been in linux-next for a
>> month, and I've not had any feedback that it's caused any problems.
>> 
>> So I think this is good to merge, but it's a standalone pull so if anyone does
>> object it's not a problem.
>
> No objections, but here:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=topic/kasan-bitops&id=81d2c6f81996e01fbcd2b5aeefbb519e21c806e9
>
> you write:
>
>   "Currently bitops-instrumented.h assumes that the architecture provides
> atomic, non-atomic and locking bitops (e.g. both set_bit and __set_bit).
> This is true on x86 and s390, but is not always true: there is a
> generic bitops/non-atomic.h header that provides generic non-atomic
> operations, and also a generic bitops/lock.h for locking operations."
>
> Is there any actual benefit for PPC to using their own atomic bitops
> over bitops/lock.h ? I'm thinking that the generic code is fairly
> optimal for most LL/SC architectures.

Good question, I'll have a look.

There seems to be confusion about what the type of the bit number is,
which is leading to sign extension in some cases and not others.

eg, comparing the generic clear_bit_unlock() vs ours:

 1 c000000000031890 <generic_clear_bit_unlock>:             1 c0000000000319a0 <ppc_clear_bit_unlock>:
                                                            2         extsw   r3,r3
                                                            3         li      r10,1
                                                            4         srawi   r9,r3,6
                                                            5         addze   r9,r9
                                                            6         rlwinm  r8,r9,6,0,25
                                                            7         extsw   r9,r9
                                                            8         subf    r3,r8,r3
 2         rlwinm  r9,r3,29,3,28                            9         rldicr  r9,r9,3,60
                                                           10         sld     r3,r10,r3
 3         add     r4,r4,r9                                11         add     r4,r4,r9
 4         lwsync                                          12         lwsync
 5         li      r9,-2
 6         clrlwi  r3,r3,26
 7         rotld   r3,r9,r3
 8         ldarx   r9,0,r4                                 13         ldarx   r9,0,r4
 9         and     r10,r3,r9                               14         andc    r9,r9,r3
10         stdcx.  r10,0,r4                                15         stdcx.  r9,0,r4
11         bne-    <generic_clear_bit_unlock+0x18>         16         bne-    <ppc_clear_bit_unlock+0x2c>
12         blr                                             17         blr

It looks like in actual usage it often doesn't matter, ie. when we pass
a constant bit number it all gets inlined and the compiler works it out.

It looks like the type should be unsigned long?

  Documentation/core-api/atomic_ops.rst:  void __clear_bit_unlock(unsigned long nr, unsigned long *addr);
  arch/mips/include/asm/bitops.h:static inline void __clear_bit_unlock(unsigned long nr, volatile unsigned long *addr)
  arch/powerpc/include/asm/bitops.h:static inline void arch___clear_bit_unlock(int nr, volatile unsigned long *addr)
  arch/riscv/include/asm/bitops.h:static inline void __clear_bit_unlock(unsigned long nr, volatile unsigned long *addr)
  arch/s390/include/asm/bitops.h:static inline void arch___clear_bit_unlock(unsigned long nr,
  include/asm-generic/bitops/instrumented-lock.h:static inline void __clear_bit_unlock(long nr, volatile unsigned long *addr)
  include/asm-generic/bitops/lock.h:static inline void __clear_bit_unlock(unsigned int nr,

So I guess step one is to convert our versions to use unsigned long, so
we're at least not tripping over that difference when comparing the
assembly.

cheers
