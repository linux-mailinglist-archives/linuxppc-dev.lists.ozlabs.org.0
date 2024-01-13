Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC89A82C871
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jan 2024 01:39:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nhGHvUH1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TBfg76LkWz30g2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jan 2024 11:39:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nhGHvUH1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com; envelope-from=nphamcs@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TBffG2Mw1z2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jan 2024 11:38:44 +1100 (AEDT)
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-7bed9fb159fso139485939f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jan 2024 16:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705106322; x=1705711122; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8+5Wu3yFVyh8RZpVSuMO/tabpv/LOlHIY8VjuUoGF4=;
        b=nhGHvUH1drbpcHZ19yad4eqQ50ifdA0ZzgWm8OMNYDyZrZoWyH9xfVq/oFKAm8KUaV
         7X7sQajki32TjJsDCYesOsPyis13ND3T4P4QXX1s7D1GHdmJIU4t+rT8vMnpAPeb+yrl
         FjBmeCA7UcoKHuMRvSAVEsZeN4pA12WapL6yoCCKnMr2ZtWVoXdKmjHM0XDJ+oQPR0Xd
         HItYxD2dpA5qEMs1OPhlsQm7MxJ+fK3VRVSJXyfwh0Kjjkzm4GS7KqmYf1CC+i6Qe8KI
         0xUacJsQEoIs35dCuY/PexT4Mby0hfAU2iILr19xOF67XLv7sAZYl3tM6e77kBRxJWn1
         SEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705106322; x=1705711122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8+5Wu3yFVyh8RZpVSuMO/tabpv/LOlHIY8VjuUoGF4=;
        b=Qrm+4gtpZjBlNKIQScePRBlZDhT3aKY1ksnkplpbWMUAbix1w1vQ7R1MXDSllZnf4p
         zCaGYZxUMfmSCJve53mbYyaza96chNgjxPPobnGCaRETA2P9eugWWWtNOBRIljqthrq1
         nwkOYVTIf86D93cEybqE6TVDGCMhcdTKLV45pQt++MC2NP06pXQvnRS+GUrYyISmGzxh
         7iD5XkSZeJ+leIFg7XpNRhaUBXwWj0g3XezF6bmyT5sJnr9NRURe/DEBZTTniWJ0GSg8
         GYMfSvC3bwK/MCnmgGEXgQckUVZ9EysTc+71IpicbjGosVpBqYVEX4gfO80Aafr/YBfD
         I7fg==
X-Gm-Message-State: AOJu0YyHX+ojT2zkFWP15ntv7UFnTN6tDC5wHNAJydTozGkq4s0bzQtx
	er+NZerfpcNmCD1c+3fHCs9h3QP6R9QV3T8Oo3k=
X-Google-Smtp-Source: AGHT+IGPLvyZ3kdlus0znWz/e0967hWAWD55LSsq42/n5tdRk22r3nVsQZbJiOxY4+nTTgUC6BDEaomdDCNfHWM/QSc=
X-Received: by 2002:a5e:8c05:0:b0:7bf:31bc:66b2 with SMTP id
 n5-20020a5e8c05000000b007bf31bc66b2mr87040ioj.6.1705106321993; Fri, 12 Jan
 2024 16:38:41 -0800 (PST)
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com> <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
In-Reply-To: <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 12 Jan 2024 16:38:30 -0800
Message-ID: <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com>
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

On Fri, Jan 12, 2024 at 3:37=E2=80=AFPM Yosry Ahmed <yosryahmed@google.com>=
 wrote:
>
> On Fri, Jan 12, 2024 at 11:42=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wr=
ote:
> >
> > On Fri, Jan 12, 2024 at 11:31=E2=80=AFAM Yosry Ahmed <yosryahmed@google=
.com> wrote:
> > >
> > > The z3fold compressed pages allocator is not widely used, most users =
use
> > > zsmalloc. The only disadvantage of zsmalloc in comparison is the
> > > dependency on MMU, and zbud is a more common option for !MMU as it wa=
s
> > > the default zswap allocator for a long time.
> >
> > Johannes and I were chatting about this the other day. We might be
> > able to disable certain zsmalloc behavior in the case of !MMU, making
> > it available there too. Once that's happened, we can outright remove
> > z3fold and zbud, and have one allocator to rule them all? :)
>
> (Adding Sergey and Minchan for visibility)
>
> I didn't want to bring up the zsmalloc MMU dependency in this thread
> to reduce noise, but that's also what I had in mind. Sergey and I were
> also chatting about this the other day :)
>
> I thought deprecating z3fold is the low hanging fruit. Then, once we
> can sort out the MMU dependency in zsmalloc, we can go after zbud as
> well.

Makes sense to me. Should we do the same thing to zbud? We probably
have even less of a case for it, no?
