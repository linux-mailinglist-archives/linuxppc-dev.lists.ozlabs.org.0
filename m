Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B11484777
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jan 2022 19:07:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT0vg70sKz3bht
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 05:07:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TODSu9Pk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TODSu9Pk; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT0tx5b9Xz2xBv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jan 2022 05:07:05 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 28C55B817A2;
 Tue,  4 Jan 2022 18:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34CDC36AED;
 Tue,  4 Jan 2022 18:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641319620;
 bh=txfvS+Gitakuv4kkZ9OkxwiKDa6QdbuL+sIHK0c2OxI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TODSu9PkSjLNlNUJyBzC+8Cdt+Ux36ZiJX6gytEt0Sg56BXO3Eo1sgHAjb6ZJ53U6
 03ekSEye8DfpM2W7iS7LpZ//U+8LjI7GaY1fi09XDA+FbBnRWVEkBOPCaA+bCKqJ2B
 UcAmuTuICA5nzHRaPCUcIjm41628b+o0qXaQopyYLY9i5PO4mMSGS5/60uLRMvchqz
 6SlVOosnsr5UNzLgSvKMyCUOYZ8mbpw7fKA4uh/1AStk5NpgZK7aGSmAWu9DNWTW9i
 swxQBKY3tXMy4CqNMly8wyByj2/HWX9TQDMEJ2AGBFWaFlSxz9Ck2BETWKTUDHkDnV
 xpKmO8fLsT+MQ==
Date: Tue, 4 Jan 2022 18:06:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/3] ASoC: imx-card: Need special setting for ak4497 on
 i.MX8MQ
Message-ID: <YdSMvtXHsYWl7E0U@sirena.org.uk>
References: <1641292835-19085-1-git-send-email-shengjiu.wang@nxp.com>
 <1641292835-19085-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wM9Rnn4bmiJ3jtwv"
Content-Disposition: inline
In-Reply-To: <1641292835-19085-2-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: The horror... the horror!
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, perex@perex.cz,
 nicoleotsuka@gmail.com, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--wM9Rnn4bmiJ3jtwv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 04, 2022 at 06:40:33PM +0800, Shengjiu Wang wrote:

>  			/* sai may support mclk/bclk = 1 */
> -			if (of_find_property(np, "fsl,mclk-equal-bclk", NULL))
> +			if (of_find_property(np, "fsl,mclk-equal-bclk", NULL)) {
>  				link_data->one2one_ratio = true;
> +			} else {
> +				int i;
> +
> +				/*
> +				 * i.MX8MQ don't support one2one ratio, then
> +				 * with ak4497 only 16bit case is supported.
> +				 */
> +				for (i = 0; i < ARRAY_SIZE(ak4497_fs_mul); i++) {

Shouldn't this be keyed off checking that we are actually running with
an ak4497?

--wM9Rnn4bmiJ3jtwv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHUjL0ACgkQJNaLcl1U
h9DLtQf+NYjFfOunR2kagpHatM3uw3vj6y2ywBhn8AKl0Ar0TPugAPIBV7cClQVk
1sHU5pGUol0aOrSl9c/y+uccKTxxK+dZs3jnI2RX3u8n9UdW/tsiQepu/rkVgMYy
SZdNhfcCp0VkJGYq8099YjMoo0zH4WUC5b5Ph0Jb0c80dixXJ2LCFtcKoKaxMkHZ
oYCJrpeu1LWU4b9hqgjkuRpFpU2ihQWuHQQwMIXzqk2+zdRYbyGabWRdxnyN2F+8
3LHLlPlUXGdyomQfUFWu//LqMI1Yi/xqHDeyk1Oi7WFduA4WvFuSrwtaHDqSpX9E
ds+WpmNO0leJRKzk7+c+U8iIqlXt3g==
=8shi
-----END PGP SIGNATURE-----

--wM9Rnn4bmiJ3jtwv--
