Return-Path: <linuxppc-dev+bounces-3536-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8E39D7736
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Nov 2024 19:16:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XxH925CFFz2yFD;
	Mon, 25 Nov 2024 05:16:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732472198;
	cv=none; b=Z/a2ZBWz3th2WWPiuFC3BaxINjI5dYa5P7BlSv4Z6QTRn6PPTLeDFnf90NTgXa+/S80MJjn0mfZhhSlmP5t24Cfhtry5q4HR+hYzPdpUz80QAfXLKZyAiFlxcWhlTHhA1S8+z6iPC7RhNE0Vt5bndvp/duVt/SGyCFc3zH3YT1U9TglaDRAHC5rVYipAh5xmZHHbkUQKX4e00nZqmuVRb3Yw59qpBOz6wmDzJMuUg82nGUlGelCd/8aALZ3nprzZBJA1npnYWu/RNn2t8l0a7P4+ygvujYMhAi94TciMBD8V6oZOn6lasdngSQCiYAXu1V137iCANvahigUbT4Va+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732472198; c=relaxed/relaxed;
	bh=9nEvmX/RSuTdFkbcUkssWby2DmD3HY/Zsgoyaq7a18g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jvbZT+8oN9jEG0ebYDqUYiOoL8ariLblYdi7fnmsLXzjx+R5zvUyUK20m3UsXPL/3tMVNI0C5CbY2TodG5RO+iChtD6NBtlVbwVxn0eHeT5jrdkDc8d0rP0G7nuApsw3vzBovznjn//ad3njjrwBl5JKi++iVyU+3wE26oNebvfie43a9PnYlnCrpNlmhP4N8B85UczPfc8H8gJSCMr250oBfIYvBnyeZgOyaT76NZsUNEF0ynBwtjVsabPDGJICzLPbSI24SbqwaRkicF+3nptEy/N81DConbn5+7ZVgvd2YOvmWGOsSIF3vodi7C0ViMvlj+UAbu8DXZUmV22RZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=TGcanjpw; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=TGcanjpw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XxH905MSKz2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2024 05:16:35 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d036963a6eso1868394a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2024 10:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1732472188; x=1733076988; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9nEvmX/RSuTdFkbcUkssWby2DmD3HY/Zsgoyaq7a18g=;
        b=TGcanjpwjgqkyWaZwnwI0sFsccOLXNjOEnD9JSFpj9YR6vlJnlSdEb5J/106W3pMUp
         Y1MljQBzjXM6nVPdGJ6mQpB66aa5hXyxWKYxO1WDr0Ms0BokvB6q71+i1aDR6ULGX9Tk
         MnR9jFciruag1H3ApIPdIZUGygqjSGjUVY/68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732472188; x=1733076988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nEvmX/RSuTdFkbcUkssWby2DmD3HY/Zsgoyaq7a18g=;
        b=hF27immVIkKaUgFLlelpQzAsnjNxptXHzjF7mS+wZ2/ZxtOLRjMiXjf+4ZsOBM43x7
         DyHTLwvBkOtIRg2TrzSpitpVK4w4cycYBSaM0cGhU70t5mixZDvboDmFqz3WSKUvPB+u
         4S18PlVkZdOUjxJUmVNlbIeag3Mzs5VSmQeJBY2xTERg3G5UGDJ98LtsmiZWsIbuHIOU
         wssIbnYaJGHZWlEtUZtlFGZElOydPiB7GdiBBjgQY8sgYclgngGeMwXZ1uv9b5Q6GAXW
         ZWVjutzdDi2AgxN2mSCefklvXZKQz+FdQX25pSVhL3wJeX2zydy+YM9eV0nUU25jXyLX
         8tiw==
X-Forwarded-Encrypted: i=1; AJvYcCUwKyl3+79FpiREm51wJg1CwFQOltuERzeTJZ9nrsCh4cTAyCLVP8WqMmziHOqoJINyHm9CE/qF6ajTLNY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzPWmY/F+PI1FKxhNlQ+21RnH8fYHAqc7wYkHuhtElvUwN2k00J
	P6Mn5EjB6Gb5cX1ohPTFlZz/ieP5SXJXdI0kY8sO+GXMWuSykzjUqoU440zUwWis0VXuQKJqL8V
	G7Pp/qg==
X-Gm-Gg: ASbGncvZvmR/LzWlzq+HbWI73JQtk1ge/VH+FXr+gXewby8LHci88jY59ddhRpBhNAb
	GWfk4RVYMN8E7XrFyd0eUGUrzqlYcK5Njc4D5NjcbKzbKXZHtFv8AdE0uGQTZb3UrD4h8S8SRYC
	YS8Z6Lew1kI/eR0RExeZ4xGc5PWX6vMq5xk23VZ7OsMcZENUQfyOhEhOXN+tiXnrVn/3jaLhX7a
	+/6eJsdbLTqLS0QW0itb9rGHUKiW5zGpw4lacQUrgM4HQOiCrw9HpcCanl3STqhJHjmfdwduCpY
	sY3kJ5VEERuJq4aeRqOoDkM6
X-Google-Smtp-Source: AGHT+IFaE1gperomJ3VZdtaUT3rcYrwm92BcWoK4oGq4CJb1xTfUt3FK7PeFAj38f/hKt/K2uujhGg==
X-Received: by 2002:a05:6402:1e93:b0:5cf:f346:1618 with SMTP id 4fb4d7f45d1cf-5d0205fac47mr7112857a12.9.1732472188174;
        Sun, 24 Nov 2024 10:16:28 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01db7abe1sm3383167a12.36.2024.11.24.10.16.25
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Nov 2024 10:16:27 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa520699becso326384066b.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Nov 2024 10:16:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXxpR2Mtgv1xjTi7XZ7oEEtLvTYCP3Ie+irTHlYHlzgsS/Av29M0m+Lj6Si2T1YjgmF94iQuUN7d7HlEM8=@lists.ozlabs.org
X-Received: by 2002:a17:906:3ca2:b0:aa5:1ef5:261e with SMTP id
 a640c23a62f3a-aa51ef5266fmr695134766b.17.1732472185004; Sun, 24 Nov 2024
 10:16:25 -0800 (PST)
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
 <20241122031115.5aasuktqrp2sidfj@jpoimboe> <CAHk-=wjJt49tgtmYv42bXU3h0Txb+mQZEOHseahA4EcK6s=BxA@mail.gmail.com>
 <CAHk-=wiL0TepguMNaR65ZdkkiBEoi4hTE7PwG3bBO1c5SOXmWw@mail.gmail.com>
 <CAHk-=wj4LHCiD8f75q-jf7mu7Jyn-wHgGoni6WSQtdh7+HtGNw@mail.gmail.com> <2d7744d7ce504b288c3f1356f27910ec@AcuMS.aculab.com>
In-Reply-To: <2d7744d7ce504b288c3f1356f27910ec@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 24 Nov 2024 10:16:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgCDMrjKc7foeV5zHRL_ioRZqqu-XKN5q9fN5NFCpgXZQ@mail.gmail.com>
Message-ID: <CAHk-=wgCDMrjKc7foeV5zHRL_ioRZqqu-XKN5q9fN5NFCpgXZQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] x86/uaccess: Avoid barrier_nospec() in 64-bit __get_user()
To: David Laight <David.Laight@aculab.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
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

On Sun, 24 Nov 2024 at 08:11, David Laight <David.Laight@aculab.com> wrote:
>
> Is there an 'unsafe_get_user_nofault()' that uses a trap handler
> that won't fault in a page?

Nope. I was thinking about the same thing, but we actually don't look
up the fault handler early - we only do it at failure time.

So the pagefault_disable() thus acts as the failure trigger that makes
us look up the fault handler. Without that, we'd never even check if
there's a exception note on the instruction.

> I'd also have thought that the trap handler for unsafe_get_user()
> would jump to the Efault label having already done user_access_end().
> But maybe it doesn't work out that way?

I actually at one point had a local version that did exactly that,
because it allowed us to avoid doing the user_access_end in the
exception path.

It got ugly. In particular, it gets really ugly for the
"copy_to/from_user()" case where we want to be byte-accurate, and a
64-bit access fails, and we go back to doing the last few accesses one
byte at a time.

See the exception table in arch/x86/lib/copy_user_64.S where it jumps
to .Lcopy_user_tail for an example of this.

Yes, yes, you could just do a "stac" again in the exception path to
undo the fact that the fault handler would have turned off user
accesses again...

But look at that copy_user_64 code again and you'll see that it's
actually a generic replacement for "rep movs" with fault handling, and
can be used for the "copy_from_kernel_nofault" cases too.

So I decided that it was just too ugly for words to have the fault
handler basically change the state of the faultee that way.

            Linus

