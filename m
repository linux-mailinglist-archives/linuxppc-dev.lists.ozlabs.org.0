Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B5568ADEA
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 02:24:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8WrJ6jhqz3f8g
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 12:24:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Y9WMHSnJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8WqQ2s1gz3bTB
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 12:23:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Y9WMHSnJ;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P8WqQ1B86z4xG5;
	Sun,  5 Feb 2023 12:23:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1675560194;
	bh=+S+S6flET8zT5WTMl8b0//zYmEAC41UnRzFrIe5j+eA=;
	h=From:To:Cc:Subject:Date:From;
	b=Y9WMHSnJBCuOqidZGw9ThWGyzWJxP3cfWbg9WDBOe/RlKInYwdrj7VsqjEz7ZTXpH
	 vAzn+xEIrOlOXDjOdM7SM1LLfhu8HUcpDEUQii/LLwBOWcKwIFK/w3Hhhnx+u+b39C
	 VEU8TCQHt8oUdy36lAGULLNBFYWDUQuGIoyR0qwoq5pqBdb5FDItTtrUofYMum82bA
	 Hn5ceY3oHHDYpOhtGp5IeeLbVZXSdBacnC/05xjzK2hhGbUzTWzkgYUAvqjyfT7oFV
	 uK3NOyqDGBcaY/w0IySRDfjtqEyA6ecKnAGQco4h17SILjhCZkzQXRhN4J0uHUtf2w
	 GdIk50dnwYpJQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.2-4 tag
Date: Sun, 05 Feb 2023 12:23:13 +1100
Message-ID: <87y1pcewhq.fsf@mpe.ellerman.id.au>
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
Cc: sourabhjain@linux.ibm.com, sv@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.2.

It's a bit of a big batch for rc6, but just because I didn't send any fixes the last week
or two while I was on vacation, next week should be quieter.

cheers

The following changes since commit f12cd06109f47c2fb4b23a45ab55404c47ef7fae:

  powerpc/64s/hash: Make stress_hpt_timer_fn() static (2023-01-12 10:53:37 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.2-4

for you to fetch changes up to 1665c027afb225882a5a0b014c45e84290b826c2:

  powerpc/64s: Reconnect tlb_flush() to hash__tlb_flush() (2023-02-02 13:25:47 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.2 #4

 - Fix a few objtool warnings since we recently enabled objtool.

 - Fix a deadlock with the hash MMU vs perf record.

 - Fix perf profiling of asynchronous interrupt handlers.

 - Revert the IMC PMU nest_init_lock to being a mutex.

 - Two commits fixing problems with the kexec_file FDT size estimation.

 - Two commits fixing problems with strict RWX vs kernels running at non-zero.

 - Reconnect tlb_flush() to hash__tlb_flush()

Thanks to: Kajol Jain, Nicholas Piggin, Sachin Sant Sathvika Vasireddy, Sourabh Jain.

- ------------------------------------------------------------------
Michael Ellerman (5):
      powerpc/imc-pmu: Revert nest_init_lock to being a mutex
      powerpc/kexec_file: Fix division by zero in extra size estimation
      powerpc/64s/radix: Fix crash with unaligned relocated kernel
      powerpc/64s/radix: Fix RWX mapping with relocated kernel
      powerpc/64s: Reconnect tlb_flush() to hash__tlb_flush()

Nicholas Piggin (2):
      powerpc/64s: Fix local irq disable when PMIs are disabled
      powerpc/64: Fix perf profiling asynchronous interrupt handlers

Sathvika Vasireddy (2):
      powerpc/85xx: Fix unannotated intra-function call warning
      powerpc/kvm: Fix unannotated intra-function call warning

Sourabh Jain (1):
      powerpc/kexec_file: Count hot-pluggable memory in FDT estimate


 arch/powerpc/include/asm/book3s/64/tlbflush.h |  2 +
 arch/powerpc/include/asm/hw_irq.h             | 43 ++++++++++++++------
 arch/powerpc/kernel/dbell.c                   |  2 +-
 arch/powerpc/kernel/head_85xx.S               |  3 +-
 arch/powerpc/kernel/irq.c                     |  2 +-
 arch/powerpc/kernel/time.c                    |  2 +-
 arch/powerpc/kexec/file_load_64.c             | 11 +++--
 arch/powerpc/kvm/booke.c                      |  5 +--
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 24 +++++++++++
 arch/powerpc/perf/imc-pmu.c                   | 14 +++----
 10 files changed, 77 insertions(+), 31 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmPfBM8ACgkQUevqPMjh
pYAFDQ/8CgBQ+Cf7q1yNm35L+IjA2kLub392pXEPVFf5+81hdib8VdSdLVsngXwZ
e7bwbId16xzLVGB3MDm8MqokCxwWcd3n8RjCMKal408c1qqcdlLHEi52MmQK2e2W
CIfGM5HbrqlEy8y4IfHQZ5W8DdjVh+8EzlfIMYJyyLB6508o1G9BB0ToFo/VtrZH
pB2cnXKLpthZ18l9n6t5z49rSOLukndwJif7Dloi8nTkz4NJ+uD8g1eQEQtiXPmC
KkBc19HWvHkHYGGg6nHCT0nvUEJ6jY4RBzTTyJnRdSrZwMACwiCqHS4p1EoKuU1+
kC7SN2VpJDSpGpxGItxPA+GgtaPuwWy/bY9ffEbRI46qpS2J/W2ChcAPhhdE1roY
IBIPD/p3hiAJNBtK4tpsv0hoErPnOIVKgsAsgKy/4dxojElCGGXn2FqbdFfOmp4u
Vh8vy6ploiiuQZjLB/znNyzD72jjqfyNPAaT05rLIgnAYdOnFYHm7KLoEyxL48gj
nxsDmXen8JWuVvRMpA7magZ4MHmjJ5GOaZfjqEM5d0nFIuQErlYyztQ88QfMX7Gu
TW92hAFe6F5d5FNbN+AG4l/qr6fHJ96ViIED1q+2zNj+Uh/JTMTHk0b/BuSM+6u+
SNeQrlqksha1OlgGtxb5fskdly8lPVytPXgCrWjuvU8K/jaqQN8=
=kk/e
-----END PGP SIGNATURE-----
