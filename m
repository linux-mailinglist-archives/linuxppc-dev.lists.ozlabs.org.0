Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2382D3F539F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 01:22:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtpDh4sTfz2yLQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 09:22:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Ha7yOGiy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=Ha7yOGiy; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtpD06HWHz2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 09:21:50 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtpCs65Dpz9sW8;
 Tue, 24 Aug 2021 09:21:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1629760906;
 bh=b0ZxJuwzSUSBcceBjtdBJjO4eyuakOm7MJUOTiuTHLQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ha7yOGiyl+YIm018VL3Cj0FLpQWyqjqrykNErgA3boJOcicgl3KXJUKpsn8Nnd724
 BaQJN/p6VBYxOApjDv3kvrQZlB4xHhNxV4tiji9keSS1WVJqgwWmGYKBTC8UweD2Rg
 Mx/SBkVwXqAq2EJqcCobi71q0Z6k7WH8BaJfZC9zqx+BvWhdKn51FBfFslJRSq7oZI
 B+VJnzDmdo2wMUrdcnfKV1YzypuIb2ifUxId7tGHaTQXHX1XX1m6tNMoVTbTrmQnjg
 2ImuUh24/HRUCPsQ9sF29zPOn0P0bgzEN4AoQVRVhGnpLx7lZDqoarWHDIVGtjgKpc
 Vo+F0AYE2L6gA==
Date: Tue, 24 Aug 2021 09:21:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: build warning after merge of the powerpc tree
Message-ID: <20210824092110.3987fde9@elm.ozlabs.ibm.com>
In-Reply-To: <87a6l8p7kd.fsf@meer.lwn.net>
References: <20210823195540.4d7363ed@canb.auug.org.au>
 <20210823204803.7cb76778@canb.auug.org.au>
 <87a6l8p7kd.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IaClMUsqOS7XXChrmTxxKyG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/IaClMUsqOS7XXChrmTxxKyG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jona,

On Mon, 23 Aug 2021 08:19:30 -0600 Jonathan Corbet <corbet@lwn.net> wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>=20
> > Hi all,
> >
> > [cc'ing Jon in case he can fix the sphix hang - or knows anything about=
 it] =20
>=20
> That's new to me.  Which version of sphinx?

3.4.3-2, its a Debian version.

--=20
Cheers,
Stephen Rothwell

--Sig_/IaClMUsqOS7XXChrmTxxKyG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEkLYgACgkQAVBC80lX
0GyRKAf+IhpB8PEvLXX2i9jJFy5IApkuwZ9VzvkhM6zFrwuCGRXuOtAM2sazlN4r
5H05Re09Swyee032TkLJ16z3Zuy2vaSslA6tYabtRhjGkqUAHMk7LjZEUk9DYOSR
l3ktyWJEWgiFY2nKJO0LZzAayeA8mVve8fsW/FASL51KCczxn5t9qOTK0Nlz2fUN
SSa7rw7oDGnBgx+n/51qyRYX38HYXP4x9G9wSFeoKCBNRrdENb/ZjOh+co3SFk/R
MG8fUyJiD79q+GNi4pJI1jk+zLmxm/8ot6ARwKqSBJpSHLf5Afv7id7pRg/a25UV
/NTdLdw4HWfBGJ6sPzebwH0QwrTkOQ==
=vfmb
-----END PGP SIGNATURE-----

--Sig_/IaClMUsqOS7XXChrmTxxKyG--
