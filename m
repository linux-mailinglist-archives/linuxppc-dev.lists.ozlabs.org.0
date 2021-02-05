Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8568310C73
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 15:05:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXHHX5CKWzDvWk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 01:05:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lkoEcfJn; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXHFt1fhDzDqBx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 01:03:45 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80C5C64DF6;
 Fri,  5 Feb 2021 14:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612533822;
 bh=KSxIMlDA6ShJiaWSByB90Lc7u1RAy7m+dFD6RcfG6m0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lkoEcfJnt0fU9Iij7bTJMAndSCEiVurjdE9VNRGNHVT0iEDMcEINYzsKoOZL6cfM9
 GfOJuAE3Zt4Q0+xz4xEsiG0KtPOIpRIzGy2HQoc4w+IpY7+X+3IrjQ+5OZK2Oz2Uvs
 OKws/+OMqB072shE4zH+l3F/L/tjZqYciYT+BBv76qE+apLwel9okio39bY0H+AtX4
 1iLboaZ4fpMs3123JkGSuyFzsSUAkWKQi+T+Ujkfm5McF7oYhX87xXjjsu6yofnNw2
 JUs8822XtMP7hLe2CJ6fkhs+KnX7ZdVtUE6pvlcg6g9x4GXeMCQygAr80Q0MTJPXPc
 kOaNCClvv1m8Q==
Date: Fri, 5 Feb 2021 14:02:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/7] ASoC: fsl_rpmsg: Add CPU DAI driver for audio base
 on rpmsg
Message-ID: <20210205140251.GB4720@sirena.org.uk>
References: <1612508250-10586-1-git-send-email-shengjiu.wang@nxp.com>
 <1612508250-10586-3-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline
In-Reply-To: <1612508250-10586-3-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Huh?
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


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 05, 2021 at 02:57:25PM +0800, Shengjiu Wang wrote:
> This is a dummy cpu dai driver for rpmsg audio use case,
> which is mainly used for getting the user's configuration

This is actually doing stuff, it's not a dummy driver.

> +static int fsl_rpmsg_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}

If this isn't needed just remove it.

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAdUAoACgkQJNaLcl1U
h9CaXQf5ATE//mi5uJVW049xtEPBycAxvAbD6dNUWYwuolWDZojNk7ks+PbhTKnA
0gUKScEIt0hL34j7/4NiKG+VZ66VHWlGKf+GOAhnku/bVm9Iu6PmTRoG72cNRiyt
/hfXxeapZaUppPdd6/QADyoGWNnc4W3+JwC+tcSbRrIFpgrZK+fp+nLkBbmvdTtm
rjguO81Wbie1P9vtAlWfiZhjh47ZACa6OhbNXXu4P7ndcwBUrOU9J0CMtLOWPMMU
E9dYnRBCJVSWIHbTz51qUzzpF7DCsb8TJYDlLmMSyzCf+OsosvVQ5gCLMTE/Wsfw
J4QgeKlJPaSNbAGIo78mYd3NJttKTw==
=oQQq
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
