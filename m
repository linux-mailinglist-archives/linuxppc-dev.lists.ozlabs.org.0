Return-Path: <linuxppc-dev+bounces-1122-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDB196F401
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 14:07:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0Zk34ksrz309k;
	Fri,  6 Sep 2024 22:07:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725624475;
	cv=none; b=gUSbkZNOPL2+81uJDTSGEfqhW+99vaai//jHCfs8ar3Rimiz5XQ6PH+IFwWlqLuM0mPySxVLBJmY7zUbLctlYIag/dsuFmkZG2Mq3GeQzfcKo1mSenRFimvHBgNe7z4tbGm7Vd/uhpohGzigfDox6JzG66gJXXU0u6o+Qs+YNtE7OFvi5hXTsUa8wYFHxfMPHFWCR8Q59xHn4muYnY0f94Cxuvlk1hFZDi7II57TeQmmwRqaX046Uf2ENnebLdT56TCVf/sX9vzOKR4ceaWaZWIosMwxnDqsVWJqfJiA3cZsMofD/fEwEvvZoBUPjREanlVvwpjpGO8pmzIysIgtZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725624475; c=relaxed/relaxed;
	bh=LDbfFUnNpnF7jbDUTOMT7ZzS2g2NbIVeFFf4A5ujKEk=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Type; b=BpyCNgsqc5jcxcosnMCE7OFMXaszt03INNQPNMnAcFxet6ahgSWtaC6yW/gLdb2zm0DFiSzk/dg6UIvx5kReGbTHczdkHHk/FvohhT7BqhoVrUav+8jsCtjtsWSWo2lV4q4RTNVqhHRuflSKretjcW58IaRYQZC0YqijYzsymjs0GVFmYDioIU9ClI96Xwc9d7MEHBlfnnNMkCBR+cAhi5aVKBD8hRYd+7QfGV3/QSHfjyakW3QA/eq3kVPQfw4xkfMccT4JW3dZKoTJlubLB9x4fH7zYwbRWK/n6THbccGYTrUiAkbFniT+Swrl9aH+o1GQRJcGOgoeEpC26Q1uFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=J1GdzgcJ; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=J1GdzgcJ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0Zk31lf4z309h
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 22:07:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725624475;
	bh=LDbfFUnNpnF7jbDUTOMT7ZzS2g2NbIVeFFf4A5ujKEk=;
	h=From:To:Cc:Subject:Date:From;
	b=J1GdzgcJiyWEvw2Yzs+Vhr79KwgdvfmQTDtv6uuWQBx6n46PFGJJe5gaUCC8/0wDI
	 41dFISJk2MFQSS5Xh9ZkDZPJEH7HgVkeBUaKUOqts0ys1AqyCdt2qm4DGRFa2EiBz9
	 QqzD/sJ2NBk5HuPQwDAQsN15gWabOXjev2gtPydtBuMnzaAn9fSpRLAW1iOQE9ZeIo
	 yfHFtfgegbkzPI+yseWEM9Y7PgzL9co5G60CwHYOjy3iaZbJ1ebVPgclQe5ZT07z0T
	 17IiwGd0sTpYC0wVL7vWShASfPNgn+3TrKu1GNXLnOomewVMD9891qy2BhYmhT0W03
	 c12YtTpYkmtAQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0Zk30R3dz4wyh;
	Fri,  6 Sep 2024 22:07:54 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, nysal@linux.ibm.com
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.11-3 tag
Date: Fri, 06 Sep 2024 22:07:54 +1000
Message-ID: <87ttet3rz9.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi Linus,

Please pull some more powerpc fixes for 6.11:

The following changes since commit 227bbaabe64b6f9cd98aa051454c1d4a194a8c6a:

  powerpc/topology: Check if a core is online (2024-08-13 10:32:17 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.11-3

for you to fetch changes up to 734ad0af3609464f8f93e00b6c0de1e112f44559:

  powerpc/qspinlock: Fix deadlock in MCS queue (2024-08-29 15:12:51 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.11 #3

 - Fix a deadlock in the powerpc qspinlock MCS queue logic.

 - Fix the return type of pgd_val() to not truncate 64-bit PTEs on 85xx.

 - Allow the check for dynamic relocations in the VDSO to work correctly.

 - Make mmu_pte_psize static to fix a build error.

Thanks to: Christophe Leroy, Nysal Jan K.A., Nicholas Piggin, Geetika
Moolchandani, Jijo Varghese, Vaishnavi Bhat.

- ------------------------------------------------------------------
Christophe Leroy (3):
      powerpc/64e: Define mmu_pte_psize static
      powerpc/vdso: Don't discard rela sections
      powerpc/mm: Fix return type of pgd_val()

Nysal Jan K.A. (1):
      powerpc/qspinlock: Fix deadlock in MCS queue


 arch/powerpc/include/asm/nohash/32/pgtable.h |  4 ++--
 arch/powerpc/include/asm/pgtable-types.h     | 12 +++++++++---
 arch/powerpc/kernel/vdso/vdso32.lds.S        |  4 +++-
 arch/powerpc/kernel/vdso/vdso64.lds.S        |  4 ++--
 arch/powerpc/lib/qspinlock.c                 | 10 +++++++++-
 arch/powerpc/mm/nohash/tlb_64e.c             |  2 +-
 6 files changed, 26 insertions(+), 10 deletions(-)
-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRjvi15rv0TSTaE+SIF0oADX8seIQUCZtrv3QAKCRAF0oADX8se
IbILAQDjj0pScmC9KZX8xYxH7QT7uw4WnTvuYclNNOMQAU/NhgD8DVMpHfMcj75r
ErmOete8qKyD/3w1P+70YGICf4yKewU=
=fFem
-----END PGP SIGNATURE-----

