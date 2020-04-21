Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A76D81B234C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 11:53:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495zR94bgPzDqv4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 19:53:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=TWYByTCO; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495zNx706fzDqGm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 19:51:45 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0335A2087E;
 Tue, 21 Apr 2020 09:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587462703;
 bh=IauNheB062Hx5TwDVP9QGchcfHWEIwmMV2csGlvp1Co=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TWYByTCOBPe9TYJ5N5O4IsoELB6F3vHA6O80HIcV8nnnmnt4k2pp52gP+/SHiQ274
 OqB8JJuS9/+69Dpn4TETGnXou7VQGAOpACqRHUnK5+CAXauoiJOul79OPfh5fCEUuC
 4xcWwon+SREvq5R5c8dKOQrmkudpJ9UixOjYUD38=
Date: Tue, 21 Apr 2020 10:51:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_esai: Remove expensive print in irq handler
Message-ID: <20200421095139.GA4540@sirena.org.uk>
References: <1587458483-2166-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
In-Reply-To: <1587458483-2166-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Non-sequiturs make me eat lampshades.
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, perex@perex.cz,
 nicoleotsuka@gmail.com, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2020 at 04:41:23PM +0800, Shengjiu Wang wrote:
> Use dev_dbg instead of dev_err in irq handler, the dev_err
> is expensive, we don't need the message to be printed everytime,
> which is almost a debug option.

>  	if (esr & ESAI_ESR_RFF_MASK)
> -		dev_warn(&pdev->dev, "isr: Receiving overrun\n");
> +		dev_dbg(&pdev->dev, "isr: Receiving overrun\n");
> =20
>  	if (esr & ESAI_ESR_TFE_MASK)
> -		dev_warn(&pdev->dev, "isr: Transmission underrun\n");
> +		dev_dbg(&pdev->dev, "isr: Transmission underrun\n");

These are error messages which would suggest a problem that'd lead to
data corruption, it seems bad not to try to flag that to the user -
surely we've got bigger problems than performance if this happens?
Perhaps convert to a ratelimited print if the issue is that when errors
happen they happen a lot?

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6ewiMACgkQJNaLcl1U
h9CKwwf/Tpe5//zRDnlqtVpZt3Oxy35CTdjomxN1dhZTt7hBudQjOITkDCoiNst3
SEvHAoPl0m/Y5PyAiZGgZlxFxttzFt7kPUskvTeDXWhmWRWjErukhTFBAbsA/xZM
AlHWU436vHLDv7G769/c+foQJxQQAnfiCmS2BOK/4K18HIMLgz+C6e78zEXkFPsX
rkvU9CKIZYUwgNB/YJ00JHWTy99JeURMB9IhF5vz9u+rKO7fflOjF+o/XMsxHsVw
YHYxXyu35bWT21LslOL2gsB5NWI6MIzRXOirDJKY3wHhzspdL3NkMOg0QFb3pSs0
ZHl2Tbk2fhTu7Aebf9LPYn11mmwaWA==
=YObh
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
