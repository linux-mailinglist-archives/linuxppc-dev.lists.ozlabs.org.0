Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A43FBBB1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 23:36:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Czwt4nClzF761
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 09:36:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CztS6LWqzF4bb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 09:34:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.b="JQtOF2MB"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47CztS2bZ0z9sP4;
 Thu, 14 Nov 2019 09:34:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1573684448;
 bh=YFAbH5HQl2fb7P5ubV8lB29uY4YYWrHpfCSMXiC/ymE=;
 h=Date:From:To:Cc:Subject:From;
 b=JQtOF2MB8DGeRPITHpfyiKHRnmY3zSS9tUgIlb9TzpTxjJLdirTv6GGv3rIXzqL9n
 /9r/VZrIchBZA0+xUcV8OFJmOVjgvcquF3LqqhPhokdZiArdyEVZIl4bTRK1KagcMT
 5D5Ssda7PZ0B/FH0UjFO+MZ/6eiXfjaTxocBBaJpcSiXWouaonC8ntAtdsJIAs9km5
 zaqWAyXxq0Ftq8WA/Z8h0ZnbDdMdsU0j9bhFgri7aU5gg1RFyRFB0XnWHkVcgVdwYM
 lPw3k7/Beafnrkisq3kVrDsHjAtqAghMiD21Ld1iCYXkYvp2g84Uovpzw/H8tRnkST
 5S/74RMPnA7aQ==
Date: Thu, 14 Nov 2019 09:34:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20191114093403.43a1aa21@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x4QgqGYX+rLWZdL1crNfto_";
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
Cc: Eric Richter <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/x4QgqGYX+rLWZdL1crNfto_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

security/integrity/platform_certs/load_uefi.c:17:19: warning: 'efi_cert_sha=
256_guid' defined but not used [-Wunused-variable]
   17 | static efi_guid_t efi_cert_sha256_guid __initdata =3D EFI_CERT_SHA2=
56_GUID;
      |                   ^~~~~~~~~~~~~~~~~~~~
security/integrity/platform_certs/load_uefi.c:15:19: warning: 'efi_cert_x50=
9_sha256_guid' defined but not used [-Wunused-variable]
   15 | static efi_guid_t efi_cert_x509_sha256_guid __initdata =3D
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
security/integrity/platform_certs/load_uefi.c:14:19: warning: 'efi_cert_x50=
9_guid' defined but not used [-Wunused-variable]
   14 | static efi_guid_t efi_cert_x509_guid __initdata =3D EFI_CERT_X509_G=
UID;
      |                   ^~~~~~~~~~~~~~~~~~

Introduced by commit

  ad723674d675 ("x86/efi: move common keyring handler functions to new file=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/x4QgqGYX+rLWZdL1crNfto_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3MhNsACgkQAVBC80lX
0Gx4CQgAmJUSVR1t/XbE2n4Ll1+PEmrhM8jdLi438qnP99Xhp2cgUSI4vjPW0VV3
4/3vg3Oq2RU5Hv3ZxDueeCBt441cO+Jop4ZsE26Xa4y/0J26Goe9C/YNQvemdFVg
c6vFGXZwyoXcAfT+DKO+C5229yAkPfihaFM/rfEuUpdmZ/kp0vKqNtfStkkxqjwi
u59Fc+rx+bvfEPa+GymMxFMStHx4ISQXf7VvY0oarp9Pz0VqSVkFNIE5Y19zox0Z
jyS3FaeSnhuUwXf5woF5h2eVmxZTao/lhUJc4Q+pmM0jgLFZM2+j2rHKcHPkS/Qv
pJgNnoORWBXmdP4opNj2Zvl2I6UTCA==
=1nbk
-----END PGP SIGNATURE-----

--Sig_/x4QgqGYX+rLWZdL1crNfto_--
