Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D9A18E16C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 13:58:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48l10T3myGzF0kh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 23:58:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48l0wW6lsWzDrpw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 23:54:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=dgZxoTwN; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48l0wV5jdgz9sPR;
 Sat, 21 Mar 2020 23:54:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584795290;
 bh=LlPQAM4u1cDMEUFfteTOzt6qqPVorDOttCGFfUhK4H0=;
 h=From:To:Cc:Subject:Date:From;
 b=dgZxoTwNtdleZgkdNNVLiuAtznvtqHFziAswpD/A0G9nlX+otXlCPfoPXxtUSbmFY
 tF+KscAC7vdgh7pwSiBUuURBsaWHt13Bl4OxvDS9rKnUDGAlzStK2UdbcniGK0q0vM
 S0+FzowV3bbrcmk+ur5SNfHXlyXlmSj6qPxvItHkPdnZSVqimc/uUsv7o5wIAp32uD
 cojarwsDEwium5HX/I57sM9pNUojDTF/lVkYCJ7koBdqAbwJ75X8DfSDWBYkPfgxkt
 os8KiWO+53+bmCovYOHjY48IDmfz1XGZTR9rcqDV+gTmDJoplfysRyTJpGXDCDcyRC
 esDFFoBw9r58g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.6-5 tag
Date: Sat, 21 Mar 2020 23:54:54 +1100
Message-ID: <87fte1dg0x.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, groug@kaod.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull a couple more powerpc fixes for 5.6:

The following changes since commit 59bee45b9712c759ea4d3dcc4eff1752f3a66558:

  powerpc/mm: Fix missing KUAP disable in flush_coherent_icache() (2020-03-05 17:15:08 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.6-5

for you to fetch changes up to 1d0c32ec3b860a32df593a22bad0d1dbc5546a59:

  KVM: PPC: Fix kernel crash with PR KVM (2020-03-20 13:39:10 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.6 #5

Two fixes for bugs introduced this cycle.

One for a crash when shutting down a KVM PR guest (our original style of KVM
which doesn't use hypervisor mode).

And one fix for the recently added 32-bit KASAN_VMALLOC support.

Thanks to:
  Christophe Leroy, Greg Kurz, Sean Christopherson.

- ------------------------------------------------------------------
Christophe Leroy (1):
      powerpc/kasan: Fix shadow memory protection with CONFIG_KASAN_VMALLOC

Greg Kurz (1):
      KVM: PPC: Fix kernel crash with PR KVM


 arch/powerpc/kvm/book3s_pr.c          | 1 +
 arch/powerpc/kvm/powerpc.c            | 2 --
 arch/powerpc/mm/kasan/kasan_init_32.c | 9 ++-------
 3 files changed, 3 insertions(+), 9 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl52BiYACgkQUevqPMjh
pYDwqhAAsiBYfVZiof+3JQM1Qaf2nnrYHMCLgwT6BJ6l8IxcjPih/4tcWAhe9plX
8xAa44leV0I+HpO0gxFOcfmPTtMmgdk8elUq8NEN7NBQgCb0vDyhjRBPuotwFqvx
U5Hiztra4c87NSL3A/h9JXxtRQBTw5Eg3NuxVPHV6seMtUhBkJThfYWFY7DWvolX
v8poLVZjO2Tq+QuEwJuC1lFTCqT1u1V+IdxEbNrBWy3yNqvb9p4gAlvB+0s/xe30
SFmTyNWUdW4KCE+8Vvbpgr9+s7m6CCvysjlmPra+m7pgFe+X6qcRFLWz+L+8MSSj
+mSmFuyI6KYOxRRY3Er4Q7gnssfiNlcxr5I/jvhiXWJNwS3inv4OinlEfV4pW/eT
++Uy7JCwqel1JZANh0oqcydeuGdU8emozsi5LuRKLB6Mm5mFymzYRc+W6MEpUwM6
b+2rPAagOwY44DN517Ixkc/jdad3BCiLeuDWqzx1BVUHgEKNvu3RWhrHClM1kEey
AaH6u1KGQ81XuKqYrODFaLkOoCumPzUgK42CcjblAQcea1PpYl5myCVNILLBQjJK
kTa1CzX9JG0z9mWLjQwJSpYKB7MOQxBGy0BmxOdjjUBD9DkhGm0Pt7NGz1Xo0n9s
hCSVtCV9M1cfaPyvCDICbDtR+j8SQTfjFk9fDwWcnrssbhtac3c=
=3KDP
-----END PGP SIGNATURE-----
