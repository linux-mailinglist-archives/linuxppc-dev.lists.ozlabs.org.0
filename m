Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 929522CFB45
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 13:23:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cp7z84RQqzDqh3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 23:23:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cp7tb0jblzDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 23:19:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Qgmo0bCA; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cp7tV6n1xz9sWK;
 Sat,  5 Dec 2020 23:19:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607170788;
 bh=r2GPVWow3KSvjd0XpMzh2cxCWEa0UVNX7n4Ic8UTw28=;
 h=From:To:Cc:Subject:Date:From;
 b=Qgmo0bCA18H0FSteGOwWtaUCQQn1Uv4Yq0/7daWhn7UjKZQLqGofo++7RuVpHj0P+
 Mgj8Wb4jCQNK5vAyyHutT5dJ5Ij4xtK4sxXVu8h+UDr+ZH/vB7V7gbxz1B5g4z22dS
 j6AeV+yTn9zKljsnzb/THMRu1bdOXEjfbq3VRtCi5iwd2c5aHzQI3hgu0folM2vYae
 5QzYPW6uNR++lqMz7W9bva7nR4yWTJjLy9cPVsA8pSLTq0SojySOm2HnYE9jwh6H4D
 ZnCSlLrIz0BM90F7i9Vll7VYVU891GzQQwad9exD/DcLYZrC02ZAYq1VpP5tp76qi9
 dRfy7B/ga/IPQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.10-5 tag
Date: Sat, 05 Dec 2020 23:19:45 +1100
Message-ID: <87im9gtpge.fsf@mpe.ellerman.id.au>
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
Cc: srikar@linux.vnet.ibm.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org, mahesh@linux.ibm.com, npiggin@gmail.com,
 groug@kaod.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.10.

The change to kernel/cpu.c is just adding an optional arch override, and has
Peter's ack.

cheers


The following changes since commit b6b79dd53082db11070b4368d85dd6699ff0b063:

  powerpc/64s: Fix allnoconfig build since uaccess flush (2020-11-23 21:16:=
42 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.10-5

for you to fetch changes up to a1ee28117077c3bf24e5ab6324c835eaab629c45:

  powerpc/64s/powernv: Fix memory corruption when saving SLB entries on MCE=
 (2020-12-02 23:16:40 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.10 #5

Three commits fixing possible missed TLB invalidations for multi-threaded
processes when CPUs are hotplugged in and out.

A fix for a host crash triggerable by host userspace (qemu) in KVM on Power=
9.

A fix for a host crash in machine check handling when running HPT guests on=
 a
HPT host.

One commit fixing potential missed TLB invalidations when using the hash MM=
U on
Power9 or later.

A regression fix for machines with CPUs on node 0 but no memory.

Thanks to:
  Aneesh Kumar K.V, C=C3=A9dric Le Goater, Greg Kurz, Milan Mohanty, Milton=
 Miller,
  Nicholas Piggin, Paul Mackerras, Srikar Dronamraju.

- ------------------------------------------------------------------
Greg Kurz (1):
      KVM: PPC: Book3S HV: XIVE: Fix vCPU id sanity check

Nicholas Piggin (5):
      powerpc/64s: Fix hash ISA v3.0 TLBIEL instruction generation
      powerpc/64s/pseries: Fix hash tlbiel_all_isa300 for guest kernels
      kernel/cpu: add arch override for clear_tasks_mm_cpumask() mm handling
      powerpc/64s: Trim offlined CPUs from mm_cpumasks
      powerpc/64s/powernv: Fix memory corruption when saving SLB entries on=
 MCE

Srikar Dronamraju (1):
      powerpc/numa: Fix a regression on memoryless node 0


 arch/powerpc/include/asm/book3s/64/mmu.h     | 12 ++++++++++
 arch/powerpc/kvm/book3s_xive.c               |  7 ++----
 arch/powerpc/mm/book3s64/hash_native.c       | 23 +++++++++++++-------
 arch/powerpc/mm/book3s64/mmu_context.c       | 20 +++++++++++++++++
 arch/powerpc/mm/numa.c                       |  3 +--
 arch/powerpc/platforms/powermac/smp.c        |  2 ++
 arch/powerpc/platforms/powernv/setup.c       |  9 ++++++--
 arch/powerpc/platforms/powernv/smp.c         |  3 +++
 arch/powerpc/platforms/pseries/hotplug-cpu.c |  3 +++
 kernel/cpu.c                                 |  6 ++++-
 10 files changed, 70 insertions(+), 18 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl/Ler0ACgkQUevqPMjh
pYBdSg//YL+3GipNsfXCyKfCXxlVn3/v6e+tAa4EYrJc7BxHWq2rr4tCO5ycsZPg
yGPRNFDKPlN8jP/qX29LjKF4k1D9uQ7Z/FL1MM7Z3Xrwu5lOZJn2AYbKUrLIN1jX
IfddqmH5FuGXC+9GPXDo8OT0IZzzp4HNvqUAFMfgulH4IHkFCmBx3+bjQxRbprmA
c3bikk4GR/qEP97RIVga8MZOnnt8LccS86iH81/d5jT8zMgL61FGCqGdkinTDSIt
4Qo4jrSj2zhbZs8gsff7ZbDvKfe/tNUClzvyFoi40hbSQogPE+r/Ik1ol9snxSdv
YYWwX1Yov2n10FOoqVsK4m5EWfx988+uyJ6on9pOYR0IJIZQ0GkaQ+5HptgGsTR6
5sRW6uiHxpaABhSZPaBcgH09G2ppjBlFC2Hz2g9NZuCCckdHx+FdrG+MGHMq+KRT
hSZafOosPSPLyqDlUDo9RuksBEk/oOkO2beizVfGo2ETx6AQO3zzrhQcA/kU9Gxy
opFfBP5sikmesAXxP0fxd0tg20EkRlWZzEDu/dFNhbNW+T0/KwzYuZaGsf7l65GO
XpyiLScm4a0vSIt481eqMd4oazrYFIPGZgTU10ws6lI7DM9q360Zhn5VOf80i4Lw
fYorXpe7KILB6PveChkJ+DiR/2UPRrzWSKoZ4SfQfJwzQKp4Td8=3D
=3DN1fr
-----END PGP SIGNATURE-----
