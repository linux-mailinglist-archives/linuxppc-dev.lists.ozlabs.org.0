Return-Path: <linuxppc-dev+bounces-5704-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E570A226CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 00:20:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yjyn60JMZz303B;
	Thu, 30 Jan 2025 10:20:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::233"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738192701;
	cv=none; b=DNUw+AEAhMjWyd0THCSCJRMgewmIBhKOF41VNtQHF092kbc5AoESTnQb77fuAqRYv9/WV5Iy2sbNvFN8Fw9k4jtiYTqBf/ePApEvmJHTRykdBzVfAskgMxnITm9enNJ5IY9ynNzMdyrfV5Z7FiWM074866Lipm1kW/3wZju2d4Ca1UmVpL75V2XE3I/fFyTosNegXQngqY+lllr6DeegQvvBoXXVdE7Xr+uq5lEWb7Pb8Udm02RGCHE9vue+lPhHR80h4KRwIokwr5UmOnx6uyfWBBREYDUlNy4HYTCZLl2HY9QtMs82eW9586JT8c+e2J+TSJgF7EmLcgjo9xE2iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738192701; c=relaxed/relaxed;
	bh=QvpZ7PmBrG3gp5YeFE37+hnKtxRr8CPClHcCzrd1MIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUfRQxpOot21Zkfycq5ImDQPKmSDpik+DSVMqrU0sXePxRJ7tsq/2zc9lZv6AVLTpuLIP2RXP5+7eSJNmw3JNqMWxh6pbaRzy322yJ0XpXfJSBHrg1jUBfgrCrEFEUdEHVMokrMCfQXOw63E9rVELScD4s+Ir22APNXlvWcKrP2ktTFoqr2UOQPYcJ+NLV/I48fjf/JBRAjj2vh4e9qBXHzqA3/w2rRdO+W1Al1jrjmdgyJmmmNDANrfyg+JkPDyyC5OgaMt5n8Q8c0EY69MXOXOeAs64boGPta1ELaBJ1mGNmsJLBxjpAd4WIdr5YPYVywcerjKCmZ90sab+OnPtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cBPcSSBQ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cBPcSSBQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yjykh6XpZz2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 10:18:20 +1100 (AEDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-30761be8fcfso1409971fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 15:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738192697; x=1738797497; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvpZ7PmBrG3gp5YeFE37+hnKtxRr8CPClHcCzrd1MIk=;
        b=cBPcSSBQFcl+XS7GWookpEcLy4p4IycZH314VT6j3aubsr/EvYBTroiXjWQZoBWC+f
         bWLbxYsIRPsOlOGqRb2IB16xOcskHw8hmzfXlaafHMH2naCl+HXtGbqjK/f9ofhFWO6k
         cGM6XOT45OQ3lubzHmarDiG5UhNHhcChnXbBONOLyGH5cWgJi5FGosJfw+fyE3+D3ESN
         gT+4n4nXO764OTbkmp9tdzpFRnkiiaQ0GYncB5wX3XFJaKAw9zIz3+Tu0/1RgoMGl6hh
         ZCzi2jUBe3DPFVb4y2W4AZNcjVgXxEED0PcD0m1qG+VT1zSFP35V4JXLW7vbuwsVkHQE
         EN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738192697; x=1738797497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvpZ7PmBrG3gp5YeFE37+hnKtxRr8CPClHcCzrd1MIk=;
        b=bytG5l0gKCbcvxOe7p2gdBD48yqousSleZKsJlgfYUzx2yK/rqSH6mEbtt4z3oURyj
         +iTH6KEHsRw0IwyxuYViF+xrgPwFOY6sTvxWOaZk0itw9AKbf4ovW3LuccYGYWmR3CMb
         BsISMAePtLD16PPOe+plTWBopctxu0vtF8C36KQ7+jm46FfXoCf4tDHZTeAg298bIMkO
         KsmkMnOnvYXbZayp/34+9OORpMqtY4BgTTJipTWA6LOU7snz3EGpBK7wSGnrefeSjzAQ
         UX7TTaFhFsF3HzneqwdVtPK0zCRkWE3odYQipIsPnKbnw8LRzXt72GeunCFOm3ldLWvh
         PvmA==
X-Forwarded-Encrypted: i=1; AJvYcCX1kZKdXVQMlRCDKArJRU9dM0RHojmbWGlznSqje0EveRqujmW+EJukJ9Bh+9Z/3y/wp0gOOxjErWXIUVI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxtwkTF/9mQpfQxXHNxaNsI5BGPC1d+k1C1nbByfMBUtXujytu6
	76TUBM9KWSDKYnlYtsz9iqXeWOwFpSXodlJ/FM1bwW5NjvHOo7fGJnScBeyOejAIfT0gqaKHAK7
	NPzL0VSionEXmZ/NHT22VVmJHKlc=
X-Gm-Gg: ASbGncvJPczDqoF56OlbftmaAJqpvOaIaEBt7i9AxAZZrrNLH7qZ0HZxuejHlBrBkOw
	r+mejMCpkz2YXu68qGt5xmrcmITykksVhEwq7vHec4Yb+JV84H8mGmVYxMhN6vc2lNZrwkBMbxK
	UnOM4VboPqjtl7/D3H9eR2yoKD62Dalg==
X-Google-Smtp-Source: AGHT+IHaAKHEaFfIIrl4XoFSnnfGpYvAmUJGb3+mGNwMi0XiBaSkv8xOXbNKQLBjZ1eD0DTNqyAy4nr7gh28RazKqW8=
X-Received: by 2002:a05:651c:50e:b0:305:d86a:4f01 with SMTP id
 38308e7fff4ca-3079696b37fmr20071361fa.31.1738192696891; Wed, 29 Jan 2025
 15:18:16 -0800 (PST)
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
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAJ-ks9=hNGRFbr3sTQBma3u84Yhog7i33Oc=16FqFjE_JYNERA@mail.gmail.com>
 <Z5qzk_92KU0xoLcP@casper.infradead.org> <CAJ-ks9ksSh-r6SmKsm7iJA6nCqvrhXZ8jtjP-YoeMNB6tF5a=g@mail.gmail.com>
 <Z5q1mkliUUM5Xlod@casper.infradead.org>
In-Reply-To: <Z5q1mkliUUM5Xlod@casper.infradead.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 29 Jan 2025 18:17:40 -0500
X-Gm-Features: AWEUYZm6-Axfuwo7gaO51xSLYv-t81bl89X3xorrqlt1HmTwF2QQ0EEOzVieTek
Message-ID: <CAJ-ks9mPzb9DzteGuUSnUpasnTfYLTgxqvqZ7njWGgWqRtMe7g@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: Matthew Wilcox <willy@infradead.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, geert@linux-m68k.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, 
	mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 6:11=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Wed, Jan 29, 2025 at 06:08:22PM -0500, Tamir Duberstein wrote:
> > The whole point of tools is to liberate stupid humans' brains like
> > mine from mundane tasks like working out who to email. The tool wasn't
> > wrong; it did exactly what you told it to do in your MAINTAINERS
> > entry.
>
> Tools do get things wrong.  So do humans.  When you take your hands off
> the steering wheel and the car crashes, it's still your fault.

Which one of us is driving in this analogy?

> > > > For what it's worth the kunit invocation, while obscure, is
> > > > self-documenting. There's usage information that's reasonably
> > > > understandable embedded in the tool itself. I looked for the usersp=
ace
> > > > testing initially but failed to find
> > > > tools/testing/radix-tree/xarray.c. Even now, I'm not sure how I'm
> > > > meant to compile this.
> > >
> > > kunit is useless.  The test_xarray.c module is useless.  If you break
> > > xarray, the kernel won't boot far enough to load any modules.  You
> > > haven't thought about this AT ALL.
> >
> > I don't understand what you're saying here.
>
> Then I don't want to see any more patches from you until you do.

Yes, I see now. But it's not quite true; the patch was itself
motivated by the difficult output of the tests, so I did run this with
kunit in a state that produced a failure. Your point is taken.

