Return-Path: <linuxppc-dev+bounces-1985-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE49C998FD9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:24:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdTL4wgbz3bh7;
	Fri, 11 Oct 2024 05:24:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584694;
	cv=none; b=HMpSPzDfDfrC5TIcmkhwveSci1/Sf6zgXgO2xKAYwKsk3RPRxxHuQLMJBeFNUe5pCQaj6tRnzLAdbI746hYguYwqkwHrqvwNCIHv5Tlql79Bb4AymeLJthk0VeB3YaEiaII5J4et/LynB6i75V03HQNNoAMV0wl9NWShTOQScTmGxmRvW0vjtMb5Z5+vwiO2mB6oIBV6u0JYXRzgcWJ+VzLQ9XLMuBGXVrc6CmtKFyS8ZlD6ffNNcshjy0Sa4vmpbEts9+YOOB1kHmFVwvbZNl0jDnuzgokxUiWx0MSg3QnLWrEsKe+M68q4YrVE02yGqGeoqLjUWvP7R+LMoMR+kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584694; c=relaxed/relaxed;
	bh=PBRfCittAXjccGkBtqBU7H4iPRP62jjV6+4PwlptPDA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dBoFTl+rnxQo9LtfFfrYnV2uBx7sZ9vXK1NUV+iM9FTtRNFL2g2kxjbi1ntBqgD46CReTYNC7DvyvKfoNPgJc9yj1FAaWKOnpweesjXIbFuSXXJbtVCGwaqJcXdC/BGSVZibkeFHNOOc0pKsxghlSB1x/XX//FH8DmIvPwRI2nxAFraQalFaW/5xkGz6kgft1zbM9ZN+N03oeNADk/gkuQbCzcPdbPK1sKr+NXlGJY1qqvPbpSpVzUPxjQrENSfkqX0J5l5Y+RM8t5mW4zCf4udsnQM6yhKYLGtemOsxaYUhZeljB2wEOMFR1xfHCQUlLindfKJUOBgvV1aZhswn8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=QCeH4IsR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=38bsizwykdic3plyunrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=QCeH4IsR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=38bsizwykdic3plyunrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdTK1XQjz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:24:52 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e21dcc7044so22790547b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584688; x=1729189488; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBRfCittAXjccGkBtqBU7H4iPRP62jjV6+4PwlptPDA=;
        b=QCeH4IsRCZQt2heDjK6svJO+yeGhEFIKuy8NTWlnkB6oPw0gkRmzxaKEdG/x7wNADN
         pQd9xAiGpGikkwB69W94/BXYkQUPo1Dbwc7RO2P3xXUSiIsQZWczfseVa2wci9h2g14W
         k19GoXPcLD9vmL8FtzwzM1hZv+wxgn4RgTENdakdkB3UTlQ1x3rL2Te/fAHCMuVgSVgP
         sDTbEXfebmzw5f9HcHiuhcZ4c3CigVV0lBSrzcjVimoNfPKkU5VdLoUG66jhFKvybZtQ
         kHNrn+YHZcQm6RgfUaYpQRqTDotB/O2ab5hxx492Hah9GqqK0Xp1XHsOQHmtf+9GHhHC
         ov8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584688; x=1729189488;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PBRfCittAXjccGkBtqBU7H4iPRP62jjV6+4PwlptPDA=;
        b=rLSc23w3rRHUBP5fVP3y24sdESGV8rs51+gkegYaiLHBQex1XBQhZRP0CqVwy2TdLf
         sgnuBh03WcWetvaos6LSIlxEu1oqry00K3WtTscz0aFGyOGGTaUKtyNcdVjfNLjzTj9i
         DgqOD/2bJlaBm8IY4SAp8UmgioA2779GikUnBznt9o6dzUI6h929gVq/6yD5G49uTn6l
         /a+bn8E9tcAWyuWQSZ4odCQpNL+kgSpfmHpKFiD1HtDY3uvgvL4aHLe/z50Xb2d+KPVH
         YINtKQf2dqccsVWBQXMFj6LeHrh6rBbuMnVhQg080sr2GrziB8J4uw8gz/oG864cWh0s
         GIVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNA75dlDkW5dDZEfYjyTI8Y65lAPCsDOgn9i/gvOWM6k5RIa1Ll4pCH2djTzgQdeC4gl6fGuQkE3LPGbY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1BDuVz7IMbt62KlQ97hPcVZxsuk3kHdywNbSIm1dgIccXBy5q
	JpUxze7zP3teOzT654yzyNoNUxWNvcAB6+F44gKZrisTH/5Kehap7bqfQa/VQjVyiGnUYUWkjzD
	Jug==
X-Google-Smtp-Source: AGHT+IFVWhSyNvZCWHkSlnUyMVGf0mcCDs6zWifUN6uyeZ0ix6vlXwCyyjUyA4S+yzba7AHFzz2C9NUEgCs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:3006:b0:6e2:1b8c:39bf with SMTP id
 00721157ae682-6e32213b1b4mr226037b3.2.1728584688198; Thu, 10 Oct 2024
 11:24:48 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:02 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-1-seanjc@google.com>
Subject: [PATCH v13 00/85] KVM: Stop grabbing references to PFNMAP'd pages
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

TL;DR: Eliminate KVM's long-standing (and heinous) behavior of essentially
guessing which pfns are refcounted pages (see kvm_pfn_to_refcounted_page()).

Getting there requires "fixing" arch code that isn't obviously broken.
Specifically, to get rid of kvm_pfn_to_refcounted_page(), KVM needs to
stop marking pages/folios dirty/accessed based solely on the pfn that's
stored in KVM's stage-2 page tables.

Instead of tracking which SPTEs correspond to refcounted pages, simply
remove all of the code that operates on "struct page" based ona the pfn
in stage-2 PTEs.  This is the back ~40-50% of the series.
 
For x86 in particular, which sets accessed/dirty status when that info
would be "lost", e.g. when SPTEs are zapped or KVM clears the dirty flag
in a SPTE, foregoing the updates provides very measurable performance
improvements for related operations.  E.g. when clearing dirty bits as
part of dirty logging, and zapping SPTEs to reconstitue huge pages when
disabling dirty logging.

The front ~40% of the series is cleanups and prep work, and most of it is
x86 focused (purely because x86 added the most special cases, *sigh*).
E.g. several of the inputs to hva_to_pfn() (and it's myriad wrappers),
can be removed by cleaning up and deduplicating x86 code.

v13:
 - Rebased onto v6.12-rc2
 - Collect reviews. [Alex and others]
 - Fix a transient bug in arm64 and RISC-V where KVM would leak a page
   refcount. [Oliver]
 - Fix a dangling comment. [Alex]
 - Drop kvm_lookup_pfn(), as the x86 that "needed" it was stupid and is (was?)
   eliminated in v6.12.
 - Drop check_user_page_hwpoison(). [Paolo]
 - Drop the arm64 MTE fixes that went into 6.12.
 - Slightly redo the guest_memfd interaction to account for 6.12 changes.

v12: https://lore.kernel.org/all/20240726235234.228822-1-seanjc@google.com

David Stevens (3):
  KVM: Replace "async" pointer in gfn=>pfn with "no_wait" and error code
  KVM: Introduce kvm_follow_pfn() to eventually replace "gfn_to_pfn"
    APIs
  KVM: Migrate kvm_vcpu_map() to kvm_follow_pfn()

Sean Christopherson (82):
  KVM: Drop KVM_ERR_PTR_BAD_PAGE and instead return NULL to indicate an
    error
  KVM: Allow calling kvm_release_page_{clean,dirty}() on a NULL page
    pointer
  KVM: Add kvm_release_page_unused() API to put pages that KVM never
    consumes
  KVM: x86/mmu: Skip the "try unsync" path iff the old SPTE was a leaf
    SPTE
  KVM: x86/mmu: Don't overwrite shadow-present MMU SPTEs when
    prefaulting
  KVM: x86/mmu: Invert @can_unsync and renamed to @synchronizing
  KVM: x86/mmu: Mark new SPTE as Accessed when synchronizing existing
    SPTE
  KVM: x86/mmu: Mark folio dirty when creating SPTE, not when
    zapping/modifying
  KVM: x86/mmu: Mark page/folio accessed only when zapping leaf SPTEs
  KVM: x86/mmu: Use gfn_to_page_many_atomic() when prefetching indirect
    PTEs
  KVM: Rename gfn_to_page_many_atomic() to kvm_prefetch_pages()
  KVM: Drop @atomic param from gfn=>pfn and hva=>pfn APIs
  KVM: Annotate that all paths in hva_to_pfn() might sleep
  KVM: Return ERR_SIGPENDING from hva_to_pfn() if GUP returns -EGAIN
  KVM: Drop extra GUP (via check_user_page_hwpoison()) to detect
    poisoned page
  KVM: x86/mmu: Drop kvm_page_fault.hva, i.e. don't track intermediate
    hva
  KVM: Drop unused "hva" pointer from __gfn_to_pfn_memslot()
  KVM: Remove pointless sanity check on @map param to kvm_vcpu_(un)map()
  KVM: Explicitly initialize all fields at the start of kvm_vcpu_map()
  KVM: Use NULL for struct page pointer to indicate mremapped memory
  KVM: nVMX: Rely on kvm_vcpu_unmap() to track validity of eVMCS mapping
  KVM: nVMX: Drop pointless msr_bitmap_map field from struct nested_vmx
  KVM: nVMX: Add helper to put (unmap) vmcs12 pages
  KVM: Use plain "struct page" pointer instead of single-entry array
  KVM: Provide refcounted page as output field in struct kvm_follow_pfn
  KVM: Move kvm_{set,release}_page_{clean,dirty}() helpers up in
    kvm_main.c
  KVM: pfncache: Precisely track refcounted pages
  KVM: Pin (as in FOLL_PIN) pages during kvm_vcpu_map()
  KVM: nVMX: Mark vmcs12's APIC access page dirty when unmapping
  KVM: Pass in write/dirty to kvm_vcpu_map(), not kvm_vcpu_unmap()
  KVM: Get writable mapping for __kvm_vcpu_map() only when necessary
  KVM: Disallow direct access (w/o mmu_notifier) to unpinned pfn by
    default
  KVM: x86: Don't fault-in APIC access page during initial allocation
  KVM: x86/mmu: Add "mmu" prefix fault-in helpers to free up generic
    names
  KVM: x86/mmu: Put direct prefetched pages via kvm_release_page_clean()
  KVM: x86/mmu: Add common helper to handle prefetching SPTEs
  KVM: x86/mmu: Add helper to "finish" handling a guest page fault
  KVM: x86/mmu: Mark pages/folios dirty at the origin of make_spte()
  KVM: Move declarations of memslot accessors up in kvm_host.h
  KVM: Add kvm_faultin_pfn() to specifically service guest page faults
  KVM: x86/mmu: Convert page fault paths to kvm_faultin_pfn()
  KVM: guest_memfd: Pass index, not gfn, to __kvm_gmem_get_pfn()
  KVM: guest_memfd: Provide "struct page" as output from
    kvm_gmem_get_pfn()
  KVM: x86/mmu: Put refcounted pages instead of blindly releasing pfns
  KVM: x86/mmu: Don't mark unused faultin pages as accessed
  KVM: Move x86's API to release a faultin page to common KVM
  KVM: VMX: Hold mmu_lock until page is released when updating APIC
    access page
  KVM: VMX: Use __kvm_faultin_page() to get APIC access page/pfn
  KVM: PPC: e500: Mark "struct page" dirty in kvmppc_e500_shadow_map()
  KVM: PPC: e500: Mark "struct page" pfn accessed before dropping
    mmu_lock
  KVM: PPC: e500: Use __kvm_faultin_pfn() to handle page faults
  KVM: arm64: Mark "struct page" pfns accessed/dirty before dropping
    mmu_lock
  KVM: arm64: Use __kvm_faultin_pfn() to handle memory aborts
  KVM: RISC-V: Mark "struct page" pfns dirty iff a stage-2 PTE is
    installed
  KVM: RISC-V: Mark "struct page" pfns accessed before dropping mmu_lock
  KVM: RISC-V: Use kvm_faultin_pfn() when mapping pfns into the guest
  KVM: PPC: Use __kvm_faultin_pfn() to handle page faults on Book3s HV
  KVM: PPC: Use __kvm_faultin_pfn() to handle page faults on Book3s
    Radix
  KVM: PPC: Drop unused @kvm_ro param from
    kvmppc_book3s_instantiate_page()
  KVM: PPC: Book3S: Mark "struct page" pfns dirty/accessed after
    installing PTE
  KVM: PPC: Use kvm_faultin_pfn() to handle page faults on Book3s PR
  KVM: LoongArch: Mark "struct page" pfns dirty only in "slow" page
    fault path
  KVM: LoongArch: Mark "struct page" pfns accessed only in "slow" page
    fault path
  KVM: LoongArch: Mark "struct page" pfn accessed before dropping
    mmu_lock
  KVM: LoongArch: Use kvm_faultin_pfn() to map pfns into the guest
  KVM: MIPS: Mark "struct page" pfns dirty only in "slow" page fault
    path
  KVM: MIPS: Mark "struct page" pfns accessed only in "slow" page fault
    path
  KVM: MIPS: Mark "struct page" pfns accessed prior to dropping mmu_lock
  KVM: MIPS: Use kvm_faultin_pfn() to map pfns into the guest
  KVM: PPC: Remove extra get_page() to fix page refcount leak
  KVM: PPC: Use kvm_vcpu_map() to map guest memory to patch dcbz
    instructions
  KVM: Convert gfn_to_page() to use kvm_follow_pfn()
  KVM: Add support for read-only usage of gfn_to_page()
  KVM: arm64: Use __gfn_to_page() when copying MTE tags to/from
    userspace
  KVM: PPC: Explicitly require struct page memory for Ultravisor sharing
  KVM: Drop gfn_to_pfn() APIs now that all users are gone
  KVM: s390: Use kvm_release_page_dirty() to unpin "struct page" memory
  KVM: Make kvm_follow_pfn.refcounted_page a required field
  KVM: x86/mmu: Don't mark "struct page" accessed when zapping SPTEs
  KVM: arm64: Don't mark "struct page" accessed when making SPTE young
  KVM: Drop APIs that manipulate "struct page" via pfns
  KVM: Don't grab reference on VM_MIXEDMAP pfns that have a "struct
    page"

 Documentation/virt/kvm/locking.rst     |  80 ++--
 arch/arm64/include/asm/kvm_pgtable.h   |   4 +-
 arch/arm64/kvm/guest.c                 |  21 +-
 arch/arm64/kvm/hyp/pgtable.c           |   7 +-
 arch/arm64/kvm/mmu.c                   |  21 +-
 arch/loongarch/kvm/mmu.c               |  40 +-
 arch/mips/kvm/mmu.c                    |  26 +-
 arch/powerpc/include/asm/kvm_book3s.h  |   4 +-
 arch/powerpc/kvm/book3s.c              |   7 +-
 arch/powerpc/kvm/book3s_32_mmu_host.c  |   7 +-
 arch/powerpc/kvm/book3s_64_mmu_host.c  |  12 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c    |  25 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  35 +-
 arch/powerpc/kvm/book3s_hv_nested.c    |   4 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c     |  25 +-
 arch/powerpc/kvm/book3s_pr.c           |  14 +-
 arch/powerpc/kvm/book3s_xive_native.c  |   2 +-
 arch/powerpc/kvm/e500_mmu_host.c       |  19 +-
 arch/riscv/kvm/mmu.c                   |   9 +-
 arch/s390/kvm/vsie.c                   |   4 +-
 arch/x86/kvm/lapic.c                   |  12 -
 arch/x86/kvm/mmu/mmu.c                 | 181 ++++----
 arch/x86/kvm/mmu/mmu_internal.h        |   7 +-
 arch/x86/kvm/mmu/paging_tmpl.h         |  31 +-
 arch/x86/kvm/mmu/spte.c                |  31 +-
 arch/x86/kvm/mmu/spte.h                |   2 +-
 arch/x86/kvm/mmu/tdp_mmu.c             |  23 +-
 arch/x86/kvm/svm/nested.c              |   4 +-
 arch/x86/kvm/svm/sev.c                 |  12 +-
 arch/x86/kvm/svm/svm.c                 |   8 +-
 arch/x86/kvm/vmx/nested.c              |  42 +-
 arch/x86/kvm/vmx/vmx.c                 |  28 +-
 arch/x86/kvm/vmx/vmx.h                 |   2 -
 include/linux/kvm_host.h               | 123 +++--
 virt/kvm/guest_memfd.c                 |  28 +-
 virt/kvm/kvm_main.c                    | 602 +++++++++----------------
 virt/kvm/kvm_mm.h                      |  36 +-
 virt/kvm/pfncache.c                    |  20 +-
 38 files changed, 689 insertions(+), 869 deletions(-)


base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
-- 
2.47.0.rc1.288.g06298d1525-goog


