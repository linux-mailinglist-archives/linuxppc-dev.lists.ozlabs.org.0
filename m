Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FE32237E8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 11:11:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7QNM3plDzDqCC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 19:11:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7QL62ZwRzDrBc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 19:09:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=oLUl0yjw; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B7QL568RYz9sR4;
 Fri, 17 Jul 2020 19:09:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1594976974;
 bh=stOj+5/wR44kqg7e5KWsFMtJ7j3fab5Xm0QH5Z3Drkg=;
 h=Date:From:To:Cc:Subject:From;
 b=oLUl0yjwf3SgyjxwGKidXwfWAaPSJmXhbirCthDkJHBZyVhv0qPWLe/RPzcwT7kXm
 LpkgVMdg9c8pvD2lVCOiJyzDfrQ1PZyk1Lt78QBltBj6151CWc/TszwH86pC1ZLTiV
 R14l58508hzr7UvUUFEFVmNxNZjo0Lsxyd1iPeYQMdNBxhYmg5acvxDTPwtJmScxyq
 6xgqEYxj8BJtiO1ujG1sqIn3X3tdHTdypKpcWYB0T51C4bgxoQBgiCyV72Q9GkWHTG
 Yoyw/2Hki/vO5x6kyqaohMlM1foilqR+rc9zh6LL2vDHmjQijktw4hD9hTo3wyCIIK
 Rc1IIpzW8udjg==
Date: Fri, 17 Jul 2020 19:09:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoph Hellwig <hch@lst.de>, Michael Ellerman <mpe@ellerman.id.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: manual merge of the set_fs tree with the powerpc tree
Message-ID: <20200717190931.701ddf08@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MpNvBc7e9h=R5siSPe2jASW";
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/MpNvBc7e9h=R5siSPe2jASW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the set_fs tree got a conflict in:

  arch/powerpc/mm/numa.c

between commit:

  c30f931e891e ("powerpc/numa: remove ability to enable topology updates")

from the powerpc tree and commit:

  16a04bde8169 ("proc: switch over direct seq_read method calls to seq_read=
_iter")

from the set_fs tree.

I fixed it up (the former removed the code updated by the latter, so I
just did that) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/MpNvBc7e9h=R5siSPe2jASW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8RassACgkQAVBC80lX
0Gwx1Qf/Z/KP87nXilapLrjHPT6fyF4eVhLlF6CMqMmpoMb53PLpyeLE2iObKdqO
UQW9zjCF6VaZ/ObFWFeWW4SrNjv/tSD1ICNwrEhaF/KP1Dd5YjwiRQH1ZUmrtZP8
vmL4lZ/WIgjD06tp68YgfrEdGfYrNAzOsIkGp0AVAhE2ZZZDp2ShJ9/3PMeP1Mvk
smM6+phD9fgYRHpqncS0FdWsc6akn3oF8h6Buk6fmWRdMYl7D7Ma3V78kDuD6gaE
kcBrBOSmudY+Klftbm8cJPyV04asC2JisLFXa0PgcieLhwxvKmIJg9NTQrUqECCL
o/lrNLSeWae2d2w8uCZDBkgvSKojlw==
=Rcfh
-----END PGP SIGNATURE-----

--Sig_/MpNvBc7e9h=R5siSPe2jASW--
