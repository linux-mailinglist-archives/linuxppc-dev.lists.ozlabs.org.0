Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B9B1CF495
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 14:41:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ly8Z1QZZzDqbf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 22:41:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=B2thKUjM; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Ly5D3J4YzDqS0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 22:38:07 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A3F78206DD;
 Tue, 12 May 2020 12:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589287085;
 bh=uDlo9Exmm/b6xQKP3G5CHPi7Uy1tLbtDYkh/Nhxo4Qg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B2thKUjM4ZPlMFVHhrRTOjlAH+a9pqbcg6ruG6LJ9xJo2/xDmqEWdgQPysdu5T/S5
 5j+UiuF2ruXWMcM/esh0PG8xkSDzqz5nhYgaz3Jfl3MzDCzO+nX+Loo6ZJf+kd+gUM
 pbPga4aOzFmFVxGdhMXY+7uiywOg5b0wYCR2SQZI=
Date: Tue, 12 May 2020 13:38:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_esai: Add support for imx8qm
Message-ID: <20200512123801.GG5110@sirena.org.uk>
References: <cover.1588320655.git.shengjiu.wang@nxp.com>
 <a933bafd2d6a60a69f840d9d4b613337efcf2816.1588320656.git.shengjiu.wang@nxp.com>
 <20200501102158.GA5276@sirena.org.uk>
 <CAA+D8ANDHHejFD1rYmFOG24yivpEJa+xO-WpVr=Vzfz9yW9H7g@mail.gmail.com>
 <CAA+D8ANK+Sd=nPeDZpd_=fQRFOdLtKgvsCmfQ_fRU3RCjMY+rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qoTlaiD+Y2fIM3Ll"
Content-Disposition: inline
In-Reply-To: <CAA+D8ANK+Sd=nPeDZpd_=fQRFOdLtKgvsCmfQ_fRU3RCjMY+rQ@mail.gmail.com>
X-Cookie: The only perfect science is hind-sight.
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
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--qoTlaiD+Y2fIM3Ll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2020 at 10:48:41AM +0800, Shengjiu Wang wrote:
> On Wed, May 6, 2020 at 10:33 AM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
> > On Fri, May 1, 2020 at 6:23 PM Mark Brown <broonie@kernel.org> wrote:

> > > > EDMA requires the period size to be multiple of maxburst. Otherwise
> > > > the remaining bytes are not transferred and thus noise is produced.

> > > If this constraint comes from the DMA controller then normally you'd
> > > expect the DMA controller integration to be enforcing this - is there no
> > > information in the DMA API that lets us know that this constraint is
> > > there?

> > No, I can't find one API for this.
> > Do you have a recommendation?

> could you please recommend which DMA API can I use?

Not off-hand, you'd probably need to extend the API to export the
information.

--qoTlaiD+Y2fIM3Ll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl66mKkACgkQJNaLcl1U
h9D3bwf+L1SDbZMmf3kj5H/WHV+WYYcxZvjpF2rx3puuQVDabgoA6GJxeqw/Y+E1
5yyW83wYPDD8fGV58m6XOxoLG3dkr5XC1+TFhPz5R1GuBOnLZ46HiG5C05SbEzZm
LAMKfH73aIsLtKrRk54PhzI2A2NBfO19TVVxWw4qP00k/xe2AuNQXOBNFq8vW+6a
UfgCJuvJFyizBVuid1eYBz4QTgKf/xbrQEfQAPWI72jFFgs8vzHCbPICl62acbOy
ibciDr6vghSxDewz9DyynJ0Q0SminczxTQ8e4xACqE6yz10Jh6WU07ihBjJndIlR
/ttLTH02Vy9Ail0rfr1jNuHIRa9U7w==
=SUbH
-----END PGP SIGNATURE-----

--qoTlaiD+Y2fIM3Ll--
