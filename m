Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D54C659AB6F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 07:04:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8mk31qG2z3drx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 15:03:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GaGnWo+Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8mjR1D7Lz3bxp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 15:03:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GaGnWo+Y;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M8mjL3lSYz4x1N;
	Sat, 20 Aug 2022 15:03:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1660971798;
	bh=0sEwRnMPVEFaHqD7f0oYGXuiqcZfbLWw3WJeTLYhpEE=;
	h=From:To:Cc:Subject:Date:From;
	b=GaGnWo+YIlJOiBvorJosIxFan2VN8Wfk9oyJ/U3kmyl1y3Q4vhP5+kNDxiKhc/NtJ
	 7fH2uEPK7ZsBLU013RlREKMKobZszY0dpobZTyZZXFFBaa29duT0IyXnwYL5317JQL
	 ueOjtzD7YrLvlfbmHSZnkZLlnwNG6nc29pm07wq+HkIGX9c8yFc8gpUYgO+AsiznJ3
	 mQSM9YMkm4+UMlVGWkDEWFGqjKD4UZKsxmoQ2ubxeoxRA+2XAMQM34X68+kiRVvtfT
	 3kgapA20bV5mFMhUdU3TJlsUeMudfHwdVzAjrkoHfpr8zNhJSuGqwSlpI7IrVMoqJ2
	 S2oqB5z/7bZXQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.0-3 tag
Date: Sat, 20 Aug 2022 15:03:18 +1000
Message-ID: <87wnb3ld61.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.0:

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.0-3

for you to fetch changes up to f889a2e89ea5b4db5cf09765ee5e310be43c7b6f:

  selftests/powerpc: Add missing PMU selftests to .gitignores (2022-08-15 20:59:17 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.0 #3

 - Fix atomic sleep warnings at boot due to get_phb_number() taking a mutex with a
   spinlock held on some machines.

 - Add missing PMU selftests to .gitignores.

Thanks to: Guenter Roeck, Russell Currey.

- ------------------------------------------------------------------
Michael Ellerman (1):
      powerpc/pci: Fix get_phb_number() locking

Russell Currey (1):
      selftests/powerpc: Add missing PMU selftests to .gitignores


 arch/powerpc/kernel/pci-common.c                                | 16 ++++++++++------
 tools/testing/selftests/powerpc/pmu/event_code_tests/.gitignore | 20 ++++++++++++++++++++
 tools/testing/selftests/powerpc/pmu/sampling_tests/.gitignore   | 18 ++++++++++++++----
 3 files changed, 44 insertions(+), 10 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/.gitignore
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmMAHQUACgkQUevqPMjh
pYAcqQ//TOGd1WWZmmOR7skVfa7mRdrHG0z5vZ0Zsx6e7TvgzugjrwCDIt19WIhG
PL8j+UnkPZ4/3d5xz9/tnXT/QPPVSsUAbPAtzCb25f5TdSNOaqiDNlIIinUTikZm
qTyf+Rbhfp3eIGZNOIDeYbWvuqKvVxEsJRffWfInzZ8QxbI7QJdIbO0biTxR8Tb5
oEDnK2KWxn97K20Vlnw1u7sWvfaxQv+xMtFg4ztRRoQIw7ArPJt2tlleSqHHa1ts
YEAoNJpWPZalWFNv71jdAJ0db1YKH61pMRATM1Axbq9sTRkERHAePHAvnQ5PW0r+
ojVSMj9RWF/e+zqfaU7f8IyYrXKBTCryoOLozWjmFoAlWF5MB4F7p4nVi0A9DBxx
MAZsuvlwG/SlkXzhImxJeUFyNt4p5AR+ogWdNoYtq6Tddrkr3J2g6wmxqpBamhfy
GpXiesZ5XbLRCBixn3RiEKd6ngiqWPE1Bi4Dh9Pe7qJXEmn94DwnSP9FmMMy7pg7
1uZRi2Fc+7+JkMPs3WvuDXaPmZt+IsKHEfwCokCyxMHmMz9bFQz3ibndmo2WaiKK
LKatWmKeOdfEDiQUnMNug5hItad+wN1x2gcmseuMXVVket0go9odlEqzvnrZoGf7
6D/ktlBdS8OFonqENuqdbH61Q93U3CqYKDXfB3royghRPlPLkCo=
=Agbh
-----END PGP SIGNATURE-----
