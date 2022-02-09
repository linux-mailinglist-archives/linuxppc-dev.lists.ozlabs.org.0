Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6279B4AFEBE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 21:55:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvBw817Dyz3bVL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 07:55:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YBA2dck1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=chao.gao@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YBA2dck1; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtsKw0Rf0z301M
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 18:42:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644392564; x=1675928564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ptt8R/RvwFaVk8njj6dZCgZ7G353iPS7PsxtHDnt7q4=;
 b=YBA2dck1EcNrL31PySohuUFpLNX6N4uQ4Wb/2XTvgswy7RFiSY22wNXG
 fUKbDckHBNrj04CQwTydScLuJoMXaM0ZDy9OQFjgoBcLuVO799S271XGD
 s9v4OAZxLTPq+nPz2z8Pn5teoR0MC5qovuro3qk+WFVyb+aUJtTkcvF4s
 2iDkSfaICSl3ieTNiaR60HSBIdHlV79HhKJgaa7TYgAccd+dp5NN5OUnn
 GtSLdFbB+U2gOEN/dBfJCWOZiBeW6i/gyd9NNbvE2A3H0B5MFKwTfBtoL
 cegywG2f9VDB6ZcubUjpeNuMtDEm9DNQlN15sGYVOvVGd9fzO53NzUOj9 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="232712935"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="232712935"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 23:41:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="540984524"
Received: from hyperv-sh4.sh.intel.com ([10.239.48.22])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 23:41:21 -0800
From: Chao Gao <chao.gao@intel.com>
To: kvm@vger.kernel.org, seanjc@google.com, pbonzini@redhat.com,
 kevin.tian@intel.com, tglx@linutronix.de
Subject: [PATCH v3 0/5] Improve KVM's interaction with CPU hotplug
Date: Wed,  9 Feb 2022 15:41:01 +0800
Message-Id: <20220209074109.453116-1-chao.gao@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Feb 2022 07:54:32 +1100
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 David Hildenbrand <david@redhat.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 Janosch Frank <frankja@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Joerg Roedel <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 linux-riscv@lists.infradead.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Chao Gao <chao.gao@intel.com>, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 John Garry <john.garry@huawei.com>, Nicholas Piggin <npiggin@gmail.com>,
 Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Tom Zanussi <tom.zanussi@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>,
 Sumanth Korikkar <sumanthk@linux.ibm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Thomas Richter <tmricht@linux.ibm.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, James Morse <james.morse@arm.com>,
 kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changes from v2->v3:
 - rebased to the latest kvm/next branch. 
 - patch 1: rename {svm,vmx}_check_processor_compat to follow the name
	    convention
 - patch 3: newly added to provide more information when hardware enabling
	    fails
 - patch 4: reset hardware_enable_failed if hardware enabling fails. And
	    remove redundent kernel log.
 - patch 5: add a pr_err() for setup_vmcs_config() path.

Changes from v1->v2: (all comments/suggestions on v1 are from Sean, thanks)
 - Merged v1's patch 2 into patch 1, and v1's patch 5 into patch 6.
 - Use static_call for check_processor_compatibility().
 - Generate patch 2 with "git revert" and do manual changes based on that.
 - Loosen the WARN_ON() in kvm_arch_check_processor_compat() instead of
   removing it.
 - KVM always prevent incompatible CPUs from being brought up regardless of
   running VMs.
 - Use pr_warn instead of pr_info to emit logs when KVM finds offending
   CPUs.

KVM registers its CPU hotplug callback to CPU starting section. And in the
callback, KVM enables hardware virtualization on hotplugged CPUs if any VM
is running on existing CPUs.

There are two problems in the process:
1. KVM doesn't do compatibility checks before enabling hardware
virtualization on hotplugged CPUs. This may cause #GP if VMX isn't
supported or vmentry failure if some in-use VMX features are missing on
hotplugged CPUs. Both break running VMs.
2. Callbacks in CPU STARTING section cannot fail. So, even if KVM finds
some incompatible CPUs, its callback cannot block CPU hotplug.

This series improves KVM's interaction with CPU hotplug to avoid
incompatible CPUs breaking running VMs. Following changes are made:

1. move KVM's CPU hotplug callback to ONLINE section (suggested by Thomas)
2. do compatibility checks on hotplugged CPUs.
3. abort onlining incompatible CPUs

This series is a follow-up to the discussion about KVM and CPU hotplug
https://lore.kernel.org/lkml/3d3296f0-9245-40f9-1b5a-efffdb082de9@redhat.com/T/

Note: this series is tested only on Intel systems.

Chao Gao (4):
  KVM: x86: Move check_processor_compatibility from init ops to runtime
    ops
  Partially revert "KVM: Pass kvm_init()'s opaque param to additional
    arch funcs"
  KVM: Rename and move CPUHP_AP_KVM_STARTING to ONLINE section
  KVM: Do compatibility checks on hotplugged CPUs

Sean Christopherson (1):
  KVM: Provide more information in kernel log if hardware enabling fails

 arch/arm64/kvm/arm.c               |  2 +-
 arch/mips/kvm/mips.c               |  2 +-
 arch/powerpc/kvm/powerpc.c         |  2 +-
 arch/riscv/kvm/main.c              |  2 +-
 arch/s390/kvm/kvm-s390.c           |  2 +-
 arch/x86/include/asm/kvm-x86-ops.h |  1 +
 arch/x86/include/asm/kvm_host.h    |  2 +-
 arch/x86/kvm/svm/svm.c             |  4 +-
 arch/x86/kvm/vmx/evmcs.c           |  2 +-
 arch/x86/kvm/vmx/evmcs.h           |  2 +-
 arch/x86/kvm/vmx/vmx.c             | 22 +++++----
 arch/x86/kvm/x86.c                 | 16 +++++--
 include/linux/cpuhotplug.h         |  2 +-
 include/linux/kvm_host.h           |  2 +-
 virt/kvm/kvm_main.c                | 73 +++++++++++++++++++-----------
 15 files changed, 83 insertions(+), 53 deletions(-)

-- 
2.25.1

