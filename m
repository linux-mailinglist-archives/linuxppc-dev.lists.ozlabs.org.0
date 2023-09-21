Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F30197A9341
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 11:47:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=npXDkE07;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrrCq6ZfTz2yq2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 19:47:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=npXDkE07;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrr9Y6l3dz3cCT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 19:45:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1695289521;
	bh=RnTI8fNdbZjWAEu2Dfslcn699MAz2b9JB5o2kUxoocI=;
	h=From:To:Cc:Subject:Date:From;
	b=npXDkE07KoiOvtc1s8QOJjUrnNnaxOs9VeIQYpCJ/jUzxIfm/H05icmkVlb7Yo3s3
	 TvgAysDQ1KRYvBJ7dsV4smvzY7T+U6NrhFkZEwAMqpJM0/j+UDJmWecy6AxsoqI0tf
	 EN1k5ZdqyXH7tJQeojkV3Nd3QrqIfaa5xYksmYdY3iH7xzVa28gbFjRUwYzbh0/zQ0
	 3UNWVHJoLPM5W+clap5QcGlv916l7guiUQ2JZkEtfecH7ZAieB+PUTgSmE7goqjW1p
	 gIqlK64OdY5zswry+0KkP2WN1NDEHH444bSCoqkf81RYKFSE0FMu7FsFz9MPQUySwF
	 RZAy8xe3ChuoA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rrr9Y5YGTz4xP9;
	Thu, 21 Sep 2023 19:45:21 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.6-2 tag
Date: Thu, 21 Sep 2023 19:45:21 +1000
Message-ID: <875y43oo5q.fsf@mail.lhotse>
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
Cc: kjain@linux.ibm.com, naveen@kernel.org, linux-kernel@vger.kernel.org, bgray@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some powerpc fixes for 6.6:

The following changes since commit ce9ecca0238b140b88f43859b211c9fdfd8e5b70:

  Linux 6.6-rc2 (2023-09-17 14:40:24 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.6-2

for you to fetch changes up to c3f4309693758b13fbb34b3741c2e2801ad28769:

  powerpc/dexcr: Move HASHCHK trap handler (2023-09-18 12:23:48 +1000)

- ------------------------------------------------------------------
powerpc fixes for 6.6 #2

 - A fix for breakpoint handling which was using get_user() while atomic.

 - Fix the Power10 HASHCHK handler which was using get_user() while atomic.

 - A few build fixes for issues caused by recent changes.

Thanks to: Benjamin Gray, Christophe Leroy, Kajol Jain, Naveen N Rao.

- ------------------------------------------------------------------
Benjamin Gray (4):
      powerpc/watchpoints: Disable preemption in thread_change_pc()
      powerpc/watchpoint: Disable pagefaults when getting user instruction
      powerpc/watchpoints: Annotate atomic context in more places
      powerpc/dexcr: Move HASHCHK trap handler

Christophe Leroy (1):
      powerpc/82xx: Select FSL_SOC

Kajol Jain (1):
      powerpc/perf/hv-24x7: Update domain value check

Naveen N Rao (1):
      powerpc: Fix build issue with LD_DEAD_CODE_DATA_ELIMINATION and FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY


 arch/powerpc/Kconfig                            |  2 +-
 arch/powerpc/kernel/hw_breakpoint.c             | 16 +++++-
 arch/powerpc/kernel/hw_breakpoint_constraints.c |  7 ++-
 arch/powerpc/kernel/traps.c                     | 56 +++++++++++++-------
 arch/powerpc/perf/hv-24x7.c                     |  2 +-
 arch/powerpc/platforms/82xx/Kconfig             |  3 +-
 6 files changed, 60 insertions(+), 26 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmUMEHgACgkQUevqPMjh
pYDDQw/+IuTozHtltaJEigsvcf9htmKoTBDqZqX3io+b8tg4dVnHIcfFlwAzr5XE
u7y0ktoqzldKBs2cOJh6hboafhazE/EdJlXEJP/79RQHf7Qyn2qFrH+627Az0dzi
ApuKpJtWqDyx934U+Xoys8dE8vDssGMD5kdjg0QMS6bp5pIXeJVLvxQUp/S+CQg3
MNcPGyFOXPd23FaXLCXuOL1rO4eyJCpiH5JOlBsod3YY85eyVD6Gpl4Uoi488C5j
fFpqOIKI+FmdA2NkbWxXPhC4j95y65l2qPhjANEfr2GnnKTW37RFmXS8OECleCHU
g8XB5quhNMeBkrRB5ZsmJ88M7IeYRJyYnsV+SKiR/NesiUrlWZKaZUdhiTnjDcVo
xzvLq9ZZjOx1opH23luC6HaXs/XiGD7n190OVw/8oBfklUkkqjhSN1pZXRWLsbL3
duGOFS+VuTI6UO4w8mqzQSrUjptR9UaQng/z5iloxzrbvwlnUrbccKFqf7seuv0c
HLyAbl5tMoGIhHWANn+1U0sMrgJy5L2b4es0cEsN0IxhCpNno+YnrtqVBdhDFfJZ
7TLxw6J8rVz5LN0bjXBwAiknGgi9xobJcIqP/nbG/jMjnCJ8w8XVnnOfZhJFSMEZ
nsQii1wmAuUTzFKJ/73Y+X61P1MYfs8sQOfqgqvLkhRNUI7TrFc=
=NfRO
-----END PGP SIGNATURE-----
