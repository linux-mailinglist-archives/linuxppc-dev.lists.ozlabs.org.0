Return-Path: <linuxppc-dev+bounces-12365-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B129B844DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 13:14:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSChk6QZ6z30Qk;
	Thu, 18 Sep 2025 21:14:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758194086;
	cv=none; b=F+G6WtFSY6I44HF+ndJg3jDdM14Uj8ZZhmgBY0Ww9Af+ZkK2FvIMXcbgLcVQXHSv2yxiYUpERalrBqNg8/sED4az9/UBPnKVKz33GwhpASplk1+3zTIZCZ8Vz9++3+GuWnAVzr2jD88wL2SSa5SEtfrDT+X5cVl9iVqBCPtTqYVKp8apqFMLSd+cN7meDRAmGQ37Y2k4dVqLF036DubV3CdfagFa6i13RqF/y/vHoS5Xbnm0OtjESokA/r4j1XEtoHAxtoTtFAfzXuqW+tHtBqo3KM6kckOVP6Uv4D3IHVp/xP6JXp4kFNJj/UlQ8b64gpPO6Tr8LUoV+YOpYfrJww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758194086; c=relaxed/relaxed;
	bh=M93GVlkcKka2LY9OCUJg2tH+tSnNWBwTAftMb+Kx2VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D68i6bJXn5BXa1laGGjsUinK/X20aXQOtGeJF/n2ND6MCYHs6sMVEAU3KyyecnsvlL3B26dBuIqhhuYj/MafNmb1Q7ElgsYMB/wewYsiXFH3OtSLU0y4D0xSMvXLnehwlKbgCm+9XMpQZEnOFM5YBPlEn6dackpvNxVH1jIJVf7QxJ7x2BNLswM84MQwSKAFQvTYja1XL6Jz+yGrgneAWWdZibyw+kQF0uTYycQ3T0s9ths/z+1LbELhNRiHus0uN9uHszZasKaeR3GVEBJti3YSI/rH5m1hSCWIizFk/1Tpz8w0WBcH2uBHznW+sSG7T/PgNQ3yu/3qD5trSw45Gw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hY2y7E8o; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hY2y7E8o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSChj6vGcz30Pg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 21:14:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18DCE403B9;
	Thu, 18 Sep 2025 11:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226F6C4CEE7;
	Thu, 18 Sep 2025 11:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758194083;
	bh=uqKLQL0kXPlTW24rRLvkA6f101bLzhi+v2aTGmvoekQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hY2y7E8oPFC4GuWcczzwCap37MRRFfXocXGwF5tfiob6nWiwEGmnk3ou8Ag/L2fOj
	 WNZP/y4IpK8Hr6/BlKZ9obj6KneJTH6b5m2Ms5TdqTMtv6QQt5S8m7tNeIM9FjxH+F
	 +xfQF7JOPk9XX5JZHhd+klKP5TiksKlVnn3bJnbEXMO+f4WZx97XuDpArSLa8tvB1O
	 dXARWNioqFc4PiD54+ZR3jVUYPKlbknmjL4sbyDa7u8PcqA6xUnBpyz5TbBnBjvDeq
	 DzGNAQqOi/yaQe5eobFR50ynsaNQ/Wzt4IWOyXQRcSvGSFkndiCumN2Jfsv7YC9g/z
	 uGkOtT69qz3+w==
Date: Thu, 18 Sep 2025 12:14:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	linux-sound@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v3 0/4] ASoC: fsl: fsl_qmc_audio: Reduce amount of
 interrupts
Message-ID: <85ea3256-dd31-47b1-8e2d-a9d207b28fa0@sirena.org.uk>
References: <cover.1755504428.git.christophe.leroy@csgroup.eu>
 <3d20d3ec-2f52-4cac-9c5c-fd2141a12a0b@csgroup.eu>
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
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Rv2MdpZahqmMZwq"
Content-Disposition: inline
In-Reply-To: <3d20d3ec-2f52-4cac-9c5c-fd2141a12a0b@csgroup.eu>
X-Cookie: Victory uber allies!
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--1Rv2MdpZahqmMZwq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 08:12:21AM +0200, Christophe Leroy wrote:
> Hi Mark, Liam,
>=20
> Le 18/08/2025 =E0 10:19, Christophe Leroy a =E9crit=A0:
> > This series reduces significantly the amount of interrupts on
> > fsl_qmc_audio device.
>=20
> I can't see this series in linux-next.
>=20
> I see in patchwork [1] that this series still has status 'NEW' but also
> state 'archived'.
>=20
> What is the way forward to get it applied for v6.18 ?

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--1Rv2MdpZahqmMZwq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjL6ZwACgkQJNaLcl1U
h9D2swgAgTsZe6lJbstmvGT3sE8IM/SR5DbwYbMqquiSJfASLpWn6+IpQ9jey7dC
rBQ/Kac/dqktoRic2n2MNciZbkk1DBkKn7U3giWJn+Lc2TEdF/2k3D8gIb0fTkOv
pFy2ITzlJpnJe41HMTRLT0Y+2MmjTmLBp6H5mbExn9AJ5RtMcXxAMDfCB5pqSWQr
nSzduldkPYgbVRrD+RbcTzbal6R/Rjkatm1QfAt5iy7K4cvZQmNIZEOrePIP/Mzm
nt9+XFbYZHnCTxshgzhYuJBgsik6w211UWlWYuibWrlvWW/323RrN8l46amu67bJ
Zkpxs4GJvx/WIEeyf0hmzc8A7/+Qqw==
=xpzh
-----END PGP SIGNATURE-----

--1Rv2MdpZahqmMZwq--

