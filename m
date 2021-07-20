Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8068A3CF9AF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 14:36:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTdVd3GmQz3bgw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 22:36:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YvNKATWO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YvNKATWO; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTdV65kWFz2yP4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 22:35:42 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6E0860E0C;
 Tue, 20 Jul 2021 12:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626784539;
 bh=asA6l4h5KrepX/z50UVRSC8Q3OvPiGjAUceJKgcJbl0=;
 h=From:To:Cc:Subject:Date:From;
 b=YvNKATWOtShf7swN0mmf2C6ONDPu8XOlH7q70SOroQM5S/MpCDM0YB8g1cad/xpAt
 DZdsiQnk9tGg0td/isJJ2XQ1/izSNXzsQN45DxDXpz3NNJvEIbKKxsa5dpOtaaE+8a
 CdUdXNFjOfsTHCg3WDra+78eNlhSkoOiYmB+mUHEqgyNu/swwAMbVxkpPUHjFZxtCn
 vLm4cfaJXBXxlkBtTY64lP3t/wN/Yd0rcIjowQ8w8CxqZOrgoc7dZgOU7csRBpJ8Qp
 XwqCbdeJMFNQXPGd6+z/3CyrU8g1IAnFcjFSPbUNOMUwmLmsvloD6mVhIG+b4t3vXa
 Qo/vh5hYZ98XQ==
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Fix arm64 boot regression in 5.14
Date: Tue, 20 Jul 2021 13:35:10 +0100
Message-Id: <20210720123512.8740-1-will@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Marek <jonathan@marek.ca>,
 linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi folks,

Jonathan reports [1] that commit c742199a014d ("mm/pgtable: add stubs
for {pmd/pub}_{set/clear}_huge") breaks the boot on arm64 when huge
mappings are used to map the kernel linear map but the VA size is
configured such that PUDs are folded. This is because the non-functional
pud_set_huge() stub is used to create the linear map, which results in
1GB holes and a fatal data abort when the kernel attemps to access them.

Digging further into the issue, it also transpired that huge-vmap is
silently disabled in these configurations as well [2], despite working
correctly in 5.13. The latter issue causes the pgtable selftests to
scream due to a failing consistency check [3].

Rather than leave mainline in a terminally broken state for arm64 while
we figure this out, revert the offending commit to get things working
again. Unfortunately, reverting the change in isolation causes a build
breakage for 32-bit PowerPC 8xx machines which recently started relying
on the problematic stubs to support pte-level huge-vmap entries [4].
Since Christophe is away at the moment, this series first reverts the
PowerPC 8xx change in order to avoid breaking the build.

I would really like this to land for -rc3 and I can take these via the
arm64 fixes queue if the PowerPC folks are alright with them.

Cheers,

Will

[1] https://lore.kernel.org/r/20210717160118.9855-1-jonathan@marek.ca
[2] https://lore.kernel.org/r/20210719104918.GA6440@willie-the-truck
[3] https://lore.kernel.org/r/CAMuHMdXShORDox-xxaeUfDW3wx2PeggFSqhVSHVZNKCGK-y_vQ@mail.gmail.com/
[4] https://lore.kernel.org/r/8b972f1c03fb6bd59953035f0a3e4d26659de4f8.1620795204.git.christophe.leroy@csgroup.eu/

Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Jonathan Marek <jonathan@marek.ca>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Nicholas Piggin <npiggin@gmail.com
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org

--->8

Jonathan Marek (1):
  Revert "mm/pgtable: add stubs for {pmd/pub}_{set/clear}_huge"

Will Deacon (1):
  Revert "powerpc/8xx: add support for huge pages on VMAP and VMALLOC"

 arch/arm64/mm/mmu.c                          | 20 ++++-----
 arch/powerpc/Kconfig                         |  2 +-
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h | 43 --------------------
 arch/x86/mm/pgtable.c                        | 34 +++++++---------
 include/linux/pgtable.h                      | 26 +-----------
 5 files changed, 25 insertions(+), 100 deletions(-)

-- 
2.32.0.402.g57bb445576-goog

