Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 048E34BAFE3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 03:54:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0GWL3rjsz3cRQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 13:54:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hzFiKxgC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0GVj6dLQz3bWj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 13:54:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hzFiKxgC; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4K0GVk1YC7z4xbw;
 Fri, 18 Feb 2022 13:54:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1645152846;
 bh=wKL5cto37whZCPGNWavrz2fGxMBZcjXVsOEmMKW6V98=;
 h=From:To:Cc:Subject:Date:From;
 b=hzFiKxgC2qDXrsPusqA5nD8Ks+pKHpq6ACCTJ40V1F+eK88VFNGqS7tBRDy5ptb4W
 08htaYwCADTpgu+QnLKBuT9I4nMuhFuw0aiqcR0nCmtpJYWEKN+qsmvHIZFoIPWcKG
 vZN2uZ3cXaSF1ORDSdsZSWO4agiDvPqv7l8XCOcwOBqtCUEzwjaYHF/SN2oFgR/lfK
 KjXE4oWKkgRyrzdJeokdc9RV2+jLZmb1aEMHslBLNEKCgYddPtL8+9jf2R//5ayvat
 xr/BnTS7yUu1Z8ahHJL2gUQzl4dJ1BKogVpEHTDRJN32RPJtg9MvueVAqx4pWha8Hr
 +4K8JaktLFAzw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.17-4 tag
Date: Fri, 18 Feb 2022 13:54:05 +1100
Message-ID: <87pmnknauq.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, anders.roxell@linaro.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.17:

The following changes since commit 26291c54e111ff6ba87a164d85d4a4e134b7315c:

  Linux 5.17-rc2 (2022-01-30 15:37:07 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.17-4

for you to fetch changes up to fe663df7825811358531dc2e8a52d9eaa5e3515e:

  powerpc/lib/sstep: fix 'ptesync' build error (2022-02-15 22:31:35 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.17 #4

 - Fix boot failure on 603 with DEBUG_PAGEALLOC and KFENCE.

 - Fix 32-build with newer binutils that rejects 'ptesync' etc.

Thanks to: Anders Roxell, Christophe Leroy, Maxime Bizon.

- ------------------------------------------------------------------
Anders Roxell (1):
      powerpc/lib/sstep: fix 'ptesync' build error

Christophe Leroy (1):
      powerpc/603: Fix boot failure with DEBUG_PAGEALLOC and KFENCE


 arch/powerpc/kernel/head_book3s_32.S | 4 ++--
 arch/powerpc/lib/sstep.c             | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmIPBSwACgkQUevqPMjh
pYBjmg//RUzlssNhvaB8m/X6cfZHA03rkQgVhPzUtTGryyge5aT6GqxPfD4+5Vdf
e1vdZJNzt1pIVt4yBYZmTKv2qkyDjJ0TdYJ+r2/neNY3T6IL4oOscPKnp2yn3n5C
N5NJk48fxgXRnnkjBQVFeukaHGEs2F6PbI/z7Dn4on7MiinGBewlPaPRCQUee+i6
eQNQ82tfUMKfgJoaTm71SuZghRUU89scl9V/0/BSkrNNWOuHpxcG/Amq4ap8IxEE
oMEAfhBxKBKqvb3tGDnoljEB8T8RaGpzx0yeice7+3NfqjUw4lE2E7ahbUqFoom5
nJiCbuX5hsYn5GRC/ucNvWka50EInuqs4MFsdGP82v/ruH2O+/V9Dl8JLGfyuc+8
9MSHatRS/3np+M/CZnPJgLS1rutbmWP9hCQ/fs4LzOe8KJboN3R00LXxcNIuK6p5
GV8qthSAKD4rvrjPw26OLUXwZRjpf7hMeOoDZTfWqscIN1E3G3EbCUbQ4EMxwCf2
Qc5DkB30XzHeYK4n/Ee+aNiqhGkI0i9ODSBS7JytEANGWdSQBPAC9n5wW00aln0V
Df/KfCaafZzGEKhdHJTDNzGM8QoCwLvg24jP24VSa1OOz1bOL8hCGxNw/FUS0Ykk
lWw+PYO4/uBx07VeaA2in3zj7mNlwnNNyP2aA3HIRyA2t7LL1BQ=
=h/wV
-----END PGP SIGNATURE-----
