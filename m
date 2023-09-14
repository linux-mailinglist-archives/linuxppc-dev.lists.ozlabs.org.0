Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 375F379F899
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 05:07:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OOcV0Bt8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmMg9197Fz3cG0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 13:07:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OOcV0Bt8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmMfG17tYz2yh5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 13:06:12 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c06f6f98c0so3974595ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 20:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694660769; x=1695265569; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8YlVN4IbOgrOqt60oWCv0RbnxFLj0Vrr/ZjRhXoN8Q=;
        b=OOcV0Bt82sOVY04AhI2AG8NHf+ch2aAaQyTZHaDWpTLDj6VbmIO3bxbsphQIyoD51O
         0RxdbH6bbi7f70Vkhk5eQBqe6aJONPuLtlknn8NQwYoEj/LsGeZE73cazj6s899AZj+E
         apyGwD1OnB4//c9U4SmH6QIA+4WKlqh23prEv2yH/eg7S4hBZul57R2aAJgJ8fO3XqCo
         SL9xmyUqwMF00j3+b87bE61aGcSFz2cMBVhIjP9svxGVhGU/ic8sEkYDYQExqn4LiROI
         lyPLkCjBHGr2XO6GUZ37yCJjNo+b6G2jHR5lICYVtQcNFe7hWayXH8ALx/iSgrJy9APX
         QGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694660769; x=1695265569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O8YlVN4IbOgrOqt60oWCv0RbnxFLj0Vrr/ZjRhXoN8Q=;
        b=AoxL2alYvsg0YZ98AiVNd+6kKrty6TuEIdgcQ8dL1DR2lzuXyeb1HnXLbPVg7t0xMg
         XhG/FOXF38ffIuqaZtcclWZCGYpYB59NiAXR34z43frGZXrUEkNM9q6WyRIRjN5Stpie
         mpofYuNL6YG27QTDQIEnReO8qJ12hEKXofZDF/MkQXQ705Ky00Uw4HEkLzoAF09ao865
         2lo4iGxQRU8gewP4Kk/I7NcbvZ5etT/KJ4lrxx2uWbAngnK8vTuOSExOrAgvmf0JZC/7
         Hl2DGjVeP16eLGgxJnqDD3kekSLmhkOg0flHhQCnVgtsgYQt0eLNdOeho1KFLQx3Hhuk
         vV8A==
X-Gm-Message-State: AOJu0YyHswJ8SSXn3SrqzLZhDFr+DI2/rfS2mEyEJbMKXHnkou8yPuWb
	ktN6TQY8S7EKdpYxKMSHBc8oEueJ0fn6aA==
X-Google-Smtp-Source: AGHT+IGCQsKhJ+vR2grids/lf321xOTzBsPhOn6M5hOhbVBgTG+j5DISOur9Ci6YEJe6RtD9fVIiwQ==
X-Received: by 2002:a17:902:b40a:b0:1c3:90c7:b99d with SMTP id x10-20020a170902b40a00b001c390c7b99dmr3786844plr.41.1694660769461;
        Wed, 13 Sep 2023 20:06:09 -0700 (PDT)
Received: from pwon.ozlabs.ibm.com ([146.112.118.69])
        by smtp.gmail.com with ESMTPSA id w2-20020a170902904200b001b567bbe82dsm330521plz.150.2023.09.13.20.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 20:06:08 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 00/11] KVM: PPC: Nested APIv2 guest support
Date: Thu, 14 Sep 2023 13:05:49 +1000
Message-Id: <20230914030600.16993-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.39.3
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, kvm@vger.kernel.org, amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com, npiggin@gmail.com, David.Laight@ACULAB.COM, kvm-ppc@vger.kernel.org, sachinp@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>, vaibhav@linux.ibm.com, kconsul@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


A nested-HV API for PAPR has been developed based on the KVM-specific
nested-HV API that is upstream in Linux/KVM and QEMU. The PAPR API had
to break compatibility to accommodate implementation in other
hypervisors and partitioning firmware. The existing KVM-specific API
will be known as the Nested APIv1 and the PAPR API will be known as the
Nested APIv2. 

The control flow and interrupt processing between L0, L1, and L2 in
the Nested APIv2 are conceptually unchanged. Where Nested APIv1 is almost
stateless, the Nested APIv2 is stateful, with the L1 registering L2 virtual
machines and vCPUs with the L0. Supervisor-privileged register switching
duty is now the responsibility for the L0, which holds canonical L2
register state and handles all switching. This new register handling
motivates the "getters and setters" wrappers to assist in syncing the
L2s state in the L1 and the L0.

Broadly, the new hcalls will be used for  creating and managing guests
by a regular partition in the following way:

  - L1 and L0 negotiate capabilities with
    H_GUEST_{G,S}ET_CAPABILITIES

  - L1 requests the L0 create a L2 with
    H_GUEST_CREATE and receives a handle to use in future hcalls

  - L1 requests the L0 create a L2 vCPU with
    H_GUEST_CREATE_VCPU

  - L1 sets up the L2 using H_GUEST_SET and the
    H_GUEST_VCPU_RUN input buffer

  - L1 requests the L0 runs the L2 vCPU using H_GUEST_VCPU_RUN

  - L2 returns to L1 with an exit reason and L1 reads the
    H_GUEST_VCPU_RUN output buffer populated by the L0

  - L1 handles the exit using H_GET_STATE if necessary

  - L1 reruns L2 vCPU with H_GUEST_VCPU_RUN

  - L1 frees the L2 in the L0 with H_GUEST_DELETE

Further details are available in Documentation/powerpc/kvm-nested.rst.

This series adds KVM support for using this hcall interface as a regular
PAPR partition, i.e. the L1. It does not add support for running as the
L0.

The new hcalls have been implemented in the spapr qemu model for
testing.

This is available at https://github.com/planetharsh/qemu/tree/upstream-0714-kop

There are scripts available to assist in setting up an environment for
testing nested guests at https://github.com/iamjpn/kvm-powervm-test

A tree with this series is available at
https://github.com/iamjpn/linux/tree/features/kvm-nestedv2-v5

Thanks to Amit Machhiwal, Kautuk Consul, Vaibhav Jain, Michael Neuling,
Shivaprasad Bhat, Harsh Prateek Bora, Paul Mackerras and Nicholas
Piggin.

Change overview in v5:
  - KVM: PPC: Add helper library for Guest State Buffers:
    - Fix mismatched function comments
  - KVM: PPC: Add support for nestedv2 guests:
    - Check H_BUSY for {g,s}etting capabilities
    - Message if plpar_guest_get_capabilities() fails and nestedv1
      support will be attempted.
    - Remove unused amor variable
  - KVM: PPC: Book3S HV: Use accessors for VCPU registers:
    - Remove unneeded trailing comment for line length


Change overview in v4:
  - Split previous "KVM: PPC: Use getters and setters for vcpu register
    state" into a number of seperate patches
    - Remove _hv suffix from VCORE wrappers
    - Do not create arch_compat and lpcr setters, use the existing ones
    - Use #ifdef ALTIVEC
  - KVM: PPC: Rename accessor generator macros
    - Fix typo
  - KVM: PPC: Book3s HV: Hold LPIDs in an unsigned long
    - Use u64
    - Change format strings instead of casting
  - KVM: PPC: Add support for nestedv2 guests
    - Batch H_GUEST_GET calls in kvmhv_nestedv2_reload_ptregs()
    - Fix compile without CONFIG_PSERIES
    - Fix maybe uninitialized 'trap' in kvmhv_p9_guest_entry()
    - Extend existing setters for arch_compat and lpcr


Change overview in v3:
  - KVM: PPC: Use getters and setters for vcpu register state
      - Do not add a helper for pvr
      - Use an expression when declaring variable in case
      - Squash in all getters and setters
      - Pass vector registers by reference
  - KVM: PPC: Rename accessor generator macros
      - New to series
  - KVM: PPC: Add helper library for Guest State Buffers
      - Use EXPORT_SYMBOL_GPL()
      - Use the kvmppc namespace
      - Move kvmppc_gsb_reset() out of kvmppc_gsm_fill_info()
      - Comments for GSID elements
      - Pass vector elements by reference
      - Remove generic put and get functions
  - KVM: PPC: Book3s HV: Hold LPIDs in an unsigned long
      - New to series
  - KVM: PPC: Add support for nestedv2 guests
      - Use EXPORT_SYMBOL_GPL()
      - Change to kvmhv_nestedv2 namespace
      - Make kvmhv_enable_nested() return -ENODEV on NESTEDv2 L1 hosts
      - s/kvmhv_on_papr/kvmhv_is_nestedv2/
      - mv book3s_hv_papr.c book3s_hv_nestedv2.c
      - Handle shared regs without a guest state id in the same wrapper
      - Use a static key for API version
      - Add a positive test for NESTEDv1
      - Give the amor a static value
      - s/struct kvmhv_nestedv2_host/struct kvmhv_nestedv2_io/
      - Propagate failure in kvmhv_vcpu_entry_nestedv2()
      - WARN if getters and setters fail
      - Progagate failure from kvmhv_nestedv2_parse_output()
      - Replace delay with sleep in plpar_guest_{create,delete,create_vcpu}()
      - Add logical PVR handling
      - Replace kvmppc_gse_{get,put} with specific version
  - docs: powerpc: Document nested KVM on POWER
      - Fix typos


Change overview in v2:
  - Rebase on top of kvm ppc prefix instruction support
  - Make documentation an individual patch
  - Move guest state buffer files from arch/powerpc/lib/ to
    arch/powerpc/kvm/
  - Use kunit for testing guest state buffer
  - Fix some build errors
  - Change HEIR element from 4 bytes to 8 bytes

Previous revisions:

  - v1: https://lore.kernel.org/linuxppc-dev/20230508072332.2937883-1-jpn@linux.vnet.ibm.com/
  - v2: https://lore.kernel.org/linuxppc-dev/20230605064848.12319-1-jpn@linux.vnet.ibm.com/
  - v3: https://lore.kernel.org/linuxppc-dev/20230807014553.1168699-1-jniethe5@gmail.com/
  - v4: https://lore.kernel.org/linuxppc-dev/20230905034658.82835-1-jniethe5@gmail.com/

Jordan Niethe (10):
  KVM: PPC: Always use the GPR accessors
  KVM: PPC: Introduce FPR/VR accessor functions
  KVM: PPC: Rename accessor generator macros
  KVM: PPC: Use accessors for VCPU registers
  KVM: PPC: Use accessors for VCORE registers
  KVM: PPC: Book3S HV: Use accessors for VCPU registers
  KVM: PPC: Book3S HV: Introduce low level MSR accessor
  KVM: PPC: Add helper library for Guest State Buffers
  KVM: PPC: Book3s HV: Hold LPIDs in an unsigned long
  KVM: PPC: Add support for nestedv2 guests

Michael Neuling (1):
  docs: powerpc: Document nested KVM on POWER

 Documentation/powerpc/index.rst               |   1 +
 Documentation/powerpc/kvm-nested.rst          | 636 +++++++++++
 arch/powerpc/Kconfig.debug                    |  12 +
 arch/powerpc/include/asm/guest-state-buffer.h | 995 ++++++++++++++++++
 arch/powerpc/include/asm/hvcall.h             |  30 +
 arch/powerpc/include/asm/kvm_book3s.h         | 220 +++-
 arch/powerpc/include/asm/kvm_book3s_64.h      |   8 +-
 arch/powerpc/include/asm/kvm_booke.h          |  10 +
 arch/powerpc/include/asm/kvm_host.h           |  22 +-
 arch/powerpc/include/asm/kvm_ppc.h            | 102 +-
 arch/powerpc/include/asm/plpar_wrappers.h     | 267 ++++-
 arch/powerpc/kvm/Makefile                     |   4 +
 arch/powerpc/kvm/book3s.c                     |  38 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c           |   7 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c        |  31 +-
 arch/powerpc/kvm/book3s_64_vio.c              |   4 +-
 arch/powerpc/kvm/book3s_hv.c                  | 358 +++++--
 arch/powerpc/kvm/book3s_hv.h                  |  76 ++
 arch/powerpc/kvm/book3s_hv_builtin.c          |  11 +-
 arch/powerpc/kvm/book3s_hv_nested.c           |  44 +-
 arch/powerpc/kvm/book3s_hv_nestedv2.c         | 994 +++++++++++++++++
 arch/powerpc/kvm/book3s_hv_p9_entry.c         |   4 +-
 arch/powerpc/kvm/book3s_hv_ras.c              |   4 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c           |   8 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c          |   4 +-
 arch/powerpc/kvm/book3s_hv_uvmem.c            |   2 +-
 arch/powerpc/kvm/book3s_xive.c                |  12 +-
 arch/powerpc/kvm/emulate_loadstore.c          |   6 +-
 arch/powerpc/kvm/guest-state-buffer.c         | 621 +++++++++++
 arch/powerpc/kvm/powerpc.c                    |  76 +-
 arch/powerpc/kvm/test-guest-state-buffer.c    | 328 ++++++
 31 files changed, 4672 insertions(+), 263 deletions(-)
 create mode 100644 Documentation/powerpc/kvm-nested.rst
 create mode 100644 arch/powerpc/include/asm/guest-state-buffer.h
 create mode 100644 arch/powerpc/kvm/book3s_hv_nestedv2.c
 create mode 100644 arch/powerpc/kvm/guest-state-buffer.c
 create mode 100644 arch/powerpc/kvm/test-guest-state-buffer.c

-- 
2.39.3

