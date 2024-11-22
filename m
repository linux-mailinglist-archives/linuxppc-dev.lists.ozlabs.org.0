Return-Path: <linuxppc-dev+bounces-3498-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEDD9D58BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 04:58:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvhCY0r1Jz2xgX;
	Fri, 22 Nov 2024 14:58:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::533"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732247897;
	cv=none; b=DF1DcqupXXehKlx1J0+CxsuLhp3pJJThGq7qEjlo5g8/M5XutC8BF1GEewGY4QV0P9SuB5Wm/kCr55SclZysGiOwmw4U4tS9DEZ775K4aZtFSUj1A0wsL2aPKluXts7E2UBB61nqQA8sEJvYNRg53Od957qJdml+tJNuMYsgrtUjP8fNxPkJH7aJBNXfxeIB/kz9fUB5O3fibfw3EC3g7Z/RvzeL9oJh7b20vrsszUhIv86TQNxmkQc9uSAyvm10cnpdZUgdEjdv8oNLBswzTROoFHOElQsrGAg9BGdhO+O8oxX1ZDPcwcU83fFDQzh+Qq+FSSpOlV5qF9TdXHPWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732247897; c=relaxed/relaxed;
	bh=V6jK6JTZsApLYkwhX3LQfF7Emba3DFSLtBoD9555N3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h52LnrXvQ1vmNa8UkNzxERIwd1Pcc2iENQpvEFKlagwlzX4Lr0C0Ciak6rQ55h/OyrPgfMn06pl58Yb3ZCWG4EGZxoDLsKghcuLODJqLhIR1Q//kOsjdgks3Yjzfwc7mAaBJrhwgR0vICABF/WvesS44E5GHRRnKbvYIE+x8/ZAIkBE13Bc62dHT9t8R9ptMJl0AFflvfhPabTG0j5uIMLeBLhP+cDfzsc4AOSUB6/lQJ6p6MJwMJc8MuwJF5u+j7RjyST3stZpKnU0zKMpwlEu/B1lRrd1wNGyoGg9q/W4xe/HXNV0dqOea4z6PSkOuXpNfXSYqJ7iVbYlMGpFTyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OpoiPpdp; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OpoiPpdp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvhCW1TpTz2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 14:58:13 +1100 (AEDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d01db666ceso507079a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2024 19:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1732247886; x=1732852686; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V6jK6JTZsApLYkwhX3LQfF7Emba3DFSLtBoD9555N3I=;
        b=OpoiPpdpV74HLoZ0S9t6aOWDOFR1I2hA9pv29oiUZGqiHWxbeHxTDs8y0+Lw/itNJH
         hmxFYX32EMKv0Nw7EGQNKD6y2bIN4vcDuJ3BVm4RZDRDQRxQT5seN43zkLupZGEg/oon
         1Asj2Jtd+2uRCD2vYnJgd7a+4uQzTqb3UvF3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732247886; x=1732852686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6jK6JTZsApLYkwhX3LQfF7Emba3DFSLtBoD9555N3I=;
        b=jp27uptmI32uptJqL7Fag+UT8e6ZrWVeQnIRJV4bZHS5MyZ6VYJM81mCxKnhUg/mDK
         /DMfntxEGibiHcH3DldNTXRWQT9pnBR2d2ZJOEJDkWw4wXJSbVSi0AnGLdTqyaGtl4xT
         ASa/ZhzQIhT9OOssrvQWR9NvYckrO9lxCeW0aIncQTkOD8A8YbngXzNHCRrIn1PJPNsQ
         xErfz2cfmImE1HOM8LhorQrh5k1c4krts6PvGPsVMqzDdqnX/MGpy8BXW4TjIs2NVwI4
         U/QKjRDwiwJYUY+mmUMRG0vV+TqbqQGmyYZHooUEDnwt3UtqAZiuvmuiMzORXIJkgR9y
         ciLg==
X-Forwarded-Encrypted: i=1; AJvYcCXub1TqS4pYVBIDxcnLaLySrL2caK1Me1S9rMwxxC7Bkail+X2X928ZdSw3fxuTDOR0f3Wmaay6Ft5X69g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxtzHrPQd5KeLHSF1cLI6Ol5jppxwCgDuy1QM18avYhXaxLR0Tq
	DwKcdHN2awfObHgIiDlmxUdMekYree8GY+LzooCMY+Nyz2L0jV1kYC1GaG9VUsTwlANxQMhA+I9
	OQBapQg==
X-Gm-Gg: ASbGncsT0hM5vUhKKv56i7Cgdj2r3c5LT3il2LGRRyokgQKcyUQB8smDSHDzm/9lmlf
	Mbk9oGOw4kTIqd3Obs27jg0ONcrbYjalvk0A7l5qtPvmeGkWY2dyBz5PozGNG6Xfv2e4F6JSFYd
	w7ly+i7TcJnSw6WzxUamMpER6XaTPsqVCA/AZ6etr15kRg3mN/2F77Xy03BdKfYS1DigmXkpLcw
	8otVCY8xxzg1C3VXGeWvVwbl76ZRHDjuimG7HnXvALHEwHGE+n8/KbIBob3vMmWsF8HKkRkM1mz
	uGPNBJnOkvSV6lL9jImXHiA/
X-Google-Smtp-Source: AGHT+IF/HdqLyAEddh/bpbXOhI6nh6pMqkNniO5zKtd3H8AE53IM3kK3uHtZ2evGw/CUPH+neOTHvw==
X-Received: by 2002:a05:6402:2692:b0:5cf:cb41:3610 with SMTP id 4fb4d7f45d1cf-5d0205fa45fmr842039a12.8.1732247885822;
        Thu, 21 Nov 2024 19:58:05 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d3c0458sm448253a12.45.2024.11.21.19.58.04
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 19:58:05 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa51b8c5f4dso2298166b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2024 19:58:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXA2ri2ZRp9QG9D6KGa52c3uJoLjQcycAF63vhfir9RItK8a25NrX+0CAQI1ruE3Dx8YgbalrivEnlqnQU=@lists.ozlabs.org
X-Received: by 2002:a17:907:7852:b0:a9a:a7fd:d840 with SMTP id
 a640c23a62f3a-aa509976333mr120569266b.1.1732247884246; Thu, 21 Nov 2024
 19:58:04 -0800 (PST)
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
References: <cover.1730166635.git.jpoimboe@kernel.org> <82cbb9983fef5ecf6f1cb33661e977172d40a7e6.1730166635.git.jpoimboe@kernel.org>
 <20241029032735.pw3bg64bpneqnfhk@treble.attlocal.net> <76bb85ceeb854e3ab68d87f846515306@AcuMS.aculab.com>
 <20241115230653.hfvzyf3aqqntgp63@jpoimboe> <CAHk-=wgLCzEwa=S4hZFGeOPjix-1_fDrsqR-QLaBcDM-fgkvhw@mail.gmail.com>
 <20241121214011.iiup2fdwsys7hhts@jpoimboe> <CAHk-=wigHm2J4LkUL1=y_H8zGwM0JsK2CrWyLNbz9fvXfbaBQA@mail.gmail.com>
 <20241122001223.t4uywacusrplpefq@jpoimboe> <CAHk-=whm4fEYrzrrRrqEhELLFz2xNCMT9be+J0uiR_EwXwa0DA@mail.gmail.com>
 <20241122031115.5aasuktqrp2sidfj@jpoimboe>
In-Reply-To: <20241122031115.5aasuktqrp2sidfj@jpoimboe>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Nov 2024 19:57:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjJt49tgtmYv42bXU3h0Txb+mQZEOHseahA4EcK6s=BxA@mail.gmail.com>
Message-ID: <CAHk-=wjJt49tgtmYv42bXU3h0Txb+mQZEOHseahA4EcK6s=BxA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] x86/uaccess: Avoid barrier_nospec() in 64-bit __get_user()
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: David Laight <David.Laight@aculab.com>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Mark Rutland <mark.rutland@arm.com>, "Kirill A . Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 21 Nov 2024 at 19:11, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> On Thu, Nov 21, 2024 at 05:02:06PM -0800, Linus Torvalds wrote:
> > [ Time passes ]
> >
> > Ugh. I tried it. It looks like this:
> >
> > #define inlined_get_user(res, ptr) ({                           \
> >         __label__ fail2, fail1;                                 \
> >         __auto_type __up = (ptr);                               \
> >         int __ret = 0;                                          \
> >         if (can_do_masked_user_access())                        \
> >                 __up = masked_user_access_begin(__up);          \
> >         else if (!user_read_access_begin(__up, sizeof(*__up)))  \
> >                 goto fail1;                                     \
> >         unsafe_get_user(res, ptr, fail2);                       \

That 'ptr' needs to be '__up' of course.

Other than that it actually seems to work.

And by "seems to work" I mean "I replaced get_user() with this macro
instead, and my default kernel continued to build fine".

I didn't actually *test* the end result, although i did look at a few
more cases of code generation, and visually it looks sane enough.

> That actually doesn't seem so bad, it's easy enough to follow the logic.

I'm not loving the "if (0)" with the labels inside of it. But it's the
only way I can see to make a statement expression like this work,
since you can't have a "return"  inside of it.

> We could easily use that macro in size-specific inline functions
> selected by a macro with a sizeof(type) switch statement -- not so bad
> IMO if they improve code usage and generation.

The point of it being a macro is that then it doesn't need the
size-specific games at all, because it "just works" since the types
end up percolating inside the logic.

Of course, that depends on unsafe_get_user() itself having the
size-specific games in it, so that's a bit of a lie, but at least it
needs the games in just one place.

And yes, having inline wrappers anyway could then allow for the
compiler making the "inline or not" choice, but the compiler really
doesn't end up having any idea of whether something is more important
from a performance angle, so that wouldn't actually be a real
improvement.

> Then all the arches have to do is implement unsafe_*_user_{1,2,4,8} and
> the "one good implementation" idea comes together?

Yeah, except honestly, basically *none* of them do.

The list or architectures that actually implement the unsafe accessors
is sad: it's x86, powerpc, and arm64. That's it.

Which is - along with my bloat worry - what makes me go "it's not
worth fighting".

Also, honestly, it is *very* rare that "get_user()" and "put_user()"
is performance-critical or even noticeable. We have lots of important
user copies, and the path and argument copy (aka
"strncpy_from_user()") is very important, but very few other places
tend to be.

So I see "copy_from_user()" in profiles, and I see
"strncpy_from_user()", and I've seen a few special cases that I've
converted (look at get_sigset_argpack(), for example - it shows up on
some select-heavy loads).

And now you found another one in that futex code, and that is indeed special.

But honestly, most get_user() cases are really in things like random ioctls etc.

Which is why I suspect we'd be better off just doing the important
ones one by one.

And doing the important ones individually may sound really nasty, but
if they are important, it does kind of make sense.

For example, one place I suspect *is* worth looking at is the execve()
argument handling. But to optimize that isn't about inlining
get_user(). It's about doing more than one word for each user access,
particularly with CLAC/STAC being as slow as they often are.

So what you actually would want to do is to combine these two

                ret = -EFAULT;
                str = get_user_arg_ptr(argv, argc);
                if (IS_ERR(str))
                        goto out;

                len = strnlen_user(str, MAX_ARG_STRLEN);
                if (!len)
                        goto out;

into one thing, if you really cared enough. I've looked at it, and
always gone "I don't _quite_ care that much", even though argument
handling definitely shows up on some benchmarks (partly because it
mostly shows up on fairly artificial ones - the rest of execve is so
expensive that even when we waste some time on argument handling, it's
not noticeable enough to be worth spending huge amount of effort on).

But you could also look at the pure argv counting code (aka "count()"
in fs/exec.c). That *also* shows up quite a bit, and there batching
things migth be a much easier thing. But again, it's not about
inlining get_user(), it's about doing multiple accesses without
turning user accesses on and off all the time.

Anyway, that was a long way of saying: I really think we should just
special-case the (few) important cases that get reported. Because any
*big* improvements will come not from just inlining.

              Linus

