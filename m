Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA280578DCC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 00:56:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmy5K5NgXz3c1l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 08:56:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Gw/FjPF8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Gw/FjPF8;
	dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lmy4f5FFgz3bXZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 08:56:16 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id l23so24022358ejr.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 15:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6NG3iefGii64YvAHaqT9Gl2cXR0OyawcZjQPtQ480mA=;
        b=Gw/FjPF8Ur/vqmfSNWpe6ZDtwcSnfqg2tbke8spsSGZlJ7x2utphweVTjsB8WHOMjz
         p6g7G5FO5hU63p44BJkbSE0k+uBFvhbNpROGCudhA9t8TYokwLkoL3sUwcj3gOSpoPdm
         CaFniujP7FZBaTXIsrNxkqbX+X5r9AmD9U3EI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6NG3iefGii64YvAHaqT9Gl2cXR0OyawcZjQPtQ480mA=;
        b=TV7M/cNvIa58Z3oWEwBK/BTq3kiA7G5udjRp3Wd02CRk64VBLUUooUTJA+jWR+fbQE
         a/Xu1mVwh0hfKv63/TlGwn0CByPn/5SmqK1lv2kbQshkoNXnasPrTNdSh2HjTNY9DDyF
         58wkUny6KARzE3voMgFro+gmvAZKIW7xmQKm+VIy7mrgOAsSp6DQFpl9PnK1jxAUF5u1
         FR12tgG/4+3Gal/iVTY3XOYGLzZaZ6rLWnrozqMa64LtGobpFbxXf+dd8OGFqOpwbivu
         QSPXBEs6/4qfM+oE3iGKzU48hsWNHgZ8ik3rldMjdQs8ZAgy0WKxMbyUps43erwxafOn
         O8tg==
X-Gm-Message-State: AJIora/3Z1P37hd3WOE05HK6UbLOXa9MO7oWqhL3P84Vks30w5AGLzT/
	X5MWX/c4MMHds7aR8CubSJnS4he4WaOrEVXycFw=
X-Google-Smtp-Source: AGRyM1tsorcF6LE6kk426wXbv2P4SOIVpikkhPHo2yp6U++sxGdUbQszPexSqfa3opAMeKh6t545JA==
X-Received: by 2002:a17:906:9b14:b0:72b:7c6f:2e87 with SMTP id eo20-20020a1709069b1400b0072b7c6f2e87mr27907225ejc.643.1658184970303;
        Mon, 18 Jul 2022 15:56:10 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906201200b0072b1bb3cc08sm5944418ejo.120.2022.07.18.15.56.07
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 15:56:09 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id j1so14665761wrs.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 15:56:07 -0700 (PDT)
X-Received: by 2002:a05:6000:1a88:b0:21d:aa97:cb16 with SMTP id
 f8-20020a0560001a8800b0021daa97cb16mr24939012wry.97.1658184967334; Mon, 18
 Jul 2022 15:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <Ys/aDKZNhhsENH9S@debian> <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com>
 <87cze3docs.fsf@mpe.ellerman.id.au> <CAHk-=wgJCTaY5FeNpcw6U-c1Z6c-A2WWQfCVa=1WW3Hdf9_eww@mail.gmail.com>
 <20220718220839.GF25951@gate.crashing.org>
In-Reply-To: <20220718220839.GF25951@gate.crashing.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 18 Jul 2022 15:55:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjWez4jFa1sbkhMqGktFPDMvd3kojibwFyTkGOL2xrp5w@mail.gmail.com>
Message-ID: <CAHk-=wjWez4jFa1sbkhMqGktFPDMvd3kojibwFyTkGOL2xrp5w@mail.gmail.com>
Subject: Re: mainline build failure of powerpc allmodconfig for prom_init_check
To: Segher Boessenkool <segher@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-hardening@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 18, 2022 at 3:12 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> Assembler language is unforgiving.  It isn't easy to write, and most
> mistakes will not be diagnosed.  If the assmbler language makes it
> easier to read the code, that makes it more likely correct code will be
> written, and that correct code will be written in less time.

What's your argument? That it's unforgiving, so it has to be
unreadable and easy to make mistakes in too?

You can get the order of operands wrong, and it will still build -
just to completely the wrong thing.

> > Oddities, yes ("$" as a prefix for register? Alpha asm is also very
> > odd), but nothing *quite* as broken as "simple constants have entirely
> > different meanings depending on the exact instruction and argument
> > position".
>
> What is broken about that?  It makes everything very consistent, and
> very readable.  Sigils are just nasty, and having the register names the
> same as valid symbol names is also problematic.

Oh, I agree that sigils are good to make the type clear. So '%r4' is
better than 'r4' because the latter could be ambiguous and you could
have a symbol 'r4'.

But just '4' is plain garbage.  There's no "could be ambiguous" about it.

Type checking matters. Not just in C. In asm too.

The reason '$0' is odd because it's *just* a sigil and a number.

Which certainly is not unusual in itself, but it reads like it's a
number to me. Not just because of x86 gas ('$' means 'immediate'), but
Z80 ('$' means HEX), or at least 'Nth argument' (shell).

And yeah, alpha got it from MIPS, afaik.

And presumably MIPS got it from "we're hacking up the simplest
assembler we can".

> > The human-written asm files have those #define's in headers just to
> > make things slightly more legible, because apparently the assembler
> > doesn't even *accept* the sane names.
>
> That was true a long time ago.  And the "#define r0 0" thing caused
> quite a few bugs itself btw.

Those #define's still exist. Look it up.

And yes, they are horrible, and they are wrong, and they shouldn't exist.

               Linus
