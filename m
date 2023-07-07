Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 818A974B1BF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 15:27:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bZplSR3g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QyDhK3WtQz3c50
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 23:26:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bZplSR3g;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QyDgQ6Szpz3bnt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 23:26:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1688736370;
	bh=RjFudN2v4bhzNxCuByoq2h/CbTispUzi4a0aD2emOMQ=;
	h=From:To:Cc:Subject:Date:From;
	b=bZplSR3gH/yZQCgcKsOr6CAhSBRiczQhttW/G7MXRUfDzOrK/fEFhZh88MGbUri6V
	 1AJ/QCsz1xbGKx64Q4mhqlKOMS91kow2TGmQx5cNiG7pXvbygzZU1KHwU+4Dk/7ZFv
	 nRY5TAFkwMPjLgf0dv5ibLfXYfUXgvOh/2Vj+9PM9VAnxCyb/FZGqBo/T/T50YuYe5
	 BTwD1s9Grrevo8ptZcWsg3mw0SdfZ+k8hIrKsU61H8Pu1rpsjrqUjeZgLSxxyj8dux
	 AwLk4unXiyD81nAuLlqRFUDtnw+q+g5PV3UnfmM2xme4J78PZv9FKfVG2lRWJsi7ed
	 zFVBjvnaOCuDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QyDgQ4xsPz4wxP;
	Fri,  7 Jul 2023 23:26:10 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.5-2 tag
Date: Fri, 07 Jul 2023 23:26:06 +1000
Message-ID: <875y6vluoh.fsf@mail.lhotse>
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
Cc: pali@kernel.org, rdunlap@infradead.org, linuxppc-dev@lists.ozlabs.org, dianders@chromium.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull a few powerpc fixes for 6.5:

The following changes since commit d8b0bd57c2d68eb500f356f0f9228e6183da94ae:

  Merge tag 'powerpc-6.5-1' of git://git.kernel.org/pub/scm/linux/kernel/gi=
t/powerpc/linux (2023-06-30 09:20:08 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-6.5-2

for you to fetch changes up to abaa02fc944f2f9f2c2e1925ddaceaf35c48528c:

  powerpc: dts: turris1x.dts: Fix PCIe MEM size for pci2 node (2023-07-03 1=
6:26:51 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.5 #2

 - Fix PCIe MEM size for pci2 node on Turris 1.x boards.

 - Two minor build fixes.

Thanks to: Christophe Leroy, Douglas Anderson, Pali Roh=C3=A1r, Petr Mladek=
, Randy Dunlap.

- ------------------------------------------------------------------
Douglas Anderson (1):
      powerpc: Include asm/nmi.c in mobility.c for watchdog_hardlockup_set_=
timeout_pct()

Pali Roh=C3=A1r (1):
      powerpc: dts: turris1x.dts: Fix PCIe MEM size for pci2 node

Randy Dunlap (1):
      powerpc: allow PPC_EARLY_DEBUG_CPM only when SERIAL_CPM=3Dy


 arch/powerpc/Kconfig.debug                | 2 +-
 arch/powerpc/boot/dts/turris1x.dts        | 6 +++---
 arch/powerpc/platforms/pseries/mobility.c | 1 +
 3 files changed, 5 insertions(+), 4 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmSoEjEACgkQUevqPMjh
pYDReg/9Fa0T8KPBQYLQPMG0n8kHf2nDFv4UoB/jnf3TvxpdPqOVDFBveXZbr75p
jvOw8EooS/zn460xni+SgJIE9nrgwJePBss7EX77wsIeY/OJ7BLgBUoXBGVWim0T
7mx3t36DC3yqrTCeEnBndil4E+IBY/J9j63tyO3weY6N2qXZMwxZ4fpeLvo8/mM2
OuaGvSgRg3KPjubHpkHtlowDiSQg5PfaNWI4t88BaQ8rIRWGZDmqUyAYLcM7ycSf
XlSbSeV+aUBQLUTM41L5H521R4e6NssCRUEEMRIjXQDWr2E9qAloq1d0rm1XJopB
5l13Pq+tfXliPdPLRbonqY0HuVDEBOSsChpFtg2teMin2XNJsV7UwR6Y52ay0fNk
z6y4pv4LrnQmoiN/BjLCl/p9E6caLjTn38CIoaWSrI3+IDyzKy/lyb9pkr8s9x+O
yXHnmIgZHUwR8z6vQt6wWF/wD8OabMMScKiNsq0hAs+EojsQbhiNf0p4w3faKRY5
leIA7AK5zDrZpjShOv7ajnsbbMnRmwgaS289qNePULDDqhmIMSjXmN42vCJmMN1A
qvyx21H0kKklTA3mo8hD84iKDkQKU0IWQHhkq19GeVI+9QScsxIz3Vqc7O9KNVN+
OF3eckv7APwDGU8t8un3YIVNVRKCryZCeYeovSwiLHM2+9HjojM=3D
=3DACih
-----END PGP SIGNATURE-----
