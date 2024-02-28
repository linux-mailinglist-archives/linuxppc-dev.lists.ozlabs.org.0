Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF54A86BC0D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 00:18:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=nezoDe1j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlVdY2Mq9z3vdf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 10:18:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=nezoDe1j;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlVch5n2cz3bqC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 10:17:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1709162243;
	bh=ZL/XInIJt5Cjmb6tbB31oFlzL2jGhkTDoNVbNzl3oks=;
	h=Date:From:To:Cc:Subject:From;
	b=nezoDe1jULxhYuf/bJjayZMTPtC1mFWM7SV034TzbFm3Ff62W3foLUTH7eoaNXQnk
	 P/cqOCSpeqs643DM1yST2mEJRfzSg/i+NPaBL9ZnpDAcy8idn700KkVYnytS+lsrpl
	 x/yFS/OzbnwCvUW3sDiUi3xPgZQh3HPw/1AygzxOkBtnufVGsXZxuEW6hWN9B4PeO7
	 U1YXGAWwrBAqIXj5t0ulMsoJ/bUCzg/PyGt2PeT6tA7DsphcIfIA2TrVKNJGGFWhbD
	 Se4r4ju1LbngVhi3oS8lP1RycJr9GSRlPpwxejmRSeXPEvl8UWNxNIbVMMW1VlWgeC
	 pF7OLkwQXZP6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TlVcf6Gvyz4wb2;
	Thu, 29 Feb 2024 10:17:22 +1100 (AEDT)
Date: Thu, 29 Feb 2024 10:17:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: linux-next: manual merge of the powerpc tree with the mm-stable
 tree
Message-ID: <20240229101721.58569685@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4n4pHsN37n9IgpmeL1C=ccq";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/4n4pHsN37n9IgpmeL1C=ccq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in:

  arch/powerpc/mm/pgtable_32.c

between commit:

  a5e8131a0329 ("arm64, powerpc, riscv, s390, x86: ptdump: refactor CONFIG_=
DEBUG_WX")

from the mm-stable tree and commit:

  8f17bd2f4196 ("powerpc: Handle error in mark_rodata_ro() and mark_initmem=
_nx()")

from the powerpc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/mm/pgtable_32.c
index 12498017da8e,4be97b4a44f9..000000000000
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@@ -164,21 -174,17 +174,14 @@@ static int __mark_rodata_ro(void
  	numpages =3D PFN_UP((unsigned long)__end_rodata) -
  		   PFN_DOWN((unsigned long)_stext);
 =20
- 	set_memory_ro((unsigned long)_stext, numpages);
+ 	return set_memory_ro((unsigned long)_stext, numpages);
+ }
+=20
+ void mark_rodata_ro(void)
+ {
+ 	int err =3D __mark_rodata_ro();
+=20
+ 	if (err)
+ 		panic("%s() failed, err =3D %d\n", __func__, err);
 -
 -	// mark_initmem_nx() should have already run by now
 -	ptdump_check_wx();
  }
  #endif
-=20
- #if defined(CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC) && defined(CONFIG_DEBUG=
_PAGEALLOC)
- void __kernel_map_pages(struct page *page, int numpages, int enable)
- {
- 	unsigned long addr =3D (unsigned long)page_address(page);
-=20
- 	if (PageHighMem(page))
- 		return;
-=20
- 	if (enable)
- 		set_memory_p(addr, numpages);
- 	else
- 		set_memory_np(addr, numpages);
- }
- #endif /* CONFIG_DEBUG_PAGEALLOC */

--Sig_/4n4pHsN37n9IgpmeL1C=ccq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXfvwEACgkQAVBC80lX
0GzdyQf/ZXxsTunyeE9hpoU8sNgMv+YWuJxIkdQX4wdxWcuybexme3bw4kj0rZXd
RUBTfzmZTW5+KV18MvN9pBzsnIYrfEhGDGItzZQzlElVGmsPevvkAOvKTyvKP1oK
KYDLqqtNYEWX+s0T8svodh+Tfxwp1zanWycAGStmzdZbnffSzV4cMeWRAKRuW9lR
+ujWWGXO4WKdIkS0X97BvGadKnu/BCvIQIPjOsS7HLWdl5XHPpVOTP0KkZIzewTW
7igbDgq0075biqdcvuLWDdFfNUTr3Qbx1DydOvtVVv7Zk2IJRzTQ2K6feYgPSjs1
c5Tt4xpnk8QJOrm6dAlfjN9fmks7Sg==
=k40I
-----END PGP SIGNATURE-----

--Sig_/4n4pHsN37n9IgpmeL1C=ccq--
