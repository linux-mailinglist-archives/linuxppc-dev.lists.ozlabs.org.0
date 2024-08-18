Return-Path: <linuxppc-dev+bounces-158-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C35955A70
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Aug 2024 02:03:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n14UcT6m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WmbXm24wTz2xT8;
	Sun, 18 Aug 2024 10:03:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n14UcT6m;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WmbXh0KRmz2xQC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Aug 2024 10:03:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723939395;
	bh=2UFLq6dlA8/JQmL3/dwSoFNJuKq4nWc6UNq2PkM3vB4=;
	h=From:To:Cc:Subject:Date:From;
	b=n14UcT6mT+io6/zpYQyiWlLaaijLJ43pu8MK9NkZ4m8euQtcr18HdyZPtWFrcwFa9
	 AwMpQl7gF46Zwq1LImMJPHBtnJk/xg3lWFgcyVfBdC4+uDrkB5g2shdLmrceKM133v
	 G6uw6qXfluoKbFUGFvQ+StxmxztLprbvO1fXLhM0jWGNcEBuDC6Osr25xhKE1rbe4W
	 Q12r764uAvX4ifGAqrV6rvJBpPy1ID8NJ2RSZ+o6h7dKdLdO1QdcJ1he9C3GfrRWzS
	 F8LVnBmgdnkVyMJ6kP3cvwCwKDTQQBHFHNaZJA3TOmm8cS20R3RxP/o8IpqggcygIe
	 z7ioXmP/hLkxQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WmbXd3cFgz4w2F;
	Sun, 18 Aug 2024 10:03:13 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
 linux@treblig.org, linuxppc-dev@lists.ozlabs.org, nysal@linux.ibm.com,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.11-2 tag
Date: Sun, 18 Aug 2024 10:03:11 +1000
Message-ID: <87r0ampuio.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some powerpc fixes for 6.11:

The following changes since commit de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed:

  Linux 6.11-rc2 (2024-08-04 13:50:53 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.11-2

for you to fetch changes up to 227bbaabe64b6f9cd98aa051454c1d4a194a8c6a:

  powerpc/topology: Check if a core is online (2024-08-13 10:32:17 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.11 #2

 - Fix crashes on 85xx with some configs since the recent hugepd rework.

 - Fix boot warning with hugepages and CONFIG_DEBUG_VIRTUAL on some platforms.

 - Don't enable offline cores when changing SMT modes, to match existing
   userspace behaviour.

Thanks to: Christophe Leroy, Dr. David Alan Gilbert, Guenter Roeck, Nysal Jan
K.A, Shrikanth Hegde, Thomas Gleixner, Tyrel Datwyler.

- ------------------------------------------------------------------
Christophe Leroy (2):
      powerpc/mm: Fix size of allocated PGDIR
      powerpc/mm: Fix boot warning with hugepages and CONFIG_DEBUG_VIRTUAL

Dr. David Alan Gilbert (1):
      soc: fsl: qbman: remove unused struct 'cgr_comp'

Nysal Jan K.A (2):
      cpu/SMT: Enable SMT only if a core is online
      powerpc/topology: Check if a core is online


 Documentation/ABI/testing/sysfs-devices-system-cpu |  3 ++-
 arch/powerpc/include/asm/topology.h                | 13 +++++++++++++
 arch/powerpc/kernel/setup-common.c                 |  1 +
 arch/powerpc/mm/init-common.c                      |  4 ++--
 arch/powerpc/mm/mem.c                              |  2 --
 drivers/soc/fsl/qbman/qman.c                       |  5 -----
 kernel/cpu.c                                       | 12 +++++++++++-
 7 files changed, 29 insertions(+), 11 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmbBOPQACgkQUevqPMjh
pYBHbRAAiC+nw/uRkmegLC601p+iVz80/GpzE3MwapPEZG1y38fTbFZBllRl9qsF
aZBsM6h8prUbMli00DjZo30nqxQQ0aHQo9Vl5Oo4MAu5Bhk4VwbwA6GkyVtrAjXF
aYeTrMsCAKngoHevyFn/7SLSfx8G+y3MK8VOtF3jA0KgW5JDNscBU3tDvt/A4iop
b5OUOv04C0CgZ1Hv90VxC2NOtMScqRn9PE9frSTGIO5nI5ZV7ufpjwrYWUBZVuPV
LWsR7AmK4hIqrd5wOxhVXyOqsf0swKZtF4/eQ5jA32Yh77cGi7tTuJjqS8vduhNx
9zaODA+EzjpnO/2Vgjf6FyOZeyh5x/DRXsBHzzCpCFdiCI4oYMVfutaCDKCAb1I4
9CRhQ+TXXFAziBkHiFZ+GcQyFxdjtNsnlf0dzm3fhVMYbz1apeLBVOYtuY6npLA0
l9udAlsdaxLrJs5VVT8ot85XKl8Hq2XTfBbtcqAO3TAz0JZJzLjK1V7+x3t5xOck
dYLDAl88Y7aOwfK7+eGTbJ9nEKS7jkln5YF6mLfy1tEJaa3j8fNXpiKm0e6s8qAl
1hsQH7FRQYqZ6vxfDuSqC6OTw1yY6UrJGrrEQY9W3d09agcAMMJwOSGvYQ4K32ja
uC1k3UgNq5L1HwbfD/I2iN4/9eGbGaTMYAvu8UkRaMnSek7pO60=
=2P31
-----END PGP SIGNATURE-----

