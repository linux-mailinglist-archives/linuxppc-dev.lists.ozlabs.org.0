Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD038313173
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 12:55:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ4GQ73HqzDq8v
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 22:55:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VvzvTa2C; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZ4Bc2cqHzDqSQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Feb 2021 22:52:08 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D08864E56;
 Mon,  8 Feb 2021 11:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612785124;
 bh=khj0Ksstxc70pqDkTZPUJ+hyC/Zp9C28p+//y1Izqto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VvzvTa2CGSU8UkdTZrHmjfVeGkhd0XP7bI1HvBXw/V8QYFT1n9oPXWw3P4dCeh9dp
 tCULJOL68X5Z3jNqhPLL5AEiqe+lcpuCh0agkKYK3FJT0wybkh7Bp19yf91R8Pflak
 HOI0rKKPO3vrtR1vrzPjMbolzWlDN4nZj8thr4+cuqzyBbIs1RGwzEjP4Be9M8emAP
 Lv5vFes0K36m8a+xQE4YITlivDNLMTIHb99O1Ra1Gvlg2qvfXNE4Q+P5X0jlVlz4JX
 TmJYjy+CZiQ0J+AaWkwPO36/DYtDMUkkEQ3cIPSo+79MspG7YMmnOTet1h+C9B91o3
 AwBHSmtUNL3kA==
Date: Mon, 8 Feb 2021 11:51:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 2/7] ASoC: fsl_rpmsg: Add CPU DAI driver for audio
 base on rpmsg
Message-ID: <20210208115112.GD8645@sirena.org.uk>
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-3-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="P+33d92oIH25kiaB"
Content-Disposition: inline
In-Reply-To: <1612693435-31418-3-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: You will triumph over your enemy.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com,
 robh+dt@kernel.org, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--P+33d92oIH25kiaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 07, 2021 at 06:23:50PM +0800, Shengjiu Wang wrote:

> +static int fsl_rpmsg_hw_params(struct snd_pcm_substream *substream,
> +			       struct snd_pcm_hw_params *params,
> +			       struct snd_soc_dai *dai)
> +{

...

> +	ret = clk_prepare_enable(rpmsg->mclk);
> +	if (ret)
> +		dev_err(dai->dev, "failed to enable mclk: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int fsl_rpmsg_hw_free(struct snd_pcm_substream *substream,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct fsl_rpmsg *rpmsg = snd_soc_dai_get_drvdata(dai);
> +
> +	clk_disable_unprepare(rpmsg->mclk);

hw_params() can be called multiple times and there's no need for it to
be balanced with hw_free(), I'd move this to a different callback (DAPM
should work well).

--P+33d92oIH25kiaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAhJbAACgkQJNaLcl1U
h9AJqwf/X2Soo9XPi4+IXcHpXJMeYJEz2SrnSt4si8m1Bri4Ow7pyiSeFmffguOV
s768sMvqLorPsUHuRjMXB9NHG9hAkV/avnPqptxPH722QegXhi7ej0+kxrhrtyhf
ZefpKevO5qjvYMagXCqbRUBTHZMY0aACqCvWfLqsmC0LtSA4OHCiSHJFQKvsdxIA
MJmUyvPr9KP5z4mwD+yRO6jdTztZw4693lVUyYcRLDuCHelBhDZ0Gs4R3QGPTuI6
PKLJlxZ2P6R95mLc4ygvk4AUbsm8z5yzFoMzF3zyifwrD2PLe3X/0x/TGeUniLPZ
xAu7MVI9SOtCn+IlfAcoHK43UmMJgg==
=LRAl
-----END PGP SIGNATURE-----

--P+33d92oIH25kiaB--
