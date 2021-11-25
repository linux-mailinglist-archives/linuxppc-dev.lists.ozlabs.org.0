Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA9845DEA4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 17:36:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Nmp4qtfz3cNH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 03:36:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0NmH6ytBz2yPd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 03:35:57 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J0Nm80NMLz9sSV;
 Thu, 25 Nov 2021 17:35:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lKaqNtzIs09y; Thu, 25 Nov 2021 17:35:51 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J0Nm76VTmz9sSH;
 Thu, 25 Nov 2021 17:35:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D04EF8B77D;
 Thu, 25 Nov 2021 17:35:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id w2G2gQmB9leU; Thu, 25 Nov 2021 17:35:51 +0100 (CET)
Received: from [192.168.203.227] (unknown [192.168.203.227])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A4588B763;
 Thu, 25 Nov 2021 17:35:51 +0100 (CET)
Message-ID: <27f9cddf-44db-1d1f-17e0-fd8252c7a1c9@csgroup.eu>
Date: Thu, 25 Nov 2021 17:35:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 00/17] powerpc: Make hash MMU code build configurable
Content-Language: fr-FR
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20211125125025.1472060-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20211125125025.1472060-1-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 25/11/2021 à 13:50, Nicholas Piggin a écrit :
> Now that there's a platform that can make good use of it, here's
> a series that can prevent the hash MMU code being built for 64s
> platforms that don't need it.

# CONFIG_PPC_64S_HASH_MMU is not set


<stdin>:1559:2: warning: #warning syscall futex_waitv not implemented 
[-Wcpp]
arch/powerpc/platforms/cell/spu_base.c: In function '__spu_kernel_slb':
arch/powerpc/platforms/cell/spu_base.c:215:38: error: 'mmu_linear_psize' 
undeclared (first use in this function); did you mean 'mmu_virtual_psize'?
   215 |                 llp = mmu_psize_defs[mmu_linear_psize].sllp;
       |                                      ^~~~~~~~~~~~~~~~
       |                                      mmu_virtual_psize
arch/powerpc/platforms/cell/spu_base.c:215:38: note: each undeclared 
identifier is reported only once for each function it appears in
make[3]: *** [scripts/Makefile.build:287: 
arch/powerpc/platforms/cell/spu_base.o] Error 1
make[2]: *** [scripts/Makefile.build:549: arch/powerpc/platforms/cell] 
Error 2
make[1]: *** [scripts/Makefile.build:549: arch/powerpc/platforms] Error 2
make: *** [Makefile:1846: arch/powerpc] Error 2





> 
> Since v3:
> - Merged microwatt patches into 1.
> - Fix some changelogs, titles, comments.
> - Keep MMU_FTR_HPTE_TABLE in the features when booting radix if hash
>    support is is configured because it will be needed for KVM radix host
>    hash guest (when we extend this option to KVM).
> - Accounted for hopefully all review comments (thanks Christophe)
> 
> Since v2:
> - Split MMU_FTR_HPTE_TABLE clearing for radix boot into its own patch.
> - Remove memremap_compat_align from other sub archs entirely.
> - Flip patch order of the 2 main patches to put Kconfig change first.
> - Fixed Book3S/32 xmon segment dumping bug.
> - Removed a few more ifdefs, changed numbers to use SZ_ definitions,
>    etc.
> - Fixed microwatt defconfig so it should actually disable hash MMU now.
> 
> Since v1:
> - Split out most of the Kconfig change from the conditional compilation
>    changes.
> - Split out several more changes into preparatory patches.
> - Reduced some ifdefs.
> - Caught a few missing hash bits: pgtable dump, lkdtm,
>    memremap_compat_align.
> 
> Since RFC:
> - Split out large code movement from other changes.
> - Used mmu ftr test constant folding rather than adding new constant
>    true/false for radix_enabled().
> - Restore tlbie trace point that had to be commented out in the
>    previous.
> - Avoid minor (probably unreachable) behaviour change in machine check
>    handler when hash was not compiled.
> - Fix microwatt updates so !HASH is not enforced.
> - Rebase, build fixes.
> 
> Thanks,
> Nick
> 
> Nicholas Piggin (17):
>    powerpc: Remove unused FW_FEATURE_NATIVE references
>    powerpc: Rename PPC_NATIVE to PPC_HASH_MMU_NATIVE
>    powerpc/pseries: Stop selecting PPC_HASH_MMU_NATIVE
>    powerpc/64s: Move and rename do_bad_slb_fault as it is not hash
>      specific
>    powerpc/pseries: move process table registration away from
>      hash-specific code
>    powerpc/pseries: lparcfg don't include slb_size line in radix mode
>    powerpc/64s: move THP trace point creation out of hash specific file
>    powerpc/64s: Make flush_and_reload_slb a no-op when radix is enabled
>    powerpc/64s: move page size definitions from hash specific file
>    powerpc/64s: Rename hash_hugetlbpage.c to hugetlbpage.c
>    powerpc/64: pcpu setup avoid reading mmu_linear_psize on 64e or radix
>    powerpc: make memremap_compat_align 64s-only
>    powerpc/64e: remove mmu_linear_psize
>    powerpc/64s: Fix radix MMU when MMU_FTR_HPTE_TABLE is clear
>    powerpc/64s: Make hash MMU support configurable
>    powerpc/64s: Move hash MMU support code under CONFIG_PPC_64S_HASH_MMU
>    powerpc/microwatt: add POWER9_CPU, clear PPC_64S_HASH_MMU
> 
>   arch/powerpc/Kconfig                          |   5 +-
>   arch/powerpc/configs/microwatt_defconfig      |   3 +-
>   arch/powerpc/include/asm/book3s/64/mmu.h      |  21 +++-
>   .../include/asm/book3s/64/tlbflush-hash.h     |   6 +
>   arch/powerpc/include/asm/book3s/64/tlbflush.h |   4 -
>   arch/powerpc/include/asm/book3s/pgtable.h     |   4 +
>   arch/powerpc/include/asm/firmware.h           |   8 --
>   arch/powerpc/include/asm/interrupt.h          |   2 +-
>   arch/powerpc/include/asm/mmu.h                |  16 ++-
>   arch/powerpc/include/asm/mmu_context.h        |   2 +
>   arch/powerpc/include/asm/nohash/mmu-book3e.h  |   1 -
>   arch/powerpc/include/asm/paca.h               |   8 ++
>   arch/powerpc/kernel/asm-offsets.c             |   2 +
>   arch/powerpc/kernel/dt_cpu_ftrs.c             |  14 ++-
>   arch/powerpc/kernel/entry_64.S                |   4 +-
>   arch/powerpc/kernel/exceptions-64s.S          |  20 +++-
>   arch/powerpc/kernel/mce.c                     |   2 +-
>   arch/powerpc/kernel/mce_power.c               |  16 ++-
>   arch/powerpc/kernel/paca.c                    |  18 ++-
>   arch/powerpc/kernel/process.c                 |  13 +-
>   arch/powerpc/kernel/prom.c                    |   2 +
>   arch/powerpc/kernel/setup_64.c                |  26 +++-
>   arch/powerpc/kexec/core_64.c                  |   4 +-
>   arch/powerpc/kexec/ranges.c                   |   4 +
>   arch/powerpc/kvm/Kconfig                      |   1 +
>   arch/powerpc/mm/book3s64/Makefile             |  19 +--
>   arch/powerpc/mm/book3s64/hash_native.c        | 104 ----------------
>   arch/powerpc/mm/book3s64/hash_pgtable.c       |   1 -
>   arch/powerpc/mm/book3s64/hash_utils.c         | 111 +++++++++++++++++-
>   .../{hash_hugetlbpage.c => hugetlbpage.c}     |   2 +
>   arch/powerpc/mm/book3s64/mmu_context.c        |  32 ++++-
>   arch/powerpc/mm/book3s64/pgtable.c            |  27 +++++
>   arch/powerpc/mm/book3s64/radix_pgtable.c      |   4 +
>   arch/powerpc/mm/book3s64/slb.c                |  16 ---
>   arch/powerpc/mm/book3s64/trace.c              |   8 ++
>   arch/powerpc/mm/copro_fault.c                 |   2 +
>   arch/powerpc/mm/fault.c                       |  24 ++++
>   arch/powerpc/mm/init_64.c                     |  13 +-
>   arch/powerpc/mm/ioremap.c                     |  20 ----
>   arch/powerpc/mm/nohash/tlb.c                  |   9 --
>   arch/powerpc/mm/pgtable.c                     |   9 +-
>   arch/powerpc/mm/ptdump/Makefile               |   2 +-
>   arch/powerpc/platforms/52xx/Kconfig           |   2 +-
>   arch/powerpc/platforms/Kconfig                |   4 +-
>   arch/powerpc/platforms/Kconfig.cputype        |  23 +++-
>   arch/powerpc/platforms/cell/Kconfig           |   2 +-
>   arch/powerpc/platforms/chrp/Kconfig           |   2 +-
>   arch/powerpc/platforms/embedded6xx/Kconfig    |   2 +-
>   arch/powerpc/platforms/maple/Kconfig          |   2 +-
>   arch/powerpc/platforms/microwatt/Kconfig      |   1 -
>   arch/powerpc/platforms/pasemi/Kconfig         |   2 +-
>   arch/powerpc/platforms/powermac/Kconfig       |   2 +-
>   arch/powerpc/platforms/powernv/Kconfig        |   2 +-
>   arch/powerpc/platforms/powernv/idle.c         |   2 +
>   arch/powerpc/platforms/powernv/setup.c        |   2 +
>   arch/powerpc/platforms/pseries/Kconfig        |   1 -
>   arch/powerpc/platforms/pseries/lpar.c         |  67 ++++++-----
>   arch/powerpc/platforms/pseries/lparcfg.c      |   5 +-
>   arch/powerpc/platforms/pseries/mobility.c     |   6 +
>   arch/powerpc/platforms/pseries/ras.c          |   2 +
>   arch/powerpc/platforms/pseries/reconfig.c     |   2 +
>   arch/powerpc/platforms/pseries/setup.c        |   6 +-
>   arch/powerpc/xmon/xmon.c                      |   8 +-
>   drivers/misc/lkdtm/Makefile                   |   2 +-
>   drivers/misc/lkdtm/core.c                     |   2 +-
>   65 files changed, 466 insertions(+), 292 deletions(-)
>   rename arch/powerpc/mm/book3s64/{hash_hugetlbpage.c => hugetlbpage.c} (99%)
>   create mode 100644 arch/powerpc/mm/book3s64/trace.c
> 
