Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3046313AB6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2019 16:41:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44xBXS24h1zDqNb
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 May 2019 00:41:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44xBT33TGszDqLr
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 May 2019 00:38:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44xBT15fzxz9s5c;
 Sun,  5 May 2019 00:38:45 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.1-7 tag
Date: Sun, 05 May 2019 00:38:41 +1000
Message-ID: <877eb6xp1q.fsf@concordia.ellerman.id.au>
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
Hash: SHA1

Hi Linus,

Please pull one more powerpc fix for 5.1:

The following changes since commit 7a3a4d763837d3aa654cd1059030950410c04d77:

  powerpc/mm_iommu: Allow pinning large regions (2019-04-17 21:36:51 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.1-7

for you to fetch changes up to 12f363511d47f86c49b7766c349989cb33fd61a8:

  powerpc/32s: Fix BATs setting with CONFIG_STRICT_KERNEL_RWX (2019-05-02 15:33:46 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.1 #7

One regression fix.

Changes we merged to STRICT_KERNEL_RWX on 32-bit were causing crashes under
load on some machines depending on memory layout.

Thanks to:
  Christophe Leroy.

- ------------------------------------------------------------------
Christophe Leroy (1):
      powerpc/32s: Fix BATs setting with CONFIG_STRICT_KERNEL_RWX


 arch/powerpc/mm/ppc_mmu_32.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJczaPFAAoJEFHr6jzI4aWAEsoP+wbm3WGTTSULdF3PbIGEtVbQ
CNrw/LpvNsmAn6210U2ag7Fwd6/hIprIy9wgwbgNiB2kDtMNy6srl1eMlC9npsV4
y43xeJQ0E2+u10eaBNsiwJEYtmNkJMuxCu31zGH/PZ4nTi4hdvaVwUETR725vYli
LICixZ2yr1eL948D3DzWpGigBmGhq1ajBsdXxn2sHxbeqefnFesdrjPR2e2GIj7E
cyHb+7vUATLUVc405yYCyHEU3/cly12LPcsreGe/tPWSJxw8I2BU36lCCXgby62w
E1KlSb4EzFx+lFujK6ICxaflFOtkP+0Xzajq8YU0qrItkGM8DA6yTy4vU99gN1KP
pgNwbaoMQCNJvzk0cIuMZ0RMGKrkRT4y2jW+MhHALMSkyv4HGKqT/N227PMq4U94
nVv41w868b8NnTrN9pLfSR+Gyr/Q7sF8zEVv0eIpbSciB/OTcg0yqAp7V2p0cTBG
pKM/c6glvkrbfEkoRItMpVU0PbckPFjXgTVqI/rvdiAVoEQvi1U4r8Fpu5I28j1d
wuryRhjnGXgkSjBlXkSK+tASWZHcKwhnD1y9KTHtKuLdxJqjDfyX0Dii+FqU5w42
aKeU4VrlrCGX2VnLj7ViH99wzkMogP9oZWZ5bhmOva/boxo1kJ9/vQkxaiXrhVjd
NLBrlVeLtaCjY52+eEJS
=k/X8
-----END PGP SIGNATURE-----
