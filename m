Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F038F171EA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 08:48:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zRrf2TWJzDqGT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 16:48:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sirena.org.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Qsn5PZyA"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zRq72k6szDq6k
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 16:47:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JL+LbvhP4oFaheRjv1trtE6LxKEuCxpw/hxnybibOFo=; b=Qsn5PZyAJb85n6FqIXoq1Doyz
 kbkc0hHAcXtVzfw/JBOHJ69xaPfVn45wJxDEG19KUWUmYVOuKaJm8+O/G4lI6RgJHEyV7mMo9XBML
 nw1V6KwivS4K8ciuY109zuFeuteox5h4x87lY42q0sp6+Qg2/6EqKtAKh6XybsTrQeNYk=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOGM0-0007Ah-RD; Wed, 08 May 2019 06:47:01 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 19A1744000C; Wed,  8 May 2019 07:46:51 +0100 (BST)
Date: Wed, 8 May 2019 15:46:51 +0900
From: Mark Brown <broonie@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH V5] ASoC: fsl_esai: Fix missing break in switch statement
Message-ID: <20190508064651.GO14916@sirena.org.uk>
References: <a2c4e289d292ac0e691131784962305f8207a4d8.1554971930.git.shengjiu.wang@nxp.com>
 <dc58fb7a-dab8-2ee0-43e0-76da75ca2e0d@embeddedor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lBnNT+4yy4PYvQEb"
Content-Disposition: inline
In-Reply-To: <dc58fb7a-dab8-2ee0-43e0-76da75ca2e0d@embeddedor.com>
X-Cookie: -- I have seen the FUN --
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--lBnNT+4yy4PYvQEb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2019 at 10:59:00PM -0500, Gustavo A. R. Silva wrote:
> Mark,
>=20
> I wonder if you are going to take this patch.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--lBnNT+4yy4PYvQEb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSe1oACgkQJNaLcl1U
h9CRVwf+J9kZp0ZGivYa2xRG/gV/6+6GHD70rFDgUlJM6lyD5Sr264ngHIIHZt27
YTxbrddXS+2NIcXwPl9j4eedxLJAXhjpoXMmRl2GyESUp1RS9GJpe4c8HfY4fkRn
TO7sDDFXMnFzXfI16ITdJFcrH8RXhPYkh1rYqLXkVwSYwImRLe4nbPsvmSQkG9a4
0x9yMs3yEAC6jCN0HF90Zq973JpS0yopSjEHwMCgmWo0oop4myuowyxhdE+fGP+g
kBs9soUAjBx8kAPvfXQoDJ5eszn+jX6uYuwb0OPzmo1TxM4JyzEFb4mgdR0yIaoC
Gp7eTnQ86sEao0Ju9pY+yfmZp9fz1w==
=wKTe
-----END PGP SIGNATURE-----

--lBnNT+4yy4PYvQEb--
