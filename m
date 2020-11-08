Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D442AAA91
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Nov 2020 11:30:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CTVkh33lnzDqSV
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Nov 2020 21:30:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CTVhP4XJ7zDr2p
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Nov 2020 21:28:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=cesw+TM2; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CTVhP0Gfzz9sSs;
 Sun,  8 Nov 2020 21:28:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1604831301;
 bh=t3PyH9o+kH1Xy3t/BWQqpDW6qPE1C4JOyrsXYipaCKQ=;
 h=From:To:Cc:Subject:Date:From;
 b=cesw+TM2itv2HS0DD3OtNBfd8JRf1aN5tUZ1zz7fxY5E/Jkdymc8PsAC5g2JjAJPc
 O4s0TptTDfHpPj15uaIF4/++ZO9VbNQyhlmlK3DqIT7evLmJII6ydhKwc0DYYj930h
 puwxFEct085IOuRosLQ3s+6eSwRDBCT/2XE2vO7z9MZ2iri/r+6dZkywAY/UB7vynB
 JRwN5daENhD7J4FuWfh2+Dke6R7c3teD1O7utEPDA0s9kKThBfRrJR3ZaYPezsmRtc
 JZj74fpYpBeo50KGa5gm2cIUelVARF8FGfJ291sI49D3tcFCkQVjXRlXWIH6lrVUze
 0zKZwfc+w7hUQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.10-3 tag
Date: Sun, 08 Nov 2020 21:28:03 +1100
Message-ID: <87361kta6k.fsf@mpe.ellerman.id.au>
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
Cc: paulmck@kernel.org, cai@redhat.com, cheloha@linux.ibm.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.10:

The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.10-3

for you to fetch changes up to 3fb4a8fa28b740709bdd3229b80279957f4d37ed:

  powerpc/numa: Fix build when CONFIG_NUMA=n (2020-11-06 14:16:19 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.10 #3

Fix miscompilation with GCC 4.9 by using asm_goto_volatile for put_user().

A fix for an RCU splat at boot caused by a recent lockdep change.

A fix for a possible deadlock in our EEH debugfs code.

Several fixes for handling of _PAGE_ACCESSED on 32-bit platforms.

A build fix when CONFIG_NUMA=n.

Thanks to:
  Andreas Schwab,
  Christophe Leroy,
  Oliver O'Halloran,
  Qian Cai,
  Scott Cheloha.

- ------------------------------------------------------------------
Christophe Leroy (4):
      powerpc/603: Always fault when _PAGE_ACCESSED is not set
      powerpc/40x: Always fault when _PAGE_ACCESSED is not set
      powerpc/8xx: Always fault when _PAGE_ACCESSED is not set
      powerpc/8xx: Manage _PAGE_ACCESSED through APG bits in L1 entry

Michael Ellerman (1):
      powerpc: Use asm_goto_volatile for put_user()

Qian Cai (2):
      powerpc/eeh_cache: Fix a possible debugfs deadlock
      powerpc/smp: Call rcu_cpu_starting() earlier

Scott Cheloha (1):
      powerpc/numa: Fix build when CONFIG_NUMA=n


 arch/powerpc/include/asm/nohash/32/kup-8xx.h |  2 +-
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h | 47 +++++++-------------
 arch/powerpc/include/asm/nohash/32/pte-8xx.h |  9 ++--
 arch/powerpc/include/asm/topology.h          | 12 +++--
 arch/powerpc/include/asm/uaccess.h           |  4 +-
 arch/powerpc/kernel/eeh_cache.c              |  5 ++-
 arch/powerpc/kernel/head_40x.S               |  8 ----
 arch/powerpc/kernel/head_8xx.S               | 46 +++----------------
 arch/powerpc/kernel/head_book3s_32.S         | 12 -----
 arch/powerpc/kernel/smp.c                    |  3 +-
 10 files changed, 44 insertions(+), 104 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl+nyAsACgkQUevqPMjh
pYA96BAAkrA88BcH3Bpqkd34iCCIUPzLY/iBedtj6zJCtPOOgxEA82SJFLdauJ4t
PmbHCofRuuz29Rv+7zBwAZ+VyDhUbOyYXUvsLEAdYqMr8PpFvsfhit7F/c+IG/pF
rW+V1GoCn/npcyPFgUE13gwAI0y3etbc3znwcEu9ASIa/JWho2EGqfHNoTuYsgfq
Q9xRmucEAiA4DUN9Fq5o4PrETWIkp/UoDg8VumA0KJKyvZ+YvaFI9eRfEw1Kc6jB
sN3vKSyRd4PbFBqfzjl+mVX0MUteLY5T9AZ80v4Yd78e+dXxCQPwE3EIa7suEoH5
vu6Wdu+bShR49kx5BqjbU9yNZ8rRXH2LmUDpn/FosVlAy1xduZTEhy1xp2IYU/I/
yWGmnZXDlhrdLcIIpFwsJ+kGqMEyfGSn1VBt2zZgbHBVpydHFUoq8NmLEpQ6Lsc8
vcA/f8kmm9IA6uidYzvxWSFxm9OqW/2aG/kLDkWrjfGmU4plO/0bA972MsxTN+95
2brPIsbAyDv4dB2oOjkB6vf8CNEUQSLRdUyA5bkPXLggPQCzAGUx1nApWkQQ3iCe
ge0Gi6RIpL/vfiHrmVNNjdHdgUkLqhmSPd4mUknW9IFoUicuUEdnV8z1PjwWyVyQ
e/nDpDRNJc552KGDYdhfaa+qBTwL4tagjCnXYluvwysrIH1+pLk=
=VisH
-----END PGP SIGNATURE-----
