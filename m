Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AE4239FEE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 08:57:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKpbl1Y9PzDqVR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 16:57:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKpYx6PCJzDqTN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 16:55:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=Y6dX8N7Y; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKpYw6HYbz9sRN;
 Mon,  3 Aug 2020 16:55:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1596437749;
 bh=LKuvMMPVIvA+B/kFD48oSrZiCdXwCQMwR14E2UPRJ5o=;
 h=Date:From:To:Cc:Subject:From;
 b=Y6dX8N7YA0LM9DL0xsUsZNZZCF5y0RPaSlAqOH9UmPuMo8zFtiC64K0KTD8JT0NN9
 bpng8nZ5STUygwKlhR6dFbM2q0cXP2JN7SV1H5eeq3kyGJCbI1xCt5cd5IrDsxKPq2
 iafFVfugXz9fKAJq9mFID2jm58pEY3neCSAk7C28DKgfVaP+m2h0j/VitaVRDTDem7
 gispg5Zw+IuiZusToa9GOSrMyJAX9/NInMThjcOgo22ujjCLx0KSPPFCewT4EuKLql
 z2aU2LqnYJiY1Clv1bHim9+MZhF/7JEoRSWu6ySuhz2CLULCxwCBLXs7BekNe/4eZu
 NQDwUidhnqh5Q==
Date: Mon, 3 Aug 2020 16:55:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Michael
 Ellerman <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: manual merge of the char-misc tree with the powerpc tree
Message-ID: <20200803165546.6ab5ab6f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qHOjcln.v14dlTifU=wo.eC";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alastair D'Silva <alastair@d-silva.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/qHOjcln.v14dlTifU=wo.eC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/misc/ocxl/config.c

between commit:

  3591538a31af ("ocxl: Address kernel doc errors & warnings")

from the powerpc tree and commit:

  28fc491e9be6 ("misc: ocxl: config: Provide correct formatting to function=
 headers")

from the char-misc tree.

I fixed it up (as it was just differences in comments, I just arbitrarily
chose the latter version) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/qHOjcln.v14dlTifU=wo.eC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8ntPIACgkQAVBC80lX
0GwH1Qf9HjXBmc/hCbg+8mUN8HeO99NLP+3Z73rBfw04BVzR8UCN4n2Sz6gty35l
nKxiWyIS8eccOL5RcIuR6XY+jT4uqdUOzllsytZpgf01VrBs9yLeWtQoRU5C3jyT
EUpLDCpu/Gs3NsRmG3bFBoqV9Xv7CpAs3NFSkKckXhh0DWp6DbIXqWOTXFyE6yd3
x1EyD3n02t9Kcq1h2lN0GchNanmaC1egu9lXK1ovPeuaGQ9+PPIpdANLBpw5HEKS
3+fXriRx5zHVZJkPL8709HL5GCMelIol4y+XZlQI/KOnrutXY4EneugpLlepWq7M
CcDGU9A9w3NwGLuPpOGK3i1jpVzgZQ==
=u9Jo
-----END PGP SIGNATURE-----

--Sig_/qHOjcln.v14dlTifU=wo.eC--
