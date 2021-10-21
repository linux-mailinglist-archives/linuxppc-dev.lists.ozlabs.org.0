Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C14435992
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 05:54:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZYXJ2n2Wz2yfk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 14:54:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PxWBL0xM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PxWBL0xM; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZYWn3PH7z2yLq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 14:54:27 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d5so4736253pfu.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 20:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y22K0vOXGuKb3cRAswN99jxcuNVbahH3BMPH277sYzo=;
 b=PxWBL0xM+o34yy7h/oiFkVJapMLLO7LuZ/6NwL6eFr1LGDlP3cwfHX54Kr6Pd7J6Su
 ForpheQ3E5AD/3MDrEyEUNRdFD83tm3SBxEZKX1t6m1VKQ3+WsI519UDyonVjjn+Al8h
 iHBnZmVMgkApkFgbqMLGanlltsqaD9o3GcF0J29eiDvOqkJ2C6CyQFMWJLhqVNVFlpXm
 efhDvZya+JHy5yrTkPM532lwnuOqKk4/YyNC52nPDCrJiCIAriwdUmA3e26hsTfDtCM2
 O0l4WfSJeVWEX0G+rj9FwVM4vtHqMRU4MfgFtY9WNzfF2dLEQJWQQS79DWUpC3ndMCU5
 H98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y22K0vOXGuKb3cRAswN99jxcuNVbahH3BMPH277sYzo=;
 b=7SxrdlXwr0W854uZRnxj6z57502B7hOyVS0mYVEDf0E8ISkWM0QnFgKpISgB7slXZY
 bOS6cFbRmp3aRYA3R8UcPuJBDDvwg4WdadcMqREuyzueHvKyLg+L2cBwHrKI053QjnMq
 xCekEIrMDkevdPvXWHUuqReC+06dxtAQlANE8WZE99Us/qPdZeGUoQlk5XTp+Q1eah6p
 Yzp7dl7jrTFb1wClZprphz/5NPQdXpnVdwRpE/6/natWtCQaLdQDoeb+eFV5qNyLkXxc
 HFsqdsyyL7BRkmOMkQivtdjqy4QEaoQ7jTeT08Yq6EDEo0+Mxw1H9IeZhbeY3daeKhXD
 Fzyw==
X-Gm-Message-State: AOAM5305N1a7CL0rQg7wtr05qxjrCbby1xnB04fOJDI3KMmPRFU1iRj1
 3D8neN2LrEqh1yWjvFT08c5JzeO+DIY=
X-Google-Smtp-Source: ABdhPJx3Gj2r8EyBxDTPaWd8DvTmQWjmbtjL04Y0pGYfP8ePzEtnXFtimwRYvbLuCYyu4KcZ7pc6Mg==
X-Received: by 2002:a63:3e85:: with SMTP id l127mr2508385pga.30.1634788463216; 
 Wed, 20 Oct 2021 20:54:23 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id t9sm7369249pjm.36.2021.10.20.20.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:54:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/16] powerpc: Make hash MMU code build configurable
Date: Thu, 21 Oct 2021 13:54:01 +1000
Message-Id: <20211021035417.2157804-1-npiggin@gmail.com>
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

Nicholas Piggin (16):
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
  powerpc/64e: remove mmu_linear_psize
  powerpc/64s: Move hash MMU code under a new Kconfig name
  powerpc/64s: Make hash MMU support configurable
  powerpc/configs/microwatt: add POWER9_CPU
  powerpc/microwatt: Don't select the hash MMU code

 arch/powerpc/Kconfig                          |   3 +-
 arch/powerpc/configs/microwatt_defconfig      |   2 +-
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
 arch/powerpc/mm/book3s64/pgtable.c            |   8 ++
 arch/powerpc/mm/book3s64/radix_pgtable.c      |   4 +
 arch/powerpc/mm/book3s64/slb.c                |  16 ---
 arch/powerpc/mm/book3s64/trace.c              |   8 ++
 arch/powerpc/mm/copro_fault.c                 |   2 +
 arch/powerpc/mm/fault.c                       |  17 +++
 arch/powerpc/mm/ioremap.c                     |  19 ++-
 arch/powerpc/mm/nohash/tlb.c                  |   9 --
 arch/powerpc/mm/pgtable.c                     |  10 +-
 arch/powerpc/mm/ptdump/Makefile               |   2 +-
 arch/powerpc/platforms/52xx/Kconfig           |   2 +-
 arch/powerpc/platforms/Kconfig                |   4 +-
 arch/powerpc/platforms/Kconfig.cputype        |  21 +++-
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
 63 files changed, 448 insertions(+), 270 deletions(-)
 rename arch/powerpc/mm/book3s64/{hash_hugetlbpage.c => hugetlbpage.c} (99%)
 create mode 100644 arch/powerpc/mm/book3s64/trace.c

-- 
2.23.0

