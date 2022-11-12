Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0A4626BA1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Nov 2022 21:34:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N8nNx2wm5z3ccl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Nov 2022 07:34:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MIE7fKaL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MIE7fKaL;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N8nMz6nP2z3cHh
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Nov 2022 07:33:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D7D4460769;
	Sat, 12 Nov 2022 20:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA5FC433D6;
	Sat, 12 Nov 2022 20:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668285212;
	bh=x9mkEkI4TNpYNRcWCN2Z41iUCjKp0CTsuCucKloZ/Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIE7fKaLooueyS7ffe/2vtQLMHa+T0yPMNEZlPv7hRikkO5Gj71D7xgU0S4qoGot5
	 jG1+9Zgqh3kwbLEIW/xLCttX+laPnX8fB99qrwEFuvp5IN9K8ZkK4Sww563so3lNKU
	 DfivKvyBM6y5YPb1CrMA/w18YrPWYeZnJsA9yl9Gf6ste8unff7Cyd8sGbdl3rbFQX
	 JL703DAxE9X/3EXH1yjNqI7yrySlUXshgpcelDzXgD148p/9li33qpOYZYfaeS1F6g
	 OSUX71HTTi/QIP8oQfV6Ct2qhiP3/fKq5quyhFSRWk5tgxIYvFjNPex3wNfAouPCMP
	 IiteRznpkjhgw==
Date: Sat, 12 Nov 2022 21:33:28 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Arminder Singh <arminders208@outlook.com>
Subject: Re: [PATCH v4] i2c/pasemi: PASemi I2C controller IRQ enablement
Message-ID: <Y3ADGNw6iDEDTezl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Arminder Singh <arminders208@outlook.com>,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Paul Mackerras <paulus@samba.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	asahi@lists.linux.dev
References: <MN2PR01MB5358D35DEBAB82A80629EBB59F3A9@MN2PR01MB5358.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mPWs60l+c46WSwEa"
Content-Disposition: inline
In-Reply-To: <MN2PR01MB5358D35DEBAB82A80629EBB59F3A9@MN2PR01MB5358.prod.exchangelabs.com>
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
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--mPWs60l+c46WSwEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 05, 2022 at 07:56:49AM -0400, Arminder Singh wrote:
> This patch adds IRQ support to the PASemi I2C controller driver to
> increase the performace of I2C transactions on platforms with PASemi I2C
> controllers. While primarily intended for Apple silicon platforms, this
> patch should also help in enabling IRQ support for older PASemi hardware
> as well should the need arise.
>=20
> This version of the patch has been tested on an M1 Ultra Mac Studio,
> as well as an M1 MacBook Pro, and userspace launches successfully
> while using the IRQ path for I2C transactions.
>=20
> Signed-off-by: Arminder Singh <arminders208@outlook.com>

Applied to for-next, thanks! One thing, though:

> +		while (!(status & SMSTA_XEN) && timeout--) {
> +			msleep(1);

Checkpatch complained about this one:

WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/t=
imers-howto.rst

Not your issue because you were just moving this code around. But this
might be a candidate for future improvements, thiugh.

> +			status =3D reg_read(smbus, REG_SMSTA);
> +		}


--mPWs60l+c46WSwEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNwAxgACgkQFA3kzBSg
KbZOVw//f61IwAT3+7pj46mSdeCMBH7jTcgwvVsjRoNpCQYTRVCwnNjdlYvK8ELR
YNm1MwWGBSxVyEzo3Aveyv37A0JGL03Ebk254NaMLM1Uo0NNXazxu7986Uw/e8xw
NhlzbFoSyH3/z0RjeolsfsTapWIHDG3URJwXCVFhBavB7pECzX4J9EW2a9f5la3s
/I/82rlp5XMQ2DGQBg74V7DOikuyg9C8zjobV4ZS6bNSeR6z/NwOgPuUFigQ95W6
RuoAcQvc+5L2chm9DTOygBapALqxzTU0UD+PYjWAOtEaUzfkJiktulRN6S2kqiET
uP/hUmONrylPox+Uj2Cuzs4iu/NBSwM6tlVQmlSpsSGcZWIuv+Yk0/ZYZJqtrmGe
jVM75X0IqaT2cmL4cjkmtjn5MZAV85RK0rknrvnoFan34+DzDo7k50spmotIhTql
WuRrp6l7id8VH0I43BULUyGiQJo2rxUiaPb/dY/BFlPPXjd3AwCkxPY4/uwSqOn+
/hOMjquEXb6kOoW18OD13MiiN0y4dcfDVPwccBp4uVEdC54VMEHFyMGwQwtYjadx
IQHY0iSbMO33hLAQ5JLo6svDW1/DssP20QZU1r4tq0l3iVGZwuDm/ojAKsJ/jeaF
Pqt1AqSxcJ4DCThgcLnmufmYy5xBiEV3Cb4YltmVmLJQ4g5YFUg=
=b5o0
-----END PGP SIGNATURE-----

--mPWs60l+c46WSwEa--
