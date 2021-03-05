Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3561C32DEC7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 02:05:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ds8gR1jQ8z3dBY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 12:05:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=PnLAC90/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=PnLAC90/; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ds8g202K6z30GZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 12:05:32 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ds8fs6YM6z9sWD;
 Fri,  5 Mar 2021 12:05:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1614906327;
 bh=uNvFCAO2+/dn7zGMlkg9As9h70Dvz8K1kFCotm7Xju8=;
 h=Date:From:To:Cc:Subject:From;
 b=PnLAC90/7KkCqBqXaLXitm2zG+rzO4YYr7FZCY9rfDJ+17IQHAZpTIh1g7womNx/o
 wnMEnN1HorjuOM9lhf1Pf1JuZc0weOa3YFoHJh3hGJaKOQxKMjnqYpb9mbF8vbSThz
 1ZK8iEhxDgmvCnnnKJ+KLJ0rAd6guEEl8VkJYSCGFGTvlydZkbTzyMTfyyIMbNZ8Y+
 FFAS+tM6BqkKwkyWPT1vI4gCVwE1RkcXHbjkWdKLFdDUaizXlGGmvs9BX0SShVoXCG
 vv2YC5lfBD40ecIC52PjYbJUenFGyT0GstSMH4szUDg+psLwnqxNxVvC9U4SjI5REj
 axK9ChShZOEXA==
Date: Fri, 5 Mar 2021 12:05:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: manual merge of the tty tree with the powerpc-fixes tree
Message-ID: <20210305120523.0cb114b9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9xWkDb4+9_2nx0jSjYMefla";
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
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <uwe@kleine-koenig.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Jiri Slaby <jslaby@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/9xWkDb4+9_2nx0jSjYMefla
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tty tree got a conflict in:

  drivers/tty/hvc/hvcs.c

between commit:

  386a966f5ce7 ("vio: make remove callback return void")

from the powerpc-fixes tree and commit:

  fb8d350c291c ("tty: hvc, drop unneeded forward declarations")

from the tty tree.

I fixed it up (they both removed the forward decalrartion of
hvcs_remove(), but the latter removed more) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/9xWkDb4+9_2nx0jSjYMefla
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBBg9MACgkQAVBC80lX
0GwXiQf8DH+F4whK60DwjNEeg8slREuMDGj5efB//THFJmu1MUAsJfNIxZ+tYRwD
hIEeS9EWl6G/o28EqBe6yBsIdB4Q6/8CQD8q+0dC5rUrcnB9yGso7NdDut/aQJv1
8Xf3jbcLhafoceBARbPZ+ad4s7nGN+tbXnN8aIa5wiT2yvxaCQl23sZkHNYJGXJH
l8l9Gun1v8goZoaa/BSQr7RcNaHpBHycHRFss6QAa9nCbap67ZVAngFQYm4JuAGU
oeaH/Hbr5Ai2h3H8zEUr/Ivyyc8UK8+EWaVS9oqrXEZKdTvEBZPtMg1493pF0c4o
erVXqm+X/JvQlrNFGwLRu+DTmE32FQ==
=+4E4
-----END PGP SIGNATURE-----

--Sig_/9xWkDb4+9_2nx0jSjYMefla--
