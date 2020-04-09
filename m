Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9121A32F2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 13:09:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ydgx0pyPzDrCX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 21:09:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yddh0MMpzDrF0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 21:07:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=F+kEw+Ih; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48yddc52bhz9sRN;
 Thu,  9 Apr 2020 21:07:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1586430439;
 bh=xotQBYRFGsmzLCVRR6MSqTD+OJW/kGzZooVJ093bNOI=;
 h=From:To:Cc:Subject:Date:From;
 b=F+kEw+IhkO4MBLJ1wh7SK9D68H/+Cjwmbg92YGaUsmrBL8t+hWtMY81q1/z0tF0Zd
 5Glpc9phI91qtWD6DAtLBlrHluWoPSAy/alP/ev63padSXiLytkoqlrKgFdny90MSu
 Jgk2vMdEbMdCqgGaVO2Lf7Yah+KftobWjAQdiC3uLV1m4F021j6RClkpRZdqCkW3FV
 h2vvSPdq+DRqw5U+JsKowf9Y9lFEEXJ0swScwQKfWQJaVRGZJG8kSmsTXt1bGC94sV
 oP+iTA0xMmeiPk/1Ks7/tDX7mdsC5U+LycD6gTHAc6znnjetfJUfbFVXw/D+uhDovS
 kCd7epszhYHPQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.7-2 tag
Date: Thu, 09 Apr 2020 21:07:24 +1000
Message-ID: <87pncgkjdf.fsf@mpe.ellerman.id.au>
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
Cc: geert+renesas@glider.be, aik@ozlabs.ru, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, geoff@infradead.org, anju@linux.vnet.ibm.com,
 ganeshgr@linux.ibm.com, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org,
 elfring@users.sourceforge.net, dan.carpenter@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc updates for 5.7.

The bulk of this is the series to make CONFIG_COMPAT user-selectable, it's been
around for a long time but was blocked behind the syscall-in-C series. Plus
there's also a few fixes and other minor things.

cheers


The following changes since commit c17eb4dca5a353a9dbbb8ad6934fe57af7165e91:

  powerpc: Make setjmp/longjmp signature standard (2020-04-01 14:30:51 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.7-2

for you to fetch changes up to 6ba4a2d3591039aea1cb45c7c42262d26351a2fa:

  selftests/powerpc: Always build the tm-poison test 64-bit (2020-04-04 21:41:40 +1100)

- ------------------------------------------------------------------
powerpc updates for 5.7 #2

 - A fix for a crash in machine check handling on pseries (ie. guests)

 - A small series to make it possible to disable CONFIG_COMPAT, and turn it off
   by default for ppc64le where it's not used.

 - A few other miscellaneous fixes and small improvements.

Thanks to:
  Alexey Kardashevskiy, Anju T Sudhakar, Arnd Bergmann, Christophe Leroy, Dan
  Carpenter, Ganesh Goudar, Geert Uytterhoeven, Geoff Levand, Mahesh Salgaonkar,
  Markus Elfring, Michal Suchanek, Nicholas Piggin, Stephen Boyd, Wen Xiong.

- ------------------------------------------------------------------
Alexey Kardashevskiy (1):
      powerpc/pseries/ddw: Extend upper limit for huge DMA window for persistent memory

Anju T Sudhakar (2):
      powerpc/perf: Implement a global lock to avoid races between trace, core and thread imc events.
      powerpc/powernv: Re-enable imc trace-mode in kernel

Dan Carpenter (1):
      powerpc/ps3: Remove an unneeded NULL check

Ganesh Goudar (1):
      powerpc/pseries: Fix MCE handling on pseries

Geert Uytterhoeven (1):
      powerpc/time: Replace <linux/clk-provider.h> by <linux/of_clk.h>

Geoff Levand (1):
      powerpc/ps3: Set CONFIG_UEVENT_HELPER=y in ps3_defconfig

Markus Elfring (1):
      powerpc/ps3: Remove duplicate error message

Michael Ellerman (2):
      selftests/eeh: Skip ahci adapters
      selftests/powerpc: Always build the tm-poison test 64-bit

Michal Suchanek (7):
      powerpc: Add back __ARCH_WANT_SYS_LLSEEK macro
      powerpc: move common register copy functions from signal_32.c to signal.c
      powerpc/perf: consolidate read_user_stack_32
      powerpc/perf: consolidate valid_user_sp -> invalid_user_sp
      powerpc/64: make buildable without CONFIG_COMPAT
      powerpc/64: Make COMPAT user-selectable disabled on littleendian by default.
      powerpc/perf: split callchain.c by bitness

Nicholas Piggin (3):
      powerpc/64s: Fix doorbell wakeup msgclr optimisation
      Revert "powerpc/64: irq_work avoid interrupt when called with hardware irqs enabled"
      powerpc: Improve ppc_save_regs()


 arch/powerpc/Kconfig                             |   5 +-
 arch/powerpc/configs/ps3_defconfig               |   2 +
 arch/powerpc/include/asm/thread_info.h           |   4 +-
 arch/powerpc/include/asm/unistd.h                |   1 +
 arch/powerpc/kernel/Makefile                     |   5 +-
 arch/powerpc/kernel/entry_64.S                   |   2 +
 arch/powerpc/kernel/exceptions-64s.S             |  19 --
 arch/powerpc/kernel/irq.c                        |  13 +
 arch/powerpc/kernel/ppc_save_regs.S              |   6 +-
 arch/powerpc/kernel/ptrace/Makefile              |   2 +-
 arch/powerpc/kernel/signal.c                     | 144 +++++++-
 arch/powerpc/kernel/signal_32.c                  | 140 --------
 arch/powerpc/kernel/syscall_64.c                 |   6 +-
 arch/powerpc/kernel/time.c                       |  48 +--
 arch/powerpc/kernel/vdso.c                       |   3 +-
 arch/powerpc/perf/Makefile                       |   5 +-
 arch/powerpc/perf/callchain.c                    | 356 +-------------------
 arch/powerpc/perf/callchain.h                    |  19 ++
 arch/powerpc/perf/callchain_32.c                 | 196 +++++++++++
 arch/powerpc/perf/callchain_64.c                 | 174 ++++++++++
 arch/powerpc/perf/imc-pmu.c                      | 173 ++++++++--
 arch/powerpc/platforms/powernv/opal-imc.c        |   9 +-
 arch/powerpc/platforms/ps3/os-area.c             |   4 +-
 arch/powerpc/platforms/pseries/iommu.c           |   9 +
 arch/powerpc/platforms/pseries/ras.c             |  11 +
 drivers/ps3/sys-manager-core.c                   |   2 +-
 fs/read_write.c                                  |   3 +-
 tools/testing/selftests/powerpc/eeh/eeh-basic.sh |   5 +
 tools/testing/selftests/powerpc/tm/Makefile      |   1 +
 29 files changed, 766 insertions(+), 601 deletions(-)
 create mode 100644 arch/powerpc/perf/callchain.h
 create mode 100644 arch/powerpc/perf/callchain_32.c
 create mode 100644 arch/powerpc/perf/callchain_64.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl6O+ZoACgkQUevqPMjh
pYBTEA/8Dkp4b60dA28iP/z6XntEIl3QT4rxAa3M89Pws6gxUw6uG5UmvjZe+lAa
IezHEfFx5cwAiXqMIT1NFF4H4QAeOZEN4bq0sIkOPXdme+75oWK4qSGdgXwdTEXr
ssW7I7LPGwMYJZUBhhHkijD0IN7nK2Tdd22Yucj2fGLX2Rzhst4302Dl7CH8SmZf
waoQZBB6PrxV1HxGv92Sb83iuhOqhgAdhwwQS50PVzSPlZH8vBW3HDMIESg9pHWT
NrNq7I8Y0mk6YUfmwWgJbVpqftXInnRjisFNQij7wBYtK8lw/vBOA5j1avqmhkNl
NJPGp5eGkC0MLfsx6qLYC+6FEcAYHfPHAlMpq6/6HvicNmEc0rrHU8dx2owb63p1
ahn57m1JOS1ndITTOWCjDXaOQC/Ho32duWmz6m+HJMD7X7cPH9ITbbKsRZzWP3Zm
5H64UEPsWDeia9c90FqjuA2xYSD4lIGUKAQ6Z73LXmUz2E8fF0/98ZniBvuFM8ce
w/Lg8edlX5Bg9n4elFsCYagHPRK5i9Tmv9Bdnw4tJ30yGPQ86ZLTmaq3ru0lky/1
mQ/Za/1wKydS3rq94Qnhag1EKUghBVgNzwtCACoONsaUHTcf9ybD6dE+riQ5J6VZ
ec3y1+QjyaQMxgJdnafIPAsQ1OH1L5wPZkr0ZKBzy+qAtACeHpE=
=9QaQ
-----END PGP SIGNATURE-----
