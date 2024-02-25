Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 389CC862893
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Feb 2024 01:35:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TP4xKcBB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tj4Y605lCz3vYQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Feb 2024 11:35:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TP4xKcBB;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tj4XN3KhRz3bnv
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Feb 2024 11:35:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1708821315;
	bh=tLvA27IywCqmPJdmZJrtx88ptnr/tpk26DDMKilY+sg=;
	h=From:To:Cc:Subject:Date:From;
	b=TP4xKcBBXil+pgij8AERokUut70iOOLjx59dCdVtoSuxu8fXDPZzFDKAD5Io0LvCN
	 iPNap4A15QAWQpUQ3FPRrslmaDkRwABIC56eDHTJn4QviAUfv1r9d5QzmbOVqybGbT
	 N3fSAlRJO7GZ/v6r+ICjVMHQOTYa7lz30nPxs9Pym8m7mV3ZR2/AmaHgOGyN+7X+6x
	 afxWpRsRE1yoW6SUE0zHJu3ttll0lztp+Wfcw2IAgKzJO5RvPv8gHX3uKomEnxchMp
	 xBoJKetVL6fn7U7jX1CrwI5XAWIDqjhX1sv/lnPgZqDnpOU8giL0+dQlm6akfKGaJV
	 Xlx+n2dG19a5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tj4XL6BNkz4wcT;
	Sun, 25 Feb 2024 11:35:14 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.8-4 tag
Date: Sun, 25 Feb 2024 11:35:14 +1100
Message-ID: <87jzmt9y9p.fsf@mail.lhotse>
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
Cc: gbatra@linux.ibm.com, amachhiw@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.8:

The following changes since commit 0846dd77c8349ec92ca0079c9c71d130f34cb192:

  powerpc/iommu: Fix the missing iommu_group_put() during platform domain attach (2024-02-14 23:59:23 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.8-4

for you to fetch changes up to 20c8c4dafe93e82441583e93bd68c0d256d7bed4:

  KVM: PPC: Book3S HV: Fix L2 guest reboot failure due to empty 'arch_compat' (2024-02-20 22:32:20 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.8 #4

 - Fix a crash when hot adding a PCI device to an LPAR since recent changes.

 - Fix nested KVM level-2 guest reboot failure due to empty 'arch_compat'.

Thanks to: Amit Machhiwal, Aneesh Kumar K.V (IBM), Brian King, Gaurav Batra,
Vaibhav Jain.

- ------------------------------------------------------------------
Amit Machhiwal (1):
      KVM: PPC: Book3S HV: Fix L2 guest reboot failure due to empty 'arch_compat'

Gaurav Batra (1):
      powerpc/pseries/iommu: DLPAR add doesn't completely initialize pci_controller


 arch/powerpc/include/asm/ppc-pci.h         | 10 ++++++++
 arch/powerpc/kernel/iommu.c                | 23 ++++++++++++-----
 arch/powerpc/kvm/book3s_hv.c               | 26 ++++++++++++++++++--
 arch/powerpc/kvm/book3s_hv_nestedv2.c      | 20 +++++++++++++--
 arch/powerpc/platforms/pseries/pci_dlpar.c |  4 +++
 5 files changed, 73 insertions(+), 10 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmXaiwcACgkQUevqPMjh
pYA7WQ//X2oU8721KN9VjHyeEjMS31bqBW2VqIOhqONDZu374sbwrOxb0gfGQXGX
0BQK/YWC96BO1JShfswMYgH8zaya0DzggwFPoFxjsiS9DYY9fR4xX4mR1eFUMJ1a
Q6yDKulx1pNDe5plLqkSbAAeZoCpJPVfnNgel2YV1BiySxgZd2b/tMgxbrhyUcl4
ZZSZGQsMLVzOyllGQba0Wu87D9uJYd5mpsy5pRGeSG2nQ0fvEdjUGlQlPqOAJk4D
w8z4ukBQypFfq+XAjOeJ1Vq8lwTdtvGnSEB1VrHe1sq2jLboVDin0dSWypuOSvx8
/aO9bzOSiB+JAlGlvECEZJYvlCjXIVHXN5HpbGBI33PB6kNyq67GNmVa3JvsWtmC
3mzHH2l6PbMmaeunp8c8I/8GvaUZuADfA5dac1FU/2vCLIBYt0UXP2vOsw0dPnLF
zb4iNEPmweZC/+bVQSY1PMU+ovUqa/nVKcMcU1NAPynQVRzC8kigkvwhsbnPKmhD
o/6JmX9t7RFVLVDi8AylzATNLf0NyztDBXUE4d1eJk0Eek7EqbEyCaswqUzX2dXA
42Kq8TjEjBVV7RtanW9/IFGunpRCbyqWXM66R0AXb8lhG9WOnLdE5amlUZD2jgm9
SmTtef1sPlQJV/CBVTCEV6ASNj7wo5tZpRJSb5ON4fSq6d1nP/U=
=0p8Z
-----END PGP SIGNATURE-----
