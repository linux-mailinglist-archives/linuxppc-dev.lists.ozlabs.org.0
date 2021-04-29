Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 260DC36EF21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 19:50:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWNLz1C3Dz2yyK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 03:50:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=g/RWP4q9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=g/RWP4q9; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWNLN3bRhz2y0N
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 03:49:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1619718565;
 bh=TLR0WvaxCXxogG6JvG/nF6/gcp1ajg6LXdzIQjIi9T0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=g/RWP4q9tDttZ6BrquP/DE7GLTvO+LPkfhaotfKv0tHvKJGoiKr2SIfwvAFqctuu1
 V/cF5hZ07fPnCatktURFBin7WDymP7dOfsbiYSqScI9y0tIFOIJgsb/yK3GngMZAXE
 Fud3sXL1DwUlsGtSHrxtrfZrQfZ9OQvlnWCrSB5o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.126]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhlGq-1l7Dgz1AA4-00dqDI; Thu, 29
 Apr 2021 19:49:25 +0200
Date: Thu, 29 Apr 2021 19:49:21 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32: Fix boot failure with CONFIG_STACKPROTECTOR
Message-ID: <YIrxoYIjH9L8Fqzs@latitude>
References: <b688fe82927b330349d9e44553363fa451ea4d95.1619715114.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CW+PUTTtArehJYIf"
Content-Disposition: inline
In-Reply-To: <b688fe82927b330349d9e44553363fa451ea4d95.1619715114.git.christophe.leroy@csgroup.eu>
X-Provags-ID: V03:K1:p4FsD8KQFCU+14fTrKsidcY2qU6TK0OtAyTVpjyVZyQKuM8vl6m
 iMV4YtO4iGzKV18zGjOPFsslKE7to32t6qSfqnOpq6xAbPYfqJCNQCVCxuTsl8y32h5CAF8
 WcMqSVxfNJ/AXDMyqqvsLZ7qBU9M7jNYN2HZ6wUTKPZCsUeOPYa9X2yNHPb5SP4y5adVS/u
 u6fWyk115xLJt4AbVMCcg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:i+tmxP5GTFI=:o42bVvRz8nG0bH0XGZ7uoy
 bKuo3mPBoAH8V07Cr5om352RpmiSWswq+Kj1vPze6//jl3NVA6xe4MkBanVAVh1B8vD69Tqnx
 Vpg7gI4yxqc3iJzRkIS5iCqBlbdYrNfa6M9KER8ZKk/Rg17IRn38ohYZOi6Ur2cxnQqQRAAzK
 3ij8CkqO1uuyxcgix3lAFN2Eu+eExfF/O30D8rAhTWAxdHAyHJliTw+7cbJrCdP9ID/PqxRZF
 77dMdFkLFGm+WclBqp2P4wMTe5wERdP6bYTAkPoRIIx37FzRo4w4QvvO8/HBPl8MDWFJfe/cH
 L/QE3XhY/xai2d5G/xfO3TGLlYX5szZ14EeHveMWy7X6UfWrCt8B81tBkT3BB1x28BnCT6AHj
 6itkKFYGRDXzsIXPc29KI61N4ztSRGJUppTYNx6DObe08pEiHfPsTNpmiccRpUx60lNJNn4TC
 V2TFwSaEPI6aubd3PJh3tkGANpjO4OKwh5IXNdQipyUIqG93AGETf5FsHQe6mLd5i3DG9f1nc
 GY8VC/J0fKDuIxp9495QaoT6zWl4zkMIFMzGO4dyZ0FbbhI8yrogAAbCbMhGb4+WNJiNPfzT/
 8WL05l50grCLGIoBVNtwzk39636Qkw9XqVu16gC3sonyoOO+AoUX9twxOo3SChbaQ+CcOfbz4
 aDjbEJ2wlRJNBMCu7P4XH124AA9OPABNSUtjVe5HnMs3Df60sycf0m28vG0rWtNhb49NZJ1zX
 zuHPdveoNS9q1qwkc2TkXzsLYsM/5UQ6hDRbxvUFwtmdbHp2edTTO+pGohUfypNfGsBxOx2/o
 I0T/bhQV6g9RaeuWON+rP0AAGQj89HisFZogjo9AJZXc3QbWJLvhNGSDSRhXNzPpnxJAOIzKT
 R2LFTuUUbDOmiHGy34+KB3RSIjiCBO58zBe9bSjGG+AtCtYu5L96xAyoCvy++oRp43WhavRJp
 0QZgj5ssmlEtjaSrGws0M28cvslbz/1U8AjZe3ZFCPWDdjHgWzMxKlYbIvGSRpdAb2Bkwbf3p
 a5Fhip/l67l2skvlmKgPqtaT3Lzfum/fsswzgGnuq9BIooqBd5Q1r0khA1vrDEzWluG93TnOG
 cNRt6gaLP2ZR0WEuAgj7GHUc6Ii7vurhPpkjBes7aHb9FSXV3iIeZrfZH681Kn3m6vRXvZz5g
 jM0/GD90j586xNpoF5IGxPVswEQN5qV9kDa/sk697B5aXbmvDY0tH/Znc4x4zlwZiatjNm4OB
 SHFb8ygTfoS3x1wah
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
Cc: j.neuschaefer@gmx.net, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, jniethe5@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--CW+PUTTtArehJYIf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 04:52:09PM +0000, Christophe Leroy wrote:
> Commit 7c95d8893fb5 ("powerpc: Change calling convention for
> create_branch() et. al.") complexified the frame of function
> do_feature_fixups(), leading to GCC setting up a stack
> guard when CONFIG_STACKPROTECTOR is selected.
>=20
> The problem is that do_feature_fixups() is called very early
> while 'current' in r2 is not set up yet and the code is still
> not at the final address used at link time.
>=20
> So, like other instrumentation, stack protection needs to be
> deactivated for feature-fixups.c and code-patching.c
>=20
> Reported-by: Jonathan Neuschaefer <j.neuschaefer@gmx.net>
> Fixes: 7c95d8893fb5 ("powerpc: Change calling convention for create_branc=
h() et. al.")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---

Thank you for looking into this issue. This patch does indeed fix my
issue.

Tested-by: Jonathan Neuschaefer <j.neuschaefer@gmx.net>


Thanks again,
Jonathan

--CW+PUTTtArehJYIf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmCK8ZoACgkQCDBEmo7z
X9uuchAAyWiE+icouGPWkwy+BxaJD2oISzzlCt6AJmVAmMvTWHn8349SsLXQT1dv
5U1GaZfRluK6DXSaBQGv5LTSPw/Z1Z3E27XVF7kaAGDnWEeulQ+69aMwSGnZDxQX
qMASPo4X3MEIi4f/ySa2/ksXTLXsIZtJxnk8V6x0q+rOyilHVai4ckKMSBG6/QcC
/kACTtq2ttol/U00I40uqvQ2Hk54PSqs54T0JXf5QMlns9Tcc2B48ynJCQBv3lJP
IKUwY53kmvSTgYW3x8eHyYZ/JU5RcRAQZS9lH6/Fccp20r61itbVh+r58jyew/mP
9qoe8LwtEb+cJq7npQNs3fdghpaaLyCJR1eUgperrOcafEBSSrybZdLY+46f6P7+
ZwRJsPNno+PLjAC+dvcxZNcYcwkRzv2JzRbbI95ALHoFkAmTb/DTErAbKYi/Gc9d
zyglAc9nc5LQPDyqrxxp5KQU4dAWeuBtz/40rVEKv6kF6hFuVop05by+57aaYmzy
Sdy+YrxR9OBCxbl5orzgCDneA65COm2m4YwapT3pfjE/9qxC/mAIjxksj9ejkPeH
XMsTMxTh0YV3KxmlVk7pn5oljn8aeauGc0uOdo6dt9ATnUHxqVzCMN2HMWcRLhPG
sHsffOO19NVAWbBXGOyEB70tXX3kCIBp+Oq/wiGFGBwqkyVwE0c=
=vmtD
-----END PGP SIGNATURE-----

--CW+PUTTtArehJYIf--
