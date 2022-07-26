Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 050C8580997
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 04:47:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsLt260kkz3c4h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 12:47:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IS9n5yJ3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsLsS0fGMz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 12:46:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IS9n5yJ3;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LsLsQ6nVXz4xD7;
	Tue, 26 Jul 2022 12:46:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658803612;
	bh=d3mL1k1NMT34C1y5QN9NQJ5hVYOTx4F+h/uvzQ4WTp0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IS9n5yJ30hjXD+pYI3Rk6esf6g8We4+3Te4njNGWL0U+0I/5NauF8044UfZ7tQZqN
	 kA4ym1Ke5i2zt+ILiJCArZ0Kfld8wAGzNU8BoFCQ0j5zdxYM1PXXYT9tKpYZEUw2uI
	 lUaHSEEoTFEwM6XCtfBl1PvdETJT0B6DX+s7LXQI1Q8ehD46urKMpC1NhRgBNmYrVU
	 ThRZkpPq5nwBcLEDAJdfqwTWUpMM3497q+2EurUa44g0em7q4uzgNtBBkrdb+U9v93
	 46VqWBXvBZeO1rmxeotOVt21TswCPy0gfy+e413vIlFDoXYxonBIbTd2GuamtoO/6Q
	 JfYKQI8Pt/CVA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 1/2] powerpc: drop dependency on <asm/machdep.h> in
 archrandom.h
In-Reply-To: <Yt7Ewi2vu49fW1ZJ@yury-laptop>
References: <20220723214537.2054208-1-yury.norov@gmail.com>
 <20220723214537.2054208-2-yury.norov@gmail.com>
 <8735epd204.fsf@mpe.ellerman.id.au> <87wnc1bcwa.fsf@mpe.ellerman.id.au>
 <Yt7Ewi2vu49fW1ZJ@yury-laptop>
Date: Tue, 26 Jul 2022 12:46:49 +1000
Message-ID: <87h734bnfq.fsf@mpe.ellerman.id.au>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Yury Norov <yury.norov@gmail.com> writes:
> On Mon, Jul 25, 2022 at 10:22:13PM +1000, Michael Ellerman wrote:
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>> > Yury Norov <yury.norov@gmail.com> writes:
>> >> archrandom.h includes <asm/machdep.h> to refer ppc_md. This causes
>> >> circular header dependency, if generic nodemask.h  includes random.h:
>> >>
>> >> In file included from include/linux/cred.h:16,
>> >>                  from include/linux/seq_file.h:13,
>> >>                  from arch/powerpc/include/asm/machdep.h:6,
>> >>                  from arch/powerpc/include/asm/archrandom.h:5,
>> >>                  from include/linux/random.h:109,
>> >>                  from include/linux/nodemask.h:97,
>> >>                  from include/linux/list_lru.h:12,
>> >>                  from include/linux/fs.h:13,
>> >>                  from include/linux/compat.h:17,
>> >>                  from arch/powerpc/kernel/asm-offsets.c:12:
>> >> include/linux/sched.h:1203:9: error: unknown type name 'nodemask_t'
>> >>  1203 |         nodemask_t                      mems_allowed;
>> >>       |         ^~~~~~~~~~
>> >>
>> >> Fix it by removing <asm/machdep.h> dependency from archrandom.h
>> >>
>> >> Signed-off-by: Yury Norov <yury.norov@gmail.com>
>> >> ---
>> >>  arch/powerpc/include/asm/archrandom.h |  9 +--------
>> >>  arch/powerpc/kernel/setup-common.c    | 11 +++++++++++
>> >>  2 files changed, 12 insertions(+), 8 deletions(-)
>> >>
>> >> diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
>> >> index 9a53e29680f4..21def59ef1a6 100644
>> >> --- a/arch/powerpc/include/asm/archrandom.h
>> >> +++ b/arch/powerpc/include/asm/archrandom.h
>> >> @@ -4,7 +4,7 @@
>> >>  
>> >>  #ifdef CONFIG_ARCH_RANDOM
>> >>  
>> >> -#include <asm/machdep.h>
>> >> +bool __must_check arch_get_random_seed_long(unsigned long *v);
>> >>  
>> >>  static inline bool __must_check arch_get_random_long(unsigned long *v)
>> >>  {
>> >> @@ -16,13 +16,6 @@ static inline bool __must_check arch_get_random_int(unsigned int *v)
>> >>  	return false;
>> >>  }
>> >>  
>> >> -static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
>> >> -{
>> >> -	if (ppc_md.get_random_seed)
>> >> -		return ppc_md.get_random_seed(v);
>> >> -
>> >> -	return false;
>> >> -}
>> >
>> > I'd rather we didn't have to force this out of line.
>> >
>> > I think I see a different way to fix it, I'll just do some more build
>> > tests.
>> 
>> Of course my idea didn't work :}
>> 
>> So I'll just ack your patch for now, and maybe I can get the headers
>> cleaned up in future to allow it to be out-of-line again.
>
> I understand that it looks like a tradeoff - we inline a couple of small
> functions with the cost of uninlining an almost innocent victim. 

Yeah. The truth is the cost to access the RNG will far outweigh the cost
of that out-of-line call, so there's no real issue. But it's also such a
small function that it just cries out to be inlined :)

> The complete solution would be probably a splitting ppc_md declaration
> out of asm/machdep.h. I wanted to do that, but I'm not a PPC guy, and
> just don't know how to split the header correctly.

I managed to drop the includes of seq_file.h and dma-mapping.h, which
seemed to fix the circular include problem, but there's a bit of fall
out in unrelated files. I think I can get that sorted though eventually.

> Anyways, thanks for the ack. Applied on bitmap-for-next.

No worries.

cheers
