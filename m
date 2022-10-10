Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B85725F97FD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 07:58:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mm7W94vgJz3c3G
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 16:58:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=SmQWsWwN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mm7VC5dTZz3bhh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 16:57:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=SmQWsWwN;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mm7VB5JYKz4wgv;
	Mon, 10 Oct 2022 16:57:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1665381443;
	bh=XsdJZc0nibpzsvb6PXaPRQ6jM8pEfvvMvRs8nbotYR0=;
	h=Date:From:To:Cc:Subject:From;
	b=SmQWsWwNiBhPTxwrQR6X55Ple2HcxkngnmlnZYyekh573QW2hBYhQKCRFG1wgDjyF
	 LvNFXLqbKK1d7jJSCIx/E3dvpg7iKy5y8Ba/OyukObwJWfxeDCEO+O2Z6EPteAwbbQ
	 d7R/rutetqCjnM1X8Yqiv/5NP2IRdMEnLflGTb8KgkTYRb7e4914xkvo6jTWKACozD
	 nqCTRCyYOMRytRrW05GFChPBXk+jrfjqCUPLpbQA7GsrWV2MbrsIa4AD+KsedOofZW
	 QlO/Hqmck0e6o1i6W1UOKD3jIb2Z1mHecwlrVRM4TmFiEMiHCnJi1WBLNxfQDB2AcK
	 hYn7sY43Ewm4A==
Date: Mon, 10 Oct 2022 16:57:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: suppress some linker warnings in recent linker
 versions
Message-ID: <20221010165721.106267e6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0BFoVfor_2IG71lzLJ+FG36";
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
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/0BFoVfor_2IG71lzLJ+FG36
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This is a follow on from commit

  0d362be5b142 ("Makefile: link with -z noexecstack --no-warn-rwx-segments")

for arch/powerpc/boot to address wanrings like:

  ld: warning: opal-calls.o: missing .note.GNU-stack section implies execut=
able stack
  ld: NOTE: This behaviour is deprecated and will be removed in a future ve=
rsion of the linker
  ld: warning: arch/powerpc/boot/zImage.epapr has a LOAD segment with RWX p=
ermissions

This fixes issue https://github.com/linuxppc/issues/issues/417

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/boot/wrapper | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

I have only done a positive test on this i.e. I have binutils v2.39
installed.

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 55978f32fa77..d78c34bd5d41 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -215,6 +215,11 @@ ld_version()
     }'
 }
=20
+ld_is_lld()
+{
+	${CROSS}ld -V 2>&1 | grep -q LLD
+}
+
 # Do not include PT_INTERP segment when linking pie. Non-pie linking
 # just ignores this option.
 LD_VERSION=3D$(${CROSS}ld --version | ld_version)
@@ -223,6 +228,14 @@ if [ "$LD_VERSION" -ge "$LD_NO_DL_MIN_VERSION" ] ; then
 	nodl=3D"--no-dynamic-linker"
 fi
=20
+# suppress some warnings in recent ld versions
+nowarn=3D"-z noexecstack"
+if ! ld_is_lld; then
+	if [ "$LD_VERSION" -ge "$(echo 2.39 | ld_version)" ]; then
+		nowarn=3D"$nowarn --no-warn-rwx-segments"
+	fi
+fi
+
 platformo=3D$object/"$platform".o
 lds=3D$object/zImage.lds
 ext=3Dstrip
@@ -504,7 +517,7 @@ if [ "$platform" !=3D "miboot" ]; then
         text_start=3D"-Ttext $link_address"
     fi
 #link everything
-    ${CROSS}ld -m $format -T $lds $text_start $pie $nodl $rodynamic $notex=
t -o "$ofile" $map \
+    ${CROSS}ld -m $format -T $lds $text_start $pie $nodl $nowarn $rodynami=
c $notext -o "$ofile" $map \
 	$platformo $tmp $object/wrapper.a
     rm $tmp
 fi
--=20
2.35.1

--=20
Cheers,
Stephen Rothwell

--Sig_/0BFoVfor_2IG71lzLJ+FG36
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmNDtEEACgkQAVBC80lX
0Gwx8Qf+NPXxwpzs/gscLU4YT9UxxuCu6fC+pYuUOmb5XeUoRRRSjGauQmUD1K59
f0nFj+JAY7EKCRXcjxXCB9crv0XwqIQW8fncp3AA1owc8NjiMwPHA5Ja78zRz+3x
sIb7YaWsn99gQzl6cyUxF8/mjVMsqnEnfVc4AA/5Zu3oVUuOU0C2vl1viP5VSRo6
+EnugQo/+eiEFmAoq38VBNyVg5LBKLSj/veyjfWwJ1hFtBzrWsKrza3D2D4DJ55u
ayuCdgNiupQZroTvIEopZBsD8NJukJb/2v2ezxPvJ0l/xGTm6yKZj/KRzkJhoByL
L03GwR5joNm3H9of5ZvCwze4TgdG/A==
=ySHO
-----END PGP SIGNATURE-----

--Sig_/0BFoVfor_2IG71lzLJ+FG36--
