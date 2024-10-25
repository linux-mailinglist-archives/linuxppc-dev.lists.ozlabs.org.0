Return-Path: <linuxppc-dev+bounces-2606-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 453B89B0F10
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 21:32:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZtGh0rqCz2yLV;
	Sat, 26 Oct 2024 06:32:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729884764;
	cv=none; b=RXvw9q5UCIgwlX8ThpOKZ93/KNkJi+FBVOb3nzvaKU3NEj5f4SIWZStF6C7zsiH703+lTDFG+Cs7bx6zuggXZ7tfPMqGWRx1okvxg8IdQIEtQnXpU3N2f0Eelb6IO2vsTcK6M5o5RAE/ZO9zHQowQaFzNwvvB0S5X+k6Me1T70Ap+T31vDWcDCPmeU8bB6nVlKj6EN6x+w3TJ386Hy62K+rn3lsDexraxDvAvtxf1tlwDR7kH9Yq3j9mfXHKzntiHBEIX+snyfs2UTM+MMxf9liXGFZPQjWW6TXYLRWOnxw8wcxfYvviby++Eel52VxBm/DK+hBH2odPyyPQMb8Vyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729884764; c=relaxed/relaxed;
	bh=+OGTc1IGelQzRo6VF+xJwWEt+U6+tTV8KOTqMA95NRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSTHA/hjB7aX1+X49DCG+tgrs+TRpbJhIwXHm5EoVc+IpuQO8pj59PuNgg7BWPY7PnDS4WhPQAfUsD/YrHqpnc0xj3Bg0s5OceLLEpW6f9TMtEmbSTaQOgqhQHq8noIlA1rtmNcqRaex5CiNn2et2dwVbZauw5YTFQM+RHhTuNJs7G2VhhMxgzdqSy7MRjNjO86/0FD+QgQnPMCM8Ip5cfpDZ2if3ljOuehX0+N4OaWfnr95QHKCYp7w6coWdcgVQKri8PANeAJ+Mhk2hQY/2vga620MjgZcR1fgQ6dAOyJ3OBbsm8iEVNRJeYTyEDWnXdRUwqz/nYvpl2ndwN/xrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HCAwq6iL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HCAwq6iL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZtGf1J8xz2xGC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 06:32:41 +1100 (AEDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6e7e1232648so24068957b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 12:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729884758; x=1730489558; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OGTc1IGelQzRo6VF+xJwWEt+U6+tTV8KOTqMA95NRQ=;
        b=HCAwq6iLxLLPGEFNiCjltoKgsgGtVajz1eddyMSil7GYldBqnkM/BX4ClIZ17AYtRv
         kDq4WpKmdm9DFeiMWK1sjVkvWviNf8S8jiT+ypECZUlUzFY4JoEUhMR6HIukKVEUY5l7
         TSVPazuwPF/jFuybHfkEFJUNUaGj01r+MgS4YVcmMpSCxIdyHuFO4O9Ahp6mEj5HOOp5
         283Q8ZCyqdl22gNfGVVp2jsuhPt9UJIyCkWEGy/QWuNZeUQbZBvmT9bkFli95WW2kJhT
         8JW0Kz227VxMdPeuAEvqhdczLsEKtd1lnbQyylM7eg/0kZgHNUVfAynEiWGwhGbwxtSJ
         v1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729884758; x=1730489558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OGTc1IGelQzRo6VF+xJwWEt+U6+tTV8KOTqMA95NRQ=;
        b=O3P4C1e0ucTL9gYBIOvlWg2p7N+ncYdllME1Odu8yxGBH4P1aacjGwhoiHNXhUYG6h
         OZAeAhrEVD6TRw5T4ELdK0BXaUvdPVVCh2i5DPdAu8F3XzRJM4muwYqHZUzIwow9+Xuh
         TBPPGagYDUZBcLDYyQyJDm9i97HcjQXHCeIb4rfMWNgVbeBu85gzTVJfq29tFyzNcg1H
         pKWcR5fdRlSPFAmQXDHLuzs/3bQbfK/erS1jYtlkbc04DZb8lRZXHk3RONn1NOMelnt7
         l9lzsWwroQKasmy167/+Ujko4Jz/FeU4d1gdluJl46BdR56/EfNLqYS3VsqXNAGF0eJx
         otgg==
X-Forwarded-Encrypted: i=1; AJvYcCXdXv8BTFxzjzlZNm0EsrG3V8JkhRay5BDT/TGnAxbWCGNMYoQy78bdx0MaLNEJT2I2m29ZB8N/4Byw52Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwkrIHEeJKL+3vU5q2l4IxihgWxkSn12SJM8UeULM/BvPhOkT8F
	VnqPEY7imMQzV/tp9U+VkouWRq/niLO1bjS5LkwQTE9GsHOWM0Laaik7g8w3f3Js4JgvHS5b04R
	Qwc9k5X9/ZVBsC/fipu7/TylYawk=
X-Google-Smtp-Source: AGHT+IEWqdzDAn21/R+IgfqiZgRRkeQqv49phY3X9Pmz4EABFQegbOOIeDadzmC/8Cxmk1V/kug1B0w3dmfkJldOmUE=
X-Received: by 2002:a05:690c:2a8e:b0:6e6:1018:64c7 with SMTP id
 00721157ae682-6e9d8b8dbadmr6557887b3.41.1729884758060; Fri, 25 Oct 2024
 12:32:38 -0700 (PDT)
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
References: <20241024205257.574836-1-rosenp@gmail.com> <20241025125704.GT1202098@kernel.org>
In-Reply-To: <20241025125704.GT1202098@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 25 Oct 2024 12:32:27 -0700
Message-ID: <CAKxU2N98hnVAE9WF72HhxzVEfhnRAgMykVgBErL9b3gupqqrxQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: freescale: use ethtool string helpers
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:FREESCALE QUICC ENGINE UCC ETHERNET DRIVER" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 25, 2024 at 5:57=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> On Thu, Oct 24, 2024 at 01:52:57PM -0700, Rosen Penev wrote:
> > The latter is the preferred way to copy ethtool strings.
> >
> > Avoids manually incrementing the pointer. Cleans up the code quite well=
.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> ...
>
> > diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c b/drive=
rs/net/ethernet/freescale/dpaa/dpaa_ethtool.c
> > index b0060cf96090..10c5fa4d23d2 100644
> > --- a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
> > +++ b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
> > @@ -243,38 +243,24 @@ static void dpaa_get_ethtool_stats(struct net_dev=
ice *net_dev,
> >  static void dpaa_get_strings(struct net_device *net_dev, u32 stringset=
,
> >                            u8 *data)
> >  {
> > -     unsigned int i, j, num_cpus, size;
> > -     char string_cpu[ETH_GSTRING_LEN];
> > -     u8 *strings;
> > +     unsigned int i, j, num_cpus;
> >
> > -     memset(string_cpu, 0, sizeof(string_cpu));
> > -     strings   =3D data;
> > -     num_cpus  =3D num_online_cpus();
> > -     size      =3D DPAA_STATS_GLOBAL_LEN * ETH_GSTRING_LEN;
> > +     num_cpus =3D num_online_cpus();
> >
> >       for (i =3D 0; i < DPAA_STATS_PERCPU_LEN; i++) {
> > -             for (j =3D 0; j < num_cpus; j++) {
> > -                     snprintf(string_cpu, ETH_GSTRING_LEN, "%s [CPU %d=
]",
> > -                              dpaa_stats_percpu[i], j);
> > -                     memcpy(strings, string_cpu, ETH_GSTRING_LEN);
> > -                     strings +=3D ETH_GSTRING_LEN;
> > -             }
> > -             snprintf(string_cpu, ETH_GSTRING_LEN, "%s [TOTAL]",
> > -                      dpaa_stats_percpu[i]);
> > -             memcpy(strings, string_cpu, ETH_GSTRING_LEN);
> > -             strings +=3D ETH_GSTRING_LEN;
> > -     }
> > -     for (j =3D 0; j < num_cpus; j++) {
> > -             snprintf(string_cpu, ETH_GSTRING_LEN,
> > -                      "bpool [CPU %d]", j);
> > -             memcpy(strings, string_cpu, ETH_GSTRING_LEN);
> > -             strings +=3D ETH_GSTRING_LEN;
> > +             for (j =3D 0; j < num_cpus; j++)
> > +                     ethtool_sprintf(&data, "%s [CPU %d]",
> > +                                     dpaa_stats_percpu[i], j);
> > +
> > +             ethtool_sprintf(&data, "%s [TOTAL]", dpaa_stats_percpu[i]=
);
> >       }
> > -     snprintf(string_cpu, ETH_GSTRING_LEN, "bpool [TOTAL]");
> > -     memcpy(strings, string_cpu, ETH_GSTRING_LEN);
> > -     strings +=3D ETH_GSTRING_LEN;
> > +     for (i =3D 0; j < num_cpus; i++)
>
> Perhaps this should consistently use i, rather than i and j:
>
>         for (i =3D 0; i < num_cpus; i++)
>
> Flagged by W=3D1 builds with clang-18.
I really need to compile test this on a PPC system.
>
> > +             ethtool_sprintf(&data, "bpool [CPU %d]", i);
> > +
> > +     ethtool_puts(&data, "bpool [TOTAL]");
> >
> > -     memcpy(strings, dpaa_stats_global, size);
> > +     for (i =3D 0; i < DPAA_STATS_GLOBAL_LEN; i++)
> > +             ethtool_puts(&data, dpaa_stats_global[i]);
> >  }
> >
> >  static int dpaa_get_hash_opts(struct net_device *dev,
>
> ...

