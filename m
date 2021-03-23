Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BA2345465
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:03:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Cmd3rz8z30HJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:03:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dqv4J9xv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dqv4J9xv; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4CmB2HW6z300J
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:03:21 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id c17so5624918pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tZHtPO3wWKSqC/qnqcJjhEr+RkQP39f2aZpYfAH3gUw=;
 b=dqv4J9xvuftBluNH7bc3smVKjjJyOER+FdAQilrdjWuYxciDLXbnyD8olkh3P98f4+
 MYnTVNv1yDYMeWJxkKIJiH7yXbgrZxPJTHDdpVn5AvQtWdmEhKFfEPVwz8JU3P0tpD4X
 ZrqP3WeXMekcnK6b99GxjxQa/4Qn36XibNRO4eIlDNZW1lxKyFdIKS9tus1kaBHHFPhN
 eP7nNoaq9egdW25chUpZ1RZ5TdOQacnKwqXWNIAke4j5NOOP9wQ0G91SmdjCKWanNWWC
 XEZeqTCAEc/7jEVIBsgdDAK8374qY21JENb3u861ZgLv9SsUBpK+/FWs0YzFSmlLRROI
 bmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tZHtPO3wWKSqC/qnqcJjhEr+RkQP39f2aZpYfAH3gUw=;
 b=r5RZEyENEQE4SLqsjL5ERNfHuwpRtFzkQygHrzFhaDYYczuBl35lssl33HkTxCP9f5
 MAxrrV56E4Bl05slcMwn3Igqi/Oorvcp98oY7wGlXUCnqYjba6CYmR4rWBYHcnWDNs8y
 CmYk1INvvyQm7jWhTQPNKiCgUudj28twmqJWszjO+gqPR9WPu3dVRomqvpakyiVTPd7x
 5gufIAF+hM8IBCuL0GeRS1zm8h9U/fPWjJRhGK0urKUHSnAnRlS1UiIQM9NGQ1KP0bXX
 wVbRNFQKqywhZdb+9vkUVNhC8Y/Gu17jJcUfk8GDAHGiRpXEdGurf+eY4H74VnEEwl00
 +wxg==
X-Gm-Message-State: AOAM530Rbbw9XG+ZSdv+Y7mVlkNNEmeSLmPj+71fWu+nxH+wsQKTfp1T
 D9pxStsnAaPyJwT8cXvz+dI=
X-Google-Smtp-Source: ABdhPJycq3q8QhKCBC7Bvh41VKfj+QgMWa3qQv5xOXkr3SjcvyYAT7pErMzFRE9zyMjr18W9ZsqsrQ==
X-Received: by 2002:a17:902:bd96:b029:e6:3d73:f90e with SMTP id
 q22-20020a170902bd96b02900e63d73f90emr2219862pls.63.1616461398271; 
 Mon, 22 Mar 2021 18:03:18 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:03:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 00/46] KVM: PPC: Book3S: C-ify the P9 entry/exit code
Date: Tue, 23 Mar 2021 11:02:19 +1000
Message-Id: <20210323010305.1045293-1-npiggin@gmail.com>
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

I think enough changes and fixes have gone in since last round
to repost.

I put a git tree here to make things easier to get.

https://github.com/npiggin/linux/tree/kvm-in-c-2

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

Nicholas Piggin (46):
  KVM: PPC: Book3S HV: Nested move LPCR sanitising to sanitise_hv_regs
  KVM: PPC: Book3S HV: Add a function to filter guest LPCR bits
  KVM: PPC: Book3S HV: Disallow LPCR[AIL] to be set to 1 or 2
  KVM: PPC: Book3S HV: Prevent radix guests from setting LPCR[TC]
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
  powerpc: add set_dec_or_work API for safely updating decrementer
  KVM: PPC: Book3S HV P9: Reduce irq_work vs guest decrementer races
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
  KVM: PPC: Book3S HV P9: implement hash guest support
  KVM: PPC: Book3S HV P9: implement hash host / hash guest support
  KVM: PPC: Book3S HV: remove ISA v3.0 and v3.1 support from P7/8 path

 arch/powerpc/include/asm/asm-prototypes.h |   3 +-
 arch/powerpc/include/asm/exception-64s.h  |  13 +
 arch/powerpc/include/asm/kvm_asm.h        |   3 +-
 arch/powerpc/include/asm/kvm_book3s.h     |   2 +
 arch/powerpc/include/asm/kvm_book3s_64.h  |   8 +
 arch/powerpc/include/asm/kvm_host.h       |   1 -
 arch/powerpc/include/asm/kvm_ppc.h        |  20 +-
 arch/powerpc/include/asm/mmu_context.h    |   6 -
 arch/powerpc/include/asm/time.h           |  16 +
 arch/powerpc/kernel/exceptions-64s.S      | 257 ++------
 arch/powerpc/kernel/security.c            |   5 +-
 arch/powerpc/kernel/time.c                |  21 +-
 arch/powerpc/kvm/Makefile                 |   6 +
 arch/powerpc/kvm/book3s.c                 |  11 +-
 arch/powerpc/kvm/book3s_64_entry.S        | 394 ++++++++++++
 arch/powerpc/kvm/book3s_64_vio_hv.c       |  12 -
 arch/powerpc/kvm/book3s_hv.c              | 730 ++++++++++++----------
 arch/powerpc/kvm/book3s_hv_builtin.c      | 138 +---
 arch/powerpc/kvm/book3s_hv_interrupt.c    | 528 ++++++++++++++++
 arch/powerpc/kvm/book3s_hv_interrupts.S   |   9 +-
 arch/powerpc/kvm/book3s_hv_nested.c       |  22 +-
 arch/powerpc/kvm/book3s_hv_ras.c          |   2 +
 arch/powerpc/kvm/book3s_hv_rm_mmu.c       |  15 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c      |  15 -
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 641 +------------------
 arch/powerpc/kvm/book3s_segment.S         |   7 +
 arch/powerpc/kvm/book3s_xive.c            | 119 +++-
 arch/powerpc/kvm/book3s_xive.h            |   7 -
 arch/powerpc/kvm/book3s_xive_native.c     |  10 -
 arch/powerpc/mm/book3s64/radix_pgtable.c  |  27 +-
 arch/powerpc/mm/book3s64/radix_tlb.c      |  46 --
 arch/powerpc/mm/mmu_context.c             |   4 +-
 arch/powerpc/platforms/powernv/idle.c     |  52 +-
 33 files changed, 1632 insertions(+), 1518 deletions(-)
 create mode 100644 arch/powerpc/kvm/book3s_64_entry.S
 create mode 100644 arch/powerpc/kvm/book3s_hv_interrupt.c

-- 
2.23.0

