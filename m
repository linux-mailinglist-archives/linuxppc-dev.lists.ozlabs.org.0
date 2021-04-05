Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEED353A97
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:21:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCXZ4Vttz30DB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:21:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=N2rJ/3VM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N2rJ/3VM; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCWc53ttz2yxR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:20:11 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id k8so7172722pgf.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=89D5oB20Yk7SvhPXJDnEzHQ/SJWU+2gNh2+j+d+qtcQ=;
 b=N2rJ/3VMbmrEl/xVGbkQLgNOYyxZ08BX8my7F002I2/GJ+aav9Oo14+D83NyzipNNy
 h9V+lPdTdK1DcMK0fDJtwlCDfu1NGxAjHA+xqFeIjQFJyyKOcxAG34afNX5oTEw7EB7b
 C0Bmc184V2ap4XwXIsTKexo2d99UPfy9nbG+NuNaWleTI3K+wyI6QVvHj1FvRVlp9Ayd
 aD+xAgz90QNa9Y48WajC4KgaEq7XWGKV4q0uXtTM+COu4eVYozRG03InO9/9tmLaPnIu
 WSY4wnVLTjol2iRv59Jjy+YoL7sU4TbptDGO38P+mGei7rCIwuHmeGGvqrOQbornG5Uz
 Ho+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=89D5oB20Yk7SvhPXJDnEzHQ/SJWU+2gNh2+j+d+qtcQ=;
 b=hsIhkrvyr/H++jYRwYeHbYorfCWdVLd+6HQ5L8WeH/+KjxuwWr9yCyTSr1o2YVUc+e
 zFemdvBHPeqo4BfSsxuCMq9HAN2IJDvMgoaEClEyYM8eFtOue/dummUCLyr2VlkymvB/
 Yn9F2sfYURHo+yfNWUoYyqSm47dVXDBgBmbWJwT1RRWb2jEeBM9Z4NhRiFA6tKEtyDmI
 Mce/QOEdxxLUiQMBrXQCT9bRDKI5QuVeMylEfHefp+XSaRUAq3wQmRgETlJlzFBB3+ii
 UGGJKS/zYclT8NozQEf1nNx1N0E58KnDWPtcLFD1Vt2+vwArsVpDOpXs6XignZi1XnL9
 gtXQ==
X-Gm-Message-State: AOAM531zdyN933Bz0qo8NFMMQf9NEvE8E7Q8947rKjIJgij1P/EMZYh+
 gyDRpLlfKxbuctwEn7XWXHc=
X-Google-Smtp-Source: ABdhPJwCNJHnappHNR+KEwUFIJVFln31JD2rf+KgxV690PSJguwOBAxfHZjEmnM4MwFgVMaQ05eaXg==
X-Received: by 2002:a63:e814:: with SMTP id s20mr21054362pgh.85.1617585599890; 
 Sun, 04 Apr 2021 18:19:59 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:19:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 00/48] KVM: PPC: Book3S: C-ify the P9 entry/exit code
Date: Mon,  5 Apr 2021 11:19:00 +1000
Message-Id: <20210405011948.675354-1-npiggin@gmail.com>
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

https://github.com/npiggin/linux/tree/kvm-in-c-v6

This fixes a couple of bugs with the POWER7/8 path and now a
POWER8 SMT guest boots and runs again.

Main changes since v5:
- Fixed changelog and subject for patch to re-arm host timer.
- Fixed compile error with !HV [kernel test robot]
- Rearranged syscall interrupt reflection changes (now it's disabled in
  the new P9 path, and reflection is later enabled for hash rather than
  enabling by default and later disabling for radix).
- Fixed P9 hash ISI handler was testing MSR_DR, should be MSR_IR for
  using the VRMA segment descriptor. Is this even needed for P9 hash
  or does ASDR provide it for MMU=off faults?
- Fixed POWER8 path fault and cede/nap handler bugs, guests now work
  again on POWER8 including SMT guests.
- Removed a bit more dead code from the P7/8 path (ultravisor).
- Improved changelog and comments.

Main changes since v4:
- Accounted for reviews so far. Comment and changelog fixes.
- Fix PR KVM register clobber [Paul]
- Fix HPT guest LPCR[TC] not set [Paul]
- Added comment about nested guest HV SPR leak issue [Paul]
- Improve misc comments and changelogs [Paul and Alexey]
- Fix decrementer_max export compile error [Alexey]
- Fixed issue with set_dec() not being identical to mtDEC causing
  a patch to have an unintended change [Alexey]
- Re-add a patch to stop reflecting PR=1 sc 1, but only do it for radix.

Main changes since v3:
- Hopefully fixed LPCR sanising [from Fabiano review]
- Added MSR[HV] clearing of guest MSR (like MSR[ME] setting).
- Restored a lost comment about PPR saving, improved comments a bit
  [Daniel review]
- Added isyncs, removed XXX isync comment.
- Fixed cede comment [Fabiano]
- In stop handling real mode handlers patch, fixed problem of nested
  hcall handler calling cede and xics hcalls and consuming them
  [Fabiano]
- Filter xics hcalls from being consumed if !kvmppc_xics_enabled
  [Fabiano, Alexey noticed and Cedric provided the right recipe and
   comment]
- Removed some more of radix, nested, and virt mode paths from the
  P7/8 code [noticed by Alexey].
- Rebased on 5.12-rc4
- Hopefully I responded to all reviews and collected all reviewed-bys.

Thanks,
Nick

Nicholas Piggin (48):
  KVM: PPC: Book3S HV: Nested move LPCR sanitising to sanitise_hv_regs
  KVM: PPC: Book3S HV: Add a function to filter guest LPCR bits
  KVM: PPC: Book3S HV: Disallow LPCR[AIL] to be set to 1 or 2
  KVM: PPC: Book3S HV: Prevent radix guests setting LPCR[TC]
  KVM: PPC: Book3S HV: Remove redundant mtspr PSPB
  KVM: PPC: Book3S HV: remove unused kvmppc_h_protect argument
  KVM: PPC: Book3S HV: Fix CONFIG_SPAPR_TCE_IOMMU=n default hcalls
  powerpc/64s: Remove KVM handler support from CBE_RAS interrupts
  powerpc/64s: remove KVM SKIP test from instruction breakpoint handler
  KVM: PPC: Book3S HV: Ensure MSR[ME] is always set in guest MSR
  KVM: PPC: Book3S HV: Ensure MSR[HV] is always clear in guest MSR
  KVM: PPC: Book3S 64: move KVM interrupt entry to a common entry point
  KVM: PPC: Book3S 64: Move GUEST_MODE_SKIP test into KVM
  KVM: PPC: Book3S 64: add hcall interrupt handler
  KVM: PPC: Book3S 64: Move hcall early register setup to KVM
  KVM: PPC: Book3S 64: Move interrupt early register setup to KVM
  KVM: PPC: Book3S 64: move bad_host_intr check to HV handler
  KVM: PPC: Book3S 64: Minimise hcall handler calling convention
    differences
  KVM: PPC: Book3S HV P9: Move radix MMU switching instructions together
  KVM: PPC: Book3S HV P9: implement kvmppc_xive_pull_vcpu in C
  KVM: PPC: Book3S HV P9: Move xive vcpu context management into
    kvmhv_p9_guest_entry
  KVM: PPC: Book3S HV P9: Stop handling hcalls in real-mode in the P9
    path
  KVM: PPC: Book3S HV P9: Move setting HDEC after switching to guest
    LPCR
  KVM: PPC: Book3S HV P9: Use large decrementer for HDEC
  KVM: PPC: Book3S HV P9: Use host timer accounting to avoid decrementer
    read
  KVM: PPC: Book3S HV P9: Reduce mftb per guest entry/exit
  KVM: PPC: Book3S HV P9: Reduce irq_work vs guest decrementer races
  KMV: PPC: Book3S HV: Use set_dec to set decrementer to host
  powerpc/time: add API for KVM to re-arm the host timer/decrementer
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
 arch/powerpc/include/asm/kvm_asm.h        |   3 +-
 arch/powerpc/include/asm/kvm_book3s.h     |   2 +
 arch/powerpc/include/asm/kvm_book3s_64.h  |   8 +
 arch/powerpc/include/asm/kvm_host.h       |   8 +-
 arch/powerpc/include/asm/kvm_ppc.h        |  21 +-
 arch/powerpc/include/asm/mmu_context.h    |   6 -
 arch/powerpc/include/asm/time.h           |  11 +
 arch/powerpc/kernel/asm-offsets.c         |   1 -
 arch/powerpc/kernel/exceptions-64s.S      | 257 ++-----
 arch/powerpc/kernel/security.c            |   5 +-
 arch/powerpc/kernel/time.c                |  43 +-
 arch/powerpc/kvm/Makefile                 |   4 +
 arch/powerpc/kvm/book3s.c                 |  17 +-
 arch/powerpc/kvm/book3s_64_entry.S        | 409 +++++++++++
 arch/powerpc/kvm/book3s_64_vio_hv.c       |  12 -
 arch/powerpc/kvm/book3s_hv.c              | 782 ++++++++++++----------
 arch/powerpc/kvm/book3s_hv_builtin.c      | 138 +---
 arch/powerpc/kvm/book3s_hv_interrupt.c    | 529 +++++++++++++++
 arch/powerpc/kvm/book3s_hv_interrupts.S   |   9 +-
 arch/powerpc/kvm/book3s_hv_nested.c       |  37 +-
 arch/powerpc/kvm/book3s_hv_ras.c          |   2 +
 arch/powerpc/kvm/book3s_hv_rm_mmu.c       |  15 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c      |  15 -
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 682 +------------------
 arch/powerpc/kvm/book3s_segment.S         |   3 +
 arch/powerpc/kvm/book3s_xive.c            | 113 +++-
 arch/powerpc/kvm/book3s_xive.h            |   7 -
 arch/powerpc/kvm/book3s_xive_native.c     |  10 -
 arch/powerpc/mm/book3s64/radix_pgtable.c  |  27 +-
 arch/powerpc/mm/book3s64/radix_tlb.c      |  46 --
 arch/powerpc/mm/mmu_context.c             |   4 +-
 arch/powerpc/platforms/powernv/idle.c     |  52 +-
 34 files changed, 1735 insertions(+), 1559 deletions(-)
 create mode 100644 arch/powerpc/kvm/book3s_64_entry.S
 create mode 100644 arch/powerpc/kvm/book3s_hv_interrupt.c

-- 
2.23.0

