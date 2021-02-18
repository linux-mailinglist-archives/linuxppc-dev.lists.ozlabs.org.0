Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B93531E497
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 04:48:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dh10B1qTTz3cHv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 14:48:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=ZDfpj8ZG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=ZDfpj8ZG; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dh0zn0Zf1z30Jd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 14:48:19 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dh0zg6Ydjz9sRN;
 Thu, 18 Feb 2021 14:48:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1613620096;
 bh=KZLShXknssbpHlq1mybpWLCAMvICgyJu4jRRWIiyKgo=;
 h=Date:From:To:Cc:Subject:From;
 b=ZDfpj8ZG3oKts+IdL6Y38RQlPa+KYEqyuxHEygWL28oa/bdKVGjh4RCcXNyMZH12Z
 juifl/axtQYyFiASJSzdL4pDxmuwuENMLkCha9xzMX+3GcdmEy9/2Rm1hxjqwF2Uhb
 oI3FGH/+A87axb5TdsDnKem75/QK84+bl4jswsaoyXBMLOODdmtt+vTHiSzweIvju5
 hRW9SQJLxZavF6204jferllrGD5X+ebB1/iZ/JSqO7CKItaaB/hMouXniDQWdrj/bn
 6/X1mSHSWAFbTXbvUblTtk7VBOOSX/w3iyEBUqlUrrRFS+i+5cKrlqhTfvD5avNp9h
 sJFc+NdTlTNow==
Date: Thu, 18 Feb 2021 14:48:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robherring2@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: manual merge of the devicetree tree with the powerpc tree
Message-ID: <20210218144815.5673ae6f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GQSo81TZbEJK8U/wnAHYYnY";
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hari Bathini <hbathini@linux.ibm.com>, Rob Herring <robh@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/GQSo81TZbEJK8U/wnAHYYnY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  arch/powerpc/kexec/elf_64.c

between commit:

  2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for kdump kern=
el")

from the powerpc tree and commit:

  130b2d59cec0 ("powerpc: Use common of_kexec_alloc_and_setup_fdt()")

from the devicetree tree.

I can't easily see how to resolve these, so for now I have just used
the latter' changes to this file.

I fixed it up and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/GQSo81TZbEJK8U/wnAHYYnY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAt438ACgkQAVBC80lX
0Gw7PQf/a1d0NWQIgPhB7xouP3AzhGRerfWA6mMtdHA5mq8rTcHBuoBtwuXyLevF
KyiQvwpAXo5ETgcdKyJ2q+kzkNsDzo5fzJkKD1tzCX6x12rZcdd0GUWiIBXmMVwb
Gzst/oZMrxHsPqTlN8ubrGHqSzRGkMBBXamy4HuXdAAAq+E/C369jxbH/Kb/+sBs
jApDC8xPpOSc4xNqwPvtrObiuVvpJPovAHJkbb5eVpTHz6W5DhSBIFhM28mtZXwA
MRt2YnLiQqIDVFk2s/NG83Ig3YccPMb406Xt8TSwF2R/JDLOEEuPGfb5pYATU8zP
o7Ze4sqM31shYat0Cc3JYjgnUTwS7A==
=MsIt
-----END PGP SIGNATURE-----

--Sig_/GQSo81TZbEJK8U/wnAHYYnY--
