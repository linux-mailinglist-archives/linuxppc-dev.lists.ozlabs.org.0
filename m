Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF0144516B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 11:07:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlK7t1BJhz2ynX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 21:07:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=isvl7dbJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlK7C0qqTz2xvc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 21:07:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=isvl7dbJ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HlK770t1Gz4xbw;
 Thu,  4 Nov 2021 21:06:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1636020421;
 bh=awT5bBlE5ynUwEEralGSrwt9ezjdXHOlQ81tJVY4khE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=isvl7dbJmKRaelsWXioQXmkjf4E7VBe87nOvKSM2A6rlPyoqNTtwQqcf287ZgGi8H
 TFhLjw3sPDYTJL6e2ZohJjVRbBVkZZLCZDQC8XcxIb0Okb/JkQlzHswyIzekKwttgE
 9XibYyZ9jvue+BTa2Ndb9qxKcmLlquDKBI+cLmS1IipOQpovJTRU5XSevFvvhE4C10
 S9RzEvj7SvIxomSXbDfalToOdErzRNwvpj2kawa8oBSRckss2kMCrHYIeavbWcBlZH
 6quyoZQzg4oGvcBQcyCb6+zw4ZrFjZi7lF0N6mRhX4qV5BqCusjTKyR3UtotIu32t1
 tzL5isucUalcw==
Date: Thu, 4 Nov 2021 21:06:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: davidcomponentone@gmail.com
Subject: Re: [PATCH] powerpc: use swap() to make code cleaner
Message-ID: <20211104210637.3c424bcc@elm.ozlabs.ibm.com>
In-Reply-To: <20211104061709.1505592-1-yang.guang5@zte.com.cn>
References: <20211104061709.1505592-1-yang.guang5@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R16OcEvAD708zS6cRq.O30G";
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
Cc: sfr@canb.auug.org.au, sxwjean@gmail.com, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, nathan@kernel.org, yang.guang5@zte.com.cn,
 paulus@samba.org, aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/R16OcEvAD708zS6cRq.O30G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu,  4 Nov 2021 14:17:09 +0800 davidcomponentone@gmail.com wrote:
>
> From: Yang Guang <yang.guang5@zte.com.cn>
>=20
> Use the macro 'swap()' defined in 'include/linux/minmax.h' to avoid
> opencoding it.

So if swap() is in the above include file, then you should include it.

--=20
Cheers,
Stephen Rothwell

--Sig_/R16OcEvAD708zS6cRq.O30G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGDsMAACgkQAVBC80lX
0GzJQQgAg/kH3K8D26DLC1G83icbaaUB7A770GEvFjsQW+93XumOEFQQ/PW9y9Qj
SAWzu/UnEGWzoNcxNtrc5zB0IgOHqpg32KkwjK2R46p2h/SogfaWVXD3POrLwMMg
w1l2V/36ORlDTbURwwBuPU/790L7ZY8q82Xhhu6AMWcB4Za7TerOrrOhi4+uVP4w
fpCAP+6KFhUyHwIvS/uK7AH7BwEugJSjk07b4A6hGwlx/AoloQFIkdmTXZ1jLHkS
AVEeq7x2dD18junmwjmXJe09HLEAuqNccA3uRLCS8gL+3tq4iPTc4+bg5lslznis
sjJ0cFMBlDbJSaG9hiEwa1IqoOHMvg==
=h+K3
-----END PGP SIGNATURE-----

--Sig_/R16OcEvAD708zS6cRq.O30G--
