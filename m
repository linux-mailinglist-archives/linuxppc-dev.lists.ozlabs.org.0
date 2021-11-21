Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCC34581B9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Nov 2021 05:48:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HxdG46j7pz307j
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Nov 2021 15:48:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GJ51HJe0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HxdFQ5j9Hz2xBV
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Nov 2021 15:48:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=GJ51HJe0; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HxdFK0fbtz4xcs;
 Sun, 21 Nov 2021 15:48:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1637470088;
 bh=mC6rnoasBXMiC83+R9ITQ95F9G2PxGIWjseaTS+tZZE=;
 h=From:To:Cc:Subject:Date:From;
 b=GJ51HJe0PIGy54baJ900wWm+2Cn0zqpEQuY3aYovHSvF0yy3m8Nwy+f/p75j34TXo
 SjYJ1KdUbJK0/vYrt6AnQNngW2TAIxx0HxR9ZaqqlE/zVO77Ya4ydthh9PZlBm0Bs3
 R9EAXoZXjxvtuV6BLT6LurOYyrah59PlyD3T16sYfNONGbx1rH+xUPpaCg4KT4sdS0
 tNT6b6QQLpmKyuzQVTZz5PhWL48EGXeeEDYEm8cq6UyYJevHtAEAYpwmRjzrFpm5Zl
 QDj4A18u/3oZN1K5pKClDAUF6SRswtC5nrqcBOX0ojR9V63TWC6/CcgbXvTke9IEzt
 MA1hHB0OrktOw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.16-2 tag
Date: Sun, 21 Nov 2021 15:48:02 +1100
Message-ID: <87lf1iqflp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: aik@ozlabs.ru, maz@kernel.org, masahiroy@kernel.org, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, clg@kaod.org, u.kleine-koenig@pengutronix.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some powerpc fixes for 5.16:

The following changes since commit 158ea2d2b2ff8fb49f39209a31b4920f13193a3d:

  kbuild: Fix -Wimplicit-fallthrough=3D5 error for GCC 5.x and 6.x (2021-11=
-14 18:59:49 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.16-2

for you to fetch changes up to 8e80a73fa9a7747e3e8255cb149c543aabf65a24:

  powerpc/xive: Change IRQ domain to a tree domain (2021-11-17 21:55:42 +11=
00)

- ------------------------------------------------------------------
powerpc fixes for 5.16 #2

Fix a bug in copying of sigset_t for 32-bit systems, which caused X to not =
start.

Fix handling of shared LSIs (rare) with the xive interrupt controller (Powe=
r9/10).

Fix missing TOC setup in some KVM code, which could result in oopses depend=
ing on kernel
data layout.

Fix DMA mapping when we have persistent memory and only one DMA window avai=
lable.

Fix further problems with STRICT_KERNEL_RWX on 8xx, exposed by a recent fix.

A couple of other minor fixes.

Thanks to: Alexey Kardashevskiy, Aneesh Kumar K.V, C=C3=A9dric Le Goater, C=
hristian Zigotzky,
Christophe Leroy, Daniel Axtens, Finn Thain, Greg Kurz, Masahiro Yamada, Ni=
cholas Piggin,
Uwe Kleine-K=C3=B6nig.

- ------------------------------------------------------------------
Alexey Kardashevskiy (3):
      powerpc/pseries/ddw: Revert "Extend upper limit for huge DMA window f=
or persistent memory"
      powerpc/pseries/ddw: simplify enable_ddw()
      powerpc/pseries/ddw: Do not try direct mapping with persistent memory=
 and one window

Christophe Leroy (3):
      powerpc/book3e: Fix TLBCAM preset at boot
      powerpc/signal32: Fix sigset_t copy
      powerpc/8xx: Fix pinned TLBs with CONFIG_STRICT_KERNEL_RWX

C=C3=A9dric Le Goater (1):
      powerpc/xive: Change IRQ domain to a tree domain

Masahiro Yamada (1):
      powerpc: clean vdso32 and vdso64 directories

Michael Ellerman (1):
      KVM: PPC: Book3S HV: Use GLOBAL_TOC for kvmppc_h_set_dabr/xdabr()

Nicholas Piggin (2):
      powerpc/pseries: rename numa_dist_table to form2_distances
      powerpc/pseries: Fix numa FORM2 parsing fallback code

Uwe Kleine-K=C3=B6nig (1):
      powerpc/83xx/mpc8349emitx: Drop unused variable


 arch/powerpc/kernel/Makefile                   |  3 ++
 arch/powerpc/kernel/head_8xx.S                 | 13 +++---
 arch/powerpc/kernel/signal.h                   | 10 ++++-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S        |  4 +-
 arch/powerpc/mm/nohash/kaslr_booke.c           |  2 +-
 arch/powerpc/mm/nohash/tlb.c                   |  4 +-
 arch/powerpc/mm/numa.c                         | 44 +++++++++-----------
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c |  1 -
 arch/powerpc/platforms/pseries/iommu.c         | 26 ++++--------
 arch/powerpc/sysdev/xive/Kconfig               |  1 -
 arch/powerpc/sysdev/xive/common.c              |  3 +-
 11 files changed, 52 insertions(+), 59 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmGZzfUACgkQUevqPMjh
pYDQNg//VzUcbRZgUaPw7NkPCberclTmpaFyUwk3iMx0rLH95vXhNjrCJa7tSxWk
fBp3WwVkytglPSM8CTxXNZm7ufXJyv7gO2jcpIzzkFxdD+uMODNd7wdl2rGq6Vxq
KLixLpP1696qVGKfma8NXsFlLJpUImDbRKNd5r2rYpLRSouQ8n5lfXVO1H0y4Pdn
aBxHidR10wiIG/SmDYawlAyxVmxAQZV5z7nnXYbNulB4exZeIOrSqo+XtBnr5Hem
CsLgsPizpERz6pRVKt08B9GUqNCqg8z/bwoU5xd8jlEdLGt3NX7MBkIhyoLOeSGu
94A+aQHsdP9bLp4I1cwqaA2FQ5NvU3BLwETC0nVmHtl5+unzFdm5mQMeGfkeTTqI
t0ki8d+JR5jyc8PayydXuy5RRwmRe9CHvr7mImb+RP3MMmL/ntOW0DnNWR7ARTSJ
By5lgKrm5XSer7M63LUltne5ZPUvLL2RBbGXU4HkVTbMQ0YzZikBcAg7T08CbOMz
0kMVlD+lygXk14u2WEFRYcwj4/aqGlxYVAYfKcJUiGI3jNNPi9ytGj5bL3Nityaf
XiGQ51kJREAKUNqrVHumI8JFZGtdrl7YD/7gUiCKUUV7GF6L+3imX7KQYbCIKqUN
HbN+Kni6KVkXvmu+0Y9w9aJf3l2pvyatY1cyliFfhTp1W8R7oOI=3D
=3DkNrV
-----END PGP SIGNATURE-----
