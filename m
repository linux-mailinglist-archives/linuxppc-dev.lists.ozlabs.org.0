Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 136CF1CBDAA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 07:15:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JwPP6bJFzDqrW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 15:15:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JwBJ2DNszDr2j
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 15:05:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=l4rupVTd; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49JwBJ07VBz9sSw; Sat,  9 May 2020 15:05:28 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 49JwBH4DKrz9sT2; Sat,  9 May 2020 15:05:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1589000727; bh=BC6iaTJ/M52M8QJLXWgCgLJcHYEeMcPS+LMmdBI2IFM=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=l4rupVTdVQ2IYPF4Sz/bKX+9gXJ924qlJZZD47gn4Zd8o9/GTbHfHuIDLozx4ygQf
 qwFXv3a2Gt0AIcNPwkToGtcOtspZBHSkAJ532rsqLWSdn/GIuI6jju4RvMEO9C782F
 b7bgDXCN+nYzHyFodsDKeIQQGWZ41KOHrBVbegYKwVZ+haFpKIdDwaqOyNrTfZ69pQ
 OKy2DPeUri2dmDbr5S42nEfRr0QI++zIaGub8vQ2g3dGCPrap5rnWAEa6v4DU4sc+9
 Az3/20d02lfnUjYgcTWXDuLYcUOVUuo31VIA/mxqrjR64ZI9HjnZik6bH8F/LjyQM/
 Aaf0Rvpnre/4g==
Date: Sat, 9 May 2020 15:02:55 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org, Benjamin Herrenschmidt <benh@ozlabs.org>,
 Michael Neuling <mikey@neuling.org>, Anton Blanchard <anton@ozlabs.org>
Subject: [PATCH RFC 2/4] powerpc: Add Microwatt platform
Message-ID: <20200509050255.GC1464954@thinks.paulus.ozlabs.org>
References: <20200509050103.GA1464954@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509050103.GA1464954@thinks.paulus.ozlabs.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Microwatt is a FPGA-based implementation of the Power ISA.  It
currently only implements little-endian 64-bit mode, and does
not (yet) support SMP.

This adds a new machine type to support FPGA-based SoCs with a
Microwatt core.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/Kconfig                      |    2 +-
 arch/powerpc/configs/microwatt_defconfig  | 1418 +++++++++++++++++++++
 arch/powerpc/platforms/Kconfig            |    1 +
 arch/powerpc/platforms/Makefile           |    1 +
 arch/powerpc/platforms/microwatt/Kconfig  |    9 +
 arch/powerpc/platforms/microwatt/Makefile |    1 +
 arch/powerpc/platforms/microwatt/setup.c  |   40 +
 7 files changed, 1471 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/configs/microwatt_defconfig
 create mode 100644 arch/powerpc/platforms/microwatt/Kconfig
 create mode 100644 arch/powerpc/platforms/microwatt/Makefile
 create mode 100644 arch/powerpc/platforms/microwatt/setup.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 497b7d0b2d7e..97286b8312f5 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -407,7 +407,7 @@ config HUGETLB_PAGE_SIZE_VARIABLE
 
 config MATH_EMULATION
 	bool "Math emulation"
-	depends on 4xx || PPC_8xx || PPC_MPC832x || BOOKE
+	depends on 4xx || PPC_8xx || PPC_MPC832x || BOOKE || PPC_MICROWATT
 	help
 	  Some PowerPC chips designed for embedded applications do not have
 	  a floating-point unit and therefore do not implement the
diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
new file mode 100644
index 000000000000..f4f4c965a786
--- /dev/null
+++ b/arch/powerpc/configs/microwatt_defconfig
@@ -0,0 +1,1418 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Linux/powerpc 5.6.0 Kernel Configuration
+#
+
+#
+# Compiler: powerpc64le-linux-gnu-gcc (GCC) 9.2.1 20190827 (Red Hat Cross 9.2.1-1)
+#
+CONFIG_CC_IS_GCC=y
+CONFIG_GCC_VERSION=90201
+CONFIG_CLANG_VERSION=0
+CONFIG_CC_HAS_ASM_GOTO=y
+CONFIG_CC_HAS_ASM_INLINE=y
+CONFIG_CC_HAS_WARN_MAYBE_UNINITIALIZED=y
+CONFIG_CC_DISABLE_WARN_MAYBE_UNINITIALIZED=y
+CONFIG_IRQ_WORK=y
+CONFIG_BUILDTIME_TABLE_SORT=y
+CONFIG_THREAD_INFO_IN_TASK=y
+
+#
+# General setup
+#
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+# CONFIG_COMPILE_TEST is not set
+CONFIG_LOCALVERSION=""
+CONFIG_LOCALVERSION_AUTO=y
+CONFIG_BUILD_SALT=""
+CONFIG_HAVE_KERNEL_GZIP=y
+CONFIG_HAVE_KERNEL_XZ=y
+# CONFIG_KERNEL_GZIP is not set
+CONFIG_KERNEL_XZ=y
+CONFIG_DEFAULT_HOSTNAME="arty"
+# CONFIG_SWAP is not set
+# CONFIG_SYSVIPC is not set
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+# CONFIG_USELIB is not set
+CONFIG_HAVE_ARCH_AUDITSYSCALL=y
+
+#
+# IRQ subsystem
+#
+CONFIG_GENERIC_IRQ_SHOW=y
+CONFIG_GENERIC_IRQ_SHOW_LEVEL=y
+CONFIG_HARDIRQS_SW_RESEND=y
+CONFIG_IRQ_DOMAIN=y
+CONFIG_IRQ_FORCED_THREADING=y
+CONFIG_SPARSE_IRQ=y
+# end of IRQ subsystem
+
+CONFIG_GENERIC_TIME_VSYSCALL=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+CONFIG_GENERIC_CMOS_UPDATE=y
+
+#
+# Timers subsystem
+#
+CONFIG_TICK_ONESHOT=y
+CONFIG_HZ_PERIODIC=y
+# CONFIG_NO_HZ_IDLE is not set
+# CONFIG_NO_HZ is not set
+CONFIG_HIGH_RES_TIMERS=y
+# end of Timers subsystem
+
+# CONFIG_PREEMPT_NONE is not set
+CONFIG_PREEMPT_VOLUNTARY=y
+# CONFIG_PREEMPT is not set
+
+#
+# CPU/Task time and stats accounting
+#
+CONFIG_TICK_CPU_ACCOUNTING=y
+# CONFIG_VIRT_CPU_ACCOUNTING_NATIVE is not set
+# CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
+# CONFIG_IRQ_TIME_ACCOUNTING is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_PSI is not set
+# end of CPU/Task time and stats accounting
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_RCU=y
+# CONFIG_RCU_EXPERT is not set
+CONFIG_SRCU=y
+CONFIG_TINY_SRCU=y
+# end of RCU Subsystem
+
+# CONFIG_IKCONFIG is not set
+# CONFIG_IKHEADERS is not set
+CONFIG_LOG_BUF_SHIFT=16
+CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
+
+#
+# Scheduler features
+#
+# end of Scheduler features
+
+CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
+CONFIG_CC_HAS_INT128=y
+# CONFIG_CGROUPS is not set
+# CONFIG_NAMESPACES is not set
+# CONFIG_CHECKPOINT_RESTORE is not set
+# CONFIG_SCHED_AUTOGROUP is not set
+# CONFIG_SYSFS_DEPRECATED is not set
+# CONFIG_RELAY is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="rootfs.cpio"
+CONFIG_INITRAMFS_ROOT_UID=0
+CONFIG_INITRAMFS_ROOT_GID=0
+# CONFIG_RD_GZIP is not set
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+CONFIG_RD_XZ=y
+# CONFIG_RD_LZO is not set
+# CONFIG_RD_LZ4 is not set
+CONFIG_INITRAMFS_COMPRESSION_XZ=y
+# CONFIG_INITRAMFS_COMPRESSION_NONE is not set
+# CONFIG_BOOT_CONFIG is not set
+# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION=y
+# CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is not set
+CONFIG_SYSCTL=y
+CONFIG_SYSCTL_EXCEPTION_TRACE=y
+CONFIG_EXPERT=y
+CONFIG_MULTIUSER=y
+# CONFIG_SGETMASK_SYSCALL is not set
+# CONFIG_SYSFS_SYSCALL is not set
+# CONFIG_FHANDLE is not set
+CONFIG_POSIX_TIMERS=y
+CONFIG_PRINTK=y
+CONFIG_PRINTK_NMI=y
+CONFIG_BUG=y
+# CONFIG_BASE_FULL is not set
+CONFIG_FUTEX=y
+CONFIG_FUTEX_PI=y
+# CONFIG_EPOLL is not set
+# CONFIG_SIGNALFD is not set
+# CONFIG_TIMERFD is not set
+# CONFIG_EVENTFD is not set
+# CONFIG_SHMEM is not set
+# CONFIG_AIO is not set
+# CONFIG_IO_URING is not set
+# CONFIG_ADVISE_SYSCALLS is not set
+# CONFIG_MEMBARRIER is not set
+CONFIG_KALLSYMS=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_KALLSYMS_BASE_RELATIVE=y
+# CONFIG_BPF_SYSCALL is not set
+# CONFIG_USERFAULTFD is not set
+CONFIG_ARCH_HAS_MEMBARRIER_CALLBACKS=y
+# CONFIG_RSEQ is not set
+CONFIG_EMBEDDED=y
+CONFIG_HAVE_PERF_EVENTS=y
+# CONFIG_PC104 is not set
+
+#
+# Kernel Performance Events And Counters
+#
+# CONFIG_PERF_EVENTS is not set
+# end of Kernel Performance Events And Counters
+
+# CONFIG_VM_EVENT_COUNTERS is not set
+# CONFIG_SLUB_DEBUG is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_SLAB is not set
+CONFIG_SLUB=y
+# CONFIG_SLOB is not set
+# CONFIG_SLAB_MERGE_DEFAULT is not set
+# CONFIG_SLAB_FREELIST_RANDOM is not set
+# CONFIG_SLAB_FREELIST_HARDENED is not set
+# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
+# CONFIG_PROFILING is not set
+# end of General setup
+
+CONFIG_PPC64=y
+
+#
+# Processor support
+#
+CONFIG_PPC_BOOK3S_64=y
+# CONFIG_PPC_BOOK3E_64 is not set
+CONFIG_GENERIC_CPU=y
+# CONFIG_POWER7_CPU is not set
+# CONFIG_POWER8_CPU is not set
+# CONFIG_POWER9_CPU is not set
+CONFIG_PPC_BOOK3S=y
+CONFIG_PPC_FPU=y
+# CONFIG_ALTIVEC is not set
+CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
+CONFIG_PPC_RADIX_MMU=y
+CONFIG_PPC_RADIX_MMU_DEFAULT=y
+CONFIG_PPC_HAVE_KUEP=y
+# CONFIG_PPC_KUEP is not set
+CONFIG_PPC_HAVE_KUAP=y
+# CONFIG_PPC_KUAP is not set
+# CONFIG_PPC_KUAP_DEBUG is not set
+CONFIG_PPC_MM_SLICES=y
+CONFIG_PPC_HAVE_PMU_SUPPORT=y
+# CONFIG_SMP is not set
+# end of Processor support
+
+# CONFIG_CPU_BIG_ENDIAN is not set
+CONFIG_CPU_LITTLE_ENDIAN=y
+CONFIG_PPC64_BOOT_WRAPPER=y
+CONFIG_64BIT=y
+CONFIG_MMU=y
+CONFIG_ARCH_MMAP_RND_BITS_MAX=33
+CONFIG_ARCH_MMAP_RND_BITS_MIN=18
+CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=17
+CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=11
+CONFIG_HAVE_SETUP_PER_CPU_AREA=y
+CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
+CONFIG_NR_IRQS=64
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_PPC=y
+CONFIG_PPC_BARRIER_NOSPEC=y
+CONFIG_EARLY_PRINTK=y
+CONFIG_PANIC_TIMEOUT=10
+CONFIG_COMPAT=y
+CONFIG_SCHED_OMIT_FRAME_POINTER=y
+CONFIG_AUDIT_ARCH=y
+CONFIG_GENERIC_BUG=y
+CONFIG_ARCH_HIBERNATION_POSSIBLE=y
+CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
+CONFIG_ARCH_SUPPORTS_UPROBES=y
+CONFIG_PPC_DAWR=y
+CONFIG_PGTABLE_LEVELS=4
+CONFIG_PPC_XICS=y
+
+#
+# Platform support
+#
+# CONFIG_PPC_POWERNV is not set
+# CONFIG_PPC_PSERIES is not set
+CONFIG_PPC_MICROWATT=y
+# CONFIG_KVM_GUEST is not set
+# CONFIG_EPAPR_PARAVIRT is not set
+CONFIG_PPC_NATIVE=y
+# CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
+CONFIG_PPC_DT_CPU_FTRS=y
+CONFIG_PPC_SMP_MUXED_IPI=y
+
+#
+# CPU Frequency scaling
+#
+CONFIG_CPU_FREQ=y
+# CONFIG_CPU_FREQ_STAT is not set
+CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
+# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
+CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
+# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
+# CONFIG_CPU_FREQ_GOV_USERSPACE is not set
+# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
+
+#
+# CPU frequency scaling drivers
+#
+# end of CPU Frequency scaling
+
+#
+# CPUIdle driver
+#
+
+#
+# CPU Idle
+#
+# CONFIG_CPU_IDLE is not set
+# end of CPU Idle
+# end of CPUIdle driver
+
+# CONFIG_GEN_RTC is not set
+# end of Platform support
+
+#
+# Kernel options
+#
+CONFIG_HZ_100=y
+# CONFIG_HZ_250 is not set
+# CONFIG_HZ_300 is not set
+# CONFIG_HZ_1000 is not set
+CONFIG_HZ=100
+CONFIG_SCHED_HRTICK=y
+CONFIG_MATH_EMULATION=y
+CONFIG_MATH_EMULATION_FULL=y
+# CONFIG_MATH_EMULATION_HW_UNIMPLEMENTED is not set
+# CONFIG_LD_HEAD_STUB_CATCH is not set
+CONFIG_MPROFILE_KERNEL=y
+CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
+CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
+# CONFIG_PPC64_SUPPORTS_MEMORY_FAILURE is not set
+# CONFIG_KEXEC is not set
+# CONFIG_RELOCATABLE is not set
+# CONFIG_CRASH_DUMP is not set
+# CONFIG_NUMA is not set
+CONFIG_ARCH_SELECT_MEMORY_MODEL=y
+CONFIG_ARCH_FLATMEM_ENABLE=y
+CONFIG_ARCH_SPARSEMEM_ENABLE=y
+CONFIG_ARCH_SPARSEMEM_DEFAULT=y
+CONFIG_SYS_SUPPORTS_HUGETLBFS=y
+CONFIG_ILLEGAL_POINTER_VALUE=0x5deadbeef0000000
+CONFIG_PPC_4K_PAGES=y
+# CONFIG_PPC_64K_PAGES is not set
+CONFIG_PPC_PAGE_SHIFT=12
+CONFIG_THREAD_SHIFT=14
+CONFIG_ETEXT_SHIFT=12
+CONFIG_DATA_SHIFT=12
+CONFIG_FORCE_MAX_ZONEORDER=13
+# CONFIG_PPC_DENORMALISATION is not set
+# CONFIG_CMDLINE_BOOL is not set
+CONFIG_CMDLINE=""
+CONFIG_EXTRA_TARGETS=""
+# CONFIG_PM is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_PPC_MEM_KEYS is not set
+# end of Kernel options
+
+#
+# Bus options
+#
+# CONFIG_FSL_LBC is not set
+# end of Bus options
+
+CONFIG_PAGE_OFFSET=0xc000000000000000
+CONFIG_KERNEL_START=0xc000000000000000
+CONFIG_PHYSICAL_START=0x00000000
+# CONFIG_VIRTUALIZATION is not set
+CONFIG_HAVE_LIVEPATCH=y
+
+#
+# General architecture-dependent options
+#
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_JUMP_LABEL is not set
+CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
+CONFIG_ARCH_USE_BUILTIN_BSWAP=y
+CONFIG_HAVE_IOREMAP_PROT=y
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_OPTPROBES=y
+CONFIG_HAVE_KPROBES_ON_FTRACE=y
+CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
+CONFIG_HAVE_NMI=y
+CONFIG_HAVE_ARCH_TRACEHOOK=y
+CONFIG_GENERIC_SMP_IDLE_THREAD=y
+CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
+CONFIG_HAVE_ASM_MODVERSIONS=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_RSEQ=y
+CONFIG_HAVE_PERF_EVENTS_NMI=y
+CONFIG_HAVE_NMI_WATCHDOG=y
+CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH=y
+CONFIG_HAVE_PERF_REGS=y
+CONFIG_HAVE_PERF_USER_STACK_DUMP=y
+CONFIG_HAVE_ARCH_JUMP_LABEL=y
+CONFIG_MMU_GATHER_TABLE_FREE=y
+CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
+CONFIG_MMU_GATHER_PAGE_SIZE=y
+CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
+CONFIG_ARCH_WEAK_RELEASE_ACQUIRE=y
+CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
+CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
+CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
+CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
+CONFIG_HAVE_STACKPROTECTOR=y
+CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
+# CONFIG_STACKPROTECTOR is not set
+CONFIG_HAVE_CONTEXT_TRACKING=y
+CONFIG_HAVE_VIRT_CPU_ACCOUNTING=y
+CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
+CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
+CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
+CONFIG_HAVE_ARCH_HUGE_VMAP=y
+CONFIG_HAVE_ARCH_SOFT_DIRTY=y
+CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
+CONFIG_MODULES_USE_ELF_RELA=y
+CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
+CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
+CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
+CONFIG_ARCH_MMAP_RND_BITS=18
+CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=y
+CONFIG_ARCH_MMAP_RND_COMPAT_BITS=11
+CONFIG_HAVE_COPY_THREAD_TLS=y
+CONFIG_HAVE_RELIABLE_STACKTRACE=y
+CONFIG_HAVE_ARCH_NVRAM_OPS=y
+CONFIG_CLONE_BACKWARDS=y
+CONFIG_OLD_SIGSUSPEND=y
+CONFIG_COMPAT_OLD_SIGACTION=y
+CONFIG_COMPAT_32BIT_TIME=y
+CONFIG_ARCH_OPTIONAL_KERNEL_RWX=y
+CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
+# CONFIG_STRICT_KERNEL_RWX is not set
+CONFIG_ARCH_HAS_PHYS_TO_DMA=y
+
+#
+# GCOV-based kernel profiling
+#
+CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
+# end of GCOV-based kernel profiling
+
+CONFIG_PLUGIN_HOSTCC=""
+CONFIG_HAVE_GCC_PLUGINS=y
+# end of General architecture-dependent options
+
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=1
+# CONFIG_MODULES is not set
+CONFIG_BLOCK=y
+CONFIG_BLK_SCSI_REQUEST=y
+CONFIG_BLK_DEV_BSG=y
+# CONFIG_BLK_DEV_BSGLIB is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+# CONFIG_BLK_DEV_ZONED is not set
+# CONFIG_BLK_CMDLINE_PARSER is not set
+# CONFIG_BLK_WBT is not set
+# CONFIG_BLK_SED_OPAL is not set
+
+#
+# Partition Types
+#
+# CONFIG_PARTITION_ADVANCED is not set
+CONFIG_MSDOS_PARTITION=y
+CONFIG_EFI_PARTITION=y
+# end of Partition Types
+
+CONFIG_BLOCK_COMPAT=y
+
+#
+# IO Schedulers
+#
+CONFIG_MQ_IOSCHED_DEADLINE=y
+# CONFIG_MQ_IOSCHED_KYBER is not set
+# CONFIG_IOSCHED_BFQ is not set
+# end of IO Schedulers
+
+CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
+CONFIG_INLINE_READ_UNLOCK=y
+CONFIG_INLINE_READ_UNLOCK_IRQ=y
+CONFIG_INLINE_WRITE_UNLOCK=y
+CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
+CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
+CONFIG_ARCH_HAS_MMIOWB=y
+
+#
+# Executable file formats
+#
+CONFIG_BINFMT_ELF=y
+CONFIG_COMPAT_BINFMT_ELF=y
+CONFIG_ELFCORE=y
+CONFIG_BINFMT_SCRIPT=y
+# CONFIG_BINFMT_MISC is not set
+# CONFIG_COREDUMP is not set
+# end of Executable file formats
+
+#
+# Memory Management options
+#
+CONFIG_SELECT_MEMORY_MODEL=y
+# CONFIG_FLATMEM_MANUAL is not set
+CONFIG_SPARSEMEM_MANUAL=y
+CONFIG_SPARSEMEM=y
+CONFIG_HAVE_MEMORY_PRESENT=y
+CONFIG_SPARSEMEM_EXTREME=y
+CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
+CONFIG_SPARSEMEM_VMEMMAP=y
+CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
+CONFIG_HAVE_FAST_GUP=y
+CONFIG_ARCH_KEEP_MEMBLOCK=y
+# CONFIG_MEMORY_HOTPLUG is not set
+CONFIG_SPLIT_PTLOCK_CPUS=4
+# CONFIG_COMPACTION is not set
+# CONFIG_MIGRATION is not set
+CONFIG_PHYS_ADDR_T_64BIT=y
+# CONFIG_KSM is not set
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+# CONFIG_TRANSPARENT_HUGEPAGE is not set
+CONFIG_NEED_PER_CPU_KM=y
+# CONFIG_CLEANCACHE is not set
+# CONFIG_CMA is not set
+# CONFIG_ZPOOL is not set
+# CONFIG_ZBUD is not set
+# CONFIG_ZSMALLOC is not set
+CONFIG_GENERIC_EARLY_IOREMAP=y
+# CONFIG_IDLE_PAGE_TRACKING is not set
+CONFIG_ARCH_HAS_PTE_DEVMAP=y
+# CONFIG_PERCPU_STATS is not set
+# CONFIG_GUP_BENCHMARK is not set
+CONFIG_ARCH_HAS_PTE_SPECIAL=y
+# end of Memory Management options
+
+# CONFIG_NET is not set
+CONFIG_HAVE_EBPF_JIT=y
+
+#
+# Device Drivers
+#
+# CONFIG_PCCARD is not set
+
+#
+# Generic Driver Options
+#
+# CONFIG_UEVENT_HELPER is not set
+# CONFIG_DEVTMPFS is not set
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+
+#
+# Firmware loader
+#
+# CONFIG_FW_LOADER is not set
+# end of Firmware loader
+
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
+CONFIG_GENERIC_CPU_AUTOPROBE=y
+CONFIG_GENERIC_CPU_VULNERABILITIES=y
+# end of Generic Driver Options
+
+#
+# Bus devices
+#
+# end of Bus devices
+
+# CONFIG_GNSS is not set
+# CONFIG_MTD is not set
+CONFIG_DTC=y
+CONFIG_OF=y
+# CONFIG_OF_UNITTEST is not set
+CONFIG_OF_FLATTREE=y
+CONFIG_OF_EARLY_FLATTREE=y
+CONFIG_OF_KOBJ=y
+CONFIG_OF_ADDRESS=y
+CONFIG_OF_IRQ=y
+CONFIG_OF_RESERVED_MEM=y
+# CONFIG_OF_OVERLAY is not set
+CONFIG_OF_DMA_DEFAULT_COHERENT=y
+CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_NULL_BLK is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS or INET not selected
+#
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=16
+CONFIG_BLK_DEV_RAM_SIZE=4096
+# CONFIG_CDROM_PKTCDVD is not set
+
+#
+# NVME Support
+#
+# CONFIG_NVME_FC is not set
+# end of NVME Support
+
+#
+# Misc devices
+#
+# CONFIG_DUMMY_IRQ is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_SRAM is not set
+# CONFIG_XILINX_SDFEC is not set
+# CONFIG_PVPANIC is not set
+# CONFIG_C2PORT is not set
+
+#
+# EEPROM support
+#
+# CONFIG_EEPROM_93CX6 is not set
+# end of EEPROM support
+
+#
+# Texas Instruments shared transport line discipline
+#
+# end of Texas Instruments shared transport line discipline
+
+#
+# Altera FPGA firmware download module (requires I2C)
+#
+
+#
+# Intel MIC & related support
+#
+# CONFIG_VOP_BUS is not set
+# end of Intel MIC & related support
+
+# CONFIG_ECHO is not set
+# end of Misc devices
+
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+CONFIG_SCSI_MOD=y
+# CONFIG_RAID_ATTRS is not set
+# CONFIG_SCSI is not set
+# end of SCSI device support
+
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+# CONFIG_TARGET_CORE is not set
+# CONFIG_MACINTOSH_DRIVERS is not set
+# CONFIG_NVM is not set
+
+#
+# Input device support
+#
+# CONFIG_INPUT is not set
+
+#
+# Hardware I/O ports
+#
+# CONFIG_SERIO is not set
+CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
+# CONFIG_GAMEPORT is not set
+# end of Hardware I/O ports
+# end of Input device support
+
+#
+# Character devices
+#
+CONFIG_TTY=y
+# CONFIG_VT is not set
+CONFIG_UNIX98_PTYS=y
+CONFIG_LEGACY_PTYS=y
+CONFIG_LEGACY_PTY_COUNT=256
+CONFIG_SERIAL_NONSTANDARD=y
+# CONFIG_N_HDLC is not set
+# CONFIG_TRACE_SINK is not set
+# CONFIG_PPC_EPAPR_HV_BYTECHAN is not set
+# CONFIG_NULL_TTY is not set
+CONFIG_LDISC_AUTOLOAD=y
+CONFIG_DEVMEM=y
+# CONFIG_DEVKMEM is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_UARTLITE is not set
+# CONFIG_SERIAL_SIFIVE is not set
+# CONFIG_SERIAL_SCCNXP is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_SERIAL_XILINX_PS_UART is not set
+# CONFIG_SERIAL_ARC is not set
+# CONFIG_SERIAL_FSL_LPUART is not set
+# CONFIG_SERIAL_FSL_LINFLEXUART is not set
+# CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
+# end of Serial drivers
+
+# CONFIG_SERIAL_DEV_BUS is not set
+# CONFIG_TTY_PRINTK is not set
+CONFIG_HVC_DRIVER=y
+CONFIG_HVC_UDBG=y
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_NVRAM is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_HANGCHECK_TIMER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_XILLYBUS is not set
+# end of Character devices
+
+# CONFIG_RANDOM_TRUST_CPU is not set
+# CONFIG_RANDOM_TRUST_BOOTLOADER is not set
+
+#
+# I2C support
+#
+# CONFIG_I2C is not set
+# end of I2C support
+
+# CONFIG_I3C is not set
+# CONFIG_SPI is not set
+# CONFIG_SPMI is not set
+# CONFIG_HSI is not set
+# CONFIG_PPS is not set
+
+#
+# PTP clock support
+#
+
+#
+# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
+#
+# end of PTP clock support
+
+# CONFIG_PINCTRL is not set
+# CONFIG_GPIOLIB is not set
+# CONFIG_W1 is not set
+# CONFIG_POWER_AVS is not set
+# CONFIG_POWER_RESET is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+# CONFIG_WATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+# CONFIG_SSB is not set
+CONFIG_BCMA_POSSIBLE=y
+# CONFIG_BCMA is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_ATMEL_FLEXCOM is not set
+# CONFIG_MFD_ATMEL_HLCDC is not set
+# CONFIG_MFD_MADERA is not set
+# CONFIG_MFD_HI6421_PMIC is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_MFD_KEMPLD is not set
+# CONFIG_MFD_MT6397 is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_ABX500_CORE is not set
+# CONFIG_MFD_SYSCON is not set
+# CONFIG_MFD_TI_AM335X_TSCADC is not set
+# CONFIG_MFD_TQMX86 is not set
+# end of Multifunction device drivers
+
+# CONFIG_REGULATOR is not set
+# CONFIG_MEDIA_SUPPORT is not set
+
+#
+# Graphics support
+#
+# CONFIG_DRM is not set
+
+#
+# ARM devices
+#
+# end of ARM devices
+
+#
+# ACP (Audio CoProcessor) Configuration
+#
+# end of ACP (Audio CoProcessor) Configuration
+
+#
+# Frame buffer Devices
+#
+# CONFIG_FB is not set
+# end of Frame buffer Devices
+
+#
+# Backlight & LCD device support
+#
+# CONFIG_LCD_CLASS_DEVICE is not set
+# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
+# end of Backlight & LCD device support
+# end of Graphics support
+
+# CONFIG_SOUND is not set
+CONFIG_USB_OHCI_LITTLE_ENDIAN=y
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_MMC is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_NEW_LEDS is not set
+# CONFIG_ACCESSIBILITY is not set
+CONFIG_EDAC_ATOMIC_SCRUB=y
+CONFIG_EDAC_SUPPORT=y
+CONFIG_RTC_LIB=y
+# CONFIG_RTC_CLASS is not set
+# CONFIG_DMADEVICES is not set
+
+#
+# DMABUF options
+#
+# CONFIG_SYNC_FILE is not set
+# CONFIG_DMABUF_HEAPS is not set
+# end of DMABUF options
+
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
+# CONFIG_VIRT_DRIVERS is not set
+# CONFIG_VIRTIO_MENU is not set
+
+#
+# Microsoft Hyper-V guest support
+#
+# end of Microsoft Hyper-V guest support
+
+# CONFIG_GREYBUS is not set
+# CONFIG_STAGING is not set
+# CONFIG_GOLDFISH is not set
+# CONFIG_HWSPINLOCK is not set
+
+#
+# Clock Source drivers
+#
+# CONFIG_MICROCHIP_PIT64B is not set
+# end of Clock Source drivers
+
+# CONFIG_MAILBOX is not set
+# CONFIG_IOMMU_SUPPORT is not set
+
+#
+# Remoteproc drivers
+#
+# CONFIG_REMOTEPROC is not set
+# end of Remoteproc drivers
+
+#
+# Rpmsg drivers
+#
+# CONFIG_RPMSG_VIRTIO is not set
+# end of Rpmsg drivers
+
+# CONFIG_SOUNDWIRE is not set
+
+#
+# SOC (System On Chip) specific Drivers
+#
+
+#
+# Amlogic SoC drivers
+#
+# end of Amlogic SoC drivers
+
+#
+# Aspeed SoC drivers
+#
+# end of Aspeed SoC drivers
+
+#
+# Broadcom SoC drivers
+#
+# end of Broadcom SoC drivers
+
+#
+# NXP/Freescale QorIQ SoC drivers
+#
+# CONFIG_QUICC_ENGINE is not set
+# end of NXP/Freescale QorIQ SoC drivers
+
+#
+# i.MX SoC drivers
+#
+# end of i.MX SoC drivers
+
+#
+# Qualcomm SoC drivers
+#
+# end of Qualcomm SoC drivers
+
+# CONFIG_SOC_TI is not set
+
+#
+# Xilinx SoC drivers
+#
+# CONFIG_XILINX_VCU is not set
+# end of Xilinx SoC drivers
+# end of SOC (System On Chip) specific Drivers
+
+# CONFIG_PM_DEVFREQ is not set
+# CONFIG_EXTCON is not set
+# CONFIG_MEMORY is not set
+# CONFIG_IIO is not set
+# CONFIG_PWM is not set
+
+#
+# IRQ chip support
+#
+CONFIG_IRQCHIP=y
+# CONFIG_AL_FIC is not set
+# end of IRQ chip support
+
+# CONFIG_IPACK_BUS is not set
+# CONFIG_RESET_CONTROLLER is not set
+
+#
+# PHY Subsystem
+#
+# CONFIG_GENERIC_PHY is not set
+# CONFIG_BCM_KONA_USB2_PHY is not set
+# CONFIG_PHY_CADENCE_DP is not set
+# CONFIG_PHY_CADENCE_DPHY is not set
+# CONFIG_PHY_FSL_IMX8MQ_USB is not set
+# CONFIG_PHY_MIXEL_MIPI_DPHY is not set
+# CONFIG_PHY_PXA_28NM_HSIC is not set
+# CONFIG_PHY_PXA_28NM_USB2 is not set
+# CONFIG_PHY_INTEL_EMMC is not set
+# end of PHY Subsystem
+
+# CONFIG_POWERCAP is not set
+# CONFIG_MCB is not set
+# CONFIG_RAS is not set
+
+#
+# Android
+#
+# CONFIG_ANDROID is not set
+# end of Android
+
+# CONFIG_LIBNVDIMM is not set
+# CONFIG_DAX is not set
+# CONFIG_NVMEM is not set
+
+#
+# HW tracing support
+#
+# CONFIG_STM is not set
+# CONFIG_INTEL_TH is not set
+# end of HW tracing support
+
+# CONFIG_FPGA is not set
+# CONFIG_FSI is not set
+# CONFIG_SIOX is not set
+# CONFIG_SLIMBUS is not set
+# CONFIG_INTERCONNECT is not set
+# CONFIG_COUNTER is not set
+# end of Device Drivers
+
+#
+# File systems
+#
+CONFIG_DCACHE_WORD_ACCESS=y
+# CONFIG_VALIDATE_FS_PARSER is not set
+CONFIG_FS_IOMAP=y
+# CONFIG_EXT2_FS is not set
+# CONFIG_EXT3_FS is not set
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_USE_FOR_EXT2=y
+# CONFIG_EXT4_FS_POSIX_ACL is not set
+# CONFIG_EXT4_FS_SECURITY is not set
+# CONFIG_EXT4_DEBUG is not set
+CONFIG_JBD2=y
+# CONFIG_JBD2_DEBUG is not set
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_GFS2_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+# CONFIG_F2FS_FS is not set
+# CONFIG_FS_DAX is not set
+# CONFIG_EXPORTFS_BLOCK_OPS is not set
+# CONFIG_FILE_LOCKING is not set
+# CONFIG_FS_ENCRYPTION is not set
+# CONFIG_FS_VERITY is not set
+# CONFIG_DNOTIFY is not set
+# CONFIG_INOTIFY_USER is not set
+# CONFIG_FANOTIFY is not set
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_FUSE_FS is not set
+# CONFIG_OVERLAY_FS is not set
+
+#
+# Caches
+#
+# CONFIG_FSCACHE is not set
+# end of Caches
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
+# CONFIG_UDF_FS is not set
+# end of CD-ROM/DVD Filesystems
+
+#
+# DOS/FAT/NT Filesystems
+#
+# CONFIG_MSDOS_FS is not set
+# CONFIG_VFAT_FS is not set
+# CONFIG_NTFS_FS is not set
+# end of DOS/FAT/NT Filesystems
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+# CONFIG_PROC_KCORE is not set
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+# CONFIG_PROC_CHILDREN is not set
+CONFIG_KERNFS=y
+CONFIG_SYSFS=y
+# CONFIG_HUGETLBFS is not set
+CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
+# CONFIG_CONFIGFS_FS is not set
+# end of Pseudo filesystems
+
+# CONFIG_MISC_FILESYSTEMS is not set
+# CONFIG_NLS is not set
+# CONFIG_UNICODE is not set
+# end of File systems
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY_DMESG_RESTRICT is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
+# CONFIG_HARDENED_USERCOPY is not set
+# CONFIG_FORTIFY_SOURCE is not set
+# CONFIG_STATIC_USERMODEHELPER is not set
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_LSM="lockdown,yama,loadpin,safesetid,integrity"
+
+#
+# Kernel hardening options
+#
+
+#
+# Memory initialization
+#
+CONFIG_INIT_STACK_NONE=y
+# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
+# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
+# end of Memory initialization
+# end of Kernel hardening options
+# end of Security options
+
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+CONFIG_CRYPTO_ALGAPI=y
+CONFIG_CRYPTO_ALGAPI2=y
+CONFIG_CRYPTO_HASH=y
+CONFIG_CRYPTO_HASH2=y
+# CONFIG_CRYPTO_MANAGER is not set
+CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
+# CONFIG_CRYPTO_NULL is not set
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
+
+#
+# Public-key cryptography
+#
+# CONFIG_CRYPTO_RSA is not set
+# CONFIG_CRYPTO_DH is not set
+# CONFIG_CRYPTO_ECDH is not set
+# CONFIG_CRYPTO_ECRDSA is not set
+# CONFIG_CRYPTO_CURVE25519 is not set
+
+#
+# Authenticated Encryption with Associated Data
+#
+# CONFIG_CRYPTO_CCM is not set
+# CONFIG_CRYPTO_GCM is not set
+# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
+# CONFIG_CRYPTO_AEGIS128 is not set
+# CONFIG_CRYPTO_SEQIV is not set
+# CONFIG_CRYPTO_ECHAINIV is not set
+
+#
+# Block modes
+#
+# CONFIG_CRYPTO_CBC is not set
+# CONFIG_CRYPTO_CFB is not set
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+# CONFIG_CRYPTO_ECB is not set
+# CONFIG_CRYPTO_LRW is not set
+# CONFIG_CRYPTO_OFB is not set
+# CONFIG_CRYPTO_PCBC is not set
+# CONFIG_CRYPTO_XTS is not set
+# CONFIG_CRYPTO_KEYWRAP is not set
+# CONFIG_CRYPTO_ADIANTUM is not set
+# CONFIG_CRYPTO_ESSIV is not set
+
+#
+# Hash modes
+#
+# CONFIG_CRYPTO_CMAC is not set
+# CONFIG_CRYPTO_HMAC is not set
+# CONFIG_CRYPTO_XCBC is not set
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRC32C=y
+# CONFIG_CRYPTO_CRC32 is not set
+# CONFIG_CRYPTO_XXHASH is not set
+# CONFIG_CRYPTO_BLAKE2B is not set
+# CONFIG_CRYPTO_BLAKE2S is not set
+# CONFIG_CRYPTO_CRCT10DIF is not set
+# CONFIG_CRYPTO_GHASH is not set
+# CONFIG_CRYPTO_POLY1305 is not set
+# CONFIG_CRYPTO_MD4 is not set
+# CONFIG_CRYPTO_MD5 is not set
+# CONFIG_CRYPTO_MD5_PPC is not set
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+# CONFIG_CRYPTO_SHA1 is not set
+# CONFIG_CRYPTO_SHA1_PPC is not set
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_SHA3 is not set
+# CONFIG_CRYPTO_SM3 is not set
+# CONFIG_CRYPTO_STREEBOG is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+# CONFIG_CRYPTO_AES is not set
+# CONFIG_CRYPTO_AES_TI is not set
+# CONFIG_CRYPTO_ANUBIS is not set
+# CONFIG_CRYPTO_ARC4 is not set
+# CONFIG_CRYPTO_BLOWFISH is not set
+# CONFIG_CRYPTO_CAMELLIA is not set
+# CONFIG_CRYPTO_CAST5 is not set
+# CONFIG_CRYPTO_CAST6 is not set
+# CONFIG_CRYPTO_DES is not set
+# CONFIG_CRYPTO_FCRYPT is not set
+# CONFIG_CRYPTO_KHAZAD is not set
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_CHACHA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+# CONFIG_CRYPTO_SERPENT is not set
+# CONFIG_CRYPTO_SM4 is not set
+# CONFIG_CRYPTO_TEA is not set
+# CONFIG_CRYPTO_TWOFISH is not set
+
+#
+# Compression
+#
+# CONFIG_CRYPTO_DEFLATE is not set
+# CONFIG_CRYPTO_LZO is not set
+# CONFIG_CRYPTO_842 is not set
+# CONFIG_CRYPTO_LZ4 is not set
+# CONFIG_CRYPTO_LZ4HC is not set
+# CONFIG_CRYPTO_ZSTD is not set
+
+#
+# Random Number Generation
+#
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_DRBG_MENU is not set
+# CONFIG_CRYPTO_JITTERENTROPY is not set
+
+#
+# Crypto library routines
+#
+# CONFIG_CRYPTO_LIB_BLAKE2S is not set
+# CONFIG_CRYPTO_LIB_CHACHA is not set
+# CONFIG_CRYPTO_LIB_CURVE25519 is not set
+CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
+# CONFIG_CRYPTO_LIB_POLY1305 is not set
+# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
+# CONFIG_CRYPTO_HW is not set
+
+#
+# Certificates for signature checking
+#
+# end of Certificates for signature checking
+
+#
+# Library routines
+#
+# CONFIG_PACKING is not set
+CONFIG_BITREVERSE=y
+CONFIG_GENERIC_STRNCPY_FROM_USER=y
+CONFIG_GENERIC_STRNLEN_USER=y
+# CONFIG_CORDIC is not set
+CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
+CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
+# CONFIG_CRC_CCITT is not set
+CONFIG_CRC16=y
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC32_SELFTEST is not set
+CONFIG_CRC32_SLICEBY8=y
+# CONFIG_CRC32_SLICEBY4 is not set
+# CONFIG_CRC32_SARWATE is not set
+# CONFIG_CRC32_BIT is not set
+# CONFIG_CRC64 is not set
+# CONFIG_CRC4 is not set
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+# CONFIG_CRC8 is not set
+# CONFIG_RANDOM32_SELFTEST is not set
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_XZ_DEC=y
+# CONFIG_XZ_DEC_X86 is not set
+CONFIG_XZ_DEC_POWERPC=y
+# CONFIG_XZ_DEC_IA64 is not set
+# CONFIG_XZ_DEC_ARM is not set
+# CONFIG_XZ_DEC_ARMTHUMB is not set
+# CONFIG_XZ_DEC_SPARC is not set
+CONFIG_XZ_DEC_BCJ=y
+# CONFIG_XZ_DEC_TEST is not set
+CONFIG_DECOMPRESS_XZ=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT_MAP=y
+CONFIG_HAS_DMA=y
+CONFIG_NEED_SG_DMA_LENGTH=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_ARCH_DMA_ADDR_T_64BIT=y
+CONFIG_DMA_DECLARE_COHERENT=y
+# CONFIG_DMA_API_DEBUG is not set
+CONFIG_IOMMU_HELPER=y
+# CONFIG_IRQ_POLL is not set
+CONFIG_LIBFDT=y
+CONFIG_ARCH_HAS_PMEM_API=y
+CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
+CONFIG_ARCH_HAS_UACCESS_MCSAFE=y
+CONFIG_SBITMAP=y
+# CONFIG_STRING_SELFTEST is not set
+# end of Library routines
+
+#
+# Kernel hacking
+#
+
+#
+# printk and dmesg options
+#
+# CONFIG_PRINTK_TIME is not set
+# CONFIG_PRINTK_CALLER is not set
+CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
+CONFIG_CONSOLE_LOGLEVEL_QUIET=4
+CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
+# CONFIG_SYMBOLIC_ERRNAME is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# end of printk and dmesg options
+
+#
+# Compile-time checks and compiler options
+#
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=2048
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_READABLE_ASM is not set
+# CONFIG_HEADERS_INSTALL is not set
+CONFIG_OPTIMIZE_INLINING=y
+# CONFIG_DEBUG_SECTION_MISMATCH is not set
+CONFIG_SECTION_MISMATCH_WARN_ONLY=y
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# end of Compile-time checks and compiler options
+
+#
+# Generic Kernel Debugging Instruments
+#
+# CONFIG_MAGIC_SYSRQ is not set
+# CONFIG_DEBUG_FS is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
+# CONFIG_UBSAN is not set
+CONFIG_UBSAN_ALIGNMENT=y
+# end of Generic Kernel Debugging Instruments
+
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_MISC is not set
+
+#
+# Memory Debugging
+#
+# CONFIG_PAGE_EXTENSION is not set
+# CONFIG_DEBUG_PAGEALLOC is not set
+# CONFIG_PAGE_OWNER is not set
+# CONFIG_PAGE_POISONING is not set
+# CONFIG_DEBUG_OBJECTS is not set
+# CONFIG_SLUB_STATS is not set
+CONFIG_HAVE_DEBUG_KMEMLEAK=y
+# CONFIG_DEBUG_KMEMLEAK is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+# CONFIG_SCHED_STACK_END_CHECK is not set
+# CONFIG_DEBUG_VM is not set
+CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
+# CONFIG_DEBUG_VIRTUAL is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
+# CONFIG_DEBUG_STACKOVERFLOW is not set
+CONFIG_CC_HAS_KASAN_GENERIC=y
+CONFIG_KASAN_STACK=1
+# end of Memory Debugging
+
+# CONFIG_DEBUG_SHIRQ is not set
+
+#
+# Debug Oops, Lockups and Hangs
+#
+# CONFIG_PANIC_ON_OOPS is not set
+CONFIG_PANIC_ON_OOPS_VALUE=0
+# CONFIG_SOFTLOCKUP_DETECTOR is not set
+# CONFIG_HARDLOCKUP_DETECTOR is not set
+# CONFIG_DETECT_HUNG_TASK is not set
+# CONFIG_WQ_WATCHDOG is not set
+# end of Debug Oops, Lockups and Hangs
+
+#
+# Scheduler Debugging
+#
+# CONFIG_SCHED_DEBUG is not set
+# CONFIG_SCHEDSTATS is not set
+# end of Scheduler Debugging
+
+# CONFIG_DEBUG_TIMEKEEPING is not set
+
+#
+# Lock Debugging (spinlocks, mutexes, etc...)
+#
+CONFIG_LOCK_DEBUGGING_SUPPORT=y
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
+# CONFIG_DEBUG_RWSEMS is not set
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_DEBUG_ATOMIC_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_LOCK_TORTURE_TEST is not set
+# CONFIG_WW_MUTEX_SELFTEST is not set
+# end of Lock Debugging (spinlocks, mutexes, etc...)
+
+# CONFIG_STACKTRACE is not set
+# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
+# CONFIG_DEBUG_KOBJECT is not set
+
+#
+# Debug kernel data structures
+#
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_PLIST is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_BUG_ON_DATA_CORRUPTION is not set
+# end of Debug kernel data structures
+
+# CONFIG_DEBUG_CREDENTIALS is not set
+
+#
+# RCU Debugging
+#
+# CONFIG_RCU_PERF_TEST is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_RCU_TRACE is not set
+# CONFIG_RCU_EQS_DEBUG is not set
+# end of RCU Debugging
+
+# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_LATENCYTOP is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
+CONFIG_HAVE_C_RECORDMCOUNT=y
+CONFIG_TRACING_SUPPORT=y
+# CONFIG_FTRACE is not set
+# CONFIG_SAMPLES is not set
+CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
+# CONFIG_STRICT_DEVMEM is not set
+
+#
+# powerpc Debugging
+#
+CONFIG_PPC_DISABLE_WERROR=y
+CONFIG_PRINT_STACK_DEPTH=64
+# CONFIG_CODE_PATCHING_SELFTEST is not set
+# CONFIG_FTR_FIXUP_SELFTEST is not set
+# CONFIG_MSI_BITMAP_SELFTEST is not set
+# CONFIG_PPC_IRQ_SOFT_MASK_DEBUG is not set
+CONFIG_XMON=y
+CONFIG_XMON_DEFAULT=y
+CONFIG_XMON_DISASSEMBLY=y
+# CONFIG_XMON_DEFAULT_RO_MODE is not set
+CONFIG_DEBUGGER=y
+# CONFIG_BOOTX_TEXT is not set
+CONFIG_PPC_EARLY_DEBUG=y
+# CONFIG_PPC_EARLY_DEBUG_MEMCONS is not set
+CONFIG_PPC_EARLY_DEBUG_MICROWATT=y
+# CONFIG_PPC_FAST_ENDIAN_SWITCH is not set
+# end of powerpc Debugging
+
+#
+# Kernel Testing and Coverage
+#
+# CONFIG_KUNIT is not set
+# CONFIG_NOTIFIER_ERROR_INJECTION is not set
+# CONFIG_FAULT_INJECTION is not set
+CONFIG_ARCH_HAS_KCOV=y
+CONFIG_CC_HAS_SANCOV_TRACE_PC=y
+# CONFIG_KCOV is not set
+# CONFIG_RUNTIME_TESTING_MENU is not set
+# CONFIG_MEMTEST is not set
+# end of Kernel Testing and Coverage
+# end of Kernel hacking
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index 1f8025383caa..5b701acc6afa 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -20,6 +20,7 @@ source "arch/powerpc/platforms/embedded6xx/Kconfig"
 source "arch/powerpc/platforms/44x/Kconfig"
 source "arch/powerpc/platforms/40x/Kconfig"
 source "arch/powerpc/platforms/amigaone/Kconfig"
+source "arch/powerpc/platforms/microwatt/Kconfig"
 
 config KVM_GUEST
 	bool "KVM Guest support"
diff --git a/arch/powerpc/platforms/Makefile b/arch/powerpc/platforms/Makefile
index 143d4417f6cc..edcb54cdb1a8 100644
--- a/arch/powerpc/platforms/Makefile
+++ b/arch/powerpc/platforms/Makefile
@@ -22,3 +22,4 @@ obj-$(CONFIG_PPC_CELL)		+= cell/
 obj-$(CONFIG_PPC_PS3)		+= ps3/
 obj-$(CONFIG_EMBEDDED6xx)	+= embedded6xx/
 obj-$(CONFIG_AMIGAONE)		+= amigaone/
+obj-$(CONFIG_PPC_MICROWATT)	+= microwatt/
diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
new file mode 100644
index 000000000000..981f722ae9ce
--- /dev/null
+++ b/arch/powerpc/platforms/microwatt/Kconfig
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+config PPC_MICROWATT
+	depends on PPC64 && PPC_BOOK3S
+	bool "Microwatt SoC platform"
+	select PPC_XICS
+	select PPC_NATIVE
+	help
+          This option enables support for FPGA-based Microwatt implementations.
+
diff --git a/arch/powerpc/platforms/microwatt/Makefile b/arch/powerpc/platforms/microwatt/Makefile
new file mode 100644
index 000000000000..e6885b3b2ee7
--- /dev/null
+++ b/arch/powerpc/platforms/microwatt/Makefile
@@ -0,0 +1 @@
+obj-y	+= setup.o
diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/platforms/microwatt/setup.c
new file mode 100644
index 000000000000..3cfc5955a6fe
--- /dev/null
+++ b/arch/powerpc/platforms/microwatt/setup.c
@@ -0,0 +1,40 @@
+/*
+ * Microwatt FPGA-based SoC platform setup code.
+ *
+ * Copyright 2020 Paul Mackerras (paulus@ozlabs.org), IBM Corp.
+ */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/stddef.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <asm/machdep.h>
+#include <asm/time.h>
+
+static void __init microwatt_calibrate_decr(void)
+{
+	ppc_tb_freq = 100000000;
+	ppc_proc_freq = 100000000;
+}
+
+static void __init microwatt_setup_arch(void)
+{
+}
+
+static void __init microwatt_init_IRQ(void)
+{
+}
+
+static int __init microwatt_probe(void)
+{
+	return of_machine_is_compatible("microwatt-soc");
+}
+
+define_machine(microwatt) {
+	.name			= "microwatt",
+	.probe			= microwatt_probe,
+	.setup_arch		= microwatt_setup_arch,
+	.init_IRQ		= microwatt_init_IRQ,
+	.calibrate_decr		= microwatt_calibrate_decr,
+};
-- 
2.25.3

