Return-Path: <linuxppc-dev+bounces-7928-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F422A9783F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 23:11:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhvzZ52qcz2yrJ;
	Wed, 23 Apr 2025 07:11:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::ba"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745356266;
	cv=none; b=oLUJr+ENbKF2NNuTemdmrhRZmtlVTbxV3/n3mHdAZhj4IXxkEhRn6AUtmJg+kLpdreq6fmCefWpei8HTOaZXfq0ZtTecMB3hCBTPlW6ZqunMPQaA9GpFWk7YkYdNZL9gX1dZ9aNB/QJRLDscpG5s7TUq0R5nTA7gfz9OQcjLPQw6SbgaIWB91p6Z2pms6oT4fomZ51BhgLK+pWCEI8VAhry+9ikAWR+5Vo0hyMpDmk6GFWdJhe8x0c6qalXb45hGn1Iy5Toz8qWBBDu/v7uB6IvsFxvrN9J9WsNB6gRYCBPa354pV+qdidqL4LVybgQEzaKiJ/3u/idXVOsPEwVg/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745356266; c=relaxed/relaxed;
	bh=Q1QPdHGXqHBNd5uvMHBg2bhSv7DmcZtYPy/j4TlCsi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUZlph7WuivzW26ILKPsqrUc9iP/eyJH0UmfQuG/GU5sAoeUU5Y2s/hZFci0oLSWEydRMrZmH1KkF0sdUOihDJ2W1cFsL48mWfS8AqstpqoaVLFP/Jn2izY0prLQ3JB5i+BeO/AhrPt2yePEX+CQ9nH+AXotfNa2G/ljBvS5083TpNx42oXp7ON1pZmQ7u+AT4hPVru/RkGJBSz4zYFwrejr+XF2L1e75avqE2I4kHWNlwP5x137+VKSvXdEguYbWgC1NWYpsHB+kjrBC5+BcYvpM6/g+pEJpsGU1EQPtsjnNp4M6zPqEE2jOhPpugbhPn87g1pdulPLWN9Sb3FQhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass (client-ip=2001:41d0:203:375::ba; helo=out-186.mta1.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ba; helo=out-186.mta1.migadu.com; envelope-from=ben.collins@linux.dev; receiver=lists.ozlabs.org)
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [IPv6:2001:41d0:203:375::ba])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhvzV2nQnz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 07:11:00 +1000 (AEST)
Date: Tue, 22 Apr 2025 17:10:32 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ben Collins <bcollins@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fsldma: Support 40 bit DMA addresses where capable
Message-ID: <2025042216-hungry-hound-77ecae@boujee-and-buff>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>, dmaengine@vger.kernel.org, 
	Vinod Koul <vkoul@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <2025042122-bizarre-ibex-b7ed42@boujee-and-buff>
 <fb0b5293-1cf3-4fcc-be9c-b5fe83f32325@app.fastmail.com>
 <2025042202-uncovered-mongrel-aee116@boujee-and-buff>
 <ace8c85d-6dec-499f-8a8a-35d4672c181d@app.fastmail.com>
 <2025042204-apricot-tarsier-b7f5a1@boujee-and-buff>
 <29bdb7e0-6db9-445e-986f-b29af8369c69@app.fastmail.com>
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
	protocol="application/pgp-signature"; boundary="ttjcfkvyttnwvorf"
Content-Disposition: inline
In-Reply-To: <29bdb7e0-6db9-445e-986f-b29af8369c69@app.fastmail.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--ttjcfkvyttnwvorf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] fsldma: Support 40 bit DMA addresses where capable
MIME-Version: 1.0

On Tue, Apr 22, 2025 at 11:25:40AM -0500, Arnd Bergmann wrote:
> On Tue, Apr 22, 2025, at 10:56, Ben Collins wrote:
> > On Tue, Apr 22, 2025 at 09:59:42AM -0500, Arnd Bergmann wrote:
> >>=20
> >> Right, but this could just mean that they end up using SWIOTLB
> >> to bounce the high DMA pages or use an IOMMU rather than actually
> >> translating the physical address to a dma address.
> >
> > There's a few things going on. The Local Address Window can shift
> > anywhere in the 64-bit address space and be as wide as the physical
> > address (40-bit on T4240, 36-bit on P4080). I think this is mainly for
> > IO to PCIe and RapidIO, though.
>=20
> There are usually two sets of registers, not sure which one the Local
> Address Window refers to:
>=20
> - Translation of MMIO addresses (PCI BAR and device registers) when
>   accessed from CPU and possibly from P2P DMA, these are represented
>   by the 'ranges' property in DT.
>=20
> - Translation of physical memory when accessed from a DMA bus master,
>   represented by the 'dma-ranges' property.
>=20
> The latter is what the dma-mapping API needs. This code has changed
> a lot over the years, but in the current version the idea is that
> the limit enforced by the driver through dma_set_mask() is independent
> of the limit enforced by the platform bus based on the dma-ranges
> property.=20

LAWs translate physical addresses to IOVA (PCIe/RapidIO/SoC resources)
and are used for all master level translations (CPU, DMA, PCIe, DDR,
RapidIO). This is at the interconnect level.

I believe LAWs cover both of these cases.

> >> > I'll check on this, but I think it's a seperate issue. The main thin=
g is
> >> > just to configure the dma hw correctly.
> >>=20
> >> I think it's still important to check this before changing the
> >> driver: if the larger mask doesn't actually have any effect now
> >> because the DT caps the DMA at 4GB, then it might break later
> >> when someone adds the correct dma-ranges properties.
> >
> > I'm adding dma-ranges to my dt for testing.
>=20
> Ok. The other thing you can try is to printk() the dev->bus_dma_limit
> to see if it even tries to use >32bit addressing.

Did that. Every combination of IOMMU on/off and dma-ranges in my dt always
showed bus_dma_limit as 0x0.

As an aside, if you could give this a quick check, I can send the revised
patch. Appreciate the feedback.

https://github.com/benmcollins/linux/commit/2f2946b33294ebff2fdaae6d1eadc97=
6147470d6

--=20
 Ben Collins
 https://libjwt.io
 https://github.com/benmcollins
 --
 3EC9 7598 1672 961A 1139  173A 5D5A 57C7 242B 22CF

--ttjcfkvyttnwvorf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEPsl1mBZylhoRORc6XVpXxyQrIs8FAmgIBcgACgkQXVpXxyQr
Is/arg//YUK1btd32Isj+g5BizDLDVu8sjSPgzzwW/6/50sCuEOFLFR+mnfwytO4
2ksisWOIXnb+riN+JwOqEiRmtskhQCkoHsCQzjGMcLqByME5xOr6GaEpvc7ap6tY
TlSyTyVLbruwfOH1JufT0/PI8EQVkhyDiD0ypwuzWAxD8yy/M2LG2RfvAZa2YX1o
TcXsmxTii3vC3ksM0VhUBjjgJ3Hm3MzmAXZmKPrJnY1+CS5bI/IsI+HPftKK44gH
E7xLgLjSd8oAUDtL+SWyP7RjBOu194HeupXAjW7oEwlRoCLqwu3L/NIqoqvmJvJO
rqU3bnRxt74BF46FwA1O5N1Vq6AD5MSFZsNcmt9UYB3bNTaOk2BsEnmqnNaf+QAb
bC3OC85mWUlBwBoTs3ijE1JcNanEZXVHDrBNGda2KEUrk2LQ9Kir00Cj2Q+RCuMj
/CBg4wCdhNUeRf2B/qeClRTUdoT8mQn26Np8eLSpD5+9EW9s5tmKKAtZsEmSHWd8
Mww8lkO1UmdnoxOBdmX4IlOw+UaeeazdAxMG42bpzwzaCtAidDSETXEwxQir5E6U
OpJwLFJZhrtHx1G8G4i7SXUmWnEMgkqbqCmFcGfxi+/K9ybirouKLniqqa+Xnoc6
OhqYd25DsSaia04tpWYvmaPJ0oDz5/RoIHJlhutHdxeYXayYcuo=
=L2gn
-----END PGP SIGNATURE-----

--ttjcfkvyttnwvorf--

