Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 665C03F48EB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 12:48:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtTW16f07z2xrs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 20:48:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=FFy1BuB3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=FFy1BuB3; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtTVK0ncZz2xrT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Aug 2021 20:48:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtTVD3CQ5z9sWc;
 Mon, 23 Aug 2021 20:48:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1629715685;
 bh=ytEvyC+DEnLTTfZkIg3wkrRmLBORVvoxKCJVWjIoJH8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FFy1BuB3h/44cQ8yyheLTod8gxRDOgY3fD4DlBfZI6fru5t0lc2n9QtLOeq+d3DDa
 xD5etjFiIlQziNsGx+PMbqdI8Q67eaCPdlfMqWpZJi9E10vTHFIMmpWSZPnFHrlRrW
 ul6z6eDmmubA8/1FpvWbVz6un9R6SZAtOWp0IeatzKQ+N1XM+6EQv7TmIWD/LhoKU4
 JoK2ghRkWZVki6NA5zAGnGdZlws9Qi2W4gedFCP3op7Z3h3Jsvk1HPfL+WFZWnD3Ns
 tExLyFsN70uPBfbHQUZeYzr+vx25SqJWKnUvi9CihCiXy6LOFgX6petrVzB8qQ/sYG
 WsjneOXuzY1XQ==
Date: Mon, 23 Aug 2021 20:48:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build warning after merge of the powerpc tree
Message-ID: <20210823204803.7cb76778@canb.auug.org.au>
In-Reply-To: <20210823195540.4d7363ed@canb.auug.org.au>
References: <20210823195540.4d7363ed@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sxdg6gsIpF4HdmJ_XxRwn8Z";
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/sxdg6gsIpF4HdmJ_XxRwn8Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[cc'ing Jon in case he can fix the sphix hang - or knows anything about it]

On Mon, 23 Aug 2021 19:55:40 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the powerpc tree, today's linux-next build (htmldocs)
> produced this warning:
>=20

I missed a line:

Sphinx parallel build error:

> docutils.utils.SystemMessage: Documentation/powerpc/associativity.rst:1: =
(SEVERE/4) Title overline & underline mismatch.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> NUMA resource associativity
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>=20
> Introduced by commit
>=20
>   1c6b5a7e7405 ("powerpc/pseries: Add support for FORM2 associativity")
>=20
> There are other obvious problems with this document (but sphinx seems
> to have hung before it reported them).
>=20
> Like
>=20
> Form 0
> -----
>=20
> and
>=20
> Form 1
> -----
>=20
> and
>=20
> Form 2
> -------

I also get the following warning:

Documentation/powerpc/associativity.rst: WARNING: document isn't included i=
n any toctree

And applying the following patch is enough to allow sphinx to finish
(rather than livelocking):

diff --git a/Documentation/powerpc/associativity.rst b/Documentation/powerp=
c/associativity.rst
index 07e7dd3d6c87..b77c6ccbd6cb 100644
--- a/Documentation/powerpc/associativity.rst
+++ b/Documentation/powerpc/associativity.rst
@@ -1,6 +1,6 @@
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
 NUMA resource associativity
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
=20
 Associativity represents the groupings of the various platform resources i=
nto
 domains of substantially similar mean performance relative to resources ou=
tside
@@ -20,11 +20,11 @@ A value of 1 indicates the usage of Form 1 associativit=
y. For Form 2 associativi
 bit 2 of byte 5 in the "ibm,architecture-vec-5" property is used.
=20
 Form 0
------
+------
 Form 0 associativity supports only two NUMA distances (LOCAL and REMOTE).
=20
 Form 1
------
+------
 With Form 1 a combination of ibm,associativity-reference-points, and ibm,a=
ssociativity
 device tree properties are used to determine the NUMA distance between res=
ource groups/domains.
=20
@@ -45,7 +45,7 @@ level of the resource group, the kernel doubles the NUMA =
distance between the
 comparing domains.
=20
 Form 2
--------
+------
 Form 2 associativity format adds separate device tree properties represent=
ing NUMA node distance
 thereby making the node distance computation flexible. Form 2 also allows =
flexible primary
 domain numbering. With numa distance computation now detached from the ind=
ex value in

--=20
Cheers,
Stephen Rothwell

--Sig_/sxdg6gsIpF4HdmJ_XxRwn8Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEjfOMACgkQAVBC80lX
0GyLKggAhCMrgdwGxkXle5T2qBzbCLLt9t4orSVuLnnyOdL/bZOW3T4uZoeNrwE3
ZgvcuzFGHpNjiT84wlMR1Ui6tD/cSF95PEyno26ZoifhPQELvZxBgiYQtCirrgIJ
Co8qEQPsScICE8fvNNhwbliv/xYTei+Hfj2tED/FugRbaHHqoOOjUVUfO/PI0roZ
kRD8H5x35d+oYVUwhqmzmYWMYtcdnyXcu3vsx587Nr3O9yk0n+PLwU6OaAgSPtt7
PMo+QNZsm+E/Uyvvjkc1wPU5x8UGlU0nOGsLFAjycWrhBeTztpZlunjAHKyfqPQX
GLRByUmgTZmQw9Gs0SfxO+QhZpkYCQ==
=4JXF
-----END PGP SIGNATURE-----

--Sig_/sxdg6gsIpF4HdmJ_XxRwn8Z--
