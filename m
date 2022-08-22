Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 519E759C024
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 15:07:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBCMP1kkdz3cdS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 23:07:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UWbhguo6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UWbhguo6;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBCLl1r8Qz2xKf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 23:07:11 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EEE20B81193;
	Mon, 22 Aug 2022 13:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A786C433D6;
	Mon, 22 Aug 2022 13:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661173624;
	bh=tc+H2IZAZYCcsk+W/qTN/Gurc56MzvlVN7bbGRvcG/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UWbhguo6slX2gCkBvkQDKi4z6EJRsxjArA7HDElXkjZM/QcrN7bJXNogEVMDwzfhR
	 wT8xkpFbn/8v1NhEkjj091LbJjSYthE2j7m8R/BjYJuFa+C0sl1ltXbzaP9ozJwKi1
	 9W/TlWvxIuY/U3bG8AT8l30zQ4WdyM1ZOcngH8lb3MsczRS7ulh5FimlfTtUZV3oUb
	 afQzRsua+Mnsll8h/6ETgCYdNO7/g1legmMBODv1HG6ex5WoQIYHZk7CujwjgG+fU/
	 1a9jy4qoQUyQZOqJt+E7gfllyZl8FTgviAzqdMb7LhkdSq5Cq6wOGXIvZSoaj23Nip
	 8sPWCHgEN8+uA==
Date: Mon, 22 Aug 2022 14:06:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Add support multi fifo sdma script
Message-ID: <YwN/c0Q8ooBCIB1z@sirena.org.uk>
References: <1660555546-24223-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u43b6UwMPrtGu+8T"
Content-Disposition: inline
In-Reply-To: <1660555546-24223-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Am I SHOPLIFTING?
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--u43b6UwMPrtGu+8T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 15, 2022 at 05:25:46PM +0800, Shengjiu Wang wrote:
> With disabling combine mode, the multiple successive
> FIFO registers or non successive FIFO registers of SAI module
> can work with the sdma multi fifo script.

This doesn't apply against current code, please check and resend.

--u43b6UwMPrtGu+8T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMDf3IACgkQJNaLcl1U
h9BAlQf+L5kP4l9lQLSb9J7A0IJngh/vpXFA7wuR/7oW6SzHZxsyamK1IEPXVijQ
6Is+lGT3ObIPZydx36IzJS+qkTOCIbuNTjeAl12SM/qCOQX4wZzhn80eKO3SKtvK
9PVvmTaFFWvn+ANBeNWDKOXtdawBfBK5K+yLhiTNifOqQZ+8e0kL0TmnOhdecYEw
//MgiNAkSEQV3c8F+u6JmXReT/9J7LLSGKbxTzu2Il8rXRPPbEfrfTxTF9V5BH3L
XAYQYUTdrQ9/1rPXEW8/jAPJxvEOljTT4Q6iFAN5KF2xslmGD7pCuM5FW9ClHuCm
rFKX5gZWGOaQn33E+zDa8HWh+usyVA==
=BNOe
-----END PGP SIGNATURE-----

--u43b6UwMPrtGu+8T--
