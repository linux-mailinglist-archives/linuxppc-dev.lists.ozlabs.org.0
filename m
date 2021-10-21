Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C83A543605C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 13:33:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZljC2P7lz3c9Q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 22:33:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=deHlduqH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZlhb41Jtz2yZv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 22:32:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=deHlduqH; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HZlhZ1ydbz4xbT;
 Thu, 21 Oct 2021 22:32:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1634815966;
 bh=TBgYNuOR6CivwRz9RieGT4fDeQjeQcdqKnl/zYLrtt4=;
 h=From:To:Cc:Subject:Date:From;
 b=deHlduqHZl1OYycNUVspKOnHKFxOZwIQkbO65ZeKH3QRUrU+IICG8q34Dzb/9j4sI
 UvGnGvHtkfdWeVJXDIrkwO5xxQB/XHS4GQ0et0fr/OGW6LiSfEhW0xxrx1PqM71+Yl
 WQyp9j6EAcv7VcLH/ZDaOXgRVDEak+RJqR42MlwvzVskntIun8C3tzbliSBgb78mXW
 sN3pxd5+CgVrajcsfO3qboebfh4rhuXMq+UiDaPajFrIJ560vs9KWH+HddZaCDLIw9
 Z/SRh8IisjyGa7KxZG+Y/v3hPn1RSEKUOZuCG7OMeS7ns84naYsB1ZUgbarwJ7QtAZ
 J7AYrZaO5fw2Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.15-5 tag
Date: Thu, 21 Oct 2021 22:32:45 +1100
Message-ID: <877de6d34y.fsf@mpe.ellerman.id.au>
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.15:

The following changes since commit cdeb5d7d890e14f3b70e8087e745c4a6a7d9f337:

  KVM: PPC: Book3S HV: Make idle_kvm_start_guest() return 0 if it went to guest (2021-10-16 00:40:03 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.15-5

for you to fetch changes up to 787252a10d9422f3058df9a4821f389e5326c440:

  powerpc/smp: do not decrement idle task preempt count in CPU offline (2021-10-20 21:38:01 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.15 #5

Fix a bug exposed by a previous fix, where running guests with certain SMT topologies
could crash the host on Power8.

Fix atomic sleep warnings when re-onlining CPUs, when PREEMPT is enabled.

Thanks to: Nathan Lynch, Srikar Dronamraju, Valentin Schneider.

- ------------------------------------------------------------------
Michael Ellerman (1):
      powerpc/idle: Don't corrupt back chain when going idle

Nathan Lynch (1):
      powerpc/smp: do not decrement idle task preempt count in CPU offline


 arch/powerpc/kernel/idle_book3s.S | 10 ++++++----
 arch/powerpc/kernel/smp.c         |  2 --
 2 files changed, 6 insertions(+), 6 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmFxT3IACgkQUevqPMjh
pYD0Mg//fh9BEVcfCtGJskqpbppkLJL8Pk/npKdiXZ1//ESTnSSXp0SfjHwnKW8H
R+FYUomAdB4pis6lfUUlVFHcADPrf1C55IF6f4pP7mLWGKuscMTjDRmgBOkgEreY
pciP+aGkNWu6Lmzoz1ZEqYr1mZW6TX3/Os9BabFUNze4gzTT6Y4U+/QOYrt5VQZB
SAnzyfjOq0c9HDP3OFVn9xUGkOpikRA2rT/0lKVFs5CPkqmLv82i/slz9SwE96kX
Zfi9CCJ3ule0RgysYg33QpAzZfQiLATAJBLk+Wlyl9SAFQ8w+cOhFtJmHryGFPz5
n5JopbE2lECJxw5fhasLwraDZzTd84xHvx1xpl2nIQEzrRlpV+Kq2c7SEbNROakL
rp/xmnBjfo9wMVwjo7x20arqj+o5XBs7yW04gMXV5yJVMUjgn288LAZzTe9nNegk
drzfrVHyvNKCoEWZr0egUDazSuh1kiWC9srmZ3IB2Cx2AGXYvXk+MsftoIqP8Nu6
gs9+NRwNiroaX3aujlcZHC4J7QwGMUZo6Dvs2e0VX+kvGlvnrP8+7pQ0eSoSJlVv
DfeTZa630yD0TdPVqWXHHeOUqbza/bpeHUxdFwSYdlr4DLrr3XkfaO/VQ6XJmTHa
9aZq3y7ALgQGvXHUIJYH4upZYoK1BhNqCJ0A2w+8uqKlunlXx8w=
=ES/7
-----END PGP SIGNATURE-----
