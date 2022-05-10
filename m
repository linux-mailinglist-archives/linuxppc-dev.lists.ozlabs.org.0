Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7722752160C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 14:54:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyJ0X2PY3z3cK8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 22:54:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=prHSrTuY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=prHSrTuY; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyHzv0r0hz3bXR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 22:54:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97B1BB81D2F;
 Tue, 10 May 2022 12:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B65C385C6;
 Tue, 10 May 2022 12:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652187254;
 bh=4PivaWWi4aEx+cxNzcxek9VaB+oZC2dWimjoWJP0lEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=prHSrTuY6SWToZk1S1G9KfEht4wO8o9B6JcZav7Jczb+IsjukMdEwDYWRiBweoJo8
 YPhv3WJ1ivSV9Ogg4OcHvox5ZIRJH30+2bDQB5YyCux8FxtykmT03WlZkrzuOUXtCp
 vlUJ5lmdEl2wieeeXEHobRBBpA1RnOcCP6+5aW7Q37uVoam18/1b3cKjLjuMOY6n4c
 i/tel7fHiiz8zoiek7/ffgOHy3MZXEcARJ8reaQn1vMzUlQLazBW8RCa+yT3sjX4/3
 LOl/gKSoeIXiKB/pAEGmp4EsC1zoT0a9mUAoiqfKvktbfb9yzYrDsMroI2eIiti8c+
 HuoPtieR/WPrw==
Date: Tue, 10 May 2022 13:54:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_micfil: Add support for i.MX8MPlus
Message-ID: <YnpgcAVzADHoCUgI@sirena.org.uk>
References: <1652087663-1908-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2Z522tNyah4CHNrF"
Content-Disposition: inline
In-Reply-To: <1652087663-1908-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: I've read SEVEN MILLION books!!
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com,
 robh+dt@kernel.org, krzk+dt@kernel.org, shengjiu.wang@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--2Z522tNyah4CHNrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2022 at 05:14:22PM +0800, Shengjiu Wang wrote:
> On i.MX8Plus there are two updates for micfil module.
>=20
> One is that the output format is S32_LE, only the 24 more
> significative bits have information, the other bits are always
> zero. Add 'formats' variable in soc data to distinguish the
> format on different platform.

You can set sig_bits to say that only the top 24 bits are meaningful,
though I'm not sure many userspace applications pay any attention.

--2Z522tNyah4CHNrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ6YG8ACgkQJNaLcl1U
h9AAZAf9FIpl1VBhFVT54/Bc818gjoAdE0BtGCj8hJx+BkHhVZrP/j/zQDPMsSwm
MicGHeGYNhAOFvKVkSFNg+9bZkho8sFtnlEaJfZ/JqFob5427lAlk4fr1EcfqU8f
1ICz//JQzP6UAXI9UpI/JlqdBRHbW9OmMiQiVCtoGSPV4ReuXP4vQTvW6nSdFeXS
yJaa7rvTSHn92leRXDek3XAxGEuci7VJ/zvFFxbO9wPLXGEj6VkMqSSaJ+an2Rgy
bfB4kztha4PQsEPWaMZxYkbxwiLTNIDKYNMRkUWc43OpxCF6+hu5jimP18vRToGl
25szXXQxFjmC9ojtkMeYsNeOQBqYPw==
=M2n0
-----END PGP SIGNATURE-----

--2Z522tNyah4CHNrF--
