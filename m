Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 260EF4A2F77
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 13:39:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmDRN0kmNz3cVL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 23:39:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AOddl/73;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmDQm0p0qz2xrm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 23:38:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=AOddl/73; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JmDQl3RVXz4xcP;
 Sat, 29 Jan 2022 23:38:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1643459935;
 bh=vZyNEpbqwYVBtDc0Bm62fWMs15rdm0+4+lYrW5u1VWM=;
 h=From:To:Cc:Subject:Date:From;
 b=AOddl/73hjPf3PmIDNq9l9pN6tgmLs5CEp1hdEhHMpSE1E3HfA8OsVnC0P64WA1/u
 Xb8rOynWzaWu8dTBEsgWYMS7EIUJFBZ8pKewi7cyCTLeDEnTsBLtWN0yzBmAua70mt
 1mdMT0oCileJeoEAy3aVQ7ZMKoYxe8SC7PW49hBak/0iGkHepoXiu8C6KFHAmcgyQA
 jgIHDjNYP6Oxk78rpC4Ecam8N+tT7Ehelx2eeTvoq1Rh1B7Ls7Yz0hGoetrzHQUWzf
 Vak9rAo425vEueoeZIj/GMhc4+LKW1EhNjg2dXx+PlrweWhE+U2uoMnou9qCI4e7oS
 AD+OL7ijyL6ag==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.17-3 tag
Date: Sat, 29 Jan 2022 23:38:52 +1100
Message-ID: <871r0qbtsz.fsf@mpe.ellerman.id.au>
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.17:

The following changes since commit dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0:

  Merge tag 'powerpc-5.17-2' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux (2022-01-23 17:52:42 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.17-3

for you to fetch changes up to 8defc2a5dd8f4c0cb19ecbaca8d3e89ab98524da:

  powerpc/64s/interrupt: Fix decrementer storm (2022-01-25 16:50:10 +1100)

- ------------------------------------------------------------------
powerpc fixes for 5.17 #3

 - Fix VM debug warnings on boot triggered via __set_fixmap().

 - Fix a debug warning in the 64-bit Book3S PMU handling code.

 - Fix nested guest HFSCR handling with multiple vCPUs on Power9 or later.

 - Fix decrementer storm caused by a recent change, seen with some configs.

Thanks to: Alexey Kardashevskiy, Athira Rajeev, Christophe Leroy, Fabiano Rosas, Maxime
Bizon, Nicholas Piggin, Sachin Sant.

- ------------------------------------------------------------------
Athira Rajeev (1):
      powerpc/perf: Fix power_pmu_disable to call clear_pmi_irq_pending only if PMI is pending

Christophe Leroy (1):
      powerpc/fixmap: Fix VM debug warning on unmap

Nicholas Piggin (2):
      KVM: PPC: Book3S HV Nested: Fix nested HFSCR being clobbered with multiple vCPUs
      powerpc/64s/interrupt: Fix decrementer storm


 arch/powerpc/include/asm/book3s/32/pgtable.h |  1 +
 arch/powerpc/include/asm/book3s/64/pgtable.h |  2 ++
 arch/powerpc/include/asm/fixmap.h            |  6 ++++--
 arch/powerpc/include/asm/kvm_book3s_64.h     |  1 -
 arch/powerpc/include/asm/kvm_host.h          |  1 +
 arch/powerpc/include/asm/nohash/32/pgtable.h |  1 +
 arch/powerpc/include/asm/nohash/64/pgtable.h |  1 +
 arch/powerpc/kernel/time.c                   |  5 +++--
 arch/powerpc/kvm/book3s_hv.c                 |  3 +--
 arch/powerpc/kvm/book3s_hv_nested.c          |  2 +-
 arch/powerpc/mm/pgtable.c                    |  9 +++++++++
 arch/powerpc/perf/core-book3s.c              | 17 ++++++++++++++---
 12 files changed, 38 insertions(+), 11 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmH1NGUACgkQUevqPMjh
pYAgvA//Rh/If5LRpTskLsHU+uExsZuaL1c1omDfy8kKywH2lfQed3ePxJrhreba
9LLbt796oHxmmSuwgtXGzcgYizyjUhWg36A9b761SCNfjFqm4UI/+1Vbqow42/iE
q4IKz20hJ1Vmt64iSvZPkeO11JEMlaRaX9Ozj2LTy0VFVy/ABILbc2em74zPymod
7ssldTbX4818NMJ2n55bPBLMCBGxE5zD2gUgIiqpnjDJTYFO954vVDGYPG46STy7
k7U3/kondag7AsKOX49Rqgoq9612sAOJExkhZMOApg2PTMl0nOTRNlAEmzZw/TR2
95pIjyR1v8Mjf7OHaZDM7sEtBZURhiOLV3Ff9BaZ22c3cGhLTiH7MTMIqRBfkpMu
p8TJK+y9hJv7NGWLNSXydDuiQhf064VzctsYHizAfGPbzs7znJRhKrIb5sRlwpw8
4ZLNEYEuFRYubVATnkYtgF11WkJ7aMdVgaLhykPtwWo8xktvKNuPC/FZvx0JXize
uGcHOtephGM2ulPgCXxuaYl8Zbl2wstcBe6shPE4jJDPXelEsyRTdjFrYi/9UIDV
YIS4TXhixlRuOIVjaxL3gqA2tzsoHWD9fmUWMG0T6SQsKYmWuSHLnpW0DmFrXuUn
qEw4KaMj+Abg/q0TVytNoiFuXSX1cJ8HtNLi4bNfacw27+kxQI4=
=YpAS
-----END PGP SIGNATURE-----
