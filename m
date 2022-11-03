Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78134617408
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 03:10:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2nK02GDFz3cFb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 13:10:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JqFl1QRg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2nJ308hdz2xZ7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 13:09:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JqFl1QRg;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4N2nHx68XCz4xP9;
	Thu,  3 Nov 2022 13:09:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1667441358;
	bh=JSSHWTvGDMu8HB+pnn2yZCR+yhgFgEaVO6lUyM6ufbM=;
	h=From:To:Cc:Subject:Date:From;
	b=JqFl1QRgpdWHWNhPGycVaNAkX9qbOPeoyD0gMuMZw1F/V1Be4OIcf/C+kxclB+DMP
	 /iSqo0cS/Zib0IsDwY1K02NQ1fDg+6XHgwKPWLFO/7xmviCYYQ5F8frpN1Flrf+JSq
	 7P/cb6bRf2IIRIiyWncjSAEuKn1xEumX1GG/z06GnwU04jvPvm4aa6Wh17lDoKhJDh
	 EyAYuwEcsQ61m9wozPo3jfOn/emN6A292VvR9Qf7LQJ51DV6Z1N7E5SsDCGAg6mack
	 GIDS64bmJRhbeA7p9Viyx/pIrpU90vQhbBTdXxx3OUPIOTZnyV3jDw8KIN/eGFWABX
	 fIvqKBkKwnSlA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-4 tag
Date: Thu, 03 Nov 2022 13:09:17 +1100
Message-ID: <87o7tossaa.fsf@mpe.ellerman.id.au>
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
Cc: schwab@linux-m68k.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.1.

We had a few bad bugs on 32-bit and compat due to the introduction of syscall wrappers,
which caused syscall arguments to be handled incorrectly for some syscalls. I have at
least one report of it causing someone's root partition to fill up, presumably due to a
bad fallocate.

The asm-generic change affects RISC-V too, although Palmer didn't think there were likely
to be many compat users on RISC-V.

cheers


The following changes since commit 65722736c3baf29e02e964a09e85c9ef71c48e8d:

  powerpc/64s/interrupt: Fix clear of PACA_IRQS_HARD_DIS when returning to soft-masked context (2022-10-27 00:38:35 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.1-4

for you to fetch changes up to 02a771c9a68a9f08cce4ec5e324fb1bc4dce7202:

  powerpc/32: Select ARCH_SPLIT_ARG64 (2022-11-01 15:27:12 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.1 #4

 - Fix an endian thinko in the asm-generic compat_arg_u64() which led to syscall arguments
   being swapped for some compat syscalls.

 - Fix syscall wrapper handling of syscalls with 64-bit arguments on 32-bit kernels, which
   led to syscall arguments being misplaced.

 - A build fix for amdgpu on Book3E with AltiVec disabled.

Thanks to: Andreas Schwab, Christian Zigotzky, Arnd Bergmann.

- ------------------------------------------------------------------
Andreas Schwab (2):
      asm-generic: compat: fix compat_arg_u64() and compat_arg_u64_dual()
      powerpc/32: fix syscall wrappers with 64-bit arguments

Michael Ellerman (3):
      Merge tag 'v6.1-rc2' into fixes
      powerpc/64e: Fix amdgpu build on Book3E w/o AltiVec
      powerpc/32: Select ARCH_SPLIT_ARG64


 arch/powerpc/Kconfig                     |  3 ++-
 arch/powerpc/include/asm/syscalls.h      |  7 +++++++
 arch/powerpc/kernel/sys_ppc32.c          | 13 ++++++++++++-
 arch/powerpc/kernel/syscalls/syscall.tbl |  7 +++++--
 include/asm-generic/compat.h             |  2 +-
 5 files changed, 27 insertions(+), 5 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmNjINoACgkQUevqPMjh
pYCh1A//cDma7NOr7AgBcSCDjifYW+k7zSDgo/kELK126zsWa1mEeBBMNqbLVbRM
PPYjZUT8wcAjfKRm1V50Y5AoLjk+Me0IyNswKmWJQGUvQgwTt67GI90Z5eR3NiDl
niIfJYCccV2dqL+8SvEAWqCnXK/ViVFeTQfqf11SahS4Ste+vHW91sFrnew7gHb9
2sChygEsGq03iOOaVjXy0NArcCKWonAkzoxGtlTp1EWzfXNg5ApiydLfonlxofQk
t6DE3EGHq6fKaFy+fyTuIuKsqbfn2ucQ/yTXPxtnNThOIxTqj8VjMmfYgbiyMWHG
LIZ36o5sOblL1eFFYed+Dokg89hI5lJm6CCwc9/8WeTddX9wEZnRylgF9wSelQ+9
6PZrdfK7IqWC3Ugu+mI+xl0VjUj9jEdDMZNeus65xC7+3qRabOTsQxIIHDk4lM7J
DNxfVU2NNjM4Qh1FEC0JSVMlabW3Xk72OFilKf/OKJCxPAQUccjrI146yd1Ygqsc
diwzE94nkEeggYH1uPSfDeFT4t5l+jL0pSdVhjrMcnJBwVI/PjsR47a2YnrFqKUz
FQAKAbr/tJOM9sTsqaiZmMGh2lcMW8/pKZOwZoaA6YIM14jkchzNIpOyb/GRop9w
zf2VsG5UU5C4paW8yZ0sj5YyC+Ts2breiZJFNZzCmPsZzAH8wg8=
=rvku
-----END PGP SIGNATURE-----
