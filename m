Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA50842F73E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 17:47:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW9dS0rzbz3cKL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 02:47:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=C4qsIfJj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=C4qsIfJj; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW9cC4gY9z3blb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 02:46:33 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id om14so7449605pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 08:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Lx44K0u3YSVQvggirNNtxNSTrmAs6YMxLveuDYttv4=;
 b=C4qsIfJjZQDC5pqpUwi+W3EEKWQo3Uq80l7fhM52nr604P4NdH1h8tVNzfdbfdcv0X
 alonbVn49Wrv0TefsW2wvNLpeWgn0fHEwk/iQTPcG0yXx9CeNFleEc45W9f6SBcQUnd3
 G+sLNdhlUGXUeJIipqHJbVfmWXrzLvdU6AGKPwhumZDkNGGTtzBFBKzUrQAwoY1m4elI
 lwACLJxWhb1deCkIhiBYN9UH3PyWDovH/mLSC4yTb69ynJR0pZZERnw3fgKCSsjohFwY
 oIjtXPAbB7WrgTZF5RoHijDHSAd3fPcs+7CjcVHQYW0LtBSkfUDhAVVdISCuNGrS6W9x
 OKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Lx44K0u3YSVQvggirNNtxNSTrmAs6YMxLveuDYttv4=;
 b=b8p54KP/Ha4+fq7rj24K++uyOe4jO8NZSnK7LJSfzZngiZCKla2Z5R0AdlemDSteVS
 Zz/FtIbWXKfxyC+rSkE1PlvaqSanCW4+oso1FGehZ0BVW0F5Gh3Ab06kTq4MJMoaBSKw
 m1qFqaloA2oJTsDlv2bJl85Grsc5Hbt/kcawzABzJ6gNdrWCLXbOhann88olm6Xfq8Md
 m9hp99d+h+D+VtufMMNEKj6cVCQp6B3e484+qLZWBE5bal0Jynm0IsaaCp7cP8S9CGLB
 01cG5r1FJXJAJ2OQpcSb6TkaenL6afVyY7icUOwLEtDeA4B140AnZwckghV6zrHO0uSv
 qRUA==
X-Gm-Message-State: AOAM533aqISlgc0+IBXBVmUHnEX3VKdKA+LHVc8pXNPtNmZcZwnZfnLw
 m519twCrD4r/EoMLQ+dEH9PizwpII7s=
X-Google-Smtp-Source: ABdhPJxbpusycvxJv8npStIL01p3ibKBsek/DdtXrcQumNYSTau/P6IY5e1RkFH/JjxsGZagSL5Rwg==
X-Received: by 2002:a17:90b:1d0d:: with SMTP id
 on13mr14535812pjb.118.1634312791196; 
 Fri, 15 Oct 2021 08:46:31 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id y1sm5392092pfo.104.2021.10.15.08.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 08:46:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 00/11] powerpc: Make hash MMU code build configurable
Date: Sat, 16 Oct 2021 01:46:13 +1000
Message-Id: <20211015154624.922960-1-npiggin@gmail.com>
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

Thanks Christophe and Michael for reviews of the RFC, I hope I
got all the issues raised.

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

Nicholas Piggin (11):
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
  powerpc/64s: Make hash MMU code build configurable
  powerpc/configs/microwatt: add POWER9_CPU
  powerpc/microwatt: Don't select the hash MMU code

 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/configs/microwatt_defconfig      |   2 +-
 arch/powerpc/include/asm/book3s/64/mmu.h      |  22 +++-
 .../include/asm/book3s/64/tlbflush-hash.h     |   7 ++
 arch/powerpc/include/asm/book3s/64/tlbflush.h |   4 -
 arch/powerpc/include/asm/book3s/pgtable.h     |   4 +
 arch/powerpc/include/asm/firmware.h           |   8 --
 arch/powerpc/include/asm/interrupt.h          |   2 +-
 arch/powerpc/include/asm/mmu.h                |  14 ++-
 arch/powerpc/include/asm/mmu_context.h        |   2 +
 arch/powerpc/include/asm/paca.h               |   8 ++
 arch/powerpc/kernel/asm-offsets.c             |   2 +
 arch/powerpc/kernel/dt_cpu_ftrs.c             |   8 +-
 arch/powerpc/kernel/entry_64.S                |   4 +-
 arch/powerpc/kernel/exceptions-64s.S          |  20 ++-
 arch/powerpc/kernel/mce.c                     |   2 +-
 arch/powerpc/kernel/mce_power.c               |  16 ++-
 arch/powerpc/kernel/paca.c                    |  18 ++-
 arch/powerpc/kernel/process.c                 |  13 +-
 arch/powerpc/kernel/prom.c                    |   2 +
 arch/powerpc/kernel/setup_64.c                |   4 +
 arch/powerpc/kexec/core_64.c                  |   4 +-
 arch/powerpc/kexec/ranges.c                   |   4 +
 arch/powerpc/kvm/Kconfig                      |   1 +
 arch/powerpc/mm/book3s64/Makefile             |  19 +--
 arch/powerpc/mm/book3s64/hash_native.c        | 104 ----------------
 arch/powerpc/mm/book3s64/hash_pgtable.c       |   1 -
 arch/powerpc/mm/book3s64/hash_utils.c         | 116 ++++++++++++++++--
 .../{hash_hugetlbpage.c => hugetlbpage.c}     |   6 +
 arch/powerpc/mm/book3s64/mmu_context.c        |  16 +++
 arch/powerpc/mm/book3s64/pgtable.c            |  13 ++
 arch/powerpc/mm/book3s64/radix_pgtable.c      |   4 +
 arch/powerpc/mm/book3s64/slb.c                |  16 ---
 arch/powerpc/mm/book3s64/trace.c              |   8 ++
 arch/powerpc/mm/copro_fault.c                 |   2 +
 arch/powerpc/mm/fault.c                       |  17 +++
 arch/powerpc/mm/pgtable.c                     |  10 +-
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
 arch/powerpc/platforms/pseries/lpar.c         |  67 +++++-----
 arch/powerpc/platforms/pseries/lparcfg.c      |   5 +-
 arch/powerpc/platforms/pseries/mobility.c     |   6 +
 arch/powerpc/platforms/pseries/ras.c          |   2 +
 arch/powerpc/platforms/pseries/reconfig.c     |   2 +
 arch/powerpc/platforms/pseries/setup.c        |   6 +-
 arch/powerpc/xmon/xmon.c                      |   8 +-
 58 files changed, 410 insertions(+), 241 deletions(-)
 rename arch/powerpc/mm/book3s64/{hash_hugetlbpage.c => hugetlbpage.c} (95%)
 create mode 100644 arch/powerpc/mm/book3s64/trace.c

-- 
2.23.0

