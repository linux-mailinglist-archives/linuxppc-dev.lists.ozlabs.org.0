Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC7F445B11
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 21:27:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlZtW12MQz305L
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 07:26:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=Xtfe0ALb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlZsr56klz2yHH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 07:26:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=Xtfe0ALb; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HlZsn3FBVz4xbw;
 Fri,  5 Nov 2021 07:26:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1636057583;
 bh=yVowgcppiLdZ5nfNTWkKT+Wc+vgom5rf57+IrITpfXM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Xtfe0ALbfmODWt5cHe5930QdFUdhDRbBF9ufK6G0vU+mvL8hOCkwFyUJgRfgDh37j
 u7mritS9hej67J/M554bX/humcIaDgRIeeupz3nT62IVfylBSSwvJ6K+akc7HrtdzS
 ZiQVdzoJX4K7z8v4qwk52K0B/fe0WbzVP1a9JefJhAnjr+xWGYypxftbtut4363on6
 TX205sp/pH4R5F8ZsqKbT9S3yjDxoXEVNrL65pErXJ5H1bN3lR/VWs5IYQrx1HvE/c
 CEja97zz+CHgvCEVpkkqATQgdcrW7Hiy/9ub+fEXJXkW+gMiNZyHOoU33nhAeMSOvs
 ekfLZ28Rsh3Zg==
Date: Fri, 5 Nov 2021 07:26:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: use swap() to make code cleaner
Message-ID: <20211105072618.4afd84a9@canb.auug.org.au>
In-Reply-To: <20211104113351.GK614@gate.crashing.org>
References: <20211104061709.1505592-1-yang.guang5@zte.com.cn>
 <20211104210637.3c424bcc@elm.ozlabs.ibm.com>
 <20211104113351.GK614@gate.crashing.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O=.71vhxXSmXnHrfLh68vph";
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
Cc: sxwjean@gmail.com, aneesh.kumar@linux.ibm.com,
 Zeal Robot <zealci@zte.com.cn>, davidcomponentone@gmail.com,
 linux-kernel@vger.kernel.org, nathan@kernel.org, yang.guang5@zte.com.cn,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/O=.71vhxXSmXnHrfLh68vph
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Segher,

On Thu, 4 Nov 2021 06:33:51 -0500 Segher Boessenkool <segher@kernel.crashin=
g.org> wrote:
>
> On Thu, Nov 04, 2021 at 09:06:56PM +1100, Stephen Rothwell wrote:
> > On Thu,  4 Nov 2021 14:17:09 +0800 davidcomponentone@gmail.com wrote: =
=20
> > > From: Yang Guang <yang.guang5@zte.com.cn>
> > >=20
> > > Use the macro 'swap()' defined in 'include/linux/minmax.h' to avoid
> > > opencoding it. =20
> >=20
> > So if swap() is in the above include file, then you should include it. =
=20
>=20
> It is included from kernel.h already (which is included from delay.h).

And that becomes a pain when include files get "cleaned up". :-(

$ grep kernel.h include/linux/delay.h
$

See commit

  300424acf349 ("include/linux/delay.h: replace kernel.h with the necessary=
 inclusions")

currently pending the Andrew Morton's patch queue (the above is a
linux-next commit).
--=20
Cheers,
Stephen Rothwell

--Sig_/O=.71vhxXSmXnHrfLh68vph
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGEQeoACgkQAVBC80lX
0GwV+Af/QfgNuHshpM97/m+EA6krcPslVh80rCHog7q7R2NBlPt0mHLz115zVfdS
0YvSRA/fUS8LUkDii8JRTxwjvUjXPuPOF9ldSQTH5ACmCYqkruGIiCsDSzkvE+Lf
/lR3W6/ifGUa2b0sDNQANtNwXCy1O6Vu6sYM2PO9FzZdK8+kEwl+JUfYJEtwHBfq
yL2lP/hZiqj/M+huaFEgr+gMTdQhPOsPDFNfPrJkvXE9f7/XDHt8WYXt4t/Ni9EC
bL+nOCdxxargQ+UZmF1pbkx4SbBJY9Xwh2MuAi09QRzyWIFwxoLjvdSGIkkB5HK0
VqZnLGtsn8w1kvLg3+fGk/NF4mFdVw==
=U0JT
-----END PGP SIGNATURE-----

--Sig_/O=.71vhxXSmXnHrfLh68vph--
