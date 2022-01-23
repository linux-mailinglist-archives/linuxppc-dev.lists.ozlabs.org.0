Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3539F497146
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 12:20:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JhVyN648Kz30hR
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 22:19:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CIWtkFV1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JhVxl1l5Pz2x9Z
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 22:19:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=CIWtkFV1; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JhVxh3rF5z4xkH;
 Sun, 23 Jan 2022 22:19:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1642936762;
 bh=rjiXIAoujbqKcL6bu1UAXJuKBGJPBbV6NTCD/DODPuc=;
 h=From:To:Cc:Subject:Date:From;
 b=CIWtkFV1KPYsCJBegjyHovnQTEK0CgrZDkz/fLMO3ChM6hrmp9lETUzn7Q+c6cXK/
 u5TlM3xNOwapFFmKakK7Ofu5cTZUEU+hOgvKKawnim4TPEJA3KPGjahgWynhFOdX7c
 5XRlssJuxGxyYoQKgx8/Mhq/R8oeP3zk0y/MxSGGp1aivIe1TkKqXdXzil3Dg1CSp8
 10/8Zeabrx5blc4wJCdApbdJscVbm3t7SZ5/DSIZZiD2ZohYdQMHvIoLfTK+agyMSx
 +S+moaX+0vAmydQbJMX0mYEL4GR2P7aSXe4dSf/jBRzb0FkaRS3Z0MzS18GqxqCkdH
 lAMgzTvqaWOzQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.17-2 tag
Date: Sun, 23 Jan 2022 22:19:16 +1100
Message-ID: <877daqu2bv.fsf@mpe.ellerman.id.au>
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
Cc: atrajeev@linux.vnet.ibm.com, daniel@iogearbox.net,
 johan.almbladh@anyfinetworks.com, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc fixes for 5.17.

There's a change to kernel/bpf and one in tools/bpf, both have Daniel's ack.

cheers


The following changes since commit 29ec39fcf11e4583eb8d5174f756ea109c77cc44:

  Merge tag 'powerpc-5.17-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux (2022-01-14 15:17:26 +0100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.17-2

for you to fetch changes up to aee101d7b95a03078945681dd7f7ea5e4a1e7686:

  powerpc/64s: Mask SRR0 before checking against the masked NIP (2022-01-18 10:25:18 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.17 #2

 - A series of bpf fixes, including an oops fix and some codegen fixes.

 - Fix a regression in syscall_get_arch() for compat processes.

 - Fix boot failure on some 32-bit systems with KASAN enabled.

 - A couple of other build/minor fixes.

Thanks to: Athira Rajeev, Christophe Leroy, Dmitry V. Levin, Jiri Olsa, Johan Almbladh,
Maxime Bizon, Naveen N. Rao, Nicholas Piggin.

- ------------------------------------------------------------------
Athira Rajeev (1):
      powerpc/perf: Only define power_pmu_wants_prompt_pmi() for CONFIG_PPC64

Christophe Leroy (3):
      powerpc/audit: Fix syscall_get_arch()
      powerpc/time: Fix build failure due to do_hard_irq_enable() on PPC32
      powerpc/32s: Fix kasan_init_region() for KASAN

Naveen N. Rao (5):
      bpf: Guard against accessing NULL pt_regs in bpf_get_task_stack()
      powerpc32/bpf: Fix codegen for bpf-to-bpf calls
      powerpc/bpf: Update ldimm64 instructions during extra pass
      tools/bpf: Rename 'struct event' to avoid naming conflict
      powerpc64/bpf: Limit 'ldbrx' to processors compliant with ISA v2.06

Nicholas Piggin (1):
      powerpc/64s: Mask SRR0 before checking against the masked NIP


 arch/powerpc/include/asm/book3s/32/mmu-hash.h |  2 +
 arch/powerpc/include/asm/hw_irq.h             |  2 +-
 arch/powerpc/include/asm/ppc-opcode.h         |  1 +
 arch/powerpc/include/asm/syscall.h            |  4 +-
 arch/powerpc/include/asm/thread_info.h        |  2 +
 arch/powerpc/kernel/interrupt_64.S            |  2 +
 arch/powerpc/mm/book3s32/mmu.c                | 10 ++--
 arch/powerpc/mm/kasan/book3s_32.c             | 59 ++++++++++----------
 arch/powerpc/net/bpf_jit_comp.c               | 29 ++++++++--
 arch/powerpc/net/bpf_jit_comp32.c             |  9 +++
 arch/powerpc/net/bpf_jit_comp64.c             | 29 ++++++----
 arch/powerpc/perf/core-book3s.c               | 58 ++++++++++---------
 kernel/bpf/stackmap.c                         |  5 +-
 tools/bpf/runqslower/runqslower.bpf.c         |  2 +-
 tools/bpf/runqslower/runqslower.c             |  2 +-
 tools/bpf/runqslower/runqslower.h             |  2 +-
 16 files changed, 131 insertions(+), 87 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmHtOYQACgkQUevqPMjh
pYAZHw//UQj2TYAqdcrkDE2tz81s6/ifbnHsypz4vU9YV8muJUFsXpt9MPbvQhoq
gvUnG3gkMNoXxQ+YDKa2ygN/MLC78ch+4VYWyGGzNcpqVxKWhPqbH/Gt7KvMGOZr
LtnUCYjw462GBGrU7VI+yg9ki4c/pRzcSGoU4w346Q2/xIWdcNDb2aZ9a9MiYMCw
/SBOpwj2hPhFQsAINVujXgrIHlybon+cDGJdPQptBSqvEq24wFu+F+elzXBcJvfm
tVoAe81C077AhT8EGwyM9mTvTmBie+0jgZAkGVsvrUsbJJJY3FV/s923Fc9+lm/m
SMD4Pn8ZaN+dPMRUgCMaUZFjCKTyBx182ELlqraZtTTZvFXXt/ZtM5BCvXZqreZU
6XPFs+xMvJN4ZatdVM724hKhR9UoDaDer0zDcMvj1Yqr5E5LL1cl9ZG0fPeIYPdg
+tMKCWxvx64OWYwZNyeGr12JNvtrzWruvO/2TD60gGdqXIQH39ds8voaW6AUJOeX
xWP5UdEeh1LUPTb5HIEloy7K9QsUlE+fJ+3McbPk2vL01TBbrAjLymPdqCKEDGWe
Z74u7iRjggXEopUOLQPQS4L60P/T6a+5oq2j0eUh4NCWXlJA4Iyfez/76BIiov3L
qHNn4PjNXNQzR5r9xuhTe+WSZselnCnaVZgqsYnptkfdps5Yd6w=
=bxy0
-----END PGP SIGNATURE-----
