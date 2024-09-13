Return-Path: <linuxppc-dev+bounces-1357-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E2C978BA4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 01:04:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X58yX3K3yz301N;
	Sat, 14 Sep 2024 09:04:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726263543;
	cv=none; b=eXnGc99TeK5ocucd7GDr4ZMEem4h7X1EnlLdx3jku6hFn2riILhgwlBNobW7ONf/aYLlF6kWNTWCtpipZCMhnNDuYFu5loUYNf5Mpo/+VV25B1vjamnnbnyqjDQ3ZFUc7w6hpOb2eTFQrk4AmJuV6Aw+vqXKDFf2efLpdmCEcC1uxvRnsBZnOO9Hj7S+W3qowCSuh6GxuksIebytCxkAluCssD0YJaRIF6e2clYBxw/FdfR6KrgZsSWBebaUtuiWpl+4dAirLFQtxUEOL0PXvpXoujF5fGeHZC3hdQyVBAOze7fPmJPCBGJi9acV0tXf1SiKzMFNF5jT+gGiq9dEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726263543; c=relaxed/relaxed;
	bh=SxOaF8AxUHaggzGBR0vXSvLLKExg7G9i5r3GTwRaXcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lcbH1xTTyohXxYVcrLs3eZbFjyV9v0O/mP9cP4tIUtuXpuKvgbv7bBLC+R4jex20K+lmys5alPR+i25OJe6V/q1I1DURMIu3FJPUWz/ELZ43ZHd4IvVBJ98nDzwuuCcCtpGk1MXFHjwE6Zo1wft5yj8Xpag1bnNAuAHdDfnRpbugPP5I/gMhBHtKvbVUH/OnxJEzhznU03E5Hpc+EeavoCRGGWjidL9O8IrzGzFD/CkP3QSWc87Yxm6StibO6DWDv5lHLqX5/30rSJSiXTBrlQ+P5x02/i7yCP1Hx+aeEQiY/hZgOOv85YC7vaFIh9N7JK2aLTDcmQemZgzV7Rn70Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K9/uHEOd; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=almasrymina@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=K9/uHEOd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=almasrymina@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X573p4LVYz2yZN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 07:39:01 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4582fa01090so84661cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 14:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726263539; x=1726868339; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxOaF8AxUHaggzGBR0vXSvLLKExg7G9i5r3GTwRaXcM=;
        b=K9/uHEOdHYZsyXmG1X8tnq4n+27qRxbzirxTeph3aFxScnbYqVQcaG/hR7rS5FwmPT
         GURKh7O2fylxdkBrXhUhSbbQ6LmqamXqnj7BcWFbj4ZULEtjQKEgHnkxRPaOfxBQu4it
         3bThf/2HdjFJw/07+9lUyAJ3gvlG8xu0w0suP1HtL2KJdh0469wey8AshnOu43y7Xje4
         7luPfIvR5fP/4zEhdrpof4xYSkMveVhSdH5qSx80kN6r1ZdrAFhKGvDXVUpDi/ntaDyn
         hOk5uU7/zO0rW9Dglg+qOVJlsj4mYivtMCk1S9iwT/rGKrGHOkewyivn3t2m3bJaJ/qp
         cNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726263539; x=1726868339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxOaF8AxUHaggzGBR0vXSvLLKExg7G9i5r3GTwRaXcM=;
        b=Ne2WksihtpNFlK1b5Ea2FpmKiNxhgAd5vW0IswVFvZcYtsq0n23fSOSN9eUJpPe3Ue
         PiztrawXhdrctacjEv5xkQKjiUI2/jGblZuHKRPqlJ0SbI4P5/e4kVpMaEPcURCuEQLH
         XGHkGO/jKfPEvHva6nfJ7g38uHpbOjgF576BuNRQfFAAPNHpj9+13NYjgqHggHFxhFLB
         OqWU7THPWqMoyoYyU/HRsgRjV40tL9yR2nOsJ3Z/Pw19H6lpB5foSDLTXiWBMkq+3c6Y
         0rDVeipVX2iqxOrK1e4gE/rhx/TccPj7w182XM2i/ySZ9tqEdLhlPBE3jehxtJ1uGrNU
         SDlw==
X-Forwarded-Encrypted: i=1; AJvYcCXLslmwZFdkii5g8uh7/DAibpIIQLrpEYciJ6WWM7nvgMH97bPhTVqefnnUraYJmC4/Y7h1vXGUq108JrE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxUDGaktKUtR/kaqhp0BvW0boEDJP9tiEr33t7UT4MeEIHSu99X
	0mpQpyRh889NJuXRqNOjyT3fuBW6f6bYfBlVd9fIXzmOIH80keURLKGZzlTxedUy5ZhIUrYgG61
	Yt4mJ5Z/UiHg3etV1ZCwpLZhInMZT07oODAT0
X-Google-Smtp-Source: AGHT+IE7wQ6d82h+20+gfYgwUOrNdS6QR9EOku3ZBk+A8q3enqbGgESkjkfIrzysdu6Edkr34sHnqy06TDcBVoKfdsU=
X-Received: by 2002:ac8:7f41:0:b0:456:7501:7c4d with SMTP id
 d75a77b69052e-458644fcbebmr8520731cf.9.1726263538792; Fri, 13 Sep 2024
 14:38:58 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240913213351.3537411-1-almasrymina@google.com>
In-Reply-To: <20240913213351.3537411-1-almasrymina@google.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Sep 2024 14:38:45 -0700
Message-ID: <CAHS8izMfFPkXU5Wx7i7af2c2=nVzZ_GJnoj0YyLugKDr5uAyjQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 2:33=E2=80=AFPM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> Building net-next with powerpc with GCC 14 compiler results in this
> build error:
>
> /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
> not a multiple of 4)
> make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
> net/core/page_pool.o] Error 1
>
> Root caused in this thread:
> https://lore.kernel.org/netdev/913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-so=
prasteria.com/
>
> We try to access offset 40 in the pointer returned by this function:
>
> static inline unsigned long _compound_head(const struct page *page)
> {
>         unsigned long head =3D READ_ONCE(page->compound_head);
>
>         if (unlikely(head & 1))
>                 return head - 1;
>         return (unsigned long)page_fixed_fake_head(page);
> }
>
> The GCC 14 (but not 11) compiler optimizes this by doing:
>
> ld page + 39
>
> Rather than:
>
> ld (page - 1) + 40
>
> And causing an unaligned load. Get around this by issuing a READ_ONCE as
> we convert the page to netmem.  That disables the compiler optimizing the
> load in this way.
>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: David Miller <davem@davemloft.net>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Networking <netdev@vger.kernel.org>
> Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
> Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
> Cc: Matthew Wilcox <willy@infradead.org>
>
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
>

Gah, right after I hit send I realized I missed the 24hr rule.
Although I'm unsure about the urgency of build fixes. Sorry about
that.

--=20
Thanks,
Mina

