Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E29DB86F4D7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Mar 2024 13:28:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=E9T1ZS0w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tnh2G49hnz3vXt
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Mar 2024 23:28:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=E9T1ZS0w;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tnh1V4Xvkz3cVJ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Mar 2024 23:27:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709468875;
	bh=QEAXDMAV+OrDQesPZgpelgMCPzMqc/YssO9FkYejWgc=;
	h=From:To:Cc:Subject:Date:From;
	b=E9T1ZS0wpicvANs3fInjPcdL7t0mi0a2sVlkZw6m8JwihgmUCvUb9HC/rms1MSalP
	 8pv+STzglwZ2qgpuHwtk3ArMtlqk0kZkaS1/FEh1dDHqY7+abirY/7IkT3fcDY1yy6
	 eUnDNauvHvI4QGcdReSKBxI72o4Eh1AgalaJbYlHnKvb8PP9EnYfwOSK0rUsphxkvU
	 tw7j4m2zz5ETl7mbbfAh+3kPDO6xJu+pWSK1duxvpymkHrb8G5YUcKp00W9AgDJkuR
	 49ob8zpKST78vj/G4877XiCK8iwpl/viDWabPubB15CW65KTZOkLnZD/Dz51W4Pwwm
	 wANjsKuOr8Uzw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tnh1R4L9Zz4wcK;
	Sun,  3 Mar 2024 23:27:55 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.8-5 tag
Date: Sun, 03 Mar 2024 23:27:55 +1100
Message-ID: <877cijfqk4.fsf@mail.lhotse>
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, gbatra@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.8:

The following changes since commit 20c8c4dafe93e82441583e93bd68c0d256d7bed4:

  KVM: PPC: Book3S HV: Fix L2 guest reboot failure due to empty 'arch_compat' (2024-02-20 22:32:20 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.8-5

for you to fetch changes up to 380cb2f4df78433f64847cbc655fad2650e4769c:

  selftests/powerpc: Fix fpu_signal failures (2024-03-01 22:15:30 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.8 #5

 - Fix IOMMU table initialisation when doing kdump over SR-IOV.

 - Fix incorrect RTAS function name for resetting TCE tables.

 - Fix fpu_signal selftest failures since a recent change.

Thanks to: Gaurav Batra, Nathan Lynch.

- ------------------------------------------------------------------
Gaurav Batra (1):
      powerpc/pseries/iommu: IOMMU table is not initialized for kdump over SR-IOV

Michael Ellerman (1):
      selftests/powerpc: Fix fpu_signal failures

Nathan Lynch (1):
      powerpc/rtas: use correct function name for resetting TCE tables


 arch/powerpc/include/asm/rtas.h                   |   4 +-
 arch/powerpc/kernel/rtas.c                        |   9 +-
 arch/powerpc/platforms/pseries/iommu.c            | 156 +++++++++++++-------
 tools/testing/selftests/powerpc/math/fpu_signal.c |  16 +-
 4 files changed, 120 insertions(+), 65 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmXka0sACgkQUevqPMjh
pYDiQA/+I2ChbZG4duIm/lXz/vyaIeUTuiyxQmqg2ilpadn4gW7byridRki+fM6t
mfkjvRXqPXMjklYEWAoD/cOx9Fst94Dow+1kxOnj0gKIhY5xSrpIFsPBIkFYFaoA
6RNc1XshZQfc07txAKnc3jaXQAgBYZZJv54jbI33UT0Q3EGQlBO/SJYkBLzZdrJD
Cv61+EccysOlJrzzAkXdJP2OYBRbxKsSPDlnY712yhQQEfiKYSduxz9Xu8Y0s0wG
4UnrLbXnIsFSmqnwmyiG5po5kcoKhzdRh2NqQNnUWbXUBsnlpXLkEbNTt8dtd34p
68+sHOu+5k7bEROzZJ6rnRtmNMMX4ToQmPvtz3CZ1eQH0UomsxntMRz8uJegklpe
3/xUASE4X2KgfZbhyosMONBiAHFNrdhRyMKyYD7t/yaTiqFhpwm25QCm572gvh3t
SDEebeMc7fK2ExJYzf5wJDK4dTnD2yInyS7go+rkjysH7j3VKfZ5ySCbs1Vt3NpI
gI+RJC7HRx+nX4/9/aReaIvVHEQg7jAZXqCvHjA7pxLdbHTzDE9Ia/74sgmiZpbt
CYSP7xAOXH2juG9Nmd3PLVpn72neCuyMnwRDv90DT3dmSK+AtDpL3Qbqorh3UmmA
pkUqXv0lP85u9nXrobuy44o0LE/2S4aWRiUlEVWO2kdRR1PGwo0=
=CZjY
-----END PGP SIGNATURE-----
