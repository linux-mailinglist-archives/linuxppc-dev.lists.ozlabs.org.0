Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A166B1261C5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 13:14:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47drQJ1qHkzDqdG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 23:14:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="0ixnxT3u"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47drMH4JkBzDqmj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 23:11:23 +1100 (AEDT)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1BEFF20716;
 Thu, 19 Dec 2019 12:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576757481;
 bh=RE2T76IU/lncwRrDRAlG+ju/T9yNzhZZa+kkSWXB+hk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0ixnxT3uqPi6FVe/deKUePFfnKx9P1IGOKn1P09zsr5cJF5tc+Lb/RinNJ6zRexCz
 d4w/YFMVv6noAYAo12vcpw9/xsADKJmW1JkRrwXaOXPOxbKCpRgXB/UF6b9ftaH2wF
 dIhF3//DAkyn3jnXauqEMxnnraV8I9v9EaclRVHs=
Date: Thu, 19 Dec 2019 12:11:16 +0000
From: Will Deacon <will@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: READ_ONCE() + STACKPROTECTOR_STRONG == :/ (was Re: [GIT PULL]
 Please pull powerpc/linux.git powerpc-5.5-2 tag (topic/kasan-bitops))
Message-ID: <20191219121115.GB32361@willie-the-truck>
References: <20191212100756.GA11317@willie-the-truck>
 <20191212104610.GW2827@hirez.programming.kicks-ass.net>
 <CAHk-=wjUBsH0BYDBv=q36482G-U7c=9bC89L_BViSciTfb8fhA@mail.gmail.com>
 <20191212180634.GA19020@willie-the-truck>
 <CAHk-=whRxB0adkz+V7SQC8Ac_rr_YfaPY8M2mFDfJP2FFBNz8A@mail.gmail.com>
 <20191212193401.GB19020@willie-the-truck>
 <CAHk-=wiMuHmWzQ7-CRQB6o+SHtA-u-Rp6VZwPcqDbjAaug80rQ@mail.gmail.com>
 <20191217170719.GA869@willie-the-truck>
 <CAHk-=whBnZBVNwu8aVVp205EKk7xtsnQgSjs38a5=y9HyheXzQ@mail.gmail.com>
 <CAHk-=wjNLxSZZs+A0tyb-MnJ2YU-sqTAfy0-X+9vxjXfs_O4zA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjNLxSZZs+A0tyb-MnJ2YU-sqTAfy0-X+9vxjXfs_O4zA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 17, 2019 at 10:32:35AM -0800, Linus Torvalds wrote:
> On Tue, Dec 17, 2019 at 10:04 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Let me think about it.
> 
> How about we just get rid of the union entirely, and just use
> 'unsigned long' or 'unsigned long long' depending on the size.
> 
> Something like the attached patch - it still requires that it be an
> arithmetic type, but now because of the final cast.
> 
> But it might still be a cast to a volatile type, of course. Then the
> result will be volatile, but at least now READ_ONCE() won't be taking
> the address of a volatile variable on the stack - does that at least
> fix some of the horrible code generation. Hmm?

Sounds like it according to mpe, but I'll confirm too for arm64.

> This is untested, because I obviously still have the cases of
> structures (page table entries) being accessed once..
> 
>               Linus

>  include/linux/compiler.h | 33 +++++++++++++++++----------------
>  1 file changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index 5e88e7e33abe..8b4282194f16 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -179,18 +179,18 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
>  
>  #include <uapi/linux/types.h>
>  
> -#define __READ_ONCE_SIZE						\
> -({									\
> -	switch (size) {							\
> -	case 1: *(__u8 *)res = *(volatile __u8 *)p; break;		\
> -	case 2: *(__u16 *)res = *(volatile __u16 *)p; break;		\
> -	case 4: *(__u32 *)res = *(volatile __u32 *)p; break;		\
> -	case 8: *(__u64 *)res = *(volatile __u64 *)p; break;		\
> -	default:							\
> -		barrier();						\
> -		__builtin_memcpy((void *)res, (const void *)p, size);	\
> -		barrier();						\
> -	}								\
> +/* "unsigned long" or "unsigned long long" - make it fit in a register if possible */
> +#define __READ_ONCE_TYPE(size) \
> +	__typeof__(__builtin_choose_expr(size > sizeof(0UL), 0ULL, 0UL))

Ha, I wondered when '__builtin_choose_expr()' would make an appearance in
this thread! Nice trick. I'll try integrating this with what I have and see
what I run into next.

Back down the rabbit hole...

Will
