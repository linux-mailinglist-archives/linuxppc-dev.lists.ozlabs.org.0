Return-Path: <linuxppc-dev+bounces-39-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB4794FA4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 01:32:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=SOr3pMJQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjW581GRNz2yGh;
	Tue, 13 Aug 2024 09:32:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=SOr3pMJQ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjW546RnTz2yGX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 09:32:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723505528;
	bh=eAIDKGVnf0mMlP4+my08U5Bt1rMk1xyHUF3WfoB2m+A=;
	h=Date:From:To:Cc:Subject:From;
	b=SOr3pMJQPPUSQ0MnfYJfin4gsug3ZL3UqJP4VLR0Ka/eEh7Qzgg3W8b4RsaQtuj9K
	 SPDJFISs/YVR+no6EAZ+GCyFRRWJa/U+iZSrNvcOF1DVS1r41L78eBXrN6go25zPwS
	 Vrktutw/cmoqboAahKLak+vS/zXBNFChEuKee68k/RRJXjVI9cda4kIssZVyGAKv/d
	 GaZdPpgBvd7kIk4LWV3wcoGY+YI3FfL/fouuEAneWm5bV4Gibj9q0bmMiqq02ejpeH
	 svNemmdvkOcnCErN6HuoIw+MWyDTLt/ooHLgsRFsvuYmOMrYTPckzu0y0yMaVIYUGe
	 hTFI9KHnilpgg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WjW54182Gz4x8N;
	Tue, 13 Aug 2024 09:32:08 +1000 (AEST)
Date: Tue, 13 Aug 2024 09:32:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the powerpc-fixes tree
Message-ID: <20240813093207.77fc03d8@canb.auug.org.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YAXQnHqS60nMiM5HU4yGyTr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YAXQnHqS60nMiM5HU4yGyTr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-hotfixes tree as a different commit
(but the same patch):

  e7a9af8c93aa ("powerpc/mm: Fix size of allocated PGDIR")

This is commit

  6cd04a440f57 ("powerpc/mm: fix size of allocated PGDIR")

in the mm-hot-fixes-unstable branch of the mm-hotfixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/YAXQnHqS60nMiM5HU4yGyTr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma6m3cACgkQAVBC80lX
0Gz5zAf/cN9zUcfFEdmW1rhyExLH2M63KQvepkHJS8FoeUYpKeL3AfF3yZUjDR7K
sMHR4tUDaWe3IGqN5SuV0vZSxlHYrwz0Ll+zRC3P++/UJI/7xquH/LGCr8izwUDr
kUXRrsSKsY8yCweS9A6+AMN6p220gwcXIXEsTCH6mBhqlfO7vIeMLXQTXYlkl0mv
dZX9v5xNB1RzPN2gBeP5mSOFJaf2kmueu2VRBpTN4eUq1AUUGfgQNh2j+GhEvYZ3
dhuMJ9S+nhVlnnUSxJgxCDqW7O7NJMOfKfVvSsCCwV0SGeQ97/uGE/jKmT2emW70
pBCm3jEqp6dWt5GbHm5TkSRVRwpzlw==
=06Ma
-----END PGP SIGNATURE-----

--Sig_/YAXQnHqS60nMiM5HU4yGyTr--

