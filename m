Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B081B50D1DB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 15:09:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KmT4g3v5tz3bqb
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 23:09:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=W3XW05/8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KmT433vGqz2xDY
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Apr 2022 23:08:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=W3XW05/8; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KmT432ncHz4xLb;
 Sun, 24 Apr 2022 23:08:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1650805731;
 bh=aD20Ip6O0k4ur0B2dS9sPY/ZrzmWmmRTAz9tDJoSTE8=;
 h=From:To:Cc:Subject:Date:From;
 b=W3XW05/8eCCvEe2qhydOVID0LEjQT05ZwmU9KuRH8FhcCtfs3wceZJO22ej56/sSy
 8VS3VId1vBE0uEiJ97oV3hn3A6DdGYth0DrWfi6hvuJNa6dd2VFnWtfj+7Eg+sLpx4
 rYTBXYzDbq/MrVI+LkaMPyOQfWncI9lehShYcZCoF7E6ZfgWWigUpOpx2LM3kAJorX
 JrWq+No3WnEpK11Q5A2V+tCP+BTs7p1Nf7NuovW9gOZYk7hmT6eBhEWICAShHh4cuE
 /HXV1A25ANAyaIj3uqVqel3INcy8vdVssOELgE2BbXW51rHRSMlLHhThL2yeon+v6u
 mo7YvutK35KZQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.18-3 tag
Date: Sun, 24 Apr 2022 23:08:48 +1000
Message-ID: <87ilqy8w7z.fsf@mpe.ellerman.id.au>
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
Cc: aik@ozlabs.ru, atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.18:

The following changes since commit ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e:

  Linux 5.18-rc2 (2022-04-10 14:21:36 -1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.18-3

for you to fetch changes up to bb82c574691daf8f7fa9a160264d15c5804cb769:

  powerpc/perf: Fix 32bit compile (2022-04-21 23:26:47 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.18 #3

 - Partly revert a change to our timer_interrupt() that caused lockups with high res
   timers disabled.

 - Fix a bug in KVM TCE handling that could corrupt kernel memory.

 - Two commits fixing Power9/Power10 perf alternative event selection.

Thanks to: Alexey Kardashevskiy, Athira Rajeev, David Gibson, Frederic Barrat, Madhavan
Srinivasan, Miguel Ojeda, Nicholas Piggin.

- ------------------------------------------------------------------
Alexey Kardashevskiy (2):
      KVM: PPC: Fix TCE handling for VFIO
      powerpc/perf: Fix 32bit compile

Athira Rajeev (2):
      powerpc/perf: Fix power9 event alternatives
      powerpc/perf: Fix power10 event alternatives

Michael Ellerman (1):
      powerpc/time: Always set decrementer in timer_interrupt()


 arch/powerpc/kernel/time.c          | 29 ++++++-------
 arch/powerpc/kvm/book3s_64_vio.c    | 45 ++++++++++----------
 arch/powerpc/kvm/book3s_64_vio_hv.c | 44 +++++++++----------
 arch/powerpc/perf/Makefile          |  4 +-
 arch/powerpc/perf/power10-pmu.c     |  2 +-
 arch/powerpc/perf/power9-pmu.c      |  8 ++--
 6 files changed, 66 insertions(+), 66 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmJlSSoACgkQUevqPMjh
pYDAkA/7BkoLPd4V9VwBu847BkwK6Dd15b2Qu71y0ieF0xzDzG8pkOEjpk5gCVmd
DV17CXSeX8t9ppDcKp82tLtuTnBIDjpZVtoKBALvzxB8tgErTp1CemwRcnlu+ILT
Y5K/tioe+Y6V07HKcDefLIJrtt73IpHUV7GighPtbah0a/HNLB6+zx6HENzR2vKS
G5ccs+FDbVgStRxw1tzWSH9JiAC7AznRJTWjA7XDiMcRva4t4qoZHSVU32H6Tlis
fCQfIwyhyppxS5MizZx45qkumy5oJggdXhb2r7g1Wl7jeSAVPldY/S7Fq3UU8usa
e2k5ZyUGWVSKZxGAlY7v6h6SwAhs28fspA/+tI0pvSH9a8knBkHk8H8bHlnORKkv
j6zx1hx3qdD2BnVstEEwdiZzWrff6LwfaEytNfC1Fri7yVTkZoZVGihMKyCGHftB
7TmRMIg99WsEx8xNNDGelaEePyRhCPGHgrB0oEHrmCzJVi3a4IiVwGcaLZdYUekG
oEFwcyXz4mStftyS5qV/NhFSHMgum9CuTjV8fi2pqN9fFVcPoDEXoGyaSzji9UDf
AOIP1NXJMZZGgXAN5rusjRJ9zfyFkzLcRcLPjMUqRtKaDJD86LyGPgvxh+gR8ky4
8IzPHbwbYt6fMcDXkFjiS5Ks+x0ZfKkL5R7HbHNqyyKYWUSZxK0=
=21WF
-----END PGP SIGNATURE-----
