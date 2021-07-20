Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D8C3D017E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 20:21:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTn9H1HX8z3bhL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 04:21:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTn8x1sy4z2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 04:21:17 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GTn8p11xBzB61P;
 Tue, 20 Jul 2021 20:21:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id azco6Acv840f; Tue, 20 Jul 2021 20:21:14 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GTn8n6vwfzB61K;
 Tue, 20 Jul 2021 20:21:13 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 182D3702; Tue, 20 Jul 2021 20:26:27 +0200 (CEST)
Received: from 37-165-28-27.coucou-networks.fr
 (37-165-28-27.coucou-networks.fr [37.165.28.27]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Tue, 20 Jul 2021 20:26:27 +0200
Date: Tue, 20 Jul 2021 20:26:27 +0200
Message-ID: <20210720202627.Horde.vlszNhxkKrLIg0-3Sn2ucw5@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 0/2] Fix arm64 boot regression in 5.14
In-Reply-To: <20210720123512.8740-1-will@kernel.org>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Marek <jonathan@marek.ca>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Will Deacon <will@kernel.org> a =C3=A9crit=C2=A0:

> Hi folks,
>
> Jonathan reports [1] that commit c742199a014d ("mm/pgtable: add stubs
> for {pmd/pub}_{set/clear}_huge") breaks the boot on arm64 when huge
> mappings are used to map the kernel linear map but the VA size is
> configured such that PUDs are folded. This is because the non-functional
> pud_set_huge() stub is used to create the linear map, which results in
> 1GB holes and a fatal data abort when the kernel attemps to access them.
>
> Digging further into the issue, it also transpired that huge-vmap is
> silently disabled in these configurations as well [2], despite working
> correctly in 5.13. The latter issue causes the pgtable selftests to
> scream due to a failing consistency check [3].
>
> Rather than leave mainline in a terminally broken state for arm64 while
> we figure this out, revert the offending commit to get things working
> again. Unfortunately, reverting the change in isolation causes a build
> breakage for 32-bit PowerPC 8xx machines which recently started relying
> on the problematic stubs to support pte-level huge-vmap entries [4].
> Since Christophe is away at the moment, this series first reverts the
> PowerPC 8xx change in order to avoid breaking the build.
>
> I would really like this to land for -rc3 and I can take these via the
> arm64 fixes queue if the PowerPC folks are alright with them.
>

If you can drop patch 1,

Change patch 2 to add the two following functions in=20=20
arch/powerpc/mm/nohash/8xx.c=20:

int pud_clear_huge(pud_t *pud)
{
         return 0;
}

int pmd_clear_huge(pmd_t *pmd)
{
         return 0;
}

Then feel free to take it via ARM fixes with my acked-by as maintainer=20=
=20
of=20PPC8XX.

Christophe


> Cheers,
>
> Will
>
> [1] https://lore.kernel.org/r/20210717160118.9855-1-jonathan@marek.ca
> [2] https://lore.kernel.org/r/20210719104918.GA6440@willie-the-truck
> [3]=20=20
>=20https://lore.kernel.org/r/CAMuHMdXShORDox-xxaeUfDW3wx2PeggFSqhVSHVZNKCG=
K-y_vQ@mail.gmail.com/
> [4]=20=20
>=20https://lore.kernel.org/r/8b972f1c03fb6bd59953035f0a3e4d26659de4f8.1620=
795204.git.christophe.leroy@csgroup.eu/
>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Jonathan Marek <jonathan@marek.ca>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Nicholas Piggin <npiggin@gmail.com
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
>
> --->8
>
> Jonathan Marek (1):
>   Revert "mm/pgtable: add stubs for {pmd/pub}_{set/clear}_huge"
>
> Will Deacon (1):
>   Revert "powerpc/8xx: add support for huge pages on VMAP and VMALLOC"
>
>  arch/arm64/mm/mmu.c                          | 20 ++++-----
>  arch/powerpc/Kconfig                         |  2 +-
>  arch/powerpc/include/asm/nohash/32/mmu-8xx.h | 43 --------------------
>  arch/x86/mm/pgtable.c                        | 34 +++++++---------
>  include/linux/pgtable.h                      | 26 +-----------
>  5 files changed, 25 insertions(+), 100 deletions(-)
>
> --
> 2.32.0.402.g57bb445576-goog


