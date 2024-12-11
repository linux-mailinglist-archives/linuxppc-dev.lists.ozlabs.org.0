Return-Path: <linuxppc-dev+bounces-3984-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDBE9ECFB4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 16:28:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7fcn6DHqz2xBf;
	Thu, 12 Dec 2024 02:28:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733930889;
	cv=none; b=hPSXck+89SrOymKF8y7qGeUM7BhlldtMroQjpDkmL+T7y7C+pprRrxuPC/yHhv90Gmt6hzy0CC2kn2jOe3pHn9fD/kFkosaA394y1+MRjenjW613m7l+A9mWAoBoe32lzkwu7+ryaDtB0h5hkrQCQoCvwaauqG4agpXCbPROSPgSK9inX4iTvXACq2832ZnKzeO5jYv8KHge45QEgySJuKCdgTWVlK+UOgj8xfJsEfJVvpfCk0V39oFH1dXMwUoVPYpk2dfoCeO6agVVdmBwhtDzL9AFD8hLc5py5ItdMk+mvFWX03vBFSQ27GARGn6T/kYKWO6oZ4cay0TvJcnLMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733930889; c=relaxed/relaxed;
	bh=C0GNp9Q5CJP3PA31brfFlWgYTr9l+yrCN9pnsPK+4nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=erozVp0nh5dOTNRobckGYqW7t5Ql593XF731Me+VRmOUankLBRddhCFjoBOs5su8cJcOkJN5nb1LXQaN8V+t16kN+Vfp3ea33s0v744kdVubIF7KxuQzGOeoP1vDzre6LVaPBC62Hg1nGh1vEQjTIB+AU2r5f6vUtFweo4zBm6VOQ2YDVb6AX9mKtAkyeV63XAW2bbXN5rIDfa6JC3xkZxRuGTWDiuPzzelG/QDrZja3WvQb0CM94sdFxv0OsWFuipa0GNB03ISJ9uFf1C45CfpkB+Py5aFIY3s9UeHEuP592wdI+pV7p7lH4Kd7j8VJ1yRysvyyswoCPE6T/fcIQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ncS3ZbwM; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ncS3ZbwM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7fcm4dXMz2xBK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 02:28:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 198A8A402F5;
	Wed, 11 Dec 2024 15:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9130AC4CED2;
	Wed, 11 Dec 2024 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733930884;
	bh=C0GNp9Q5CJP3PA31brfFlWgYTr9l+yrCN9pnsPK+4nI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ncS3ZbwMzN6t8NO4sAUvIIapwpBnXSKuBDiRH5BmeXWSvdfhQ9qhp4brp36ZtI2Hp
	 3D5lLwh8tU1UvcHtR9RvspQhLPQWk0upAW/SmaoGjoQDoX7ObLK9MahyHq/EZDwM/y
	 tlQSiAp+iEhrMQXo8I6omKeAQG5bwYaOMXWK82EV5Dhz9qTu+Pt5rv1uRg9YqzetdR
	 a3sh56SaQHPK3u5hGWK2WWsGiGWdeZELE+2w4Xd0wDfAy/8lK/EbZhj56Kfw0f41BH
	 t3jCV45GUj5qcpsO+WMWj5KeQBc3ckUawBLc+af9rtfFPD2rDTfJAZoLTFOerd2ffi
	 uIstMcqoY8Xyg==
Date: Wed, 11 Dec 2024 15:27:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 4/6] ASoC: fsl_asrc_m2m: Add memory to memory function
Message-ID: <dc52c945-b292-4cd8-97ae-369a45f5a4ad@sirena.org.uk>
References: <20241211030849.1834450-1-shengjiu.wang@nxp.com>
 <20241211030849.1834450-5-shengjiu.wang@nxp.com>
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
	protocol="application/pgp-signature"; boundary="PSvSBnM/m4qXTD+T"
Content-Disposition: inline
In-Reply-To: <20241211030849.1834450-5-shengjiu.wang@nxp.com>
X-Cookie: Microwaves frizz your heir.
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


--PSvSBnM/m4qXTD+T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 11:08:47AM +0800, Shengjiu Wang wrote:
> Implement the ASRC memory to memory function using
> the compress framework, user can use this function with
> compress ioctl interface.
>=20
> This feature can be shared by ASRC and EASRC drivers

This breaks an imx_v6_v7_defconfig build:

arm-linux-gnueabihf-ld: sound/soc/fsl/fsl_asrc_m2m.o: in function `fsl_asrc=
_m2m_
init':
fsl_asrc_m2m.c:(.text+0x7ac): undefined reference to `snd_compress_new'

Looks like we're missing some select statements.

--PSvSBnM/m4qXTD+T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdZr34ACgkQJNaLcl1U
h9Dozwf/ZXFjHCknME94gJQ0D4c6sF3h+89y+jvyuYZ1PTJGUJQGbmlRQ4DrUINM
4tpKj2CjV4r8Iy8nwMYGQMhzhLdKHk+nJtN3Vc5vBRe7FJxM1S5L/HclGIUn1xjN
PzdxhFVpvf2/hHCjecOpmpE6rPvTh+joSYKT+6Lkgp54AgbELvLyxghqjZlKvOvL
goQaYml9aksvbkO4XmeuqgpANRPCsbqwrzwYHIiVQ40k9gQrj3YEEe2qAEx4pYGb
jiY/qblhfm1kAkrnNgslLG71y0X7Y2VqZjsxVHcLyf67dH6tBuMwbdiJQCXQnZO8
4a1L5qnK2IuPaaZ909B9hRN7sETagQ==
=ePCa
-----END PGP SIGNATURE-----

--PSvSBnM/m4qXTD+T--

