Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8489533FF01
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 06:44:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1GF83slhz3bxq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 16:44:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rc0UIGu7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Rc0UIGu7; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1GDj4nQBz2yQv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 16:44:21 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7BCD164EC4;
 Thu, 18 Mar 2021 05:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616046259;
 bh=d6af8rjjSi2t3Ya2rM1cTKrbkpK3hPDilCyxjQaGlBA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rc0UIGu7CI4Y4tNPh6UTjIr6a6gGVZ50NwNuJF8ZBjmiphXlK/JgpQxKGuLhMcfj9
 GbaA57am7o8uIv0hMk3U+J0BM3ZncxsHmfHQ4hYKbeKdYIf4pSUQF+9u0uNrWhCEnQ
 YeJdBCSShbw6+kibZxfwAKLx9XrgLieGVU/L41NWKMXGUIj8aq7xabnLOVJ5y3ep8S
 9rQqumbjY8xf8IeFxcUoTwBLUganICe0CcO9qwgwDlUr/aUDwCS3nHuD4B5qkS4kTB
 QO37X5uSvqco85+yWXosbv4wU0Ftc7OFo05xOCkUNZFKWY118jsjReNPY/Y0uQuG3K
 UKuvEV9effegw==
Date: Thu, 18 Mar 2021 06:44:15 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: Errant readings on LM81 with T2080 SoC
Message-ID: <20210318054415.GB1053@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 David Laight <David.Laight@aculab.com>,
 'Guenter Roeck' <linux@roeck-us.net>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20210311081842.GA1070@ninjato>
 <94dfa9dc-a80c-98ba-4169-44cce3d810f7@alliedtelesis.co.nz>
 <725c5e51-65df-e17d-e2da-0982efacf2d2@roeck-us.net>
 <1a7d43e6a16c46cdbe63b497b29ac453@AcuMS.aculab.com>
 <ec89dfda-a321-6ec7-9da0-b4949f1f28b5@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline
In-Reply-To: <ec89dfda-a321-6ec7-9da0-b4949f1f28b5@alliedtelesis.co.nz>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "jdelvare@suse.com" <jdelvare@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Laight <David.Laight@aculab.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 'Guenter Roeck' <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Probably depends on the device implementation. I've got multiple other=20
> I2C/SMBUS devices and the LM81 seems to be the one that objects.

For the recored, there was just a similar case with a DA9063, but that
one luckily had a bit to switch from SMBus to I2C mode, i.e. no timeout
handling:

  [PATCH v6 1/1] mfd: da9063: Support SMBus and I2C mode


--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBS6K8ACgkQFA3kzBSg
KbZVmxAAqwryS/bFzwCneErKw/kPhqTdQshdZeigjwzRhyd7LuOFinLlMZceJHXc
84YD8l2nZ8mCvOLY9dICpTEXlD6AhD5g5fa9JlXR5ns9XYSLBZ23Va0Y74lA6i5L
RHi1jeknvEZIGjUBiMwX6Tt/yVAprILjYhaP+Gmt3sMQqNm1ixC7G475npgpyvLl
gUiLewJlAMMVW7n9U7Gx0YS8Gyw9NPvFnKy+qreSQS9Imid+g8L6X9M6SZwGaYwJ
hYXT/3i7Suj3Or9/+9ruDpYJk7qIIYZW5aclTKoICUC+sWyF1ykk3O1afOCDigfd
cmEV2HUMWsGeD5w6mKMVOH2UckMtUK6ZMMwZJlJNUx5hMygcdCOOAm/pY+udLnV7
afYKoH1DHNJG9MpvESHSjA5muOAUmd0uryXMVs9KEC5iSBf9DCa9Rc+X2x6eZGbv
+xWAKfLRqvvF6X0u2h0mO563+zZpKtRlZsxuCyFjibS1KQ3VmQg4sGxo/n+oRbLd
kgF12d4NNLXC8AQey025OaDpu0Su43+J3MKQXOpFaWqzt94HyhUZGGttt20JLJIv
QgfKRdXG8xr2/gANyRsQvH34NKWOZqDMHjodTpRBbP8FfX03tzGMLkcqaE6Vt0qw
5y/M1YQjtTSDQ9ftFajgSYUsknhXgnjxWNSyUMKnmu3A4XNeb2c=
=Syxw
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
