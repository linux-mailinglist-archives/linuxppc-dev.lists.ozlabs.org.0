Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4121E91EE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 May 2020 16:09:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Z3Fp18BLzDqH5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 May 2020 00:09:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Z38q4Y8ZzDqh2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 May 2020 00:04:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=esBsACUa; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Z38n56yrz9sSF;
 Sun, 31 May 2020 00:04:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590847482;
 bh=0VzQgHs0PUKp+nP18PJuuglDzes8EiycPaVEaAzPImw=;
 h=From:To:Cc:Subject:Date:From;
 b=esBsACUafhY0YYk588Zc1mpJzJlCE5jEWqvwekIVpgCpOqriK/+vj5wxUE3t7LYFY
 Y74t43peTU4Si6s5Qa7uGsFsBpcSATwHCXLgQasBwJqOhY6L9n3gq+cI2Qd0rk8MCo
 xFhCsf57lyFsRewUQdLqsM8OI5Iyd0wFNrJ3k18zA5cpI6MI1WuVehX7TkTIHHenib
 4HlOoUmwplo+l7kCUmBsuu3Nq3WuIVWR1ditl+GhMO1D/ZA6fu5wCbtxTgD29Tkuwp
 DqbzXAiz+OqHYjuMtVXoATUhoXRvSxR7NT0uzYX+wMMZdV1TWtpQz+0k/SlMsopXpT
 /muZcUZDowx1Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.7-6 tag
Date: Sun, 31 May 2020 00:05:02 +1000
Message-ID: <87lfl9ikmp.fsf@mpe.ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 ajd@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull two more powerpc fixes for 5.7. These are both regressions with
small "obviously correct" fixes.

cheers

The following changes since commit 8659a0e0efdd975c73355dbc033f79ba3b31e82c:

  powerpc/64s: Disable STRICT_KERNEL_RWX (2020-05-22 00:04:51 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.7-6

for you to fetch changes up to 2f26ed1764b42a8c40d9c48441c73a70d805decf:

  powerpc/64s: Disable sanitisers for C syscall/interrupt entry/exit code (2020-05-29 21:12:09 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.7 #6

A fix for the recent change to how we restore non-volatile GPRs, which broke our
emulation of reading from the DSCR (Data Stream Control Register).

And a fix for the recent rewrite of interrupt/syscall exit in C, we need to
exclude KCOV from that code, otherwise it can lead to unrecoverable faults.

Thanks to:
  Daniel Axtens.

- ------------------------------------------------------------------
Daniel Axtens (1):
      powerpc/64s: Disable sanitisers for C syscall/interrupt entry/exit code

Michael Ellerman (1):
      powerpc/64s: Fix restore of NV GPRs after facility unavailable exception


 arch/powerpc/kernel/Makefile         | 3 +++
 arch/powerpc/kernel/exceptions-64s.S | 2 ++
 2 files changed, 5 insertions(+)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl7SZ9oACgkQUevqPMjh
pYCF0g//cJYxcH020cVm2jZL5Smcfqr3mYRcGnY/IsEJ28y7HFc30HnoxiBtwO2Z
BwZqqW80IQpDieHS9GZ//IbGaHrrrj5HeyGfA5F6IsKrZXsb9EG++njaKqGZljX5
NStMVMJ+zFs8b+ZVPtA5yQVy4EQO5QlB3A19BIsI7VnqNI/h6R9wXHaAguVz2DUL
AydK/cdU0LdOXnPewY3S3P4HVaUkBE/UrqpekBePJ89obOvUVsbP1C+syDYQLgzA
y43zFPZurVb5UOpEXs9hKoqLnciM5LBKCbk6JV001Hvalb8Bobo/4vvrmxC/BSUs
B0kI6ZHvojTj/cQ7c26B0uEab6AZYdP7TzAIjpP2xoLHvLaWlbGlrOzSz5xNp5B5
lkT8WZCcU8/kQx2hsjOcOOQV6JIMkTDeB7lTm3iwcVQihJDemNu0XxZIAi8gbOzr
46BXNFKVv9ItjzxSIbUtcxl5mpiwnV0XoDw4IM7xDdKnpLG8z9yzrYuBPyQ2gEDB
KhnvTJQry9B4I98EoKoXvMGMttL9BmrYWJ/7P89hTWZT4fs6dOox9Pf+UOHBp3Tk
I/qxG9zzWlf5zXJKUKyTqLv4SIbQNCx7IAqkPkaR9AGCoLCNyapNfZ5orfh6TFHc
n4J9suaFG9TFF7frIMGZNcIt8MBjPlXcJhQQ+s2KCOD4NZE+534=
=KF+h
-----END PGP SIGNATURE-----
