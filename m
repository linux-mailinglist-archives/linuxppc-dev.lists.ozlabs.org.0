Return-Path: <linuxppc-dev+bounces-4881-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A76E5A069A8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 00:46:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YT4LZ5Y01z2yvk;
	Thu,  9 Jan 2025 10:46:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736379974;
	cv=none; b=b0FLB3Bhb5gj7ekqXjR9BPrPNkWPl0rKydkHewwna0rKsyflPOzvqfYjf/YvJdDXWxiveGSW8EhhSJv8dKcC3L6bECAj1+1LMzDANHalhhljzyVVfWRpRAGv5mhsemIzV6Nxg5eGlgiRpgvzrrXWUa6oSKkZXy+etxDhB/AgDnFm2oDJ8JmqpuwjD2uxJtd3S2DqVhqkqPhfZ0lTYeSPd2EKGIJr61ldNB9aUE0iTYX7CPqg2x6bilNRwyU/nRXA3L8UfCp2GLDRprVMnCCpBSBnFpj+tC9MFmVRZtD/OiXxuib1tGWliUb2psd6s8PO2As5xMUNk1fsDZEkc3qXxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736379974; c=relaxed/relaxed;
	bh=Ly9fn1T4zx4H8wNaz3hsD2gBcjX7dDKW3DZGhWNHt+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Vi/w4GN50Tc3VStn8IQlt9fYUhbtrOVkT6y0Aj31PEwGgyl7L9F1M8Qhg7XqFGBY4SpHv0kngDzZ6wR7FVkfAKm/ADF96NDETHhGZ6dcCPH3jCCYtQZDyfASZPRVnfbtb3uTAxgVl9DD0kwi9dldVgte7CWCPxTQaX7ptyYimdtB6B3mLrRHZRD+q/1wKMNr6z6fxHIgH290NlCmgolzfrOIsxvf+O9iEmVvIRBnyReN5g/p0K0aIPzcMKOPUAOtwzEkd0K7xr9JgZKVmHXeBVVQ/mxCq3t9u8Ipz5Yd6sk3+pW66dKO/QL2mKL2Zr0ZBOFiweYCAln0dlJ4CbFckA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=VeqBWMwv; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=VeqBWMwv;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YT4LX4lwzz2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 10:46:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736379965;
	bh=Ly9fn1T4zx4H8wNaz3hsD2gBcjX7dDKW3DZGhWNHt+c=;
	h=Date:From:To:Cc:Subject:From;
	b=VeqBWMwv3dGs6P8EIcVZXj/Ac88f8sttRMqilZ0PZszEvvpGpzX0/MMwcrvdqsZTe
	 TxWfcnrx0wUF/O2ia0U0x07AHoRsbuIUw2mJG6V0Itgtahn5G5HLsTWCki5fEGdZGr
	 wqGolE/43MlMlYK4HE56ewLEGajluuKQs/QzYRDyPpjp1x8h06aTx6Ivjj47cC7RTa
	 4SMRpUsExEocqh+TBrdUFMVsN9gd5Y75Fc6d/PH73TX8cH5cdXdnBD+lbEJ2MPPTwA
	 EtU73O+BThPUs5xbyTJ7x5nfvjO9b1NCwkDBuWgv5rVXlZwlx/1F+9HEgP+17SqnrB
	 Va9Gv4z3SRFDw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YT4LP1xQJz4wbR;
	Thu,  9 Jan 2025 10:46:05 +1100 (AEDT)
Date: Thu, 9 Jan 2025 10:46:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Alistair Popple <apopple@nvidia.com>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: linux-next: manual merge of the powerpc tree with the mm tree
Message-ID: <20250109104611.2491cc3b@canb.auug.org.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m9da.KuDx9fnbdx1dYJFT7v";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--Sig_/m9da.KuDx9fnbdx1dYJFT7v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in:

  arch/powerpc/Kconfig

between commit:

  c0c3319917db ("mm: remove devmap related functions and page table bits")

from the mm-unstable branch of the mm tree and commit:

  00199ed6f2ca ("powerpc: Add preempt lazy support")

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

diff --cc arch/powerpc/Kconfig
index 85409ec1fd83,db9f7b2d07bf..000000000000
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@@ -145,6 -145,8 +145,7 @@@ config PP
  	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
  	select ARCH_HAS_PHYS_TO_DMA
  	select ARCH_HAS_PMEM_API
+ 	select ARCH_HAS_PREEMPT_LAZY
 -	select ARCH_HAS_PTE_DEVMAP		if PPC_BOOK3S_64
  	select ARCH_HAS_PTE_SPECIAL
  	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOO=
K3S_64
  	select ARCH_HAS_SET_MEMORY

--Sig_/m9da.KuDx9fnbdx1dYJFT7v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd/DkMACgkQAVBC80lX
0Gx9vAgAiLlgHrrzPA8JJSrN0rllQimHcOttT+WgXoKP9UYTViqfcr3Q8n5THMDu
sYljjJ+HsPhQCFXoIOqMfwyVV2rFY1gqV3GbEUyj1JA9WO5/S5BTESX1lK61JmZU
ZaCY0oTciiyqV2nnFIt/lYpZ+x8a6OVaANTSHLYWUckUzddL3uzX/ztAqNCicY6C
xJGiyEt9l8BtH3P0ny123M/ZBa39LkghE8CA7DO4mCZmHpMyh2i+bKJBtf/Yno9t
fYCA/nXvF6J1p706rjourhGzKWZwd4zGW8MZvAsgcQVxb0vhjAlmEgkLqB6FsY3j
gjoW3E9tvHcW7CupRdiN/gTv2aT/Sw==
=xeh6
-----END PGP SIGNATURE-----

--Sig_/m9da.KuDx9fnbdx1dYJFT7v--

