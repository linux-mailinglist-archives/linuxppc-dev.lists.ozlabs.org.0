Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F612156458
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2020 14:02:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48FC4m6hqfzDqbm
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2020 00:02:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48FBsV41wLzDqWK
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2020 23:52:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=gDIL/+Bo; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48FBsT0tPVz9sPK;
 Sat,  8 Feb 2020 23:52:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1581166365;
 bh=oTzymqr6KbFrZJ28LMXr7fJJ6tIdsEGkIDpbea8meWg=;
 h=From:To:Cc:Subject:Date:From;
 b=gDIL/+Bo1XcQZelvIo+Gb4cvZDMV469kEwWu8rt6igb4CeM4RK0MvV4OHAu2BtX7I
 0LKrHte9KWOMPvt505IPcAez8Op1KUyCvn7eKFxptyvMKsA9RDT8EoIDKRx6azf84R
 7M0WSq04Csl9xw3SI8UNmqs00DTUmkofwMi+nGHcBZiVT56bign25Fv1qVjEUCuPYS
 xUNsvOI3QGex8Pmc4RoHJWhGaL623Lu2gPC2HeMx7egKEa1TDNd9JwONXDPENcrVt6
 OmmFxQH088wSbE64DC2+JNUYYrwrXw+RUOMUVQMDOEc06szg1vVKQA9y/wCosPITsh
 mQR1uLk8AI6jA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.6-2 tag
Date: Sat, 08 Feb 2020 23:52:43 +1100
Message-ID: <87ftfl1bs4.fsf@mpe.ellerman.id.au>
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

Please pull two powerpc fixes for 5.6:

The following changes since commit 71c3a888cbcaf453aecf8d2f8fb003271d28073f:

  Merge tag 'powerpc-5.6-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux (2020-02-04 13:06:46 +0000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.6-2

for you to fetch changes up to d4bf905307a1c90a27714ff7a9fd29b0a2ceed98:

  powerpc: Fix CONFIG_TRACE_IRQFLAGS with CONFIG_VMAP_STACK (2020-02-08 21:49:06 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.6 #2

Fix an existing bug in our user access handling, exposed by one of the bug fixes
we merged this cycle.

A fix for a boot hang on 32-bit with CONFIG_TRACE_IRQFLAGS and the recently
added CONFIG_VMAP_STACK.

Thanks to:
  Christophe Leroy, Guenter Roeck.

- ------------------------------------------------------------------
Christophe Leroy (1):
      powerpc: Fix CONFIG_TRACE_IRQFLAGS with CONFIG_VMAP_STACK

Michael Ellerman (1):
      powerpc/futex: Fix incorrect user access blocking


 arch/powerpc/include/asm/futex.h | 10 ++++++----
 arch/powerpc/kernel/entry_32.S   |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl4+rucACgkQUevqPMjh
pYBy4Q/+OHH+G3jPH2sCPycqXNh3e0XbAymtAH7v01Lj6c1BSiWhvq1vP58mEeUM
TwssxNgQC7ZeltOHwZc/0GA7WPp4cYuHIU0XVuxKmj8LvWM3gqC0WUbaMkbz1uvz
mM5IN+WA9ENvzEX4A4y5vKzM/pEMVkyyXOluaUmFWCT+94bapYqlKUjeQqYySxwu
js4qBAuMULl4qr3zgMAa4WS3v3XgJ+Zj5v3Rh0O/ITpV/qv+/lQrBYlI6Q48/L5x
hYmQa+3ahCaVtxLnsDpZHrvfiv8UKpgZMjNYPgDfv0nPjTsngTXGB2RtLlD63a4t
Ve2uHLxoSvHGn2TTgUJ7N+VDuqGEYzHv0Ulg72SQBGz5kUKGeS8h0EdDI2naUNTS
OTicNI/DaGv9zCTChSXHEgrLc6mR+qLaamgqwjljF9iIxlKhr2cyD9/02d3XtrHH
2EKm8LCy+5pCtFjReUk+fENU9MZQ5+bYHtk/svcHCC63XXquHzwE+NdB6Whz/QPz
iV5NQW8EtU74u+wkPjdsmqta1IMmYzoisc4IULGEXgFJSjgYdYchkpKd0mf49QMG
Wmd4HQR5iMi2w2YiE25hyqa3nxWjHY2y3TV+b1JZZ4sAKOKCNLLZ6ey989SZKraw
xP9G/r7H7/TtMVA0aC1fcjVnxPzU4d+ygpVBtqL8u7T3/pul9dg=
=mWQt
-----END PGP SIGNATURE-----
