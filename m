Return-Path: <linuxppc-dev+bounces-2584-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A14A89B0A0A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 18:36:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZpLl3s2hz2y8k;
	Sat, 26 Oct 2024 03:35:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729874159;
	cv=none; b=oXPKQ2H8JpnZbtr+pR4yaQP1adONB8jE+/KIe+fHs7gk+4L6wGWKMLW1zwFbLHC03SmL0gtkRyv85LnjR+zZtP2Jw2AJSwmTXS+M19ivQEoGXsC7j1yq+yU/VGgNs58axw7lvAjU9Gcrr8tyovsolwFH3AIxR476kV1izTLJmvjpi9eB1hI7I2r84Ukn3SnGDkJpdpIpQ46z1LFkyHAqMWZi9HTKT/GscJurP9cS6tJI6HXfQDBnq4vVMDt3TUX51T8ybAMiQE8OAbMjLd8Aj4GGULOP2+xXpplwLwjwawr6TIw8KdqU07PBxhas4mEkQbXHeS8OA4Lzh+tIL6RLDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729874159; c=relaxed/relaxed;
	bh=GLDOSgLpz6WPEciFTMmOUcnN16cSDB3QdbhwmKyjEOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZzQJQv9mwNQLdLU4wgw7BHC+HG3kfD8Pg8MBe78PwFhzgNybyfvd/EI2Sh/JGSGGyeAtFodYdixCR8i158+VDh3OOSwNxZ+vYIy8/cnkFFPWCRQn8Y+5GClD/evK9VMNHgH6spPMc4Z8ejN6HI1IRN9eSGLdlTmGJG764Lrs54YT/E4jy2gfYsu1g2PCnhjn0t6uQhOSnTnQK9OnocUZeJ/zZN+hcSS472kWoG/KqlLltoDW683Q90BcwRhuqNWiNqthUTzH2ESO/3v6jE27RaKaA54A76R+IG9SVzZ42IsL1HF7k/bhODofxMVF4RpPAj8dEpdTDdKR0fk73XZIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=YXdlpVXY; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=YXdlpVXY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZpLj2LdSz2y8g
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 03:35:55 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a9a26a5d6bfso324437766b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729874150; x=1730478950; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GLDOSgLpz6WPEciFTMmOUcnN16cSDB3QdbhwmKyjEOQ=;
        b=YXdlpVXYIfg2YxOh4l9WrFHLEL9Mk24dAKDF06WPfhWcz+6aU5l4nQnS6NNuYwlCNF
         DJDy05/o/56P6ymj3CTuAW2svHKLbU/RfKWQpB56NCIG+4/HbzUa1AcZBOS5Vvf+8hwY
         jxu+utJy6IpQyrKO6FJRgMoyqpdvUO4vEYaXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729874150; x=1730478950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLDOSgLpz6WPEciFTMmOUcnN16cSDB3QdbhwmKyjEOQ=;
        b=CDtskIwSPT2CJLVvlh1FDlo0/GG5kU9NoZKKQJegLRTM3h5x8b8kUUTNqL31jnY3su
         jVobeC1kx9Sav5JL9oy4M+N2G8ieabVXDfIyHZ3h+fyFmMiYzP2fEPg0rzwF73klJMIb
         HNIpBOnPd+Ut9LQdPZqUc6mkpOQvHGCR3M0xeI/gGVf61V59CIgdaRHhloI58JLfQu8U
         6gNZ+q9noZO4VgP4j/Xt1n3whBFy7VwIFkY4JTuggLOjFSecxSWjW55RDMcS0uyC6hwq
         Xz3lFdZ6nz9HDdZc0Bjf7c/y+1IFcAH9iJSfQWpDL+h8u7CRepOVS7SGuafVLk/wXiIC
         4o9w==
X-Forwarded-Encrypted: i=1; AJvYcCVz4m4pRynnypLj9O0jB7ic6RQEM2ed9RooX12UIip3aqaBxxfX2SWoXoCPZm4CwepYWAktTXi1gZ8xtCM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwOHXsLu2Ovb1qzNKCygGil0l7i1hnT5MDoX1ZvP2ZyJy4577zC
	fnh3UmZNHfvKjmY7RQKXy0Sx5umRZSEytO1pcIHtaDm8X0M8D1pRv6k6s8Mb9CuFfofeyOMfLpX
	bivNj1A==
X-Google-Smtp-Source: AGHT+IEHqCKN9UcdTawpWrB2z4dVyol2AThnKT3qq999wrtthrIa+uIfxvldq+tvTr6MVLTsXbcYOQ==
X-Received: by 2002:a17:907:9496:b0:a99:ebbb:1307 with SMTP id a640c23a62f3a-a9abf96d0fbmr849808166b.59.1729874150085;
        Fri, 25 Oct 2024 09:35:50 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dec7feasm87034866b.38.2024.10.25.09.35.49
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 09:35:49 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9a850270e2so367023666b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 09:35:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkh7uLRTpX0fDFjzfdY0tcekjRH+wArluz73rbidQxUMYIZOngruEsScdbLcOLUkfyj/ywliqE4StjZE8=@lists.ozlabs.org
X-Received: by 2002:a17:907:7fa7:b0:a9a:f84:fefd with SMTP id
 a640c23a62f3a-a9abf8b06b0mr1066907666b.36.1729874148732; Fri, 25 Oct 2024
 09:35:48 -0700 (PDT)
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
References: <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble> <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com> <20241020224444.zhoscljpe7di5yv3@treble>
 <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com>
 <20241020231112.erso2jzqwkbin4kh@treble> <CAHk-=wiUaWnHGgusaMOodypgm7bVztMVQkB6JUvQ0HoYJqDNYA@mail.gmail.com>
 <20241023094448.GAZxjFkEOOF_DM83TQ@fat_crate.local> <CAHk-=wgDKPt554sAyzHvW1U+Opx_2Ofu4znjjroMWr1x90SU7A@mail.gmail.com>
 <CAHk-=wjpE4hgOs0q7-jZ+=RsCD=YX9R=V3SCprzg0GOUQfCHNw@mail.gmail.com>
 <c40199a2a319440d89bfcc5c06ec4b3a@AcuMS.aculab.com> <CAHk-=whY3P=hH1SV2LV8C3-A=ZjOJ1Sd+qLJQaai+Tiy2vHVvg@mail.gmail.com>
 <4a43ca4f0f28412fbdca4accb1719663@AcuMS.aculab.com>
In-Reply-To: <4a43ca4f0f28412fbdca4accb1719663@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Oct 2024 09:35:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh6nvHVevpaF0VHgOQR_tM3gcsiUo2i3zGRAYSMSgZTJg@mail.gmail.com>
Message-ID: <CAHk-=wh6nvHVevpaF0VHgOQR_tM3gcsiUo2i3zGRAYSMSgZTJg@mail.gmail.com>
Subject: Re: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
To: David Laight <David.Laight@aculab.com>
Cc: Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, 
	"x86@kernel.org" <x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Waiman Long <longman@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 25 Oct 2024 at 01:56, David Laight <David.Laight@aculab.com> wrote:
>
> > > Especially if there is always a (PAGE sized) gap between the highest
> > > user address and the lowest kernel address so the 'size' argument
> > > to access_ok() can be ignored on the assumption that the accesses
> > > are (reasonably) linear.
> >
> > Yes, that's what we do right now for the inline code generation anyway.
>
> Is that gap there on all architectures?

All of the address checks are architecture-specific, so this page-size
gap is purely about x86-64.

             Linus

