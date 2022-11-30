Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E10B763E4AB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:11:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMw1g537Nz3cMs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:11:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=a3LNmo1f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3sekhywykdlgqcylhaemmejc.amkjglsvnna-bctjgqrq.mxjyzq.mpe@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=a3LNmo1f;
	dkim-atps=neutral
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMvzq2kl6z30F7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:09:41 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id u6-20020a170903124600b00188cd4769bcso18979344plh.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CxJchv8w1iq7EI5igyAbJTSsU4rb9hheWhh1V02wYeE=;
        b=a3LNmo1flE5DbpWhkEfKOfijpJqR9S7z2ss5lTAXom8sc4KYW3A+wJ62ZtRJGQ4AoH
         ctdODyVfSXwDyI3Bv7a8JwJ1FhRH869HbxyE8zE9pyL5mb2FzwKcVwcg07F78QqGActo
         D4bdJlDsk5EpwK/d4RaKsR9vTxEZp18/M1t5bQC30Egg4QdmhW+s2tNgqmbihdq/UwiD
         FN4aU8sN7cmjq+SKY/1BxqxDWLBu9QzoN5ztRC7YjXsJAs8OnqzJI0tqfNr9g+2FdjL1
         ODruZdufVqi1OE3k8wpIrjPjF6wkPtmnuBJ15rRamfG5u6fcCh6JB0zwg9ZckNhELRys
         CMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CxJchv8w1iq7EI5igyAbJTSsU4rb9hheWhh1V02wYeE=;
        b=3gncU/ohRR7hLRtW1EDr/QitdmCkfPob8QeX6Sgzt71MKV1Cu1yHDxsW1QcdOvTtZa
         D+t+znEFzL93s6miQkS2daRDZWpvg0jY7KtDc/hpRFaPQdrXzeV5AnSgRoC3FanrXDwK
         EBUnC4ILdruxkmJCBo0sKVvhBqAtZ+EcY0zscNqlrLKZqLYYcPu25UTQZdY4Afi0KL+g
         WuTd8ndRYMBI65yZNfs+tGk46V/5fQWGwoq9x1crnnKuEGYb5cX3q5qmc685kl6mf9Mo
         Cd5r7dQ1eqCavOw5JOCTjZ0f7xO3oyYA9UaGSTYH+2LcU35rklxICAB/In6ZgXoZBLpX
         ut0g==
X-Gm-Message-State: ANoB5pk2G+81z4p6jLQGRuyiTgZM+KQ22xkQnpLWWzNw+vWF2cgbFtYr
	YJ33OyueEo/nMtvSThgQUqWRuK+HyL4=
X-Google-Smtp-Source: AA0mqf4cvJgRHVILOFqJAxbUe/KZulSEyOFrGnuPDy5YFKhx7I74z3MH7FVcVoacDTZw1v9u2COOw/1NyPw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:7e0e:b0:189:9284:2138 with SMTP id
 b14-20020a1709027e0e00b0018992842138mr14446370plm.90.1669849777249; Wed, 30
 Nov 2022 15:09:37 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:44 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-1-seanjc@google.com>
Subject: [PATCH v2 00/50] KVM: Rework kvm_init() and hardware enabling
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The main theme of this series is to kill off kvm_arch_init(),
kvm_arch_hardware_(un)setup(), and kvm_arch_check_processor_compat(), which
all originated in x86 code from way back when, and needlessly complicate
both common KVM code and architecture code.  E.g. many architectures don't
mark functions/data as __init/__ro_after_init purely because kvm_init()
isn't marked __init to support x86's separate vendor modules.

The idea/hope is that with those hooks gone (moved to arch code), it will
be easier for x86 (and other architectures) to modify their module init
sequences as needed without having to fight common KVM code.  E.g. I'm
hoping that ARM can build on this to simplify its hardware enabling logic,
especially the pKVM side of things.

There are bug fixes throughout this series.  They are more scattered than
I would usually prefer, but getting the sequencing correct was a gigantic
pain for many of the x86 fixes due to needing to fix common code in order
for the x86 fix to have any meaning.  And while the bugs are often fatal,
they aren't all that interesting for most users as they either require a
malicious admin or broken hardware, i.e. aren't likely to be encountered
by the vast majority of KVM users.  So unless someone _really_ wants a
particular fix isolated for backporting, I'm not planning on shuffling
patches.

v2:
 - Collect reviews/acks.
 - Reset eVMCS controls in VP assist page when disabling hardware. [Vitaly]
 - Clean up labels in kvm_init(). [Chao]
 - Fix a goof where VMX compat checks used boot_cpu_has. [Kai]
 - Reorder patches and/or tweak changelogs to not require time travel. [Paolo, Kai]
 - Rewrite the changelog for the patch to move ARM away from kvm_arch_init()
   to call out that it fixes theoretical bugs. [Philippe]
 - Document why it's safe to allow preemption and/or migration when
   accessing kvm_usage_count.

v1: https://lore.kernel.org/all/20221102231911.3107438-1-seanjc@google.com

Chao Gao (3):
  KVM: x86: Do compatibility checks when onlining CPU
  KVM: Rename and move CPUHP_AP_KVM_STARTING to ONLINE section
  KVM: Disable CPU hotplug during hardware enabling/disabling

Isaku Yamahata (3):
  KVM: Drop kvm_count_lock and instead protect kvm_usage_count with
    kvm_lock
  KVM: Remove on_each_cpu(hardware_disable_nolock) in kvm_exit()
  KVM: Make hardware_enable_failed a local variable in the "enable all"
    path

Marc Zyngier (1):
  KVM: arm64: Simplify the CPUHP logic

Sean Christopherson (43):
  KVM: Register /dev/kvm as the _very_ last thing during initialization
  KVM: Initialize IRQ FD after arch hardware setup
  KVM: Allocate cpus_hardware_enabled after arch hardware setup
  KVM: Teardown VFIO ops earlier in kvm_exit()
  KVM: s390: Unwind kvm_arch_init() piece-by-piece() if a step fails
  KVM: s390: Move hardware setup/unsetup to init/exit
  KVM: x86: Do timer initialization after XCR0 configuration
  KVM: x86: Move hardware setup/unsetup to init/exit
  KVM: Drop arch hardware (un)setup hooks
  KVM: VMX: Reset eVMCS controls in VP assist page during hardware
    disabling
  KVM: VMX: Don't bother disabling eVMCS static key on module exit
  KVM: VMX: Move Hyper-V eVMCS initialization to helper
  KVM: x86: Move guts of kvm_arch_init() to standalone helper
  KVM: VMX: Do _all_ initialization before exposing /dev/kvm to
    userspace
  KVM: x86: Serialize vendor module initialization (hardware setup)
  KVM: arm64: Free hypervisor allocations if vector slot init fails
  KVM: arm64: Unregister perf callbacks if hypervisor finalization fails
  KVM: arm64: Do arm/arch initialization without bouncing through
    kvm_init()
  KVM: arm64: Mark kvm_arm_init() and its unique descendants as __init
  KVM: MIPS: Hardcode callbacks to hardware virtualization extensions
  KVM: MIPS: Setup VZ emulation? directly from kvm_mips_init()
  KVM: MIPS: Register die notifier prior to kvm_init()
  KVM: RISC-V: Do arch init directly in riscv_kvm_init()
  KVM: RISC-V: Tag init functions and data with __init, __ro_after_init
  KVM: PPC: Move processor compatibility check to module init
  KVM: s390: Do s390 specific init without bouncing through kvm_init()
  KVM: s390: Mark __kvm_s390_init() and its descendants as __init
  KVM: Drop kvm_arch_{init,exit}() hooks
  KVM: VMX: Make VMCS configuration/capabilities structs read-only after
    init
  KVM: x86: Do CPU compatibility checks in x86 code
  KVM: Drop kvm_arch_check_processor_compat() hook
  KVM: x86: Use KBUILD_MODNAME to specify vendor module name
  KVM: x86: Unify pr_fmt to use module name for all KVM modules
  KVM: VMX: Use current CPU's info to perform "disabled by BIOS?" checks
  KVM: x86: Do VMX/SVM support checks directly in vendor code
  KVM: VMX: Shuffle support checks and hardware enabling code around
  KVM: SVM: Check for SVM support in CPU compatibility checks
  KVM: x86: Move CPU compat checks hook to kvm_x86_ops (from
    kvm_x86_init_ops)
  KVM: Ensure CPU is stable during low level hardware enable/disable
  KVM: Use a per-CPU variable to track which CPUs have enabled
    virtualization
  KVM: Register syscore (suspend/resume) ops early in kvm_init()
  KVM: Opt out of generic hardware enabling on s390 and PPC
  KVM: Clean up error labels in kvm_init()

 Documentation/virt/kvm/locking.rst  |  25 +-
 arch/arm64/include/asm/kvm_host.h   |  15 +-
 arch/arm64/include/asm/kvm_mmu.h    |   4 +-
 arch/arm64/kvm/Kconfig              |   1 +
 arch/arm64/kvm/arch_timer.c         |  29 +-
 arch/arm64/kvm/arm.c                |  93 +++---
 arch/arm64/kvm/mmu.c                |  12 +-
 arch/arm64/kvm/reset.c              |   8 +-
 arch/arm64/kvm/sys_regs.c           |   6 +-
 arch/arm64/kvm/vgic/vgic-init.c     |  19 +-
 arch/arm64/kvm/vmid.c               |   6 +-
 arch/mips/include/asm/kvm_host.h    |   3 +-
 arch/mips/kvm/Kconfig               |   1 +
 arch/mips/kvm/Makefile              |   2 +-
 arch/mips/kvm/callback.c            |  14 -
 arch/mips/kvm/mips.c                |  34 +--
 arch/mips/kvm/vz.c                  |   7 +-
 arch/powerpc/include/asm/kvm_host.h |   3 -
 arch/powerpc/include/asm/kvm_ppc.h  |   1 -
 arch/powerpc/kvm/book3s.c           |  12 +-
 arch/powerpc/kvm/e500.c             |   6 +-
 arch/powerpc/kvm/e500mc.c           |   6 +-
 arch/powerpc/kvm/powerpc.c          |  20 --
 arch/riscv/include/asm/kvm_host.h   |   7 +-
 arch/riscv/kvm/Kconfig              |   1 +
 arch/riscv/kvm/main.c               |  23 +-
 arch/riscv/kvm/mmu.c                |  12 +-
 arch/riscv/kvm/vmid.c               |   4 +-
 arch/s390/include/asm/kvm_host.h    |   1 -
 arch/s390/kvm/interrupt.c           |   2 +-
 arch/s390/kvm/kvm-s390.c            |  84 +++---
 arch/s390/kvm/kvm-s390.h            |   2 +-
 arch/s390/kvm/pci.c                 |   2 +-
 arch/s390/kvm/pci.h                 |   2 +-
 arch/x86/include/asm/kvm-x86-ops.h  |   1 +
 arch/x86/include/asm/kvm_host.h     |   8 +-
 arch/x86/kvm/Kconfig                |   1 +
 arch/x86/kvm/cpuid.c                |   1 +
 arch/x86/kvm/debugfs.c              |   2 +
 arch/x86/kvm/emulate.c              |   1 +
 arch/x86/kvm/hyperv.c               |   1 +
 arch/x86/kvm/i8254.c                |   4 +-
 arch/x86/kvm/i8259.c                |   4 +-
 arch/x86/kvm/ioapic.c               |   1 +
 arch/x86/kvm/irq.c                  |   1 +
 arch/x86/kvm/irq_comm.c             |   7 +-
 arch/x86/kvm/kvm_onhyperv.c         |   1 +
 arch/x86/kvm/lapic.c                |   8 +-
 arch/x86/kvm/mmu/mmu.c              |   6 +-
 arch/x86/kvm/mmu/page_track.c       |   1 +
 arch/x86/kvm/mmu/spte.c             |   4 +-
 arch/x86/kvm/mmu/spte.h             |   4 +-
 arch/x86/kvm/mmu/tdp_iter.c         |   1 +
 arch/x86/kvm/mmu/tdp_mmu.c          |   1 +
 arch/x86/kvm/mtrr.c                 |   1 +
 arch/x86/kvm/pmu.c                  |   1 +
 arch/x86/kvm/smm.c                  |   1 +
 arch/x86/kvm/svm/avic.c             |   2 +-
 arch/x86/kvm/svm/nested.c           |   2 +-
 arch/x86/kvm/svm/pmu.c              |   2 +
 arch/x86/kvm/svm/sev.c              |   1 +
 arch/x86/kvm/svm/svm.c              |  89 +++---
 arch/x86/kvm/svm/svm_onhyperv.c     |   1 +
 arch/x86/kvm/svm/svm_onhyperv.h     |   4 +-
 arch/x86/kvm/vmx/capabilities.h     |   4 +-
 arch/x86/kvm/vmx/hyperv.c           |   1 +
 arch/x86/kvm/vmx/hyperv.h           |   4 +-
 arch/x86/kvm/vmx/nested.c           |   3 +-
 arch/x86/kvm/vmx/pmu_intel.c        |   5 +-
 arch/x86/kvm/vmx/posted_intr.c      |   2 +
 arch/x86/kvm/vmx/sgx.c              |   5 +-
 arch/x86/kvm/vmx/vmcs12.c           |   1 +
 arch/x86/kvm/vmx/vmx.c              | 438 +++++++++++++++-------------
 arch/x86/kvm/vmx/vmx_ops.h          |   4 +-
 arch/x86/kvm/x86.c                  | 248 +++++++++-------
 arch/x86/kvm/xen.c                  |   1 +
 include/kvm/arm_arch_timer.h        |   6 +-
 include/kvm/arm_vgic.h              |   4 +
 include/linux/cpuhotplug.h          |   5 +-
 include/linux/kvm_host.h            |  13 +-
 virt/kvm/Kconfig                    |   3 +
 virt/kvm/kvm_main.c                 | 303 ++++++++++---------
 82 files changed, 863 insertions(+), 816 deletions(-)
 delete mode 100644 arch/mips/kvm/callback.c


base-commit: 3e04435fe60590a1c79ec94d60e9897c3ff7d73b
-- 
2.38.1.584.g0f3c55d4c2-goog

