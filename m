Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE704578A50
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 21:07:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lms110KGgz3c2H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 05:07:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hssRgYLn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=hssRgYLn;
	dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lms0N14FJz3bXZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 05:07:14 +1000 (AEST)
Received: by mail-ed1-x532.google.com with SMTP id r6so16644638edd.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 12:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dgjsZTbvQJX6D56jQTPEYTM5n0l6iiehUHolgd4Ce9Q=;
        b=hssRgYLn24Lw3qXe2EwOeLU2rpbVpcrr0gq1fZzk2oT4ZWnhDO4XXWRwks7LbqwMZd
         i+6c82W3/dvuvhnSYGYsFgmVoj+Cjp0nbYF4M92SjvCJ4Ce5vOdmpXyYQ5OpL8MDtgiw
         CWUZZi0MogKUpG4gNIMMisxiea+a5zCK8RaBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dgjsZTbvQJX6D56jQTPEYTM5n0l6iiehUHolgd4Ce9Q=;
        b=6VE4o8J27c9UDb9GMY/cfO/vbA2ElgIsLqL1ArgHK79J97pnbcZb5ftl8ZqxC79uR+
         KHZvQtrFIJuB1wt0mWqFw4B2YmRTWmYHmDYGroT6J9yEa5qQq3a17f1Hc8YgC3SaGnMY
         KggTmvzZd96e1oDrM6c0TGk7yxBKoJ8HOjl5INcrfE/cBm3EQoZYyv1uOQduK9ZaRqOK
         wxaar0hlyR9b+pDfnqm0uTe8C0rnI+cVQCR2UbBWfVNZ+kYJ8CuP+DKgrxZJrqgJlmTf
         P3jO8vx6GJI3JtcoIUN2NwG/TxL/LmHW6bu/+iJ0StITkjyFHAzWzOzNcdaYWFK+ESrf
         9Oxw==
X-Gm-Message-State: AJIora8o3qJSqvnNoPB3xO0huE0YqYK51uT+UBydaf0l0YleM6ABMK7Z
	PbvPjR/Sp/cxT5RezqqZYbJJMQn6iROasdJHLRY=
X-Google-Smtp-Source: AGRyM1syEz3gArxhdB8k9mgVp62Ui9g/YA1Vxz6fd7eB8gaQZVVWLPdlltYhZNxx49VhxXr75yDnPA==
X-Received: by 2002:a05:6402:2689:b0:43a:dc35:11bb with SMTP id w9-20020a056402268900b0043adc3511bbmr40464052edd.262.1658171229793;
        Mon, 18 Jul 2022 12:07:09 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id eq22-20020a056402299600b0043a7134b381sm8943668edb.11.2022.07.18.12.07.08
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 12:07:08 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id f24-20020a1cc918000000b003a30178c022so8454749wmb.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 12:07:08 -0700 (PDT)
X-Received: by 2002:a05:600c:2211:b0:3a3:2149:88e1 with SMTP id
 z17-20020a05600c221100b003a3214988e1mr1387069wml.8.1658171228317; Mon, 18 Jul
 2022 12:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <Ys/aDKZNhhsENH9S@debian> <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com>
 <87cze3docs.fsf@mpe.ellerman.id.au>
In-Reply-To: <87cze3docs.fsf@mpe.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 18 Jul 2022 12:06:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgJCTaY5FeNpcw6U-c1Z6c-A2WWQfCVa=1WW3Hdf9_eww@mail.gmail.com>
Message-ID: <CAHk-=wgJCTaY5FeNpcw6U-c1Z6c-A2WWQfCVa=1WW3Hdf9_eww@mail.gmail.com>
Subject: Re: mainline build failure of powerpc allmodconfig for prom_init_check
To: Michael Ellerman <mpe@ellerman.id.au>
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

On Sun, Jul 17, 2022 at 9:41 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> >         li 4,254                 #,
>
> Here we load 254 into r4, which is the 2nd parameter to memset (c).

I love how even powerpc people know that "4" is bogus, and have to
make it clear that it means "r4".

I don't understand why the powerpc assembler is so messed up, and uses
random integer constants for register "names".

And it gets even worse, when you start mixing FP, vector and integer "names".

I've seen many bad assemblers (in fact, I have *written* a couple of
bad assemblers myself), but I have never seen anything quite that
broken on any other architecture.

Oddities, yes ("$" as a prefix for register? Alpha asm is also very
odd), but nothing *quite* as broken as "simple constants have entirely
different meanings depending on the exact instruction and argument
position".

It's not even an IBM thing. S390 uses perfectly sane register syntax,
and calls things '%r4" etc.

The human-written asm files have those #define's in headers just to
make things slightly more legible, because apparently the assembler
doesn't even *accept* the sane names. So it's not even a "the compiler
generates this abbreviated illegible mess". It's literally that the
assembler is so horrid.

Why do people put up with that?

               Linus
