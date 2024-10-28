Return-Path: <linuxppc-dev+bounces-2625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC139B2381
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 04:24:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcJf71lgnz2xQC;
	Mon, 28 Oct 2024 14:24:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1131"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730085871;
	cv=none; b=LRC94HpbO40X9ya4MlAwTNM7cLc+wv2fkvEOXUevOcZCSwRvjOK8AlDDD8RVIo6pCL56BA/ZqgM49Om/JoVltFD71BLcHmRCx6Gv94dX88+RWY0OL9U3RPQ0OO3g7hEPmi0jut4z5uom7FaSfJ8OxpN6k7YSP6/7l8A01XAXbSGb9FaGIg1ODibnn6JFQk4LjyBqP7o02Hrhi5EyMtZF5CeooL6vSsDwp/W29ki7vrRfL173+NChudnKaZc1pyxISt9VmbxSyrPpCJ8txIS2RQW7492MGtVx4OL8/v6uJocan2+vq4WpXX3fF3oN6bUEfDBYrFVzyhTW+aBB0RLRgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730085871; c=relaxed/relaxed;
	bh=+LsMfBBmOBwWJ706gG81NMDaw5BKeazByaIcL6Ba5p4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PFgQQCTkegRY63M4Vw41FGlTj6BTO5vkTjGyVan4lJ4AcHalZvtv+XAUJwaA/nSkM6qsm01RaatfGGKuLFdtutF+c5PNzz+GNFNTFz9pIayUVGltkJS3kfVq/d3YJbryAvC6INsKCGQu5zPhTYqi6fFEvG/GnOEJMt+X3pi1frS4Yx8PEULhmF06UIC/QQ4mlUBHelkZsS+RVm2HO9AwQLUbdA1YgtOtaFBuDbnaLHwK2WgZ8wQEFzJ4sutNlH10Avwz8TKehhubXosnNtPPvTl0gvHBO8IAsWsKEWbl5zgkd1ZV341EnJ3tDe0MFUNiGy/hUBwU3+9+gUTw7Pc6mA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XvwDjRXJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XvwDjRXJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcJf53cGwz2xPd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 14:24:28 +1100 (AEDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-6e5a5a59094so32738027b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Oct 2024 20:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730085866; x=1730690666; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LsMfBBmOBwWJ706gG81NMDaw5BKeazByaIcL6Ba5p4=;
        b=XvwDjRXJlAOhDs9ATtvGj85QWoKPP8fZR8x47gQ+nzYsWA8YkUCZoGn5yFUB3GHjwc
         1bNi1SMreQBXXMxMFl7oHizt/P+bpd/zlGRkLAdOOOilrCSoPn4SRkpa355ukFywLDNb
         1uQNwx5uBrKIzBsLC6eHrUW7JjNtaq6OdxKE7vw6M/8aqIsjDTMQMnFsfms2F3K06+rO
         1GoSZdag9VBP3R5pR3f6pn2TpLf3HX9hby70/4wQAwpktmH7HWxirhBqyI/Y5lq/WKVU
         AToc0rx8hDcREBZk4/XVFDu+cScqTIA49UYLvbg1xzO8jdmsrR9qSu7E9eAynv2PjyZG
         8Nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730085866; x=1730690666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LsMfBBmOBwWJ706gG81NMDaw5BKeazByaIcL6Ba5p4=;
        b=toCd78i2APexFeBtGQycB41qmiId3DAGXJ9h1KV0Z33UOvDJ0hknk4s0Wj6ixDCzgB
         Xg8djW7z+ntPgF19CVJg2IklMWHd+pWxNnxr4ppMBDyYLEUs2dAw3kZ/swDgECy+REZy
         cAyjuQenY/uGPbtTmznIbXxDsgSLGGsiFIo3J+G3BSpPK7IEObK5/jSCgUAMt/NgWqum
         LUGZdE1geS5PQqe+1v2I9EZS0BhUK9NFvR5iTCi+HHkXBR67GvrR3rVBBeODV3YlBVIb
         QN7GuTRRHJBmEqR2SqCARFf2VklaJt1hW395Gxa8mhMyqMNGyDwITKalyAJHjEv6jKR5
         bYxw==
X-Forwarded-Encrypted: i=1; AJvYcCWcTFpfADZ9Duy3jupFdwPGyxtuJxKpHnnedJ/8qZffJHBqsxFjhLYbCMv8avh5PSHydApGaFxxyGegHDk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyCGPipCU6XHxMdogCNmbnQaW3+k+ZRvzFcnMPiIxRtJOmgrIqg
	QiMDFvbs8EneLZNmBmYPCw7FeBlaD1szj4ekyITfPD4m3hviiSzPbB26dR/Acwp67UBHYRhaU5M
	o3qhdB13ijdrZoLvSEY9cI3MoIu0=
X-Google-Smtp-Source: AGHT+IGRY3rC/NrdebzcOHdIAZjlwCiuV3fa+vk8Et1mo1f2JvxrEQedTw7LqVt3Q/akWIRXPvoKSaEHYH3jE9P1bXM=
X-Received: by 2002:a05:690c:b8a:b0:672:8ad4:9461 with SMTP id
 00721157ae682-6e9d8b3c742mr65925587b3.41.1730085865822; Sun, 27 Oct 2024
 20:24:25 -0700 (PDT)
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
 <CAKxU2N98hnVAE9WF72HhxzVEfhnRAgMykVgBErL9b3gupqqrxQ@mail.gmail.com> <87ttcxrm8y.fsf@mpe.ellerman.id.au>
In-Reply-To: <87ttcxrm8y.fsf@mpe.ellerman.id.au>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 27 Oct 2024 20:24:14 -0700
Message-ID: <CAKxU2N-YZxg2_KF37Lw3mckYZLm4+DZS25P0bC7uuZLK4n0brw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: freescale: use ethtool string helpers
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	Madalin Bucur <madalin.bucur@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, open list <linux-kernel@vger.kernel.org>, 
	"open list:FREESCALE QUICC ENGINE UCC ETHERNET DRIVER" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Oct 27, 2024 at 7:32=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Rosen Penev <rosenp@gmail.com> writes:
> > On Fri, Oct 25, 2024 at 5:57=E2=80=AFAM Simon Horman <horms@kernel.org>=
 wrote:
> >>
> >> On Thu, Oct 24, 2024 at 01:52:57PM -0700, Rosen Penev wrote:
> >> > The latter is the preferred way to copy ethtool strings.
> >> >
> >> > Avoids manually incrementing the pointer. Cleans up the code quite w=
ell.
> >> >
> >> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>
> >> ...
> >>
> >> > diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c b/dr=
ivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
> >> > index b0060cf96090..10c5fa4d23d2 100644
> >> > --- a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
> >> > +++ b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
> >> > @@ -243,38 +243,24 @@ static void dpaa_get_ethtool_stats(struct net_=
device *net_dev,
> >> >  static void dpaa_get_strings(struct net_device *net_dev, u32 string=
set,
> >> >                            u8 *data)
> >> >  {
> >> > -     unsigned int i, j, num_cpus, size;
> >> > -     char string_cpu[ETH_GSTRING_LEN];
> >> > -     u8 *strings;
> >> > +     unsigned int i, j, num_cpus;
> >> >
> >> > -     memset(string_cpu, 0, sizeof(string_cpu));
> >> > -     strings   =3D data;
> >> > -     num_cpus  =3D num_online_cpus();
> >> > -     size      =3D DPAA_STATS_GLOBAL_LEN * ETH_GSTRING_LEN;
> >> > +     num_cpus =3D num_online_cpus();
> >> >
> >> >       for (i =3D 0; i < DPAA_STATS_PERCPU_LEN; i++) {
> >> > -             for (j =3D 0; j < num_cpus; j++) {
> >> > -                     snprintf(string_cpu, ETH_GSTRING_LEN, "%s [CPU=
 %d]",
> >> > -                              dpaa_stats_percpu[i], j);
> >> > -                     memcpy(strings, string_cpu, ETH_GSTRING_LEN);
> >> > -                     strings +=3D ETH_GSTRING_LEN;
> >> > -             }
> >> > -             snprintf(string_cpu, ETH_GSTRING_LEN, "%s [TOTAL]",
> >> > -                      dpaa_stats_percpu[i]);
> >> > -             memcpy(strings, string_cpu, ETH_GSTRING_LEN);
> >> > -             strings +=3D ETH_GSTRING_LEN;
> >> > -     }
> >> > -     for (j =3D 0; j < num_cpus; j++) {
> >> > -             snprintf(string_cpu, ETH_GSTRING_LEN,
> >> > -                      "bpool [CPU %d]", j);
> >> > -             memcpy(strings, string_cpu, ETH_GSTRING_LEN);
> >> > -             strings +=3D ETH_GSTRING_LEN;
> >> > +             for (j =3D 0; j < num_cpus; j++)
> >> > +                     ethtool_sprintf(&data, "%s [CPU %d]",
> >> > +                                     dpaa_stats_percpu[i], j);
> >> > +
> >> > +             ethtool_sprintf(&data, "%s [TOTAL]", dpaa_stats_percpu=
[i]);
> >> >       }
> >> > -     snprintf(string_cpu, ETH_GSTRING_LEN, "bpool [TOTAL]");
> >> > -     memcpy(strings, string_cpu, ETH_GSTRING_LEN);
> >> > -     strings +=3D ETH_GSTRING_LEN;
> >> > +     for (i =3D 0; j < num_cpus; i++)
> >>
> >> Perhaps this should consistently use i, rather than i and j:
> >>
> >>         for (i =3D 0; i < num_cpus; i++)
> >>
> >> Flagged by W=3D1 builds with clang-18.
>
> > I really need to compile test this on a PPC system.
>
> Cross compiling should be sufficient.
>
> There's some pointers here:
>   https://github.com/linuxppc/wiki/wiki/Building-powerpc-kernels
>
> Or there's also libc-less cross compilers on kernel.org, eg:
>   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/14=
.2.0/x86_64-gcc-14.2.0-nolibc-powerpc64-linux.tar.xz
I ended up building linux on cfarm.
>
>
> cheers

