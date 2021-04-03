Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB1C3533CE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 13:48:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FCFYV48qdz3bwP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 22:48:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VL5Kt5/U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VL5Kt5/U; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FCFY61fYkz2xb9
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Apr 2021 22:48:09 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FCFY24Jp2z9sRR;
 Sat,  3 Apr 2021 22:48:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617450487;
 bh=YRLSj0a8S1jccv7CvoHZicpnAvcgRhWqMSGP1YSnTro=;
 h=From:To:Cc:Subject:Date:From;
 b=VL5Kt5/Um0Okt8pQTYg9UDAcP5sAs09gzUIJNaI4+ymmIz1GRR0G9ESm8xuJ6275t
 ykMqZ//W/YbUb2P2VJEyg8g0FeE43UIN4Yj0moBQeNFEbfr4lAjCOKkjkR75smKa8x
 ESFYVgyV0FBoRkLTf9c7GXgSAqYBNYNoQn1lAcw6I4AohK4pjk2dMdTheg9dvC7VD2
 SwGLTvlJJ5VmbD/+KB2SBSARTKccusp2dUEqQXkE53MQuUuBxAb5fy/HP8UWL0LcLU
 tOYcVneurhT+BjgaosQHIa5U14DnueXOf8h35vuXXDzTs+G1jhfJV2u7qGi1wmpjtk
 lH2yFCkcrc5Ug==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.12-5 tag
Date: Sat, 03 Apr 2021 22:48:02 +1100
Message-ID: <871rbr1te5.fsf@mpe.ellerman.id.au>
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
Cc: nathanl@linux.ibm.com, aneesh.kumar@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.12:

The following changes since commit cc7a0bb058b85ea03db87169c60c7cfdd5d34678:

  PCI: rpadlpar: Fix potential drc_name corruption in store functions (2021-03-17 13:48:07 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.12-5

for you to fetch changes up to 53f1d31708f6240e4615b0927df31f182e389e2f:

  powerpc/mm/book3s64: Use the correct storage key value when calling H_PROTECT (2021-03-26 22:19:39 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.12 #5

Fix a bug on pseries where spurious wakeups from H_PROD would prevent partition migration
from succeeding.

Fix oopses seen in pcpu_alloc(), caused by parallel faults of the percpu mapping causing
us to corrupt the protection key used for the mapping, and cause a fatal key fault.

Thanks to Aneesh Kumar K.V, Murilo Opsfelder Araujo, Nathan Lynch.

- ------------------------------------------------------------------
Aneesh Kumar K.V (1):
      powerpc/mm/book3s64: Use the correct storage key value when calling H_PROTECT

Nathan Lynch (2):
      powerpc/pseries/mobility: use struct for shared state
      powerpc/pseries/mobility: handle premature return from H_JOIN


 arch/powerpc/platforms/pseries/lpar.c     |  3 +-
 arch/powerpc/platforms/pseries/mobility.c | 48 ++++++++++++++++++--
 2 files changed, 46 insertions(+), 5 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmBoVTsACgkQUevqPMjh
pYDlFxAAkkiy2RiHbaAlWHpVekXVQN1/oRISHQ+9jRco3BQUAEq8wHJNrlArnab6
N7C/ig2SiugagpLelRsXeXWyM54U3syIQnX3NRg82PgUBxU/LGJmIcyWCgDIf9x0
/xbMrWcRMuzY1x916rX7MPuSVc8LcyVu9nByBrbFWNE6IqUrJ0ngrBNNsEyWbEf/
NBHYqUzpurXYv/OHEPOQu9GIOWej5SR8oOKGn3/aJ66cg3WoC7iC56seBjSIrcLe
zwhUenwRYM6YQ6boX0OBKs/NaPSeT9qy4JyZOe0Sqeo0Yvhj4VJs9W0napIYQde5
y6ieoyHk33xPawUWiTEtkLmvH2nZPVRXCfGOQmh5B4mvuS/rrv6hTeFkdLFZ74yJ
Fuan/ljnXSPTkT+xRITrOO/irZyTaRXJ4j0Ck3LrtluUFib9psf+OqtoIiqqy11w
u+E8T1GChRZTuy2iMZy1jiyvmKwa/S5v67YUU2xUXNYeRI8j3g3cPo/W9Skn3TS2
LiO5+/6Ws1ABn7TohGV2R7sTPu5AnJP7jyHVJuDbtf/Z79U1SMiNAOb8jA/8WNbW
0NtLSQsy1PHonsqUIJgJntmstA46Xnsr1ruA2wR7GEuaaBrjSynw9cG55KlA4Lug
16kaOFPBnJhvkgjTDI7Xl7+ktr4yuR5EriDI0wJMqbhxn+IJ5VM=
=9cfb
-----END PGP SIGNATURE-----
