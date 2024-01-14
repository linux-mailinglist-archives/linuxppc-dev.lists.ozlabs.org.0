Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F071382D295
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 00:15:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3GsmFle3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TCrjP6Kvfz3c2K
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 10:15:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=3GsmFle3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TCrhZ1w5vz2xWR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jan 2024 10:14:53 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a277339dcf4so904294066b.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jan 2024 15:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705274088; x=1705878888; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k76bVz3l5qhz2PG/FN1fCGCB8QPQrnTnxXAo7lmPrQ=;
        b=3GsmFle3trMkRF0rRf5JowTTe3adh0q7qTS/8kbwKe4vk/uU0zdO/0cyj6UrB9rFX3
         Raj8263WMZA8rO+3XzGPo+Ae+u0RRfC4UsilTopZN6QJXBs4gxlCFUIwjMpOzoaFJirt
         lEwAn/Tw4If9AQExUqik5KzSATi7NHzfAWawuPIb0z/8cdQYh3HP1tfnMwem7BbfQGgx
         DBDUkZPclMTWqP+DdreRZfQQ0nf1H0Uplr9NBGNRuPDR0JidRUvHs+D2ibntKxpq6CkT
         W2r1qHHXuej8b0xriIXE9YPIgquoL+YL6TIpHxEhrIPBQWj/cO7N3RvYfHC8PO0oWzeD
         hLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705274088; x=1705878888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6k76bVz3l5qhz2PG/FN1fCGCB8QPQrnTnxXAo7lmPrQ=;
        b=no+VnLKADEfBKcpPYzM+U6T4vl9AoA4cFxeLhNoB9vldOlKjaRidMyB5Xpnhv5A7u8
         wlqtJ8vQlwFVNHiLGzN5pExdnUW7XbPjQp5/FBFrRF0sEI4UPcl1FXi0loPDuq5Ow/ss
         qIq2/r/rpIUUFzsMJ8TPYvr2CxCywcUNX06LsmyU1MdQLEnM361swI7qYtIO3IICW5pL
         pnxOwmuOeUt1YDIz20t/0swaopn7zQW5nSA+c0yAqY9UINL/SQWHIX3F+vxkToQsNG0N
         2jaEBsThNbjicgDXr7qWPMZwmEFd6AuZZEEHFE9uR+2rz02uKYOMgBiQIKdH76NZdyvS
         hJBQ==
X-Gm-Message-State: AOJu0YwgncP3LIGBDmABVhLK8UU320WFC9HSicTHs855LGaJdqTfOEw+
	B0Bs31e0isS5CFbYZFZ3amK69+7FRuxM21yUPB17Y5tOiHa5
X-Google-Smtp-Source: AGHT+IGmzBUdoziLE2Tv88J9U2uChvlAVAX8Vas/pQSY8zMLgWkqGHOPaM3jX3KpJU3blLIwZXnH5YlhC/wo0MwjzgQ=
X-Received: by 2002:a17:906:da8d:b0:a28:fab0:a88c with SMTP id
 xh13-20020a170906da8d00b00a28fab0a88cmr2519935ejb.78.1705274087622; Sun, 14
 Jan 2024 15:14:47 -0800 (PST)
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
 <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
 <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com>
 <CAJD7tkaW9TuMjrVn1OivyKE-E0-WVs7u_iAkAQVXxOnnzaJF1A@mail.gmail.com> <CAKEwX=O7nYs_syDbMO34K=tqDw8aX51mnZVj4tCLO_N6h-u_pg@mail.gmail.com>
In-Reply-To: <CAKEwX=O7nYs_syDbMO34K=tqDw8aX51mnZVj4tCLO_N6h-u_pg@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Sun, 14 Jan 2024 15:14:09 -0800
Message-ID: <CAJD7tkZt_cX=wm9Sp7MuLBxYQ=Hvidz3p9bA1gKhHN+wVVCiOA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Nhat Pham <nphamcs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Huacai Chen <chenhuacai@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, WANG Xuerui <kernel@xen0n.name>, Vitaly Wool <vitaly.wool@konsulko.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 14, 2024 at 2:42=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Sun, Jan 14, 2024 at 10:49=E2=80=AFAM Yosry Ahmed <yosryahmed@google.c=
om> wrote:
> >
> > On Fri, Jan 12, 2024 at 4:38=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> w=
rote:
> > >
> > > On Fri, Jan 12, 2024 at 3:37=E2=80=AFPM Yosry Ahmed <yosryahmed@googl=
e.com> wrote:
> > > >
> > > > On Fri, Jan 12, 2024 at 11:42=E2=80=AFAM Nhat Pham <nphamcs@gmail.c=
om> wrote:
> > > > >
> > > > > On Fri, Jan 12, 2024 at 11:31=E2=80=AFAM Yosry Ahmed <yosryahmed@=
google.com> wrote:
> > > > > >
> > > > > > The z3fold compressed pages allocator is not widely used, most =
users use
> > > > > > zsmalloc. The only disadvantage of zsmalloc in comparison is th=
e
> > > > > > dependency on MMU, and zbud is a more common option for !MMU as=
 it was
> > > > > > the default zswap allocator for a long time.
> > > > >
> > > > > Johannes and I were chatting about this the other day. We might b=
e
> > > > > able to disable certain zsmalloc behavior in the case of !MMU, ma=
king
> > > > > it available there too. Once that's happened, we can outright rem=
ove
> > > > > z3fold and zbud, and have one allocator to rule them all? :)
> > > >
> > > > (Adding Sergey and Minchan for visibility)
> > > >
> > > > I didn't want to bring up the zsmalloc MMU dependency in this threa=
d
> > > > to reduce noise, but that's also what I had in mind. Sergey and I w=
ere
> > > > also chatting about this the other day :)
> > > >
> > > > I thought deprecating z3fold is the low hanging fruit. Then, once w=
e
> > > > can sort out the MMU dependency in zsmalloc, we can go after zbud a=
s
> > > > well.
> > >
> > > Makes sense to me. Should we do the same thing to zbud? We probably
> > > have even less of a case for it, no?
> >
> > Do you mean declare it as deprecated now? I initially thought that
> > would only be appropriate to do after zsmalloc has no dependency on
> > MMU, so that we can confidently say zbud has no practical use case.
>
> Ah, I misread your email. My bad. Personally, I'd like to declare both
> (zbud and z3fold) as deprecated. That said, no strong feelings here -
> as long as (eventually) we move towards retiring both of them. So my
> original ACK still holds.
>
> Not entirely sure which should we remove first between zbud and z3fold
> though. I was under the assumption that z3fold is slightly better, but
> that could be my bias for shiny new things showing :)

My rationale is that zbud was the default zswap allocator for a long
time, so it's the one we should keep for now as it is more likely to
have users. That said, I don't know of any users of either zbud or
z3fold, and I am fine starting with deprecating either.
