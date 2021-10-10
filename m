Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B136428139
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Oct 2021 14:27:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HS1Qf2LGwz2yS3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Oct 2021 23:27:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=StkHLogs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (unknown
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HS1Q05Htdz2xtD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Oct 2021 23:26:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=StkHLogs; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HS1Pj3jwKz4xbV;
 Sun, 10 Oct 2021 23:26:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1633868796;
 bh=2SCtlclSeJAdn42vIADSqNqIlvZP/SXox9aUhdHwUe8=;
 h=From:To:Cc:Subject:Date:From;
 b=StkHLogs6xa0KHrETSr+PQju0YwvURe4HeTimC9313Lq5SLOeWKgX6yQSkxeaoKM+
 l1BpDedw8uWbkw3d4yxNPt+/FS8pwEifFXXWgyiqEENUvJdTXiaYhqeB6ExBXB3gKS
 vq54vESD3IgFEosmeszZxOGI+GiuvClH/5Zem72luwj3fAwg/51mQn4YUiRONDB3AC
 18lZOZV4bPg4pmzhgSg5jzHnEqZ5j/mncegGrxQ024ziAW/vtlEU3+GCzJeW5hFUmy
 nHFuCVCsuw9xVsrSGMj/3rHeDa0TRP7T9w07uJOGRTU8rWL2SGK9PykKhnhEv3wutu
 tkojioV8vEVSQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.15-3 tag
Date: Sun, 10 Oct 2021 23:26:30 +1100
Message-ID: <87y271m5ft.fsf@mpe.ellerman.id.au>
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
Cc: songliubraving@fb.com, johan.almbladh@anyfinetworks.com, aik@ozlabs.ru,
 npiggin@gmail.com, linux-kernel@vger.kernel.org, mahesh@linux.ibm.com,
 clg@kaod.org, naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.15.

A bit of a big batch, partly because I didn't send any last week, and also =
just because
the BPF fixes happened to land this week.

cheers


The following changes since commit e4e737bb5c170df6135a127739a9e6148ee3da82:

  Linux 5.15-rc2 (2021-09-19 17:28:22 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.15-3

for you to fetch changes up to eb8257a12192f43ffd41bd90932c39dade958042:

  pseries/eeh: Fix the kdump kernel crash during eeh_pseries_init (2021-10-=
07 23:37:22 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.15 #3

Fix a regression hit by the IPR SCSI driver, introduced by the recent addit=
ion of MSI
domains on pseries.

A big series including 8 BPF fixes, some with potential security impact and=
 the rest
various code generation issues.

Fix our program check assembler entry path, which was accidentally jumping =
into a gas
macro and generating strange stack frames, which could confuse find_bug().

A couple of fixes, and related changes, to fix corner cases in our machine =
check handling.

Fix our DMA IOMMU ops, which were not always returning the optimal DMA mask=
, leading to
at least one device falling back to 32-bit DMA when it shouldn't.

A fix for KUAP handling on 32-bit Book3S.

Fix crashes seen when kdumping on some pseries systems.

Thanks to: Naveen N. Rao, Nicholas Piggin, Alexey Kardashevskiy, C=C3=A9dri=
c Le Goater,
Christophe Leroy, Mahesh Salgaonkar, Abdul Haleem, Christoph Hellwig, Johan=
 Almbladh, Stan
Johnson.

- ------------------------------------------------------------------
Alexey Kardashevskiy (1):
      powerpc/iommu: Report the correct most efficient DMA mask for PCI dev=
ices

Christophe Leroy (1):
      powerpc/32s: Fix kuap_kernel_restore()

C=C3=A9dric Le Goater (1):
      powerpc/pseries/msi: Add an empty irq_write_msi_msg() handler

Mahesh Salgaonkar (1):
      pseries/eeh: Fix the kdump kernel crash during eeh_pseries_init

Naveen N. Rao (10):
      powerpc/lib: Add helper to check if offset is within conditional bran=
ch range
      powerpc/bpf: Validate branch ranges
      powerpc/bpf: Fix BPF_MOD when imm =3D=3D 1
      powerpc/bpf: Fix BPF_SUB when imm =3D=3D 0x80000000
      powerpc/security: Add a helper to query stf_barrier type
      powerpc/bpf: Emit stf barrier instruction sequences for BPF_NOSPEC
      powerpc/bpf ppc32: Fix ALU32 BPF_ARSH operation
      powerpc/bpf ppc32: Fix JMP32_JSET_K
      powerpc/bpf ppc32: Do not emit zero extend instruction for 64-bit BPF=
_END
      powerpc/bpf ppc32: Fix BPF_SUB when imm =3D=3D 0x80000000

Nicholas Piggin (5):
      powerpc/64s: fix program check interrupt emergency stack path
      powerpc/traps: do not enable irqs in _exception
      powerpc/64: warn if local irqs are enabled in NMI or hardirq context
      powerpc/64/interrupt: Reconcile soft-mask state in NMI and fix false =
BUG
      powerpc/64s: Fix unrecoverable MCE calling async handler from NMI


 arch/powerpc/include/asm/book3s/32/kup.h     |   8 ++
 arch/powerpc/include/asm/code-patching.h     |   1 +
 arch/powerpc/include/asm/interrupt.h         |  18 ++--
 arch/powerpc/include/asm/security_features.h |   5 +
 arch/powerpc/kernel/dma-iommu.c              |   9 ++
 arch/powerpc/kernel/exceptions-64s.S         |  25 +++--
 arch/powerpc/kernel/irq.c                    |   6 ++
 arch/powerpc/kernel/security.c               |   5 +
 arch/powerpc/kernel/traps.c                  |  43 +++++----
 arch/powerpc/lib/code-patching.c             |   7 +-
 arch/powerpc/net/bpf_jit.h                   |  33 ++++---
 arch/powerpc/net/bpf_jit64.h                 |   8 +-
 arch/powerpc/net/bpf_jit_comp.c              |   6 +-
 arch/powerpc/net/bpf_jit_comp32.c            |  16 ++--
 arch/powerpc/net/bpf_jit_comp64.c            | 100 ++++++++++++++++----
 arch/powerpc/platforms/pseries/eeh_pseries.c |   4 +
 arch/powerpc/platforms/pseries/msi.c         |  15 +++
 17 files changed, 234 insertions(+), 75 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmFi26IACgkQUevqPMjh
pYCMSxAAh40nmRryws4rJ6R6UQlp5eKKAitlFo5y/P3h/qNzu5kelwkS93tog5CA
9i/uznMlyu3jpauHiDaeZCU0WYBqs3AL3qE11pHeG4HkGCCQ/D5eX3KxFRYuqbWh
mfGvgRGxr4Rew3ACgQ/eUGwU9DkzmAr49CX9/5MR8chpNzeERpPMcq4jolEjkfJl
Jf74WoIhHkuDMXFWVC8Aj6AKuQM+Ia9bXhSAFUIk2yjKRdADFgnR8stjzebW8B5v
rSJ9WWNFt97UcgpTcvE+0gEuXFdD3cR16Ov6ObdZjsT1Y3ubC9jTZXy/pO8+YZbq
jjGjNfxp7eWr6umgd2bhO5RKDwu/PbKvhM3l8OPQxOkoGK4L8trPm2IGEFjVyV/1
/vhMa439vbPtT7eItmXEuEqgouUCzwA11Du7KhZu+IkdWyJCXsRzkExTI+rYGAYU
nokOmE6A9VI4sgqLXAOxVSWDQSURhBfXx5cGeu9sdWNZ1V/F1TCi9kslE4eSlJie
NjT5X1rEnM4HDMBKuiSkmu2GzcCAP5IktrkzAmWt1CbFWtLqdOExTmQGR/3DNMwp
SniCYTgAw9GdGz46Zkiprr1X8fEqyrGBY6kjrAJ6Yior2Oy5GxU23w7UmE5iddFx
jXsVMOh6dWIvJlhkeFEjLed3NezkpQuKehM0inOcAiPcCpnZhYc=3D
=3DhYTj
-----END PGP SIGNATURE-----
