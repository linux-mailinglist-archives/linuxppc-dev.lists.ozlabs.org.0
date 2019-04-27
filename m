Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B91B410
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 19:18:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44ryLy23GWzDqNL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 03:18:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sirena.org.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="poKkCc9h"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ryKQ6nQYzDq6M
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 03:17:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BrHF07zYw1XVu0tEvTnGpMr1OkuigjWVhQxqr86f0Tw=; b=poKkCc9hoL0tN0EHuvdyOZFJc
 I/KnBGgebnnQOmU+f9qBKc8if436wWlpFUQcoOcOXaA7vSOesU2AkPYLD22S8poQPVUVFE0jegTfv
 c63FPyc5BlugbBz8DHRNcNCXS8GcL0BN2BOYCug5XsIvQpdQ5ERRuUHvGPM2dyBohESmE=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKQwy-0004XU-1x; Sat, 27 Apr 2019 17:17:20 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id BE38E441D3B; Sat, 27 Apr 2019 18:17:15 +0100 (BST)
Date: Sat, 27 Apr 2019 18:17:15 +0100
From: Mark Brown <broonie@kernel.org>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [PATCH V3] ASoC: fsl_esai: Add pm runtime function
Message-ID: <20190427171715.GF14916@sirena.org.uk>
References: <VE1PR04MB64797233B0BFE833550094C3E33E0@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pyE8wggRBhVBcj8z"
Content-Disposition: inline
In-Reply-To: <VE1PR04MB64797233B0BFE833550094C3E33E0@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-Cookie: -- I have seen the FUN --
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--pyE8wggRBhVBcj8z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 26, 2019 at 10:51:15AM +0000, S.j. Wang wrote:
> > On Mon, Apr 22, 2019 at 02:31:55AM +0000, S.j. Wang wrote:
> > > Add pm runtime support and move clock handling there.
> > > Close the clocks at suspend to reduce the power consumption.

> > > fsl_esai_suspend is replaced by pm_runtime_force_suspend.
> > > fsl_esai_resume is replaced by pm_runtime_force_resume.

> > This doesn't apply against current code, please check and resend.

> Which branch are you using?  I tried for-next and for-linus, both
> Are successful applied.

I'm applying against for-5.2, though if it depends on a patch queued for
5.1 that's fine, I can just merge that up - please just resend.  I think
I did try merging 5.1 though...

--pyE8wggRBhVBcj8z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzEjpoACgkQJNaLcl1U
h9CHlQf6A1P1Ke+eIk6AjsV7q+IJv+iAexa+x1wOv3kVyxN9HNXMrrjuzMEX9GHF
5r7c9xhmJkX6qp8qFYVofOXeK3E9muhfjvSakheiyz6b3bpOP4bTNpZPK2m48Eda
aKkSFsu/TBWB42fymUVC5tAo45RWNe+5OSZrpCHou5DnvhhEMmdoMNS2ZDzrYFSt
h0rgmD+tb0YTZgP7WuEx0L/iSe0epJDpXyN8wgBozUQJp7muUvLnBPHEWqsNnoY9
bLVkFnRQhyZVi/urL0G5fGfbDwjRSXtoJJwjczQDAwXy20veWbr10l88uPXRbL5R
rIYLJu11thD17a4mSdf/UCUix1rE0A==
=tACM
-----END PGP SIGNATURE-----

--pyE8wggRBhVBcj8z--
