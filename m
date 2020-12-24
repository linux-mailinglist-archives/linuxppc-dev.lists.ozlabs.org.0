Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 909D72E238A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Dec 2020 02:55:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1Y7K6snkzDqMn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Dec 2020 12:55:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1Y4q4bLGzDqMf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Dec 2020 12:53:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=DuVutKKu; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4D1Y4n4Byqz9sWt;
 Thu, 24 Dec 2020 12:53:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1608774794;
 bh=VmOttokvTZf4kTcNrcWAtrVw4qqV0BBiEJD/QSy/ZbI=;
 h=From:To:Cc:Subject:Date:From;
 b=DuVutKKuiXJTeoEV7SlvJeU3GpXbrGQwVxlU6ri3C6+KTQ1mhOf3vLgpNlGwM7L1Z
 Kgo0pXB0xK7jW8NSKjTZzmjQDD1pkiQTPua7XuHOdWKsa0e+dYBkM2Ycytr7xaxcDN
 bNFucAxyW/mKYlyIWH8zk8BvldmYQgSj+XAMYX+JZbnJlvTcE52wRfImny+WFIf/Ul
 pzmC9J5yg9mrBc0VCylPF6hIY8v63CbyRdxYzvpGn5huIrEmFeSY34XwDaDdIlDVr3
 SiaQLEBuHtIii+YUeKXuFBMI8V3jYqA00NpasHGljKX8Y9ZbF1kOZzMNasF2xalkZa
 k52bVQ2ix1c2Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.11-2 tag
Date: Thu, 24 Dec 2020 12:53:10 +1100
Message-ID: <87ft3w6kc9.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, clg@kaod.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some powerpc fixes for 5.11:

The following changes since commit 8a5be36b9303ae167468d4f5e1b3c090b9981396:

  Merge tag 'powerpc-5.11-1' of git://git.kernel.org/pub/scm/linux/kernel/g=
it/powerpc/linux (2020-12-17 13:34:25 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.11-2

for you to fetch changes up to d5c243989fb0cb03c74d7340daca3b819f706ee7:

  powerpc/32: Fix vmap stack - Properly set r1 before activating MMU on sys=
call too (2020-12-21 22:24:00 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.11 #2

Four commits fixing various things in the new C VDSO code.

One fix for a 32-bit VMAP stack bug.

Two minor build fixes.

Thanks to:
  C=C3=A9dric Le Goater, Christophe Leroy, Will Springer.

- ------------------------------------------------------------------
Christophe Leroy (2):
      powerpc/time: Force inlining of get_tb()
      powerpc/32: Fix vmap stack - Properly set r1 before activating MMU on=
 syscall too

C=C3=A9dric Le Goater (1):
      powerpc/smp: Add __init to init_big_cores()

Michael Ellerman (4):
      powerpc/boot: Fix build of dts/fsl
      powerpc/vdso: Block R_PPC_REL24 relocations
      powerpc/vdso: Don't pass 64-bit ABI cflags to 32-bit VDSO
      powerpc/vdso: Fix DOTSYM for 32-bit LE VDSO


 arch/powerpc/boot/Makefile               |  2 ++
 arch/powerpc/include/asm/ppc_asm.h       |  7 +++++-
 arch/powerpc/include/asm/vdso/timebase.h |  2 +-
 arch/powerpc/kernel/head_32.h            | 25 +++++++++++++-------
 arch/powerpc/kernel/smp.c                |  2 +-
 arch/powerpc/kernel/vdso32/Makefile      |  4 ++--
 arch/powerpc/kernel/vdso64/Makefile      |  2 +-
 7 files changed, 29 insertions(+), 15 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl/j9DYACgkQUevqPMjh
pYBjQQ/8CcfenT8pA9/vHqI/soyjASFrFtQLiHz1IrAJtzs1USnOrI9JhTYOsLlb
HoUBITMzHJx9TkcT5l06f+BdscNRuCoxn3QLzfBZZkAFHK2Rfn51xJ7Un+THyZzc
3jqtuzrfBaoq3Ccut7Y0QrfuGW6eV+Q26/JThZJBee/K6jzBucPV7ZA/xA4qpLyY
XxAnubSK/kMQixOOWeCqAgjcx8/CHe1rf7UhT2rWdLDoaUxq7UjIpbZlZ2r8YwiO
e7FbrWKps0o3RW5953mYhYyHpIKanJlnB2Hl90g/MBRuwDqcoiTeKuAQV/7fNWOx
eWRA2FfEFON+j4/3LEs6IN+OxSEoF/DkfBFnFogdbx4sv2uwrXwlWzDyRfWJJSNK
PHKdUXE7sST4U9QgCZ0Mn5vz6BvCLWRFTowP4VR//we+xSyYca0s56XnKGZvEV/F
dQ45aACT5EMjF1B/+AG725wf4ELKmxdJNXjLvrfuWuUsz5mt3Tl1Uh0pPmT3BD4B
M1evyjp7+noSCjHYTooBiVqJwM2begiGBM4pD0UqLHt4cl6xvGhUE/LckJKmsPxn
/WtXnXTg+/zBFO0NZ0s7UVcbO5sCpSVIRJ+cGL1AR/fWMSQBGxoH4JRJ4ov9rJGh
/usuFCwBJKpRJxLFhgi5TrSnfYpoH+svHDU4deytU6wWmnenrzA=3D
=3DV9FR
-----END PGP SIGNATURE-----
