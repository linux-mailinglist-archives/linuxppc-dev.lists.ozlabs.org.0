Return-Path: <linuxppc-dev+bounces-8870-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D409AC0934
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 12:00:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b33hK0MBSz3c4l;
	Thu, 22 May 2025 20:00:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747908048;
	cv=none; b=i3lCvRZjwSP0mTiE+dRyAo4o5ZojwM1Bwsm3AXKZDv1D2krt5AXYY8ckn1SfAsIqCB6iH1j11dhuXFEHuRVuULtcPz8D93PpjW8mw2vZR8J3xSY2K3hKGJZ4gIlhcFQVhD6cIHEn3i4INoc4VajvJ+N5jGBJwoUtOalhsU2S2uQELNwgO55AYyqKlW5fTG3fR70zm7otWhvw4dtGmMlJtTqQaESbC0nXggphXOeUIu1o0ZxN9wYwj6a0yKx9O5rGcOFTIi4uIfgbWkEpayC4ZCmr0SnGi+SaJvESx5Zp2+GigrixWqnz/J70E0IzwSv75VBdLoA0e/vFNLHfTriDqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747908048; c=relaxed/relaxed;
	bh=UxpEqx2dw/xmsX5Rvft+Dq3Uke5C6iT0Ri7WrYNVr9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8GozOibhC045ixmzp7xeqikZftrJSjY9z9qszV47XD2mLFHxy60KOSTccsthPyL2cfOEIg8OTpTXtDoECATka1xYMPbj1GO4ZftLdi5A/iGLtp9Pzwsr9VxdaAEdIObGW4UgJbeF/8f6JwMYGB9tyaFb8CLNm92trhIY0PT/+s8Qd5+ah4/cQRZX0RnUP5fMIu7LPkcNvw4Bbn2UIJWKSjQrncGkLSftpnb20oA+wDa2P2Yrvd67MJ3NCASwaWViXwvkzr6DB4r0l1fFGjnrMczuN07IOz2KpQm+dpZlmjFrBFWg210xvwXYxcXDaehFH+olSoDi5O9JIQjTDlpcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cj2WJCiW; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cj2WJCiW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b33hH5Hd9z3c3D
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 20:00:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 83DE662A37;
	Thu, 22 May 2025 10:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D4BC4CEE4;
	Thu, 22 May 2025 10:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747908045;
	bh=MqopuUpYpRBwINTm0XZy4Btrri9/43yCJfmha+uoSws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cj2WJCiWjYkooKVwSF7qK5qxGnxD7tXSUsN1yjJeFEgcgg/J6VU0+CKvUu4K82JWn
	 2J3EhgNsiuNcS9LFh7XQt48XPGkVjcypJmoCjd3JredBT6Tf1zRaByi+y03ZiPIrny
	 h0ubB6YEsb0W3LPuq8M2xkXuqT4SDiCyiG5i+Xpqm3RTgyoKJsQL4BP6TAj40R2iYa
	 Axe4uLW7riQND3IRZcX+WkMpXqU7DdzjKS3xKXaCU4OPIPZOI4EYUQLZwXrhuES5Wa
	 rt4laTbjxh8v+1ny12wFiI7j5z3IAWAURoXdZxe/wBBitobPOfsXpEn5SczrUcBfHq
	 xn3VT8iG9nKwA==
Date: Thu, 22 May 2025 11:00:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net,
	kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
	jbrunet@baylibre.com, neil.armstrong@linaro.org,
	khilman@baylibre.com, martin.blumenstingl@googlemail.com,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/6] ASoC: ppc: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <6625e6b1-53a7-4357-99ab-bdf5810e6699@sirena.org.uk>
Mail-Followup-To: Ai Chao <aichao@kylinos.cn>, perex@perex.cz,
	tiwai@suse.com, johannes@sipsolutions.net,
	kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
	jbrunet@baylibre.com, neil.armstrong@linaro.org,
	khilman@baylibre.com, martin.blumenstingl@googlemail.com,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
References: <20250522050300.519244-1-aichao@kylinos.cn>
 <20250522050300.519244-2-aichao@kylinos.cn>
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
	protocol="application/pgp-signature"; boundary="dYBUrfbV055H0pXU"
Content-Disposition: inline
In-Reply-To: <20250522050300.519244-2-aichao@kylinos.cn>
X-Cookie: Beware of dog.
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--dYBUrfbV055H0pXU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 01:02:54PM +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically, and
> as such, there is no need to call of_node_put() directly.
>=20
> Thus, use this helper to simplify the code.
>=20
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  sound/ppc/tumbler.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

This is for ALSA, not ASoC (same for patch 2).

--dYBUrfbV055H0pXU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgu9cQACgkQJNaLcl1U
h9CN3wf+PegrYTPlsVJy+enj/g4eJLMHrb+6cwhGIJ+rpuWUhYGaAAV3EeSH51g9
RpUaPpzmbI1W9rHSufs3UHUUX+xeLAOCmoGQY3zHQDiXcB6kH7ZnVbFLcGCEQjbE
63rKXX3DuoMTCyrERQSyyVztgwF4gtwM7/SpkrP6EF/IwRBHuR7PSbfudShqajl3
JmjzCk+11NNoW4pgUBcsCdTuxGyEd5eGZWAT/b68XKAq8AbndHwwsY2X0OC28Ibu
dCW1cX1s+NK6W/MErAM0B72wYF0HVOmzOT45F6UlMZVJqPDezTE8IB+oUmzSf+hv
3t/hI5FgEmIU4rj4jwuBpqaSXrPi2Q==
=1khQ
-----END PGP SIGNATURE-----

--dYBUrfbV055H0pXU--

