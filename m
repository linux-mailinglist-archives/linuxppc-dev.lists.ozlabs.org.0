Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7545C7C98AE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 12:32:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hEixdUl5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S7c4m1xmQz3c89
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 21:32:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hEixdUl5;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S7c3w3THPz2ygx
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Oct 2023 21:31:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697365900;
	bh=LXWDfpoZP6jZcN2pW3gdh9fiUrOU2L0I4poYZOCpU68=;
	h=From:To:Cc:Subject:Date:From;
	b=hEixdUl5pSqNTvbDH6lK6lbzSodhjWujiHO/+JG0SNXGZadhPfcRO/jDx0X6A3bjL
	 rj++NgjlaY7JNbT+8245OFt9zo2BqXvSAeTsYeqDoK8OK226L1mFnJZiGgHtIAXkY1
	 /1irW9jvPXqo7dLy/hbpcl5pFnviqbVFR+z2R9pEWZw0nXCJ0lJ54nTctLe60qTyC9
	 toGPJzcD10YA7PdtSp1Gz0Q72E4ztzVbIWaMRh0rV1LEiJ7mcLgqiY+oN9SHn6FJ3U
	 VSwuRBtxB5+jkLOtbpLn4Zkj8rPPn8O30whLsd59M4nmWgqEiiX+s2KMICM40EyYEO
	 9i9sdFGbpP2ig==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S7c3w0gPPz4wcJ;
	Sun, 15 Oct 2023 21:31:39 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.6-4 tag
Date: Sun, 15 Oct 2023 21:31:39 +1100
Message-ID: <87mswkyy5w.fsf@mail.lhotse>
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 6.6:

The following changes since commit 58b33e78a31782ffe25d404d5eba9a45fe636e27:

  selftests/powerpc: Fix emit_tests to work with run_kselftest.sh (2023-09-22 20:29:48 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.6-4

for you to fetch changes up to f0eee815babed70a749d2496a7678be5b45b4c14:

  powerpc/47x: Fix 47x syscall return crash (2023-10-11 09:31:26 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.6 #4

 - Fix softlockup/crash when using hcall tracing.

 - Fix pte_access_permitted() for PAGE_NONE on 8xx.

 - Fix inverted pte_young() test in __ptep_test_and_clear_young() on 64-bit BookE.

 - Fix unhandled math emulation exception on 85xx.

 - Fix kernel crash on syscall return on 476.

Thanks to: Athira Rajeev, Christophe Leroy, Eddie James, Naveen N Rao.

- ------------------------------------------------------------------
Athira Rajeev (2):
      powerpc/pseries: Fix STK_PARAM access in the hcall tracing code
      powerpc/pseries: Remove unused r0 in the hcall tracing code

Christophe Leroy (3):
      powerpc/8xx: Fix pte_access_permitted() for PAGE_NONE
      powerpc/64e: Fix wrong test in __ptep_test_and_clear_young()
      powerpc/85xx: Fix math emulation exception

Michael Ellerman (1):
      powerpc/47x: Fix 47x syscall return crash


 arch/powerpc/include/asm/nohash/32/pte-8xx.h | 7 +++++++
 arch/powerpc/include/asm/nohash/64/pgtable.h | 2 +-
 arch/powerpc/include/asm/nohash/pgtable.h    | 2 ++
 arch/powerpc/kernel/entry_32.S               | 8 +++++---
 arch/powerpc/kernel/head_85xx.S              | 2 +-
 arch/powerpc/platforms/pseries/hvCall.S      | 8 +-------
 6 files changed, 17 insertions(+), 12 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmUrvzYACgkQUevqPMjh
pYCKAQ/+MjIJYV6DQPPoopfl1mFgPTKEGZh4xSj0VAuRHcvZGJT3UgJGu/ngnQw/
IWjcdDuHg1eYayWLhQBYBzTZVN8nNxSF/eAxdYyV2CFHBDk3iED1rpFO8nlrM+wL
rBfY+4U37Lx7HJDHPC6pzn+5hzIVBqwCh7cdS4z/VYW/7Nz1hPr5oD1MAYYTCBdV
Yuan4v5VqfMmXPCn/kBgGWjE2kNIDBfPqyi3VC3uJu9Z/pVpkBT8GFSqbZ6pxIHw
pOC8mkimWNkY3VZqqcrb649NeDHvZUjctzZTy45f3euC+x+UQ7kkI2Bc56DzcK4F
6M+aI6t9WO0N4XVZxrHCC5j90/RZDccwTK/KBbtAPGhOjZTWSY5oZF+F3v/ga+/2
IbcHSKHtFw3jf9JHpqe3VF9l4LbwsnYfh99ZaHZcfiY6007sJwzp8M+xbHOKLVVm
4Q+J2qoTqdXSHXkO7ldCcBz7dcp3CI8EGs3Nvk+EBjRkMjlsShhsFq8yGgzAOS3Y
AWg1br+w9udkvI4t7TWT8JhXy5jitSuB+Cxpe3wZ1PPRB9mVqICdIPcJ7XsAqMH1
fbaa7wOXbAXPSIN1o70WmrENB1qn5HLoDPBpbSJc+EW2efCPhDN+IsRsqEkWjKD6
hkD+z9B2WppLl79nE5Xso2/MwtxhlINVBpPyVLPvnVzYQ7An+1U=
=p0qH
-----END PGP SIGNATURE-----
