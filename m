Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF3B3515CE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:04:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB60464kWz3c2M
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:04:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=d42lFUsc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=d42lFUsc; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB5zd2wlBz309X
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:03:38 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id bt4so1292595pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tvcNq7aKZUU6RcU8HLeEJZRuj/Ov9slX4puhw2db+aE=;
 b=d42lFUsc7q8J7lAhxEP1vwQnPXwpeOViwS8dNnpIkydOEn1Hlpl84AHbNyGf2V1P8A
 bZ9k4TmcBAsQUdnqYnuhqBSQR54TtNvYFQu4u12sxuNZZQe8HFqV+seNjwnYqseP2rTF
 gxeKEpg6sGYau6Aiqt+iksHEmW2+TIaR2yvcjAMlWSSZUjzNv8Byg9IXoC86I9ekWXY4
 7QF6KYdMBp/3JHXCO75M7LVb1cZSXe4/f2b7umLr3DHf0UFhz1HranVouELuLmC6c3eD
 UJ1wD83d3e5G5H3qqm/YtIHa1oB09rNtPGiA938CvhCQegWw+xf/Iq4d16KWRlnx6vro
 VXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tvcNq7aKZUU6RcU8HLeEJZRuj/Ov9slX4puhw2db+aE=;
 b=TuIqzT0ovzU87ADQcT2IlRlCvqKDCsah3Ykg5x5akzWZYSkbwIJaqsrdv5ITk9fzys
 1I46e1XrLcZYs2vmt8YeW5Ara3N+aHiNKvTjqhsjWb0xTtOr4CNby4rgdcGNOht9iXqJ
 IqbRcyK0046RnIGOgPeAPdHXSBPS1O38jxj5HNQGGJKqwhHp23h0STyLxwJlAWprbEiS
 RT+7qbPc7reCYhXbp+/amivrs3v0hKIst1olunf9SjmZZGRdwx2khnA91pRin1y14s5F
 Ylekp7m6T+zcre8VM0mvH7y32IKGDXD6Y81DmjrmBD/w+WerJf4ztgU/SknAx431JkXy
 GLHg==
X-Gm-Message-State: AOAM531bvl9gqkznSb9T8/sBZ0NlLDoQOkKzeyeK3Yi9YDa35neH9VYd
 bqCvKCWSNRwJn8H3VBoiYXM=
X-Google-Smtp-Source: ABdhPJxIoJvmRfnZreNkHLR/s1LpHYC0vWNIMLF9y+mM+11UasIqczb2g3T6flMlrpJV0W0qqJiE9g==
X-Received: by 2002:a17:902:c084:b029:e7:32bd:6bc6 with SMTP id
 j4-20020a170902c084b02900e732bd6bc6mr8265991pld.58.1617289415962; 
 Thu, 01 Apr 2021 08:03:35 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:03:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 00/48] KVM: PPC: Book3S: C-ify the P9 entry/exit code
Date: Fri,  2 Apr 2021 01:02:37 +1000
Message-Id: <20210401150325.442125-1-npiggin@gmail.com>
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

https://github.com/npiggin/linux/tree/kvm-in-c-v5

Now tested on P10 with hash host and radix host with hash and radix
guests with some basic kbuild stress testing. 

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
  powerpc: add set_dec_or_work API for safely updating decrementer
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
  KVM: PPC: Book3S HV: Radix guests should not have userspace hcalls
    reflected to them
  KVM: PPC: Book3S HV P9: Allow all P9 processors to enable nested HV
  KVM: PPC: Book3S HV: small pseries_do_hcall cleanup
  KVM: PPC: Book3S HV: add virtual mode handlers for HPT hcalls and page
    faults
  KVM: PPC: Book3S HV P9: implement hash guest support
  KVM: PPC: Book3S HV P9: implement hash host / hash guest support
  KVM: PPC: Book3S HV: remove ISA v3.0 and v3.1 support from P7/8 path

 arch/powerpc/include/asm/asm-prototypes.h |   3 +-
 arch/powerpc/include/asm/exception-64s.h  |  13 +
 arch/powerpc/include/asm/kvm_asm.h        |   3 +-
 arch/powerpc/include/asm/kvm_book3s.h     |   2 +
 arch/powerpc/include/asm/kvm_book3s_64.h  |   8 +
 arch/powerpc/include/asm/kvm_host.h       |   1 -
 arch/powerpc/include/asm/kvm_ppc.h        |  21 +-
 arch/powerpc/include/asm/mmu_context.h    |   6 -
 arch/powerpc/include/asm/time.h           |  11 +
 arch/powerpc/kernel/exceptions-64s.S      | 257 ++------
 arch/powerpc/kernel/security.c            |   5 +-
 arch/powerpc/kernel/time.c                |  43 +-
 arch/powerpc/kvm/Makefile                 |   6 +
 arch/powerpc/kvm/book3s.c                 |  17 +-
 arch/powerpc/kvm/book3s_64_entry.S        | 402 ++++++++++++
 arch/powerpc/kvm/book3s_64_vio_hv.c       |  12 -
 arch/powerpc/kvm/book3s_hv.c              | 756 ++++++++++++----------
 arch/powerpc/kvm/book3s_hv_builtin.c      | 138 +---
 arch/powerpc/kvm/book3s_hv_interrupt.c    | 529 +++++++++++++++
 arch/powerpc/kvm/book3s_hv_interrupts.S   |   9 +-
 arch/powerpc/kvm/book3s_hv_nested.c       |  37 +-
 arch/powerpc/kvm/book3s_hv_ras.c          |   2 +
 arch/powerpc/kvm/book3s_hv_rm_mmu.c       |  15 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c      |  15 -
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 643 +-----------------
 arch/powerpc/kvm/book3s_segment.S         |   3 +
 arch/powerpc/kvm/book3s_xive.c            | 113 +++-
 arch/powerpc/kvm/book3s_xive.h            |   7 -
 arch/powerpc/kvm/book3s_xive_native.c     |  10 -
 arch/powerpc/mm/book3s64/radix_pgtable.c  |  27 +-
 arch/powerpc/mm/book3s64/radix_tlb.c      |  46 --
 arch/powerpc/mm/mmu_context.c             |   4 +-
 arch/powerpc/platforms/powernv/idle.c     |  52 +-
 33 files changed, 1697 insertions(+), 1519 deletions(-)
 create mode 100644 arch/powerpc/kvm/book3s_64_entry.S
 create mode 100644 arch/powerpc/kvm/book3s_hv_interrupt.c

-- 
2.23.0

