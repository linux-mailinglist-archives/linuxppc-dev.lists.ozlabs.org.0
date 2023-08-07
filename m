Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA3677180A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 03:47:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QZP4aNLO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RJzhK6Crbz30fS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 11:46:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QZP4aNLO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RJzgM1nl6z2yTv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 11:46:06 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2681223aaacso2573886a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Aug 2023 18:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691372763; x=1691977563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ6if50eZRgHimXmMC5vP8yX/YCFbKYFdXuMwJLAnu8=;
        b=QZP4aNLO6cLuZOmN7hehGGce+GLPgAza5Ia7Dag42B62pqoU4qw/zpR9zdfsUFkKsg
         SeAXig+zGpKki+WJbs29uiyp0ilLRZ1l317RsPgwRU50WqTu4lqO2vM2GcqQkwXKkwnE
         F9lD0s5VL4J4QiFRyOAovgdRx07debFiMjVoh25ZhR5URwgoTl4VcgdohgV+RjH8yIAA
         xemM+l/f/sR5+ltQ9rNzifIXueBRiNOtaxDUIFmpT/jo5Ke8Pb3EDzAax+X+mIaM3Aoo
         XwnYwSHGVy7/dH4I1LpaJzszPz9eXPpNCZCn2RYpiT3OhX2AUs4vfmXVoyUAhHO6jEWx
         V5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691372763; x=1691977563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZ6if50eZRgHimXmMC5vP8yX/YCFbKYFdXuMwJLAnu8=;
        b=Yg1VNx6TEh38O/UrqakiaUQDD4lWk/U9UzXzgCawoIIInm9WfwUFAZO+7c8JjCGCF4
         Rxhi3bYpv1yu+T1hgHSHe++QEpUJJ5ELCCVK7P80pz/ts/5f/7fNEjf6nwEZFXFcX0uy
         HqcIeWNjtxhdJcI34aQZWAuOF12oxupjJdirRE+MvbicVVZMwDZ2WpCbDKD/5xHCHN+r
         3y3TzLcIDIcvim5N0jccoHIWVm3F9Mq5U/Nru/QHmsuM+Tq7DRZ+vEZdd9L+HOpj69mO
         liRWGwj0fnIsHlWmUIs+8s+HXOJddXefcarzw3Mgg7c58sUeq6ycL4fndTEQueQKZunr
         j2+g==
X-Gm-Message-State: AOJu0YxGx5L/BzXlr1ByhShnttw6WTMhu/I0eLaUj4Fp7hMd1haHg3v0
	useLrHG+3kyY4iRF17F6deP6oE4A7/hTpA==
X-Google-Smtp-Source: AGHT+IElaz+9GwCk2aWhOffH7066X/1oWiN7f3LtCQZdFN9wL3Nv3nh9MbOJGb/wNgv+ahX+mcCQzA==
X-Received: by 2002:a17:90a:940e:b0:268:266a:1ab with SMTP id r14-20020a17090a940e00b00268266a01abmr6934141pjo.5.1691372763252;
        Sun, 06 Aug 2023 18:46:03 -0700 (PDT)
Received: from pwon.ibmuc.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
        by smtp.gmail.com with ESMTPSA id jk16-20020a170903331000b001b9e0918b0asm5485139plb.169.2023.08.06.18.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 18:46:02 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/6] KVM: PPC: Nested APIv2 guest support
Date: Mon,  7 Aug 2023 11:45:47 +1000
Message-Id: <20230807014553.1168699-1-jniethe5@gmail.com>
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, kvm@vger.kernel.org, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, npiggin@gmail.com, kvm-ppc@vger.kernel.org, vaibhav@linux.ibm.com, kconsul@linux.vnet.ibm.com
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
https://github.com/iamjpn/linux/tree/features/kvm-nestedv2-v3

Thanks to Amit Machhiwal, Kautuk Consul, Vaibhav Jain, Michael Neuling,
Shivaprasad Bhat, Harsh Prateek Bora, Paul Mackerras and Nicholas
Piggin. 

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

Jordan Niethe (5):
  KVM: PPC: Use getters and setters for vcpu register state
  KVM: PPC: Rename accessor generator macros
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
 arch/powerpc/include/asm/kvm_book3s.h         | 231 +++-
 arch/powerpc/include/asm/kvm_book3s_64.h      |   8 +-
 arch/powerpc/include/asm/kvm_booke.h          |  10 +
 arch/powerpc/include/asm/kvm_host.h           |  22 +-
 arch/powerpc/include/asm/kvm_ppc.h            | 102 +-
 arch/powerpc/include/asm/plpar_wrappers.h     | 192 +++-
 arch/powerpc/kvm/Makefile                     |   4 +
 arch/powerpc/kvm/book3s.c                     |  38 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c           |   6 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c        |  31 +-
 arch/powerpc/kvm/book3s_64_vio.c              |   4 +-
 arch/powerpc/kvm/book3s_hv.c                  | 354 +++++--
 arch/powerpc/kvm/book3s_hv.h                  |  64 ++
 arch/powerpc/kvm/book3s_hv_builtin.c          |  10 +-
 arch/powerpc/kvm/book3s_hv_nested.c           |  42 +-
 arch/powerpc/kvm/book3s_hv_nestedv2.c         | 985 +++++++++++++++++
 arch/powerpc/kvm/book3s_hv_p9_entry.c         |   4 +-
 arch/powerpc/kvm/book3s_hv_ras.c              |   5 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c           |   8 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c          |   4 +-
 arch/powerpc/kvm/book3s_xive.c                |  13 +-
 arch/powerpc/kvm/emulate_loadstore.c          |   6 +-
 arch/powerpc/kvm/guest-state-buffer.c         | 621 +++++++++++
 arch/powerpc/kvm/powerpc.c                    |  76 +-
 arch/powerpc/kvm/test-guest-state-buffer.c    | 328 ++++++
 30 files changed, 4582 insertions(+), 260 deletions(-)
 create mode 100644 Documentation/powerpc/kvm-nested.rst
 create mode 100644 arch/powerpc/include/asm/guest-state-buffer.h
 create mode 100644 arch/powerpc/kvm/book3s_hv_nestedv2.c
 create mode 100644 arch/powerpc/kvm/guest-state-buffer.c
 create mode 100644 arch/powerpc/kvm/test-guest-state-buffer.c

-- 
2.39.3

