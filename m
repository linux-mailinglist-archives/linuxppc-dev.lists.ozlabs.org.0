Return-Path: <linuxppc-dev+bounces-13574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C024BC22203
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 21:10:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyFb03yjsz2yjw;
	Fri, 31 Oct 2025 07:10:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761855004;
	cv=none; b=Kz9co9Gl383X8mW2fyQ5fHtSD8u1C81DAm08TijF15lMFihpnwyvRQOkoMXUs6klPHYe9/BKIOJC8vdbe+hqmsL342FxLYSv6YyEwqUGAy3lO+8zedla0dRV4r8BhQUnAOmWqW7m6dIRlDP0VSPpUzy1or/ZevlTWjOHhOglUqcyvdCAD43Mca/tibFfOoVvrawaFVgIa0iIo2EcnX81no7wI8MMRA3AcZqb9wobM63FcZDxq6FIgptnM0E+jswW2k5+ov0Fv2TiskLKOf2AnKZsF8QrIm5nOxkTuf12xyx4Urrhmnd/q3AJEvKD6TArBrwJQp3B8XBC62XclNq2Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761855004; c=relaxed/relaxed;
	bh=zrcNX0WZe6UQQAW+Y1acRpaDavildHCqqfp5zf8UBT8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PtajfOkjwl/fmrY8JHXMqe8VSlL7x0DeJigPFXDzBfI3I14NiuA26F08XfrkgUhEErgKT3QPvmxWQrvqqMz8ujySQRn2gu3jyNXmIQzwxm22ZxkwU5pzNJ7cSOMeB03ZZSHUdBZxGM/aVIOCDrJccC41dQvAxIr2sE73WyHqV+1OSjuOI5U7NLdXP2GjH+1CyGsxcVnGMEphV96fuI1BjSr4y9q1cfTwrdk1PEWlGQMeSRWb+IjHYQBqF0M625cemUB2oquHWXBMYAnvreNex1+ArSq3dD1AK8VR7aT9IHuyfTJfAdx38N3EqF8RymOa8fjSn/mNDIsl5Mtx9VBy+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZQny7Lqf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3fsydaqykdaetfbokdhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZQny7Lqf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3fsydaqykdaetfbokdhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyFZy4ZfSz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 07:10:01 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-340871b5d89so129411a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 13:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761854999; x=1762459799; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrcNX0WZe6UQQAW+Y1acRpaDavildHCqqfp5zf8UBT8=;
        b=ZQny7Lqfcny1bos1AALcxi9kLnZYNomoNsOlmbj/yaK3yrhdgTuQtntRN6nFbYXexa
         r9CAODYAAEcuKW4gDAubXXBb7R9LNl3kbitJdN7bcqWFt70dZXMG1n36oOW/N0xAmD+A
         eSga7gtc2fzkbDr8IYyWzYLfpC1keXCnFaoSE2A+fM1a1oLl2rHf1pwCZB6fLnxg/1Vv
         hY+2VMAWoDu+FgWddgOoHFwjaUR6kJfIPvL32Iy+Aa2i0ycVO7O29JMR6O7eNZcOyORV
         4HZbfs3sd6JXkVoz4B7mrG0cY5O+kuLaZgxHyrvdS6z6PW1srSHozZLWOIlibxYz4995
         5I8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761854999; x=1762459799;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrcNX0WZe6UQQAW+Y1acRpaDavildHCqqfp5zf8UBT8=;
        b=W9kTdMqHbP8XKw4zKgGWt+U+j3U6NfNLEiZIAr1G5Y2fg9bTv+kvtHpIcPyHbQMuCi
         xxbPH7IkDIEP1BT5J0UQAW9+7PTaLFF+K+Vg4C8+/Cez0BxxdiiJrtPQ9fMDQ9/KpgEx
         Z27wJv4D3Q6PAGsqEctvDvfv8aAFqUiJolNiPPD/iQTOz1/dk1Oj7f4V4KHzkbwK/FfL
         oDsydedFQa8T9kgMunz6JNYLJSukchZFuz+2fZKvchtfHHXn8RGbCkQOnS04FRA/zn5F
         WeSXvfdSp5RdTESZU6OUrGPm1G4aPVAwynV0YMxTOot7A/wK6MvGK/BzFXUCECcE9MCA
         0Cgg==
X-Forwarded-Encrypted: i=1; AJvYcCU4lelwseCYs/cib2+j4LKXvfq5Vy0e3XY0q/w6pIfVmNGmEIBY7yCkqm9F3pnK1x5jCEcbC3hKOtKsa68=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy2JxuK+54iOixDcXxY0tzgaNEZojBT39/5JfSoJ+9+eWVh0bht
	yHExzTlFsa87/k7POZVBq/5qYA0QGdIDHAae/RoauCUSRm5N8k8k0MiXpQZOpsya8euldkRjFNl
	XIZTBNw==
X-Google-Smtp-Source: AGHT+IHHZpNGbgjLGw+ZYpoCrFPTV304XH1EL6WE9wIH48O/1tSukWUG1dLDd7KIv/LOoUL3Sr92aGNZzYE=
X-Received: from pjvp23.prod.google.com ([2002:a17:90a:df97:b0:339:e59f:e26])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d40c:b0:33b:b020:5968
 with SMTP id 98e67ed59e1d1-34083071b1emr1223925a91.21.1761854998946; Thu, 30
 Oct 2025 13:09:58 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:23 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-1-seanjc@google.com>
Subject: [PATCH v4 00/28] KVM: x86/mmu: TDX post-populate cleanups
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Non-x86 folks, as with v3, patches 1 and 2 are likely the only thing of
interest here.  They make kvm_arch_vcpu_async_ioctl() mandatory and then
rename it to kvm_arch_vcpu_unlocked_ioctl().

As for the x86 side...

Clean up the TDX post-populate paths (and many tangentially related paths) to
address locking issues between gmem and TDX's post-populate hook[*], and
within KVM itself (KVM doesn't ensure full mutual exclusivity between paths
that for all intents and purposes the TDX-Module requires to be serialized).

I apologize if I missed any trailers or feedback, I think I got everything...

[*] http://lore.kernel.org/all/aG_pLUlHdYIZ2luh@google.com

v4:
 - Collect reviews/acks.
 - Add a lockdep assertion in kvm_tdp_mmu_map_private_pfn(). [Yan]
 - Wrap kvm_tdp_mmu_map_private_pfn() with CONFIG_KVM_GUEST_MEMFD=y. [test bot]
 - Improve (or add) comments. [Kai, and probably others]
 - s/spte/mirror_spte to make it clear what's being passed in
 - Update set_external_spte() to take @mirror_spte as well. [Yan]
 - Move the KVM_BUG_ON() on tdh_mr_extend() failure to the end. [Rick]
 - Take "all" the locks in tdx_vm_ioctl(). [Kai]
 - WARN if KVM attempts to map SPTEs into an invalid root. [Yan]
 - Use tdx_flush_vp_on_cpu() instead of tdx_disassociate_vp() when freeing
   a vCPU in VCPU_TD_STATE_UNINITIALIZED state. [Yan]

v3:
 - https://lore.kernel.org/all/20251017003244.186495-1-seanjc@google.com
 - Collect more reviews.
 - Add the async_ioctl() => unlocked_ioctl() patches, and use the "unlocked"
   variant in the TDX vCPU sub-ioctls so they can take kvm->lock outside of
   vcpu->mutex.
 - Add a patch to document that vcpu->mutex is taken *outside* kvm->slots_lock.
 - Add the tdx_vm_state_guard CLASS() to take kvm->lock, all vcpu->mutex locks,
   and kvm->slots_lock, in order to make tdx_td_init(), tdx_td_finalize(),
   tdx_vcpu_init_mem_region(), and tdx_vcpu_init() mutually exclusive with
   each other, and mutually exclusvie with basically anything that can result
   in contending one of the TDX-Module locks (can't remember which one).
 - Refine the changelog for the "Drop PROVE_MMU=y" patch. [Binbin]

v2:
 - Collect a few reviews (and ignore some because the patches went away).
   [Rick, Kai, Ira]
 - Move TDH_MEM_PAGE_ADD under mmu_lock and drop nr_premapped. [Yan, Rick]
 - Force max_level = PG_LEVEL_4K straightaway. [Yan]
 - s/kvm_tdp_prefault_page/kvm_tdp_page_prefault. [Rick]
 - Use Yan's version of "Say no to pinning!".  [Yan, Rick]
 - Tidy up helpers and macros to reduce boilerplate and copy+pate code, and
   to eliminate redundant/dead code (e.g. KVM_BUG_ON() the same error
   multiple times).
 - KVM_BUG_ON() if TDH_MR_EXTEND fails (I convinced myself it can't).

v1: https://lore.kernel.org/all/20250827000522.4022426-1-seanjc@google.com


Sean Christopherson (26):
  KVM: Make support for kvm_arch_vcpu_async_ioctl() mandatory
  KVM: Rename kvm_arch_vcpu_async_ioctl() to
    kvm_arch_vcpu_unlocked_ioctl()
  KVM: TDX: Drop PROVE_MMU=y sanity check on to-be-populated mappings
  KVM: x86/mmu: Add dedicated API to map guest_memfd pfn into TDP MMU
  KVM: x86/mmu: WARN if KVM attempts to map into an invalid TDP MMU root
  Revert "KVM: x86/tdp_mmu: Add a helper function to walk down the TDP
    MMU"
  KVM: x86/mmu: Rename kvm_tdp_map_page() to kvm_tdp_page_prefault()
  KVM: TDX: Return -EIO, not -EINVAL, on a KVM_BUG_ON() condition
  KVM: TDX: Fold tdx_sept_drop_private_spte() into
    tdx_sept_remove_private_spte()
  KVM: x86/mmu: Drop the return code from
    kvm_x86_ops.remove_external_spte()
  KVM: TDX: WARN if mirror SPTE doesn't have full RWX when creating
    S-EPT mapping
  KVM: TDX: Avoid a double-KVM_BUG_ON() in tdx_sept_zap_private_spte()
  KVM: TDX: Use atomic64_dec_return() instead of a poor equivalent
  KVM: TDX: Fold tdx_mem_page_record_premap_cnt() into its sole caller
  KVM: TDX: ADD pages to the TD image while populating mirror EPT
    entries
  KVM: TDX: Fold tdx_sept_zap_private_spte() into
    tdx_sept_remove_private_spte()
  KVM: TDX: Combine KVM_BUG_ON + pr_tdx_error() into TDX_BUG_ON()
  KVM: TDX: Derive error argument names from the local variable names
  KVM: TDX: Assert that mmu_lock is held for write when removing S-EPT
    entries
  KVM: TDX: Add macro to retry SEAMCALLs when forcing vCPUs out of guest
  KVM: TDX: Add tdx_get_cmd() helper to get and validate sub-ioctl
    command
  KVM: TDX: Convert INIT_MEM_REGION and INIT_VCPU to "unlocked" vCPU
    ioctl
  KVM: TDX: Use guard() to acquire kvm->lock in tdx_vm_ioctl()
  KVM: TDX: Don't copy "cmd" back to userspace for KVM_TDX_CAPABILITIES
  KVM: TDX: Guard VM state transitions with "all" the locks
  KVM: TDX: Bug the VM if extending the initial measurement fails

Yan Zhao (2):
  KVM: TDX: Drop superfluous page pinning in S-EPT management
  KVM: TDX: Fix list_add corruption during vcpu_load()

 arch/arm64/kvm/arm.c               |   6 +
 arch/loongarch/kvm/Kconfig         |   1 -
 arch/loongarch/kvm/vcpu.c          |   4 +-
 arch/mips/kvm/Kconfig              |   1 -
 arch/mips/kvm/mips.c               |   4 +-
 arch/powerpc/kvm/Kconfig           |   1 -
 arch/powerpc/kvm/powerpc.c         |   4 +-
 arch/riscv/kvm/Kconfig             |   1 -
 arch/riscv/kvm/vcpu.c              |   4 +-
 arch/s390/kvm/Kconfig              |   1 -
 arch/s390/kvm/kvm-s390.c           |   4 +-
 arch/x86/include/asm/kvm-x86-ops.h |   1 +
 arch/x86/include/asm/kvm_host.h    |   7 +-
 arch/x86/kvm/mmu.h                 |   3 +-
 arch/x86/kvm/mmu/mmu.c             |  87 +++-
 arch/x86/kvm/mmu/tdp_mmu.c         |  50 +--
 arch/x86/kvm/vmx/main.c            |   9 +
 arch/x86/kvm/vmx/tdx.c             | 659 ++++++++++++++---------------
 arch/x86/kvm/vmx/tdx.h             |   8 +-
 arch/x86/kvm/vmx/x86_ops.h         |   1 +
 arch/x86/kvm/x86.c                 |  13 +
 include/linux/kvm_host.h           |  14 +-
 virt/kvm/Kconfig                   |   3 -
 virt/kvm/kvm_main.c                |   6 +-
 24 files changed, 468 insertions(+), 424 deletions(-)


base-commit: 4cc167c50eb19d44ac7e204938724e685e3d8057
-- 
2.51.1.930.gacf6e81ea2-goog


