Return-Path: <linuxppc-dev+bounces-1345-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19912978844
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 20:56:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X53Sk5xN7z2yjR;
	Sat, 14 Sep 2024 04:56:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726253814;
	cv=none; b=TUd+Hapzpmg4NWtVOCnzPDOFDF27gQBZCz52EqsZQHLIksxBa/N/kJxiCoaGkoKEMEjpqdkxM3vih8PMZREyIX3HvlrSALpbJBXEb7vHtugBAjG6XTBoQjkuZErgkj1QT4QCwS7NxiFg6x7Be7yNykOzHfYDquf7gS0+xJjShpcTvmJdhti0qO8Bkb8Z1L7Qk2mVgsPGBkoGhaCumwgncxTIhKGTnpaOxa0qStpfkPrpX+3vRFfaor7ZGaRnXHQfdKA6qyiV4a1tDLEB/gKY64sHy+XYwPJABbqiLvQS8z1w3HbT6Z8dN0FsYJAbTUU5nApTcBwnBqtazQhtwV3xnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726253814; c=relaxed/relaxed;
	bh=ygGDtpGrnyqT7W+e4njooPyFJviraHd4ldflZlh/2/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVa4wJxa6Yif7WpotzTEe/BuMn3scC0wM/jbq0MPWRDqg6qm63737jyIHIOH3g0OEgYON8ZaA0jYmYlMTgjQtXOjpAKu3fAKp5Q3mENejR4WQSQN4GHePFsHwDpjgUxvLrBHuKfUn1AvM2VFFzSbSEB4ZxmsGydqzSbmMow1v7B3bA2Uk7jNEUi8RYClvA/dXAZ8s0aoMXPGQ6jwxfPCiRbVhfkpAfG1hspyh0zix/jRltI8/Q8m6kB9PH/11/joytzAKsoOKsrectJ4Sl09sUsfLfnafMSdtWIRCa8LdgHmuJtRcTR7AVL+Sr6cV4RsKqWwQYa9GS7NasjqEKa4Wg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tP2RrfKm; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tP2RrfKm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X53Sk2TPKz2yVX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 04:56:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 873FBA457DA
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 18:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE066C4CEC0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 18:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726253811;
	bh=MU66eme10gPD/yu7J7iVTKruJuuQlBaObSGd/wyBjwY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tP2RrfKm38M+eDc/N+4qcNYEXZlVuE+4IfSo09o2ypl4jBgRwKIWOrXZ5/Ayg0zCc
	 wlGnGz7SytGX5VhVB8rbNkXv3k62JU5ZvRzNnup/wzvsadSwbiPeo8wh6aJiqqoSFi
	 ulTdTUVP/xkvcpThlVfzpTT5/xOsbX/ktWEBMW8rBeStJDCo1lyoAOsUy+zENNqQ0y
	 0NtNqkHMMOfwG/pLnLijEH7wa16QHxO99tyiXp4uka3bNxRy6dru1kagwIdJGtjLGv
	 OEQjO297g/YEZ4ZmS0bqfz4l90+2MtdKxYcw5TgHJ8OHLkPsMHwe/kTPjIh+wqytzq
	 asxj5BAZjl0SQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365c060f47so3051234e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 11:56:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPT2BiumHxUYy0r3BGIa/cYjp8HeS00TLNyiZ4DdzPwSQcOJQA5SfbrLcgQ81ERvJOxtjGCzjHTLmu+aE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz0o5Symz3DR14gM9jpRqJyIegg0Q7BGfF0mGg0YuCdsiXXzgbf
	WuQoVnvcez1Y4LYoVRIdaGSqqv85WPOdWXVOzE9Tmbsb3IQEBox/7mt9/HzRY3r4cME7W8G6lSq
	Acg+lIklkdroGYWVGR+zX+knsTw==
X-Google-Smtp-Source: AGHT+IHRy1/QFoSwP2uJlUhM1zAHn9fqI4LVW/q56a9TRgmWkrLrojWdNvdph9QPZS3lJh4up/5q7OADDbF9pJ4gEcc=
X-Received: by 2002:a05:6512:1196:b0:536:55ae:7458 with SMTP id
 2adb3069b0e04-53678fed155mr5253297e87.40.1726253810268; Fri, 13 Sep 2024
 11:56:50 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240906-of-address-overflow-v1-1-19567aaa61da@linutronix.de> <87plp7r8ye.fsf@mail.lhotse>
In-Reply-To: <87plp7r8ye.fsf@mail.lhotse>
From: Rob Herring <robh@kernel.org>
Date: Fri, 13 Sep 2024 13:56:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLYQyue9WyYiQPaM1D8Hxve-a4RXCaDRvyeF2VWWx=Ozg@mail.gmail.com>
Message-ID: <CAL_JsqLYQyue9WyYiQPaM1D8Hxve-a4RXCaDRvyeF2VWWx=Ozg@mail.gmail.com>
Subject: Re: [PATCH] of: address: Unify resource bounds overflow checking
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 8:15=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de> writes:
> > The members "start" and "end" of struct resource are of type
> > "resource_size_t" which can be 32bit wide.
> > Values read from OF however are always 64bit wide.
> >
> > Refactor the diff overflow checks into a helper function.
> > Also extend the checks to validate each calculation step.
> >
> > Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> > ---
> >  drivers/of/address.c | 45 ++++++++++++++++++++++++++------------------=
-
> >  1 file changed, 26 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > index 7e59283a4472..df854bb427ce 100644
> > --- a/drivers/of/address.c
> > +++ b/drivers/of/address.c
> > @@ -198,6 +198,25 @@ static u64 of_bus_pci_map(__be32 *addr, const __be=
32 *range, int na, int ns,
> >
> >  #endif /* CONFIG_PCI */
> >
> > +static int __of_address_resource_bounds(struct resource *r, u64 start,=
 u64 size)
> > +{
> > +     u64 end =3D start;
> > +
> > +     if (overflows_type(start, r->start))
> > +             return -EOVERFLOW;
> > +     if (size =3D=3D 0)
> > +             return -EOVERFLOW;
> > +     if (check_add_overflow(end, size - 1, &end))
> > +             return -EOVERFLOW;
> > +     if (overflows_type(end, r->end))
> > +             return -EOVERFLOW;
>
> This breaks PCI on powerpc qemu. Part of the PCI probe reads a resource
> that's zero sized, which used to succeed but now fails due to the size
> check above.
>
> The diff below fixes it for me.

I fixed it up with your change.


> It leaves r.end =3D=3D r.start, which is fine in my case, because the cod=
e
> only uses r.start.
>
> And it seems more sane than the old code which would return
> end =3D start - 1, for zero sized resources.
>
> cheers
>
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index df854bb427ce..a001e789a6c4 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -204,9 +204,7 @@ static int __of_address_resource_bounds(struct resour=
ce *r, u64 start, u64 size)
>
>         if (overflows_type(start, r->start))
>                 return -EOVERFLOW;
> -       if (size =3D=3D 0)
> -               return -EOVERFLOW;
> -       if (check_add_overflow(end, size - 1, &end))
> +       if (size > 0 && check_add_overflow(end, size - 1, &end))
>                 return -EOVERFLOW;
>         if (overflows_type(end, r->end))
>                 return -EOVERFLOW;
>

