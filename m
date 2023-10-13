Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 993027C86B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 15:22:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FCNmsHwY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6RxW33YZz3vtq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Oct 2023 00:22:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FCNmsHwY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6Rwb65jDz3vlB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Oct 2023 00:21:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1EB006207B;
	Fri, 13 Oct 2023 13:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F36C433C7;
	Fri, 13 Oct 2023 13:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697203277;
	bh=0VLSmUiBT4OXSKoUDLazEOxnT0ZGOzCtUjBBnsTitwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCNmsHwYJDmN5iKapkMHyrE6IvjJehLUtF23l9lcZRkuXgX9C4vGhRXlUJnuLZHKC
	 r1BfmIkhWnnKwt7JBe6RIFm4sAbdwqfzn472ct1nN9o4Jh627dKLX+7mI1RiVkaTFA
	 0QMZk3rZbth7fy+Jm9AZOC87fIq4wdRah9E2HMwKxQQmZI0CyYvGvLwGvaC9hageEq
	 xzljsZRXZK8b/bN/XwiXVLrPkNJMfUn8+71BzNDU0toxYPQpgWz7U09RMlFxK+se26
	 +Wa7xV8ZB1sypDRyE263R3NYJrszF/YuFfq6fAhcoOH5U2VT4RaGWKVCRyg/u9HYXg
	 2Rec5SLOYS76g==
Date: Fri, 13 Oct 2023 14:21:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH v6 04/11] ASoC: fsl_asrc: register m2m platform device
Message-ID: <ZSlERK8gRFUOusqf@finisterre.sirena.org.uk>
References: <1697185865-27528-1-git-send-email-shengjiu.wang@nxp.com>
 <1697185865-27528-5-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wC1z3YN8nkgTz/wR"
Content-Disposition: inline
In-Reply-To: <1697185865-27528-5-git-send-email-shengjiu.wang@nxp.com>
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


--wC1z3YN8nkgTz/wR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 04:30:58PM +0800, Shengjiu Wang wrote:
> Register m2m platform device, that user can
> use M2M feature.
>=20
> Defined platform data structure and platform
> driver name.

Acked-by: Mark Brown <broonie@kernel.org>

--wC1z3YN8nkgTz/wR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUpREMACgkQJNaLcl1U
h9B0vgf+NIJEhKtL7g30+vSPZtbkBvnhTzPAcFV3zcMUZxT5QqDaOUcJVcQhn8fG
JRFW4lt71Z8bMABFCkoA/YghAFfzI5wLaxkzZgJT5B62Txw5tI9m8U4G2/LZt7y3
MM9ZP6KAzESEb3Xzc5I6DNPcXP13RiAijK4UzIvFmZZvn1htGzK3Fw0Lw9I5JIAT
oIIVQ8xaI107q2cuzxoBQ0bORi3UUCHL1f4g/YHxt7LHcdaXyZN6QoJ4jk4C2Qwi
5OtfvG14FnnM110KqTRVL7X9ZDeDq5d9EhhAgTqrzUDmvb2Pv0JY4mUbONiG63JU
nhIyQqDJ8Ri8cgDk2OVf/sXHx8XT+g==
=zNQc
-----END PGP SIGNATURE-----

--wC1z3YN8nkgTz/wR--
