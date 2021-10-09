Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C934278F1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 12:10:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRLQp02ZFz308C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 21:10:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QReHgQap;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QReHgQap; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HRLQ53BX9z2yPv
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 21:09:33 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 799EC60F39;
 Sat,  9 Oct 2021 10:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633774170;
 bh=PcZTlVUoRO0v3fStCWDQqZx4WjGTWewJvWPfxDSAalw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QReHgQapG5OhgfbWPC+FKVCF3a9U0ZXtcr7MUtnFFWVTNQh29/iVk1ZE4L2F1Bl3i
 GTYKYJebQTMMk3FNCMEEHtQphyCxWYpVMyJ2ElykrGSc77rcFc0JkcUCMe7j2VBMnH
 knmNyLS2i8cdEsF64vCmQDBlSLZ61hCkwuR6SLQlAbuBsx2sP8wWj/P/BRs9UbTO/Y
 92VXel5rjvGO9QfTTmh1F0hKWgbod61mlMPiCbkQh17KUkvOoK1jyIr1JluEBJx1xE
 d8aJTmEH3PnvAxFkAExewiB4KnzMg+L9OiivEv1/r+8DdS/KhqDsk/69Kh417aGx1m
 wwsciSQRkoJYg==
Date: Sat, 9 Oct 2021 12:09:22 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v2 10/11] i2c: pasemi: Add Apple platform driver
Message-ID: <YWFqUuc7I5Dh8+w6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Sven Peter <sven@svenpeter.dev>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Olof Johansson <olof@lixom.net>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Stan Skowronek <stan@corellium.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211008163532.75569-1-sven@svenpeter.dev>
 <20211008163532.75569-11-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pa4zh0vK2aQo9jrs"
Content-Disposition: inline
In-Reply-To: <20211008163532.75569-11-sven@svenpeter.dev>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-arm-kernel@lists.infradead.org,
 Christian Zigotzky <chzigotzky@xenosoft.de>, Olof Johansson <olof@lixom.net>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, linuxppc-dev@lists.ozlabs.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stan Skowronek <stan@corellium.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--pa4zh0vK2aQo9jrs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>  F:	arch/arm64/boot/dts/apple/
> +F:	drivers/i2c/busses/i2c-pasemi-platform.c

We have no dedicated maintainer for PASEMI. Are maybe you or your
project interested in maintaining the pasemi-core, too? I guess not many
patches will show up and they will likely be for M1 anyhow.

If so, then no need to resend, I could add the extra line while
applying.


--pa4zh0vK2aQo9jrs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFhak4ACgkQFA3kzBSg
KbYkgA//WnhdZAP6wNE36K9Ir6Rvq+uGigwqqIc9f4+xhws03fLc9VetKwYDmi7j
KuMzz8LOP7WmN+FoW5W9tXxFLyV6bDx2r9y4owf/gITy8tlNfxcGAfXLXeLbv5yk
Km1BZUxerGidAdDMQGT7dc2PHP/3mr2cpdemRyss8/nfvBq7vJ9yPDLE4rQyEp+1
6c6s3ZqLfK0JmYjpynn8zNPlX9uNAY2sNBFtUklFXDCJnexUBF+dZwFgfTJWl9zy
RVgJu66nY5gqJxOc6ihHU2hh7C1IYvv8tsbAzSuS13lID9youf51HC3YIU58xRau
WUWuBoEXIqdEKkhCG0qp/lRWqJiZseKE7sXDFV4stE1k7PvvT94BtPO5zasR+D7h
U4XikNjTBS0K6RNAtj0AkEf+PLjX50kTDcwhDI3LjDT7Skrh+KROGDvXL9oYZr5T
iIe2h6fG3cl2o7ntTdtdWxAF1+FWvP7ouPVsU3BGqn1fZd6Tu6K8dZKL1DQeWTgx
Mg+3cAO9mEWQfYkYA11bCUTzFYq3tjkOCE17cHRe2yHD/S27OdWlYI2C1GXQ7CnU
oBFA7leBisLY2Jdacpjufjjkc1Vz/h0wDeB13l24HTzJOx+QOrbOp3xc1zkUUcWs
BYdsnydMoMz+r6tGEsDX+ur0ON72SZqqHhT+nOSnKdvTSHvku+4=
=2OAs
-----END PGP SIGNATURE-----

--pa4zh0vK2aQo9jrs--
