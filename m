Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 693B2492C38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 18:23:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdbFt1Ry6z30Mr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 04:23:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TK4R4ujo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TK4R4ujo; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdbFD2mbZz2xtL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jan 2022 04:22:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF02A60EF9;
 Tue, 18 Jan 2022 17:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824F7C340E0;
 Tue, 18 Jan 2022 17:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642526556;
 bh=nprtLpXrRfvglwbXoOGOQ6/KtgrFZDOqeMJxXlz0s0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TK4R4ujoiynCj4SK6WpD8pNaaMAAg1E7afe4kJAjp/SwXXskZVB7P7pfm42MyyhU5
 zIR+LqYy9RKz7cG08fXze2SfdT9cnp9J2oz2wPB9mCyUUg7L7QCaPn//bArAzOupZ1
 OLCNvKWWAJg3oRcBLCSgxFBP9D4uGmY8SNKv0aGbNen/jPdgpWVoHUe5ETbT3IHm7P
 SHe4/F0ZYGmohxfI7SiUlH/oSQDAnnz+tuvYj7uVFwBYtOxUqiSgwtUbgnryk+P/ct
 9FUdHcNrkvGhrezFy1ZTRL7bOQ5eF7jhOQA90iMfVUwGWu7kTRNDmszkU+QVa/L+R8
 4oAq7e+qRmxFw==
Date: Tue, 18 Jan 2022 17:22:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: tlv320aic31xx: Define PLL clock inputs
Message-ID: <Yeb3VVmrUDIYw3AK@sirena.org.uk>
References: <20220117132109.283365-1-ariel.dalessandro@collabora.com>
 <20220117132109.283365-3-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tabkMTr0FaHh+1SV"
Content-Disposition: inline
In-Reply-To: <20220117132109.283365-3-ariel.dalessandro@collabora.com>
X-Cookie: Do YOU have redeeming social value?
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 michael@amarulasolutions.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, robh+dt@kernel.org,
 bcousson@baylibre.com, perex@perex.cz, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--tabkMTr0FaHh+1SV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 17, 2022 at 10:21:06AM -0300, Ariel D'Alessandro wrote:
> Add constants for the different PLL clock inputs in tlv320aic31xx.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--tabkMTr0FaHh+1SV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHm91QACgkQJNaLcl1U
h9Culwf/RPr3IjTPjy4XtWKgvBrp1Pai0Yj0+dMs5dFSjw/0kFwL+B1+1VUoq3vI
h4UkHtRogVAXjQ+ciJgSGz6NRlSjg6rJbuZ3DcYse48EWDrbZj8y1MNwI4Y1AIkm
QjXhSubuj/ahL+jWDJD3R4hXmdP3HrJJehztN73R1/chIwJDmJAXg1zSgU2NBsXy
DXKQRc4meJcv8Poq9gtebfbz2prqrfbBc+GyJsPYPjMVwvC8JSJA0GYGJJG9vmj2
OvRKjjRymO4WEawTzpCydcMlPtnZjUwmPl2u/TE9JamAxFxJC5CCaeybLOOET8kp
Pww0euG+OUvlDiGuAyJ4du3StSJ5Mg==
=v5Cq
-----END PGP SIGNATURE-----

--tabkMTr0FaHh+1SV--
