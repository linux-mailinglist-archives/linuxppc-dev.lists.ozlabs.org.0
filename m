Return-Path: <linuxppc-dev+bounces-6123-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5E8A326EC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 14:25:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtJwR5PsZz30MR;
	Thu, 13 Feb 2025 00:25:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739366743;
	cv=none; b=NjtfXZonML9Wxl2LbvCNUQ5ER8StLUx3tV8sq6k5ji46bR8rJTWACiP9uJlGTi7RW9zOVLmpTFzuV/X8wzca3u7RPFdWglK7FfTlc0GpchSUihum/lTe/9dyEWs7nc/Qb7LXO0eLCW5SGFQtarFvAA/81xTNGSAr2W+RKVCffnMrnzFP3IPUW9xs1yEbCCOt2xUvFtnTieAmZcXPhHVCgVRqVjTiO7sKw2LaBvnNM7YnTEkdn+cSOGKyV6BFBmnqeJigfgAxoq64Rlfvxzf7c66x78VqMKYEmg0sFPlID5AYY2g6WmExlOqhFdLPOqskryU7jqvqj0ODemt6QAm2NA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739366743; c=relaxed/relaxed;
	bh=nPPGAafinSZNRKnDUDj9vQmOe7TF7b6+a4emffRKAYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLu3SRiMATW2i0GcG5Ad1HGds7O3As0QePSZjF6p2k/hE5Ogq7OGXoVsUSWRwcqiO09MB6fhDQEftWNnT9XdofHPB7AAXVDYDO7FzQj5vi+dsUblQwGWhiP4wXsFCGX3EtNLuL4/4SPjkvrmMUjNBSI9gMyG1jz5ZI+ZADkrTK8MjvDU7rwiHucgsm8giKZQWO6KKkVqlKahfmdX5CFtY68IvDDQkXumJw374Z7/lvo/fx8AbhXHJQ0/UXzS7w9dJFhk5aLjUfpve/wt2PQmqQ1vBRKb+/85ZR6ZjVi2yxsRw79deoqaWH1fA56gpANFPgcMeo7yOmtJfYcP+pwE3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cAhG2LpD; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cAhG2LpD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtJwR0p0Vz2yk6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 00:25:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 56D1AA4013E;
	Wed, 12 Feb 2025 13:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E593C4CEDF;
	Wed, 12 Feb 2025 13:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739366740;
	bh=nPPGAafinSZNRKnDUDj9vQmOe7TF7b6+a4emffRKAYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cAhG2LpDlvBgBq8FmGcFS6/4G9DTomVsJJBibWXyppxSQFKFNRnucrbef58FNnZNA
	 s4to0gnLvkK7YbMCfJfA2l6RtV1rs2uopS3B8LYOLGfbgP6spH75+z8YWn0UvKBI/k
	 2QpZcCzI64HaRF60cbMgQbktSb6ASPgq9UTHXrd9pEg3xtVk/9D5ruZ715CuBDG2Uo
	 CvPPE19SwxFIJ8WAMLcQo+IKWIhnqHtKY8GVfoapFP5oI3/1rKZDLoSWT4quxTOurA
	 9T98uazXT7lkTdEfeSiNMSpB0GHG26pBTyi1eNomcBD9pTmU6Hjntkd52nuRVGeXFH
	 LJbf+0XrEYUjA==
Date: Wed, 12 Feb 2025 13:25:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: imx-card: Add playback_only or capture_only
 support
Message-ID: <3883923c-f2b5-4b0e-b9ec-e9094849fb2b@sirena.org.uk>
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
 <20250211035737.3886974-3-shengjiu.wang@nxp.com>
 <Z6tuFp9nZFMJMgDa@lizhi-Precision-Tower-5810>
 <CAA+D8AMyXVdAWOTGHtrOyXjSLiMioAhZ1awepX3nproom87azQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="eR5N2MBL3FgF7WFw"
Content-Disposition: inline
In-Reply-To: <CAA+D8AMyXVdAWOTGHtrOyXjSLiMioAhZ1awepX3nproom87azQ@mail.gmail.com>
X-Cookie: Reality does not exist -- yet.
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--eR5N2MBL3FgF7WFw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 11:48:43AM +0800, Shengjiu Wang wrote:
> On Tue, Feb 11, 2025 at 11:34=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrot=
e:
> > On Tue, Feb 11, 2025 at 11:57:37AM +0800, Shengjiu Wang wrote:

> > > With the DPCM case, the backend only support capture or
> > > playback, then the linked frontend can only support
> > > capture or playback, but frontend can't automatically
> > > enable only capture or playback, it needs the input
> > > from dt-binding.

> > wrap at 75 chars

> On my side, there are in 75 chars...

It's wrapped as above in the copy I got FWIW.

--eR5N2MBL3FgF7WFw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmesoUwACgkQJNaLcl1U
h9BCCwf/cUpzpsoM/MopBAnPQFijzei9fc7PPZKC/ddtC1NxAx1aXwrBNA7dyqNr
pIBX9Y8UaFzGZJx2HjxALElsYzRsvtc5nVOPoOboK/omzc5Ck3spzg/XIlRDDksO
kX6s5nDUqPGDqhEq7Rjcp1hmTK5h0SV1PlNmzuMHJHrULtG0ukp1I281ASSu5Two
dR0+y+0fdGHQspRQb1wKN07V+NVeLnDotZyVmVpVVTyeu+rbWt5K4jU2f0H17t/r
5pyU4R/MLgfX1+TUHnsFLGDxcxj+vQFZtSoJoLD9+wL+KDavhDWuFq9T2ivJ9c5c
apBK+i9RTJbJeidG8sQtRp3nR0RE6A==
=Hkwf
-----END PGP SIGNATURE-----

--eR5N2MBL3FgF7WFw--

