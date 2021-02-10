Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B2B316A6B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 16:43:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbPDx2HjyzDsYC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 02:43:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NzWmVUto; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbP7W6Y2YzDsk4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 02:39:03 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47C2764DA5;
 Wed, 10 Feb 2021 15:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612971540;
 bh=UmFQ9LVN1sbDvFGlexMO9nwDPmQ4xxV03atwcYGV+pw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NzWmVUtoGG76LVFlqhysU3JpLDxUvQBi6njFUh6JGOkt6CbjseqgqzAqS+HaHdmfk
 T1XuWkdk5zPEx/9xLQaTza0Y/MeMuhnXGQ4ZsJ1nrkY6ndPKGqYONNd+4tyv0TPcbp
 cbTzyicTC7YJi5IoUYNq2rNOYtPl7ZEzN0Q5t4ehLU+WA4UMrHzZqJmn9pA3a2U+9H
 NBhxOfNGPwfhxZ/Ib+CGKBuIqxeO//97USv+mY2rIxCb/00SToRpINZm6S17fFaTU+
 v8WCV+RHf2qZ5VNRVkQKCHeHDm0eiJO/6xl+e0xoybXefr16H/iFnlXkR/9geyt2Xr
 kUKg94zDyIa6w==
Date: Wed, 10 Feb 2021 15:38:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v2 2/7] ASoC: fsl_rpmsg: Add CPU DAI driver for audio
 base on rpmsg
Message-ID: <20210210153808.GB4748@sirena.org.uk>
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-3-git-send-email-shengjiu.wang@nxp.com>
 <20210208115112.GD8645@sirena.org.uk>
 <CAA+D8AMRGRRk6FzdiqaHAP1=dPJngNgmdGmU59vrroXA9BMyXw@mail.gmail.com>
 <20210209222953.GF4916@sirena.org.uk>
 <CAA+D8AN=SDMLhuNbstzHL_H2p_L6cr+oCXbauNB0gGs2BW5tmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline
In-Reply-To: <CAA+D8AN=SDMLhuNbstzHL_H2p_L6cr+oCXbauNB0gGs2BW5tmA@mail.gmail.com>
X-Cookie: Are we live or on tape?
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2021 at 02:35:29PM +0800, Shengjiu Wang wrote:
> On Wed, Feb 10, 2021 at 6:30 AM Mark Brown <broonie@kernel.org> wrote:

> > Like I say I'd actually recommend moving this control to DAPM.

> I may understand your point, you suggest to use the .set_bias_level
> interface. But in my case I need to enable the clock in earlier stage
> and keep the clock on when system go to suspend.

The device can be kept alive over system suspend if that's needed, or
possibly it sounds like runtime PM is a better fit?  There's callbacks
in the core to keep the device runtime PM enabled while it's open which
is probably about the time range you're looking for.

> I am not sure .set_bias_level can met my requirement. we start
> the Chinese new year holiday now, so currently I can't do test for this
> recommendation.


> Maybe we can keep current implementation, can we?
> Later after I do the test, I can submit another patch for it.

Well, the current version is clearly going to leak clock enables with
valid userspace so=20

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAj/d8ACgkQJNaLcl1U
h9DudQf/TaziP/3fIA/+VtOM1vmRz+Y+qg+fko13UVOigl8UEJA/n+4WEegQRoJG
uDTO557iKp/JwY4o5tXxXQxGZhGMhhDg3MDhWbWx0QJ9y/bMhD4R+sZ421eYHwLI
0cjTI9P2I+EiYtMsTICqZgFmEtR+wJHwtJyXTWaIXDPtJYCJuxGBK4mIxn+2YO72
yXEhmkzRVFDFSMhOR0aPUfAD7yMMvRP8UM0R7VBtwXavEtV9ZHrMqxkibnoMt8oX
ONd0cWMywupFjGVZQalfZJyHmnawloUrOg6V5NU5pS7dvIyMgUCgqcwg+8STUDRF
/ynzOHGXxgiNb5x9zte6dG9YVbs3vw==
=A1BK
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
