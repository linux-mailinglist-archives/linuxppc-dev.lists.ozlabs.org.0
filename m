Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7AC46503A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:42:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J41yp6Nk4z3cQX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:42:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PK5t7uc4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PK5t7uc4; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41y92XMhz2ywX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:42:07 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id y8so17886327plg.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 06:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UYhGqeAYSySjtH34OPTgpbq5B9x16cOKqZsMfsm32zI=;
 b=PK5t7uc4kaoWH4z2EBmY3Pvpmn7PtkgkW76PNUzOpMIvS6nzZvJHAnjpAj8HcFcflG
 t1VXJiK2HMV0olzXs28CKvCBdN10Y83wTnnYyg0CLliKFfa6aB31Bz3S5T/70p/54iJc
 Xr1nWZ3TGkCBaFowhiaHccsozJOHDzE7Oe4ROJpQeFi5GhLbqkclxUJK/HMGzt1LWkPk
 hQQx8b+0wWkRm+dMKwU7/LqmpsLEyKhaftAr9OUVUvF+RL1IeD4dovGzMtOus5obiijC
 JwTqNDBsJ2NOC7SBMiJ5W82sJsrlJ1jjn45UPZioUM1zkPKHjsf1NkoeSWLSuZJIfMbb
 957A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UYhGqeAYSySjtH34OPTgpbq5B9x16cOKqZsMfsm32zI=;
 b=DByw8dHwTzwNUeZplP4TfAExtQoY51v4iz1c0l+vgSii416ltmMM1HcwFudqwpafv4
 zb8vN95riB07uYzfxGKEHK+hURpXAhB4QtgHrpY0cTDT6/wBVQENfKnY4bKWRmj1mNSE
 M4dX0u8Wy94lLt27RSpy/mt7NSh3UcAxtvE4AmIJHKckZPGyXbbZPVaJqLKMdjAMKZ38
 IGxcQO9d+3AOb7z4/a/YCoVDaqGjnBA9c8foBvlosdRmnpswLWLlbqAW2qeoTO1U/5EK
 jQLf5yS3eP86xsLZuH67jUeolnlmtIILeIdoDcCYAlA2IH6c2mmFVAw1ZKJONYstSPLn
 7U5g==
X-Gm-Message-State: AOAM532NrZDD3iNrhGfQUUOQFgcUUUQzrJrQkqmcKbkZh/S0YaymcMkN
 N+nxZwiASHSCPuZrczlyh82hHgTOAiw=
X-Google-Smtp-Source: ABdhPJzMmDb2xcfHIW5oExdNmvNthEEpvy36U5xlhU6aKXW6UPGFVCTuWidqH5a2RYLC5pWk0tMYSg==
X-Received: by 2002:a17:902:e302:b0:141:ba08:2e44 with SMTP id
 q2-20020a170902e30200b00141ba082e44mr7745559plc.81.1638369722805; 
 Wed, 01 Dec 2021 06:42:02 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id e13sm29230pgb.8.2021.12.01.06.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 06:42:02 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 00/18] powerpc: Make hash MMU code build configurable
Date: Thu,  2 Dec 2021 00:41:35 +1000
Message-Id: <20211201144153.2456614-1-npiggin@gmail.com>
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

Since v5:
- Make cxl select hash.
- Add new patch (15) to prevent radix using different get_unmapped_area
  code when hash support is disabled. This is an intermediate step for
  now, ideally we will end up with radix always going via the generic
  code.

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


Nicholas Piggin (18):
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
  powerpc/64s: Always define arch unmapped area calls
  powerpc/64s: Make hash MMU support configurable
  powerpc/64s: Move hash MMU support code under CONFIG_PPC_64S_HASH_MMU
  powerpc/microwatt: add POWER9_CPU, clear PPC_64S_HASH_MMU

 arch/powerpc/Kconfig                          |   5 +-
 arch/powerpc/configs/microwatt_defconfig      |   3 +-
 arch/powerpc/include/asm/book3s/64/hash.h     |   4 -
 arch/powerpc/include/asm/book3s/64/mmu.h      |  27 ++++-
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
 arch/powerpc/mm/hugetlbpage.c                 |  16 ++-
 arch/powerpc/mm/init_64.c                     |  13 +-
 arch/powerpc/mm/ioremap.c                     |  20 ----
 arch/powerpc/mm/mmap.c                        |  40 ++++++-
 arch/powerpc/mm/nohash/tlb.c                  |   9 --
 arch/powerpc/mm/pgtable.c                     |   9 +-
 arch/powerpc/mm/ptdump/Makefile               |   2 +-
 arch/powerpc/mm/slice.c                       |  20 ----
 arch/powerpc/platforms/52xx/Kconfig           |   2 +-
 arch/powerpc/platforms/Kconfig                |   4 +-
 arch/powerpc/platforms/Kconfig.cputype        |  28 ++++-
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
 drivers/misc/cxl/Kconfig                      |   1 +
 drivers/misc/lkdtm/Makefile                   |   2 +-
 drivers/misc/lkdtm/core.c                     |   2 +-
 70 files changed, 527 insertions(+), 327 deletions(-)
 rename arch/powerpc/mm/book3s64/{hash_hugetlbpage.c => hugetlbpage.c} (99%)
 create mode 100644 arch/powerpc/mm/book3s64/trace.c

-- 
2.23.0

