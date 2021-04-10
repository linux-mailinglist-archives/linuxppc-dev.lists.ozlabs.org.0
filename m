Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCEC35AE79
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 16:44:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHd720y2sz301K
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 00:44:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VXbjvpuh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VXbjvpuh; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHd6d645mz2xb8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 00:43:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FHd6d1rKxz9sVt;
 Sun, 11 Apr 2021 00:43:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618065833;
 bh=/eP42BTmaH5j9syWdkGNscqVoeuxbCGIhn38imuuwU0=;
 h=From:To:Cc:Subject:Date:From;
 b=VXbjvpuhngUwFF2lpH+mmsnIMAN84ZzUkAb68S7HsjPA26uGZ5a9rHGBoJkSJKdyG
 l7F7DpI4TR573D9CqGfS/9e6TGojvcZu3y0mRWTVfLCt4XXwNQEwwlHT5CLelw5i0u
 DMeImR80o1Hlu6/JOFfmowIsYVPe0e3ogXhAuVB5DW+GmFGFeCTG1cyuAMbm9g0Cn6
 y+OcX3va5bHiv1d63kk1QNuBllY4KPNCgHdb7FSo7eTtIh1AYhcjx8qj9vK/lcH/U/
 f52Pvy19EZFWWPHC37Pv4JjvNfWu+0+dTWbb/GTPdC7JGFUE3NkJ2Dv2pJ5s01sAuU
 hInE0YENXrSOA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.12-6 tag
Date: Sun, 11 Apr 2021 00:43:49 +1000
Message-ID: <871rbidwt6.fsf@mpe.ellerman.id.au>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.12:

The following changes since commit 53f1d31708f6240e4615b0927df31f182e389e2f:

  powerpc/mm/book3s64: Use the correct storage key value when calling H_PROTECT (2021-03-26 22:19:39 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.12-6

for you to fetch changes up to 791f9e36599d94af5a76d3f74d04e16326761aae:

  powerpc/vdso: Make sure vdso_wrapper.o is rebuilt everytime vdso.so is rebuilt (2021-04-02 00:18:09 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.12 #6

Fix an oops triggered by ptrace when CONFIG_PPC_FPU_REGS=n.

Fix an oops on sigreturn when the VDSO is unmapped on 32-bit.

Fix vdso_wrapper.o not being rebuilt everytime vdso.so is rebuilt.

Thanks to Christophe Leroy.

- ------------------------------------------------------------------
Christophe Leroy (3):
      powerpc/ptrace: Don't return error when getting/setting FP regs without CONFIG_PPC_FPU_REGS
      powerpc/signal32: Fix Oops on sigreturn with unmapped VDSO
      powerpc/vdso: Make sure vdso_wrapper.o is rebuilt everytime vdso.so is rebuilt


 arch/powerpc/kernel/Makefile              |  4 ++++
 arch/powerpc/kernel/ptrace/Makefile       |  4 ++--
 arch/powerpc/kernel/ptrace/ptrace-decl.h  | 14 --------------
 arch/powerpc/kernel/ptrace/ptrace-fpu.c   | 10 ++++++++++
 arch/powerpc/kernel/ptrace/ptrace-novsx.c |  8 ++++++++
 arch/powerpc/kernel/ptrace/ptrace-view.c  |  2 --
 arch/powerpc/kernel/signal_32.c           | 20 ++++++++------------
 7 files changed, 32 insertions(+), 30 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmBxuXYACgkQUevqPMjh
pYBgHQ//eM5IN34NKvsdcVEZatYDqIwMNL0w805XmFXcNHeUJ3HP6wf+R84L6zzi
9reylRchDSGOO7qGDbhutDeCvtEO3hgqG+t60sraHEMD8bmzxy3cnidYBpL+SXCV
AmI2hpTzv/qhTLLD85Q6A7jtA0QCJA+Qluw2cgWB44XbKsNX4tofXBMxCZC8tvmb
/SBb2ccZQ1Q0ZkkQSnxuf/MV1h4m8+sOryc7iIbAlfW3Ag5xEj6UwUzpS8VJ0h/e
WR6QRERZN5jwP9jMWVMo7zXw1Rw/vbN97hayUj3dk1QofLmAEOQMG8uPF43SKnAu
3hdabHASC7apYbiN6DQWSh3waXZP5a/pWhMjHKvYEsEOJCxYXTXuI124fbB+QkSj
v8VzKzoDCt4rh7H7wsY8lmqDjwrklEtRrdg0qaZ9seMG6+hWv/0iu30x3NLHLSLD
pR1rhWRlgVNegT++sQlBdgYory4qrAhi6s+0tXWSEX86XqSNaQd9U3KZ4sBwlnAQ
dgaPOQl5T3uY8kVWaSMadMT6IXVetkIBOiUOBUqNzeBKsEPAYj9Hs7FK402cuUT4
O/KwqIeEuDcO6lLCznU81uapqOaGVbsPs/qcETCqyfJmzo8Us/slFmzCd3bvSm+a
eIUUUyrgSAi3LjczjnOwjOXj0RId43/hMLkfrT0EZ138wwjHm7s=
=2wh+
-----END PGP SIGNATURE-----
