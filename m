Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 715292F0759
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jan 2021 13:57:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDH1j0lrWzDqF7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jan 2021 23:57:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDGy14tYxzDqN8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jan 2021 23:54:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RZ8PTmPB; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DDGxz6D3Fz9sW8;
 Sun, 10 Jan 2021 23:54:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1610283271;
 bh=g23izZcro+YvXpsj5ZHGOgHZE18lg82o/C04DfMcd+M=;
 h=From:To:Cc:Subject:Date:From;
 b=RZ8PTmPBk50jC8VUOyKmBD9lndE4Tq/XPyNJUsU9XDkPzaWUVPoE9fHSoa026PlHy
 DtJl/YOFqFmpS5N72xc7+zSqw3Rsu5Yc4WUFkDc9KvoG60cYZX8NgdJ+Zi8PCu9/TP
 LOQBOYr+V9GUQTc18An5Y/7FF/y2MS1DDsdc41EjKNd3zD8K9xHF1itR/wdzdGDvkc
 PMqZ4qpTCgWJ3k36sassoUj0r185PBLrz+PgjDqp7nLYmxGuQjIfBNd9eg8kdLRIvE
 oXWFTuHleXsz8lecdNEiE3NWkRcRiGx6axs2RUor1cN0VF2InOz3wMVJ0dMSvJGGgK
 eN6VFITG0X2+g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.11-3 tag
Date: Sun, 10 Jan 2021 23:54:30 +1100
Message-ID: <87y2h1j6k9.fsf@mpe.ellerman.id.au>
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
Cc: natechancellor@gmail.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull a couple of powerpc fixes for 5.11:

The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.11-3

for you to fetch changes up to 3ce47d95b7346dcafd9bed3556a8d072cb2b8571:

  powerpc: Handle .text.{hot,unlikely}.* in linker script (2021-01-06 21:59:04 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.11 #3

A fix for machine check handling with VMAP stack on 32-bit.

A clang build fix.

Thanks to:
  Christophe Leroy, Nathan Chancellor.

- ------------------------------------------------------------------
Christophe Leroy (1):
      powerpc/32s: Fix RTAS machine check with VMAP stack

Nathan Chancellor (1):
      powerpc: Handle .text.{hot,unlikely}.* in linker script


 arch/powerpc/kernel/head_book3s_32.S | 9 +++++++++
 arch/powerpc/kernel/vmlinux.lds.S    | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAl/696oACgkQUevqPMjh
pYDNEg/+POcwQFJL0807yN0tbEmdWx0QJSTEyhSczSQfArqAr6Wjl5cAUf8VIqm1
cj3zze6syGuC/geCAYTYPc9BTb7st50w2XEj1LIR1S8YMk4sS+TcnWxYr++pliUZ
vcVFf5Xab5ZTOMODDyYR4C4KCu/FyF7pHYSap3XdJ4HjiDtSSNWowydTrAXxsm0d
OvfsXqoBZ/6CHquIeGy1qFkC1vWPTeZSBOxLelxaY3LUdBIku7zolHawSvVaubyz
f6CjFiQQ9HUc4clezqmMtL5f6KZh4q5xiynNFZRBeajGqYjWsd1qZbs7Ankw55qb
X7XLjbihVjpAzR+x/nZycGTKLCWsQ74vxpbFXg/DsV2ThfXUG23zhmt2qC8il/1Q
0R1CEPDoE/q3enroDJAfec1ANg0c/o/G/l+n4mK6OKt3fDRYc+BQED78dYWfzZPu
KwXnXRdAugLNqk3Fp4YOZl3kk/4JvYnguaUiIxWoD94UXf67BESJICS84hMZ2ytT
x5irkTM9LFwempJ0t+ayfR+4EWH4GkvsnBhfpcZ5KqFF1ttSjhs8ETdWFq7cOn8n
xHC+6Ed8f36pOzeBv9FIYvRbgMgxQXtVMk90PIPQdRepXzPRm9Ik/n+kq0F8GFEG
CqX4LpI3lUIkFwei4F9DfUPW01xiHELT7vFM3hFpo6O7M6NR8Rg=
=S2EG
-----END PGP SIGNATURE-----
