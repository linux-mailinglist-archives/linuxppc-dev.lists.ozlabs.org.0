Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F7A436D7B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 00:31:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb2Jh3N7tz3bWb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 09:31:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WRrA0gRt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WRrA0gRt; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb2HV0GqNz2ypB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 09:30:28 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id k26so1931534pfi.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 15:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kkXfWM4ukPTvxog525D3Mv8pZSjQv4ISNH6GrUMfEAU=;
 b=WRrA0gRtqgXRAxZYXtR80PPOoeLf0SpphqnEKSbjTek+SmE12esoeZdNcfw8NcQjbt
 KZUXnR/qyC9CMh4JhEqCmGFbkq2clftiS/SGyw4zhV5BErQcMois5fslPQe7M2hix82H
 9zIVBTnvBTe+7Tstzp20EFoQahNZDbytMKK8V/fz8t6GHFo2MNEg0CDXxirby06A9S7q
 ego3iPVEZn8EpfUM1Q5y1eetoRgmyd9thS6MMandxpHiyJafWzelOJT4uuRqjgORuJ55
 IkcjKcra5DUEhtSlTZs/MCyCPl6cyIz5+XVhk62znB+3pM+kucSMv7yYUFpA+kmhnupJ
 EEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kkXfWM4ukPTvxog525D3Mv8pZSjQv4ISNH6GrUMfEAU=;
 b=5m7TOIYwllHxj44J9Tp5E4JsY7TGS5V4D1ovuTw4rxG8xdRE+6wHxKi4UOUFMpTWyB
 t9Jy751xWpfKRzo7Q85Zw/2yvw1Jtc0eLI+0v3DsgVfurTA20WMBjVdND29IMxcn/9Jn
 5Vufk+x++x8Ho2fxtfcQRDSrgySiyltrVt+2cCWOcBJ5M2/7oodNz8lhGX/2TDeQEQ7W
 qEJeDtoFEo/6JMCytNwS6CNeHURhzwkeFaIQgGQ3WO/CMm1SJDSXcMjgj6pJTwl3D7/L
 30gFgDN9W1UOaCCN7qTS8SaC147FZCShhEYhee3rT+6Ffg57I83LPp2sdCSTB0eNBF12
 7/uA==
X-Gm-Message-State: AOAM532kE163hSXu3lRghVXot4cBqi6zDYhqwYPxygHmxHtpWuvM3Voi
 hufYlCpzxNtYrvaYR351spVK3toih4U=
X-Google-Smtp-Source: ABdhPJzNXSMLiKKdF8OJEBUx5gh88M59+oVOESosHAk5N0sF4IQB6Lk57/SwTdJb1tagyY49h1U42A==
X-Received: by 2002:a63:1717:: with SMTP id x23mr6477142pgl.182.1634855423465; 
 Thu, 21 Oct 2021 15:30:23 -0700 (PDT)
Received: from bobo.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id e6sm7205716pfm.212.2021.10.21.15.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 15:30:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 00/18] powerpc: Make hash MMU code build configurable
Date: Fri, 22 Oct 2021 08:29:55 +1000
Message-Id: <20211021223013.2641952-1-npiggin@gmail.com>
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
  powerpc/pseries: move pseries_lpar_register_process_table() out from
    hash specific code
  powerpc/pseries: lparcfg don't include slb_size line in radix mode
  powerpc/64s: move THP trace point creation out of hash specific file
  powerpc/64s: Make flush_and_reload_slb a no-op when radix is enabled
  powerpc/64s: move page size definitions from hash specific file
  powerpc/64s: Rename hash_hugetlbpage.c to hugetlbpage.c
  powerpc/64: pcpu setup avoid reading mmu_linear_psize on 64e or radix
  powerpc: make memremap_compat_align 64s-only
  powerpc/64e: remove mmu_linear_psize
  powerpc/64s: Clear MMU_FTR_HPTE_TABLE when booting in radix
  powerpc/64s: Make hash MMU support configurable
  powerpc/64s: Move hash MMU support code under CONFIG_PPC_64S_HASH_MMU
  powerpc/configs/microwatt: add POWER9_CPU
  powerpc/microwatt: Don't select the hash MMU code

 arch/powerpc/Kconfig                          |   5 +-
 arch/powerpc/configs/microwatt_defconfig      |   3 +-
 arch/powerpc/include/asm/book3s/64/mmu.h      |  19 ++-
 .../include/asm/book3s/64/tlbflush-hash.h     |   7 ++
 arch/powerpc/include/asm/book3s/64/tlbflush.h |   4 -
 arch/powerpc/include/asm/book3s/pgtable.h     |   4 +
 arch/powerpc/include/asm/firmware.h           |   8 --
 arch/powerpc/include/asm/interrupt.h          |   2 +-
 arch/powerpc/include/asm/mmu.h                |  16 ++-
 arch/powerpc/include/asm/mmu_context.h        |   2 +
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
 arch/powerpc/mm/book3s64/mmu_context.c        |  34 +++++-
 arch/powerpc/mm/book3s64/pgtable.c            |  28 +++++
 arch/powerpc/mm/book3s64/radix_pgtable.c      |   4 +
 arch/powerpc/mm/book3s64/slb.c                |  16 ---
 arch/powerpc/mm/book3s64/trace.c              |   8 ++
 arch/powerpc/mm/copro_fault.c                 |   2 +
 arch/powerpc/mm/fault.c                       |  17 +++
 arch/powerpc/mm/init_64.c                     |  14 ++-
 arch/powerpc/mm/ioremap.c                     |  20 ----
 arch/powerpc/mm/nohash/tlb.c                  |   9 --
 arch/powerpc/mm/pgtable.c                     |   9 +-
 arch/powerpc/mm/ptdump/Makefile               |   2 +-
 arch/powerpc/platforms/52xx/Kconfig           |   2 +-
 arch/powerpc/platforms/Kconfig                |   4 +-
 arch/powerpc/platforms/Kconfig.cputype        |  29 ++++-
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
 64 files changed, 474 insertions(+), 289 deletions(-)
 rename arch/powerpc/mm/book3s64/{hash_hugetlbpage.c => hugetlbpage.c} (99%)
 create mode 100644 arch/powerpc/mm/book3s64/trace.c

-- 
2.23.0

