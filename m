Return-Path: <linuxppc-dev+bounces-5854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A8DA28381
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2025 06:01:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ynp3r5gfdz2ykC;
	Wed,  5 Feb 2025 16:01:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738731688;
	cv=none; b=jhvyUZkB3p49ujlWg6sAd/sehYDnFVZMGg/oSvPd4twZGkkOJJyDSCn0A443vFfNO9gRCnsJ+h0WwlCcc64KeQxizj9kU4IhiFiq5rgg+k8sHBGljDtE4eDw8qKgdl6sik99TEeF8zgUHm3yZkzo4YOE1qAO2svHf4Go54WVSinnJ7hVH46HB25vpJcyGI5wwdS8g2VwijlFwScjNJf2aoN5znXxx315UBBEljQ/QteFQa6FCjaU+M8SJQHiO3ffR6i+YP2FeBs2RRNOPpcun31paqpLYhuhmkO9bcS68Ce4ZDM8Sjh9iijNXGk9KLolivngrGqqBxKyZnI+N9thjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738731688; c=relaxed/relaxed;
	bh=XOLFGKzAq1Ih/DSvWl2e03z1sP+VNRq7tgpUtW0Lods=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e9ffUP5F16NdrDO7gzrlGWwlspYIVp7/ly4h/FMXFfMLFN3taLEl/V5PgBDT2WOsRIdI1rp6iOySjSMEbUk0uG8o3ZjAEyxT2BiMbObiLNSuj1nnG2T0dHZW+i8PKdn6WTuJjR9dknNpnaMCLDEQ+yrNzRgDi2/FKCzS8a0Gacp+mUVvfeeYP85IAU04xfPF64K89aOAzWZh9Gl9JR4LZFVF02FBLNhivF8aFLRsLk9G7WseB2kNig80eW9849Tgy9Kn28hx6C0Ncvl/mBEcRfh+ww3V0TnTDKn4ovxu6xyCMLayO0B5DqXTKRST3j5Kci9fRkcB34YlaV+fENxMpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ynp3q4FSQz2yXY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 16:01:25 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D9D611FB;
	Tue,  4 Feb 2025 21:01:17 -0800 (PST)
Received: from a077893.blr.arm.com (unknown [10.162.16.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0BA7C3F63F;
	Tue,  4 Feb 2025 21:00:45 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: steven.price@arm.com,
	christophe.leroy@csgroup.eu,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH V2] mm/ptdump: Drop GENERIC_PTDUMP
Date: Wed,  5 Feb 2025 10:30:39 +0530
Message-Id: <20250205050039.1506377-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

GENERIC_PTDUMP does not guard any code but instead just used for platform's
subscription into core ptdump defined under PTDUMP_CORE, which is selected.
Instead use PTDUMP_CORE for platform subscription and drop GENERIC_PTDUMP.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: kvmarm@lists.linux.dev
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-mm@kvack.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.14-rc1

Changes in V2:

- Keep arch/powerpc/Kconfig alphabetically sorted per Christophe

Changes in V1:

https://lore.kernel.org/all/20241217034807.2541349-1-anshuman.khandual@arm.com/

 Documentation/arch/arm64/ptdump.rst       | 1 -
 arch/arm64/Kconfig                        | 2 +-
 arch/arm64/kvm/Kconfig                    | 3 +--
 arch/powerpc/Kconfig                      | 2 +-
 arch/powerpc/configs/mpc885_ads_defconfig | 1 -
 arch/riscv/Kconfig                        | 2 +-
 arch/s390/Kconfig                         | 2 +-
 arch/x86/Kconfig                          | 2 +-
 arch/x86/Kconfig.debug                    | 2 +-
 kernel/configs/debug.config               | 1 -
 mm/Kconfig.debug                          | 8 ++------
 11 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/Documentation/arch/arm64/ptdump.rst b/Documentation/arch/arm64/ptdump.rst
index 5dcfc5d7cddf..61ca040a885b 100644
--- a/Documentation/arch/arm64/ptdump.rst
+++ b/Documentation/arch/arm64/ptdump.rst
@@ -22,7 +22,6 @@ offlining of memory being accessed by the ptdump code.
 In order to dump the kernel page tables, enable the following
 configurations and mount debugfs::
 
- CONFIG_GENERIC_PTDUMP=y
  CONFIG_PTDUMP_CORE=y
  CONFIG_PTDUMP_DEBUGFS=y
 
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fcdd0ed3eca8..1f516bed81dd 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -157,7 +157,7 @@ config ARM64
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select GENERIC_PCI_IOMAP
-	select GENERIC_PTDUMP
+	select PTDUMP_CORE
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index ead632ad01b4..fe17d7f5b061 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -71,8 +71,7 @@ config PTDUMP_STAGE2_DEBUGFS
 	depends on KVM
 	depends on DEBUG_KERNEL
 	depends on DEBUG_FS
-	depends on GENERIC_PTDUMP
-	select PTDUMP_CORE
+	depends on PTDUMP_CORE
 	default n
 	help
 	  Say Y here if you want to show the stage-2 kernel pagetables
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 424f188e62d9..97312440f715 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -206,7 +206,6 @@ config PPC
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_PCI_IOMAP		if PCI
-	select GENERIC_PTDUMP
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
 	select GENERIC_VDSO_TIME_NS
@@ -314,6 +313,7 @@ config PPC
 	select PCI_MSI_ARCH_FALLBACKS		if PCI_MSI
 	select PCI_SYSCALL			if PCI
 	select PPC_DAWR				if PPC64
+	select PTDUMP_CORE
 	select RTC_LIB
 	select SPARSE_IRQ
 	select STRICT_KERNEL_RWX if STRICT_MODULE_RWX
diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
index 77306be62e9e..ea6f836407d2 100644
--- a/arch/powerpc/configs/mpc885_ads_defconfig
+++ b/arch/powerpc/configs/mpc885_ads_defconfig
@@ -78,4 +78,3 @@ CONFIG_DEBUG_VM_PGTABLE=y
 CONFIG_DETECT_HUNG_TASK=y
 CONFIG_BDI_SWITCH=y
 CONFIG_PPC_EARLY_DEBUG=y
-CONFIG_GENERIC_PTDUMP=y
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..bdaf08c1e1da 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -112,7 +112,7 @@ config RISCV
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select GENERIC_PCI_IOMAP
-	select GENERIC_PTDUMP if MMU
+	select PTDUMP_CORE if MMU
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 9c9ec08d78c7..ecf6b4cb3e33 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -163,7 +163,7 @@ config S390
 	select GENERIC_CPU_VULNERABILITIES
 	select GENERIC_ENTRY
 	select GENERIC_GETTIMEOFDAY
-	select GENERIC_PTDUMP
+	select PTDUMP_CORE
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
 	select GENERIC_VDSO_TIME_NS
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 87198d957e2f..b6097b6178de 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -174,7 +174,7 @@ config X86
 	select GENERIC_IRQ_RESERVATION_MODE
 	select GENERIC_IRQ_SHOW
 	select GENERIC_PENDING_IRQ		if SMP
-	select GENERIC_PTDUMP
+	select PTDUMP_CORE
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
 	select GENERIC_GETTIMEOFDAY
diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index 1eb4d23cdaae..090c44d7e1a5 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -59,7 +59,7 @@ config EARLY_PRINTK_USB_XDBC
 config EFI_PGT_DUMP
 	bool "Dump the EFI pagetable"
 	depends on EFI
-	select PTDUMP_CORE
+	depends on PTDUMP_CORE
 	help
 	  Enable this if you want to dump the EFI page table before
 	  enabling virtual mode. This can be used to debug miscellaneous
diff --git a/kernel/configs/debug.config b/kernel/configs/debug.config
index 20552f163930..8aafd050b754 100644
--- a/kernel/configs/debug.config
+++ b/kernel/configs/debug.config
@@ -73,7 +73,6 @@ CONFIG_DEBUG_VM=y
 CONFIG_DEBUG_VM_PGFLAGS=y
 CONFIG_DEBUG_VM_RB=y
 CONFIG_DEBUG_VM_VMACACHE=y
-CONFIG_GENERIC_PTDUMP=y
 CONFIG_KASAN=y
 CONFIG_KASAN_GENERIC=y
 CONFIG_KASAN_INLINE=y
diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 41a58536531d..b206e5a11f96 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -187,7 +187,7 @@ config DEBUG_WX
 	bool "Warn on W+X mappings at boot"
 	depends on ARCH_HAS_DEBUG_WX
 	depends on MMU
-	select PTDUMP_CORE
+	depends on PTDUMP_CORE
 	help
 	  Generate a warning if any W+X mappings are found at boot.
 
@@ -212,9 +212,6 @@ config DEBUG_WX
 
 	  If in doubt, say "Y".
 
-config GENERIC_PTDUMP
-	bool
-
 config PTDUMP_CORE
 	bool
 
@@ -222,8 +219,7 @@ config PTDUMP_DEBUGFS
 	bool "Export kernel pagetable layout to userspace via debugfs"
 	depends on DEBUG_KERNEL
 	depends on DEBUG_FS
-	depends on GENERIC_PTDUMP
-	select PTDUMP_CORE
+	depends on PTDUMP_CORE
 	help
 	  Say Y here if you want to show the kernel pagetable layout in a
 	  debugfs file. This information is only useful for kernel developers
-- 
2.30.2


