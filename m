Return-Path: <linuxppc-dev+bounces-2624-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D97629B22C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 03:32:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcHTX3llKz2xpn;
	Mon, 28 Oct 2024 13:32:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730082720;
	cv=none; b=Q++hggDjIPeudCb6VriH78B7ooJLm30Yvtp3f65yQgV9BfofPpNZjJH5MB47i+8807eIa0zf6gX7xOb8A0P76Oo5O0N9WvJJUai4MPOSXtfftA0OguwROj3PanGyvwFq8uXFup9dpvDhWOnOGWno+1Lb46y6AoscTSl9YchGlrBl+hvhctkXC+SqNBojpz7a9hrfTJQjiaATbMQYCXnJeMCrMw/h61MtBSdlicxUeLF8ngUrAELBUEgyjgZek8bmNvzKFsl4ihS961E0BuUVx94lKDXbh4ezYaUqWCyOdeqf9S4D27Qk2hjbc2ENujespFb0oqYR12iEi/MQVJG1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730082720; c=relaxed/relaxed;
	bh=akZfa4aGK9EQ5cduCJCgwynTCyBliCAq7gIFjV4NH30=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aOol+d/q7SkD0/wbp5g+fWmv8cZhnONoMe2LMON0bUkHBeWQoMCoxAXNsqFkQFoQz0xQ8yVZOnFwuPw4rrlTwVpBgCprmbqag8E87Q3GaBxyQJFveLJIkWQxQPxpmcRaX3Tse1lpYLxdRwZgo4FGrq4NaJ0SWZavZJ8/itrNXhMwp2vBCKjss+M1ZjJaCPXv6Vo0kV4oBgRLLNWp6KM1rdg9ZCrjKMzQUlElX+eJsJ2ITQqw8Si+19aOofqdPjF/hzO6iW9qCKTqHq/v3OZ7JzyULDpmPOP9afdECFUsLwJjPsWAQsosJn/sgZTPRwNvhB9kKhGetXkCFZmw3SXKyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TdF522ug; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TdF522ug;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcHTW4Qg2z2xRm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 13:31:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730082717;
	bh=akZfa4aGK9EQ5cduCJCgwynTCyBliCAq7gIFjV4NH30=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TdF522ug+3gW8cmYOk+/ZAjjjG+WOfWMV2jSQEF+A+/zEys1VXWINkJNcK8FUKeoj
	 wdv58PU3zWDJlTkU0suSUsiKBxSH9U5l1l3olFE1t6V2JaXUEfsUEhZGAM/5wf47WR
	 vxqX8Wgr3/RT85Lcl23VXMv3s63+/AWiZOHNUcAuNs9Emhql6TE17s2PyT04smlHil
	 aeY4HUOXJImGhdkqumhfukTggocpXV3bhgXKCTfMgdPkngqvc5U/okQQrqVW0LgRPO
	 jqjld6cZFIeLaYsh79Wq5h0gPNCZ01zKqhtIi8h3sPLUFINBBJYFe0z7F2UpGCVrby
	 jYF3tCSg8YznQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcHTS49Plz4x6k;
	Mon, 28 Oct 2024 13:31:56 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rosen Penev <rosenp@gmail.com>, Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, open list <linux-kernel@vger.kernel.org>, "open
 list:FREESCALE QUICC ENGINE UCC ETHERNET DRIVER"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH net-next] net: freescale: use ethtool string helpers
In-Reply-To: <CAKxU2N98hnVAE9WF72HhxzVEfhnRAgMykVgBErL9b3gupqqrxQ@mail.gmail.com>
References: <20241024205257.574836-1-rosenp@gmail.com>
 <20241025125704.GT1202098@kernel.org>
 <CAKxU2N98hnVAE9WF72HhxzVEfhnRAgMykVgBErL9b3gupqqrxQ@mail.gmail.com>
Date: Mon, 28 Oct 2024 13:31:57 +1100
Message-ID: <87ttcxrm8y.fsf@mpe.ellerman.id.au>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Rosen Penev <rosenp@gmail.com> writes:
> On Fri, Oct 25, 2024 at 5:57=E2=80=AFAM Simon Horman <horms@kernel.org> w=
rote:
>>
>> On Thu, Oct 24, 2024 at 01:52:57PM -0700, Rosen Penev wrote:
>> > The latter is the preferred way to copy ethtool strings.
>> >
>> > Avoids manually incrementing the pointer. Cleans up the code quite wel=
l.
>> >
>> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>
>> ...
>>
>> > diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c b/driv=
ers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
>> > index b0060cf96090..10c5fa4d23d2 100644
>> > --- a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
>> > +++ b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
>> > @@ -243,38 +243,24 @@ static void dpaa_get_ethtool_stats(struct net_de=
vice *net_dev,
>> >  static void dpaa_get_strings(struct net_device *net_dev, u32 stringse=
t,
>> >                            u8 *data)
>> >  {
>> > -     unsigned int i, j, num_cpus, size;
>> > -     char string_cpu[ETH_GSTRING_LEN];
>> > -     u8 *strings;
>> > +     unsigned int i, j, num_cpus;
>> >
>> > -     memset(string_cpu, 0, sizeof(string_cpu));
>> > -     strings   =3D data;
>> > -     num_cpus  =3D num_online_cpus();
>> > -     size      =3D DPAA_STATS_GLOBAL_LEN * ETH_GSTRING_LEN;
>> > +     num_cpus =3D num_online_cpus();
>> >
>> >       for (i =3D 0; i < DPAA_STATS_PERCPU_LEN; i++) {
>> > -             for (j =3D 0; j < num_cpus; j++) {
>> > -                     snprintf(string_cpu, ETH_GSTRING_LEN, "%s [CPU %=
d]",
>> > -                              dpaa_stats_percpu[i], j);
>> > -                     memcpy(strings, string_cpu, ETH_GSTRING_LEN);
>> > -                     strings +=3D ETH_GSTRING_LEN;
>> > -             }
>> > -             snprintf(string_cpu, ETH_GSTRING_LEN, "%s [TOTAL]",
>> > -                      dpaa_stats_percpu[i]);
>> > -             memcpy(strings, string_cpu, ETH_GSTRING_LEN);
>> > -             strings +=3D ETH_GSTRING_LEN;
>> > -     }
>> > -     for (j =3D 0; j < num_cpus; j++) {
>> > -             snprintf(string_cpu, ETH_GSTRING_LEN,
>> > -                      "bpool [CPU %d]", j);
>> > -             memcpy(strings, string_cpu, ETH_GSTRING_LEN);
>> > -             strings +=3D ETH_GSTRING_LEN;
>> > +             for (j =3D 0; j < num_cpus; j++)
>> > +                     ethtool_sprintf(&data, "%s [CPU %d]",
>> > +                                     dpaa_stats_percpu[i], j);
>> > +
>> > +             ethtool_sprintf(&data, "%s [TOTAL]", dpaa_stats_percpu[i=
]);
>> >       }
>> > -     snprintf(string_cpu, ETH_GSTRING_LEN, "bpool [TOTAL]");
>> > -     memcpy(strings, string_cpu, ETH_GSTRING_LEN);
>> > -     strings +=3D ETH_GSTRING_LEN;
>> > +     for (i =3D 0; j < num_cpus; i++)
>>
>> Perhaps this should consistently use i, rather than i and j:
>>
>>         for (i =3D 0; i < num_cpus; i++)
>>
>> Flagged by W=3D1 builds with clang-18.

> I really need to compile test this on a PPC system.

Cross compiling should be sufficient.

There's some pointers here:
  https://github.com/linuxppc/wiki/wiki/Building-powerpc-kernels

Or there's also libc-less cross compilers on kernel.org, eg:
  https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/14.2=
.0/x86_64-gcc-14.2.0-nolibc-powerpc64-linux.tar.xz


cheers

