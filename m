Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB308563F81
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 12:42:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZpYd6l2Fz3c1L
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 20:42:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NGPoe/gD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZpY140BSz3bdy
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 20:42:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NGPoe/gD;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LZpXx5yZBz4xQt;
	Sat,  2 Jul 2022 20:42:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656758530;
	bh=mtoQ5D5XEbg5B1GVfViQaQ2HWBc4g/DvKpz019fGU90=;
	h=From:To:Cc:Subject:Date:From;
	b=NGPoe/gDsHFiLyMWgLjgkqJlTWxkHK25Ocr42e2n5Yh5FsFRAF+oYcaqGGM9sEzsS
	 y6uy6MK2/exHEo+uaOV5rLmE2MSrge4TsQCtW2TatJUv8zSeJgVXLdUxEu+YuSH5EX
	 VDfFMXNNti0OEKZMio9hEce7Al6qCf4cphFM3Yj9Zr6ttkfPxuYKzNiM6emqTY4tdh
	 /DqLD6WlB9hgUaxZ4JVzuw1epYZGeAWkajHGEf7UuPRDlSWhVchitH4o7ZGG3vRqnu
	 lIUxUN9052+PvkyJV2fXTYsPYvJpjjYzAsvKfgp+Mexc8CYgFEo/q1H7cw/WdNpiWY
	 K0ZhiCMq0A5Zg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.19-4 tag
Date: Sat, 02 Jul 2022 20:42:04 +1000
Message-ID: <87edz3aj9f.fsf@mpe.ellerman.id.au>
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
Cc: nathanl@linux.ibm.com, aneesh.kumar@linux.ibm.com, linux-kernel@vger.kernel.org, liam.howlett@oracle.com, rppt@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.19:

The following changes since commit f3eac426657d985b97c92fa5f7ae1d43f04721f3:

  powerpc/powernv: wire up rng during setup_arch (2022-06-22 19:47:22 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.19-4

for you to fetch changes up to ac790d09885d36143076e7e02825c541e8eee899:

  powerpc/memhotplug: Add add_pages override for PPC (2022-06-29 20:43:16 +=
1000)

- ------------------------------------------------------------------
powerpc fixes for 5.19 #4

 - Fix BPF uapi confusion about the correct type of bpf_user_pt_regs_t.

 - Fix virt_addr_valid() when memory is hotplugged above the boot-time high=
_memory value.

 - Fix a bug in 64-bit Book3E map_kernel_page() which would incorrectly all=
ocate a PMD
   page at PUD level.

 - Fix a couple of minor issues found since we enabled KASAN for 64-bit Boo=
k3S.

Thanks to: Aneesh Kumar K.V, C=C3=A9dric Le Goater, Christophe Leroy, Kefen=
g Wang, Liam
Howlett, Nathan Lynch, Naveen N. Rao.

- ------------------------------------------------------------------
Aneesh Kumar K.V (1):
      powerpc/memhotplug: Add add_pages override for PPC

Christophe Leroy (1):
      powerpc/book3e: Fix PUD allocation size in map_kernel_page()

Liam Howlett (1):
      powerpc/prom_init: Fix kernel config grep

Nathan Lynch (1):
      powerpc/xive/spapr: correct bitmap allocation size

Naveen N. Rao (1):
      powerpc/bpf: Fix use of user_pt_regs in uapi


 arch/powerpc/Kconfig                           |  4 +++
 arch/powerpc/include/asm/bpf_perf_event.h      |  9 ++++++
 arch/powerpc/include/uapi/asm/bpf_perf_event.h |  9 ------
 arch/powerpc/kernel/prom_init_check.sh         |  2 +-
 arch/powerpc/mm/mem.c                          | 33 +++++++++++++++++++-
 arch/powerpc/mm/nohash/book3e_pgtable.c        |  6 ++--
 arch/powerpc/sysdev/xive/spapr.c               |  5 +--
 7 files changed, 52 insertions(+), 16 deletions(-)
 create mode 100644 arch/powerpc/include/asm/bpf_perf_event.h
 delete mode 100644 arch/powerpc/include/uapi/asm/bpf_perf_event.h
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmLAIMMACgkQUevqPMjh
pYBFzxAAt/LfbgVSWPGNv+JvqomiuokgbTd2zKP8PBsRiQg5Jh5i8ANNtIu3UGMt
Nl1/ht6FOZ6Eb76KnmfQni7I5JrIdfVa5zEMDe8GtA5fXPxnEg+lME56SSR6w6ed
2b31BuIB+1wzP6ZDjEV7fHmG4liQSVbTgWKsTjpWdPSuIqpYj5jPlgoimh4l7a2r
YY4Bz7PRFevrbiG5ME10+ZckjG7b13SnROg4JOjZO3leJCqGLHhT9SjHUZvYmot5
MjeObrZ7p4xO3MtBMWi2rDGXhLrHJAqYI+jrC1Z4P2jFAVVKm4l2cFjPQ5MHCqYy
9Di93hT1QrhCKxGr+FzDQSVCSENxPxktheqWz5IyBexwxvkH0tUkSwugmOhyHwq6
69uFxi9CLAtnv+8YXvqsLSwg8+n5DeYQ7mEVXsCyPIXKbZe+ZJE2r6XoYb0a3ags
nTwkiSnaBLvHBQtjBLh4Bd3dI5STL9LZsz1cUXFBlriCs3rP5enPF/vWOcc8tEix
F2iZPiXldpiep1g3zHDRuAAcACGWHrqxfVOPJfC/pLrqpzbmtFPJejmeE3WVC3uy
dkjjkXGBfrTAlFjVfdJgJVv+vyr9ShIrFrpsMjlFcsoktoDXUd2zkcJj+zdwIqrG
sRLRcHtNGQs6X0CltPs22qjtj66tLZja+Kj1eRDrFk896sJNsaA=3D
=3DYeKn
-----END PGP SIGNATURE-----
