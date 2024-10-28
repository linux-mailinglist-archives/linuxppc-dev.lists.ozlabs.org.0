Return-Path: <linuxppc-dev+bounces-2643-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A84789B2FDE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 13:12:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcXLv33XZz2yNv;
	Mon, 28 Oct 2024 23:12:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730117527;
	cv=none; b=WTRzidOCGDnXDoHYDxmT9px2DuVD6fCt+pEJ/wolsphIn/aDu2PNANeYaESHY5lfybSnz2kkS0yf2XmX4PEaRr2EwQ9V1IO+OvHyJ6ONbJb/4BwShRNoayODEQhD1yem0AEGsZ5kSGwA+D1pkXma/P4cCRZRfQ2U7O/69FIXlz+IIJmg7mvkASn+dT70JsOsG0bzYwD0K+98V7R6SDB3yVcj3Da/SV0HaVjPmOB4pRZQu2KkGVRDCLCgXcvmhsP+zhMS8/OP1S1o2+4C9HcQqrCYWGAnMzzpiRZmeBDqopE1fKTUYIxtqVvJtZnXZLY/wOSYKaMmJxpB2jfOlAuzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730117527; c=relaxed/relaxed;
	bh=NAZkhhTeYWBcCRnnAZH+eZCWBsmCMSLDc9mRceexjgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+GjGwzgjDgHcTdSQ1qwrVbbl+fFikEa3rgdwu0eXMpo0sWlwtshIqLo/yrCrjs3d3sT7H2qRTog1NPbnQwd0I8xrepiXfzS5hbf8ezbvJ6CTD6dVLHGcuZOlmTA4+W0keDCn7XHXbZEtmlns5Qih1QUnmCQHI+pZd9ZW81nbKA5yiw5Wb6qXFGfPfxYagl0PUT3CIC/LPjuxlmPQ4WOnH2oC3yZimsTvViejkS3xbGDDxxkHs5tCrDSqsUgjy4x8fIi/B59P62TYeUYr63/2sinMQRvdxHTKhiU4GOsBzwaqiUpqfkPWOfWInFAlQLfJvgazvGuQ4EPXeLrUjfB2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uTA10aeL; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uTA10aeL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcXLt3FnQz2yMP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 23:12:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CDEB75C42B7;
	Mon, 28 Oct 2024 12:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB9FC4CEC3;
	Mon, 28 Oct 2024 12:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730117523;
	bh=NAZkhhTeYWBcCRnnAZH+eZCWBsmCMSLDc9mRceexjgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uTA10aeL4xtGd63PUIPx4KhhP7HDf7HveJCfWaAvK3qMB3bC8jLKkEhFESanGKbGf
	 uhuDju3v8m3q6ieocv7/yEBPF18Cm83bCKgYPTn2qye5/6F6nwYL+lAxM0hDQ1du8V
	 Dh/ZPyGjrWiPXyKtiTxIol4e2/k0WxJX+/8AtT6n40dTRWQ6cmbQyboWn5RSmZglPA
	 IbMxrtYqDvMPSdSB2BvEZtP6NHs/n63XsT/dRKP97i6mPmFZuEeHcDLhqQx9yYFICM
	 PkHz47nn0gx8oL6zQVXRROwud3Sjg/7pm75NIrx5uhJzzS+wGzJ9liRCwrMSQ+e+/y
	 8X53OSDt6bqxw==
Date: Mon, 28 Oct 2024 12:11:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH AUTOSEL 6.11 05/32] ASoC: fsl_esai: change dev_warn to
 dev_dbg in irq handler
Message-ID: <1ad8216d-c24d-4d35-9562-4106e2aafa34@sirena.org.uk>
References: <20241028105050.3559169-1-sashal@kernel.org>
 <20241028105050.3559169-5-sashal@kernel.org>
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
	protocol="application/pgp-signature"; boundary="Jw04mRIq6Tcvx3ro"
Content-Disposition: inline
In-Reply-To: <20241028105050.3559169-5-sashal@kernel.org>
X-Cookie: Remember the... the... uhh.....
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--Jw04mRIq6Tcvx3ro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 06:49:47AM -0400, Sasha Levin wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
>=20
> [ Upstream commit 54c805c1eb264c839fa3027d0073bb7f323b0722 ]
>=20
> Irq handler need to be executed as fast as possible, so
> the log in irq handler is better to use dev_dbg which needs
> to be enabled when debugging.

This is very marginal for stable material.

--Jw04mRIq6Tcvx3ro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcff40ACgkQJNaLcl1U
h9CXwAf/dKgisn32gugwOj7kv0kcdBJdUWmANJAOcx1EOHgkOSaJivv+5thFldfv
7oqPwtMJ7fY3dgB+F9mBaeEme5UEhSHLoawxHLf4C5paoOTr4z3YcXrdwYgwrF3Q
n+sGIw5qXOgLhuHyOaGLyaMsGaHuI4yB4PfFi/muoWK98SQex0M6iC3+WbAY41D+
0ghy0A9fIIAy/xK9Q309x9hV6dwfUE4Sg4+DHC2kH9E5JBD9sY4EaGmkdZ7azV2A
tqwaPUgw34Hip+veM7UMb4m/G3jM6BwAUJporndNYVBmo3O06bDGvZulrRDsUkEi
7PvclJ+x+hhfc90E9zZn2mCpDj9trg==
=yJsI
-----END PGP SIGNATURE-----

--Jw04mRIq6Tcvx3ro--

