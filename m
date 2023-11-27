Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EC87F96E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 01:49:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=GcUYbfoq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sdn6n1hc5z3cVn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 11:49:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=GcUYbfoq;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sdn5w4ZTNz3bZr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 11:49:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701046148;
	bh=eSSxfkaF6P/9ehL6rQMSgiFTpLmH2PD+sC91+LhZ+yg=;
	h=Date:From:To:Cc:Subject:From;
	b=GcUYbfoqsih8uNPaOHYo4osjcgTl4ckc/GODFIb6X02PjujOpZ3ldue4YYmhvZVC6
	 ETFr7HJ/0oZNwhGs6BNkh1APzDQ6+OafLU5d78H/jVpwOYSJHIrvheObyOJEUzgqb4
	 jNivkc3d7fjQq/b5tOchDfLyZgkHsw7YIQQeSPrdYnue5kh2Qj1P8mws+mPoZ76sNy
	 RprogQmelI7zH3Te2zVmM18e/WnwK8BeL8en92MsxkUUusGsYOpq/8La0eV4xkNcWV
	 EmZLh/K43FvrMP+Fnu90KdviPYk+yDUUEd1RD33qbaug1smb3t9UbORrCkCpKCu809
	 fm7/e+Xs+C4nw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sdn5t6sG5z4xPL;
	Mon, 27 Nov 2023 11:49:06 +1100 (AEDT)
Date: Mon, 27 Nov 2023 11:49:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the tty tree with the powerpc tree
Message-ID: <20231127114904.77f7efb6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s_bmlMboQn5EzX+dtDeXWmA";
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/s_bmlMboQn5EzX+dtDeXWmA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tty tree got a conflict in:

  drivers/tty/hvc/hvc_console.h

between commit:

  c9e38dc90e1c ("tty: hvc: Make hvc_remove() return no value")

from the powerpc tree and commit:

  7f30c19caf94 ("tty: hvc: Make hvc_remove() return no value")

from the tty tree.

These are slightly different versions of the same patch.

I fixed it up (I used the former version (removed "extern" from a function
declaration)) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/s_bmlMboQn5EzX+dtDeXWmA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVj54AACgkQAVBC80lX
0GxMywgAk/KriTf1x1WfY+DGKeTl2pHJPX7vqhJVQjUH5B2KlePP04tpJ4LlJOa+
OArcCKA49+0eAMPlSJq+pTavBg9Mz8sp6uHOXq6J5TZMae8DzMDba1FmeLy6+dOx
q4F4nOfGY0d/eCLSbfupoKYPCkoMoyTt9ODGF1GsvQsbina13x7reQVw//bwdJ9Y
jViyH2rfeWMWzsZGyQ9OUObxOBmo63SFxsNyWSYR4bQt+sZ03/TRi+5Bx8nFQcJ1
+xuQp4fK4FKc98wtQAKxOsyF0gjaAZr+Hsbi+fxg6YGAaLkPN0A1j7StjMhYeuDe
YC2/oWHfkcGBAJtpiW/adAxFULACiA==
=1s/D
-----END PGP SIGNATURE-----

--Sig_/s_bmlMboQn5EzX+dtDeXWmA--
