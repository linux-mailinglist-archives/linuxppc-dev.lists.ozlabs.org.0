Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A7B460CFF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 04:09:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Vgd5p3dz3cXY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:09:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=L43W186J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=L43W186J; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2VfR3Hhgz2ynV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:08:14 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id n26so15329982pff.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 19:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kDKWr3hb9egBhkBwYHFYn5SOmJPG4fZQEijlEweX8U0=;
 b=L43W186JTsye0+hNp1sNzX8b+xUOoSVqjhkKTp11x0tsAmOLWtQIvqQ5Lw83z22rIK
 nHjWrBZskuHIf3t/OI71yKa7vCzUDFN5k7oLZL7ZMYEcAm4p3D1TSZlhQnTzOxhb/4+p
 lMyQ95EyK0nadw3/qTn0X9wM3LZ4Tx/EaNdLmWQxRkXu8xreitkiBhTdyA3fa91JjPHo
 YfCy8amcq/06NKxhu+fH/4w8i1RWAYVwpaIGzPzQ7GQcviYXLUq6GK5vG/3Qk1YJXtoo
 yEw8m3lTV27DpY4BjnQSgqxIawuKsF2WciLPeF5kSN4MJ9Lz86DMWr1E0cVS8dCOLrMT
 EclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kDKWr3hb9egBhkBwYHFYn5SOmJPG4fZQEijlEweX8U0=;
 b=jRYi2n2Tk8p+A5bj/0bv8nlgxDVnWbY5+O5RivW0ToCTCsdjfVLEVMCwwDMWDR9Atv
 pX+CjIhz4HRol91VVN80go23rLS/+gfKALow2AwMjMCodjw6iYH2v/JeZwO/geOrx7MI
 D6EYepHRwA2qrjibb+0XrmS6SgcFmP6WNwrg14Xx+VbM7wdKUSkLw0g5pOeLbO1C7coV
 yGcbhzOrl70pJCMN2kVHA09rUChtNysK9fKSl1NB5aPDBEL7dWR59yvYmd+iztVhI4np
 po7g6Tff+hqRRTd3zy0EnMJ+YYnXyQxFImtKu+oP8+VJkWkCL7RpHu9TiyUer20wpfmB
 gQDQ==
X-Gm-Message-State: AOAM532qElDb6ewKUv51HxZ+gAMkexjZpEupFXpWfrD3BIQKcXyn3sVk
 fzFfJFwvj/CU6ETaGlX+rhT3kbnfqGI=
X-Google-Smtp-Source: ABdhPJzfGXl71uJFsJvYw0DdHhf8vcTF58N640nCdWjw6N2u1zTBViXs9Bd8eiZjB8vvCwwoARDDJA==
X-Received: by 2002:a05:6a00:1995:b0:4a4:edfd:518d with SMTP id
 d21-20020a056a00199500b004a4edfd518dmr37027230pfl.29.1638155289904; 
 Sun, 28 Nov 2021 19:08:09 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id h8sm15462908pfh.10.2021.11.28.19.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:09 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 00/17] powerpc: Make hash MMU code build configurable
Date: Mon, 29 Nov 2021 13:07:46 +1000
Message-Id: <20211129030803.1888161-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that there's a platform that can make good use of it, here's
a series that can prevent the hash MMU code being built for 64s
platforms that don't need it.

Since v4:
- Fix 32s allnoconfig compile found by kernel test robot.
- Fix 64s platforms like cell that require hash but allow POWER9 CPU
  and !HASH to be selected found by Christophe.

Since v3:
- Merged microwatt patches into 1.
- Fix some changelogs, titles, comments.
- Keep MMU_FTR_HPTE_TABLE in the features when booting radix if hash
  support is is configured because it will be needed for KVM radix host
  hash guest (when we extend this option to KVM).
- Accounted for hopefully all review comments (thanks Christophe)

Since v2:
- Split MMU_FTR_HPTE_TABLE clearing for radix boot into its own patch.
- Remove memremap_compat_align from other sub archs entirely.
- Flip patch order of the 2 main patches to put Kconfig change first.
- Fixed Book3S/32 xmon segment dumping bug.
- Removed a few more ifdefs, changed numbers to use SZ_ definitions,
  etc.
- Fixed microwatt defconfig so it should actually disable hash MMU now.

Since v1:
- Split out most of the Kconfig change from the conditional compilation
  changes.
- Split out several more changes into preparatory patches.
- Reduced some ifdefs.
- Caught a few missing hash bits: pgtable dump, lkdtm,
  memremap_compat_align.

Since RFC:
- Split out large code movement from other changes.
- Used mmu ftr test constant folding rather than adding new constant
  true/false for radix_enabled().
- Restore tlbie trace point that had to be commented out in the
  previous.
- Avoid minor (probably unreachable) behaviour change in machine check
  handler when hash was not compiled.
- Fix microwatt updates so !HASH is not enforced.
- Rebase, build fixes.

Thanks,
Nick

Nicholas Piggin (17):
  powerpc: Remove unused FW_FEATURE_NATIVE references
  powerpc: Rename PPC_NATIVE to PPC_HASH_MMU_NATIVE
  powerpc/pseries: Stop selecting PPC_HASH_MMU_NATIVE
  powerpc/64s: Move and rename do_bad_slb_fault as it is not hash
    specific
  powerpc/pseries: move process table registration away from
    hash-specific code
  powerpc/pseries: lparcfg don't include slb_size line in radix mode
  powerpc/64s: move THP trace point creation out of hash specific file
  powerpc/64s: Make flush_and_reload_slb a no-op when radix is enabled
  powerpc/64s: move page size definitions from hash specific file
  powerpc/64s: Rename hash_hugetlbpage.c to hugetlbpage.c
  powerpc/64: pcpu setup avoid reading mmu_linear_psize on 64e or radix
  powerpc: make memremap_compat_align 64s-only
  powerpc/64e: remove mmu_linear_psize
  powerpc/64s: Fix radix MMU when MMU_FTR_HPTE_TABLE is clear
  powerpc/64s: Make hash MMU support configurable
  powerpc/64s: Move hash MMU support code under CONFIG_PPC_64S_HASH_MMU
  powerpc/microwatt: add POWER9_CPU, clear PPC_64S_HASH_MMU

 arch/powerpc/Kconfig                          |   5 +-
 arch/powerpc/configs/microwatt_defconfig      |   3 +-
 arch/powerpc/include/asm/book3s/64/mmu.h      |  21 +++-
 .../include/asm/book3s/64/tlbflush-hash.h     |   6 +
 arch/powerpc/include/asm/book3s/64/tlbflush.h |   4 -
 arch/powerpc/include/asm/book3s/pgtable.h     |   4 +
 arch/powerpc/include/asm/firmware.h           |   8 --
 arch/powerpc/include/asm/interrupt.h          |   2 +-
 arch/powerpc/include/asm/mmu.h                |  16 ++-
 arch/powerpc/include/asm/mmu_context.h        |   2 +
 arch/powerpc/include/asm/nohash/mmu-book3e.h  |   1 -
 arch/powerpc/include/asm/paca.h               |   8 ++
 arch/powerpc/kernel/asm-offsets.c             |   2 +
 arch/powerpc/kernel/dt_cpu_ftrs.c             |  14 ++-
 arch/powerpc/kernel/entry_64.S                |   4 +-
 arch/powerpc/kernel/exceptions-64s.S          |  20 +++-
 arch/powerpc/kernel/mce.c                     |   2 +-
 arch/powerpc/kernel/mce_power.c               |  16 ++-
 arch/powerpc/kernel/paca.c                    |  18 ++-
 arch/powerpc/kernel/process.c                 |  13 +-
 arch/powerpc/kernel/prom.c                    |   2 +
 arch/powerpc/kernel/setup_64.c                |  26 +++-
 arch/powerpc/kexec/core_64.c                  |   4 +-
 arch/powerpc/kexec/ranges.c                   |   4 +
 arch/powerpc/kvm/Kconfig                      |   1 +
 arch/powerpc/mm/book3s64/Makefile             |  19 +--
 arch/powerpc/mm/book3s64/hash_native.c        | 104 ----------------
 arch/powerpc/mm/book3s64/hash_pgtable.c       |   1 -
 arch/powerpc/mm/book3s64/hash_utils.c         | 111 +++++++++++++++++-
 .../{hash_hugetlbpage.c => hugetlbpage.c}     |   2 +
 arch/powerpc/mm/book3s64/mmu_context.c        |  32 ++++-
 arch/powerpc/mm/book3s64/pgtable.c            |  27 +++++
 arch/powerpc/mm/book3s64/radix_pgtable.c      |   4 +
 arch/powerpc/mm/book3s64/slb.c                |  16 ---
 arch/powerpc/mm/book3s64/trace.c              |   8 ++
 arch/powerpc/mm/copro_fault.c                 |   2 +
 arch/powerpc/mm/fault.c                       |  24 ++++
 arch/powerpc/mm/init_64.c                     |  13 +-
 arch/powerpc/mm/ioremap.c                     |  20 ----
 arch/powerpc/mm/nohash/tlb.c                  |   9 --
 arch/powerpc/mm/pgtable.c                     |   9 +-
 arch/powerpc/mm/ptdump/Makefile               |   2 +-
 arch/powerpc/platforms/52xx/Kconfig           |   2 +-
 arch/powerpc/platforms/Kconfig                |   4 +-
 arch/powerpc/platforms/Kconfig.cputype        |  23 +++-
 arch/powerpc/platforms/cell/Kconfig           |   3 +-
 arch/powerpc/platforms/chrp/Kconfig           |   2 +-
 arch/powerpc/platforms/embedded6xx/Kconfig    |   2 +-
 arch/powerpc/platforms/maple/Kconfig          |   3 +-
 arch/powerpc/platforms/microwatt/Kconfig      |   1 -
 arch/powerpc/platforms/pasemi/Kconfig         |   3 +-
 arch/powerpc/platforms/powermac/Kconfig       |   3 +-
 arch/powerpc/platforms/powernv/Kconfig        |   2 +-
 arch/powerpc/platforms/powernv/idle.c         |   2 +
 arch/powerpc/platforms/powernv/setup.c        |   2 +
 arch/powerpc/platforms/pseries/Kconfig        |   1 -
 arch/powerpc/platforms/pseries/lpar.c         |  67 ++++++-----
 arch/powerpc/platforms/pseries/lparcfg.c      |   5 +-
 arch/powerpc/platforms/pseries/mobility.c     |   6 +
 arch/powerpc/platforms/pseries/ras.c          |   2 +
 arch/powerpc/platforms/pseries/reconfig.c     |   2 +
 arch/powerpc/platforms/pseries/setup.c        |   6 +-
 arch/powerpc/xmon/xmon.c                      |   8 +-
 drivers/misc/lkdtm/Makefile                   |   2 +-
 drivers/misc/lkdtm/core.c                     |   2 +-
 65 files changed, 470 insertions(+), 292 deletions(-)
 rename arch/powerpc/mm/book3s64/{hash_hugetlbpage.c => hugetlbpage.c} (99%)
 create mode 100644 arch/powerpc/mm/book3s64/trace.c

-- 
2.23.0

