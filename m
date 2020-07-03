Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA822141D2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jul 2020 00:52:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49z9Ff0qfjzDqgb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jul 2020 08:52:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Utl9Q+dL; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49z9Ch5blQzDqQR
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jul 2020 08:50:24 +1000 (AEST)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13D6C21531;
 Fri,  3 Jul 2020 22:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593816622;
 bh=++Nj0WS/fbRoG0cYbUYNYqTBhY1hGfBC+wzNoS4TTOg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Utl9Q+dLN0qukZp4Udwg5OOtrBeg3UBgS740gFxT4OZF2kru0R8LXQFFef3WW6dKt
 L9wNatfUbwk4cpgbL/HvYjQnJSYg0BQofovZP3vD86gY11OAySg8Ez+DFhZN/2Q4sL
 c05QdOHl8yK5ujur8V5wVvMa2XqgyTprLVSiAVO4=
Date: Fri, 3 Jul 2020 23:50:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_asrc: Add an option to select internal
 ratio mode
Message-ID: <20200703225020.GB29047@sirena.org.uk>
References: <1593506876-14599-1-git-send-email-shengjiu.wang@nxp.com>
 <159379581381.55795.16716505708033817338.b4-ty@kernel.org>
 <20200703224656.GA16467@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline
In-Reply-To: <20200703224656.GA16467@Asurada-Nvidia>
X-Cookie: NOBODY EXPECTS THE SPANISH INQUISITION!
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
 lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, perex@perex.cz,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 03, 2020 at 03:46:58PM -0700, Nicolin Chen wrote:

> > [1/1] ASoC: fsl_asrc: Add an option to select internal ratio mode
> >       commit: d0250cf4f2abfbea64ed247230f08f5ae23979f0

> You already applied v3 of this change:
> https://mailman.alsa-project.org/pipermail/alsa-devel/2020-July/169976.html

> And it's already in linux-next also. Not sure what's happening...

The script can't always tell the difference between versions - it looks
like it's notified for v2 based on seeing v3 in git.

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7/tisACgkQJNaLcl1U
h9CDTgf9ElvPFLdEUZthk4VSCqaieXYbsCqPXsP+cbaZLW4aECwO25C2crwaAeLH
cP3VDBeRC1DMrnD5GTM4mqkVBkcfjXWVqVZ2BNkWQ3InpSvBb/ofmZ1fjkpKCdrc
UpSq2wrcMeGWf1/rYlpgXdrzV7a5S/RxLJiLU2ipHvs9ajHWV33bGwvNN8ug4APq
QH9RIhvDpWSM4V/D0eT+eIQtB+qdo3Fv/Db6f4fF9Ugn2pquAqZ4bmzvniqn2Et2
zMDgEDA34cgB4Jm9D2Le7X9ySsROTLwpPv+XbsM8Sl2f/slHeYRHTr3vW4kJFBhG
jkjwRIcv54fqhLCkLPFqhPvLLoMKcg==
=gzcN
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
