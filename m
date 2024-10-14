Return-Path: <linuxppc-dev+bounces-2235-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1726E99D50A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 18:56:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS3KB4HMtz3brR;
	Tue, 15 Oct 2024 03:56:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728924974;
	cv=none; b=WLfFXLrW/K98jXF21QttpKZAkwiuNzsugqY0jMi0TO9UvIMQ1Rck46u1TXL8EeHDvipHz8fLXy4cOfOAddiWyv4zVrOmYDnV7U4Ybim7VdCOhrg2IytTJHjzg3eJVnzFJZqXRf9VLWgBRVbrjyBbKZADNYZs0EUx7YZqYuHE4Vzw2ALjnT+HriIz0PSwvydFv17XQUfrJ0zG2vjAGn5/J9e1apDm8dCkdcaQUno4sgcCIUHFkvpurBdDEj2rnSwLxoMiSj/adYeF3/nvGPCS7MjaYwQMzFV32l46pcV4wvxprTrnPhNG6yvBoE2+fugMZqS7fKrHuUY0dq3g4pFKVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728924974; c=relaxed/relaxed;
	bh=rXuz9B0M2S2mj4ycF6+YgWDX9igb6rgxZMxSMgdUuS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mv0Z2CH9UTf2AxY9vAgJmnzRnHnOjdmXNqJfJa58+RqsOHUnDAQb5MCFFHJSUWKxGYrkaAAKYw9FcLLCdy5PCNlh+7gMoBluEBQnJlbxcwyXANltP7Rx8AS9Yn/z5GGs0FL4q8/d3jpnE0p+B8jg5ShHumHT+nd7tV2aVdO+5hxJsLrtG78kmGGESQY5ylM9TRLrlLI/J5smK2p8Z933c3RXsZJDS/K00wWcnjnxaCgegZivoSW3GfAPHi1ECpGUKVGnydluYh4KGld25Ul2wszPLBSIjDS0jiO6G+WgISQl6Fxjb/fuzbRBFvLcNe6VrVeubUjTh6XLhORiVqVYpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=cpZ412wt; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=cpZ412wt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS3K64kxRz3brP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 03:56:09 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5c9709c9b0cso2315836a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 09:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1728924966; x=1729529766; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rXuz9B0M2S2mj4ycF6+YgWDX9igb6rgxZMxSMgdUuS8=;
        b=cpZ412wtOz4/t/fcSB7hNc83gfznfUXzixn+ZDoj3/YgLz+NcoTces99gsyY6dbJnL
         2/IiQ88WSe47mLNtglxkyLHDGZk19OXJ42FfgGZjkQtcvmmvwbJ3SkknHqFF42H1v+tg
         78htxakOLe7cbLG8rxmn0fvYDjfWYjZIvddFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728924966; x=1729529766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXuz9B0M2S2mj4ycF6+YgWDX9igb6rgxZMxSMgdUuS8=;
        b=RDg1qJYGJLGRlTuMiLQB5OBVNAQTk1dLwVHItPSmVCJ+WWXfihWpbDRYTP5hHZc3Od
         xAzYjZARnhkiulFJigzCEaFc1Il3XmR+N4Pvoo3POx+kbIfuPx4CVfLjHyi5kYvW/KTh
         vzAN24YCIr/BtB4CK1mWp+G9O0Z8HKS+7Y5ADhyz/91Uh/eHHuxpD/bX06n/0yeKUi8z
         bQ2vAwp3WvTXRvdYA6wjfN1cmWwXYzORJfnVJ7w03FqeY6bzZvMve+HhdV0409PKtO3S
         TTLUuzHzNFb4h+wc56rvB63FqQQDh8HOmn7mjWD5ovQY1aGzOaoCaacYsWKAwsgTkgSx
         UfqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO0vzUJkVVJIBW7Pji8KzJvEXO9MGYLEUK4pTq4gNvnLJ7OZcA3WHFdXsqW0F5KXSIaEbPBo1U7u20osE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzyFtf36Zn8f7tRZhz5lkdFVa+usbUMiM5o+hdoKhGwx0Z46t4Z
	ojkp6wz7pzZYv3wNBb8AXE7udVpdFcTtEGNUsF0ra8WnhW1Wr/Rluo56gfFe6CUBgJgYwUrBkOw
	OY8kVOw==
X-Google-Smtp-Source: AGHT+IErsldmdOJLpCq5IvgU3AH4MoQZZjKNmuj+qBZk861tIl2phJ02StgCm/WZq84WmV8dzmnodw==
X-Received: by 2002:a05:6402:2344:b0:5c9:6623:a112 with SMTP id 4fb4d7f45d1cf-5c96623aa24mr7136148a12.29.1728924965666;
        Mon, 14 Oct 2024 09:56:05 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c9370d24bbsm5157324a12.10.2024.10.14.09.56.02
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 09:56:04 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c96936065dso2457283a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 09:56:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXSWwqFtvFMYFJMz24T3kYr3Wgx271aFglXNoljkR0HY5vmyTAwb4XxktPEQKXYhqbEmlw/dw6pwZyMaxU=@lists.ozlabs.org
X-Received: by 2002:a17:906:7312:b0:a9a:139:5ef3 with SMTP id
 a640c23a62f3a-a9a01396165mr552466766b.55.1728924962073; Mon, 14 Oct 2024
 09:56:02 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <b626840e55d4aa86b4b9b377a4cc2cda7038d33d.1728706156.git.jpoimboe@kernel.org>
 <f6ea59b1-eb59-4d1d-81ed-0e5095102c20@citrix.com> <CAHk-=wg=DovySzKb3=g53DeCwv1ZOa-RebaBpYXNXrdhY=a5Qw@mail.gmail.com>
 <12c18d86-87b3-4418-a0b0-2844197a3315@citrix.com> <CAHk-=wg341Na_hXFFkc582beXJNi+_tcDu=oMxVPTks-JoQXkQ@mail.gmail.com>
 <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble> <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
In-Reply-To: <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Oct 2024 09:55:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj8v4BcD7f3pObq1wav_mJO_naisYGg6HQUcphSc-U0zA@mail.gmail.com>
Message-ID: <CAHk-=wj8v4BcD7f3pObq1wav_mJO_naisYGg6HQUcphSc-U0zA@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, x86@kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 14 Oct 2024 at 05:30, Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> Given that LAM enforces bit 47/56 to be equal to bit 63 I think we can do
> this unconditionally instead of masking:
>
> diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
> index d066aecf8aeb..86d4511520b1 100644
> --- a/arch/x86/lib/getuser.S
> +++ b/arch/x86/lib/getuser.S
> @@ -37,9 +37,14 @@
>
>  #define ASM_BARRIER_NOSPEC ALTERNATIVE "", "lfence", X86_FEATURE_LFENCE_RDTSC
>
> +#define SHIFT_LEFT_TO_MSB ALTERNATIVE \
> +       "shl $(64 - 48), %rdx", \
> +       "shl $(64 - 57), %rdx", X86_FEATURE_LA57

That's certainly a lot smaller than the big constant, which is good.

But I would want some AMD architect to actually tell us *which* cores
this affects, and just what the cycle latency of the canonicality
check really is.

For example, the whole point of the address masking is that the access
itself isn't actually conditional, and we want (and expect) the
exception in the invalid address case (which very much includes the
non-canonicality).

So either the attacker has to find an unrelated conditional that
precedes the whole user access sequence (ie not just the CLAC
afterwards, but the STAC and the address masking that precedes the
access), *or* the attacker has to be able to deal with whatever signal
noise that comes from taking the GP exception and signal handling and
return to user space.

The exception handling will almost certainly have destroyed any signal
in L1 cache, so some flush+reload attack is going to be very very
inconvenient. And we could easily make it much worse by just adding
extra work to the GP exception handling.

And that is all in *addition* to having the sequence of the
non-canonical access followed by the "clac" and then you have to find
a dependent load to leak the data you loaded through the non-canonical
address. And all *that* needs to happen before the non-canonical
address actually being checked.

End result: I don't think this is actually a real scenario in the
first place. I would want some AMD person to really check.

                   Linus

