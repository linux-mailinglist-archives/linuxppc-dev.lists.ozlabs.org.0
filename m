Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7568A7D9156
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 10:24:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nOB1Bm2c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGwgw2rx7z3cTp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 19:24:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nOB1Bm2c;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGwg40B0Cz3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 19:24:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698395039;
	bh=Xf78J3V/nXWymNnOwH36m1SnWDgSk7e+g5wPMMWhq5c=;
	h=From:To:Cc:Subject:Date:From;
	b=nOB1Bm2cpfX6gPBREdr+tWLK2o9fhlDyjCa9EyhyoECPthDo58JkBkP2hJ4o3gewk
	 1eCQG1kuXeehLbAZxJlXDh7zoGujS8fNOTg+iPfhO4bJONcbysFeNFV8/zfmeh7dSK
	 pTHdIVa+6M2rICmtDEGj057/sZYcwJDG56e1/INscYP8Kc2HM1XWs2tOwN37WrgnGr
	 /y/JcW/0DJFtbaSedl4r528qqqyBbuKM7rR4h/7ZlCKTje7uT2cj1ixUPVbbaITT8n
	 4H/RSvj1NG2MmE1J3rSiIZ7O2/g/8hSOhJMe1WJQqXl+IuzBmiz4ZmO9ANu3U0qvx1
	 PxWfcx3r1fh9g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGwg35nyqz4xPM;
	Fri, 27 Oct 2023 19:23:59 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.6-6 tag
Date: Fri, 27 Oct 2023 19:23:43 +1100
Message-ID: <87edhgv5gw.fsf@mail.lhotse>
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

Please pull some final powerpc fixes for 6.6:

The following changes since commit f9bc9bbe8afdf83412728f0b464979a72a3b9ec2:

  powerpc/qspinlock: Fix stale propagated yield_cpu (2023-10-18 21:07:21 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.6-6

for you to fetch changes up to 47b8def9358c5eb888e78b24b7e5b7f2e2e97b8e:

  powerpc/mm: Avoid calling arch_enter/leave_lazy_mmu() in set_ptes (2023-10-25 16:08:46 +1100)

- ------------------------------------------------------------------
powerpc fixes for 6.6 #6

 - Fix boot crash with FLATMEM since set_ptes() introduction.

 - Avoid calling arch_enter/leave_lazy_mmu() in set_ptes().

Thanks to: Aneesh Kumar K.V, Erhard Furtner.

- ------------------------------------------------------------------
Aneesh Kumar K.V (1):
      powerpc/mm: Avoid calling arch_enter/leave_lazy_mmu() in set_ptes

Michael Ellerman (1):
      powerpc/mm: Fix boot crash with FLATMEM


 arch/powerpc/kernel/setup-common.c |  2 ++
 arch/powerpc/mm/mem.c              |  1 -
 arch/powerpc/mm/pgtable.c          | 32 ++++++++++++++------
 3 files changed, 24 insertions(+), 11 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmU7ctsACgkQUevqPMjh
pYDD2xAAiDTlWc3AszHLgr/jj3hN++r/D6kso8sMbPPdqdLJ0Cumn41JdeOP3hO4
oEcr5L9ing1LG4KLDy94LCq/V5A7RmAIzOd0Dm6az35TL8J/LyLEFoncHaAG9O0F
mhGeuREsideLCwkeFosXONHPsf+yKpeVDi2yOCHO5wGkGAThgudvhhedVcSLBmco
2MbwuT0IOFhxDZjWUNZR/wslK9CGnOKVtHla7Kg3XX6NxCMKqRSFfO9lPXrBgPTP
EgV5B6aLHdb2JmC2vCNnYpHtkoXs4hotrzLXccFM1APtwbTKz2RYZpjmAtcupcj/
GDzG/n1hK72M1hFVRG9G09n+DLI0RZGOtNkp4F+078AbSMBdyzIMnudmX4b/N1kF
RLFYFri8N9HsYVar+x8jPcm3GV/GGAcFCuVJWKozoaEkojdpk+RZYAipjbQRKyeP
uW5/vfffFp2xNen7poMB/yxXosIW71YiHLtEq6LOOOKF9sioNK85qlJfMfYz6wXw
LRSJj4d3ZZJBZ8gXLN5EaGQ/uweUtqVpekaMW9c+J4cg+qhgoagYnzPoLp2KsDON
1Kr2aSTkX/YpR2d9jANSsO01m4hvoM0DAMTPVZS2EeIRGgNrxzLL9DkHalT4sGq1
tjSS3NV/uLd8OAYGkFqL3Ldcn6PX0tj5yWbYp9yzEAYx9yOgdOI=
=Rmou
-----END PGP SIGNATURE-----
