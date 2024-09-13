Return-Path: <linuxppc-dev+bounces-1360-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4579B978BAF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 01:06:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X59111kHzz303B;
	Sat, 14 Sep 2024 09:06:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::829"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726266222;
	cv=none; b=ekwCmcJ+CATDyUp4iE790nvif2+uy85LsUSBMH13XoQl+Ab8Iv5DwnKZ5KGlLFdqJhPMFxXA+5MMp/YoGrrB0ucI8K+0jNfA4vV2xEzbVQouwEpq7m+WyjXCxrniEaavhxarkAzh9bRmZWmkXcUsN0Srbdqw1MnhXurjjGaLeaoYupGuqY3yIcQ0sG3bkF9DsOi6wqHzJP9v8NK/epicnG7Bt6nAkQB/EHsybHjgXGs5etYxeQq3PkKG1k6By1lp4ioRDQXVfr+4XjuVy/oWMKxMZddbkuXD7TNbLHRJtt1AiO6QfJG+2W+Nw46m8neMJu1gcrAAwcJodvDbf8ehDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726266222; c=relaxed/relaxed;
	bh=eqqyM6e9cpYbtlo2tWfzei5AGAvl9ob43ovRmyypuYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MPRCuKC4mCAVK/c2WiaZgtSfE9UJebqjAk5/pKpR8hvhC77ZgCJMQrsOfg66GAP1AkC12lwbGkWhXRPjRkr70MyPMAYfg/Xg+86EqUn+U8eGa8jajvng4IMLZfYpkEaLhmU/+FYigSSSoShBHRazx+RWaUuiJSw2dD8jQM9YdHCmOf0NzZtiu3X417jKXMQLkBBCeyLFqm9jZ1M7cp3orYKzVnoTKbm+ivdRVP6P1aiENZalVWoSqrtLPikWHQPAJ+TPCubq9b/1uAjrSjZ51pxgAmd0KX5ZtRmcoXaCBDc+4FmVFhIx59DeRpfC3hd6lN+lmdumtDPKAoqjylCGKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KuFiVob0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com; envelope-from=almasrymina@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KuFiVob0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com; envelope-from=almasrymina@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X583L0ggsz2xyG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 08:23:41 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4582b71df40so35171cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 15:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726266217; x=1726871017; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqqyM6e9cpYbtlo2tWfzei5AGAvl9ob43ovRmyypuYs=;
        b=KuFiVob02MlVeqlP9OVsAIsHwJp+V7WxozbO9ihEL4bFEAqOoqK1o+VJ+5C7vzHoI2
         DhtkzEmWvbnwJanh6vxfJ6r0dRu3mQTWZNYopMyGuN7TyzdS01MWPK98zt1lFN+NNyqg
         dpO5nW9ILzbDOEJ8yrISMQcqGc3BoqXMYIcOu67uTPxLZ8IrD0HPBJx8lUM8tsFRRg/E
         9Ka3SKORoct3tIOlt4sRAiwxpwSUTK/v5JJuWCM2/lE0PDq/Us/pum+quj6gMUEDAfrm
         9ngCYhTBMbUQcSUnA/zbY8tg5WtlgNSY/3xXmfI2oHhEoNDxf7BVhJNB8RzVsdGPZkMF
         xtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726266217; x=1726871017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqqyM6e9cpYbtlo2tWfzei5AGAvl9ob43ovRmyypuYs=;
        b=CCxQX7tk3yp8DtIEm0uDjVVn3y9NEtl71CJlhC+NFjx9K/XQCCJp8K3luam4lNEqSE
         cWrd+S9FVEo0iP+zHtWthRDojjJeyEaHGTCzL1gVtiYb3P1WkFRDSyGhjnEr7O0o//KU
         Gr3SY62jy50jew3qySG5VYAIhzOJXPXj/8C0YdIfMXfhPHqvUbvFXT59caxbCNtyqe4v
         eIWKwX4ZAIgW/7fn88WAqft3zwO1HCymW6LDD1WX1UG6jLNliVzTfwF2LQJaDtEAv7VT
         GTrqwJ7ob/ex/VpKbktZBPQQB6N2slLzG1GoKSupVYrVsib21NzyuJHnhZHBxaGasHR7
         Ikxg==
X-Forwarded-Encrypted: i=1; AJvYcCUGDFnO55JEst5ElC7xxEEAgCg9rsDbUM6EcXLl9FB4jLLl5e333gT0XeyaaWifeo+2V2ssqgXn4+g92XE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz8KcnPICtO9/ljG/ju967HAdhqMfO2PmJolTZbVvVonT0sOz3f
	dPbCgNa+8qvtC6YI0OcgGCjNegd2XrT9oDsgZzL+3ur5+QaGbKx1uz6A4vBPqe7cLwWQhug5CcL
	9vuUtkQsliKHK5sdeZRCgVpjuiRG4/SpnlCCF
X-Google-Smtp-Source: AGHT+IFnKX/B3cqJDC/JWovLKRmYSwF/IsdRdB5Egzrid1jjZiPb9OcqTMWDL6pk/cxRtNKG6BhhmgB+oQUm5lTqrG4=
X-Received: by 2002:ac8:5782:0:b0:453:58b6:e022 with SMTP id
 d75a77b69052e-458608844demr10344731cf.28.1726266217155; Fri, 13 Sep 2024
 15:23:37 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240913213351.3537411-1-almasrymina@google.com> <ZuS0x5ZRCGyzvTBg@mini-arch>
In-Reply-To: <ZuS0x5ZRCGyzvTBg@mini-arch>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 13 Sep 2024 15:23:22 -0700
Message-ID: <CAHS8izPthEJJX1yRenCjGeU9s6dgbfRE+pMZvcxfnMMC5kD9iQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 2:55=E2=80=AFPM Stanislav Fomichev <stfomichev@gmai=
l.com> wrote:
>
> On 09/13, Mina Almasry wrote:
> > Building net-next with powerpc with GCC 14 compiler results in this
> > build error:
> >
> > /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> > /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
> > not a multiple of 4)
> > make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
> > net/core/page_pool.o] Error 1
> >
> > Root caused in this thread:
> > https://lore.kernel.org/netdev/913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-=
soprasteria.com/
> >
> > We try to access offset 40 in the pointer returned by this function:
> >
> > static inline unsigned long _compound_head(const struct page *page)
> > {
> >         unsigned long head =3D READ_ONCE(page->compound_head);
> >
> >         if (unlikely(head & 1))
> >                 return head - 1;
> >         return (unsigned long)page_fixed_fake_head(page);
> > }
> >
> > The GCC 14 (but not 11) compiler optimizes this by doing:
> >
> > ld page + 39
> >
> > Rather than:
> >
> > ld (page - 1) + 40
> >
> > And causing an unaligned load. Get around this by issuing a READ_ONCE a=
s
> > we convert the page to netmem.  That disables the compiler optimizing t=
he
> > load in this way.
> >
> > Cc: Simon Horman <horms@kernel.org>
> > Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: David Miller <davem@davemloft.net>
> > Cc: Paolo Abeni <pabeni@redhat.com>
> > Cc: Networking <netdev@vger.kernel.org>
> > Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
> > Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
> > Cc: Matthew Wilcox <willy@infradead.org>
> >
> > Suggested-by: Jakub Kicinski <kuba@kernel.org>
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> >
> > ---
> >
> > v2: https://lore.kernel.org/netdev/20240913192036.3289003-1-almasrymina=
@google.com/
> >
> > - Work around this issue as we convert the page to netmem, instead of
> >   a generic change that affects compound_head().
> > ---
> >  net/core/page_pool.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> > index a813d30d2135..74ea491d0ab2 100644
> > --- a/net/core/page_pool.c
> > +++ b/net/core/page_pool.c
> > @@ -859,12 +859,25 @@ void page_pool_put_page_bulk(struct page_pool *po=
ol, void **data,
> >  {
> >       int i, bulk_len =3D 0;
> >       bool allow_direct;
> > +     netmem_ref netmem;
> > +     struct page *page;
> >       bool in_softirq;
> >
> >       allow_direct =3D page_pool_napi_local(pool);
> >
> >       for (i =3D 0; i < count; i++) {
> > -             netmem_ref netmem =3D page_to_netmem(virt_to_head_page(da=
ta[i]));
> > +             page =3D virt_to_head_page(data[i]);
> > +
> > +             /* GCC 14 powerpc compiler will optimize reads into the
> > +              * resulting netmem_ref into unaligned reads as it sees a=
ddress
> > +              * arithmetic in _compound_head() call that the page has =
come
> > +              * from.
> > +              *
> > +              * The READ_ONCE here gets around that by breaking the
> > +              * optimization chain between the address arithmetic and =
later
> > +              * indexing.
> > +              */
> > +             netmem =3D page_to_netmem(READ_ONCE(page));
> >
> >               /* It is not the last user for the page frag case */
> >               if (!page_pool_is_last_ref(netmem))
>
> Are we sure this is the only place where we can hit by this?
> Any reason not to hide this inside page_to_netmem?
>
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index 8a6e20be4b9d..46bc362acec4 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -100,7 +100,7 @@ static inline netmem_ref net_iov_to_netmem(struct net=
_iov *niov)
>
>  static inline netmem_ref page_to_netmem(struct page *page)
>  {
> -       return (__force netmem_ref)page;
> +       return (__force netmem_ref)READ_ONCE(page);
>  }
>
>  static inline int netmem_ref_count(netmem_ref netmem)
>
> Is it gonna generate slower code elsewhere?

Yeah, I think it will likely generate slower code elsewhere, and
avoiding the overhead when this is the only callsite that needs this
really seemed like a plus.

--=20
Thanks,
Mina

