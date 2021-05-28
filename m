Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA97393F64
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:08:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzPN58pBz3btY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:08:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ISt7XqrJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ISt7XqrJ; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzNx4rzFz2xvH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:08:01 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id l70so2075042pga.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AWipQFhJnjMhlV5h42SKDn1wpSlrbpzkPc9SX58WizI=;
 b=ISt7XqrJ7kW2dpSU0QdVeRQrlJ00m5iIBjw0v0kHrQ9KcKe2+5fqz0+/FpevY1B+Em
 59fRi1eY0JvDCOKlisOWkQgTqteBtW+6YS0NQ3Exfrgilsq2vzqAu8qHQVKcgmru966y
 7hu5UkZpok5FquOQb0R6sGsr2rznh7aQaEa8Tny5wScXTMbV0AGpxQ3thCY4RQDTDkpN
 ec7efIY9xozbusYqShp5CBXFqKdM0PAJ6x7/BiNm+6UI17SJlQ5LgY8+/sD22oFznTHK
 hb22wl5MOv4SHx7ee0Qt0ZsLhntPvC87cAy9VMUcG9KnpmtiRsyte0yLLxr54f51wDJP
 D7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AWipQFhJnjMhlV5h42SKDn1wpSlrbpzkPc9SX58WizI=;
 b=LAfAb33DZO7t2ZDjkH/9uZT/HawWc5Wm4Fmu4ZNzbNr2lNjfjsZDTiTv3VEqvchpJB
 tqEE+60wkGGYW7HYuQovrANrWdVDOn/mxFywAZiYItXXW3WxsuVr90woRHAg5Lpjyk+e
 Zn+NXDAMT1Skoh2/bTk1W/M/7tc9vBGbnHPyqQpxVVIoFFh3YyxshjXm8ztiU5Hs5tXN
 SqjDRFVom0KcpVT9K0q6UBkew+IRgxj/SBVpWEeorEw7SHIwh7u1pkZKBb55agcmTLkU
 nbbK/TZ0uIxszptoTcFp/QIfg01yAKNhspgva4Ms9J4dP1dYXbER8P0LqTRWA5wYoeaG
 UyRg==
X-Gm-Message-State: AOAM532ZkWS5J/WJkwzPrZnpmoSKO3jL2sFF2Cf3qsvs6cLwyvF9KgYk
 f8rkssodX5hTsUwMm0KuRZBwhxPpAmY=
X-Google-Smtp-Source: ABdhPJyXY4O90i/lp/8klMZ2eVFn0DBPRyuV+NbKriqL0kCJBc2rvAk3dbe2bwLyi/C9nr87UX9mcw==
X-Received: by 2002:a63:1149:: with SMTP id 9mr8045242pgr.156.1622192878203;
 Fri, 28 May 2021 02:07:58 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:07:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 00/32] KVM: PPC: Book3S: C-ify the P9 entry/exit code
Date: Fri, 28 May 2021 19:07:20 +1000
Message-Id: <20210528090752.3542186-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Git tree here

https://github.com/npiggin/linux/tree/kvm-in-c-5.14-1

This series applies to upstream plus a couple of KVM regression fixes
not yet in powerpc tree, which are included in the above git tree.

I split out the series into a few parts including about a dozen which
were merged in the last window, but this brings a bunch of them together
again for proposed merge.

Since last posting, this is rebased with some patches merged.  Some
patches have also been deferred.

No major changes to code, changelogs have been improved including some
numbers and better explanation for HPT guest performance regression.

This has been tested with radix host and hash / radix guest and hash
host / hash guest on P9. Also hash guest and PR KVM hash guest, and a PR
KVM nested hash guest, and radix guest and nested HV KVM radix nested
guest. P8 with SMT guest. Also P10 with radix and hash guests. It has
been tested with RHEL6,7,8,9 and AIX guests.

Thanks,
Nick

Nicholas Piggin (32):
  KVM: PPC: Book3S 64: move KVM interrupt entry to a common entry point
  KVM: PPC: Book3S 64: Move GUEST_MODE_SKIP test into KVM
  KVM: PPC: Book3S 64: add hcall interrupt handler
  KVM: PPC: Book3S 64: Move hcall early register setup to KVM
  KVM: PPC: Book3S 64: Move interrupt early register setup to KVM
  KVM: PPC: Book3S 64: move bad_host_intr check to HV handler
  KVM: PPC: Book3S 64: Minimise hcall handler calling convention
    differences
  KVM: PPC: Book3S HV P9: implement kvmppc_xive_pull_vcpu in C
  KVM: PPC: Book3S HV P9: Move setting HDEC after switching to guest
    LPCR
  KVM: PPC: Book3S HV P9: Reduce irq_work vs guest decrementer races
  KVM: PPC: Book3S HV P9: Move xive vcpu context management into
    kvmhv_p9_guest_entry
  KVM: PPC: Book3S HV P9: Move radix MMU switching instructions together
  KVM: PPC: Book3S HV P9: Stop handling hcalls in real-mode in the P9
    path
  KVM: PPC: Book3S HV P9: Implement the rest of the P9 path in C
  KVM: PPC: Book3S HV P9: inline kvmhv_load_hv_regs_and_go into
    __kvmhv_vcpu_entry_p9
  KVM: PPC: Book3S HV P9: Read machine check registers while MSR[RI] is
    0
  KVM: PPC: Book3S HV P9: Improve exit timing accounting coverage
  KVM: PPC: Book3S HV P9: Move SPR loading after expiry time check
  KVM: PPC: Book3S HV P9: Add helpers for OS SPR handling
  KVM: PPC: Book3S HV P9: Switch to guest MMU context as late as
    possible
  KVM: PPC: Book3S HV: Implement radix prefetch workaround by disabling
    MMU
  KVM: PPC: Book3S HV: Remove support for dependent threads mode on P9
  KVM: PPC: Book3S HV: Remove radix guest support from P7/8 path
  KVM: PPC: Book3S HV: Remove virt mode checks from real mode handlers
  KVM: PPC: Book3S HV: Remove unused nested HV tests in XICS emulation
  KVM: PPC: Book3S HV P9: Allow all P9 processors to enable nested HV
  KVM: PPC: Book3S HV: small pseries_do_hcall cleanup
  KVM: PPC: Book3S HV: add virtual mode handlers for HPT hcalls and page
    faults
  KVM: PPC: Book3S HV P9: Reflect userspace hcalls to hash guests to
    support PR KVM
  KVM: PPC: Book3S HV P9: implement hash guest support
  KVM: PPC: Book3S HV P9: implement hash host / hash guest support
  KVM: PPC: Book3S HV: remove ISA v3.0 and v3.1 support from P7/8 path

 arch/powerpc/include/asm/asm-prototypes.h |   3 +-
 arch/powerpc/include/asm/exception-64s.h  |  13 +
 arch/powerpc/include/asm/kvm_asm.h        |   1 +
 arch/powerpc/include/asm/kvm_book3s_64.h  |   8 +
 arch/powerpc/include/asm/kvm_host.h       |   8 +-
 arch/powerpc/include/asm/kvm_ppc.h        |  18 +-
 arch/powerpc/include/asm/mmu_context.h    |   6 -
 arch/powerpc/include/asm/time.h           |  12 +
 arch/powerpc/kernel/asm-offsets.c         |   1 -
 arch/powerpc/kernel/exceptions-64s.S      | 250 ++------
 arch/powerpc/kernel/security.c            |   5 +-
 arch/powerpc/kernel/time.c                |  10 -
 arch/powerpc/kvm/Makefile                 |   4 +
 arch/powerpc/kvm/book3s.c                 |  17 +-
 arch/powerpc/kvm/book3s_64_entry.S        | 416 +++++++++++++
 arch/powerpc/kvm/book3s_64_vio_hv.c       |  12 -
 arch/powerpc/kvm/book3s_hv.c              | 696 ++++++++++++----------
 arch/powerpc/kvm/book3s_hv_builtin.c      | 135 +----
 arch/powerpc/kvm/book3s_hv_interrupts.S   |   9 +-
 arch/powerpc/kvm/book3s_hv_p9_entry.c     | 508 ++++++++++++++++
 arch/powerpc/kvm/book3s_hv_rm_mmu.c       |  12 +
 arch/powerpc/kvm/book3s_hv_rm_xics.c      |  15 -
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 684 +--------------------
 arch/powerpc/kvm/book3s_segment.S         |   3 +
 arch/powerpc/kvm/book3s_xive.c            | 113 +++-
 arch/powerpc/kvm/book3s_xive.h            |   7 -
 arch/powerpc/kvm/book3s_xive_native.c     |  10 -
 arch/powerpc/mm/book3s64/radix_pgtable.c  |  27 +-
 arch/powerpc/mm/book3s64/radix_tlb.c      |  46 --
 arch/powerpc/mm/mmu_context.c             |   4 +-
 arch/powerpc/platforms/powernv/idle.c     |  52 +-
 31 files changed, 1588 insertions(+), 1517 deletions(-)
 create mode 100644 arch/powerpc/kvm/book3s_64_entry.S
 create mode 100644 arch/powerpc/kvm/book3s_hv_p9_entry.c

-- 
2.23.0

