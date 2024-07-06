Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2270E9295E8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 01:29:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MGu/4hdM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGmn46kg2z3cSN
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 09:29:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MGu/4hdM;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGmmM6hFZz30Vf
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2024 09:28:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720308531;
	bh=MZPrrz50Q58iHN+nAhEHGrx3MePXgnyuTKmR8fmWfbE=;
	h=From:To:Cc:Subject:Date:From;
	b=MGu/4hdMEq1NfRSrcEM5BBzs52X1JsfoSUUAH8Ghd/LxT95qE/s8hpDIOoCYaaUDx
	 /u/V/s0Zo1fx1BZkBzwfO3r6x1vBmBDnZg5RQeu6TrmmLS1blJ/TxHZdBpIfEtMCti
	 Z/JDW9VqrdC7o98vIDmsQhE/TIaITFGyj0lBPutAVZ0E4HO4Iimm1fYgn0DSKpctrL
	 Rh03tpgPNKg0behZHP23t/78uUs7mH2t5giXo0ApIMuiVaMPW+bnFGZBaQpaQBiUHo
	 yal2y8bgas+KhoEmpuNEsW94ayLWciiTrl3RgYBYM5LoIHUETLRaKesFVcf2yEmsgb
	 m1R6deEBdTc7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WGmmL75HJz4xNg;
	Sun,  7 Jul 2024 09:28:50 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.10-4 tag
Date: Sun, 07 Jul 2024 09:28:50 +1000
Message-ID: <87wmly2j7x.fsf@mail.lhotse>
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
Cc: anjalik@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, ganeshgr@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinglin.wen@shingroup.cn
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.10:

The following changes since commit a986fa57fd81a1430e00b3c6cf8a325d6f894a63:

  KVM: PPC: Book3S HV: Prevent UAF in kvm_spapr_tce_attach_iommu_group() (2024-06-16 10:20:11 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.10-4

for you to fetch changes up to 8b7f59de92ac65aa21c7d779274dbfa577ae2d2c:

  selftests/powerpc: Fix build with USERCFLAGS set (2024-07-06 22:10:14 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.10 #4

 - Fix unnecessary copy to 0 when kernel is booted at address 0.

 - Fix usercopy crash when dumping dtl via debugfs.

 - Avoid possible crash when PCI hotplug races with error handling.

 - Fix kexec crash caused by scv being disabled before other CPUs call-in.

 - Fix powerpc selftests build with USERCFLAGS set.

Thanks to: Anjali K, Ganesh Goudar, Gautam Menghani, Jinglin Wen, Nicholas
Piggin, Sourabh Jain, Srikar Dronamraju, Vishal Chourasia.

- ------------------------------------------------------------------
Anjali K (1):
      powerpc/pseries: Whitelist dtl slub object for copying to userspace

Ganesh Goudar (1):
      powerpc/eeh: avoid possible crash when edev->pdev changes

Jinglin Wen (1):
      powerpc/64s: Fix unnecessary copy to 0 when kernel is booted at address 0

Michael Ellerman (1):
      selftests/powerpc: Fix build with USERCFLAGS set

Nicholas Piggin (1):
      powerpc/pseries: Fix scv instruction crash with kexec


 arch/powerpc/kernel/eeh_pe.c             |  7 +++++--
 arch/powerpc/kernel/head_64.S            |  5 +++--
 arch/powerpc/kexec/core_64.c             | 11 +++++++++++
 arch/powerpc/platforms/pseries/kexec.c   |  8 --------
 arch/powerpc/platforms/pseries/pseries.h |  1 -
 arch/powerpc/platforms/pseries/setup.c   |  5 ++---
 tools/testing/selftests/powerpc/flags.mk |  5 +----
 7 files changed, 22 insertions(+), 20 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmaJ0hYACgkQUevqPMjh
pYB1uBAAhxsR3VV+XLbJTkhEARgUdzZt+8AMk4oc7dzPx1xUIavXJqaMGdoCGDcu
0atvYlyel2CAFHbjRkaIzOxg2ZUtXdOvio4udeFvb48DCnaaH0WsOdG70OIThtX0
Zl+lkRgRy5SM1KPJUa+o9ygvi90ZNbOV358h/ar9l4O7EULmOqZwlZYAhlEYr25B
MtvX6ZONGOgl5SxVr9+55vLm0/g97OzuGmi343XHEdHjBhH5HkcKi8Z5XkwYFGOt
cExZFVtWnayM+PsUkympt3o5Zchb+oc1EUAJWUILQJQMHx89atc9Q0pxZyi7XXA/
tT8mq0O78+iZbK1UuQ3qgE1/YPrHCdX8Glo0AmGoSem8P41HlWyamK28U4aK6VWd
iqJCb25EZmKs5uo4Z0F10jswjc9QOgFftzgM74GCLkZ74vx3ubw9vKacRb/SkdLi
vQz0M0Gh73tqwfjN0W3gRwWblCim3kCoHVBb8CmiB0YeDoq7nu2+ow94WFrhlvs+
/HFOQ5NgnMhjzytmeAzWOk0s/xOXPCwbrEUjfRxRg5cZCWXUuO6XmeO547pZy2Ke
JwBWO+Hi9b5jwC/5LEQZ3wJ2rjSCJwDKT8MwqvcSSsEXvpGvsjMCi4mTqVVlbRkQ
qz/lv0PozyavP/AUPamX0wZ0k5df/XDkX1qxoxyG/x1HXlwDhJ4=
=7pyj
-----END PGP SIGNATURE-----
