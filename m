Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DD1480780
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 09:49:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNSs95GxWz3c6K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 19:49:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VhBPscMe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=chao.gao@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VhBPscMe; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMrCL3blrz2yJV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 19:18:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640593102; x=1672129102;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tCJzGvAoR9V3Cf25Th6SaPQVLQdtAnnLPINob5E2Vys=;
 b=VhBPscMeLk+9XUXgAJJh18QxsKLLXSh1ZtxZ9YahYKngt0Z3jKDNs73F
 IxVb8m0Fp7tb3upa5bSNbgKflOvQDmc1c8+qAgXZaQzuJsBbDGpOp859d
 8Bh5+TW4QfODrAx5T3VyDUx/kMyP2YrSDrqGX8wULbBaxJYTuZq9x3fvd
 y8trr1dudrttuOJrAGXvO6gDECHZhC5fEK+x0arPYkbL5GhFU4ukiFp4o
 FbvxeBWxzdUfd4rtjSFJsNEHBTCpCs0KxWaYnxwvlcL+e9KVseapPHMii
 xfUhwdDZCrgOfQybZLOkpSIGLtxNPnwUtETL5t/C3OGiBpuVBe6LDnNMp g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="241396749"
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; d="scan'208";a="241396749"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2021 00:17:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; d="scan'208";a="523207964"
Received: from unknown (HELO hyperv-sh4.sh.intel.com) ([10.239.48.22])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2021 00:16:56 -0800
From: Chao Gao <chao.gao@intel.com>
To: kvm@vger.kernel.org, pbonzini@redhat.com, kevin.tian@intel.com,
 tglx@linutronix.de
Subject: [PATCH 0/6] Improve KVM's interaction with CPU hotplug
Date: Mon, 27 Dec 2021 16:15:06 +0800
Message-Id: <20211227081515.2088920-1-chao.gao@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 28 Dec 2021 19:49:15 +1100
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
Cc: Guo Ren <guoren@linux.alibaba.com>, Wanpeng Li <wanpengli@tencent.com>,
 David Hildenbrand <david@redhat.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-mips@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 linux-riscv@lists.infradead.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Chao Gao <chao.gao@intel.com>, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 John Garry <john.garry@huawei.com>, Nicholas Piggin <npiggin@gmail.com>,
 Shaokun Zhang <zhangshaokun@hisilicon.com>, Borislav Petkov <bp@alien8.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Sumanth Korikkar <sumanthk@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Mel Gorman <mgorman@techsingularity.net>, Anup Patel <anup.patel@wdc.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, James Morse <james.morse@arm.com>,
 kvm-riscv@lists.infradead.org, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Thomas Richter <tmricht@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
3. abort onlining incompatible CPUs if there is a running VM.

This series is a follow-up to the discussion about KVM and CPU hotplug
https://lore.kernel.org/lkml/3d3296f0-9245-40f9-1b5a-efffdb082de9@redhat.com/T/

Note: this series is tested only on Intel systems.

Chao Gao (6):
  KVM: x86: Move check_processor_compatibility from init ops to runtime
    ops
  KVM: x86: Use kvm_x86_ops in kvm_arch_check_processor_compat
  KVM: Remove opaque from kvm_arch_check_processor_compat
  KVM: Rename and move CPUHP_AP_KVM_STARTING to ONLINE section
  KVM: x86: Remove WARN_ON in kvm_arch_check_processor_compat
  KVM: Do compatibility checks on hotplugged CPUs

 arch/arm64/kvm/arm.c            |  2 +-
 arch/mips/kvm/mips.c            |  2 +-
 arch/powerpc/kvm/powerpc.c      |  2 +-
 arch/riscv/kvm/main.c           |  2 +-
 arch/s390/kvm/kvm-s390.c        |  2 +-
 arch/x86/include/asm/kvm_host.h |  2 +-
 arch/x86/kvm/svm/svm.c          |  4 +-
 arch/x86/kvm/vmx/evmcs.c        |  2 +-
 arch/x86/kvm/vmx/evmcs.h        |  2 +-
 arch/x86/kvm/vmx/vmx.c          | 12 +++---
 arch/x86/kvm/x86.c              |  7 +---
 include/linux/cpuhotplug.h      |  2 +-
 include/linux/kvm_host.h        |  2 +-
 virt/kvm/kvm_main.c             | 74 ++++++++++++++++++++++++---------
 14 files changed, 74 insertions(+), 43 deletions(-)

-- 
2.25.1

