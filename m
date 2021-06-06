Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 979E739CF24
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 14:45:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fybn816m2z2yYS
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:45:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n3yPlr56;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=n3yPlr56; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fybmh58mkz2yXM
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 22:44:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FybmS6nDJz9sXb;
 Sun,  6 Jun 2021 22:44:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1622983466;
 bh=X/hDMXOgYJINlaXQahFoL+S/LpzpX4FSL3A6BglVdDQ=;
 h=From:To:Cc:Subject:Date:From;
 b=n3yPlr568lok+2V//9qJlKn05LsC8V0JDVQ15IycQ29mbRLiT7e3CHNWZtYCHnLZh
 oOyaeWLO3pQu9FxPyF2XkEqk1kxV52cIbeYAyaZBWgW+VscIQh3nrqUDX7QDixzsVG
 HomIRlpTb0z7NUqBZvd/1EKmX5ewbgU8gdyibPTO0z8iz+tbLVHSXxkK1ewrOHDqF+
 m0vrWj10Wyyn4lX08YNAWJZ5aMp+70FQRob2RCXOIs4irzB0pCaTNSv4HA0flsTPqO
 JUxhazrOQzqGZAIWOM3iKZiH1SN45GHQ0xv1E3JHRT0iZjufv//ZkhSFzSSuTAjYPJ
 86/H1eY8G5tIg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.13-5 tag
Date: Sun, 06 Jun 2021 22:44:24 +1000
Message-ID: <87fsxvf9hz.fsf@mpe.ellerman.id.au>
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
Cc: fbarrat@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull some more powerpc fixes for 5.13:

The following changes since commit d72500f992849d31ebae8f821a023660ddd0dcc2:

  powerpc/64s/syscall: Fix ptrace syscall info with scv syscalls (2021-05-21 00:58:56 +1000)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.13-5

for you to fetch changes up to 59cc84c802eb923805e7bba425976a3df5ce35d8:

  Revert "powerpc/kernel/iommu: Align size for IOMMU_PAGE_SIZE() to save TCEs" (2021-06-01 11:17:08 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.13 #5

Fix our KVM reverse map real-mode handling since we enabled huge vmalloc (in some
configurations).

Revert a recent change to our IOMMU code which broke some devices.

Fix KVM handling of FSCR on P7/P8, which could have possibly let a guest crash it's Qemu.

Fix kprobes validation of prefixed instructions across page boundary.

Thanks to: Alexey Kardashevskiy, Christophe Leroy, Fabiano Rosas, Frederic Barrat, Naveen
N. Rao, Nicholas Piggin.

- ------------------------------------------------------------------
Frederic Barrat (1):
      Revert "powerpc/kernel/iommu: Align size for IOMMU_PAGE_SIZE() to save TCEs"

Naveen N. Rao (1):
      powerpc/kprobes: Fix validation of prefixed instructions across page boundary

Nicholas Piggin (2):
      powerpc: Fix reverse map real-mode address lookup with huge vmalloc
      KVM: PPC: Book3S HV: Save host FSCR in the P7/8 path


 arch/powerpc/include/asm/pte-walk.h     | 29 ++++++++++++++++++++
 arch/powerpc/kernel/eeh.c               | 23 +---------------
 arch/powerpc/kernel/io-workarounds.c    | 16 ++---------
 arch/powerpc/kernel/iommu.c             | 11 ++++----
 arch/powerpc/kernel/kprobes.c           |  4 +--
 arch/powerpc/kvm/book3s_hv.c            |  1 -
 arch/powerpc/kvm/book3s_hv_rm_mmu.c     | 15 ++--------
 arch/powerpc/kvm/book3s_hv_rmhandlers.S |  7 +++++
 8 files changed, 49 insertions(+), 57 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmC8wv4ACgkQUevqPMjh
pYDyIw/8C5X6YwKf+jM18S08wUfAy9BdnH79SNM4uANdYkpgduv8joMyjpoDs4Tv
I0LH0vx1QybGO8sJwOZJfGTrb5iQtZIBoZUtWoKZWFLsX8s6ltxh7Cv6skP3GfgK
YFrQirUtnOoi7xbgILkofklKCriRYdy0ww5+VqoNRk6WqWecRGhXtr17z3KNluTs
9Mt/7uWT275/XFd1IUzHFJfV/vkGnWTQD5N5sx/K9YxlIye/LdGb2o3FzLGr2jyB
SMHSS7cevNyl4chM5AaFAGs7WZygLFZmScDdR0jEh9oipk77puQnGvwTk9GcZVQL
Vy5tneHjWiKg0PbgWmuPWk3XfsgtoBGrpqsk2Guj23qOWolxhZ1DlpgO5+MRXXVm
0GLOJzbzR3Tf5NgsRxaGN2kjFuexyxawVJc1w8cM98QPAPYBIHIdHSjX9LIq/iW0
mXYWag1/etDQGmWgkKpun0aVRU2VH3pLejyRqwRT2ZZYm1Zo8Lsz21eDBoD+8jCV
pwOcB44F0jz4+13cjtyYcWfln34I4ex0pumrc0pGVF+6tfDPWJI8JXihORNrcUhn
KwZKkCZaqAMskiaNDyFS/45vWsYAevQdh74rVYG1Ad1yTXz9naY2t4ryOFB01DLh
H5pwoan6sdHt97C9SCI35oTC+W0cv/qEVv0fyJl0oH8U/QlKSJo=
=K09P
-----END PGP SIGNATURE-----
