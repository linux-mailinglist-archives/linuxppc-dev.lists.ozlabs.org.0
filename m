Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3D37C86A1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 15:19:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z8l/+Xh+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6Rtg6G65z3vh7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 00:19:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z8l/+Xh+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6Rsr32WPz3vdk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 00:18:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 07B83B82AEC;
	Fri, 13 Oct 2023 13:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B380EC433C8;
	Fri, 13 Oct 2023 13:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697203131;
	bh=tfwxO8vY/5VZ2f6n/V/bDl2PR5lkSh2hbmTloas/vbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z8l/+Xh+FfwFx+l9WHwzf+CivJ/aQqq9Ob4RuihtTBUpYiOuTy3Tr2sDTy8Hpah8a
	 6xRRSLejv5k1mSGCuNEr9qde5MZaS9RjAz7zqKULnjRQzGCyM9KAggY1mVEWE6RvrR
	 rU4XNPMhlHO8C1AoNLlpT/QoQEGY0EZS74Pkzj/GxgY/++gt4bBzD02xnAzPzYPF5D
	 rOZvCL2jrS6V3YYoJuEQu0d15U95vNTmj0N/QwdvZTctYGALnn7ATPm/GwyHAGN5BR
	 YRCs5xpVpvJzuojfHyS4mMnfWRu/75PUjo2zQHsyWLo1FhOlINZfK0f1AMYPZlGIdl
	 u2p1k4sUiA0Dw==
Date: Fri, 13 Oct 2023 14:18:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH v6 01/11] ASoC: fsl_asrc: define functions for memory
 to memory usage
Message-ID: <ZSlDsZ+pFoefpYKF@finisterre.sirena.org.uk>
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TrxnhrhreJ8i5XbB"
Content-Disposition: inline
In-Reply-To: <1697185865-27528-2-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Save energy:  Drive a smaller shell.
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
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com, linux-media@vger.kernel.org, tfiga@chromium.org, hverkuil@xs4all.nl, linuxppc-dev@lists.ozlabs.org, sakari.ailus@iki.fi, festevam@gmail.com, perex@perex.cz, mchehab@kernel.org, shengjiu.wang@gmail.com, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--TrxnhrhreJ8i5XbB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 13, 2023 at 04:30:55PM +0800, Shengjiu Wang wrote:
> ASRC can be used on memory to memory case, define several
> functions for m2m usage.

Acked-by: Mark Brown <broonie@kernel.org>

--TrxnhrhreJ8i5XbB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUpQ7AACgkQJNaLcl1U
h9DVYgf/XvHmqiuXmRoN0U7tMZzo7WP+CLOA/DjYORoGLnjZnxp9vShIZ3Rb3yBD
zAFWBQlLSw1/NGqOUbgPbCEKjzACGAK/iDrvtmWuwK3Md03mHwm9dVlzDbHo/KsB
XEpVnISg49uAdGRDldGYcLhNUJmylglwuHdBQHUXTDXoubZlIKq3Y8lkO2UE++1F
JJWM51XbIJDShikbunKjiKnY9HwIsoIIYMzgXw26s7W3M5O/zmYJT4t9BWiOq/I/
eKiHLARnegDruQcOWp324f+MGV7eLtpOSB4oppydGT4532XH81CvdbBblFMsnyJH
h/YIjT8VFxVlIr6Wl9uEdHuKTTOPow==
=mvxU
-----END PGP SIGNATURE-----

--TrxnhrhreJ8i5XbB--
