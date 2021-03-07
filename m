Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FAD33001A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Mar 2021 11:25:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dtd0b4lgXz3dJx
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Mar 2021 21:25:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rCTs3h4Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=rCTs3h4Z; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dtd094tB5z30Lc
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Mar 2021 21:25:29 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dtd0130Q9z9sWR;
 Sun,  7 Mar 2021 21:25:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1615112728;
 bh=hMKwh7hEcwIBqNKCtk0+MyIjBHtgNsyOwIbRteSfweo=;
 h=From:To:Cc:Subject:Date:From;
 b=rCTs3h4Z1aAWefFUxdsb6qEbsAQ9n3GsfumGz1+BzZIJ5oGOnB+uzPYS+2gY32fcE
 yM5omZz/LNxX0P/FLwwc62a6+aH4v5uGP86znhD1gYl3CmIY9hqwaJ2+y+ehTE1Wwi
 6kVMmEZSeQenhex5ajkuSv0eftLw3ZHtih23/FIH094UVAM105Is8CMJa5/HQbahbW
 gv+rPhllTIuv58CM47KwmlqfV55AJQbYtzDQpaxtVyr5bClnZbb/q3eeGHHXCHhfPw
 9YjGlLi6jXMEE5lbYaUSXsXidUIiC5Ruv38TiMoECF3I6Yi5tW6I6CuZDCzbh03Si3
 gv0xweYueFP9g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.12-2 tag
Date: Sun, 07 Mar 2021 21:25:16 +1100
Message-ID: <87mtvfqn03.fsf@mpe.ellerman.id.au>
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
Cc: feng.tang@intel.com, atrajeev@linux.vnet.ibm.com, uwe@kleine-koenig.org,
 peterz@infradead.org, gregkh@linuxfoundation.org, groug@kaod.org,
 linux-kernel@vger.kernel.org, ljp@linux.ibm.com, npiggin@gmail.com,
 jniethe5@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc fixes for 5.12:

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.12-2

for you to fetch changes up to 5c88a17e15795226b56d83f579cbb9b7a4864f79:

  powerpc/sstep: Fix VSX instruction emulation (2021-03-02 22:41:51 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.12 #2

One non-fix, the conversion of vio_driver->remove() to return void, which
touches various powerpc specific drivers.

Fix the privilege checks we do in our perf handling, which could cause soft=
/hard
lockups in some configurations.

Fix a bug with IRQ affinity seen on kdump kernels when CPU 0 is offline in =
the
second kernel.

Fix missed page faults after mprotect(..., PROT_NONE) on 603 (32-bit).

Fix a bug in our VSX (vector) instruction emulation, which should only be s=
een
when doing VSX ops to cache inhibited mappings.

Three commits fixing various build issues with obscure configurations.

Thanks to:
  Athira Rajeev, C=C3=A9dric Le Goater, Christophe Leroy, Christoph Plattne=
r, Greg
  Kurz, Jordan Niethe, Laurent Vivier, Ravi Bangoria, Tyrel Datwyler, Uwe
  Kleine-K=C3=B6nig.

- ------------------------------------------------------------------
Athira Rajeev (1):
      powerpc/perf: Fix handling of privilege level checks in perf interrup=
t context

Christophe Leroy (3):
      powerpc/603: Fix protection of user pages mapped with PROT_NONE
      powerpc/syscall: Force inlining of __prep_irq_for_enabled_exit()
      powerpc: Force inlining of mmu_has_feature to fix build failure

Greg Kurz (1):
      powerpc/pseries: Don't enforce MSI affinity with kdump

Jordan Niethe (1):
      powerpc/sstep: Fix VSX instruction emulation

Michael Ellerman (1):
      powerpc/4xx: Fix build errors from mfdcr()

Uwe Kleine-K=C3=B6nig (1):
      vio: make remove callback return void


 arch/powerpc/include/asm/dcr-native.h    |  8 +++----
 arch/powerpc/include/asm/mmu.h           |  4 ++--
 arch/powerpc/include/asm/vio.h           |  2 +-
 arch/powerpc/kernel/head_book3s_32.S     |  9 ++++---
 arch/powerpc/kernel/interrupt.c          |  2 +-
 arch/powerpc/lib/sstep.c                 |  4 ++--
 arch/powerpc/perf/core-book3s.c          |  4 ++--
 arch/powerpc/platforms/pseries/msi.c     | 25 ++++++++++++++++++--
 arch/powerpc/platforms/pseries/vio.c     |  7 +++---
 drivers/char/hw_random/pseries-rng.c     |  3 +--
 drivers/char/tpm/tpm_ibmvtpm.c           |  4 +---
 drivers/crypto/nx/nx-842-pseries.c       |  4 +---
 drivers/crypto/nx/nx.c                   |  4 +---
 drivers/misc/ibmvmc.c                    |  4 +---
 drivers/net/ethernet/ibm/ibmveth.c       |  4 +---
 drivers/net/ethernet/ibm/ibmvnic.c       |  5 +---
 drivers/scsi/ibmvscsi/ibmvfc.c           |  3 +--
 drivers/scsi/ibmvscsi/ibmvscsi.c         |  4 +---
 drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c |  4 +---
 drivers/tty/hvc/hvcs.c                   |  4 +---
 20 files changed, 55 insertions(+), 53 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmBEqeAACgkQUevqPMjh
pYALkRAAhMzfrU//Dw1pykwjlJhF6TccHSjmLh5y5V3qq95yXdhogx/XamGsuxZx
s0hAET3La+2HC75ZVtLbfDct1ZuFNUAqR7n/pyPINTqhAYPeB9VoVRSl7nLL8U19
dhxPKmtb1dBvEQFxtBO7Q5dka3S33sc1dX/ATqhXNeHpEgsN6FT99qOXzOHo3VdR
X/i+yXIoTh72f565sxxW/Ca2apy0cfdwwAwsK+S63s9Sxmsx+sF3mtY/rZs04rzg
JzsI14empb8nvz8EUJfk+In4uk9+BZxRF92OTGHvCkp6ptv+JtYT2A4h/JWnr0Vq
kS40Xwqwa62tvevUgKYcjSvaCsoC5sTaETqV/5WPIIKvXjVe5DMoZWv/JqOGRGHF
i4IbnIBEXYodcKaRto7/yNFgCvaInKjVHC1qX46ft809mfRIJlz0akUNwvIl8nRa
o479MJpBVtSf+3e491InY26RCpwaBmEB2KM3pR30TZV4jFSWZN55cnJuVW1wj0Gg
b1ObTrjJ/WjnIDUxLN2Hq4f60RWWhfxJtq9IplnWNM9kPx9AJRaUvlzS0Z2A7yFa
eSNCJlV2aXhJUGOYhVM7FMgHd0HcmF00LC22X+mfxlKbAEm1ys9VmoFPhtnkUMLX
menb5yEDGlVq+bDa0ChBUYmFx8jHbyF88YRo16TmtutW4trAr4I=3D
=3Dlgtl
-----END PGP SIGNATURE-----
