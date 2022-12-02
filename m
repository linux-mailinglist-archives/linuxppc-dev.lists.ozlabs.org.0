Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C6163FD09
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 01:27:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNYgP61ZXz3bh3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 11:27:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=eRy4KME6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNYfS2DXfz30R8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 11:26:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=eRy4KME6;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NNYfK0zhDz4xFy;
	Fri,  2 Dec 2022 11:26:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1669940810;
	bh=ugbbf+g7FOT3/DhiyoQYo3Jh4xdDh8TDWCJ3xQUbmFo=;
	h=Date:From:To:Cc:Subject:From;
	b=eRy4KME6mkbN+Zs+XRb1ipt9GDtDBEDNBwTSYmirGi2bNEOwLevAQEz/ijxNiWWQm
	 f7PGAV9SDO6ikoY10n71k3jDUaI1OgwbgyK7y5t/U4znV7rM9rFQToxPXD3Bm3bl5h
	 rxFEfE8Z3nAoE4o+hKTfUyCamx0bRqgDQu6yWABrlRbGmqNGf307ofrEWtH2NhOjnN
	 FCy5MveKPOXlD8NYQWOhLUooXRY+Y/XyPMPo07+hELwaTGVjEWPC8wnyapfgrEcjTV
	 XAtnGgIBw+BHcsguLKXWk2l6rzjRSg4j0jKiL7R+sBdK/lGIht0cvXvf2yUAuWCJQS
	 VIkGYIySynPnQ==
Date: Fri, 2 Dec 2022 11:26:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20221202112646.5813c34b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y+3=Ny4zt/XJbrXO8h=gy+i";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Christopher M. Riedl" <cmr@bluescreens.de>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/Y+3=Ny4zt/XJbrXO8h=gy+i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

arch/powerpc/lib/code-patching.c: In function 'text_area_cpu_up_mm':
arch/powerpc/lib/code-patching.c:157:14: error: implicit declaration of fun=
ction 'copy_init_mm' [-Werror=3Dimplicit-function-declaration]
  157 |         mm =3D copy_init_mm();
      |              ^~~~~~~~~~~~

Caused by commit

  107b6828a7cd ("x86/mm: Use mm_alloc() in poking_init()")

interacting with commit

  55a02e6ea958 ("powerpc/code-patching: Use temporary mm for Radix MMU")

from the powerpc tree.

I partially reverted commit 107b6828a7cd - I left the change to
arch/x86/mm/init.c applied.  Though, I wonder if the powerpc tree should
use mm_alloc() instead of copy_init_mm() as well?  The tip tree commit
says:

    Instead of duplicating init_mm, allocate a fresh mm. The advantage is
    that mm_alloc() has much simpler dependencies. Additionally it makes
    more conceptual sense, init_mm has no (and must not have) user state
    to duplicate.

--=20
Cheers,
Stephen Rothwell

--Sig_/Y+3=Ny4zt/XJbrXO8h=gy+i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmOJRkYACgkQAVBC80lX
0GyRJQf9FNRiyemVrBXmHbzEklHgNrDnYcojZAaBaQ3fDlII3K5YYgNmzzE2BnAj
mjcEPplhkgyL92H1zT+G62MVlKWzgPzythpJcExyGkd8hL7TXUm7HLHot2e2Up76
8kiaeKXeVhqaX8LGCO3LeTVENP6GaB3du7n7dLXFo6iE9XBTXhzVnIWK5vfmJGs4
25d1hiw24xIVLGz+KFMEHodG+qZ+0kbhsto42v11MZBWwl8RLJdm2I+GM7Fr4rdO
BJCsSYk5/4+/hlv3Jge6Z+oJ81hRVvcM51zcxZNoPiN0CV0NDF+ldDwcSY+62+v4
P5VuTIq3vz6nTqW8Ws7EfP1oud9D7A==
=+Mjg
-----END PGP SIGNATURE-----

--Sig_/Y+3=Ny4zt/XJbrXO8h=gy+i--
