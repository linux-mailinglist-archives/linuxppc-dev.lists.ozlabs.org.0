Return-Path: <linuxppc-dev+bounces-1601-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF079869DC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 01:42:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDYF40znMz2yL5;
	Thu, 26 Sep 2024 09:42:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::535"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727307768;
	cv=none; b=daOI/N6AeX5efrARNNAb0ApVqB/yr73KURflWNuAWt3sDLbQ/DbF1CIN4Raa/y9ow8N1te19jlwbvPiKLC3GuSZtOrKzAwXaJnFnp184xQLzYRX1cFKGiiLZbrofzoE0VWYnBNIq6KWuubyeaf8KK/965+9Yax9qwalNTDV4hU7VZ3nllBw4Gu6ZC2ZbtpQ/0bHmNer3ZonbcljYpBMEh9PTITz8at9lSs+AT/f1thGfY24Gy4PCMH8H8SDYDr3HtYgc6Sl1wNSagt0q468sA0/LquRdj6MP1ANWSpGxs0MePWTKyXVo1f6lTdf/WMpl+Dp5MlPI9YZnLCBt3GVaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727307768; c=relaxed/relaxed;
	bh=Ek54duFW07igKvK9AQGJRlqEiTdehADtLtBpPhw2agE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e07Jw4eP1Xv9JXo6oTNn1oL4pVSpHicwOJVoJ7D6X9v3fN92+pSLont/va+TSoCzwRftN4AxoGcHRUDhbrTYXPH6GRI3nx/1ydJkwgLlB4oQz/0BFv0e8itdf+CQcvJCoEugKwso0b0mEHB4AwawOVvEBAsjqOGRRficr4v7vUECARLe0vGlyuujbFbFWsBIFb/YXpwbVW+Z81A584NrrmWo78kZjUJoGUOBdriLfQYvbWMeHb23TSHh8BC6Ca0CmMSBBm6UTdBAnvXPIaEpQUaPRwYOCi+3Vq1hZnRGT2XRDIdhLC594oxV2FdJLKiSFQxShae3jIyjT+gjdNnXAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yUdTGbYd; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=yUdTGbYd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=mmaurer@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDYF35ZQ6z2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 09:42:47 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5c247dd0899so5403a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 16:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727307762; x=1727912562; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek54duFW07igKvK9AQGJRlqEiTdehADtLtBpPhw2agE=;
        b=yUdTGbYdRDAOgVX7GHTMn8WBB5PTgxJYyiC7bKgWow7ClEWqqhO4R0yhF1mM7/+6bC
         cJPrm5Oo8iXQCZsIhitHTvFln3ZuiKWYxm790BYi9rcTWPbKMs8CNvJUJF5lH1PmYAx8
         ep3+1AdiTZmV23O+sZonOEp/fD3K89D63UkJLhOM3L3hSTkgRXPNK18FozYmgxIJLoN4
         /QtTM1Y9xtcomYiDmUckQ1MwW4i0rx0SxpNAN7WgKRJo7KfWn5LoKBIyW/IR1KVVBajr
         LkWn5yMKhFsqh7QkpsJyWOgkJ34/JEMYl6ovPtvZkOyqwFzQzwz304Fe963R+glgIrwi
         fXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727307762; x=1727912562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ek54duFW07igKvK9AQGJRlqEiTdehADtLtBpPhw2agE=;
        b=Bh0+eEdWHLRN3+AIidYdQp7GRHwcOApbtU7X/v4qqklScinE5V7WtzO7OVzbqj2D0L
         mz61xK+1KmlOxJLTwyuLYOEeL9kPYy7pJ8Pd+PihEmw0+04vc3tcgo7H3/7bQ2ukmi61
         8HYxXjAeskbxPGKVzV2rFwxUd0Hd5QimUUM33XlOBxVRljOwkDbcygNFiSCvzBx/U5UL
         O1HGiyQruvpWb+Lr9z4YH5LnqPdGGFHmi61Ywlui0ODwyv8tgKIDbCzcagzD5wqHePSr
         OH2lvfNbGHU9e4+rj9nj5kSO9CDGsv5vpLyEVDjp5chACCH10MFpA901rGs3XTQN6OCg
         ZKMw==
X-Forwarded-Encrypted: i=1; AJvYcCWni81jlJ2YBkkw4pF84DK9Y11FEIoEDbdhqj/xjLj13GHnwQpI4eL95p4dFvy8WbFN9vIaJBiRCd2t/T4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxWdkuqwf/U1kxWCoL9k+FNGi//9nE+d9IOQMrrmna+6XWWYyuw
	bNGQreMPnQUzhfKNCievVbL613tlj2b8jQW4d4hMyWptVyceuSqp/2XleMmuY68vKCPF27qgY+j
	aLzYXdz2AeBXOg9BFxy4uwJg2env4MvYY+bQR
X-Google-Smtp-Source: AGHT+IEQLkFnBxCVmc+hBCfJCN9xgnB4wVQcVoqAWlHhf+GqjN1sdjtOkK/z88OGPV3GGtu/6kc0Wj3d2hT0sVNu66g=
X-Received: by 2002:a05:6402:524d:b0:5c2:5251:ba5c with SMTP id
 4fb4d7f45d1cf-5c8783c7d8fmr251259a12.0.1727307761901; Wed, 25 Sep 2024
 16:42:41 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com> <20240924212024.540574-15-mmaurer@google.com>
 <20240925230000.GA3176650@google.com>
In-Reply-To: <20240925230000.GA3176650@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 25 Sep 2024 16:42:30 -0700
Message-ID: <CAGSQo00OqOJ+s3xULXvojXMSCR8y-TQOHAwWqpS2VDxWaDxxQA@mail.gmail.com>
Subject: Re: [PATCH v4 14/16] modules: Support extended MODVERSIONS info
To: Sami Tolvanen <samitolvanen@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, 
	Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the catch. I've sent up v5 to include that fix. I've also
added a changelog and made sure the patches make it to linux-modules@
as Daniel suggested.


On Wed, Sep 25, 2024 at 4:00=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Hi Matt,
>
> On Tue, Sep 24, 2024 at 09:19:56PM +0000, Matthew Maurer wrote:
> > +static void dedotify_ext_version_names(char *str_seq, unsigned long si=
ze)
> > +{
> > +     unsigned long out =3D 0;
> > +     unsigned long in;
> > +     char last =3D '\0';
> > +
> > +     for (in =3D 0; in < size; in++) {
> > +             if (last =3D=3D '\0')
> > +                     /* Skip one leading dot */
> > +                     if (str_seq[in] =3D=3D '.')
> > +                             in++;
>
> Thanks for addressing Michael's comment, this looks correct to me.
>
> Nit: might be cleaner in a single if statement though:
>
>         /* Skip one leading dot */
>         if (last =3D=3D '\0' && str_seq[in] =3D=3D '.')
>                 in++;
>
> > +void modversion_ext_start(const struct load_info *info,
> > +                       struct modversion_info_ext *start)
> > +{
> > +     unsigned int crc_idx =3D info->index.vers_ext_crc;
> > +     unsigned int name_idx =3D info->index.vers_ext_name;
> > +     Elf_Shdr *sechdrs =3D info->sechdrs;
> > +
> > +     /*
> > +      * Both of these fields are needed for this to be useful
> > +      * Any future fields should be initialized to NULL if absent.
> > +      */
> > +     if ((crc_idx =3D=3D 0) || (name_idx =3D=3D 0))
> > +             start->remaining =3D 0;
> > +
> > +     start->crc =3D (const s32 *)sechdrs[crc_idx].sh_addr;
> > +     start->name =3D (const char *)sechdrs[name_idx].sh_addr;
> > +     start->remaining =3D sechdrs[crc_idx].sh_size / sizeof(*start->cr=
c);
> > +}
>
> This looks unchanged from v3, so I think my comment from there
> still applies:
>
> https://lore.kernel.org/lkml/CABCJKufJK0WO92wnW09VTLqZk0ODxhuKQG=3DHbKE-v=
a0urJU1Vg@mail.gmail.com/
>
> Sami

