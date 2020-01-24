Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 530DF148539
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 13:34:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483z9q3mLBzDqbB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 23:34:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483yj94hj3zDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 23:13:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kvsO7yi0; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 483yj81rSxz9sSD;
 Fri, 24 Jan 2020 23:13:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579868012;
 bh=mvUiJElIyk4EAjVnu52b+VpTHph+MbXwLjPi7+Mdbjg=;
 h=From:To:Cc:Subject:Date:From;
 b=kvsO7yi0Q3x6EVEmh9WFec5ltH7SPXt2mIlSO88aLu/sSU7wwigX7Rw6vjklBonDe
 ZmFknE2WXZXYTqJSWlXKovnu7DnhNCd6Ev13xMte1EdRmVLdmqYCQVWW68qJ66G97V
 DHirbvgEpbtS+hDcDgHbEHZSEVkX8N/zi0Q8dRAAszGtSPzt7jIlFUfUWC9px93Utv
 nhQdvZt1A2676gIvtrYcxd8RFYTWbtZ97alrzmq/kbZltzLOVzmdk7bRXz5r6a6rVO
 7EcuZhnivoOL3XHqonKoWx/nDyVSeOv75iYzCu2cIixzRWymOQFqWx0O74kWoNe6w2
 ULZ1KtWWTcPqw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.5-6 tag
Date: Fri, 24 Jan 2020 23:13:30 +1100
Message-ID: <87zhedgihh.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: fbarrat@linux.ibm.com, aneesh.kumar@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 bharata@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.5:

The following changes since commit 6da3eced8c5f3b03340b0c395bacd552c4d52411:

  powerpc/spinlocks: Include correct header for static key (2019-12-30 21:2=
0:41 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-5.5-6

for you to fetch changes up to 5d2e5dd5849b4ef5e8ec35e812cdb732c13cd27e:

  powerpc/mm/hash: Fix sharing context ids between kernel & userspace (2020=
-01-23 21:26:20 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.5 #6

Fix our hash MMU code to avoid having overlapping ids between user and kern=
el,
which isn't as bad as it sounds but led to crashes on some machines.

A fix for the Power9 XIVE interrupt code, which could return the wrong inte=
rrupt
state in obscure error conditions.

A minor Kconfig fix for the recently added CONFIG_PPC_UV code.

Thanks to:
  Aneesh Kumar K.V, Bharata B Rao, C=C3=A9dric Le Goater, Frederic Barrat.

- ------------------------------------------------------------------
Aneesh Kumar K.V (1):
      powerpc/mm/hash: Fix sharing context ids between kernel & userspace

Bharata B Rao (1):
      powerpc: Ultravisor: Fix the dependencies for CONFIG_PPC_UV

Frederic Barrat (1):
      powerpc/xive: Discard ESB load value when interrupt is invalid


 arch/powerpc/Kconfig                          |  6 +-----
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |  5 ++++-
 arch/powerpc/include/asm/xive-regs.h          |  1 +
 arch/powerpc/sysdev/xive/common.c             | 15 ++++++++++++---
 4 files changed, 18 insertions(+), 9 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl4q30AACgkQUevqPMjh
pYCwSQ//Xbc8BofjbbiGambesHUG3Bkho8K38HSXfj9wdFdDS1f5PnUnTVNtNsch
GAXYEnreN33I5MZnOQO3Zaa6Ub+DPyDIn5dq1alo2uv/sJY4zyC/lwCeLNOAbC93
lj1s7laC7SQG6phf7hVT0xFMYA/j0GhQG8w4RIxiyJEXnm+Vb9SGUgbrArxmYRwF
dI7wHxEHdixMBgdA1q00inv51UIqmNJS/nPyBJUxBbKp1Kkzy0fOTLhgFCj4um6g
kX1AEzEkiNNpWDG30Hu6qrapa5181tet07ABgSxdyTB0pElbsigoFR5mRgeTWuAk
mP14couPhOx3NkW90yvuI9AvLAQIlvMH4rGbB61rqNgiLnfTGiYxy1Hvq2ihbXQy
TVdlLdjW2pa3vqz04vZa09NOjz9CHY1/llunpkJvUhd/ddXa+Cieu9fzDDC0fheF
ftZD4o9LtloGbWpa+re81uuQ/V6MhEOPbP44PJI70bVG+OWY0GPTuvqgKS/yckTv
Xxs5lTsU9qKDGsNOFzqwjTCLd3o4hPurfo6xrzyyMin2LRm4t8sTWLRm8SVoL+Wh
KRydvI8oE9qXNNCwwDnMYtiDmisZPWpWWRyPG+e34TXjc0SSEoeZUoVV+B/u5pVu
BIbzhRbbKY80E/m1virbaB+7Z92omfMnenIUdt3ZDTarh/INMdA=3D
=3DcoVk
-----END PGP SIGNATURE-----
