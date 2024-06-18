Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C1F90C544
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 11:24:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3Lt05ytdz3cPK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 19:24:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=denx.de
Authentication-Results: lists.ozlabs.org; spf=neutral (access neither permitted nor denied) smtp.mailfrom=denx.de (client-ip=46.255.230.98; helo=jabberwock.ucw.cz; envelope-from=pavel@denx.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 472 seconds by postgrey-1.37 at boromir; Tue, 18 Jun 2024 19:23:47 AEST
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3Lsb14Hqz3bc2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 19:23:46 +1000 (AEST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 60CED1C009A; Tue, 18 Jun 2024 11:15:45 +0200 (CEST)
Date: Tue, 18 Jun 2024 11:15:44 +0200
From: Pavel Machek <pavel@denx.de>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH AUTOSEL 6.9 18/23] powerpc: make fadump resilient with
 memory add/remove events
Message-ID: <ZnFQQEBeFfO8vOnl@duo.ucw.cz>
References: <20240527155123.3863983-1-sashal@kernel.org>
 <20240527155123.3863983-18-sashal@kernel.org>
 <944f47df-96f0-40e8-a8e2-750fb9fa358e@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TzzIxnkKCl22NOl6"
Content-Disposition: inline
In-Reply-To: <944f47df-96f0-40e8-a8e2-750fb9fa358e@linux.ibm.com>
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
Cc: Sasha Levin <sashal@kernel.org>, bhe@redhat.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, aneesh.kumar@kernel.org, Naveen N Rao <naveen@kernel.org>, bhelgaas@google.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--TzzIxnkKCl22NOl6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Hello Sasha,
>=20
> Thank you for considering this patch for the stable tree 6.9, 6.8, 6.6, a=
nd
> 6.1.
>=20
> This patch does two things:
> 1. Fixes a potential memory corruption issue mentioned as the third point=
 in
> the commit message
> 2. Enables the kernel to avoid unnecessary fadump re-registration on memo=
ry
> add/remove events

Actually, I'd suggest dropping this one, as it fixes two things and is
over 200 lines long, as per stable kernel rules.

(If those are outdated, update them).

Best regards,
								Pavel
--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--TzzIxnkKCl22NOl6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZnFQQAAKCRAw5/Bqldv6
8iXnAKCSkZNG/q44rY4Pt+FmeDt77CBpPgCfeMR7jMzrKnZIcmrU7qCTdt0H+Us=
=WgYp
-----END PGP SIGNATURE-----

--TzzIxnkKCl22NOl6--
