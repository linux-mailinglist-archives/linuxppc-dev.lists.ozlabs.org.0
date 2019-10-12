Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D1CD4F62
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 13:39:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46r2sk3w4gzDqfL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 22:39:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46r2qS19W8zDqdl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2019 22:37:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="JB2LLWKm"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46r2qL73D6z9sNx;
 Sat, 12 Oct 2019 22:37:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1570880243;
 bh=NUuYm3QgRCKdiVOv3fj1e5uvi/GpcpUadJPWe6lek+I=;
 h=From:To:Cc:Subject:Date:From;
 b=JB2LLWKmG0jQXJRimuZHaCJ+AiezNrebjfSKMGG/Jd+gOsfJnBKFxoxo5HtflOeg6
 Vxe730yVdFNklLqdy2ofOtnnH9JOteFy+H3SOppZ/U26NtFUwTuf0PmdC3MLm4xZOM
 ZQEiLxjw5eMDTgirf+ctd1Bg2HGC74h1s65hLUkTWnshLBBI10vK+t+f4F/AvruB6P
 4+cy0YzHMh4EAVB9ikz9jxVwYQi3+1EDx77gx2rhAiCjjQ9kR+yKHTtQfjoz7fAPEf
 p1EOPKedK0uIljbWS/OEjZOfIVcChPjiqRgVpPXwbOfqYJZbGZ6yfACKMbabrleOYR
 hu4DiSpeKsajg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.4-3 tag
Date: Sat, 12 Oct 2019 22:37:15 +1100
Message-ID: <87r23iurdg.fsf@mpe.ellerman.id.au>
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
Cc: sfr@canb.auug.org.au, desnesn@linux.ibm.com, arnd@arndb.de,
 emmanuel.nicolet@gmail.com, jniethe5@gmail.com, linux-kernel@vger.kernel.org,
 ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.4:

The following changes since commit da0c9ea146cbe92b832f1b0f694840ea8eb33cce:

  Linux 5.4-rc2 (2019-10-06 14:27:30 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.4-3

for you to fetch changes up to 2272905a4580f26630f7d652cc33935b59f96d4c:

  spufs: fix a crash in spufs_create_root() (2019-10-11 16:57:41 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.4 #3

Fix a kernel crash in spufs_create_root() on Cell machines, since the new mount
API went in.

Fix a regression in our KVM code caused by our recent PCR changes.

Avoid a warning message about a failing hypervisor API on systems that don't
have that API.

A couple of minor build fixes.

Thanks to:
  Alexey Kardashevskiy, Alistair Popple, Desnes A. Nunes do Rosario, Emmanuel
  Nicolet, Jordan Niethe, Laurent Dufour, Stephen Rothwell.

- ------------------------------------------------------------------
Desnes A. Nunes do Rosario (1):
      selftests/powerpc: Fix compile error on tlbie_test due to newer gcc

Emmanuel Nicolet (1):
      spufs: fix a crash in spufs_create_root()

Jordan Niethe (1):
      powerpc/kvm: Fix kvmppc_vcore->in_guest value in kvmhv_switch_to_host

Laurent Dufour (1):
      powerpc/pseries: Remove confusing warning message.

Stephen Rothwell (1):
      powerpc/64s/radix: Fix build failure with RADIX_MMU=n


 arch/powerpc/include/asm/book3s/64/tlbflush-radix.h | 4 ++++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S             | 1 +
 arch/powerpc/platforms/cell/spufs/inode.c           | 1 +
 arch/powerpc/platforms/pseries/lpar.c               | 3 +++
 tools/testing/selftests/powerpc/mm/tlbie_test.c     | 2 +-
 5 files changed, 10 insertions(+), 1 deletion(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl2hsbMACgkQUevqPMjh
pYAvTg//SxycPkVZLln4SzXGj3f8dHyFUJS+796BXAyIS2ylIqRYFTvj9Uqfry/w
leCvU0xgB1LC0FTP2FCB9/q4GluB5uxkM32ziNFDSrPdfhtsV+WM4312ytrQEeLe
838D009gkDgd2NDxg0titW5pAq1oP7iwSilPKzZrb3pejJcHLK+qZ6+2SKefuXRs
Sn3nRT2yBJZqq1ECJjCH+mP/QGndf4sjyHQD43yTIT+SxKrnOWDEOqUCxHduhcYh
R2sof4pv5aC43b85C609D+yUi/VTbeHdrj8dbKHKHXmcDCmyRsYPpSNxd/irmLMr
c5hKbD0Nwu8p/TDv+NcjxA5w6Mf2Jo+btSPxTKErFpFCmbwQeM9OyUmLhpjKcbZl
PW8ArrMRkz0ypRhbDJz0oMp7mHLOWXwy0F8bxm96VoNgM8QpqJVwEh6J1O2DWzJY
Nwfc9nMKKtJNuQGWvpADvylIjbCPAUzl70vlPDEytx6JMu3JS/WwMfqqH4PQrGIs
BUllm98MBY9FrQFAVxnOPvpB16IQbsfKk/Vf1CY4RLYwIDfErA3sHXvnO0UepAtE
HEW/WF3VnRrU3wGdk2mHDVNyEwY7UIm6xp1QEcQDebLAS0bXdRhUmyrG9IBHOLLO
43UGwtlMKMf87ebx+Ps1l8Ih3bpwwFw+YJySMwQdhgF9CQOdXzY=
=2HLb
-----END PGP SIGNATURE-----
