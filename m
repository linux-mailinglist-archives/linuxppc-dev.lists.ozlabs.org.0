Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 763DA4308C1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 14:36:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXKJR0ZQvz3cPm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 23:36:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VmPuR+yy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXKHn2xQlz2xXG
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Oct 2021 23:36:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VmPuR+yy; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HXKHn24Wnz4xbc;
 Sun, 17 Oct 2021 23:36:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1634474181;
 bh=Dw1rY37uJhO7CntwmBCrGxDeK8CeNQ/IuMdrDqnsJyY=;
 h=From:To:Cc:Subject:Date:From;
 b=VmPuR+yyn5IfRb2PK9EhLP9nTZuxF91PaXmIq6K5ktEmca9dNc+Bx42ERRGlVfOmI
 osMxxS5H2xinjOYOmLRBaNBlJ/4TkYlm+ySNGRVD1u9M6DmC+/9vlnQmpyW6qGeOGE
 9aw5jp1tfY72kd9kt4mdW+OegqKLzczBSoF3tviFJDs7fNrTao4YXca/48zfzJJ8E5
 nud/2qhRhf9/Qiw6ggHn3UKt2ZLLTMBc9WURlSqIFOpiYoUHW2Yksn243DqbN5NZvu
 S60AWeITzUK0MhOKisifjUhZnZedJQXTnA5pst6kDIrqCfSkPNRQ1T7TVC5lmXO9fP
 BdFBhiG27JX/g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.15-4 tag
Date: Sun, 17 Oct 2021 23:36:20 +1100
Message-ID: <87sfwzde0r.fsf@mpe.ellerman.id.au>
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

Please pull some more powerpc fixes for 5.15:

The following changes since commit eb8257a12192f43ffd41bd90932c39dade958042:

  pseries/eeh: Fix the kdump kernel crash during eeh_pseries_init (2021-10-=
07 23:37:22 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.15-4

for you to fetch changes up to cdeb5d7d890e14f3b70e8087e745c4a6a7d9f337:

  KVM: PPC: Book3S HV: Make idle_kvm_start_guest() return 0 if it went to g=
uest (2021-10-16 00:40:03 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.15 #4

Fix a bug where guests on P9 with interrupts passed through could get stuck=
 in
synchronize_irq().

Fix a bug in KVM on P8 where secondary threads entering a guest would write=
 outside their
allocated stack.

Fix a bug in KVM on P8 where secondary threads could confuse the host offli=
ne code and
cause the guest or host to crash.

Thanks to: C=C3=A9dric Le Goater

- ------------------------------------------------------------------
C=C3=A9dric Le Goater (1):
      powerpc/xive: Discard disabled interrupts in get_irqchip_state()

Michael Ellerman (2):
      KVM: PPC: Book3S HV: Fix stack handling in idle_kvm_start_guest()
      KVM: PPC: Book3S HV: Make idle_kvm_start_guest() return 0 if it went =
to guest


 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 28 ++++++++++++--------
 arch/powerpc/sysdev/xive/common.c       |  3 ++-
 2 files changed, 19 insertions(+), 12 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmFsGG0ACgkQUevqPMjh
pYCAJRAAi8wEtHdIziXc22xYVaI8znMeogpoYnqKmEjRoGhyv79JNzh1/kOsNWyQ
E8hGut8YrKl+0xswbF41E5qdQCLfHiJYhqe8Ltl38ltoSx5YO/FqTtDMuVvc9bO1
SuyNOQWwrfPo6PolAHKtWv+yn7lMV6tP2NBp0lXe6DQkrCC7FEQ/s+12qQFmmnmb
hZ4KQuu27kcWqADTyhqipH+pLS+0nSdWFrBXyxQVtPlAxy0trvwU3m+9rNvcWcob
D07uH8n0TS1nORYs0s8YStxz5Kme0ICUIj64hvox7T1CqcTldl5iMrpzjvHRUa+s
sbuAgjAnyaksCiKyDJjIo8NtpXFYYLq4SeAn0/6dCxb3gtyQsRBDG9oe7F/q5jvO
j0flo6Bmcl4es3dTEz5mX7G/EChniTYyeq4xfVFZpA/56LkXeCdcTkBeyTeopBSe
QLtR40DUFYBZZVBUotBp9K13Grqg8xrvLYFZhUihA5rnC7HRZjwt70Rh3FmZUKcd
i7blHpIssf8obH5ERhEUOF4ITHwmFkLDBgqTh/jlPYlMBz4FYn/2IxWnMfZQpv3u
igC6DHCwJ9FmTI0iGyN2xbxGqW/WrAZrRCTFB3lZSw38O4e31viIXbfi9u+Iib2e
j0oUBZmoroH6POha/udMK/FUdxTlkS8OTiUDM7K2J81L7Cz9F6k=3D
=3Da0+j
-----END PGP SIGNATURE-----
