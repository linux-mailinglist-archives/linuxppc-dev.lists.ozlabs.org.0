Return-Path: <linuxppc-dev+bounces-3495-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 538C89D5875
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 04:11:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xvg9S0dTwz3bZf;
	Fri, 22 Nov 2024 14:11:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732245084;
	cv=none; b=SM2q4eDV+vLOWEEaagCzH6PqpgRfhIeT4U24V21nvOHjWgsPnFnvDNEQtu5Q5es89Nx8NiCAKDpzbeYhCmKw5JifV6GjTtKc6o0uMKsI1tyJd1311mNw3hT0LVkMwhwUonSgwJALFBG+dfM57STL1Yqe+1s/RRWb6HX0KawgoJMHN7U6JwbmKAbn8PHMfsCqsWHt83knBFpqJjsIZ4jtEbjiK+SnlBieW5ik2twH9O/IeQZtqSUANUNdvHJWUr8Y0Z95yFeSHg0/ybmKC9qP7+QmQMqbFospV/ZxIga/sWQZiw9szgXSP3Pckim0FR63IcG1Al0beWIbYKzoE184mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732245084; c=relaxed/relaxed;
	bh=Zhm7aLXdWesOojVkiH3lb32+0WgUSelDr9otXqqQyac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KYqVYlk/JAhgCXPu770S8UAIsRbSG+1eJvvGHrF03OKsCvA5RO7zXGifsaaG3QNSlrTOXOxvF5HVUripDrv2+ToUoPUl7z+XMbba64XXX80ahkMyY491P110qjWse/a9VofB5a1Vs9U5AdutFkX7zXmbpmccLBMDqssc8P0f5axIDP0HGXIKDlAQHUmxteQlEJXYz2p3UoIGqXdTTIwiHD1XbU9KhJyDvS5LT+Ylj3/MCUFddKKdFmxXUresdtZUTdLXmJB8gym5QR+7ea2Fs9y59JLLAvqWws7eYFxVP1naCKGkhzBOTAzB0aq8udO/bl5+z+axbVpiwRNhUdzPvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mSTXFiP6; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mSTXFiP6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xvg9P4h4Lz3bXs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 14:11:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0FF0E5C018F;
	Fri, 22 Nov 2024 03:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6C0C4CECC;
	Fri, 22 Nov 2024 03:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732245078;
	bh=IUhxd0IcT2Lj2KpR6+uvQi+ilwU7y5ewL8ZEtVXyC5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mSTXFiP68Ry5QJ3h+0r3JOvjC2xO5B+9MVz+QGA8uO6TmiMPg509cnS0jgXHZS70p
	 +AkCrOexC4/DgwAIFlh2wH8TlK9AjhIn7mWJq8v6MDNQic/8dFUszmRTTjbBpwpBe/
	 2iTV9XeM4EPmZT+accttHkQLOWwCsAz/Y/XivdN9QWn+YJpuRtkFncgHMJOGfCpyi+
	 GKGJVJc2JcTyzRHB2iBR8b2srdrb/cKtWrylQBmQOv45Q5Jmoj3SBKpk/lO1nx8V9j
	 k24gi9wzR2pSrQUbiEo4cUjeKD1pGUiA8rpZB54nB7bv35v+irQy9XKTE/kah5XSlF
	 fr897EDCVSwjQ==
Date: Thu, 21 Nov 2024 19:11:15 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Laight <David.Laight@aculab.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v3 2/6] x86/uaccess: Avoid barrier_nospec() in 64-bit
 __get_user()
Message-ID: <20241122031115.5aasuktqrp2sidfj@jpoimboe>
References: <cover.1730166635.git.jpoimboe@kernel.org>
 <82cbb9983fef5ecf6f1cb33661e977172d40a7e6.1730166635.git.jpoimboe@kernel.org>
 <20241029032735.pw3bg64bpneqnfhk@treble.attlocal.net>
 <76bb85ceeb854e3ab68d87f846515306@AcuMS.aculab.com>
 <20241115230653.hfvzyf3aqqntgp63@jpoimboe>
 <CAHk-=wgLCzEwa=S4hZFGeOPjix-1_fDrsqR-QLaBcDM-fgkvhw@mail.gmail.com>
 <20241121214011.iiup2fdwsys7hhts@jpoimboe>
 <CAHk-=wigHm2J4LkUL1=y_H8zGwM0JsK2CrWyLNbz9fvXfbaBQA@mail.gmail.com>
 <20241122001223.t4uywacusrplpefq@jpoimboe>
 <CAHk-=whm4fEYrzrrRrqEhELLFz2xNCMT9be+J0uiR_EwXwa0DA@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=whm4fEYrzrrRrqEhELLFz2xNCMT9be+J0uiR_EwXwa0DA@mail.gmail.com>
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 21, 2024 at 05:02:06PM -0800, Linus Torvalds wrote:
> [ Time passes ]
> 
> Ugh. I tried it. It looks like this:
> 
> #define inlined_get_user(res, ptr) ({                           \
>         __label__ fail2, fail1;                                 \
>         __auto_type __up = (ptr);                               \
>         int __ret = 0;                                          \
>         if (can_do_masked_user_access())                        \
>                 __up = masked_user_access_begin(__up);          \
>         else if (!user_read_access_begin(__up, sizeof(*__up)))  \
>                 goto fail1;                                     \
>         unsafe_get_user(res, ptr, fail2);                       \
>         user_access_end();                                      \
>         if (0) {                                                \
> fail2:  user_access_end();                                      \
> fail1:  __ret = -EFAULT;                                        \
>         }                                                       \
>         __ret; })

That actually doesn't seem so bad, it's easy enough to follow the logic.
And it contains the ugly/fidgety all in one place so the callers' hands
don't have to get dirty.

We could easily use that macro in size-specific inline functions
selected by a macro with a sizeof(type) switch statement -- not so bad
IMO if they improve code usage and generation.

So all the user has to do is get_user_new_and_improved() -- resolving to
get_user_new_and_improved_x() -- and the compiler decides on the
inlining.  Which on average is hopefully better than Joe Developer's
inlining decisions?  Otherwise we've got bigger problems?

Then all the arches have to do is implement unsafe_*_user_{1,2,4,8} and
the "one good implementation" idea comes together?

BTW, looking at some other arches, I notice that get_user() is already
unconditionally inline for arm64, riscv, powerpc, and s390.

I also see that arm64 already defines get_user() to __get_user(), with
__get_user() having an access_ok().

It would be really nice to have the same behavior and shared code across
all the arches.

-- 
Josh

