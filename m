Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A3782D23C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jan 2024 23:43:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=foEpoX1N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TCr0L0RBLz30XZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 09:43:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=foEpoX1N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com; envelope-from=nphamcs@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TCqzM4z23z2xgw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jan 2024 09:42:37 +1100 (AEDT)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-36071f2181cso29160165ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jan 2024 14:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705272151; x=1705876951; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoLJM1YCWGjUlR9N5C5AV+mH39ndl7FYD4RDzU57JFY=;
        b=foEpoX1NWC9iuOuYZdCziG+DkvzE53gonGRROTu9uk2NJL33zJpBcrqXfLdfdWQzXp
         /r3sF0U1WCNdHkVDpRMBDrCrvBn8aH9cGrQUJ8TjKwVfFsZTAII0ghAxfm7yUCTz1OvQ
         sr6zf2nSZmlIm23xoYx/f7whvbn7IkfQB/tvlBwT3EPUtE5/lerhbDM5RxOZPVgkUDB2
         rltJhS8WDXbbGTxqdwhRqbwT2ZakDnxV8mWRDff3YY6kcOXeH4ICQqOaYg7s5Ou+fgeO
         LVeZEWRiyxV2k+G9j9DaOvWuIub3HxfRBF2BbIYPWC0Q4JLqMKzch88x8QHo2IFUkcLL
         7+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705272151; x=1705876951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoLJM1YCWGjUlR9N5C5AV+mH39ndl7FYD4RDzU57JFY=;
        b=Nb9GRTEK0JeQSS2HIU5Y3v+rANrhI4G19zGcUydUvpZXoqGeUEHy40cElKqr7+v4/V
         k0mpPeNfvtoeLHP+W7ag3B/CsKUZjClb0DrtZ9nE+Z23TRaLD1Zut9BZRpPJmnpXleGo
         9txdNtM+Hjz01R878sjs1/Z8unFoCVCrxrTiIN6R2+LtHRNsiIJrFk6XVJdtTTnBqAct
         Z2Eje4ogFkkE+pMpRnei5ykz9+Fz43L1bsM3ygiKbRLS7t/W8HRaEEyhfIEbQQBkQ20E
         LMMD6GTOZ0PzZjEKsJ9ciQLevvdBNBUYsLGAQVNmtcBAJ5NbmwtuPhp3F9xcGw2rY0yN
         fGOw==
X-Gm-Message-State: AOJu0Yy2xaa3W6FX2VbK9BB8mco2/8yipitCS4EK1TrlWhzuNM9PBd3h
	JD1tkG46XJOMUEcWHNh0FUSjxzZ0qNNED+qbDTM=
X-Google-Smtp-Source: AGHT+IFc4YnzZDRRq3UdDjmWjnvvkoOaNnHCSsjrca54VMY2DX6cokwWeZGlhFAWBtidREnmbk5yja+calb/V2yb6xI=
X-Received: by 2002:a05:6e02:188a:b0:360:7244:6089 with SMTP id
 o10-20020a056e02188a00b0036072446089mr7334277ilu.43.1705272151280; Sun, 14
 Jan 2024 14:42:31 -0800 (PST)
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
 <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
 <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com> <CAJD7tkaW9TuMjrVn1OivyKE-E0-WVs7u_iAkAQVXxOnnzaJF1A@mail.gmail.com>
In-Reply-To: <CAJD7tkaW9TuMjrVn1OivyKE-E0-WVs7u_iAkAQVXxOnnzaJF1A@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Sun, 14 Jan 2024 14:42:20 -0800
Message-ID: <CAKEwX=O7nYs_syDbMO34K=tqDw8aX51mnZVj4tCLO_N6h-u_pg@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Yosry Ahmed <yosryahmed@google.com>
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

On Sun, Jan 14, 2024 at 10:49=E2=80=AFAM Yosry Ahmed <yosryahmed@google.com=
> wrote:
>
> On Fri, Jan 12, 2024 at 4:38=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > On Fri, Jan 12, 2024 at 3:37=E2=80=AFPM Yosry Ahmed <yosryahmed@google.=
com> wrote:
> > >
> > > On Fri, Jan 12, 2024 at 11:42=E2=80=AFAM Nhat Pham <nphamcs@gmail.com=
> wrote:
> > > >
> > > > On Fri, Jan 12, 2024 at 11:31=E2=80=AFAM Yosry Ahmed <yosryahmed@go=
ogle.com> wrote:
> > > > >
> > > > > The z3fold compressed pages allocator is not widely used, most us=
ers use
> > > > > zsmalloc. The only disadvantage of zsmalloc in comparison is the
> > > > > dependency on MMU, and zbud is a more common option for !MMU as i=
t was
> > > > > the default zswap allocator for a long time.
> > > >
> > > > Johannes and I were chatting about this the other day. We might be
> > > > able to disable certain zsmalloc behavior in the case of !MMU, maki=
ng
> > > > it available there too. Once that's happened, we can outright remov=
e
> > > > z3fold and zbud, and have one allocator to rule them all? :)
> > >
> > > (Adding Sergey and Minchan for visibility)
> > >
> > > I didn't want to bring up the zsmalloc MMU dependency in this thread
> > > to reduce noise, but that's also what I had in mind. Sergey and I wer=
e
> > > also chatting about this the other day :)
> > >
> > > I thought deprecating z3fold is the low hanging fruit. Then, once we
> > > can sort out the MMU dependency in zsmalloc, we can go after zbud as
> > > well.
> >
> > Makes sense to me. Should we do the same thing to zbud? We probably
> > have even less of a case for it, no?
>
> Do you mean declare it as deprecated now? I initially thought that
> would only be appropriate to do after zsmalloc has no dependency on
> MMU, so that we can confidently say zbud has no practical use case.

Ah, I misread your email. My bad. Personally, I'd like to declare both
(zbud and z3fold) as deprecated. That said, no strong feelings here -
as long as (eventually) we move towards retiring both of them. So my
original ACK still holds.

Not entirely sure which should we remove first between zbud and z3fold
though. I was under the assumption that z3fold is slightly better, but
that could be my bias for shiny new things showing :)
