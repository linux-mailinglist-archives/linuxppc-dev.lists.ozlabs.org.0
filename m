Return-Path: <linuxppc-dev+bounces-7940-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EBFA9998F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Apr 2025 22:42:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjWJ306khz2yDD;
	Thu, 24 Apr 2025 06:42:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745440946;
	cv=none; b=nUw/vYkcKEeCONwPD7I5aHwnVNRO1FK7UILedgyCoYVlQ5ftoodqXTkpAKxtOnuc8JoSm7gzUyVsLmq/Dd4Rw5ZKLaG3f1aHXYT+46u3TRqGMpuRuO/uN9L8MPyeupNtNjLdaCyJYm5ZF3X2z+BoHTRQwZqHDBBdT3ZF8PFOpJmBrzk7jg3nLZ+LCu9R0iLEylwKrrZ6yC4JRiB0syO0/zd+xfEntR5s/e/knq46ZNMP3VmSHAJiQuxtP4+n1TSwCxN8LvLdiXQawmaAjuwBjx49lW7XQvJeoyy7hRiV25LopvP71tBGoG34ELjiGqPbzSkCHqHY6042OO5WSCsiDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745440946; c=relaxed/relaxed;
	bh=GnsvHNMz4T4SA9zIWZmxD263Sk3UfPHb7htUyfj4dCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbnOaf0uvRGsx2GQcD2628Jf1tZkP0AUgMaItEplVSqG76EO8DuiwK7Wn8uRPFM8nuQsnhsMCV0vcZrG41mLsLGIxcwA9CB0x80ov49+zUjJrH5e408qUIq851C/HTE3b5uRiA75vvaRGltiTU5tyFR0pKNyYO+JPy9fcS8LMUWsc0QHcNG9/nRZ10pyGhfThg9fMIUCNuFMjmxJTZmJWftgBY3a4gem1c6//7HVtKRXq4J1X/2tk27iq5fETwhra5DfPsS30CuIpX1GYcMtO5ZLcmTE6/94H+0586sxji147cIRI2HpZ83mVYN5FZPFSS+exFe+69lbvN7lg7nmbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass (client-ip=91.218.175.189; helo=out-189.mta0.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.189; helo=out-189.mta0.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org)
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjWJ166q1z2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 06:42:23 +1000 (AEST)
Date: Wed, 23 Apr 2025 16:41:58 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ben Collins <bcollins@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] fsldma: Support 40 bit DMA addresses where capable
Message-ID: <2025042316-nippy-lemur-debd6b@boujee-and-buff>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>, dmaengine@vger.kernel.org, 
	Vinod Koul <vkoul@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Robin Murphy <robin.murphy@arm.com>
References: <2025042122-bizarre-ibex-b7ed42@boujee-and-buff>
 <fb0b5293-1cf3-4fcc-be9c-b5fe83f32325@app.fastmail.com>
 <2025042202-uncovered-mongrel-aee116@boujee-and-buff>
 <ace8c85d-6dec-499f-8a8a-35d4672c181d@app.fastmail.com>
 <2025042204-apricot-tarsier-b7f5a1@boujee-and-buff>
 <29bdb7e0-6db9-445e-986f-b29af8369c69@app.fastmail.com>
 <2025042216-hungry-hound-77ecae@boujee-and-buff>
 <06765168-a36a-4229-b03b-6ea91157237a@app.fastmail.com>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fxpjaem6afceona6"
Content-Disposition: inline
In-Reply-To: <06765168-a36a-4229-b03b-6ea91157237a@app.fastmail.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=0.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--fxpjaem6afceona6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] fsldma: Support 40 bit DMA addresses where capable
MIME-Version: 1.0

On Wed, Apr 23, 2025 at 03:49:16PM -0500, Arnd Bergmann wrote:
> On Tue, Apr 22, 2025, at 23:10, Ben Collins wrote:
> > On Tue, Apr 22, 2025 at 11:25:40AM -0500, Arnd Bergmann wrote:
> >> On Tue, Apr 22, 2025, at 10:56, Ben Collins wrote:
> >>
> >> >> > I'll check on this, but I think it's a seperate issue. The main t=
hing is
> >> >> > just to configure the dma hw correctly.
> >> >>=20
> >> >> I think it's still important to check this before changing the
> >> >> driver: if the larger mask doesn't actually have any effect now
> >> >> because the DT caps the DMA at 4GB, then it might break later
> >> >> when someone adds the correct dma-ranges properties.
> >> >
> >> > I'm adding dma-ranges to my dt for testing.
> >>=20
> >> Ok. The other thing you can try is to printk() the dev->bus_dma_limit
> >> to see if it even tries to use >32bit addressing.
> >
> > Did that. Every combination of IOMMU on/off and dma-ranges in my dt alw=
ays
> > showed bus_dma_limit as 0x0.

> There was originally a hack for powerpc that allowed DMA to be
> done in the absence of a dma-ranges property in the bus node, but
> limit it to 32-bit addressing for backwards compatibility, while
> all other architectures should require either an empty dma-ranges
> to allow full addressing or a specific translation if there is
> a bus specific limit and/or offset.
>=20
> Looking at the current code I don't see that any more, so it's
> possible that now any DMA is allowed even if there is no
> dma-ranges property at all.

It's still there. It hardcodes zone_dma_limit to 31-bits:

arch/powerpc/mm/mem.c: paging_init()

I'm digging into this more. I'll check back when I have a better
understanding.

> > As an aside, if you could give this a quick check, I can send the revis=
ed
> > patch. Appreciate the feedback.
> >
> > https://github.com/benmcollins/linux/commit/2f2946b33294ebff2fdaae6d1ea=
dc976147470d6
>=20
> This looks correct to me, but I would change two things:
>=20
>  - remove the debug message, which you probably left by accident
>  - instead of the explicit of_device_is_compatible(), change it
>    to use the .data field of the of_device_id table instead.

Will do.

--=20
 Ben Collins
 https://libjwt.io
 https://github.com/benmcollins
 --
 3EC9 7598 1672 961A 1139  173A 5D5A 57C7 242B 22CF

--fxpjaem6afceona6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEPsl1mBZylhoRORc6XVpXxyQrIs8FAmgJUJYACgkQXVpXxyQr
Is+a+BAAhV5mcf/TO/RILq33XlzL0rUsb9XinOexT5is1rmUn3HdeX2F4BG+AGpj
lyo7gYAACqsOSNGZOrAaRo8BJsp9m7XYO4tpeMX4R1lnHyd6Fpc1q+XbGkWjInzD
2RKNBnx6B+vMcOV3628ZmapiiEtjBXQvCYiKcS+mS6eGDQwgMkOkChDJjp1ldEHt
EB9lOrPAggMt/PNXSXNsLY/dnHux7yFMunOdh3zCaBMOZAWQ3VCPfU8FTI75ODhU
Jvy5kL+pXzBxQ1ZCZdQdQINjW26O/0iX8xoar/vCy2NjczbOfhvSYk5Y+Bcyb3dh
6Crokq+KkJuNv78zsc2Rwh+yoIcg2lt5iDQIo84swlPFmSHtLYef2fhtANU535UB
mDf5zN25jwWGI6SE+wXqu5odNCo55Azu5iOcbIt4RwOesrpW89zakAyqQ7x9KpnO
iT9YoH9HNxqE9Z8IXPnBMUiQR8pLVFJ9BPmhCgyWSGjLNeaXn7Phe0gm+UML0Brg
2pl/1wXEhOLIv5/SgWkVlHo9AsWMBObDwUr5egnpzR8GyWe3qm8eGXsq86tqcE2P
FtlS+qGcJdonTViNd+obXzjSTEnBtZ13DdikK/BgpGGvfW/Swqux2Sp4vNG2aYli
WrUwf2ZjsYjo4l6xdRH1nNmZeTkpqEcDD0S3tZR1x44ZAMd5xhU=
=/lyT
-----END PGP SIGNATURE-----

--fxpjaem6afceona6--

