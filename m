Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4861C413C5E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:26:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZH71CJqz3cKb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:26:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LIdq/Eld;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LIdq/Eld; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDZGS736vz2yPt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:25:36 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BE456109E;
 Tue, 21 Sep 2021 21:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632259534;
 bh=Sd4owLoxY2SXeScmXL031r167IKcOSlruUI1WJVREdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LIdq/EldCS/1/dkYa01W0kqrcD2y21SMrFUClPtb9Lj9Ghg1ZZSxt6SvnlycPOsPC
 eHkeNxnBDhZ/MngkhMpaA2x3RQaR7FkTj1eBbIrONmXYPuq3TYEVHNLhIttqdsYnDj
 /HjY12weTQKSWrvyHSeVYd7cryzNy7HOEuMfYF8MiISIirzoNPV4nkMvUiQOghAP7v
 pfOOlE6HuVES7Iy3bqnjs9v/UF+l+yiKNHl8wRes6zqf6C3SFWRSOTDHcOYDeX0BYC
 VgFsjGDhlBFtWigvAiRH5YSJBOQU29X9UdZq5yVAlOxlPY3CwuQyr8Sgi3HBlirdXG
 we7vH6DTeOgmw==
Date: Tue, 21 Sep 2021 22:24:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 03/16] ASoC: fsl-audmix: Update to modern clocking
 terminology
Message-ID: <20210921212450.GD9990@sirena.org.uk>
References: <20210921211040.11624-1-broonie@kernel.org>
 <20210921211040.11624-3-broonie@kernel.org>
 <CAOMZO5DFBPXb9LEGtGHCxgKR81iD8Kr0TTxZ5dmnwWCbMThG0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="M38YqGLZlgb6RLPS"
Content-Disposition: inline
In-Reply-To: <CAOMZO5DFBPXb9LEGtGHCxgKR81iD8Kr0TTxZ5dmnwWCbMThG0g@mail.gmail.com>
X-Cookie: Will it improve my CASH FLOW?
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--M38YqGLZlgb6RLPS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 21, 2021 at 06:22:51PM -0300, Fabio Estevam wrote:
> On Tue, Sep 21, 2021 at 6:11 PM Mark Brown <broonie@kernel.org> wrote:

> > -       /* For playback the AUDMIX is slave, and for record is master */

> > +       /* For playback the AUDMIX is provider, and for record is consumer */

> I think the comment should be the other way around:

>        /* For playback the AUDMIX is consumer, and for record is provider */

> Other than that, the series looks good.

Right, yes.

--M38YqGLZlgb6RLPS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFKTaEACgkQJNaLcl1U
h9B8BQf/Srs0pCdiYXC9ufUvd9fHTDaruAvSv6R9Q+X3nA7SQZ/EGOL12yp4JmVO
UfzrCjspO9dVdVk4Y1Dht3JvjlXMdU1kcscxtmEMSvMw2axNZmLSwwSiMEzHO5LC
ylqr0A1OnFxzcoYmBhqXJ6N6wbzDtoo3C0wTQjHeVZ2DSsF2rI5NIXKohikd0XDB
EKaxfD//lf5jNtOfhCVyzBAxZuGX21q4jHPG3+Flj+AdfJJgqkjFhv7EJfIWSzQA
ZXM1nPIUvSWfFRu/zEgPTUfKDaErhT2JGkHtQySkgLMaoNKnJW1KtMm8/dxu4ux9
r1wJPl01vFD0FBiYDxcMcNTyiPsO7Q==
=Z2Ng
-----END PGP SIGNATURE-----

--M38YqGLZlgb6RLPS--
