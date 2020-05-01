Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5621C10C7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 12:23:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49D7d811DjzDrP3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 20:23:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=cOTspiVo; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49D7bJ4tvrzDrBp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 20:22:04 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD15820787;
 Fri,  1 May 2020 10:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588328521;
 bh=8PiUkTNj8dS4j695LU0tBOc5dYcnMnyHpPrN0SZQOK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cOTspiVozJzNRZAUtA9SvU4tVEBPMFtj4vbtNeG6j7iIG8fu+SN9CPpX/usVudhHG
 90faFkROucGSYAftqdqz1jipFHOZFG+o8VAZDRm/Jo7UklZnQenp4mycxHsoLer497
 xxaJqhb+0gcSkrvvWXRSjHALoZq3IzqGO6NMEZMU=
Date: Fri, 1 May 2020 11:21:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_esai: Add support for imx8qm
Message-ID: <20200501102158.GA5276@sirena.org.uk>
References: <cover.1588320655.git.shengjiu.wang@nxp.com>
 <a933bafd2d6a60a69f840d9d4b613337efcf2816.1588320656.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <a933bafd2d6a60a69f840d9d4b613337efcf2816.1588320656.git.shengjiu.wang@nxp.com>
X-Cookie: Think honk if you're a telepath.
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
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, perex@perex.cz, nicoleotsuka@gmail.com, robh+dt@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2020 at 04:12:05PM +0800, Shengjiu Wang wrote:
> The difference for esai on imx8qm is that DMA device is EDMA.
>=20
> EDMA requires the period size to be multiple of maxburst. Otherwise
> the remaining bytes are not transferred and thus noise is produced.

If this constraint comes from the DMA controller then normally you'd
expect the DMA controller integration to be enforcing this - is there no
information in the DMA API that lets us know that this constraint is
there?

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6r+EIACgkQJNaLcl1U
h9DfFQf/TcF/ZY/a5ix0r9s1n6xwh2QMqCs8szfQsOfEi3yLY75x5EptEuWovv0O
f0qx5o8tPjQNc6Ta+xw5OLLyOOTRSq5Gh703vik1g4SHjBWt6+Yn3SXovi9Y0j4V
ldBR/b2hTetKB3kxy5Ye0zimM1m/ifUuixaPTe5tfugJDWTAFaC2ZWFBlF1mveIb
5elPV0W1IYhCLo73wQa3Y/5evQCBv/uVMjWQAs44wt0LR/IVENEtBx/C4xkjgfrz
97uSY2xEEUsWDP/xi1fLlI5bU24PGepYE0cfN4N8hKNJGuL16WXZxnZRaN4LBk/A
n0v9+0DGJjzdrSsDZq/KxIk0QOQtsQ==
=RLMk
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
