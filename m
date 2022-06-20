Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2870F551FDA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 17:09:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRY3N05gPz3cCW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 01:09:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oavu5I/Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oavu5I/Y;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRY2j4Jqnz3bkw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 01:09:17 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3CA4E612BC;
	Mon, 20 Jun 2022 15:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05906C3411B;
	Mon, 20 Jun 2022 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655737754;
	bh=UowpPsN4dwRx6/3c+/Ap4rkZrDx0R5Ze0ezebq/G9JI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oavu5I/YbxUqRbE8zqch6EIX41XpXQI0joby5hziQYwFeeIWNJveoetauTksx6kJw
	 s5pkjUDxIHrbUvMJl+s7e42XXKBDikIs68DDJZf4HSQg0y6J3DC8Ik5UGJrO65M4Wz
	 LNYUzn8xexo0ZssOhcPIC/vuo2Tx+puBCStNSyNXN2YReeF0h670DBH0+DTtfKOL+8
	 RjOkUGkfPTj79Ts5qJrRVEDHJnTnB1BJYboaD/euBwpua/gu6LAbwnt16aVRCsX2Is
	 DRsq3GXPwwjqNQl3dt7SG/Jp5M9k+SQBJ5sQbYyZUUL0beI3tc194vHcuTxyexU69G
	 gOhT0VZsNTZmA==
Date: Mon, 20 Jun 2022 16:09:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierluigi Passaro <pierluigi.p@variscite.com>
Subject: Re: [PATCH 4/4] ASoC: wm8904: add DMIC support
Message-ID: <YrCNk+g6Xh7uC9fg@sirena.org.uk>
References: <AM6PR08MB4376C690036C5558058C4F16FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4wRJYg8FNZuITX9R"
Content-Disposition: inline
In-Reply-To: <AM6PR08MB4376C690036C5558058C4F16FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
X-Cookie: Good day to avoid cops.  Crawl to work.
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Eran Matityahu <eran.m@variscite.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Alifer Willians de Moraes <alifer.m@variscite.com>, "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, "perex@perex.cz" <perex@perex.cz>, "festevam@gmail.com" <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--4wRJYg8FNZuITX9R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 20, 2022 at 03:03:50PM +0000, Pierluigi Passaro wrote:

> > Via firmware description.

> Can you please provide any reference approach in the kernel code ?

git grep of_
git grep fwnode_

and I don't immediately remember what the prefix is for ACPI functions.

--4wRJYg8FNZuITX9R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKwjZIACgkQJNaLcl1U
h9DhxAf/QjS/aWkP17En2BvW+Gr3yNc/jrpVJq7UvOIWIXQbGH3NWey/fDtsW1Q8
SfV0/JZKiG69wIff6Plva4R6TMcU9FuJTlbb5wnU3Vl/IbY7sdG3tXh6epyt5UBf
xBKao3u3lpErY6OUF+xU6m9qf0MPlxGMVYgvQOOuJfE+0T6IBbS9fVSzr0assttw
199iCsBk1c+0dF/ZufZubBpZUk6Y+b+mmEDQ/4GoM2bsutX1Nw+EIqUw+HWK4YO8
CCltIK18dFjMm3bGhsEBCBcJCox0neYaCKmGhO9zb7YUTFlppaupdblWKBF58ylX
BJCFh2F9Ue/m0syfrLOvA169USrKNA==
=buGM
-----END PGP SIGNATURE-----

--4wRJYg8FNZuITX9R--
