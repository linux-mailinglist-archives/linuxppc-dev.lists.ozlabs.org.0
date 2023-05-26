Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 959B071309D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 01:49:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QShTR30PDz3fHK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 09:48:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=gaII7xm1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--yuzhao.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3z0rxzaykdn4yuzhaogoogle.comlinuxppc-devlists.ozlabs.org@flex--yuzhao.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=gaII7xm1;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QShNd0N6Cz3c8V
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 09:44:47 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-ba82ed6e450so2754764276.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 16:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685144680; x=1687736680;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p2/B2gpADUVSH4+1+wdvhwwOJ3ZLS46dsub4yrmfIrY=;
        b=gaII7xm1rKF0WflE0kwbmo9D1wFCFrrD6VH1zQ9TXwAabssHzzxcZKDpxFjf1Ep6KT
         Z+Qr7BXS8s0v9zHiHqeN2dE3WQB88ARaW8AH1iSDJCS3cr45iCn1L9lVI9ZPcsS480+k
         wbmFDYCaUAqowUGhuKg1M8XmNsmQHtwbdRXfkKNKftJJVvjlpX0Njj/C3Keo2/5Fq3Ip
         rJb1BWaFB48m4r9hq6xevdAWxHKsOWbdYQ3JRHwN28GN7dhocxPWoxBC2UOWVDxNAvVb
         KELlyeUjKRt7k8dTr6Xo/3BcetEN0kRAapuiQFxtxhRi3ZR8WdPaedyJyCpfkgSiKRr3
         Vpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685144680; x=1687736680;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p2/B2gpADUVSH4+1+wdvhwwOJ3ZLS46dsub4yrmfIrY=;
        b=TuFSqNE1ZRNj+1MsS+nntx7ON+hwuoDvNrvMKsHZAkbxdecH4PBiAatbPcEDt156w0
         28q6JG3p1qzgOkIaYj4Lmav53uQtoVQnf0xAi4NnAWF5Aa0e2z3EIKO0fIZItozmruH+
         J5oKzKQKuRqxF2mx19nOSXlOp28dgiXbUpXHxrsUsMiaeRPNODjqybe72qXbUE26QFNl
         Dgt48RkSERYmDjAPnQEGSMNV+NDyLxI6ZL+kvxaUhXkHYVKiRoQQXis5svrM6//TElea
         Ux5Hn1x8Tr4pfIMo1ogbO0XxnXgvcXdCFgo3DQk92lmqBdKHsJte8ygW/HipHmeYi0Fd
         8g+A==
X-Gm-Message-State: AC+VfDymBckKOGF9quJTKLFRKmZoSz24sYY1C1900dua75FJ1Y0pmghK
	iV5WfuqZb4PsEjvm4ECCWvlzra+O1XU=
X-Google-Smtp-Source: ACHHUZ7YDXs22loXI9Hn4p7O2u7mz3EIOuiyK6CgImdELnj21szlSQpHCqRMIQPES8e6xN/3760vCEBuevA=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:910f:8a15:592b:2087])
 (user=yuzhao job=sendgmr) by 2002:a25:7343:0:b0:bad:99d:f086 with SMTP id
 o64-20020a257343000000b00bad099df086mr1339084ybc.10.1685144679852; Fri, 26
 May 2023 16:44:39 -0700 (PDT)
Date: Fri, 26 May 2023 17:44:25 -0600
Message-Id: <20230526234435.662652-1-yuzhao@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Subject: [PATCH mm-unstable v2 00/10] mm/kvm: locklessly clear the accessed bit
From: Yu Zhao <yuzhao@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Yu Zhao <yuzhao@google.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-ke
 rnel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

TLDR
====
This patchset adds a fast path to clear the accessed bit without
taking kvm->mmu_lock. It can significantly improve the performance of
guests when the host is under heavy memory pressure.

ChromeOS has been using a similar approach [1] since mid 2021 and it
was proven successful on tens of millions devices.

This v2 addressed previous requests [2] on refactoring code, removing
inaccurate/redundant texts, etc.

[1] https://crrev.com/c/2987928
[2] https://lore.kernel.org/r/20230217041230.2417228-1-yuzhao@google.com/

Overview
========
The goal of this patchset is to optimize the performance of guests
when the host memory is overcommitted. It focuses on a simple yet
common case where hardware sets the accessed bit in KVM PTEs and VMs
are not nested. Complex cases fall back to the existing slow path
where kvm->mmu_lock is then taken.

The fast path relies on two techniques to safely clear the accessed
bit: RCU and CAS. The former protects KVM page tables from being
freed while the latter clears the accessed bit atomically against
both the hardware and other software page table walkers.

A new mmu_notifier_ops member, test_clear_young(), supersedes the
existing clear_young() and test_young(). This extended callback can
operate on a range of KVM PTEs individually according to a bitmap, if
the caller provides it.

Evaluation
==========
An existing selftest can quickly demonstrate the effectiveness of
this patchset. On a generic workstation equipped with 128 CPUs and
256GB DRAM:

  $ sudo max_guest_memory_test -c 64 -m 250 -s 250
  
  MGLRU         run2
  ------------------
  Before [1]    ~64s
  After         ~51s
  
  kswapd (MGLRU before)
    100.00%  balance_pgdat
      100.00%  shrink_node
        100.00%  shrink_one
          99.99%  try_to_shrink_lruvec
            99.71%  evict_folios
              97.29%  shrink_folio_list
  ==>>          13.05%  folio_referenced
                  12.83%  rmap_walk_file
                    12.31%  folio_referenced_one
                      7.90%  __mmu_notifier_clear_young
                        7.72%  kvm_mmu_notifier_clear_young
                          7.34%  _raw_write_lock
  
  kswapd (MGLRU after)
    100.00%  balance_pgdat
      100.00%  shrink_node
        100.00%  shrink_one
          99.99%  try_to_shrink_lruvec
            99.59%  evict_folios
              80.37%  shrink_folio_list
  ==>>          3.74%  folio_referenced
                  3.59%  rmap_walk_file
                    3.19%  folio_referenced_one
                      2.53%  lru_gen_look_around
                        1.06%  __mmu_notifier_test_clear_young

Comprehensive benchmarks are coming soon.

[1] "mm: rmap: Don't flush TLB after checking PTE young for page
     reference" was included so that the comparison is apples to
     apples.
    https://lore.kernel.org/r/20220706112041.3831-1-21cnbao@gmail.com/

Yu Zhao (10):
  mm/kvm: add mmu_notifier_ops->test_clear_young()
  mm/kvm: use mmu_notifier_ops->test_clear_young()
  kvm/arm64: export stage2_try_set_pte() and macros
  kvm/arm64: make stage2 page tables RCU safe
  kvm/arm64: add kvm_arch_test_clear_young()
  kvm/powerpc: make radix page tables RCU safe
  kvm/powerpc: add kvm_arch_test_clear_young()
  kvm/x86: move tdp_mmu_enabled and shadow_accessed_mask
  kvm/x86: add kvm_arch_test_clear_young()
  mm: multi-gen LRU: use mmu_notifier_test_clear_young()

 Documentation/admin-guide/mm/multigen_lru.rst |   6 +-
 arch/arm64/include/asm/kvm_host.h             |   6 +
 arch/arm64/include/asm/kvm_pgtable.h          |  55 +++++++
 arch/arm64/kvm/arm.c                          |   1 +
 arch/arm64/kvm/hyp/pgtable.c                  |  61 +-------
 arch/arm64/kvm/mmu.c                          |  53 ++++++-
 arch/powerpc/include/asm/kvm_host.h           |   8 +
 arch/powerpc/include/asm/kvm_ppc.h            |   1 +
 arch/powerpc/kvm/book3s.c                     |   6 +
 arch/powerpc/kvm/book3s.h                     |   1 +
 arch/powerpc/kvm/book3s_64_mmu_radix.c        |  65 +++++++-
 arch/powerpc/kvm/book3s_hv.c                  |   5 +
 arch/x86/include/asm/kvm_host.h               |  13 ++
 arch/x86/kvm/mmu.h                            |   6 -
 arch/x86/kvm/mmu/spte.h                       |   1 -
 arch/x86/kvm/mmu/tdp_mmu.c                    |  34 +++++
 include/linux/kvm_host.h                      |  22 +++
 include/linux/mmu_notifier.h                  |  79 ++++++----
 include/linux/mmzone.h                        |   6 +-
 include/trace/events/kvm.h                    |  15 --
 mm/mmu_notifier.c                             |  48 ++----
 mm/rmap.c                                     |   8 +-
 mm/vmscan.c                                   | 139 ++++++++++++++++--
 virt/kvm/kvm_main.c                           | 114 ++++++++------
 24 files changed, 546 insertions(+), 207 deletions(-)

-- 
2.41.0.rc0.172.g3f132b7071-goog

