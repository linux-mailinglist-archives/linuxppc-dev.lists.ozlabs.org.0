Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E2A1DE887
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 16:10:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49T7g63NP9zDqdw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 00:10:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49T7Zl0QHWzDqx5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 May 2020 00:06:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=WK99tbW9; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49T7Zh23lMz9sRW;
 Sat, 23 May 2020 00:06:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590156397;
 bh=9XdBfu5nekIGtDkEUofNMJ8BY7msGaFJ0KoVdLZTEcU=;
 h=From:To:Cc:Subject:Date:From;
 b=WK99tbW9akmKDF/RAZoZo0SxSq/W5+6ttzw7I402bZpallYgSrhJComdgb77SRCDN
 WU7YrgtSOgtPtLiEPeiJniP7vBGgwWM8MtEMtd4+RUj4Rm+dBUsD66knL6IZ0xJOna
 SOK5YH5CPF2I/d4MK1ZtOROyXEkKQw8dK6arRwv6TGNF9UhVAwX3Dl+8YUrq7SiKKw
 BdHhQz8//+Zl2FXntjIBU/8/c6JvfRWvO3br3BTAxjkNXPrCz0SPN+bZMdFPN9XxRM
 3z8BmSG1/g8BPx3H2eimysS5Ul+B9Xa00UneXVua5emdSPj8m/JO5s+5VnVlkEt+sa
 iH7qTcE8PjdEA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.7-5 tag
Date: Sat, 23 May 2020 00:06:55 +1000
Message-ID: <87sgfsf4hs.fsf@mpe.ellerman.id.au>
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

Please pull some more powerpc fixes for 5.7:

The following changes since commit 249c9b0cd193d983c3a0b00f3fd3b92333bfeebe:

  powerpc/40x: Make more space for system call exception (2020-05-12 21:22:11 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.7-5

for you to fetch changes up to 8659a0e0efdd975c73355dbc033f79ba3b31e82c:

  powerpc/64s: Disable STRICT_KERNEL_RWX (2020-05-22 00:04:51 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.7 #5

A revert of a recent change to the PTE bits for 32-bit BookS, which broke swap.

And a "fix" to disable STRICT_KERNEL_RWX for 64-bit in Kconfig, as it's causing
crashes for some people.

Thanks to:
  Christophe Leroy, Rui Salvaterra.

- ------------------------------------------------------------------
Christophe Leroy (1):
      Revert "powerpc/32s: reorder Linux PTE bits to better match Hash PTE bits."

Michael Ellerman (1):
      powerpc/64s: Disable STRICT_KERNEL_RWX


 arch/powerpc/Kconfig                      |  2 +-
 arch/powerpc/include/asm/book3s/32/hash.h |  8 ++++----
 arch/powerpc/kernel/head_32.S             |  9 ++++++---
 arch/powerpc/mm/book3s32/hash_low.S       | 14 ++++++++------
 4 files changed, 19 insertions(+), 14 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl7H3DQACgkQUevqPMjh
pYCc6RAAtxBm0aHlZsitFfLGRVWjXAanWlstF0Gnd/uOT+OLERE7MCD4PQzISKU8
XeHJORzhnfBgcN596vE5EHvTPNkZQdd+VW1Fxp9Pw1wcfZi0XACOdA5YrSN6nDlH
vWUFE0WdcX7MksaviX8AnTmjK9MmHiKySZnTZ5cKlFcJWuawy4mjmK/L1y2DbAId
YdGPJ/Yptda/aZbgi4hV8T1fhgl7odqKhrFf+I5SRojL6M2hnt0mSpUq5shk4Zsw
YZtz86o10CLHpyXdi7zcJb0h7n8JLX3mB+veNVHrQ2o+NeSkwEhQJFYq2CzmTZSK
n79vjG9iCg5KQIQ513cwPjJuo9tIoFULuBPomWiKQ8z/wAyJwzApAJ9y3YWTpQ3e
MBo/rvhMCJvlDt2uAKp8DVMCaXdG8zeE/2iGcnvbQ5l9RwJDEUO8IcUHCdUyZchF
erIjeGLodqB4Vm9+v8gOSjAL4CRrgVRHX6ZDZdOMoHkQBc36mMIu3/X4LfknZ1PT
6TR6AK+DQXY5pguiUeutHPEjzB+f5dgjueTnU4yjOST07xq28dRfeBvRAWdnH5ev
bzQ/VAShdQBLTuwOcYajvYh9HCzcTvuRDOj4LrPRud/qIBECKjB9QlqbsWIPM1Vv
RBX79Fs2ML1Lz3GtVXKUy+9n+KncCEC7H0YkbYiVRZdbYQBbw/U=
=KT4L
-----END PGP SIGNATURE-----
