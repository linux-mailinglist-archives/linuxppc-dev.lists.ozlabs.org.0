Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F2C8D72E1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2024 01:58:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DFSOrQ4T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VsH4L40phz3cF4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jun 2024 09:58:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DFSOrQ4T;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VsH3f0yYSz30Sv
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jun 2024 09:57:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717286254;
	bh=D2MP2e8VMlG4JO4CXpIHI0rEQHY0ay7+BGfxfkpwVfE=;
	h=From:To:Cc:Subject:Date:From;
	b=DFSOrQ4Tm4bISxpfZo1YwLJxtYsdTdRjjVqP/IQoqfdeSGz37aU87T3X2YMgBOtcQ
	 uUqTpoKNNXb3n6IDkfwWgL++SfjbFscji/XmXjFXo9ncEEYocsNekIxvvz/RX+BOXs
	 6KTemgKQJa0Gshv/iOCi4H5dbAzRST9M0YWvDriVafz1woye2OX46pT0FzZ89cHGcx
	 +ifqBQ/xxAmL0obuqW0BtDndhY6k/+O+2/2D8DwLZID3VA0TOvqC4p2smQ0RSmstqZ
	 +PlMW5ANnf5SBOEjOKabf+Wvt5xkSJfJRp5kMEYCWUwXOKTodcRdclWHGcdfZyGxlu
	 ChxHyo17gjYPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VsH3f0dnxz4xFB;
	Sun,  2 Jun 2024 09:57:34 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.10-2 tag
Date: Sun, 02 Jun 2024 09:57:33 +1000
Message-ID: <87jzj82p3m.fsf@mail.lhotse>
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
Cc: nathanl@linux.ibm.com, puranjay@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, samuel.holland@sifive.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc fixes for 6.10:

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.10-2

for you to fetch changes up to be2fc65d66e0406cc9d39d40becaecdf4ee765f3:

  powerpc: Limit ARCH_HAS_KERNEL_FPU_SUPPORT to PPC64 (2024-05-30 22:57:27 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.10 #2

 - Enforce full ordering for ATOMIC operations with BPF_FETCH.

 - Fix uaccess build errors seen with GCC 13/14.

 - Fix build errors on ppc32 due to ARCH_HAS_KERNEL_FPU_SUPPORT.

 - Drop error message from lparcfg guest name lookup.

Thanks to: Christophe Leroy, Guenter Roeck, Nathan Lynch, Naveen N Rao, Puranjay
Mohan, Samuel Holland.

- ------------------------------------------------------------------
Michael Ellerman (2):
      powerpc/uaccess: Fix build errors seen with GCC 13/14
      powerpc/uaccess: Use YZ asm constraint for ld

Nathan Lynch (1):
      powerpc/pseries/lparcfg: drop error message from guest name lookup

Puranjay Mohan (1):
      powerpc/bpf: enforce full ordering for ATOMIC operations with BPF_FETCH

Samuel Holland (1):
      powerpc: Limit ARCH_HAS_KERNEL_FPU_SUPPORT to PPC64


 arch/powerpc/Kconfig                     |  2 +-
 arch/powerpc/include/asm/uaccess.h       | 27 ++++++++++++++++++++
 arch/powerpc/net/bpf_jit_comp32.c        | 12 +++++++++
 arch/powerpc/net/bpf_jit_comp64.c        | 12 +++++++++
 arch/powerpc/platforms/pseries/lparcfg.c |  4 +--
 5 files changed, 54 insertions(+), 3 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmZbtSIACgkQUevqPMjh
pYALTQ//YkCAb17EW6iQfmcuaq7Amhz5QUDUU3TFhfcmmuDd3Fw3bh9sppF+so0S
UsZpBRgY9C6xFkOqpyrqj9KOSXNsWE5m46Hp0Cl7BlkdeM2c68T77BxN5pEcnI4i
so64UHaLDI0miirQE25ihA4BdmtzAfw6PL6vubcBoLrlSWktXDQXBZb0EkOeYNiR
QI+4EnwfkUiw+55eXEHoWIwWuyW7oMd2px8wXEnb9daOxu7NqDhKINVYN8g0If8u
m90egWk56gq1A/ei43zeqPQAKi8hvQe93+tkmCI7NkJCx+YrYmUStqIC/4/iZlJd
XMaUre8mckU6eWRfUL5G28BDETtNm3t2TlflJ+GK1XvLd0LOj2SEk0f5i2bXA6ey
o1ISDVE3dRbS3CzfiZw8S7QvJiCeqBU1d3gMjNge+c1iSG0rgd20tMA17+SEKaHn
W2tSZev6P9vbpF+9R0kxvyCRQ3EmPeOReSk0XIXU+X0V2NFIEIzQJMS/2NL2Mro8
O5tj3elpRbqSa/rEUUQymUpQ3qEkTfoFrIAiCkFvu+OcAtq26OL18olxWo0RF9Fg
8ElHjsGLMDNPyTrBIIIegcgsX+/fvGbwg5NpQlXOD564Y0cMfYi8kYwgU6Z9ism1
YfKFgvrj1akmTMrZobqZ1N0tCjXZVbRP+ykyT6uUtG7ut4v4d8U=
=+3xo
-----END PGP SIGNATURE-----
