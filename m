Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 474234CE9E7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Mar 2022 08:52:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBDMD16Hzz3bYb
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Mar 2022 18:52:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZzwUG+a1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBDLc2ZHGz2xt0
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Mar 2022 18:51:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZzwUG+a1; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KBDLd1jY2z4xZq;
 Sun,  6 Mar 2022 18:51:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1646553097;
 bh=B5XtaoeoT0rBTwSnV/F7wwngkRnmYj50AHXgTV5L/xs=;
 h=From:To:Cc:Subject:Date:From;
 b=ZzwUG+a17wEYCLewAxXIC4+mo+VoHEj+eu6uk8qDjf9J1A7deoZt9fiyi8vhCsuJ1
 1Yd8P7i6dkBYj2Rh28qRROiuLjOtr2+KW+nZX7Rx+quGSgtYtnyTDpahV95t8qulVw
 903QozxkWNgtUGkGTtFy20KMW4v/mtSXveo6TeoS0zLnylZLpJrbEN3S9Ac1cCoK5C
 OvEbsDtSCLsLpwvLMAN51Nen+2fFjhQ7ULrUGOTmDv3+M0fQTpe4Xm6R+B960COdRg
 6vvIFkvcpjy6phU6kY+rXv4/f6iEEEYvHBTglWpjtTfZjG6M+B/aSionMGnmaoJ3ZZ
 c5mtXHNcUf4CQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.17-5 tag
Date: Sun, 06 Mar 2022 18:51:36 +1100
Message-ID: <87bkyjo6wn.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 muriloo@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull another powerpc fix for 5.17:

The following changes since commit fe663df7825811358531dc2e8a52d9eaa5e3515e:

  powerpc/lib/sstep: fix 'ptesync' build error (2022-02-15 22:31:35 +1100)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.17-5

for you to fetch changes up to 58dbe9b373df2828d873b1c0e5afc77485b2f376:

  powerpc/64s: Fix build failure when CONFIG_PPC_64S_HASH_MMU is not set (2022-03-05 20:42:21 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.17 #5

Fix build failure when CONFIG_PPC_64S_HASH_MMU is not set.

Thanks to: Murilo Opsfelder Araujo, Erhard F.

- ------------------------------------------------------------------
Murilo Opsfelder Araujo (1):
      powerpc/64s: Fix build failure when CONFIG_PPC_64S_HASH_MMU is not set


 arch/powerpc/include/asm/book3s/64/mmu.h | 2 +-
 arch/powerpc/include/asm/kexec_ranges.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmIkZ+cACgkQUevqPMjh
pYCF1BAAnmZb6JbgLgztefPUyq9mx0q5FqcCqAhj6I+x/8T4qBGawbFpqazW6BIm
i1vHp2Yrj+S86qDQLo33LzO4nKK+EMDhgCAjFpryD8Kla0wDHBYDZy6JMd7LDYao
+j0EBB3w+HOWIUB50fb6EbEgRUFA1gMK4UaOxDRW5dnZCJ7h2qWB5Yev4i1Lzkmb
tPMvfPQYqMjzEcdMt07m7qHG72VxyBUgQbSMhE7VSKjmp9/oNPzxFFBmA0HoX6md
0pwXfXtvnVnMboSTHBYe6Ohk+kdA2P8P7agn/TW0kENP+RM+KePWVOAvAfqPjYCJ
dmqQsmn5ar46tlpPTS834ErDlCNNmfWuNAVILxUt3hQOyHQn4lDDZLR6EDKX22GX
OV9Hth5VPKqkiz8PmGAgcTE+A0s+kGU8DZN9LZefyBLV3Wb5/gHuxQFn8SCX71aE
EtcPJTP7IxZN8epI0b0ZEwM88i6RtFcteAlwYErGe9/UYBJK91zHj4FMWf83BI73
tmJkaVcDDezsbKGuibj3THB5SgzCcp/W5FrPjHWGXbrtYvjGuYp0HKraMGiLimlo
QV3uB/j7qMK0zHBXcypH0P6RrNN3NlaFiSMdl7KrdeWEsaGN8dQ8vKDYo3gJSKF+
lbUkYQV0d6RvHVZvgT11WC9o1SoKH2V5n9OGKNKUmz4RquAbCd8=
=7GLj
-----END PGP SIGNATURE-----
