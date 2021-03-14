Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 698B833A41B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 11:15:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DywRX33kwz3dBW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 21:15:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mIZCIYvZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=mIZCIYvZ; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DywR72RR8z2xbB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 21:15:14 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DywR55JLDz9sR4;
 Sun, 14 Mar 2021 21:15:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1615716913;
 bh=0SkYKg3e/bTwVIj0KE4qNxeEN3LksLwwY2JrTS849kY=;
 h=From:To:Cc:Subject:Date:From;
 b=mIZCIYvZhqBEr7mnwkzsOaUHKtqdJFJwjgWIP1Tt3yqBSyzUz5sgkE2kYFi9O/p7Q
 QZtWahGrDllyd3p2i/g/KnH2/SGKA0D9VtMROJJvhGl0tdIUhEZsQcl2dVZGjj7omA
 cOz8O7cSGnzdS8no05EnR9HtyaYne9ktwPvrN/gfmjHuq+z5i7MX7Sg9Em56AIrXW2
 QltUTbjNO44aJBXcAyKKipFZCLBv88D/ba8gvMabvTCRlWzpYaAxzsjszXQXGAupZw
 siILgIqW9fnRCeB3nPgN3qUY1U2ZjvTGW/IE4i3+TXWieBmuopHEr7K67Xo3DjUsnv
 7D9Kfshyeq3yg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.12-3 tag
Date: Sun, 14 Mar 2021 21:15:08 +1100
Message-ID: <87tupe3utv.fsf@mpe.ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.12:

The following changes since commit fbda7904302499dd7ffc073a3c84eb7c9275db0a:

  Merge tag 'powerpc-5.12-2' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux (2021-03-07 13:24:44 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.12-3

for you to fetch changes up to 0b736881c8f1a6cd912f7a9162b9e097b28c1c30:

  powerpc/traps: unrecoverable_exception() is not an interrupt handler (2021-03-12 11:02:12 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.12 #3

Fix wrong instruction encoding for lis in ppc_function_entry(), which could
potentially lead to missed kprobes.

Fix SET_FULL_REGS on 32-bit and 64e, which prevented ptrace of non-volatile GPRs
immediately after exec.

Clean up a missed SRR specifier in the recent interrupt rework.

Don't treat unrecoverable_exception() as an interrupt handler, it's called from
other handlers so shouldn't do the interrupt entry/exit accounting itself.

Fix build errors caused by missing declaration of [en/dis]able_kernel_vsx().

Thanks to Christophe Leroy, Daniel Axtens, Geert Uytterhoeven, Jiri Olsa, Naveen
N. Rao, Nicholas Piggin.

- ------------------------------------------------------------------
Christophe Leroy (2):
      powerpc: Fix missing declaration of [en/dis]able_kernel_vsx()
      powerpc/traps: unrecoverable_exception() is not an interrupt handler

Daniel Axtens (1):
      powerpc/64s/exception: Clean up a missed SRR specifier

Michael Ellerman (1):
      powerpc/64s: Use symbolic macros for function entry encoding

Naveen N. Rao (1):
      powerpc/64s: Fix instruction encoding for lis in ppc_function_entry()

Nicholas Piggin (1):
      powerpc: Fix inverted SET_FULL_REGS bitop


 arch/powerpc/include/asm/code-patching.h |  7 ++++---
 arch/powerpc/include/asm/interrupt.h     |  3 ++-
 arch/powerpc/include/asm/ptrace.h        |  4 ++--
 arch/powerpc/include/asm/switch_to.h     | 10 ++++++++++
 arch/powerpc/kernel/exceptions-64s.S     |  2 +-
 arch/powerpc/kernel/interrupt.c          |  1 -
 arch/powerpc/kernel/traps.c              |  2 +-
 7 files changed, 20 insertions(+), 9 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmBN4hAACgkQUevqPMjh
pYADeQ//SfFd0biPa2ZroIqshVWDwY+CW+lHt0NIMiAcyaAS6VXOhgV27kFM4K72
bPgwQ4x4pa3ZoUiHD2Otp0EHYyFWPleY+8Jz9Sl6QBmySQ1ZllFppg92DiTP8RdF
ZItidFbP6+i8gvnoLkVyGCVzZky4x6Om34+r2emNr2Ju6SEw1ok/LFQUjxEmOGpV
+hCLXENPH76KP3dvLVklOtLJStFY7XFzuS0/c9yM33WgFVdYArGx/Wy6365Mg+wy
bg74oZmfU3IRpSNkErwkWSHTVLPQOq1wQUbFKXhMGvAp82C793ExSoGy/0EELlGW
fjgQMyNlGc0IhJAf6JeN18wgOwx5uBfbzEX5GTMu3A+WacQqod0kPeWx7FOZan6U
5ikNwyeg//dHUokbscfqvHhEL4Wp4REVO8d1smLQk7ycLpw4/6saYd9GC1HXE2r4
xJrPCYAtBn2lZl5ra6InO+zyac40fVP1oac7gJWaDkYmOmSQ1gghCjQpGfQGRO8H
fEnnfR5aqtgeYRnE53rb7BRTjgxsMXo4kLI2T2W10i3ezm/KmUhD9M3D0Ov/5nTv
DoqTZWhs6yEx2cgvIc4IBgUZb+R7QIbPa/zcq4DIBNsTUJRwbvDfK+8e/abnTGkR
/RfOqMA8z28h8UFR6tPojPgxG/0dp9WqGB7ryCWpdNCSiYrheIk=
=WdJ7
-----END PGP SIGNATURE-----
