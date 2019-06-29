Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 912865ABF5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 16:54:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bc8m1wXRzDqwT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 00:54:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=the-dreams.de
 (client-ip=88.99.104.3; helo=pokefinder.org; envelope-from=wsa@the-dreams.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 45bc595cbMzDqBx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 00:50:50 +1000 (AEST)
Received: from localhost (p5486CA23.dip0.t-ipconnect.de [84.134.202.35])
 by pokefinder.org (Postfix) with ESMTPSA id 8832F2C047A;
 Sat, 29 Jun 2019 16:50:46 +0200 (CEST)
Date: Sat, 29 Jun 2019 16:50:46 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Jochen Friedrich <jochen@scram.de>
Subject: Re: [PATCH] i2c: remove casting dma_alloc
Message-ID: <20190629145046.GA15093@kunai>
References: <20190629113424.GH1685@kunai>
 <7ae3d130-b835-4966-b21d-3ad7dac86046@email.android.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <7ae3d130-b835-4966-b21d-3ad7dac86046@email.android.com>
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
Cc: Vasyl Gomonovych <gomonovych@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jochen,

(could you send text emails, please?)

> yes, I'm still here. However, I don't have the hardware anymore to test the patch.

Thanks for answering!

And besides (not) testing, are you still open to review patches to the
best of your knowledge (I neither have most of the HW). Or do you prefer
to orphan the driver?

Kind regards,

   Wolfram


--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0XesEACgkQFA3kzBSg
KbaPXQ//Xvup3+1jm37VjITy8PSk0B2UjosZjmJCGl9ykh+j+UYzKY/q3UfvVXrp
tc5aE3n9/XFqunBDFAUEBlY9HypfXN8G7xuFdaLF05JQleXaAszs71FyShW2unai
+W4isfkuoHPdByseUryjv0DUFJ9Z/AEGZ1Xrku5BUMVmNq0QsN2f8vmk4akI9ffc
Px4PpiN+u/pHZdXPuoDU34ok6QOWHo5jNWGa1gNXPGK4QZ79je+9Av+3UjSLkB8g
NZk0VjbAbnufS5kWMbxAdQ7SuC28AefPczCSHe7YYXCSa6VK4nhXs0JKOcaY0C6d
bwS6B9eIe/6VQKPhWdPP2bprENNAPnITWvn+TKR54VlSrk+1gR84Wi4tZ7XplaaV
h6lsJWD5W1d8m/LYng/04JQuPFkDcq/U+5BWufR1NgCVZ9Lwy+Ue99QDcha7FYbM
rT0KiLeEFNeg2FtsVCFDYaYfMhaG/m9fN1L3oJ7Xw0gXG6jTSF8ylaRhyuMzAwHb
OK6a05BUz/xzfsGnAKQrSDyDuqNGzEDO1t7YKL+RdHSKtY5wO2HnrJnLOTEXS7i8
CFYy38VwdLYPCUQaxIn/bUCFcxkSt3wbcGsq5lVrsb6Y9lbFOHDZFmJVgszKgzpW
KdIkHVD7ASnTqAvI8SODB3vRt0U+u9MFU5fx94BSUcLO/mmxbOA=
=ucl8
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
