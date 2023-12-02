Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC52D801FAA
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Dec 2023 00:13:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EFkrCGBy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SjQhN1sMbz3d8d
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Dec 2023 10:13:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EFkrCGBy;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SjQgX4Cy4z2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Dec 2023 10:12:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701558743;
	bh=diPwzgYq7ttjANZrcYoi/1ctTlG834TrG8++NNBlRMM=;
	h=From:To:Cc:Subject:Date:From;
	b=EFkrCGBy3yqmIU7ECyk208SVqtt/FvspZPTZuuD8mbuY+yqEhjm6kfn91n3JY0YN2
	 mFWrmZNjYob4te5S8htmaUXsgByisNjyQkWnPGVKFVNySIxFH7UXXdIMz+6nYjIgEq
	 1fWJNfFSNBmSzdTo9bJ89HH/3xMqx8Pm/HhODkPaRAJwmFBYrQP/kC9fM5KR/TNfM2
	 teVBkWPfEpM7snHmk/UQF6JWadoxtKeY8jbeHrWMGaDYUZ3/3BoRBUyz9ISLkTOxm3
	 CvDTZZfMWTyozGa6KRpASW7VrO8gZ9Cmmb5oYc4H3UDUGEG0hJ/jRl1ZBx+hLjPB+N
	 yOfzpTI+eZjyw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SjQgW5w7cz4wd7;
	Sun,  3 Dec 2023 10:12:23 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.7-3 tag
Date: Sun, 03 Dec 2023 10:12:23 +1100
Message-ID: <87jzpw9p2g.fsf@mail.lhotse>
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
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org, npiggin@gmail.com, tpearson@raptorengineering.com, daniel@mariadb.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some powerpc fixes for 6.7:

The following changes since commit 98b1cc82c4affc16f5598d4fa14b1858671b2263:

  Linux 6.7-rc2 (2023-11-19 15:02:14 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.7-3

for you to fetch changes up to dc158d23b33df9033bcc8e7117e8591dd2f9d125:

  KVM: PPC: Book3S HV: Fix KVM_RUN clobbering FP/VEC user registers (2023-11-29 22:24:21 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.7 #3

 -  Fix corruption of f0/vs0 during FP/Vector save, seen as userspace crashes
    when using io-uring workers (in particular with MariaDB).

 -  Fix KVM_RUN potentially clobbering all host userspace FP/Vector registers.

Thanks to: Timothy Pearson, Jens Axboe, Nicholas Piggin.

- ------------------------------------------------------------------
Nicholas Piggin (1):
      KVM: PPC: Book3S HV: Fix KVM_RUN clobbering FP/VEC user registers

Timothy Pearson (1):
      powerpc: Don't clobber f0/vs0 during fp|altivec register save


 arch/powerpc/kernel/fpu.S     | 13 +++++++++++++
 arch/powerpc/kernel/process.c |  6 +++---
 arch/powerpc/kernel/vector.S  |  2 ++
 3 files changed, 18 insertions(+), 3 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmVruPoACgkQUevqPMjh
pYBdlg//cW9CHahWFix93X5k3b+5LluRynR63BN4FnY+qVni95ihTxRC56rRpmUE
JfbgADz3fFgPdX4/XXnpkrMY7rDyrwTelNT1X5Dl6nwounrqBRvCvplfHrlAPZqR
C12ZBgbdJJmLucAtZv0mXsJ1NMiay9QZK7qIS7xJ22F7nEmnb5/BWs908hH6IwP0
pPOoi0AwiLqtsi6caIXr4GV1qoUbhfNOihZdXObCKetaOpEdcHUfu/vcNOhsVfgS
f8NbyOKZ+dLasCB5ifa5gVw7MQfj++ljLive5C2t51Y1v2I1C3KRhQdoZmTFvWZD
CXxRdCVfgrG5KWGXflG43pypYhmPcJSplDrP2Rg7EGFdasgl7Duc5VGh1l40p84k
Via0iNCJBzL+j6heq47a4TA+oJRAK1HtPjd+ZrP4Rx3sxlIR9IiKAO3i2s8i3Djh
nbK+BAxDBRlmE1+xOeplOsW5ZfjUVjv+mXHycGIGU//RGD8xOaX90USu1uBq2xbQ
UKEpAMwrgpuZpCj/+nWaaEj/SuorkfyZeSoIce3l70LpBZTEJFT5cNNexFW63q2p
QWcnnOxm3flS9tU+GOd/lFjAfV4AJSRKiagUk3JrIjGezl4HyXj6NXulZIIKvgVD
zzDTDEL4trP/Eh8x9JEAKs0qmoMHoqe0hBCsnKS9qSoBoUZQvkI=
=d6c4
-----END PGP SIGNATURE-----
