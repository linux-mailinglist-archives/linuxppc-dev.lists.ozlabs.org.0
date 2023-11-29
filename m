Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AB27FCC4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 02:24:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=oCG4vxwq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sg1pK0Rnhz3cfy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 12:24:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=oCG4vxwq;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sg1nQ62Lrz2yps
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 12:24:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701221048;
	bh=QFeXnaUEntX6sP5PG4BuqjYMFylnyscfrlT0xNz8UpM=;
	h=Date:From:To:Cc:Subject:From;
	b=oCG4vxwqncgmdGMjTZONLfbuI5aFzjaMonWMZjwsp3EOZ0VYpdbkl7D/7HDH7V+6W
	 JUU8ERnXEAJYUfgMqsnCIwiHXhmzhfox/OXxZxb5+Js5URZJ2QfdUG62sJdKFtyoGF
	 0YwJooY+jdZk4DfoRqQaGOBLhTLPK8S64jfqYPHEOhJXMvkF/EuVZbV2IllXfXy++W
	 CEjxLbd++OmZkCalBMe9c3uyABTDK+GHtYRZWPb3XAo1xHlXucyFJn9sB2jMwKi6ad
	 SjxnrVQYHe+92VvDkN09Hd1HMRBXqFS3xUDyuwSR8qZtmZp99vN9e6BmNXkY7PR4Gz
	 Fu8/f19T8qyEA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sg1nM1lbQz4wcX;
	Wed, 29 Nov 2023 12:24:06 +1100 (AEDT)
Date: Wed, 29 Nov 2023 12:24:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Michael
 Ellerman <mpe@ellerman.id.au>
Subject: linux-next: duplicate patches in the char-misc tree
Message-ID: <20231129122405.27a5e54a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KaQD./.8r_dPiczMNRr44Tg";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/KaQD./.8r_dPiczMNRr44Tg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the powerpc tree as different commits
(but the same patches):

  bc1183a63057 ("misc: ocxl: main: Remove unnecessary =E2=80=980=E2=80=99 v=
alues from rc")
  29eb0dc7bd1e ("misc: ocxl: link: Remove unnecessary (void*) conversions")
  0e425d703c30 ("misc: ocxl: afu_irq: Remove unnecessary (void*) conversion=
s")
  62df29a542f9 ("misc: ocxl: context: Remove unnecessary (void*) conversion=
s")

These are commits

  29685ea5754f ("misc: ocxl: main: Remove unnecessary =E2=80=980=E2=80=99 v=
alues from rc")
  220f3ced8e42 ("misc: ocxl: link: Remove unnecessary (void*) conversions")
  84ba5d3675e2 ("misc: ocxl: afu_irq: Remove unnecessary (void*) conversion=
s")
  82d30723d58f ("misc: ocxl: context: Remove unnecessary (void*) conversion=
s")

in the powerpc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/KaQD./.8r_dPiczMNRr44Tg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVmkrUACgkQAVBC80lX
0Gy7rAf+L57K1PG/ZKUrhjtQoptSZBtEuopxNd5wmdeSNpwwjHpzGZaN3+dFezNX
o+ow6HdZ+5LDWM05IKRObZoEsqksqasPTRHuN9rx/+S+tTfICiyulZ/zOIwYjYlr
YR7pJelrlWtQcsq5vuPNbayFWKL4NC+WrtT2o/mHdHB8+A5zyqngcgrZIgMWzJaW
F5OVfP8vwpajmm7q7qdAp8DYYulNvgK9jyhkLGNUqyX18dlANkh1wRkEcYIuO48w
EU7KZDGkJnvhLc3VTSRu6/iX7owSIfmR5irkR6M6gzqtj32eIuCOgQODd0tAlif3
uQDUs7mksdZnkpRnir+de1yeZztGIA==
=awk6
-----END PGP SIGNATURE-----

--Sig_/KaQD./.8r_dPiczMNRr44Tg--
