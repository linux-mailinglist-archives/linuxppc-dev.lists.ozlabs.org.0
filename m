Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D76AD377235
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 15:52:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcpfB5q9tz305s
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 23:52:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=T04lyP40;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=T04lyP40; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fcpdk65Glz2yYX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 23:51:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FcpdX6Zlgz9vFX;
 Sat,  8 May 2021 23:51:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1620481906;
 bh=YfiiOV9BifIml7tIdKSOd7vkBq6VgUlb/IpuGb/eJDI=;
 h=From:To:Cc:Subject:Date:From;
 b=T04lyP408rc0y2D0W5WZIiBW/qLS6Yr0raGnfae1LChEWGf1w43fCz6vdKT5HVsgf
 rOCTYhPwYVBS+svN8cVzphqJ3RpjYTMjqVQbxP4LBUgSLVIBmoSgodwKjoUUQbR0NR
 v1w3CN+hAkuPwrvqaR+RWUsmLb96E9oJC7RBnFg8lFE7UCVXxotSUzuZWqVpdWrOHt
 Bct3cU4CU0o/sGdy58h2Nhtz4iLgbG99h8Wmo/QXMRBZWwEmTbZb5FTzCb3/oBEltd
 r+Gb+1BkkfdYU9LMWtaBUSWkOMg2fiFZ1o7nunuRsvmX9OSz4Kg0qqBUEb3Gfsyt6R
 GCaHY35sget3Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.13-2 tag
Date: Sat, 08 May 2021 23:51:40 +1000
Message-ID: <87y2cpxrir.fsf@mpe.ellerman.id.au>
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>, sourabhjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, sandipan@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc updates/fixes for 5.13.

A bit of a mixture of things, tying up some loose ends.

There's the removal of the nvlink code, which dependend on a commit in the vfio tree.
Then the enablement of huge vmalloc which was in next for a few weeks but got dropped due
to conflicts. And there's also a few fixes.

This does contain a back merge of master, which I know you generally dislike, but doing
that allowed me to get the list of selects under config PPC sorted alphabetically again.

Paolo has picked up the KVM fix, but I wasn't sure he'd send it before rc1, so I picked it
up as well. As of now there's no conflict between our trees, git works it out.

cheers


The following changes since commit 17ae69aba89dbfa2139b7f8024b757ab3cc42f59:

  Merge tag 'landlock_v34' of git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security (2021-05-01 18:50:44 -0700

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.13-2

for you to fetch changes up to f96271cefe6dfd1cb04195b76f4a33e185cd7f92:

  Merge branch 'master' into next (2021-05-08 21:12:55 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.13 #2

 - Remove the nvlink support now that it's only user has been removed.

 - Enable huge vmalloc mappings for Radix MMU (P9).

 - Fix KVM conversion to gfn-based MMU notifier callbacks.

 - Fix a kexec/kdump crash with hot plugged CPUs.

 - Fix boot failure on 32-bit with CONFIG_STACKPROTECTOR.

 - Restore alphabetic order of the selects under CONFIG_PPC.

Thanks to: Christophe Leroy, Christoph Hellwig, Nicholas Piggin, Sandipan Das, Sourabh Jain.

- ------------------------------------------------------------------
Christoph Hellwig (1):
      powerpc/powernv: remove the nvlink support

Christophe Leroy (2):
      powerpc/32: Fix boot failure with CONFIG_STACKPROTECTOR
      powerpc/kconfig: Restore alphabetic order of the selects under CONFIG_PPC

Michael Ellerman (1):
      Merge branch 'master' into next

Nicholas Piggin (2):
      powerpc/64s/radix: Enable huge vmalloc mappings
      KVM: PPC: Book3S HV: Fix conversion to gfn-based MMU notifier callbacks

Sandipan Das (1):
      powerpc/powernv/memtrace: Fix dcache flushing

Sourabh Jain (1):
      powerpc/kexec_file: Use current CPU info while setting up FDT


 Documentation/admin-guide/kernel-parameters.txt |   2 +
 arch/powerpc/Kconfig                            |  37 +-
 arch/powerpc/include/asm/kvm_book3s.h           |   2 +-
 arch/powerpc/include/asm/opal.h                 |   3 -
 arch/powerpc/include/asm/pci-bridge.h           |   1 -
 arch/powerpc/include/asm/pci.h                  |   7 -
 arch/powerpc/kernel/module.c                    |  18 +-
 arch/powerpc/kexec/file_load_64.c               |  92 +++
 arch/powerpc/kvm/book3s_64_mmu_hv.c             |  46 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c          |   5 +-
 arch/powerpc/lib/Makefile                       |   3 +
 arch/powerpc/platforms/powernv/Makefile         |   2 +-
 arch/powerpc/platforms/powernv/memtrace.c       |   4 +-
 arch/powerpc/platforms/powernv/npu-dma.c        | 705 --------------------
 arch/powerpc/platforms/powernv/opal-call.c      |   2 -
 arch/powerpc/platforms/powernv/pci-ioda.c       | 185 +----
 arch/powerpc/platforms/powernv/pci.c            |  11 -
 arch/powerpc/platforms/powernv/pci.h            |  17 +-
 arch/powerpc/platforms/pseries/pci.c            |  23 -
 19 files changed, 175 insertions(+), 990 deletions(-)
 delete mode 100644 arch/powerpc/platforms/powernv/npu-dma.c
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmCWlpMACgkQUevqPMjh
pYAgChAAtssjqrHOYHHlc2QZ5qSczf2sE/Clq/p+HlZX6b5E5NACDjd5p6jU2GIK
krVZXK4sQaikXV/KeODujbSuGHa6js5LgHVQWCuCCIrwp+Bdb/we7O0Mvj4pM7RS
bXe1AK0xeTy2rg35cIXf9CfIUM+p5e+rm8vNPaSWza8npFZKsXaoQZAInxOx0MTa
rEFJDi2YCvgQV2L5eFGlcL8EOExJbB9b8Xk3DYwu/t0CnvusW6044VRxGutnGBwY
6+QQ8bt/bYzRdgPGp8D9sZ5ivnDRZymoO138s3aSD0/786nysL+F4dRlYGzrr02M
q5aYo7PCUctZJs/DivlBm2n0ttUs7Wp6XSNpVs5j/H28RjCq52u4VOsjyXMuzrqx
KwAzJNzCfvA/BVOwJqlriaAij8sT5kcvtpZAP3tYDrcY8ZivleZ4SCibBoIChHnc
jwRsv2wUfm3KmSfwy24tRWMQBeysm/OhbJTvC1Qc5bDO5v1r2qPnj2OAyuhWjHXw
NmNfuHv1zVoOJ+OOjnnoc3EoPYANMxeSFkQWtFUvx6HUFJlBMhaldjC3YMAHV5ZI
qkLFCDHKwnfJhnvnr0b0267XxAxXj5hjU+8T6rgnVNOyDKNuV0IGpMWaD3c4BkSO
LrXiPhMSGBWdHHQ4kE1UG5TfCVOHzGGO6l4EI/APxUshqUJ3N20=
=VXJA
-----END PGP SIGNATURE-----
