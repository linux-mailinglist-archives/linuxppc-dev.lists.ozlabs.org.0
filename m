Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7F24B8173
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 08:23:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jz8Z1459bz3c9f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 18:23:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=COD2xa/0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=chao.gao@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=COD2xa/0; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jz36371syz2yPY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 14:16:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644981421; x=1676517421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QTNgfjCEcX1QhsvTX1L+Tjbtrc8LR7Y4aspA8SJiUsY=;
 b=COD2xa/0Q9fH0n0OUij0bGo3mlurHQ8ZC9/A8q/bxqwsYWoteF0MOwdC
 0zva8xA3O4FgrkPf8Fri+Vq9CQsYcC34WTlGcFbLXo9wa41Ju8LxHXLJ9
 smkKQliWnujqjGhfQxqd6vJ5lFQ6L8JZH7s2J++21cknfVegfjPDfwXcj
 xLp95zs4BNjJt4XollEiAQfJh1AVwPFHPsLr+02/C7qmgadpM0+HZLELB
 fNaMLMeWU45j/odd7ro1iI/6JR3kq8BEvnNh/QqHvtGgqHHaSsvB2+clH
 5sKrZsYo66KCNKcxhXlvGihVR6jA9+DctC82OwL7VI9uHS5slQImuz2ou Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="250713229"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="250713229"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 19:15:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="773798119"
Received: from hyperv-sh4.sh.intel.com ([10.239.48.22])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 19:15:36 -0800
From: Chao Gao <chao.gao@intel.com>
To: seanjc@google.com, maz@kernel.org, kvm@vger.kernel.org,
 pbonzini@redhat.com, kevin.tian@intel.com, tglx@linutronix.de
Subject: [PATCH v4 0/6] Improve KVM's interaction with CPU hotplug
Date: Wed, 16 Feb 2022 11:15:15 +0800
Message-Id: <20220216031528.92558-1-chao.gao@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 16 Feb 2022 18:22:32 +1100
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
Cc: Thomas Richter <tmricht@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 David Hildenbrand <david@redhat.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 Jia He <justin.he@arm.com>, Janosch Frank <frankja@linux.ibm.com>,
 Anup Patel <anup@brainfault.org>, Joerg Roedel <joro@8bytes.org>,
 Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Qi Liu <liuqi115@huawei.com>, Chao Gao <chao.gao@intel.com>,
 Andrew Jones <drjones@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, John Garry <john.garry@huawei.com>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Eric Auger <eric.auger@redhat.com>, Tom Zanussi <tom.zanussi@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Atish Patra <atishp@atishpatra.org>, Sumanth Korikkar <sumanthk@linux.ibm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Juergen Gross <jgross@suse.com>, Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Hector Martin <marcan@marcan.st>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 James Morse <james.morse@arm.com>, Sven Schnelle <svens@linux.ibm.com>,
 kvm-riscv@lists.infradead.org, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changes from v3->v4:
 - rebased to the lastest kvm/next branch.
 - add Sean's reviewed-by tags
 - add Marc's patch to simplify ARM's cpu hotplug logic in KVM

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

Marc Zyngier (1):
  KVM: arm64: Simplify the CPUHP logic

Sean Christopherson (1):
  KVM: Provide more information in kernel log if hardware enabling fails

 arch/arm64/kvm/arch_timer.c        | 27 ++++-------
 arch/arm64/kvm/arm.c               |  6 ++-
 arch/arm64/kvm/vgic/vgic-init.c    | 19 +-------
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
 include/kvm/arm_arch_timer.h       |  4 ++
 include/kvm/arm_vgic.h             |  4 ++
 include/linux/cpuhotplug.h         |  5 +-
 include/linux/kvm_host.h           |  2 +-
 virt/kvm/kvm_main.c                | 73 +++++++++++++++++++-----------
 19 files changed, 107 insertions(+), 90 deletions(-)

-- 
2.25.1

