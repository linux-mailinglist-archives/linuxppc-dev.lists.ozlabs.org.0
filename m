Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C85AE8BBEEB
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2024 02:29:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=X2xoR3v7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VX55b3Cz7z3cCM
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2024 10:29:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=X2xoR3v7;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VX54q6dpDz2yvf
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 May 2024 10:28:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1714868934;
	bh=W4X7cR0LaXN5r6M5SrLOReenkryNgmrUe3eXtF0epm8=;
	h=From:To:Cc:Subject:Date:From;
	b=X2xoR3v7ilzS6yaheJ5VftNMzyZF/jHb2R0/yH0eALLfHVCmi+ZMk1cWP3VC/+ObZ
	 tVGRQFDCGZVcfLPPkI95IqHuCUKt6pAp2hMl8+GO1WeypZN7Ffo6+u7NxIixNGs5NZ
	 PaVJCXxhh+jVmdV2h9Jdi9ugVx4eydEVyct863KQDKiLeEsmeUQ1wi8OGiXqO8qoiW
	 ztuEP3Hh/qGBHxnzZvYTFei1KW04z9Uuk1kyBGwmyC+GTmcWCewOtj+qb6enfV8F08
	 L1QlFECgk5HJcvMsoPHpL6q7yJx6hIZungC64MZ6VCXdIxr5t42DLWOfe/Q9GCqRBo
	 S+iHiCtE5LaWA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VX54k4rzwz4wp3;
	Sun,  5 May 2024 10:28:54 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.9-4 tag
Date: Sun, 05 May 2024 10:28:53 +1000
Message-ID: <87fruxumnu.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: gbatra@linux.ibm.com, nayna@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.9:

The following changes since commit 210cfef579260ed6c3b700e7baeae51a5e183f43:

  selftests/powerpc/papr-vpd: Fix missing variable initialization (2024-04-12 14:40:07 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.9-4

for you to fetch changes up to 49a940dbdc3107fecd5e6d3063dc07128177e058:

  powerpc/pseries/iommu: LPAR panics during boot up with a frozen PE (2024-04-23 14:34:00 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.9 #4

 - Fix incorrect delay handling in the plpks (keystore) code.

 - Fix a panic when an LPAR boots with a frozen PE.

Thanks to: Andrew Donnellan, Gaurav Batra, Nageswara R Sastry, Nayna Jain.

- ------------------------------------------------------------------
Gaurav Batra (1):
      powerpc/pseries/iommu: LPAR panics during boot up with a frozen PE

Nayna Jain (1):
      powerpc/pseries: make max polling consistent for longer H_CALLs


 arch/powerpc/include/asm/plpks.h       |  5 ++---
 arch/powerpc/platforms/pseries/iommu.c |  8 ++++++++
 arch/powerpc/platforms/pseries/plpks.c | 10 +++++-----
 3 files changed, 15 insertions(+), 8 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmY20ogACgkQUevqPMjh
pYACiQ/9F0++bTHAbQyWuEE18xmJIbicTWINXyNor9b2hzp4Z7vXFKriXw1PVbLj
oZXWyNfSfZKmcylRed7+a14Nd5dNKehEJnIYJ0Zvhca3Rh9gfKMtN/CfZgDbIFlL
5kLpSG1RV834PSu0tguU+lucJf2SSwkYotlKmQZeB1sSY80r2YGXdCJ24g+mZBIf
ervhfyJE+rd0RPNdxW6SaLxdLcEMcELTu+6H+FU3uNDFpWypstfQHQg6mgLN56hh
4ZEVWTrlq4SNSxlS0f7YthQHIVYqfSqw0FAnXDQHTsy3rqMDkLCZeYVB60kndigh
rOAuK+Hbs2XDCvgcNFeHOBaKS9n4t1AqreinYFLYwRTtnbVhOjEws9K1CPllWveo
2Y+qfOy+NovNUpqfv0xGbbikl8e15DXheA++xjNQqXcwMxl8nJOehjw3BkMQjm48
dhd0ulJ4naPkKfMKbu9/ifq8Xr54n1Cf0fkbECe12tbasvIrbXO74cf/Ar2Zw83N
Xbx1vOREKJ6zdvS5HIt5gG6d3CDG9UHP2JhP+9/JFAbjsVF38jWszcEPEfJBUBoY
3pcNFGNQBUY9me9D2J2wOL2XSA80FT0JQCJ5Dg8zjiJHQh8oBv1yXLT6VgCMjA5y
jnfrZec/IG7HaRb2m20AUCtrHsO56M42ZG5DjZYdTH976Y7+CLc=
=3rSG
-----END PGP SIGNATURE-----
