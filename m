Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B289754D57
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jul 2023 06:50:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HmC8g/aE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R3Xnj1Hyyz3c4F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jul 2023 14:50:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HmC8g/aE;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R3Xmm30Ssz30Ps
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jul 2023 14:49:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1689482951;
	bh=j1B/3wa0KHQjbQn2J5wpLeaIUyPZkusNw4hrcostKes=;
	h=From:To:Cc:Subject:Date:From;
	b=HmC8g/aEAeqc+NAEaYhfzPlcrAw/SKKDmzb9FKoEyEKQ2H2w5s3cb9s8kA8lojhht
	 r+3chACD8a+17MCfX9dFa6rq1Ydde6y/4QU2/tT8vOJ5teXmSQLUYGTvBPg/CCyOvX
	 9wjv0Gv/oNs1Sn9eL4cXS6CiVS96SxeiySotEuFWQXq5trRrYS7PTyRNz43w+i5jmQ
	 cvThaW91Pf7eUK8g5IERPP8rk+g1/miqOPqiAHDEzKFmxbwrMByGpNCHTadWlX0001
	 QRt2YMoJyEacz3VhMyfCXqjLYV0K9mEW7zztt7/QoxNkdqMSCUSk9ylB7QlBzPx6Xf
	 LOZgyDu2OIA0Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4R3Xml2dxkz4wZs;
	Sun, 16 Jul 2023 14:49:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.5-3 tag
Date: Sun, 16 Jul 2023 14:49:09 +1000
Message-ID: <87cz0sjwai.fsf@mail.lhotse>
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.5:

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.5-3

for you to fetch changes up to cf53564b11cef5cdfafc548b172345c9aa753f89:

  powerpc/mm/book3s64/hash/4k: Add pmd_same callback for 4K page size (2023-07-10 09:47:47 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.5 #3

 - Fix Speculation_Store_Bypass reporting in /proc/self/status on Power10.

 - Fix HPT with 4K pages since recent changes by implementing pmd_same().

 - Fix 64-bit native_hpte_remove() to be irq-safe.

Thanks to: Aneesh Kumar K.V, Nageswara R Sastry, Russell Currey.

- ------------------------------------------------------------------
Aneesh Kumar K.V (1):
      powerpc/mm/book3s64/hash/4k: Add pmd_same callback for 4K page size

Michael Ellerman (3):
      powerpc/64s: Fix native_hpte_remove() to be irq-safe
      powerpc/security: Fix Speculation_Store_Bypass reporting on Power10
      powerpc/64e: Fix obtool warnings in exceptions-64e.S


 arch/powerpc/include/asm/book3s/64/hash-4k.h  |  6 ----
 arch/powerpc/include/asm/book3s/64/hash-64k.h |  5 ---
 arch/powerpc/include/asm/book3s/64/hash.h     |  5 +++
 arch/powerpc/kernel/exceptions-64e.S          | 31 +++++++++-------
 arch/powerpc/kernel/security.c                | 37 ++++++++++----------
 arch/powerpc/mm/book3s64/hash_native.c        | 13 ++++---
 6 files changed, 51 insertions(+), 46 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmSzdowACgkQUevqPMjh
pYC5tA/+ILZ4hlTz/t8fHEjfO3E9kp1/LMHjpd4NhlqTjn40FQULieN940I7VxCb
8KhMbFSUsN5x23hSHIiW4C7UVZsHz8YJw2kIjb9dP4Q501PJ4iuhMN3RbnZ9c93a
zbsHgI3sfXSGWqWa6QClfXvTKGLi7+r5/QN0bh//zjJYGEQRJ9T9lJ+qA7lk6IKF
D7tRGoLtizBPaQby76GtfTw3Ow9MqZzISzextVDLbLmVWXa2oPen772Nlx19uZA7
xvtxJdJSuJthNw7ZFwC6DkmrpKCgSweP4J/WGCiixX8CW4aOM0xUI0dFoi9NA0Ne
+JOspKlPClkDWSXJlbb0G2MyNOQlGiQ8Afi7hVlk6OEoAFoRQOt2uySXiwVXccBE
Lg656d7BIMVp+MmDo/gG9R3xUS80l6HkwJst/3hV0Tvj0GELgccMZAyb1Ivl/Giz
YCOjBOu/rEx3QX2+KfyLQdCud+Edl7/twkW/dO4LTeNsFQBuu59ptHfVQe/hlv20
O+Ou3LKBP17WbINYJupkyg5XxeDg7XMNjgsb2vU2AoQMt6QYDSKjP/zUBQuKbrrB
FLImT6pGu9ApSqnRMl82RtsNt9CZCNyKsE6DpZZpPk9rtKwc9JnUtEG8Lno95Svf
2zlfdgi0lnlkBGQx/p3Kzo5qi3XXeu+XQyBtvkSc3oZPsUrIPI8=
=YN/2
-----END PGP SIGNATURE-----
