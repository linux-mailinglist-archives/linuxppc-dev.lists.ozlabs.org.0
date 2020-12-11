Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2E92D6C0E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 01:27:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsWnM3mK9zDr02
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 11:27:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsWlr4NDFzDqhD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 11:25:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=oEwtVY8T; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CsWlr0wxBz9sWS;
 Fri, 11 Dec 2020 11:25:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607646344;
 bh=bA6byRMs/pHhq0Ws6E/d+hPLWhoTPF322rZCJWUyQQU=;
 h=From:To:Cc:Subject:Date:From;
 b=oEwtVY8TaUu7sKeObDfG3kDVUPFIBmyr3Ugu3jskOjQ9DovBonYOKBu7EuHncb2GV
 BDeq9S4H5NqougsLzzGDCvIPK1hUHT51XDh+CC+EE1thfzCKdtx4JXL712hhgjy7xi
 UsS9BalRpo1DFWF2/iDmD4vHivCmhWAA12qxfZLkiL93RyKAVDrocf7GKNwI6Bx5vG
 m6LM8HD4WtNZPca939GUGOXhm4jADrfXOdf6BByYpEzT/OGg+VktN4LiW0N5S/wGhb
 j7apSe3q7kF5toqPEj+f8xK7Rtn8JMo21609Nh/L09XtuDv0UJQWXADFxPVebaEGgQ
 FPoQefKCrrcwg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.10-6 tag
Date: Fri, 11 Dec 2020 11:25:43 +1100
Message-ID: <878sa5rxx4.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull one final powerpc fix for 5.10:

The following changes since commit a1ee28117077c3bf24e5ab6324c835eaab629c45:

  powerpc/64s/powernv: Fix memory corruption when saving SLB entries on MCE (2020-12-02 23:16:40 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.10-6

for you to fetch changes up to 5eedf9fe8db23313df104576845cec5f481b9b60:

  powerpc/mm: Fix KUAP warning by providing copy_from_kernel_nofault_allowed() (2020-12-08 10:22:09 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.10 #6

One commit to implement copy_from_kernel_nofault_allowed(), otherwise
copy_from_kernel_nofault() can trigger warnings when accessing bad addresses in
some configurations.

Thanks to:
  Christophe Leroy, Qian Cai.

- ------------------------------------------------------------------
Christophe Leroy (1):
      powerpc/mm: Fix KUAP warning by providing copy_from_kernel_nofault_allowed()


 arch/powerpc/mm/Makefile  | 2 +-
 arch/powerpc/mm/maccess.c | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/mm/maccess.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl/SvGcACgkQUevqPMjh
pYAecRAAhM0j56uNwH4P+Mu/PJ3PXjuoLjZGSA1HAOyBOamJsTvShW3R3w+bq+0A
nKo1I7qkrCBmvTcKWc/XqRQom3I+bP/DbtHdXx0IEW8qooBRDIRRqEXCTXPOLxnh
lESPuixsTofm+HBNpg/gY4/VXphVM3+0gLp05YQ0SdeWedPmiEzyYF7IKPrYiuzq
7yOqu2wqUQ9BewWIWllDy+z5bNDnww7f2VIudTfEmg0AACriXfRvRSFk5y78OBtk
fMzO1q8FLdWXTpWOVJfDFRpwPMMSjRK8DJblROoPjidXg57Lj998DP4R0WZQmiqO
OKIa2AGBm9ZZCYArFhTA4X4ObmKIZKIox1th4WOAljBeByVFX8m+FbW/ChET1CSE
KGmr1djFuEMljlCPPMUSgAns/LAYr+BfL+XRyix3I8vgF9lWjR2G0K1z8LEmXSEF
0MzJ/loxYSdRd89pGSuinPS8VNBObcRFTfqVqGC0LpI2PeSpawjRUbl3AOTkISFs
zwdWcJWwj/XME6yjcFhic3CuUvw74v/ZGHTpbsvov0eR2ki0D5zKq9GqGHVkMP+m
5Db7i5rLGsM5zy7M2OloPVL+C193cbrrMrk7ndv3HS6ojPErHukwQ1SoQJrrGAKN
8KDfJlQB8ofjpux3jS9JoDkXqQd7zjdX63Ob9nTyjIYn0V+TEyY=
=g55c
-----END PGP SIGNATURE-----
