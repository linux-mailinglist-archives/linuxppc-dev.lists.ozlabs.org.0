Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B0864E520
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 01:24:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NY8wz6BClz3bfK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 11:24:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EzSSUSzT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NY8w12F8Dz2xnN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 11:23:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EzSSUSzT;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NY8vy1Q8Dz4xFy;
	Fri, 16 Dec 2022 11:23:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1671150207;
	bh=6SZ/GIJsnTif2qsFjwYpH0MY0+2uiMRi7AdhMGclIS8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EzSSUSzTZ4iHWs2jqzsvLiN7xoqnCBFF2IlOMtTo3QdDmgGucI13VshbtK+nDmAI7
	 IVXKuA8cFCHAH32HhTVwNcV8pBCYhKditGznNYZmu7tbPYyhMgeD+tFSFSiYubXAfG
	 I9D/f9WIpOp9We+CPrwt7XAg8wYwVu5mdg6FkytnpwYJlkE8ceVgpRmV7z2ErDxwf6
	 d/hlLSDiT7DH3csyyUA/ba397xoQ2PchGub2kyxgkwVrycO6eUVU5EQwpi9abR7l7S
	 KJnUeDL5v+runFYr1XE4NgO8Xx2YLnqiXDgUe4IFNcCEvbDYQsTk8463ecZwLoAyaI
	 q4aN8J26aCUJQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>, Benjamin Gray <bgray@linux.ibm.com>
Subject: Re: [PATCH v10 8/9] powerpc/code-patching: Use temporary mm for
 Radix MMU
In-Reply-To: <Y5uA4G7WDaL3uG8Y@dev-arch.thelio-3990X>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
 <20221109045112.187069-9-bgray@linux.ibm.com>
 <Y5uA4G7WDaL3uG8Y@dev-arch.thelio-3990X>
Date: Fri, 16 Dec 2022 11:23:22 +1100
Message-ID: <87zgboi4cl.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ajd@linux.ibm.com, jniethe5@gmail.com, llvm@lists.linux.dev, npiggin@gmail.com, cmr@bluescreens.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <nathan@kernel.org> writes:
> Hi Benjamin,
>
> On Wed, Nov 09, 2022 at 03:51:11PM +1100, Benjamin Gray wrote:
>> From: "Christopher M. Riedl" <cmr@bluescreens.de>
>> 
>> x86 supports the notion of a temporary mm which restricts access to
>> temporary PTEs to a single CPU. A temporary mm is useful for situations
>> where a CPU needs to perform sensitive operations (such as patching a
>> STRICT_KERNEL_RWX kernel) requiring temporary mappings without exposing
>> said mappings to other CPUs. Another benefit is that other CPU TLBs do
>> not need to be flushed when the temporary mm is torn down.
>> 
>> Mappings in the temporary mm can be set in the userspace portion of the
>> address-space.
>> 
>> Interrupts must be disabled while the temporary mm is in use. HW
>> breakpoints, which may have been set by userspace as watchpoints on
>> addresses now within the temporary mm, are saved and disabled when
>> loading the temporary mm. The HW breakpoints are restored when unloading
>> the temporary mm. All HW breakpoints are indiscriminately disabled while
>> the temporary mm is in use - this may include breakpoints set by perf.
>> 
>> Use the `poking_init` init hook to prepare a temporary mm and patching
>> address. Initialize the temporary mm by copying the init mm. Choose a
>> randomized patching address inside the temporary mm userspace address
>> space. The patching address is randomized between PAGE_SIZE and
>> DEFAULT_MAP_WINDOW-PAGE_SIZE.
>> 
>> Bits of entropy with 64K page size on BOOK3S_64:
>> 
>> 	bits of entropy = log2(DEFAULT_MAP_WINDOW_USER64 / PAGE_SIZE)
>> 
>> 	PAGE_SIZE=64K, DEFAULT_MAP_WINDOW_USER64=128TB
>> 	bits of entropy = log2(128TB / 64K)
>> 	bits of entropy = 31
>> 
>> The upper limit is DEFAULT_MAP_WINDOW due to how the Book3s64 Hash MMU
>> operates - by default the space above DEFAULT_MAP_WINDOW is not
>> available. Currently the Hash MMU does not use a temporary mm so
>> technically this upper limit isn't necessary; however, a larger
>> randomization range does not further "harden" this overall approach and
>> future work may introduce patching with a temporary mm on Hash as well.
>> 
>> Randomization occurs only once during initialization for each CPU as it
>> comes online.
>> 
>> The patching page is mapped with PAGE_KERNEL to set EAA[0] for the PTE
>> which ignores the AMR (so no need to unlock/lock KUAP) according to
>> PowerISA v3.0b Figure 35 on Radix.
>> 
>> Based on x86 implementation:
>> 
>> commit 4fc19708b165
>> ("x86/alternatives: Initialize temporary mm for patching")
>> 
>> and:
>> 
>> commit b3fd8e83ada0
>> ("x86/alternatives: Use temporary mm for text poking")
>> 
>> From: Benjamin Gray <bgray@linux.ibm.com>
>> 
>> Synchronisation is done according to ISA 3.1B Book 3 Chapter 13
>> "Synchronization Requirements for Context Alterations". Switching the mm
>> is a change to the PID, which requires a CSI before and after the change,
>> and a hwsync between the last instruction that performs address
>> translation for an associated storage access.
>> 
>> Instruction fetch is an associated storage access, but the instruction
>> address mappings are not being changed, so it should not matter which
>> context they use. We must still perform a hwsync to guard arbitrary
>> prior code that may have accessed a userspace address.
>> 
>> TLB invalidation is local and VA specific. Local because only this core
>> used the patching mm, and VA specific because we only care that the
>> writable mapping is purged. Leaving the other mappings intact is more
>> efficient, especially when performing many code patches in a row (e.g.,
>> as ftrace would).
>> 
>> Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>
>> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
>
> Apologies if this has already been reported or fixed, I did a quick
> search of lore and found nothing. I just bisected a crash on boot in
> QEMU to this commit in next-20221215 as c28c15b6d28a
> ("powerpc/code-patching: Use temporary mm for Radix MMU") (initrd is
> available at [1], just 'zstd -d' before using it):

Thanks. No I don't think it's been reported.

It's a DEBUG_VM assertion, my least favourite config option.

I can reproduce it here so shouldn't need any more input from you, if
you want to make your CI green you could disable DEBUG_VM temporarily :)

cheers


> $ qemu-system-ppc64 \
> -device ipmi-bmc-sim,id=bmc0 \
> -device isa-ipmi-bt,bmc=bmc0,irq=10 \
> -machine powernv \
> -kernel arch/powerpc/boot/zImage.epapr
> -display none \
> -initrd rootfs.cpio \
> -m 2G \
> -nodefaults \
> -no-reboot \
> -serial mon:stdio
> ...
> [    0.000000] dt-cpu-ftrs: setup for ISA 3000
> [    0.000000] dt-cpu-ftrs: final cpu/mmu features = 0x0003c06b8f5fb187 0x3c007041
> [    0.000000] Activating Kernel Userspace Access Prevention
> [    0.000000] Activating Kernel Userspace Execution Prevention
> [    0.000000] radix-mmu: Mapped 0x0000000000000000-0x0000000002760000 with 64.0 KiB pages (exec)
> [    0.000000] radix-mmu: Mapped 0x0000000002760000-0x0000000080000000 with 64.0 KiB pages
> [    0.000000] radix-mmu: Initializing Radix MMU
> [    0.000000] Linux version 6.1.0-rc2+ (nathan@dev-arch.thelio-3990X) (powerpc64-linux-gcc (GCC) 10.4.0, GNU ld (GNU Binutils) 2.39) #1 SMP Thu Dec 15 12:26:19 MST 2022
> [    0.000000] Found initrd at 0xc000000028000000:0xc0000000288c7400
> [    0.000000] Hardware name: IBM PowerNV (emulated by qemu) POWER9 0x4e1200 opal:v7.0 PowerNV
> ...
> [    0.208320] ------------[ cut here ]------------
> [    0.210605] kernel BUG at arch/powerpc/mm/pgtable.c:333!
> [    0.212314] Oops: Exception in kernel mode, sig: 5 [#1]
> [    0.213324] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
> [    0.214793] Modules linked in:
> [    0.215781] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.1.0-rc2+ #1
> [    0.216643] Hardware name: IBM PowerNV (emulated by qemu) POWER9 0x4e1200 opal:v7.0 PowerNV
> [    0.217958] NIP:  c000000000089730 LR: c000000000089720 CTR: 0000000000000000
> [    0.218949] REGS: c000000003587740 TRAP: 0700   Not tainted  (6.1.0-rc2+)
> [    0.219891] MSR:  9000000002029033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 24002844  XER: 00000000
> [    0.221323] CFAR: c00000000008a140 IRQMASK: 1
> [    0.221323] GPR00: c000000000089720 c0000000035879e0 c000000001d97000 c00c00000000d4c0
> [    0.221323] GPR04: 0000000000000e08 0000000000000015 0000000003520009 0000000003530005
> [    0.221323] GPR08: 0000000005005303 0000000000000001 c00c000000000000 0000000000000009
> [    0.221323] GPR12: c0000000000898e0 c000000002cc0000 c000000000012678 0000000000000000
> [    0.221323] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    0.221323] GPR20: 0000000000000000 0000000000000000 0000000000000000 c0000000029e3b60
> [    0.221323] GPR24: 00004b4678380000 c00000000350d700 00004b4678380000 c0000000035300c0
> [    0.221323] GPR28: 0000000000000000 c000000002a3aef0 0000000060000000 0000000000000000
> [    0.230113] NIP [c000000000089730] assert_pte_locked+0x180/0x1a0
> [    0.232181] LR [c000000000089720] assert_pte_locked+0x170/0x1a0
> [    0.233380] Call Trace:
> [    0.234106] [c0000000035879e0] [0000000060000000] 0x60000000 (unreliable)
> [    0.235821] [c000000003587a00] [c0000000000a7c58] patch_instruction+0x618/0x6d0
> [    0.237128] [c000000003587a80] [c00000000005a53c] arch_prepare_kprobe+0xfc/0x2d0
> [    0.238420] [c000000003587b00] [c0000000002b4690] register_kprobe+0x520/0x7c0
> [    0.239763] [c000000003587b70] [c000000002011d3c] arch_init_kprobes+0x28/0x3c
> [    0.241842] [c000000003587b90] [c000000002035848] init_kprobes+0x108/0x184
> [    0.244858] [c000000003587c00] [c000000000012090] do_one_initcall+0x60/0x2e0
> [    0.248262] [c000000003587cd0] [c000000002004f40] kernel_init_freeable+0x1f0/0x3e0
> [    0.251865] [c000000003587da0] [c0000000000126a4] kernel_init+0x34/0x1d0
> [    0.254577] [c000000003587e10] [c00000000000cf5c] ret_from_kernel_thread+0x5c/0x64
> [    0.258051] Code: 7c0802a6 706900a0 7d290074 7929d182 f8010010 f821ffe1 0b090000 480009dd 60000000 81230028 7d290034 5529d97e <0b090000> 38210020 e8010010 7c0803a6
> [    0.264482] ---[ end trace 0000000000000000 ]---
> [    0.266857]
> [    1.269398] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000005
> [    1.274246] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000005 ]---
>
> This was initially noticed in our CI [2] but it is not related to clang,
> as I did the bisect with GCC 10.4.0 from [3]. Attached is the .config
> but it is just Fedora's rawhide configuration [4] if you have to grab it
> again.
>
> If there is any further information I can provide or patches I can test,
> I am more than happy to do so.
>
> Cheers,
> Nathan
>
> [1]: https://github.com/ClangBuiltLinux/boot-utils/blob/64b7d421f4d60b45e09fa81f0fe3d4ad96c99d6c/images/ppc64le/rootfs.cpio.zst
> [2]: https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/3703987970/jobs/6277411497
> [3]: https://mirrors.edge.kernel.org/pub/tools/crosstool/
> [4]: https://src.fedoraproject.org/rpms/kernel/raw/rawhide/f/kernel-ppc64le-fedora.config
>
> # bad: [459c73db4069c27c1d4a0e20d055b837396364b8] Add linux-next specific files for 20221215
> # good: [6f1f5caed5bfadd1cc8bdb0563eb8874dc3573ca] Merge tag 'for-linus-6.2-ofs1' of git://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux
> git bisect start '459c73db4069c27c1d4a0e20d055b837396364b8' '6f1f5caed5bfadd1cc8bdb0563eb8874dc3573ca'
> # bad: [6cc557c9b10bbf1f95abb2a871a4c9a3e3705500] Merge branch 'timers/drivers/next' of git://git.linaro.org/people/daniel.lezcano/linux.git
> git bisect bad 6cc557c9b10bbf1f95abb2a871a4c9a3e3705500
> # bad: [e31516b742ca321c68ff69f63ecbcc5f3458a9d0] Merge branch 'dev' of git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
> git bisect bad e31516b742ca321c68ff69f63ecbcc5f3458a9d0
> # good: [532890942f39cc3008e62d48674fb26b19500770] Merge branch 'for-next/core' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
> git bisect good 532890942f39cc3008e62d48674fb26b19500770
> # good: [fc9dbec4fb187b43d79613f8ad7a42164bd7f748] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git
> git bisect good fc9dbec4fb187b43d79613f8ad7a42164bd7f748
> # bad: [dad765add65d564591ad6bd26d3299d672cd20d4] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
> git bisect bad dad765add65d564591ad6bd26d3299d672cd20d4
> # bad: [505ea33089dcfc3ee3201b0fcb94751165805413] powerpc/64: Add big-endian ELFv2 flavour to crypto VMX asm generation
> git bisect bad 505ea33089dcfc3ee3201b0fcb94751165805413
> # good: [5825603f67bc5ff445a1847302884154f0afa627] powerpc/microwatt: Add litesd
> git bisect good 5825603f67bc5ff445a1847302884154f0afa627
> # good: [a9ffb8ee7b65a468474d6a2be7e9cca4b8f8ea5f] powerpc: Use "grep -E" instead of "egrep"
> git bisect good a9ffb8ee7b65a468474d6a2be7e9cca4b8f8ea5f
> # good: [d5090716be6791ada9ee142163a4934c1c147aaa] powerpc/book3e: remove #include <generated/utsrelease.h>
> git bisect good d5090716be6791ada9ee142163a4934c1c147aaa
> # good: [0f0a0a6091e678b1a75078ecd6b02176f3228dbb] cxl: Use radix__flush_all_mm instead of generic flush_all_mm
> git bisect good 0f0a0a6091e678b1a75078ecd6b02176f3228dbb
> # bad: [c28c15b6d28a776538482101522cbcd9f906b15c] powerpc/code-patching: Use temporary mm for Radix MMU
> git bisect bad c28c15b6d28a776538482101522cbcd9f906b15c
> # good: [274d842fa1efd9449e62222c8896e0be11621f1f] powerpc/tlb: Add local flush for page given mm_struct and psize
> git bisect good 274d842fa1efd9449e62222c8896e0be11621f1f
> # first bad commit: [c28c15b6d28a776538482101522cbcd9f906b15c] powerpc/code-patching: Use temporary mm for Radix MMU
> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/powerpc 6.1.0-rc2 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT="powerpc64-linux-gcc (GCC) 10.4.0"
> CONFIG_CC_IS_GCC=y
> CONFIG_GCC_VERSION=100400
> CONFIG_CLANG_VERSION=0
> CONFIG_AS_IS_GNU=y
> CONFIG_AS_VERSION=23900
> CONFIG_LD_IS_BFD=y
> CONFIG_LD_VERSION=23900
> CONFIG_LLD_VERSION=0
> CONFIG_RUST_IS_AVAILABLE=y
> CONFIG_CC_HAS_ASM_INLINE=y
> CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
> CONFIG_PAHOLE_VERSION=124
> CONFIG_IRQ_WORK=y
> CONFIG_BUILDTIME_TABLE_SORT=y
> CONFIG_THREAD_INFO_IN_TASK=y
>
> #
> # General setup
> #
> CONFIG_INIT_ENV_ARG_LIMIT=32
> # CONFIG_COMPILE_TEST is not set
> # CONFIG_WERROR is not set
> CONFIG_LOCALVERSION=""
> # CONFIG_LOCALVERSION_AUTO is not set
> CONFIG_BUILD_SALT=""
> CONFIG_HAVE_KERNEL_GZIP=y
> CONFIG_HAVE_KERNEL_XZ=y
> CONFIG_KERNEL_GZIP=y
> # CONFIG_KERNEL_XZ is not set
> CONFIG_DEFAULT_INIT=""
> CONFIG_DEFAULT_HOSTNAME="(none)"
> CONFIG_SYSVIPC=y
> CONFIG_SYSVIPC_SYSCTL=y
> CONFIG_POSIX_MQUEUE=y
> CONFIG_POSIX_MQUEUE_SYSCTL=y
> CONFIG_WATCH_QUEUE=y
> CONFIG_CROSS_MEMORY_ATTACH=y
> # CONFIG_USELIB is not set
> CONFIG_AUDIT=y
> CONFIG_HAVE_ARCH_AUDITSYSCALL=y
> CONFIG_AUDITSYSCALL=y
>
> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_SHOW=y
> CONFIG_GENERIC_IRQ_SHOW_LEVEL=y
> CONFIG_GENERIC_IRQ_MIGRATION=y
> CONFIG_HARDIRQS_SW_RESEND=y
> CONFIG_IRQ_DOMAIN=y
> CONFIG_IRQ_DOMAIN_HIERARCHY=y
> CONFIG_GENERIC_MSI_IRQ=y
> CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
> CONFIG_IRQ_FORCED_THREADING=y
> CONFIG_SPARSE_IRQ=y
> # CONFIG_GENERIC_IRQ_DEBUGFS is not set
> # end of IRQ subsystem
>
> CONFIG_GENERIC_TIME_VSYSCALL=y
> CONFIG_GENERIC_CLOCKEVENTS=y
> CONFIG_ARCH_HAS_TICK_BROADCAST=y
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
> CONFIG_GENERIC_CMOS_UPDATE=y
> CONFIG_TIME_KUNIT_TEST=m
> CONFIG_CONTEXT_TRACKING=y
> CONFIG_CONTEXT_TRACKING_IDLE=y
>
> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=y
> CONFIG_NO_HZ_COMMON=y
> # CONFIG_HZ_PERIODIC is not set
> # CONFIG_NO_HZ_IDLE is not set
> CONFIG_NO_HZ_FULL=y
> CONFIG_CONTEXT_TRACKING_USER=y
> # CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
> CONFIG_NO_HZ=y
> CONFIG_HIGH_RES_TIMERS=y
> # end of Timers subsystem
>
> CONFIG_BPF=y
> CONFIG_HAVE_EBPF_JIT=y
>
> #
> # BPF subsystem
> #
> CONFIG_BPF_SYSCALL=y
> CONFIG_BPF_JIT=y
> CONFIG_BPF_JIT_ALWAYS_ON=y
> CONFIG_BPF_JIT_DEFAULT_ON=y
> CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
> CONFIG_USERMODE_DRIVER=y
> CONFIG_BPF_PRELOAD=y
> CONFIG_BPF_PRELOAD_UMD=m
> CONFIG_BPF_LSM=y
> # end of BPF subsystem
>
> CONFIG_PREEMPT_VOLUNTARY_BUILD=y
> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=y
> # CONFIG_PREEMPT is not set
> CONFIG_SCHED_CORE=y
>
> #
> # CPU/Task time and stats accounting
> #
> CONFIG_VIRT_CPU_ACCOUNTING=y
> CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
> CONFIG_IRQ_TIME_ACCOUNTING=y
> CONFIG_HAVE_SCHED_AVG_IRQ=y
> CONFIG_BSD_PROCESS_ACCT=y
> CONFIG_BSD_PROCESS_ACCT_V3=y
> CONFIG_TASKSTATS=y
> CONFIG_TASK_DELAY_ACCT=y
> CONFIG_TASK_XACCT=y
> CONFIG_TASK_IO_ACCOUNTING=y
> CONFIG_PSI=y
> # CONFIG_PSI_DEFAULT_DISABLED is not set
> # end of CPU/Task time and stats accounting
>
> CONFIG_CPU_ISOLATION=y
>
> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=y
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=y
> CONFIG_TREE_SRCU=y
> CONFIG_TASKS_RCU_GENERIC=y
> CONFIG_TASKS_RUDE_RCU=y
> CONFIG_TASKS_TRACE_RCU=y
> CONFIG_RCU_STALL_COMMON=y
> CONFIG_RCU_NEED_SEGCBLIST=y
> CONFIG_RCU_NOCB_CPU=y
> # CONFIG_RCU_NOCB_CPU_DEFAULT_ALL is not set
> # end of RCU Subsystem
>
> # CONFIG_IKCONFIG is not set
> CONFIG_IKHEADERS=m
> CONFIG_LOG_BUF_SHIFT=18
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=12
> CONFIG_PRINTK_INDEX=y
>
> #
> # Scheduler features
> #
> # CONFIG_UCLAMP_TASK is not set
> # end of Scheduler features
>
> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
> CONFIG_CC_HAS_INT128=y
> CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
> CONFIG_GCC12_NO_ARRAY_BOUNDS=y
> CONFIG_NUMA_BALANCING=y
> CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
> CONFIG_CGROUPS=y
> CONFIG_PAGE_COUNTER=y
> # CONFIG_CGROUP_FAVOR_DYNMODS is not set
> CONFIG_MEMCG=y
> CONFIG_MEMCG_KMEM=y
> CONFIG_BLK_CGROUP=y
> CONFIG_CGROUP_WRITEBACK=y
> CONFIG_CGROUP_SCHED=y
> CONFIG_FAIR_GROUP_SCHED=y
> CONFIG_CFS_BANDWIDTH=y
> # CONFIG_RT_GROUP_SCHED is not set
> CONFIG_CGROUP_PIDS=y
> # CONFIG_CGROUP_RDMA is not set
> CONFIG_CGROUP_FREEZER=y
> CONFIG_CGROUP_HUGETLB=y
> CONFIG_CPUSETS=y
> CONFIG_PROC_PID_CPUSET=y
> CONFIG_CGROUP_DEVICE=y
> CONFIG_CGROUP_CPUACCT=y
> CONFIG_CGROUP_PERF=y
> CONFIG_CGROUP_BPF=y
> CONFIG_CGROUP_MISC=y
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_SOCK_CGROUP_DATA=y
> CONFIG_NAMESPACES=y
> CONFIG_UTS_NS=y
> CONFIG_TIME_NS=y
> CONFIG_IPC_NS=y
> CONFIG_USER_NS=y
> CONFIG_PID_NS=y
> CONFIG_NET_NS=y
> CONFIG_CHECKPOINT_RESTORE=y
> CONFIG_SCHED_AUTOGROUP=y
> # CONFIG_SYSFS_DEPRECATED is not set
> CONFIG_RELAY=y
> CONFIG_BLK_DEV_INITRD=y
> CONFIG_INITRAMFS_SOURCE=""
> CONFIG_RD_GZIP=y
> CONFIG_RD_BZIP2=y
> CONFIG_RD_LZMA=y
> CONFIG_RD_XZ=y
> CONFIG_RD_LZO=y
> CONFIG_RD_LZ4=y
> CONFIG_RD_ZSTD=y
> CONFIG_BOOT_CONFIG=y
> # CONFIG_BOOT_CONFIG_EMBED is not set
> # CONFIG_INITRAMFS_PRESERVE_MTIME is not set
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION=y
> CONFIG_LD_ORPHAN_WARN=y
> CONFIG_SYSCTL=y
> CONFIG_SYSCTL_EXCEPTION_TRACE=y
> CONFIG_HAVE_PCSPKR_PLATFORM=y
> # CONFIG_EXPERT is not set
> CONFIG_MULTIUSER=y
> CONFIG_SGETMASK_SYSCALL=y
> CONFIG_SYSFS_SYSCALL=y
> CONFIG_FHANDLE=y
> CONFIG_POSIX_TIMERS=y
> CONFIG_PRINTK=y
> CONFIG_BUG=y
> CONFIG_ELF_CORE=y
> CONFIG_PCSPKR_PLATFORM=y
> CONFIG_BASE_FULL=y
> CONFIG_FUTEX=y
> CONFIG_FUTEX_PI=y
> CONFIG_EPOLL=y
> CONFIG_SIGNALFD=y
> CONFIG_TIMERFD=y
> CONFIG_EVENTFD=y
> CONFIG_SHMEM=y
> CONFIG_AIO=y
> CONFIG_IO_URING=y
> CONFIG_ADVISE_SYSCALLS=y
> CONFIG_MEMBARRIER=y
> CONFIG_KALLSYMS=y
> CONFIG_KALLSYMS_ALL=y
> CONFIG_KALLSYMS_BASE_RELATIVE=y
> CONFIG_ARCH_HAS_MEMBARRIER_CALLBACKS=y
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
> CONFIG_KCMP=y
> CONFIG_RSEQ=y
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=y
>
> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=y
> # end of Kernel Performance Events And Counters
>
> CONFIG_SYSTEM_DATA_VERIFICATION=y
> CONFIG_PROFILING=y
> CONFIG_TRACEPOINTS=y
> # end of General setup
>
> CONFIG_PPC64=y
>
> #
> # Processor support
> #
> CONFIG_PPC_BOOK3S_64=y
> # CONFIG_PPC_BOOK3E_64 is not set
> # CONFIG_GENERIC_CPU is not set
> # CONFIG_POWER7_CPU is not set
> CONFIG_POWER8_CPU=y
> # CONFIG_POWER9_CPU is not set
> # CONFIG_POWER10_CPU is not set
> CONFIG_TARGET_CPU_BOOL=y
> CONFIG_TARGET_CPU="power8"
> CONFIG_PPC_BOOK3S=y
> CONFIG_PPC_FPU_REGS=y
> CONFIG_PPC_FPU=y
> CONFIG_ALTIVEC=y
> CONFIG_VSX=y
> CONFIG_PPC_64S_HASH_MMU=y
> CONFIG_PPC_RADIX_MMU=y
> CONFIG_PPC_RADIX_MMU_DEFAULT=y
> CONFIG_PPC_KUEP=y
> CONFIG_PPC_KUAP=y
> # CONFIG_PPC_KUAP_DEBUG is not set
> CONFIG_PPC_PKEY=y
> CONFIG_PPC_HAVE_PMU_SUPPORT=y
> # CONFIG_PMU_SYSFS is not set
> CONFIG_PPC_PERF_CTRS=y
> CONFIG_FORCE_SMP=y
> CONFIG_SMP=y
> CONFIG_NR_CPUS=2048
> CONFIG_PPC_DOORBELL=y
> # end of Processor support
>
> # CONFIG_CPU_BIG_ENDIAN is not set
> CONFIG_CPU_LITTLE_ENDIAN=y
> CONFIG_PPC64_ELF_ABI_V2=y
> CONFIG_PPC64_BOOT_WRAPPER=y
> CONFIG_64BIT=y
> CONFIG_LIVEPATCH_64=y
> CONFIG_MMU=y
> CONFIG_ARCH_MMAP_RND_BITS_MAX=29
> CONFIG_ARCH_MMAP_RND_BITS_MIN=14
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=13
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=7
> CONFIG_NR_IRQS=512
> CONFIG_NMI_IPI=y
> CONFIG_PPC_WATCHDOG=y
> CONFIG_STACKTRACE_SUPPORT=y
> CONFIG_LOCKDEP_SUPPORT=y
> CONFIG_GENERIC_HWEIGHT=y
> CONFIG_PPC=y
> CONFIG_PPC_BARRIER_NOSPEC=y
> CONFIG_PPC_HAS_LBARX_LHARX=y
> CONFIG_EARLY_PRINTK=y
> CONFIG_PANIC_TIMEOUT=0
> # CONFIG_COMPAT is not set
> CONFIG_SCHED_OMIT_FRAME_POINTER=y
> CONFIG_ARCH_MAY_HAVE_PC_FDC=y
> CONFIG_PPC_UDBG_16550=y
> CONFIG_AUDIT_ARCH=y
> CONFIG_GENERIC_BUG=y
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
> CONFIG_EPAPR_BOOT=y
> CONFIG_ARCH_HIBERNATION_POSSIBLE=y
> CONFIG_ARCH_SUSPEND_POSSIBLE=y
> CONFIG_ARCH_SUSPEND_NONZERO_CPU=y
> CONFIG_ARCH_HAS_ADD_PAGES=y
> CONFIG_ARCH_SUPPORTS_UPROBES=y
> CONFIG_PPC_DAWR=y
> CONFIG_PGTABLE_LEVELS=4
> CONFIG_PPC_MSI_BITMAP=y
> CONFIG_PPC_XICS=y
> CONFIG_PPC_ICP_NATIVE=y
> CONFIG_PPC_ICP_HV=y
> CONFIG_PPC_ICS_RTAS=y
> CONFIG_PPC_XIVE=y
> CONFIG_PPC_XIVE_NATIVE=y
> CONFIG_PPC_XIVE_SPAPR=y
>
> #
> # Platform support
> #
> CONFIG_PPC_POWERNV=y
> CONFIG_OPAL_PRD=m
> # CONFIG_PPC_MEMTRACE is not set
> CONFIG_SCOM_DEBUGFS=y
> CONFIG_PPC_PSERIES=y
> CONFIG_PARAVIRT=y
> CONFIG_PARAVIRT_SPINLOCKS=y
> CONFIG_PARAVIRT_TIME_ACCOUNTING=y
> CONFIG_PPC_SPLPAR=y
> CONFIG_DTL=y
> CONFIG_PSERIES_ENERGY=m
> CONFIG_IO_EVENT_IRQ=y
> CONFIG_LPARCFG=y
> CONFIG_PPC_SMLPAR=y
> CONFIG_CMM=y
> CONFIG_HV_PERF_CTRS=y
> CONFIG_IBMVIO=y
> CONFIG_PSERIES_PLPKS=y
> CONFIG_PAPR_SCM=m
> CONFIG_PPC_SVM=y
> CONFIG_PPC_VAS=y
> CONFIG_KVM_GUEST=y
> CONFIG_EPAPR_PARAVIRT=y
> CONFIG_PPC_HASH_MMU_NATIVE=y
> CONFIG_PPC_OF_BOOT_TRAMPOLINE=y
> CONFIG_PPC_DT_CPU_FTRS=y
> # CONFIG_UDBG_RTAS_CONSOLE is not set
> CONFIG_PPC_SMP_MUXED_IPI=y
> CONFIG_MPIC=y
> # CONFIG_MPIC_MSGR is not set
> CONFIG_PPC_I8259=y
> CONFIG_PPC_RTAS=y
> CONFIG_RTAS_ERROR_LOGGING=y
> CONFIG_PPC_RTAS_DAEMON=y
> CONFIG_RTAS_PROC=y
> CONFIG_RTAS_FLASH=y
> CONFIG_EEH=y
> CONFIG_PPC_P7_NAP=y
> CONFIG_PPC_BOOK3S_IDLE=y
> CONFIG_PPC_INDIRECT_PIO=y
>
> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=y
> CONFIG_CPU_FREQ_GOV_ATTR_SET=y
> CONFIG_CPU_FREQ_GOV_COMMON=y
> CONFIG_CPU_FREQ_STAT=y
> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL=y
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
> CONFIG_CPU_FREQ_GOV_POWERSAVE=y
> CONFIG_CPU_FREQ_GOV_USERSPACE=y
> CONFIG_CPU_FREQ_GOV_ONDEMAND=y
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
> CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
>
> #
> # CPU frequency scaling drivers
> #
> # CONFIG_CPUFREQ_DT is not set
> CONFIG_POWERNV_CPUFREQ=y
> # end of CPU Frequency scaling
>
> #
> # CPUIdle driver
> #
>
> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=y
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
> CONFIG_CPU_IDLE_GOV_MENU=y
> # CONFIG_CPU_IDLE_GOV_TEO is not set
> # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
>
> #
> # POWERPC CPU Idle Drivers
> #
> CONFIG_PSERIES_CPUIDLE=y
> CONFIG_POWERNV_CPUIDLE=y
> # end of POWERPC CPU Idle Drivers
> # end of CPU Idle
> # end of CPUIdle driver
>
> # CONFIG_GEN_RTC is not set
> # end of Platform support
>
> #
> # Kernel options
> #
> CONFIG_HZ_100=y
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=100
> CONFIG_SCHED_HRTICK=y
> CONFIG_PPC_TRANSACTIONAL_MEM=y
> CONFIG_PPC_UV=y
> CONFIG_MPROFILE_KERNEL=y
> CONFIG_HOTPLUG_CPU=y
> CONFIG_PPC_QUEUED_SPINLOCKS=y
> CONFIG_ARCH_CPU_PROBE_RELEASE=y
> CONFIG_PPC64_SUPPORTS_MEMORY_FAILURE=y
> CONFIG_KEXEC=y
> CONFIG_KEXEC_FILE=y
> CONFIG_ARCH_HAS_KEXEC_PURGATORY=y
> CONFIG_RELOCATABLE=y
> # CONFIG_RELOCATABLE_TEST is not set
> CONFIG_CRASH_DUMP=y
> CONFIG_FA_DUMP=y
> # CONFIG_OPAL_CORE is not set
> CONFIG_IRQ_ALL_CPUS=y
> CONFIG_NUMA=y
> CONFIG_NODES_SHIFT=8
> CONFIG_HAVE_MEMORYLESS_NODES=y
> CONFIG_ARCH_SELECT_MEMORY_MODEL=y
> CONFIG_ARCH_SPARSEMEM_ENABLE=y
> CONFIG_ARCH_SPARSEMEM_DEFAULT=y
> CONFIG_ILLEGAL_POINTER_VALUE=0x5deadbeef0000000
> CONFIG_ARCH_MEMORY_PROBE=y
> # CONFIG_PPC_4K_PAGES is not set
> CONFIG_PPC_64K_PAGES=y
> CONFIG_PAGE_SIZE_64KB=y
> CONFIG_PPC_PAGE_SHIFT=16
> CONFIG_THREAD_SHIFT=14
> CONFIG_DATA_SHIFT=24
> CONFIG_ARCH_FORCE_MAX_ORDER=9
> CONFIG_PPC_SUBPAGE_PROT=y
> # CONFIG_PPC_PROT_SAO_LPAR is not set
> CONFIG_PPC_COPRO_BASE=y
> CONFIG_SCHED_SMT=y
> CONFIG_PPC_DENORMALISATION=y
> CONFIG_CMDLINE=""
> CONFIG_EXTRA_TARGETS=""
> CONFIG_SUSPEND=y
> CONFIG_SUSPEND_FREEZER=y
> # CONFIG_HIBERNATION is not set
> CONFIG_PM_SLEEP=y
> CONFIG_PM_SLEEP_SMP=y
> CONFIG_PM_SLEEP_SMP_NONZERO_CPU=y
> # CONFIG_PM_AUTOSLEEP is not set
> # CONFIG_PM_USERSPACE_AUTOSLEEP is not set
> # CONFIG_PM_WAKELOCKS is not set
> CONFIG_PM=y
> CONFIG_PM_DEBUG=y
> # CONFIG_PM_ADVANCED_DEBUG is not set
> CONFIG_PM_TEST_SUSPEND=y
> CONFIG_PM_SLEEP_DEBUG=y
> CONFIG_PM_CLK=y
> CONFIG_PM_GENERIC_DOMAINS=y
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> CONFIG_PM_GENERIC_DOMAINS_SLEEP=y
> CONFIG_PM_GENERIC_DOMAINS_OF=y
> CONFIG_ENERGY_MODEL=y
> CONFIG_PPC_MEM_KEYS=y
> CONFIG_PPC_SECURE_BOOT=y
> CONFIG_PPC_SECVAR_SYSFS=y
> CONFIG_PPC_RTAS_FILTER=y
> # end of Kernel options
>
> CONFIG_ISA_DMA_API=y
>
> #
> # Bus options
> #
> CONFIG_GENERIC_ISA_DMA=y
> # CONFIG_FSL_LBC is not set
> # end of Bus options
>
> CONFIG_NONSTATIC_KERNEL=y
> CONFIG_PAGE_OFFSET=0xc000000000000000
> CONFIG_KERNEL_START=0xc000000000000000
> CONFIG_PHYSICAL_START=0x00000000
> CONFIG_HAVE_KVM_IRQCHIP=y
> CONFIG_HAVE_KVM_IRQFD=y
> CONFIG_HAVE_KVM_EVENTFD=y
> CONFIG_KVM_VFIO=y
> CONFIG_HAVE_KVM_IRQ_BYPASS=y
> CONFIG_HAVE_KVM_VCPU_ASYNC_IOCTL=y
> CONFIG_VIRTUALIZATION=y
> CONFIG_KVM=y
> CONFIG_KVM_BOOK3S_HANDLER=y
> CONFIG_KVM_BOOK3S_64_HANDLER=y
> CONFIG_KVM_BOOK3S_HV_POSSIBLE=y
> CONFIG_KVM_BOOK3S_64=m
> CONFIG_KVM_BOOK3S_64_HV=m
> # CONFIG_KVM_BOOK3S_HV_P9_TIMING is not set
> # CONFIG_KVM_BOOK3S_HV_P8_TIMING is not set
> CONFIG_KVM_BOOK3S_HV_NESTED_PMU_WORKAROUND=y
> CONFIG_KVM_XICS=y
> CONFIG_KVM_XIVE=y
> CONFIG_HAVE_LIVEPATCH=y
> CONFIG_LIVEPATCH=y
>
> #
> # General architecture-dependent options
> #
> CONFIG_CRASH_CORE=y
> CONFIG_KEXEC_CORE=y
> CONFIG_KEXEC_ELF=y
> CONFIG_HAVE_IMA_KEXEC=y
> CONFIG_KPROBES=y
> CONFIG_JUMP_LABEL=y
> # CONFIG_STATIC_KEYS_SELFTEST is not set
> CONFIG_OPTPROBES=y
> CONFIG_KPROBES_ON_FTRACE=y
> CONFIG_UPROBES=y
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
> CONFIG_ARCH_USE_BUILTIN_BSWAP=y
> CONFIG_KRETPROBES=y
> CONFIG_HAVE_IOREMAP_PROT=y
> CONFIG_HAVE_KPROBES=y
> CONFIG_HAVE_KRETPROBES=y
> CONFIG_HAVE_OPTPROBES=y
> CONFIG_HAVE_KPROBES_ON_FTRACE=y
> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
> CONFIG_HAVE_NMI=y
> CONFIG_TRACE_IRQFLAGS_SUPPORT=y
> CONFIG_HAVE_ARCH_TRACEHOOK=y
> CONFIG_GENERIC_SMP_IDLE_THREAD=y
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
> CONFIG_ARCH_HAS_SET_MEMORY=y
> CONFIG_ARCH_WANTS_NO_INSTR=y
> CONFIG_HAVE_ASM_MODVERSIONS=y
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
> CONFIG_HAVE_RSEQ=y
> CONFIG_HAVE_HW_BREAKPOINT=y
> CONFIG_HAVE_PERF_EVENTS_NMI=y
> CONFIG_HAVE_NMI_WATCHDOG=y
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH=y
> CONFIG_HAVE_PERF_REGS=y
> CONFIG_HAVE_PERF_USER_STACK_DUMP=y
> CONFIG_HAVE_ARCH_JUMP_LABEL=y
> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
> CONFIG_MMU_GATHER_TABLE_FREE=y
> CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
> CONFIG_MMU_GATHER_PAGE_SIZE=y
> CONFIG_MMU_GATHER_MERGE_VMAS=y
> CONFIG_ARCH_WANT_IRQS_OFF_ACTIVATE_MM=y
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
> CONFIG_ARCH_WEAK_RELEASE_ACQUIRE=y
> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
> CONFIG_HAVE_ARCH_SECCOMP=y
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
> CONFIG_SECCOMP=y
> CONFIG_SECCOMP_FILTER=y
> # CONFIG_SECCOMP_CACHE_DEBUG is not set
> CONFIG_HAVE_STACKPROTECTOR=y
> CONFIG_STACKPROTECTOR=y
> # CONFIG_STACKPROTECTOR_STRONG is not set
> CONFIG_LTO_NONE=y
> CONFIG_HAVE_CONTEXT_TRACKING_USER=y
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING=y
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
> CONFIG_HAVE_MOVE_PUD=y
> CONFIG_HAVE_MOVE_PMD=y
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
> CONFIG_HAVE_ARCH_HUGE_VMAP=y
> CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
> CONFIG_HAVE_ARCH_SOFT_DIRTY=y
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
> CONFIG_MODULES_USE_ELF_RELA=y
> CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
> CONFIG_SOFTIRQ_ON_OWN_STACK=y
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
> CONFIG_ARCH_MMAP_RND_BITS=14
> CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
> CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT=y
> CONFIG_HAVE_RELIABLE_STACKTRACE=y
> CONFIG_HAVE_ARCH_NVRAM_OPS=y
> CONFIG_CLONE_BACKWARDS=y
> CONFIG_OLD_SIGSUSPEND=y
> CONFIG_COMPAT_32BIT_TIME=y
> CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
> CONFIG_RANDOMIZE_KSTACK_OFFSET=y
> CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT=y
> CONFIG_ARCH_OPTIONAL_KERNEL_RWX=y
> CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT=y
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
> CONFIG_STRICT_KERNEL_RWX=y
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
> CONFIG_STRICT_MODULE_RWX=y
> CONFIG_ARCH_HAS_PHYS_TO_DMA=y
> # CONFIG_LOCK_EVENT_COUNTS is not set
> CONFIG_ARCH_HAS_MEM_ENCRYPT=y
> CONFIG_ARCH_HAS_CC_PLATFORM=y
> CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
>
> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
> # end of GCOV-based kernel profiling
>
> CONFIG_HAVE_GCC_PLUGINS=y
> CONFIG_GCC_PLUGINS=y
> # CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
> # end of General architecture-dependent options
>
> CONFIG_RT_MUTEXES=y
> CONFIG_BASE_SMALL=0
> CONFIG_MODULE_SIG_FORMAT=y
> CONFIG_MODULES=y
> # CONFIG_MODULE_FORCE_LOAD is not set
> CONFIG_MODULE_UNLOAD=y
> # CONFIG_MODULE_FORCE_UNLOAD is not set
> CONFIG_MODULE_UNLOAD_TAINT_TRACKING=y
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> CONFIG_MODULE_SIG=y
> # CONFIG_MODULE_SIG_FORCE is not set
> CONFIG_MODULE_SIG_ALL=y
> # CONFIG_MODULE_SIG_SHA1 is not set
> # CONFIG_MODULE_SIG_SHA224 is not set
> # CONFIG_MODULE_SIG_SHA256 is not set
> # CONFIG_MODULE_SIG_SHA384 is not set
> CONFIG_MODULE_SIG_SHA512=y
> CONFIG_MODULE_SIG_HASH="sha512"
> CONFIG_MODULE_COMPRESS_NONE=y
> # CONFIG_MODULE_COMPRESS_GZIP is not set
> # CONFIG_MODULE_COMPRESS_XZ is not set
> # CONFIG_MODULE_COMPRESS_ZSTD is not set
> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> CONFIG_MODPROBE_PATH="/usr/sbin/modprobe"
> CONFIG_MODULES_TREE_LOOKUP=y
> CONFIG_BLOCK=y
> CONFIG_BLOCK_LEGACY_AUTOLOAD=y
> CONFIG_BLK_RQ_ALLOC_TIME=y
> CONFIG_BLK_CGROUP_RWSTAT=y
> CONFIG_BLK_DEV_BSG_COMMON=y
> CONFIG_BLK_ICQ=y
> CONFIG_BLK_DEV_BSGLIB=y
> CONFIG_BLK_DEV_INTEGRITY=y
> CONFIG_BLK_DEV_INTEGRITY_T10=y
> CONFIG_BLK_DEV_ZONED=y
> CONFIG_BLK_DEV_THROTTLING=y
> # CONFIG_BLK_DEV_THROTTLING_LOW is not set
> CONFIG_BLK_WBT=y
> CONFIG_BLK_WBT_MQ=y
> CONFIG_BLK_CGROUP_IOLATENCY=y
> CONFIG_BLK_CGROUP_FC_APPID=y
> CONFIG_BLK_CGROUP_IOCOST=y
> CONFIG_BLK_CGROUP_IOPRIO=y
> CONFIG_BLK_DEBUG_FS=y
> CONFIG_BLK_DEBUG_FS_ZONED=y
> CONFIG_BLK_SED_OPAL=y
> CONFIG_BLK_INLINE_ENCRYPTION=y
> # CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK is not set
>
> #
> # Partition Types
> #
> CONFIG_PARTITION_ADVANCED=y
> # CONFIG_ACORN_PARTITION is not set
> CONFIG_AIX_PARTITION=y
> CONFIG_OSF_PARTITION=y
> # CONFIG_AMIGA_PARTITION is not set
> # CONFIG_ATARI_PARTITION is not set
> CONFIG_MAC_PARTITION=y
> CONFIG_MSDOS_PARTITION=y
> CONFIG_BSD_DISKLABEL=y
> CONFIG_MINIX_SUBPARTITION=y
> CONFIG_SOLARIS_X86_PARTITION=y
> CONFIG_UNIXWARE_DISKLABEL=y
> CONFIG_LDM_PARTITION=y
> # CONFIG_LDM_DEBUG is not set
> CONFIG_SGI_PARTITION=y
> # CONFIG_ULTRIX_PARTITION is not set
> CONFIG_SUN_PARTITION=y
> # CONFIG_KARMA_PARTITION is not set
> CONFIG_EFI_PARTITION=y
> # CONFIG_SYSV68_PARTITION is not set
> # CONFIG_CMDLINE_PARTITION is not set
> # end of Partition Types
>
> CONFIG_BLK_MQ_PCI=y
> CONFIG_BLK_MQ_VIRTIO=y
> CONFIG_BLK_MQ_RDMA=y
> CONFIG_BLK_PM=y
> CONFIG_BLOCK_HOLDER_DEPRECATED=y
> CONFIG_BLK_MQ_STACKING=y
>
> #
> # IO Schedulers
> #
> CONFIG_MQ_IOSCHED_DEADLINE=y
> CONFIG_MQ_IOSCHED_KYBER=y
> CONFIG_IOSCHED_BFQ=y
> CONFIG_BFQ_GROUP_IOSCHED=y
> # CONFIG_BFQ_CGROUP_DEBUG is not set
> # end of IO Schedulers
>
> CONFIG_PREEMPT_NOTIFIERS=y
> CONFIG_PADATA=y
> CONFIG_ASN1=y
> CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
> CONFIG_INLINE_READ_UNLOCK=y
> CONFIG_INLINE_READ_UNLOCK_IRQ=y
> CONFIG_INLINE_WRITE_UNLOCK=y
> CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
> CONFIG_MUTEX_SPIN_ON_OWNER=y
> CONFIG_RWSEM_SPIN_ON_OWNER=y
> CONFIG_LOCK_SPIN_ON_OWNER=y
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
> CONFIG_QUEUED_SPINLOCKS=y
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
> CONFIG_QUEUED_RWLOCKS=y
> CONFIG_ARCH_HAS_MMIOWB=y
> CONFIG_MMIOWB=y
> CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
> CONFIG_FREEZER=y
>
> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=y
> CONFIG_ELFCORE=y
> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
> CONFIG_BINFMT_SCRIPT=y
> CONFIG_BINFMT_MISC=m
> CONFIG_COREDUMP=y
> # end of Executable file formats
>
> #
> # Memory Management options
> #
> CONFIG_ZPOOL=y
> CONFIG_SWAP=y
> CONFIG_ZSWAP=y
> # CONFIG_ZSWAP_DEFAULT_ON is not set
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
> CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=y
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
> CONFIG_ZSWAP_COMPRESSOR_DEFAULT="lzo"
> CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=y
> # CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
> # CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
> CONFIG_ZSWAP_ZPOOL_DEFAULT="zbud"
> CONFIG_ZBUD=y
> CONFIG_Z3FOLD=y
> CONFIG_ZSMALLOC=y
> # CONFIG_ZSMALLOC_STAT is not set
>
> #
> # SLAB allocator options
> #
> # CONFIG_SLAB is not set
> CONFIG_SLUB=y
> # CONFIG_SLAB_MERGE_DEFAULT is not set
> CONFIG_SLAB_FREELIST_RANDOM=y
> CONFIG_SLAB_FREELIST_HARDENED=y
> # CONFIG_SLUB_STATS is not set
> CONFIG_SLUB_CPU_PARTIAL=y
> # end of SLAB allocator options
>
> CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
> # CONFIG_COMPAT_BRK is not set
> CONFIG_SELECT_MEMORY_MODEL=y
> CONFIG_SPARSEMEM_MANUAL=y
> CONFIG_SPARSEMEM=y
> CONFIG_SPARSEMEM_EXTREME=y
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
> CONFIG_SPARSEMEM_VMEMMAP=y
> CONFIG_HAVE_FAST_GUP=y
> CONFIG_ARCH_KEEP_MEMBLOCK=y
> CONFIG_NUMA_KEEP_MEMINFO=y
> CONFIG_MEMORY_ISOLATION=y
> CONFIG_EXCLUSIVE_SYSTEM_RAM=y
> CONFIG_HAVE_BOOTMEM_INFO_NODE=y
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
> CONFIG_MEMORY_HOTPLUG=y
> # CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
> CONFIG_MEMORY_HOTREMOVE=y
> CONFIG_SPLIT_PTLOCK_CPUS=4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
> CONFIG_MEMORY_BALLOON=y
> CONFIG_BALLOON_COMPACTION=y
> CONFIG_COMPACTION=y
> CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
> CONFIG_PAGE_REPORTING=y
> CONFIG_MIGRATION=y
> CONFIG_DEVICE_MIGRATION=y
> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
> CONFIG_ARCH_ENABLE_THP_MIGRATION=y
> CONFIG_HUGETLB_PAGE_SIZE_VARIABLE=y
> CONFIG_CONTIG_ALLOC=y
> CONFIG_PHYS_ADDR_T_64BIT=y
> CONFIG_MMU_NOTIFIER=y
> CONFIG_KSM=y
> CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
> CONFIG_MEMORY_FAILURE=y
> CONFIG_HWPOISON_INJECT=m
> CONFIG_TRANSPARENT_HUGEPAGE=y
> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
> # CONFIG_READ_ONLY_THP_FOR_FS is not set
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
> CONFIG_USE_PERCPU_NUMA_NODE_ID=y
> CONFIG_HAVE_SETUP_PER_CPU_AREA=y
> CONFIG_FRONTSWAP=y
> CONFIG_CMA=y
> # CONFIG_CMA_DEBUG is not set
> # CONFIG_CMA_DEBUGFS is not set
> CONFIG_CMA_SYSFS=y
> CONFIG_CMA_AREAS=7
> CONFIG_MEM_SOFT_DIRTY=y
> CONFIG_GENERIC_EARLY_IOREMAP=y
> # CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
> CONFIG_PAGE_IDLE_FLAG=y
> # CONFIG_IDLE_PAGE_TRACKING is not set
> CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
> CONFIG_ARCH_HAS_PTE_DEVMAP=y
> CONFIG_ZONE_DEVICE=y
> CONFIG_HMM_MIRROR=y
> CONFIG_GET_FREE_REGION=y
> CONFIG_DEVICE_PRIVATE=y
> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=y
> CONFIG_ARCH_HAS_PKEYS=y
> CONFIG_VM_EVENT_COUNTERS=y
> # CONFIG_PERCPU_STATS is not set
> # CONFIG_GUP_TEST is not set
> CONFIG_ARCH_HAS_PTE_SPECIAL=y
> CONFIG_ARCH_HAS_HUGEPD=y
> # CONFIG_ANON_VMA_NAME is not set
> CONFIG_USERFAULTFD=y
> CONFIG_LRU_GEN=y
> CONFIG_LRU_GEN_ENABLED=y
> # CONFIG_LRU_GEN_STATS is not set
>
> #
> # Data Access Monitoring
> #
> CONFIG_DAMON=y
> CONFIG_DAMON_VADDR=y
> CONFIG_DAMON_PADDR=y
> CONFIG_DAMON_SYSFS=y
> CONFIG_DAMON_DBGFS=y
> CONFIG_DAMON_RECLAIM=y
> # CONFIG_DAMON_LRU_SORT is not set
> # end of Data Access Monitoring
> # end of Memory Management options
>
> CONFIG_NET=y
> CONFIG_NET_INGRESS=y
> CONFIG_NET_EGRESS=y
> CONFIG_NET_REDIRECT=y
> CONFIG_SKB_EXTENSIONS=y
>
> #
> # Networking options
> #
> CONFIG_PACKET=y
> CONFIG_PACKET_DIAG=y
> CONFIG_UNIX=y
> CONFIG_UNIX_SCM=y
> CONFIG_AF_UNIX_OOB=y
> CONFIG_UNIX_DIAG=y
> CONFIG_TLS=m
> CONFIG_TLS_DEVICE=y
> # CONFIG_TLS_TOE is not set
> CONFIG_XFRM=y
> CONFIG_XFRM_OFFLOAD=y
> CONFIG_XFRM_ALGO=y
> CONFIG_XFRM_USER=y
> CONFIG_XFRM_INTERFACE=m
> CONFIG_XFRM_SUB_POLICY=y
> CONFIG_XFRM_MIGRATE=y
> CONFIG_XFRM_STATISTICS=y
> CONFIG_XFRM_AH=m
> CONFIG_XFRM_ESP=m
> CONFIG_XFRM_IPCOMP=m
> CONFIG_NET_KEY=m
> CONFIG_NET_KEY_MIGRATE=y
> CONFIG_XFRM_ESPINTCP=y
> CONFIG_SMC=m
> CONFIG_SMC_DIAG=m
> CONFIG_XDP_SOCKETS=y
> CONFIG_XDP_SOCKETS_DIAG=m
> CONFIG_INET=y
> CONFIG_IP_MULTICAST=y
> CONFIG_IP_ADVANCED_ROUTER=y
> CONFIG_IP_FIB_TRIE_STATS=y
> CONFIG_IP_MULTIPLE_TABLES=y
> CONFIG_IP_ROUTE_MULTIPATH=y
> CONFIG_IP_ROUTE_VERBOSE=y
> CONFIG_IP_ROUTE_CLASSID=y
> # CONFIG_IP_PNP is not set
> CONFIG_NET_IPIP=m
> CONFIG_NET_IPGRE_DEMUX=m
> CONFIG_NET_IP_TUNNEL=m
> CONFIG_NET_IPGRE=m
> CONFIG_NET_IPGRE_BROADCAST=y
> CONFIG_IP_MROUTE_COMMON=y
> CONFIG_IP_MROUTE=y
> CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
> CONFIG_IP_PIMSM_V1=y
> CONFIG_IP_PIMSM_V2=y
> CONFIG_SYN_COOKIES=y
> CONFIG_NET_IPVTI=m
> CONFIG_NET_UDP_TUNNEL=m
> CONFIG_NET_FOU=m
> CONFIG_NET_FOU_IP_TUNNELS=y
> CONFIG_INET_AH=m
> CONFIG_INET_ESP=m
> CONFIG_INET_ESP_OFFLOAD=m
> CONFIG_INET_ESPINTCP=y
> CONFIG_INET_IPCOMP=m
> CONFIG_INET_XFRM_TUNNEL=m
> CONFIG_INET_TUNNEL=m
> CONFIG_INET_DIAG=y
> CONFIG_INET_TCP_DIAG=y
> CONFIG_INET_UDP_DIAG=y
> CONFIG_INET_RAW_DIAG=y
> CONFIG_INET_DIAG_DESTROY=y
> CONFIG_TCP_CONG_ADVANCED=y
> CONFIG_TCP_CONG_BIC=m
> CONFIG_TCP_CONG_CUBIC=y
> CONFIG_TCP_CONG_WESTWOOD=m
> CONFIG_TCP_CONG_HTCP=m
> CONFIG_TCP_CONG_HSTCP=m
> CONFIG_TCP_CONG_HYBLA=m
> CONFIG_TCP_CONG_VEGAS=m
> CONFIG_TCP_CONG_NV=m
> CONFIG_TCP_CONG_SCALABLE=m
> CONFIG_TCP_CONG_LP=m
> CONFIG_TCP_CONG_VENO=m
> CONFIG_TCP_CONG_YEAH=m
> CONFIG_TCP_CONG_ILLINOIS=m
> CONFIG_TCP_CONG_DCTCP=m
> CONFIG_TCP_CONG_CDG=m
> CONFIG_TCP_CONG_BBR=m
> CONFIG_DEFAULT_CUBIC=y
> # CONFIG_DEFAULT_RENO is not set
> CONFIG_DEFAULT_TCP_CONG="cubic"
> CONFIG_TCP_MD5SIG=y
> CONFIG_IPV6=y
> CONFIG_IPV6_ROUTER_PREF=y
> CONFIG_IPV6_ROUTE_INFO=y
> CONFIG_IPV6_OPTIMISTIC_DAD=y
> CONFIG_INET6_AH=m
> CONFIG_INET6_ESP=m
> CONFIG_INET6_ESP_OFFLOAD=m
> CONFIG_INET6_ESPINTCP=y
> CONFIG_INET6_IPCOMP=m
> CONFIG_IPV6_MIP6=y
> CONFIG_IPV6_ILA=m
> CONFIG_INET6_XFRM_TUNNEL=m
> CONFIG_INET6_TUNNEL=m
> CONFIG_IPV6_VTI=m
> CONFIG_IPV6_SIT=m
> CONFIG_IPV6_SIT_6RD=y
> CONFIG_IPV6_NDISC_NODETYPE=y
> CONFIG_IPV6_TUNNEL=m
> CONFIG_IPV6_GRE=m
> CONFIG_IPV6_FOU=m
> CONFIG_IPV6_FOU_TUNNEL=m
> CONFIG_IPV6_MULTIPLE_TABLES=y
> CONFIG_IPV6_SUBTREES=y
> CONFIG_IPV6_MROUTE=y
> CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
> CONFIG_IPV6_PIMSM_V2=y
> CONFIG_IPV6_SEG6_LWTUNNEL=y
> CONFIG_IPV6_SEG6_HMAC=y
> CONFIG_IPV6_SEG6_BPF=y
> CONFIG_IPV6_RPL_LWTUNNEL=y
> CONFIG_IPV6_IOAM6_LWTUNNEL=y
> CONFIG_NETLABEL=y
> CONFIG_MPTCP=y
> CONFIG_INET_MPTCP_DIAG=y
> CONFIG_MPTCP_IPV6=y
> CONFIG_MPTCP_KUNIT_TEST=m
> CONFIG_NETWORK_SECMARK=y
> CONFIG_NET_PTP_CLASSIFY=y
> CONFIG_NETWORK_PHY_TIMESTAMPING=y
> CONFIG_NETFILTER=y
> CONFIG_NETFILTER_ADVANCED=y
> CONFIG_BRIDGE_NETFILTER=m
>
> #
> # Core Netfilter Configuration
> #
> CONFIG_NETFILTER_INGRESS=y
> CONFIG_NETFILTER_EGRESS=y
> CONFIG_NETFILTER_SKIP_EGRESS=y
> CONFIG_NETFILTER_NETLINK=m
> CONFIG_NETFILTER_FAMILY_BRIDGE=y
> CONFIG_NETFILTER_FAMILY_ARP=y
> # CONFIG_NETFILTER_NETLINK_HOOK is not set
> CONFIG_NETFILTER_NETLINK_ACCT=m
> CONFIG_NETFILTER_NETLINK_QUEUE=m
> CONFIG_NETFILTER_NETLINK_LOG=m
> CONFIG_NETFILTER_NETLINK_OSF=m
> CONFIG_NF_CONNTRACK=m
> CONFIG_NF_LOG_SYSLOG=m
> CONFIG_NETFILTER_CONNCOUNT=m
> CONFIG_NF_CONNTRACK_MARK=y
> CONFIG_NF_CONNTRACK_SECMARK=y
> CONFIG_NF_CONNTRACK_ZONES=y
> CONFIG_NF_CONNTRACK_PROCFS=y
> CONFIG_NF_CONNTRACK_EVENTS=y
> # CONFIG_NF_CONNTRACK_TIMEOUT is not set
> CONFIG_NF_CONNTRACK_TIMESTAMP=y
> CONFIG_NF_CONNTRACK_LABELS=y
> CONFIG_NF_CT_PROTO_DCCP=y
> CONFIG_NF_CT_PROTO_GRE=y
> CONFIG_NF_CT_PROTO_SCTP=y
> CONFIG_NF_CT_PROTO_UDPLITE=y
> CONFIG_NF_CONNTRACK_AMANDA=m
> CONFIG_NF_CONNTRACK_FTP=m
> CONFIG_NF_CONNTRACK_H323=m
> CONFIG_NF_CONNTRACK_IRC=m
> CONFIG_NF_CONNTRACK_BROADCAST=m
> CONFIG_NF_CONNTRACK_NETBIOS_NS=m
> CONFIG_NF_CONNTRACK_SNMP=m
> CONFIG_NF_CONNTRACK_PPTP=m
> CONFIG_NF_CONNTRACK_SANE=m
> CONFIG_NF_CONNTRACK_SIP=m
> CONFIG_NF_CONNTRACK_TFTP=m
> CONFIG_NF_CT_NETLINK=m
> # CONFIG_NETFILTER_NETLINK_GLUE_CT is not set
> CONFIG_NF_NAT=m
> CONFIG_NF_NAT_AMANDA=m
> CONFIG_NF_NAT_FTP=m
> CONFIG_NF_NAT_IRC=m
> CONFIG_NF_NAT_SIP=m
> CONFIG_NF_NAT_TFTP=m
> CONFIG_NF_NAT_REDIRECT=y
> CONFIG_NF_NAT_MASQUERADE=y
> CONFIG_NETFILTER_SYNPROXY=m
> CONFIG_NF_TABLES=m
> CONFIG_NF_TABLES_INET=y
> CONFIG_NF_TABLES_NETDEV=y
> CONFIG_NFT_NUMGEN=m
> CONFIG_NFT_CT=m
> CONFIG_NFT_FLOW_OFFLOAD=m
> # CONFIG_NFT_CONNLIMIT is not set
> CONFIG_NFT_LOG=m
> CONFIG_NFT_LIMIT=m
> CONFIG_NFT_MASQ=m
> CONFIG_NFT_REDIR=m
> CONFIG_NFT_NAT=m
> CONFIG_NFT_TUNNEL=m
> CONFIG_NFT_OBJREF=m
> CONFIG_NFT_QUEUE=m
> CONFIG_NFT_QUOTA=m
> CONFIG_NFT_REJECT=m
> CONFIG_NFT_REJECT_INET=m
> CONFIG_NFT_COMPAT=m
> CONFIG_NFT_HASH=m
> CONFIG_NFT_FIB=m
> CONFIG_NFT_FIB_INET=m
> CONFIG_NFT_XFRM=m
> CONFIG_NFT_SOCKET=m
> # CONFIG_NFT_OSF is not set
> CONFIG_NFT_TPROXY=m
> CONFIG_NFT_SYNPROXY=m
> CONFIG_NF_DUP_NETDEV=m
> CONFIG_NFT_DUP_NETDEV=m
> CONFIG_NFT_FWD_NETDEV=m
> CONFIG_NFT_FIB_NETDEV=m
> CONFIG_NFT_REJECT_NETDEV=m
> CONFIG_NF_FLOW_TABLE_INET=m
> CONFIG_NF_FLOW_TABLE=m
> CONFIG_NF_FLOW_TABLE_PROCFS=y
> CONFIG_NETFILTER_XTABLES=y
>
> #
> # Xtables combined modules
> #
> CONFIG_NETFILTER_XT_MARK=m
> CONFIG_NETFILTER_XT_CONNMARK=m
> CONFIG_NETFILTER_XT_SET=m
>
> #
> # Xtables targets
> #
> CONFIG_NETFILTER_XT_TARGET_AUDIT=m
> CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
> CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
> CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
> CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=m
> CONFIG_NETFILTER_XT_TARGET_CT=m
> CONFIG_NETFILTER_XT_TARGET_DSCP=m
> CONFIG_NETFILTER_XT_TARGET_HL=m
> CONFIG_NETFILTER_XT_TARGET_HMARK=m
> CONFIG_NETFILTER_XT_TARGET_IDLETIMER=m
> CONFIG_NETFILTER_XT_TARGET_LED=m
> CONFIG_NETFILTER_XT_TARGET_LOG=m
> CONFIG_NETFILTER_XT_TARGET_MARK=m
> CONFIG_NETFILTER_XT_NAT=m
> CONFIG_NETFILTER_XT_TARGET_NETMAP=m
> CONFIG_NETFILTER_XT_TARGET_NFLOG=m
> CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
> CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
> CONFIG_NETFILTER_XT_TARGET_RATEEST=m
> CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
> CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
> CONFIG_NETFILTER_XT_TARGET_TEE=m
> CONFIG_NETFILTER_XT_TARGET_TPROXY=m
> CONFIG_NETFILTER_XT_TARGET_TRACE=m
> CONFIG_NETFILTER_XT_TARGET_SECMARK=m
> CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
> CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=m
>
> #
> # Xtables matches
> #
> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
> CONFIG_NETFILTER_XT_MATCH_BPF=m
> CONFIG_NETFILTER_XT_MATCH_CGROUP=m
> CONFIG_NETFILTER_XT_MATCH_CLUSTER=m
> CONFIG_NETFILTER_XT_MATCH_COMMENT=m
> CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
> CONFIG_NETFILTER_XT_MATCH_CONNLABEL=m
> CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
> CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
> CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
> CONFIG_NETFILTER_XT_MATCH_CPU=m
> CONFIG_NETFILTER_XT_MATCH_DCCP=m
> CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
> CONFIG_NETFILTER_XT_MATCH_DSCP=m
> CONFIG_NETFILTER_XT_MATCH_ECN=m
> CONFIG_NETFILTER_XT_MATCH_ESP=m
> CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
> CONFIG_NETFILTER_XT_MATCH_HELPER=m
> CONFIG_NETFILTER_XT_MATCH_HL=m
> CONFIG_NETFILTER_XT_MATCH_IPCOMP=m
> CONFIG_NETFILTER_XT_MATCH_IPRANGE=m
> CONFIG_NETFILTER_XT_MATCH_IPVS=m
> CONFIG_NETFILTER_XT_MATCH_L2TP=m
> CONFIG_NETFILTER_XT_MATCH_LENGTH=m
> CONFIG_NETFILTER_XT_MATCH_LIMIT=m
> CONFIG_NETFILTER_XT_MATCH_MAC=m
> CONFIG_NETFILTER_XT_MATCH_MARK=m
> CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
> CONFIG_NETFILTER_XT_MATCH_NFACCT=m
> CONFIG_NETFILTER_XT_MATCH_OSF=m
> CONFIG_NETFILTER_XT_MATCH_OWNER=m
> CONFIG_NETFILTER_XT_MATCH_POLICY=m
> CONFIG_NETFILTER_XT_MATCH_PHYSDEV=m
> CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
> CONFIG_NETFILTER_XT_MATCH_QUOTA=m
> CONFIG_NETFILTER_XT_MATCH_RATEEST=m
> CONFIG_NETFILTER_XT_MATCH_REALM=m
> CONFIG_NETFILTER_XT_MATCH_RECENT=m
> CONFIG_NETFILTER_XT_MATCH_SCTP=m
> CONFIG_NETFILTER_XT_MATCH_SOCKET=m
> CONFIG_NETFILTER_XT_MATCH_STATE=m
> CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
> CONFIG_NETFILTER_XT_MATCH_STRING=m
> CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
> CONFIG_NETFILTER_XT_MATCH_TIME=m
> CONFIG_NETFILTER_XT_MATCH_U32=m
> # end of Core Netfilter Configuration
>
> CONFIG_IP_SET=m
> CONFIG_IP_SET_MAX=256
> CONFIG_IP_SET_BITMAP_IP=m
> CONFIG_IP_SET_BITMAP_IPMAC=m
> CONFIG_IP_SET_BITMAP_PORT=m
> CONFIG_IP_SET_HASH_IP=m
> CONFIG_IP_SET_HASH_IPMARK=m
> CONFIG_IP_SET_HASH_IPPORT=m
> CONFIG_IP_SET_HASH_IPPORTIP=m
> CONFIG_IP_SET_HASH_IPPORTNET=m
> CONFIG_IP_SET_HASH_IPMAC=m
> CONFIG_IP_SET_HASH_MAC=m
> CONFIG_IP_SET_HASH_NETPORTNET=m
> CONFIG_IP_SET_HASH_NET=m
> CONFIG_IP_SET_HASH_NETNET=m
> CONFIG_IP_SET_HASH_NETPORT=m
> CONFIG_IP_SET_HASH_NETIFACE=m
> CONFIG_IP_SET_LIST_SET=m
> CONFIG_IP_VS=m
> CONFIG_IP_VS_IPV6=y
> # CONFIG_IP_VS_DEBUG is not set
> CONFIG_IP_VS_TAB_BITS=12
>
> #
> # IPVS transport protocol load balancing support
> #
> CONFIG_IP_VS_PROTO_TCP=y
> CONFIG_IP_VS_PROTO_UDP=y
> CONFIG_IP_VS_PROTO_AH_ESP=y
> CONFIG_IP_VS_PROTO_ESP=y
> CONFIG_IP_VS_PROTO_AH=y
> CONFIG_IP_VS_PROTO_SCTP=y
>
> #
> # IPVS scheduler
> #
> CONFIG_IP_VS_RR=m
> CONFIG_IP_VS_WRR=m
> CONFIG_IP_VS_LC=m
> CONFIG_IP_VS_WLC=m
> CONFIG_IP_VS_FO=m
> CONFIG_IP_VS_OVF=m
> CONFIG_IP_VS_LBLC=m
> CONFIG_IP_VS_LBLCR=m
> CONFIG_IP_VS_DH=m
> CONFIG_IP_VS_SH=m
> CONFIG_IP_VS_MH=m
> CONFIG_IP_VS_SED=m
> CONFIG_IP_VS_NQ=m
> CONFIG_IP_VS_TWOS=m
>
> #
> # IPVS SH scheduler
> #
> CONFIG_IP_VS_SH_TAB_BITS=8
>
> #
> # IPVS MH scheduler
> #
> CONFIG_IP_VS_MH_TAB_INDEX=12
>
> #
> # IPVS application helper
> #
> CONFIG_IP_VS_FTP=m
> CONFIG_IP_VS_NFCT=y
> CONFIG_IP_VS_PE_SIP=m
>
> #
> # IP: Netfilter Configuration
> #
> CONFIG_NF_DEFRAG_IPV4=m
> CONFIG_NF_SOCKET_IPV4=m
> CONFIG_NF_TPROXY_IPV4=m
> CONFIG_NF_TABLES_IPV4=y
> CONFIG_NFT_REJECT_IPV4=m
> CONFIG_NFT_DUP_IPV4=m
> CONFIG_NFT_FIB_IPV4=m
> CONFIG_NF_TABLES_ARP=y
> CONFIG_NF_DUP_IPV4=m
> CONFIG_NF_LOG_ARP=m
> CONFIG_NF_LOG_IPV4=m
> CONFIG_NF_REJECT_IPV4=m
> CONFIG_NF_NAT_SNMP_BASIC=m
> CONFIG_NF_NAT_PPTP=m
> CONFIG_NF_NAT_H323=m
> CONFIG_IP_NF_IPTABLES=m
> CONFIG_IP_NF_MATCH_AH=m
> CONFIG_IP_NF_MATCH_ECN=m
> CONFIG_IP_NF_MATCH_RPFILTER=m
> CONFIG_IP_NF_MATCH_TTL=m
> CONFIG_IP_NF_FILTER=m
> CONFIG_IP_NF_TARGET_REJECT=m
> CONFIG_IP_NF_TARGET_SYNPROXY=m
> CONFIG_IP_NF_NAT=m
> CONFIG_IP_NF_TARGET_MASQUERADE=m
> CONFIG_IP_NF_TARGET_NETMAP=m
> CONFIG_IP_NF_TARGET_REDIRECT=m
> CONFIG_IP_NF_MANGLE=m
> CONFIG_IP_NF_TARGET_CLUSTERIP=m
> CONFIG_IP_NF_TARGET_ECN=m
> CONFIG_IP_NF_TARGET_TTL=m
> CONFIG_IP_NF_RAW=m
> CONFIG_IP_NF_SECURITY=m
> CONFIG_IP_NF_ARPTABLES=m
> CONFIG_IP_NF_ARPFILTER=m
> CONFIG_IP_NF_ARP_MANGLE=m
> # end of IP: Netfilter Configuration
>
> #
> # IPv6: Netfilter Configuration
> #
> CONFIG_NF_SOCKET_IPV6=m
> CONFIG_NF_TPROXY_IPV6=m
> CONFIG_NF_TABLES_IPV6=y
> CONFIG_NFT_REJECT_IPV6=m
> CONFIG_NFT_DUP_IPV6=m
> CONFIG_NFT_FIB_IPV6=m
> CONFIG_NF_DUP_IPV6=m
> CONFIG_NF_REJECT_IPV6=m
> CONFIG_NF_LOG_IPV6=m
> CONFIG_IP6_NF_IPTABLES=m
> CONFIG_IP6_NF_MATCH_AH=m
> CONFIG_IP6_NF_MATCH_EUI64=m
> CONFIG_IP6_NF_MATCH_FRAG=m
> CONFIG_IP6_NF_MATCH_OPTS=m
> CONFIG_IP6_NF_MATCH_HL=m
> CONFIG_IP6_NF_MATCH_IPV6HEADER=m
> CONFIG_IP6_NF_MATCH_MH=m
> CONFIG_IP6_NF_MATCH_RPFILTER=m
> CONFIG_IP6_NF_MATCH_RT=m
> CONFIG_IP6_NF_MATCH_SRH=m
> CONFIG_IP6_NF_TARGET_HL=m
> CONFIG_IP6_NF_FILTER=m
> CONFIG_IP6_NF_TARGET_REJECT=m
> CONFIG_IP6_NF_TARGET_SYNPROXY=m
> CONFIG_IP6_NF_MANGLE=m
> CONFIG_IP6_NF_RAW=m
> CONFIG_IP6_NF_SECURITY=m
> CONFIG_IP6_NF_NAT=m
> CONFIG_IP6_NF_TARGET_MASQUERADE=m
> CONFIG_IP6_NF_TARGET_NPT=m
> # end of IPv6: Netfilter Configuration
>
> CONFIG_NF_DEFRAG_IPV6=m
> CONFIG_NF_TABLES_BRIDGE=m
> CONFIG_NFT_BRIDGE_META=m
> CONFIG_NFT_BRIDGE_REJECT=m
> CONFIG_NF_CONNTRACK_BRIDGE=m
> CONFIG_BRIDGE_NF_EBTABLES=m
> CONFIG_BRIDGE_EBT_BROUTE=m
> CONFIG_BRIDGE_EBT_T_FILTER=m
> CONFIG_BRIDGE_EBT_T_NAT=m
> CONFIG_BRIDGE_EBT_802_3=m
> CONFIG_BRIDGE_EBT_AMONG=m
> CONFIG_BRIDGE_EBT_ARP=m
> CONFIG_BRIDGE_EBT_IP=m
> CONFIG_BRIDGE_EBT_IP6=m
> CONFIG_BRIDGE_EBT_LIMIT=m
> CONFIG_BRIDGE_EBT_MARK=m
> CONFIG_BRIDGE_EBT_PKTTYPE=m
> CONFIG_BRIDGE_EBT_STP=m
> CONFIG_BRIDGE_EBT_VLAN=m
> CONFIG_BRIDGE_EBT_ARPREPLY=m
> CONFIG_BRIDGE_EBT_DNAT=m
> CONFIG_BRIDGE_EBT_MARK_T=m
> CONFIG_BRIDGE_EBT_REDIRECT=m
> CONFIG_BRIDGE_EBT_SNAT=m
> CONFIG_BRIDGE_EBT_LOG=m
> CONFIG_BRIDGE_EBT_NFLOG=m
> # CONFIG_BPFILTER is not set
> # CONFIG_IP_DCCP is not set
> CONFIG_IP_SCTP=m
> # CONFIG_SCTP_DBG_OBJCNT is not set
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
> CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
> CONFIG_SCTP_COOKIE_HMAC_MD5=y
> CONFIG_SCTP_COOKIE_HMAC_SHA1=y
> CONFIG_INET_SCTP_DIAG=m
> CONFIG_RDS=m
> CONFIG_RDS_RDMA=m
> CONFIG_RDS_TCP=m
> # CONFIG_RDS_DEBUG is not set
> CONFIG_TIPC=m
> # CONFIG_TIPC_MEDIA_IB is not set
> CONFIG_TIPC_MEDIA_UDP=y
> CONFIG_TIPC_CRYPTO=y
> CONFIG_TIPC_DIAG=m
> CONFIG_ATM=m
> CONFIG_ATM_CLIP=m
> # CONFIG_ATM_CLIP_NO_ICMP is not set
> CONFIG_ATM_LANE=m
> # CONFIG_ATM_MPOA is not set
> CONFIG_ATM_BR2684=m
> # CONFIG_ATM_BR2684_IPFILTER is not set
> CONFIG_L2TP=m
> CONFIG_L2TP_DEBUGFS=m
> CONFIG_L2TP_V3=y
> CONFIG_L2TP_IP=m
> CONFIG_L2TP_ETH=m
> CONFIG_STP=m
> CONFIG_GARP=m
> CONFIG_MRP=m
> CONFIG_BRIDGE=m
> CONFIG_BRIDGE_IGMP_SNOOPING=y
> CONFIG_BRIDGE_VLAN_FILTERING=y
> CONFIG_BRIDGE_MRP=y
> CONFIG_BRIDGE_CFM=y
> CONFIG_NET_DSA=m
> # CONFIG_NET_DSA_TAG_AR9331 is not set
> CONFIG_NET_DSA_TAG_BRCM_COMMON=m
> CONFIG_NET_DSA_TAG_BRCM=m
> CONFIG_NET_DSA_TAG_BRCM_LEGACY=m
> CONFIG_NET_DSA_TAG_BRCM_PREPEND=m
> CONFIG_NET_DSA_TAG_HELLCREEK=m
> CONFIG_NET_DSA_TAG_GSWIP=m
> CONFIG_NET_DSA_TAG_DSA_COMMON=m
> CONFIG_NET_DSA_TAG_DSA=m
> CONFIG_NET_DSA_TAG_EDSA=m
> CONFIG_NET_DSA_TAG_MTK=m
> CONFIG_NET_DSA_TAG_KSZ=m
> CONFIG_NET_DSA_TAG_OCELOT=m
> CONFIG_NET_DSA_TAG_OCELOT_8021Q=m
> CONFIG_NET_DSA_TAG_QCA=m
> CONFIG_NET_DSA_TAG_RTL4_A=m
> CONFIG_NET_DSA_TAG_RTL8_4=m
> # CONFIG_NET_DSA_TAG_RZN1_A5PSW is not set
> CONFIG_NET_DSA_TAG_LAN9303=m
> CONFIG_NET_DSA_TAG_SJA1105=m
> CONFIG_NET_DSA_TAG_TRAILER=m
> CONFIG_NET_DSA_TAG_XRS700X=m
> CONFIG_VLAN_8021Q=m
> CONFIG_VLAN_8021Q_GVRP=y
> CONFIG_VLAN_8021Q_MVRP=y
> CONFIG_LLC=m
> # CONFIG_LLC2 is not set
> CONFIG_ATALK=m
> CONFIG_DEV_APPLETALK=m
> CONFIG_IPDDP=m
> CONFIG_IPDDP_ENCAP=y
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> # CONFIG_PHONET is not set
> CONFIG_6LOWPAN=m
> CONFIG_6LOWPAN_DEBUGFS=y
> CONFIG_6LOWPAN_NHC=m
> CONFIG_6LOWPAN_NHC_DEST=m
> CONFIG_6LOWPAN_NHC_FRAGMENT=m
> CONFIG_6LOWPAN_NHC_HOP=m
> CONFIG_6LOWPAN_NHC_IPV6=m
> CONFIG_6LOWPAN_NHC_MOBILITY=m
> CONFIG_6LOWPAN_NHC_ROUTING=m
> CONFIG_6LOWPAN_NHC_UDP=m
> CONFIG_6LOWPAN_GHC_EXT_HDR_HOP=m
> CONFIG_6LOWPAN_GHC_UDP=m
> CONFIG_6LOWPAN_GHC_ICMPV6=m
> CONFIG_6LOWPAN_GHC_EXT_HDR_DEST=m
> CONFIG_6LOWPAN_GHC_EXT_HDR_FRAG=m
> CONFIG_6LOWPAN_GHC_EXT_HDR_ROUTE=m
> CONFIG_IEEE802154=m
> # CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
> CONFIG_IEEE802154_SOCKET=m
> CONFIG_IEEE802154_6LOWPAN=m
> CONFIG_MAC802154=m
> CONFIG_NET_SCHED=y
>
> #
> # Queueing/Scheduling
> #
> CONFIG_NET_SCH_CBQ=m
> CONFIG_NET_SCH_HTB=m
> CONFIG_NET_SCH_HFSC=m
> CONFIG_NET_SCH_ATM=m
> CONFIG_NET_SCH_PRIO=m
> CONFIG_NET_SCH_MULTIQ=m
> CONFIG_NET_SCH_RED=m
> CONFIG_NET_SCH_SFB=m
> CONFIG_NET_SCH_SFQ=m
> CONFIG_NET_SCH_TEQL=m
> CONFIG_NET_SCH_TBF=m
> CONFIG_NET_SCH_CBS=m
> CONFIG_NET_SCH_ETF=m
> CONFIG_NET_SCH_TAPRIO=m
> CONFIG_NET_SCH_GRED=m
> CONFIG_NET_SCH_DSMARK=m
> CONFIG_NET_SCH_NETEM=m
> CONFIG_NET_SCH_DRR=m
> CONFIG_NET_SCH_MQPRIO=m
> # CONFIG_NET_SCH_SKBPRIO is not set
> CONFIG_NET_SCH_CHOKE=m
> CONFIG_NET_SCH_QFQ=m
> CONFIG_NET_SCH_CODEL=m
> CONFIG_NET_SCH_FQ_CODEL=y
> CONFIG_NET_SCH_CAKE=m
> CONFIG_NET_SCH_FQ=m
> CONFIG_NET_SCH_HHF=m
> CONFIG_NET_SCH_PIE=m
> # CONFIG_NET_SCH_FQ_PIE is not set
> CONFIG_NET_SCH_INGRESS=m
> CONFIG_NET_SCH_PLUG=m
> CONFIG_NET_SCH_ETS=m
> # CONFIG_NET_SCH_DEFAULT is not set
>
> #
> # Classification
> #
> CONFIG_NET_CLS=y
> CONFIG_NET_CLS_BASIC=m
> CONFIG_NET_CLS_TCINDEX=m
> CONFIG_NET_CLS_ROUTE4=m
> CONFIG_NET_CLS_FW=m
> CONFIG_NET_CLS_U32=m
> CONFIG_CLS_U32_PERF=y
> CONFIG_CLS_U32_MARK=y
> CONFIG_NET_CLS_RSVP=m
> CONFIG_NET_CLS_RSVP6=m
> CONFIG_NET_CLS_FLOW=m
> CONFIG_NET_CLS_CGROUP=y
> CONFIG_NET_CLS_BPF=m
> CONFIG_NET_CLS_FLOWER=m
> CONFIG_NET_CLS_MATCHALL=m
> CONFIG_NET_EMATCH=y
> CONFIG_NET_EMATCH_STACK=32
> CONFIG_NET_EMATCH_CMP=m
> CONFIG_NET_EMATCH_NBYTE=m
> CONFIG_NET_EMATCH_U32=m
> CONFIG_NET_EMATCH_META=m
> CONFIG_NET_EMATCH_TEXT=m
> CONFIG_NET_EMATCH_CANID=m
> CONFIG_NET_EMATCH_IPSET=m
> CONFIG_NET_EMATCH_IPT=m
> CONFIG_NET_CLS_ACT=y
> CONFIG_NET_ACT_POLICE=m
> CONFIG_NET_ACT_GACT=m
> CONFIG_GACT_PROB=y
> CONFIG_NET_ACT_MIRRED=m
> CONFIG_NET_ACT_SAMPLE=m
> CONFIG_NET_ACT_IPT=m
> CONFIG_NET_ACT_NAT=m
> CONFIG_NET_ACT_PEDIT=m
> CONFIG_NET_ACT_SIMP=m
> CONFIG_NET_ACT_SKBEDIT=m
> CONFIG_NET_ACT_CSUM=m
> CONFIG_NET_ACT_MPLS=m
> CONFIG_NET_ACT_VLAN=m
> CONFIG_NET_ACT_BPF=m
> CONFIG_NET_ACT_CONNMARK=m
> CONFIG_NET_ACT_CTINFO=m
> CONFIG_NET_ACT_SKBMOD=m
> CONFIG_NET_ACT_IFE=m
> CONFIG_NET_ACT_TUNNEL_KEY=m
> CONFIG_NET_ACT_CT=m
> CONFIG_NET_ACT_GATE=m
> CONFIG_NET_IFE_SKBMARK=m
> CONFIG_NET_IFE_SKBPRIO=m
> CONFIG_NET_IFE_SKBTCINDEX=m
> CONFIG_NET_TC_SKB_EXT=y
> CONFIG_NET_SCH_FIFO=y
> CONFIG_DCB=y
> CONFIG_DNS_RESOLVER=m
> CONFIG_BATMAN_ADV=m
> CONFIG_BATMAN_ADV_BATMAN_V=y
> CONFIG_BATMAN_ADV_BLA=y
> CONFIG_BATMAN_ADV_DAT=y
> CONFIG_BATMAN_ADV_NC=y
> CONFIG_BATMAN_ADV_MCAST=y
> # CONFIG_BATMAN_ADV_DEBUG is not set
> CONFIG_BATMAN_ADV_TRACING=y
> CONFIG_OPENVSWITCH=m
> CONFIG_OPENVSWITCH_GRE=m
> CONFIG_OPENVSWITCH_VXLAN=m
> CONFIG_OPENVSWITCH_GENEVE=m
> CONFIG_VSOCKETS=m
> CONFIG_VSOCKETS_DIAG=m
> CONFIG_VSOCKETS_LOOPBACK=m
> CONFIG_VIRTIO_VSOCKETS=m
> CONFIG_VIRTIO_VSOCKETS_COMMON=m
> CONFIG_NETLINK_DIAG=y
> CONFIG_MPLS=y
> CONFIG_NET_MPLS_GSO=m
> CONFIG_MPLS_ROUTING=m
> CONFIG_MPLS_IPTUNNEL=m
> CONFIG_NET_NSH=m
> # CONFIG_HSR is not set
> CONFIG_NET_SWITCHDEV=y
> CONFIG_NET_L3_MASTER_DEV=y
> # CONFIG_QRTR is not set
> CONFIG_NET_NCSI=y
> CONFIG_NCSI_OEM_CMD_GET_MAC=y
> CONFIG_NCSI_OEM_CMD_KEEP_PHY=y
> CONFIG_PCPU_DEV_REFCNT=y
> CONFIG_RPS=y
> CONFIG_RFS_ACCEL=y
> CONFIG_SOCK_RX_QUEUE_MAPPING=y
> CONFIG_XPS=y
> CONFIG_CGROUP_NET_PRIO=y
> CONFIG_CGROUP_NET_CLASSID=y
> CONFIG_NET_RX_BUSY_POLL=y
> CONFIG_BQL=y
> CONFIG_BPF_STREAM_PARSER=y
> CONFIG_NET_FLOW_LIMIT=y
>
> #
> # Network testing
> #
> CONFIG_NET_PKTGEN=m
> CONFIG_NET_DROP_MONITOR=y
> # end of Network testing
> # end of Networking options
>
> CONFIG_HAMRADIO=y
>
> #
> # Packet Radio protocols
> #
> CONFIG_AX25=m
> CONFIG_AX25_DAMA_SLAVE=y
> CONFIG_NETROM=m
> CONFIG_ROSE=m
>
> #
> # AX.25 network device drivers
> #
> CONFIG_MKISS=m
> CONFIG_6PACK=m
> CONFIG_BPQETHER=m
> CONFIG_BAYCOM_SER_FDX=m
> CONFIG_BAYCOM_SER_HDX=m
> CONFIG_YAM=m
> # end of AX.25 network device drivers
>
> CONFIG_CAN=m
> CONFIG_CAN_RAW=m
> CONFIG_CAN_BCM=m
> CONFIG_CAN_GW=m
> CONFIG_CAN_J1939=m
> CONFIG_CAN_ISOTP=m
> CONFIG_BT=m
> CONFIG_BT_BREDR=y
> CONFIG_BT_RFCOMM=m
> CONFIG_BT_RFCOMM_TTY=y
> CONFIG_BT_BNEP=m
> CONFIG_BT_BNEP_MC_FILTER=y
> CONFIG_BT_BNEP_PROTO_FILTER=y
> CONFIG_BT_HIDP=m
> # CONFIG_BT_HS is not set
> CONFIG_BT_LE=y
> CONFIG_BT_6LOWPAN=m
> CONFIG_BT_LEDS=y
> CONFIG_BT_MSFTEXT=y
> # CONFIG_BT_AOSPEXT is not set
> # CONFIG_BT_DEBUGFS is not set
> # CONFIG_BT_SELFTEST is not set
>
> #
> # Bluetooth device drivers
> #
> CONFIG_BT_INTEL=m
> CONFIG_BT_BCM=m
> CONFIG_BT_RTL=m
> CONFIG_BT_QCA=m
> CONFIG_BT_MTK=m
> CONFIG_BT_HCIBTUSB=m
> CONFIG_BT_HCIBTUSB_AUTOSUSPEND=y
> CONFIG_BT_HCIBTUSB_BCM=y
> CONFIG_BT_HCIBTUSB_MTK=y
> CONFIG_BT_HCIBTUSB_RTL=y
> CONFIG_BT_HCIBTSDIO=m
> CONFIG_BT_HCIUART=m
> CONFIG_BT_HCIUART_SERDEV=y
> CONFIG_BT_HCIUART_H4=y
> CONFIG_BT_HCIUART_NOKIA=m
> CONFIG_BT_HCIUART_BCSP=y
> CONFIG_BT_HCIUART_ATH3K=y
> CONFIG_BT_HCIUART_LL=y
> CONFIG_BT_HCIUART_3WIRE=y
> CONFIG_BT_HCIUART_INTEL=y
> CONFIG_BT_HCIUART_BCM=y
> # CONFIG_BT_HCIUART_RTL is not set
> CONFIG_BT_HCIUART_QCA=y
> CONFIG_BT_HCIUART_AG6XX=y
> CONFIG_BT_HCIUART_MRVL=y
> CONFIG_BT_HCIBCM203X=m
> CONFIG_BT_HCIBPA10X=m
> CONFIG_BT_HCIBFUSB=m
> CONFIG_BT_HCIVHCI=m
> CONFIG_BT_MRVL=m
> CONFIG_BT_MRVL_SDIO=m
> CONFIG_BT_ATH3K=m
> CONFIG_BT_MTKSDIO=m
> CONFIG_BT_MTKUART=m
> CONFIG_BT_HCIRSI=m
> CONFIG_BT_VIRTIO=m
> # end of Bluetooth device drivers
>
> CONFIG_AF_RXRPC=m
> CONFIG_AF_RXRPC_IPV6=y
> # CONFIG_AF_RXRPC_INJECT_LOSS is not set
> CONFIG_AF_RXRPC_DEBUG=y
> CONFIG_RXKAD=y
> CONFIG_AF_KCM=m
> CONFIG_STREAM_PARSER=y
> CONFIG_MCTP=y
> CONFIG_FIB_RULES=y
> CONFIG_WIRELESS=y
> CONFIG_WIRELESS_EXT=y
> CONFIG_WEXT_CORE=y
> CONFIG_WEXT_PROC=y
> CONFIG_WEXT_SPY=y
> CONFIG_WEXT_PRIV=y
> CONFIG_CFG80211=m
> # CONFIG_NL80211_TESTMODE is not set
> # CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
> CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
> CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y
> CONFIG_CFG80211_DEFAULT_PS=y
> CONFIG_CFG80211_DEBUGFS=y
> CONFIG_CFG80211_CRDA_SUPPORT=y
> CONFIG_CFG80211_WEXT=y
> CONFIG_CFG80211_WEXT_EXPORT=y
> CONFIG_LIB80211=m
> # CONFIG_LIB80211_DEBUG is not set
> CONFIG_MAC80211=m
> CONFIG_MAC80211_HAS_RC=y
> CONFIG_MAC80211_RC_MINSTREL=y
> CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
> CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
> CONFIG_MAC80211_MESH=y
> CONFIG_MAC80211_LEDS=y
> CONFIG_MAC80211_DEBUGFS=y
> # CONFIG_MAC80211_MESSAGE_TRACING is not set
> # CONFIG_MAC80211_DEBUG_MENU is not set
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
> CONFIG_RFKILL=m
> CONFIG_RFKILL_LEDS=y
> CONFIG_RFKILL_INPUT=y
> CONFIG_RFKILL_GPIO=m
> CONFIG_NET_9P=m
> CONFIG_NET_9P_FD=m
> CONFIG_NET_9P_VIRTIO=m
> CONFIG_NET_9P_RDMA=m
> # CONFIG_NET_9P_DEBUG is not set
> # CONFIG_CAIF is not set
> CONFIG_CEPH_LIB=m
> # CONFIG_CEPH_LIB_PRETTYDEBUG is not set
> # CONFIG_CEPH_LIB_USE_DNS_RESOLVER is not set
> CONFIG_NFC=m
> CONFIG_NFC_DIGITAL=m
> CONFIG_NFC_NCI=m
> # CONFIG_NFC_NCI_UART is not set
> CONFIG_NFC_HCI=m
> CONFIG_NFC_SHDLC=y
>
> #
> # Near Field Communication (NFC) devices
> #
> CONFIG_NFC_SIM=m
> CONFIG_NFC_PORT100=m
> # CONFIG_NFC_VIRTUAL_NCI is not set
> # CONFIG_NFC_FDP is not set
> CONFIG_NFC_PN544=m
> CONFIG_NFC_PN544_I2C=m
> CONFIG_NFC_PN533=m
> CONFIG_NFC_PN533_USB=m
> CONFIG_NFC_PN533_I2C=m
> CONFIG_NFC_PN532_UART=m
> CONFIG_NFC_MICROREAD=m
> CONFIG_NFC_MICROREAD_I2C=m
> CONFIG_NFC_MRVL=m
> CONFIG_NFC_MRVL_USB=m
> # CONFIG_NFC_MRVL_I2C is not set
> CONFIG_NFC_ST21NFCA=m
> CONFIG_NFC_ST21NFCA_I2C=m
> # CONFIG_NFC_ST_NCI_I2C is not set
> CONFIG_NFC_NXP_NCI=m
> CONFIG_NFC_NXP_NCI_I2C=m
> # CONFIG_NFC_S3FWRN5_I2C is not set
> # CONFIG_NFC_S3FWRN82_UART is not set
> # end of Near Field Communication (NFC) devices
>
> CONFIG_PSAMPLE=m
> CONFIG_NET_IFE=m
> CONFIG_LWTUNNEL=y
> CONFIG_LWTUNNEL_BPF=y
> CONFIG_DST_CACHE=y
> CONFIG_GRO_CELLS=y
> CONFIG_SOCK_VALIDATE_XMIT=y
> CONFIG_NET_SELFTESTS=y
> CONFIG_NET_SOCK_MSG=y
> CONFIG_NET_DEVLINK=y
> CONFIG_PAGE_POOL=y
> # CONFIG_PAGE_POOL_STATS is not set
> CONFIG_FAILOVER=m
> CONFIG_ETHTOOL_NETLINK=y
> CONFIG_NETDEV_ADDR_LIST_TEST=m
>
> #
> # Device Drivers
> #
> CONFIG_HAVE_PCI=y
> CONFIG_FORCE_PCI=y
> CONFIG_PCI=y
> CONFIG_PCI_DOMAINS=y
> CONFIG_PCI_SYSCALL=y
> # CONFIG_PCIEPORTBUS is not set
> CONFIG_PCIEASPM=y
> CONFIG_PCIEASPM_DEFAULT=y
> # CONFIG_PCIEASPM_POWERSAVE is not set
> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> CONFIG_PCIE_PTM=y
> CONFIG_PCI_MSI=y
> CONFIG_PCI_MSI_IRQ_DOMAIN=y
> CONFIG_PCI_MSI_ARCH_FALLBACKS=y
> CONFIG_PCI_QUIRKS=y
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> CONFIG_PCI_STUB=y
> CONFIG_PCI_PF_STUB=m
> CONFIG_PCI_ATS=y
> CONFIG_PCI_DOE=y
> CONFIG_PCI_ECAM=y
> CONFIG_PCI_IOV=y
> CONFIG_PCI_PRI=y
> CONFIG_PCI_PASID=y
> CONFIG_PCI_P2PDMA=y
> CONFIG_VGA_ARB=y
> CONFIG_VGA_ARB_MAX_GPUS=16
> CONFIG_HOTPLUG_PCI=y
> # CONFIG_HOTPLUG_PCI_CPCI is not set
> CONFIG_HOTPLUG_PCI_SHPC=y
> CONFIG_HOTPLUG_PCI_POWERNV=m
> CONFIG_HOTPLUG_PCI_RPA=m
> CONFIG_HOTPLUG_PCI_RPA_DLPAR=m
>
> #
> # PCI controller drivers
> #
> # CONFIG_PCI_FTPCI100 is not set
> CONFIG_PCI_HOST_COMMON=y
> # CONFIG_PCI_HOST_GENERIC is not set
> # CONFIG_PCIE_XILINX is not set
> CONFIG_PCIE_MICROCHIP_HOST=y
>
> #
> # DesignWare PCI Core Support
> #
> # CONFIG_PCIE_DW_PLAT_HOST is not set
> # CONFIG_PCI_MESON is not set
> # end of DesignWare PCI Core Support
>
> #
> # Mobiveil PCIe Core Support
> #
> # end of Mobiveil PCIe Core Support
>
> #
> # Cadence PCIe controllers support
> #
> CONFIG_PCIE_CADENCE=y
> CONFIG_PCIE_CADENCE_HOST=y
> # CONFIG_PCIE_CADENCE_PLAT_HOST is not set
> CONFIG_PCI_J721E=y
> CONFIG_PCI_J721E_HOST=y
> # end of Cadence PCIe controllers support
> # end of PCI controller drivers
>
> #
> # PCI Endpoint
> #
> # CONFIG_PCI_ENDPOINT is not set
> # end of PCI Endpoint
>
> #
> # PCI switch controller drivers
> #
> CONFIG_PCI_SW_SWITCHTEC=m
> # end of PCI switch controller drivers
>
> CONFIG_CXL_BUS=m
> CONFIG_CXL_PCI=m
> # CONFIG_CXL_MEM_RAW_COMMANDS is not set
> CONFIG_CXL_PMEM=m
> CONFIG_CXL_MEM=m
> CONFIG_CXL_PORT=m
> CONFIG_CXL_SUSPEND=y
> CONFIG_CXL_REGION=y
> CONFIG_PCCARD=y
> # CONFIG_PCMCIA is not set
> CONFIG_CARDBUS=y
>
> #
> # PC-card bridges
> #
> CONFIG_YENTA=m
> CONFIG_YENTA_O2=y
> CONFIG_YENTA_RICOH=y
> CONFIG_YENTA_TI=y
> CONFIG_YENTA_ENE_TUNE=y
> CONFIG_YENTA_TOSHIBA=y
> # CONFIG_RAPIDIO is not set
>
> #
> # Generic Driver Options
> #
> CONFIG_AUXILIARY_BUS=y
> # CONFIG_UEVENT_HELPER is not set
> CONFIG_DEVTMPFS=y
> CONFIG_DEVTMPFS_MOUNT=y
> CONFIG_DEVTMPFS_SAFE=y
> CONFIG_STANDALONE=y
> CONFIG_PREVENT_FIRMWARE_BUILD=y
>
> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=y
> CONFIG_FW_LOADER_PAGED_BUF=y
> CONFIG_FW_LOADER_SYSFS=y
> CONFIG_EXTRA_FIRMWARE=""
> CONFIG_FW_LOADER_USER_HELPER=y
> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> CONFIG_FW_LOADER_COMPRESS=y
> CONFIG_FW_LOADER_COMPRESS_XZ=y
> CONFIG_FW_LOADER_COMPRESS_ZSTD=y
> CONFIG_FW_CACHE=y
> CONFIG_FW_UPLOAD=y
> # end of Firmware loader
>
> CONFIG_WANT_DEV_COREDUMP=y
> CONFIG_ALLOW_DEV_COREDUMP=y
> CONFIG_DEV_COREDUMP=y
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=y
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=y
> CONFIG_GENERIC_CPU_VULNERABILITIES=y
> CONFIG_REGMAP=y
> CONFIG_REGMAP_I2C=m
> CONFIG_REGMAP_MMIO=y
> CONFIG_REGMAP_IRQ=y
> CONFIG_REGMAP_SCCB=m
> CONFIG_DMA_SHARED_BUFFER=y
> # CONFIG_DMA_FENCE_TRACE is not set
> # end of Generic Driver Options
>
> #
> # Bus devices
> #
> CONFIG_MHI_BUS=m
> # CONFIG_MHI_BUS_DEBUG is not set
> CONFIG_MHI_BUS_PCI_GENERIC=m
> # CONFIG_MHI_BUS_EP is not set
> # end of Bus devices
>
> CONFIG_CONNECTOR=y
> CONFIG_PROC_EVENTS=y
>
> #
> # Firmware Drivers
> #
>
> #
> # ARM System Control and Management Interface Protocol
> #
> # end of ARM System Control and Management Interface Protocol
>
> # CONFIG_GOOGLE_FIRMWARE is not set
>
> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
>
> CONFIG_GNSS=m
> CONFIG_GNSS_SERIAL=m
> CONFIG_GNSS_MTK_SERIAL=m
> CONFIG_GNSS_SIRF_SERIAL=m
> CONFIG_GNSS_UBX_SERIAL=m
> CONFIG_GNSS_USB=m
> CONFIG_MTD=m
> # CONFIG_MTD_TESTS is not set
>
> #
> # Partition parsers
> #
> # CONFIG_MTD_AR7_PARTS is not set
> # CONFIG_MTD_CMDLINE_PARTS is not set
> CONFIG_MTD_OF_PARTS=m
> # CONFIG_MTD_REDBOOT_PARTS is not set
> # end of Partition parsers
>
> #
> # User Modules And Translation Layers
> #
> # CONFIG_MTD_BLOCK is not set
> # CONFIG_MTD_BLOCK_RO is not set
> # CONFIG_FTL is not set
> # CONFIG_NFTL is not set
> # CONFIG_INFTL is not set
> # CONFIG_RFD_FTL is not set
> # CONFIG_SSFDC is not set
> # CONFIG_SM_FTL is not set
> # CONFIG_MTD_OOPS is not set
> # CONFIG_MTD_SWAP is not set
> # CONFIG_MTD_PARTITIONED_MASTER is not set
>
> #
> # RAM/ROM/Flash chip drivers
> #
> # CONFIG_MTD_CFI is not set
> # CONFIG_MTD_JEDECPROBE is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=y
> CONFIG_MTD_MAP_BANK_WIDTH_2=y
> CONFIG_MTD_MAP_BANK_WIDTH_4=y
> CONFIG_MTD_CFI_I1=y
> CONFIG_MTD_CFI_I2=y
> # CONFIG_MTD_RAM is not set
> # CONFIG_MTD_ROM is not set
> # CONFIG_MTD_ABSENT is not set
> # end of RAM/ROM/Flash chip drivers
>
> #
> # Mapping drivers for chip access
> #
> # CONFIG_MTD_COMPLEX_MAPPINGS is not set
> # CONFIG_MTD_INTEL_VR_NOR is not set
> # CONFIG_MTD_PLATRAM is not set
> # end of Mapping drivers for chip access
>
> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_PMC551 is not set
> # CONFIG_MTD_SLRAM is not set
> # CONFIG_MTD_PHRAM is not set
> CONFIG_MTD_MTDRAM=m
> CONFIG_MTDRAM_TOTAL_SIZE=4096
> CONFIG_MTDRAM_ERASE_SIZE=128
> CONFIG_MTD_BLOCK2MTD=m
> CONFIG_MTD_POWERNV_FLASH=m
>
> #
> # Disk-On-Chip Device Drivers
> #
> # CONFIG_MTD_DOCG3 is not set
> # end of Self-contained MTD device drivers
>
> #
> # NAND
> #
> CONFIG_MTD_NAND_CORE=m
> # CONFIG_MTD_ONENAND is not set
> CONFIG_MTD_RAW_NAND=m
>
> #
> # Raw/parallel NAND flash controllers
> #
> # CONFIG_MTD_NAND_DENALI_PCI is not set
> # CONFIG_MTD_NAND_DENALI_DT is not set
> # CONFIG_MTD_NAND_CAFE is not set
> # CONFIG_MTD_NAND_MXIC is not set
> # CONFIG_MTD_NAND_GPIO is not set
> # CONFIG_MTD_NAND_PLATFORM is not set
> CONFIG_MTD_NAND_CADENCE=m
> # CONFIG_MTD_NAND_ARASAN is not set
> # CONFIG_MTD_NAND_INTEL_LGM is not set
>
> #
> # Misc
> #
> CONFIG_MTD_NAND_NANDSIM=m
> # CONFIG_MTD_NAND_RICOH is not set
> # CONFIG_MTD_NAND_DISKONCHIP is not set
>
> #
> # ECC engine support
> #
> CONFIG_MTD_NAND_ECC=y
> CONFIG_MTD_NAND_ECC_SW_HAMMING=y
> # CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
> # CONFIG_MTD_NAND_ECC_SW_BCH is not set
> CONFIG_MTD_NAND_ECC_MXIC=y
> # end of ECC engine support
> # end of NAND
>
> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> # CONFIG_MTD_LPDDR is not set
> # end of LPDDR & LPDDR2 PCM memory drivers
>
> CONFIG_MTD_UBI=m
> CONFIG_MTD_UBI_WL_THRESHOLD=4096
> CONFIG_MTD_UBI_BEB_LIMIT=20
> # CONFIG_MTD_UBI_FASTMAP is not set
> # CONFIG_MTD_UBI_GLUEBI is not set
> # CONFIG_MTD_UBI_BLOCK is not set
> # CONFIG_MTD_HYPERBUS is not set
> CONFIG_DTC=y
> CONFIG_OF=y
> # CONFIG_OF_UNITTEST is not set
> CONFIG_OF_FLATTREE=y
> CONFIG_OF_EARLY_FLATTREE=y
> CONFIG_OF_KOBJ=y
> CONFIG_OF_DYNAMIC=y
> CONFIG_OF_ADDRESS=y
> CONFIG_OF_IRQ=y
> CONFIG_OF_RESERVED_MEM=y
> # CONFIG_OF_OVERLAY is not set
> CONFIG_OF_DMA_DEFAULT_COHERENT=y
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
> # CONFIG_PARPORT is not set
> CONFIG_BLK_DEV=y
> CONFIG_BLK_DEV_NULL_BLK=m
> CONFIG_BLK_DEV_FD=m
> # CONFIG_BLK_DEV_FD_RAWCMD is not set
> CONFIG_CDROM=y
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> CONFIG_ZRAM=m
> CONFIG_ZRAM_DEF_COMP_LZORLE=y
> # CONFIG_ZRAM_DEF_COMP_ZSTD is not set
> # CONFIG_ZRAM_DEF_COMP_LZ4 is not set
> # CONFIG_ZRAM_DEF_COMP_LZO is not set
> # CONFIG_ZRAM_DEF_COMP_LZ4HC is not set
> # CONFIG_ZRAM_DEF_COMP_842 is not set
> CONFIG_ZRAM_DEF_COMP="lzo-rle"
> # CONFIG_ZRAM_WRITEBACK is not set
> # CONFIG_ZRAM_MEMORY_TRACKING is not set
> CONFIG_BLK_DEV_LOOP=m
> CONFIG_BLK_DEV_LOOP_MIN_COUNT=0
> CONFIG_BLK_DEV_DRBD=m
> # CONFIG_DRBD_FAULT_INJECTION is not set
> CONFIG_BLK_DEV_NBD=m
> CONFIG_BLK_DEV_RAM=m
> CONFIG_BLK_DEV_RAM_COUNT=16
> CONFIG_BLK_DEV_RAM_SIZE=16384
> CONFIG_CDROM_PKTCDVD=m
> CONFIG_CDROM_PKTCDVD_BUFFERS=8
> # CONFIG_CDROM_PKTCDVD_WCACHE is not set
> CONFIG_ATA_OVER_ETH=m
> CONFIG_VIRTIO_BLK=m
> CONFIG_BLK_DEV_RBD=m
> CONFIG_BLK_DEV_UBLK=m
> CONFIG_BLK_DEV_RNBD=y
> CONFIG_BLK_DEV_RNBD_CLIENT=m
> CONFIG_BLK_DEV_RNBD_SERVER=m
>
> #
> # NVME Support
> #
> CONFIG_NVME_COMMON=m
> CONFIG_NVME_CORE=m
> CONFIG_BLK_DEV_NVME=m
> CONFIG_NVME_MULTIPATH=y
> # CONFIG_NVME_VERBOSE_ERRORS is not set
> CONFIG_NVME_HWMON=y
> CONFIG_NVME_FABRICS=m
> CONFIG_NVME_RDMA=m
> CONFIG_NVME_FC=m
> CONFIG_NVME_TCP=m
> CONFIG_NVME_AUTH=y
> CONFIG_NVME_TARGET=m
> CONFIG_NVME_TARGET_PASSTHRU=y
> CONFIG_NVME_TARGET_LOOP=m
> CONFIG_NVME_TARGET_RDMA=m
> CONFIG_NVME_TARGET_FC=m
> CONFIG_NVME_TARGET_FCLOOP=m
> CONFIG_NVME_TARGET_TCP=m
> CONFIG_NVME_TARGET_AUTH=y
> # end of NVME Support
>
> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=m
> # CONFIG_AD525X_DPOT is not set
> # CONFIG_DUMMY_IRQ is not set
> CONFIG_IBMVMC=m
> # CONFIG_PHANTOM is not set
> CONFIG_TIFM_CORE=m
> CONFIG_TIFM_7XX1=m
> # CONFIG_ICS932S401 is not set
> CONFIG_ENCLOSURE_SERVICES=m
> # CONFIG_HP_ILO is not set
> CONFIG_APDS9802ALS=m
> CONFIG_ISL29003=m
> CONFIG_ISL29020=m
> CONFIG_SENSORS_TSL2550=m
> CONFIG_SENSORS_BH1770=m
> CONFIG_SENSORS_APDS990X=m
> # CONFIG_HMC6352 is not set
> # CONFIG_DS1682 is not set
> # CONFIG_SRAM is not set
> CONFIG_DW_XDATA_PCIE=m
> # CONFIG_PCI_ENDPOINT_TEST is not set
> # CONFIG_XILINX_SDFEC is not set
> CONFIG_MISC_RTSX=m
> CONFIG_HISI_HIKEY_USB=m
> # CONFIG_OPEN_DICE is not set
> CONFIG_VCPU_STALL_DETECTOR=m
> # CONFIG_C2PORT is not set
>
> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=m
> CONFIG_EEPROM_LEGACY=m
> CONFIG_EEPROM_MAX6875=m
> CONFIG_EEPROM_93CX6=m
> CONFIG_EEPROM_IDT_89HPESX=m
> CONFIG_EEPROM_EE1004=m
> # end of EEPROM support
>
> CONFIG_CB710_CORE=m
> # CONFIG_CB710_DEBUG is not set
> CONFIG_CB710_DEBUG_ASSUMPTIONS=y
>
> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # end of Texas Instruments shared transport line discipline
>
> CONFIG_SENSORS_LIS3_I2C=m
> CONFIG_ALTERA_STAPL=m
> CONFIG_GENWQE=m
> CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=1
> CONFIG_ECHO=m
> CONFIG_CXL_BASE=y
> CONFIG_CXL=m
> CONFIG_OCXL_BASE=y
> CONFIG_OCXL=m
> CONFIG_BCM_VK=m
> CONFIG_BCM_VK_TTY=y
> CONFIG_MISC_ALCOR_PCI=m
> CONFIG_MISC_RTSX_PCI=m
> CONFIG_MISC_RTSX_USB=m
> # CONFIG_HABANA_AI is not set
> CONFIG_UACCE=m
> CONFIG_PVPANIC=y
> # CONFIG_PVPANIC_MMIO is not set
> # CONFIG_PVPANIC_PCI is not set
> CONFIG_GP_PCI1XXXX=m
> # end of Misc devices
>
> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=y
> CONFIG_RAID_ATTRS=m
> CONFIG_SCSI_COMMON=y
> CONFIG_SCSI=y
> CONFIG_SCSI_DMA=y
> CONFIG_SCSI_NETLINK=y
> CONFIG_SCSI_PROC_FS=y
>
> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> CONFIG_BLK_DEV_SD=y
> CONFIG_CHR_DEV_ST=m
> CONFIG_BLK_DEV_SR=y
> CONFIG_CHR_DEV_SG=y
> CONFIG_BLK_DEV_BSG=y
> CONFIG_CHR_DEV_SCH=m
> CONFIG_SCSI_ENCLOSURE=m
> CONFIG_SCSI_CONSTANTS=y
> CONFIG_SCSI_LOGGING=y
> CONFIG_SCSI_SCAN_ASYNC=y
>
> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=m
> CONFIG_SCSI_FC_ATTRS=m
> CONFIG_SCSI_ISCSI_ATTRS=m
> CONFIG_SCSI_SAS_ATTRS=m
> CONFIG_SCSI_SAS_LIBSAS=m
> CONFIG_SCSI_SAS_ATA=y
> CONFIG_SCSI_SAS_HOST_SMP=y
> CONFIG_SCSI_SRP_ATTRS=m
> # end of SCSI Transports
>
> CONFIG_SCSI_LOWLEVEL=y
> CONFIG_ISCSI_TCP=m
> CONFIG_ISCSI_BOOT_SYSFS=m
> CONFIG_SCSI_CXGB3_ISCSI=m
> CONFIG_SCSI_CXGB4_ISCSI=m
> CONFIG_SCSI_BNX2_ISCSI=m
> CONFIG_SCSI_BNX2X_FCOE=m
> CONFIG_BE2ISCSI=m
> CONFIG_CXLFLASH=m
> CONFIG_BLK_DEV_3W_XXXX_RAID=m
> CONFIG_SCSI_HPSA=m
> CONFIG_SCSI_3W_9XXX=m
> CONFIG_SCSI_3W_SAS=m
> CONFIG_SCSI_ACARD=m
> CONFIG_SCSI_AACRAID=m
> CONFIG_SCSI_AIC7XXX=m
> CONFIG_AIC7XXX_CMDS_PER_DEVICE=4
> CONFIG_AIC7XXX_RESET_DELAY_MS=15000
> # CONFIG_AIC7XXX_DEBUG_ENABLE is not set
> CONFIG_AIC7XXX_DEBUG_MASK=0
> # CONFIG_AIC7XXX_REG_PRETTY_PRINT is not set
> CONFIG_SCSI_AIC79XX=m
> CONFIG_AIC79XX_CMDS_PER_DEVICE=4
> CONFIG_AIC79XX_RESET_DELAY_MS=15000
> # CONFIG_AIC79XX_DEBUG_ENABLE is not set
> CONFIG_AIC79XX_DEBUG_MASK=0
> # CONFIG_AIC79XX_REG_PRETTY_PRINT is not set
> # CONFIG_SCSI_AIC94XX is not set
> CONFIG_SCSI_MVSAS=m
> # CONFIG_SCSI_MVSAS_DEBUG is not set
> CONFIG_SCSI_MVSAS_TASKLET=y
> CONFIG_SCSI_MVUMI=m
> # CONFIG_SCSI_ADVANSYS is not set
> CONFIG_SCSI_ARCMSR=m
> CONFIG_SCSI_ESAS2R=m
> CONFIG_MEGARAID_NEWGEN=y
> CONFIG_MEGARAID_MM=m
> CONFIG_MEGARAID_MAILBOX=m
> CONFIG_MEGARAID_LEGACY=m
> CONFIG_MEGARAID_SAS=m
> CONFIG_SCSI_MPT3SAS=m
> CONFIG_SCSI_MPT2SAS_MAX_SGE=128
> CONFIG_SCSI_MPT3SAS_MAX_SGE=128
> CONFIG_SCSI_MPT2SAS=m
> CONFIG_SCSI_MPI3MR=m
> CONFIG_SCSI_SMARTPQI=m
> CONFIG_SCSI_HPTIOP=m
> # CONFIG_SCSI_BUSLOGIC is not set
> CONFIG_SCSI_MYRB=m
> CONFIG_SCSI_MYRS=m
> CONFIG_LIBFC=m
> CONFIG_LIBFCOE=m
> CONFIG_FCOE=m
> CONFIG_SCSI_SNIC=m
> # CONFIG_SCSI_SNIC_DEBUG_FS is not set
> CONFIG_SCSI_DMX3191D=m
> CONFIG_SCSI_FDOMAIN=m
> CONFIG_SCSI_FDOMAIN_PCI=m
> # CONFIG_SCSI_IPS is not set
> CONFIG_SCSI_IBMVSCSI=m
> CONFIG_SCSI_IBMVSCSIS=m
> CONFIG_SCSI_IBMVFC=m
> # CONFIG_SCSI_IBMVFC_TRACE is not set
> CONFIG_SCSI_INITIO=m
> CONFIG_SCSI_INIA100=m
> CONFIG_SCSI_STEX=m
> CONFIG_SCSI_SYM53C8XX_2=m
> CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=1
> CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=16
> CONFIG_SCSI_SYM53C8XX_MAX_TAGS=64
> CONFIG_SCSI_SYM53C8XX_MMIO=y
> CONFIG_SCSI_IPR=m
> CONFIG_SCSI_IPR_TRACE=y
> CONFIG_SCSI_IPR_DUMP=y
> CONFIG_SCSI_QLOGIC_1280=m
> CONFIG_SCSI_QLA_FC=m
> CONFIG_TCM_QLA2XXX=m
> # CONFIG_TCM_QLA2XXX_DEBUG is not set
> CONFIG_SCSI_QLA_ISCSI=m
> CONFIG_QEDI=m
> CONFIG_QEDF=m
> CONFIG_SCSI_LPFC=m
> # CONFIG_SCSI_LPFC_DEBUG_FS is not set
> CONFIG_SCSI_EFCT=m
> CONFIG_SCSI_DC395x=m
> CONFIG_SCSI_AM53C974=m
> CONFIG_SCSI_WD719X=m
> CONFIG_SCSI_DEBUG=m
> CONFIG_SCSI_PMCRAID=m
> CONFIG_SCSI_PM8001=m
> CONFIG_SCSI_BFA_FC=m
> CONFIG_SCSI_VIRTIO=m
> CONFIG_SCSI_CHELSIO_FCOE=m
> CONFIG_SCSI_DH=y
> CONFIG_SCSI_DH_RDAC=m
> CONFIG_SCSI_DH_HP_SW=m
> CONFIG_SCSI_DH_EMC=m
> CONFIG_SCSI_DH_ALUA=m
> # end of SCSI device support
>
> CONFIG_ATA=y
> CONFIG_SATA_HOST=y
> CONFIG_PATA_TIMINGS=y
> CONFIG_ATA_VERBOSE_ERROR=y
> CONFIG_ATA_FORCE=y
> CONFIG_SATA_PMP=y
>
> #
> # Controllers with non-SFF native interface
> #
> CONFIG_SATA_AHCI=y
> CONFIG_SATA_MOBILE_LPM_POLICY=3
> CONFIG_SATA_AHCI_PLATFORM=m
> CONFIG_AHCI_DWC=m
> # CONFIG_AHCI_CEVA is not set
> # CONFIG_AHCI_QORIQ is not set
> CONFIG_SATA_INIC162X=m
> CONFIG_SATA_ACARD_AHCI=m
> CONFIG_SATA_SIL24=m
> CONFIG_ATA_SFF=y
>
> #
> # SFF controllers with custom DMA interface
> #
> CONFIG_PDC_ADMA=m
> CONFIG_SATA_QSTOR=m
> CONFIG_SATA_SX4=m
> CONFIG_ATA_BMDMA=y
>
> #
> # SATA SFF controllers with BMDMA
> #
> CONFIG_ATA_PIIX=y
> # CONFIG_SATA_DWC is not set
> CONFIG_SATA_MV=m
> CONFIG_SATA_NV=m
> CONFIG_SATA_PROMISE=m
> CONFIG_SATA_SIL=m
> CONFIG_SATA_SIS=m
> CONFIG_SATA_SVW=m
> CONFIG_SATA_ULI=m
> CONFIG_SATA_VIA=m
> CONFIG_SATA_VITESSE=m
>
> #
> # PATA SFF controllers with BMDMA
> #
> CONFIG_PATA_ALI=m
> CONFIG_PATA_AMD=m
> CONFIG_PATA_ARTOP=m
> # CONFIG_PATA_ATIIXP is not set
> CONFIG_PATA_ATP867X=m
> CONFIG_PATA_CMD64X=m
> # CONFIG_PATA_CYPRESS is not set
> CONFIG_PATA_EFAR=m
> CONFIG_PATA_HPT366=m
> CONFIG_PATA_HPT37X=m
> CONFIG_PATA_HPT3X2N=m
> CONFIG_PATA_HPT3X3=m
> # CONFIG_PATA_HPT3X3_DMA is not set
> CONFIG_PATA_IT8213=m
> CONFIG_PATA_IT821X=m
> CONFIG_PATA_JMICRON=m
> CONFIG_PATA_MARVELL=m
> CONFIG_PATA_NETCELL=m
> CONFIG_PATA_NINJA32=m
> CONFIG_PATA_NS87415=m
> # CONFIG_PATA_OLDPIIX is not set
> CONFIG_PATA_OPTIDMA=m
> CONFIG_PATA_PDC2027X=m
> CONFIG_PATA_PDC_OLD=m
> # CONFIG_PATA_RADISYS is not set
> # CONFIG_PATA_RDC is not set
> # CONFIG_PATA_SCH is not set
> CONFIG_PATA_SERVERWORKS=m
> CONFIG_PATA_SIL680=m
> CONFIG_PATA_SIS=m
> # CONFIG_PATA_TOSHIBA is not set
> # CONFIG_PATA_TRIFLEX is not set
> CONFIG_PATA_VIA=m
> CONFIG_PATA_WINBOND=m
>
> #
> # PIO-only SFF controllers
> #
> CONFIG_PATA_CMD640_PCI=m
> # CONFIG_PATA_MPIIX is not set
> CONFIG_PATA_NS87410=m
> CONFIG_PATA_OPTI=m
> # CONFIG_PATA_OF_PLATFORM is not set
> # CONFIG_PATA_RZ1000 is not set
>
> #
> # Generic fallback / legacy drivers
> #
> CONFIG_ATA_GENERIC=m
> # CONFIG_PATA_LEGACY is not set
> CONFIG_MD=y
> CONFIG_BLK_DEV_MD=y
> CONFIG_MD_AUTODETECT=y
> CONFIG_MD_LINEAR=m
> CONFIG_MD_RAID0=m
> CONFIG_MD_RAID1=m
> CONFIG_MD_RAID10=m
> CONFIG_MD_RAID456=m
> CONFIG_MD_MULTIPATH=m
> CONFIG_MD_FAULTY=m
> # CONFIG_MD_CLUSTER is not set
> CONFIG_BCACHE=m
> # CONFIG_BCACHE_DEBUG is not set
> # CONFIG_BCACHE_CLOSURES_DEBUG is not set
> # CONFIG_BCACHE_ASYNC_REGISTRATION is not set
> CONFIG_BLK_DEV_DM_BUILTIN=y
> CONFIG_BLK_DEV_DM=y
> CONFIG_DM_DEBUG=y
> CONFIG_DM_BUFIO=y
> CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING=y
> # CONFIG_DM_DEBUG_BLOCK_STACK_TRACING is not set
> CONFIG_DM_BIO_PRISON=m
> CONFIG_DM_PERSISTENT_DATA=m
> CONFIG_DM_UNSTRIPED=m
> CONFIG_DM_CRYPT=m
> CONFIG_DM_SNAPSHOT=y
> CONFIG_DM_THIN_PROVISIONING=m
> CONFIG_DM_CACHE=m
> CONFIG_DM_CACHE_SMQ=m
> CONFIG_DM_WRITECACHE=m
> CONFIG_DM_EBS=m
> CONFIG_DM_ERA=m
> CONFIG_DM_CLONE=m
> CONFIG_DM_MIRROR=y
> CONFIG_DM_LOG_USERSPACE=m
> CONFIG_DM_RAID=m
> CONFIG_DM_ZERO=y
> CONFIG_DM_MULTIPATH=m
> CONFIG_DM_MULTIPATH_QL=m
> CONFIG_DM_MULTIPATH_ST=m
> CONFIG_DM_MULTIPATH_HST=m
> CONFIG_DM_MULTIPATH_IOA=m
> CONFIG_DM_DELAY=m
> CONFIG_DM_DUST=m
> CONFIG_DM_INIT=y
> CONFIG_DM_UEVENT=y
> CONFIG_DM_FLAKEY=m
> CONFIG_DM_VERITY=m
> CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG=y
> CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG_SECONDARY_KEYRING=y
> CONFIG_DM_VERITY_FEC=y
> CONFIG_DM_SWITCH=m
> CONFIG_DM_LOG_WRITES=m
> CONFIG_DM_INTEGRITY=m
> CONFIG_DM_ZONED=m
> CONFIG_DM_AUDIT=y
> CONFIG_TARGET_CORE=m
> CONFIG_TCM_IBLOCK=m
> CONFIG_TCM_FILEIO=m
> CONFIG_TCM_PSCSI=m
> CONFIG_TCM_USER2=m
> CONFIG_LOOPBACK_TARGET=m
> CONFIG_TCM_FC=m
> CONFIG_ISCSI_TARGET=m
> CONFIG_ISCSI_TARGET_CXGB4=m
> CONFIG_SBP_TARGET=m
> CONFIG_FUSION=y
> CONFIG_FUSION_SPI=m
> CONFIG_FUSION_FC=m
> CONFIG_FUSION_SAS=m
> CONFIG_FUSION_MAX_SGE=40
> CONFIG_FUSION_CTL=m
> CONFIG_FUSION_LAN=m
> CONFIG_FUSION_LOGGING=y
>
> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=m
> CONFIG_FIREWIRE_OHCI=m
> CONFIG_FIREWIRE_SBP2=m
> CONFIG_FIREWIRE_NET=m
> CONFIG_FIREWIRE_NOSY=m
> # end of IEEE 1394 (FireWire) support
>
> # CONFIG_MACINTOSH_DRIVERS is not set
> CONFIG_NETDEVICES=y
> CONFIG_MII=m
> CONFIG_NET_CORE=y
> CONFIG_BONDING=m
> CONFIG_DUMMY=m
> CONFIG_WIREGUARD=m
> # CONFIG_WIREGUARD_DEBUG is not set
> CONFIG_EQUALIZER=m
> CONFIG_NET_FC=y
> CONFIG_IFB=m
> CONFIG_NET_TEAM=m
> CONFIG_NET_TEAM_MODE_BROADCAST=m
> CONFIG_NET_TEAM_MODE_ROUNDROBIN=m
> CONFIG_NET_TEAM_MODE_RANDOM=m
> CONFIG_NET_TEAM_MODE_ACTIVEBACKUP=m
> CONFIG_NET_TEAM_MODE_LOADBALANCE=m
> CONFIG_MACVLAN=m
> CONFIG_MACVTAP=m
> CONFIG_IPVLAN_L3S=y
> CONFIG_IPVLAN=m
> CONFIG_IPVTAP=m
> CONFIG_VXLAN=m
> CONFIG_GENEVE=m
> CONFIG_BAREUDP=m
> CONFIG_GTP=m
> CONFIG_AMT=m
> CONFIG_MACSEC=m
> CONFIG_NETCONSOLE=m
> CONFIG_NETCONSOLE_DYNAMIC=y
> CONFIG_NETPOLL=y
> CONFIG_NET_POLL_CONTROLLER=y
> CONFIG_TUN=m
> CONFIG_TAP=m
> # CONFIG_TUN_VNET_CROSS_LE is not set
> CONFIG_VETH=m
> CONFIG_VIRTIO_NET=m
> CONFIG_NLMON=m
> CONFIG_NET_VRF=m
> CONFIG_VSOCKMON=m
> CONFIG_MHI_NET=m
> CONFIG_SUNGEM_PHY=m
> # CONFIG_ARCNET is not set
> CONFIG_ATM_DRIVERS=y
> # CONFIG_ATM_DUMMY is not set
> CONFIG_ATM_TCP=m
> # CONFIG_ATM_LANAI is not set
> CONFIG_ATM_ENI=m
> # CONFIG_ATM_ENI_DEBUG is not set
> # CONFIG_ATM_ENI_TUNE_BURST is not set
> CONFIG_ATM_NICSTAR=m
> # CONFIG_ATM_NICSTAR_USE_SUNI is not set
> # CONFIG_ATM_NICSTAR_USE_IDT77105 is not set
> # CONFIG_ATM_IDT77252 is not set
> # CONFIG_ATM_IA is not set
> # CONFIG_ATM_FORE200E is not set
> CONFIG_ATM_HE=m
> # CONFIG_ATM_HE_USE_SUNI is not set
> CONFIG_ATM_SOLOS=m
>
> #
> # Distributed Switch Architecture drivers
> #
> CONFIG_B53=m
> CONFIG_B53_MDIO_DRIVER=m
> CONFIG_B53_MMAP_DRIVER=m
> CONFIG_B53_SRAB_DRIVER=m
> CONFIG_B53_SERDES=m
> CONFIG_NET_DSA_BCM_SF2=m
> CONFIG_NET_DSA_LOOP=m
> CONFIG_NET_DSA_HIRSCHMANN_HELLCREEK=m
> # CONFIG_NET_DSA_LANTIQ_GSWIP is not set
> CONFIG_NET_DSA_MT7530=m
> # CONFIG_NET_DSA_MV88E6060 is not set
> # CONFIG_NET_DSA_MICROCHIP_KSZ_COMMON is not set
> CONFIG_NET_DSA_MV88E6XXX=m
> CONFIG_NET_DSA_MV88E6XXX_PTP=y
> # CONFIG_NET_DSA_AR9331 is not set
> CONFIG_NET_DSA_QCA8K=m
> CONFIG_NET_DSA_XRS700X=m
> CONFIG_NET_DSA_XRS700X_I2C=m
> CONFIG_NET_DSA_XRS700X_MDIO=m
> CONFIG_NET_DSA_REALTEK=m
> # CONFIG_NET_DSA_REALTEK_MDIO is not set
> # CONFIG_NET_DSA_REALTEK_SMI is not set
> CONFIG_NET_DSA_REALTEK_RTL8365MB=m
> CONFIG_NET_DSA_REALTEK_RTL8366RB=m
> CONFIG_NET_DSA_SMSC_LAN9303=m
> CONFIG_NET_DSA_SMSC_LAN9303_I2C=m
> CONFIG_NET_DSA_SMSC_LAN9303_MDIO=m
> # CONFIG_NET_DSA_VITESSE_VSC73XX_PLATFORM is not set
> # end of Distributed Switch Architecture drivers
>
> CONFIG_ETHERNET=y
> CONFIG_MDIO=m
> CONFIG_NET_VENDOR_3COM=y
> CONFIG_VORTEX=m
> CONFIG_TYPHOON=m
> CONFIG_NET_VENDOR_ADAPTEC=y
> CONFIG_ADAPTEC_STARFIRE=m
> CONFIG_NET_VENDOR_AGERE=y
> CONFIG_ET131X=m
> # CONFIG_NET_VENDOR_ALACRITECH is not set
> CONFIG_NET_VENDOR_ALTEON=y
> CONFIG_ACENIC=m
> # CONFIG_ACENIC_OMIT_TIGON_I is not set
> CONFIG_ALTERA_TSE=m
> CONFIG_NET_VENDOR_AMAZON=y
> # CONFIG_ENA_ETHERNET is not set
> CONFIG_NET_VENDOR_AMD=y
> CONFIG_AMD8111_ETH=m
> CONFIG_PCNET32=m
> CONFIG_NET_VENDOR_AQUANTIA=y
> CONFIG_AQTION=m
> CONFIG_NET_VENDOR_ARC=y
> CONFIG_NET_VENDOR_ASIX=y
> CONFIG_NET_VENDOR_ATHEROS=y
> CONFIG_ATL2=m
> CONFIG_ATL1=m
> CONFIG_ATL1E=m
> CONFIG_ATL1C=m
> CONFIG_ALX=m
> CONFIG_NET_VENDOR_BROADCOM=y
> CONFIG_B44=m
> CONFIG_B44_PCI_AUTOSELECT=y
> CONFIG_B44_PCICORE_AUTOSELECT=y
> CONFIG_B44_PCI=y
> CONFIG_BCMGENET=m
> CONFIG_BNX2=m
> CONFIG_CNIC=m
> CONFIG_TIGON3=m
> CONFIG_TIGON3_HWMON=y
> CONFIG_BNX2X=m
> CONFIG_BNX2X_SRIOV=y
> # CONFIG_SYSTEMPORT is not set
> CONFIG_BNXT=m
> CONFIG_BNXT_SRIOV=y
> CONFIG_BNXT_FLOWER_OFFLOAD=y
> CONFIG_BNXT_DCB=y
> CONFIG_BNXT_HWMON=y
> CONFIG_NET_VENDOR_CADENCE=y
> CONFIG_MACB=m
> CONFIG_MACB_USE_HWSTAMP=y
> CONFIG_MACB_PCI=m
> # CONFIG_NET_VENDOR_CAVIUM is not set
> CONFIG_NET_VENDOR_CHELSIO=y
> CONFIG_CHELSIO_T1=m
> CONFIG_CHELSIO_T1_1G=y
> CONFIG_CHELSIO_T3=m
> CONFIG_CHELSIO_T4=m
> CONFIG_CHELSIO_T4_DCB=y
> # CONFIG_CHELSIO_T4_FCOE is not set
> CONFIG_CHELSIO_T4VF=m
> CONFIG_CHELSIO_LIB=m
> CONFIG_CHELSIO_INLINE_CRYPTO=y
> CONFIG_CHELSIO_IPSEC_INLINE=m
> CONFIG_CHELSIO_TLS_DEVICE=m
> CONFIG_NET_VENDOR_CISCO=y
> CONFIG_ENIC=m
> # CONFIG_NET_VENDOR_CORTINA is not set
> CONFIG_NET_VENDOR_DAVICOM=y
> CONFIG_DNET=m
> CONFIG_NET_VENDOR_DEC=y
> CONFIG_NET_TULIP=y
> CONFIG_DE2104X=m
> CONFIG_DE2104X_DSL=0
> CONFIG_TULIP=m
> # CONFIG_TULIP_MWI is not set
> CONFIG_TULIP_MMIO=y
> # CONFIG_TULIP_NAPI is not set
> CONFIG_WINBOND_840=m
> CONFIG_DM9102=m
> CONFIG_ULI526X=m
> CONFIG_PCMCIA_XIRCOM=m
> CONFIG_NET_VENDOR_DLINK=y
> CONFIG_DL2K=m
> CONFIG_SUNDANCE=m
> # CONFIG_SUNDANCE_MMIO is not set
> CONFIG_NET_VENDOR_EMULEX=y
> CONFIG_BE2NET=m
> # CONFIG_BE2NET_HWMON is not set
> CONFIG_BE2NET_BE2=y
> CONFIG_BE2NET_BE3=y
> CONFIG_BE2NET_LANCER=y
> CONFIG_BE2NET_SKYHAWK=y
> CONFIG_NET_VENDOR_ENGLEDER=y
> CONFIG_TSNEP=m
> # CONFIG_TSNEP_SELFTESTS is not set
> # CONFIG_NET_VENDOR_EZCHIP is not set
> CONFIG_NET_VENDOR_FUNGIBLE=y
> CONFIG_FUN_CORE=m
> CONFIG_FUN_ETH=m
> CONFIG_NET_VENDOR_GOOGLE=y
> CONFIG_GVE=m
> # CONFIG_NET_VENDOR_HUAWEI is not set
> # CONFIG_NET_VENDOR_I825XX is not set
> CONFIG_NET_VENDOR_IBM=y
> CONFIG_IBMVETH=m
> CONFIG_IBMVNIC=m
> CONFIG_NET_VENDOR_INTEL=y
> CONFIG_E100=m
> CONFIG_E1000=m
> CONFIG_E1000E=m
> CONFIG_IGB=m
> CONFIG_IGB_HWMON=y
> CONFIG_IGBVF=m
> CONFIG_IXGB=m
> CONFIG_IXGBE=m
> CONFIG_IXGBE_HWMON=y
> CONFIG_IXGBE_DCB=y
> CONFIG_IXGBE_IPSEC=y
> CONFIG_IXGBEVF=m
> CONFIG_IXGBEVF_IPSEC=y
> CONFIG_I40E=m
> # CONFIG_I40E_DCB is not set
> CONFIG_IAVF=m
> CONFIG_I40EVF=m
> CONFIG_ICE=m
> CONFIG_ICE_SWITCHDEV=y
> CONFIG_FM10K=m
> CONFIG_IGC=m
> CONFIG_NET_VENDOR_WANGXUN=y
> CONFIG_NGBE=m
> CONFIG_TXGBE=m
> CONFIG_JME=m
> CONFIG_NET_VENDOR_LITEX=y
> CONFIG_LITEX_LITEETH=m
> CONFIG_NET_VENDOR_MARVELL=y
> CONFIG_MVMDIO=m
> CONFIG_SKGE=m
> # CONFIG_SKGE_DEBUG is not set
> CONFIG_SKGE_GENESIS=y
> CONFIG_SKY2=m
> # CONFIG_SKY2_DEBUG is not set
> CONFIG_OCTEON_EP=m
> CONFIG_PRESTERA=m
> CONFIG_PRESTERA_PCI=m
> CONFIG_NET_VENDOR_MELLANOX=y
> CONFIG_MLX4_EN=m
> CONFIG_MLX4_EN_DCB=y
> CONFIG_MLX4_CORE=m
> CONFIG_MLX4_DEBUG=y
> CONFIG_MLX4_CORE_GEN2=y
> CONFIG_MLX5_CORE=m
> # CONFIG_MLX5_FPGA is not set
> CONFIG_MLX5_CORE_EN=y
> CONFIG_MLX5_EN_ARFS=y
> CONFIG_MLX5_EN_RXNFC=y
> CONFIG_MLX5_MPFS=y
> CONFIG_MLX5_ESWITCH=y
> CONFIG_MLX5_BRIDGE=y
> CONFIG_MLX5_CLS_ACT=y
> CONFIG_MLX5_TC_CT=y
> CONFIG_MLX5_TC_SAMPLE=y
> CONFIG_MLX5_CORE_EN_DCB=y
> CONFIG_MLX5_CORE_IPOIB=y
> CONFIG_MLX5_EN_MACSEC=y
> CONFIG_MLX5_EN_IPSEC=y
> CONFIG_MLX5_EN_TLS=y
> CONFIG_MLX5_SW_STEERING=y
> CONFIG_MLX5_SF=y
> CONFIG_MLX5_SF_MANAGER=y
> CONFIG_MLXSW_CORE=m
> CONFIG_MLXSW_CORE_HWMON=y
> CONFIG_MLXSW_CORE_THERMAL=y
> CONFIG_MLXSW_PCI=m
> CONFIG_MLXSW_I2C=m
> CONFIG_MLXSW_SPECTRUM=m
> CONFIG_MLXSW_SPECTRUM_DCB=y
> CONFIG_MLXSW_MINIMAL=m
> CONFIG_MLXFW=m
> CONFIG_NET_VENDOR_MICREL=y
> # CONFIG_KS8842 is not set
> # CONFIG_KS8851_MLL is not set
> CONFIG_KSZ884X_PCI=m
> # CONFIG_NET_VENDOR_MICROCHIP is not set
> # CONFIG_NET_VENDOR_MICROSEMI is not set
> CONFIG_NET_VENDOR_MICROSOFT=y
> CONFIG_NET_VENDOR_MYRI=y
> CONFIG_MYRI10GE=m
> CONFIG_FEALNX=m
> # CONFIG_NET_VENDOR_NI is not set
> CONFIG_NET_VENDOR_NATSEMI=y
> CONFIG_NATSEMI=m
> CONFIG_NS83820=m
> CONFIG_NET_VENDOR_NETERION=y
> CONFIG_S2IO=m
> CONFIG_NET_VENDOR_NETRONOME=y
> CONFIG_NFP=m
> CONFIG_NFP_APP_FLOWER=y
> # CONFIG_NFP_APP_ABM_NIC is not set
> # CONFIG_NFP_DEBUG is not set
> CONFIG_NET_VENDOR_8390=y
> CONFIG_NE2K_PCI=m
> CONFIG_NET_VENDOR_NVIDIA=y
> CONFIG_FORCEDETH=m
> CONFIG_NET_VENDOR_OKI=y
> CONFIG_ETHOC=m
> CONFIG_NET_VENDOR_PACKET_ENGINES=y
> CONFIG_HAMACHI=m
> CONFIG_YELLOWFIN=m
> CONFIG_NET_VENDOR_PENSANDO=y
> CONFIG_IONIC=m
> CONFIG_NET_VENDOR_QLOGIC=y
> CONFIG_QLA3XXX=m
> CONFIG_QLCNIC=m
> CONFIG_QLCNIC_SRIOV=y
> CONFIG_QLCNIC_DCB=y
> CONFIG_QLCNIC_HWMON=y
> CONFIG_NETXEN_NIC=m
> CONFIG_QED=m
> CONFIG_QED_LL2=y
> CONFIG_QED_SRIOV=y
> CONFIG_QEDE=m
> CONFIG_QED_RDMA=y
> CONFIG_QED_ISCSI=y
> CONFIG_QED_FCOE=y
> CONFIG_QED_OOO=y
> CONFIG_NET_VENDOR_BROCADE=y
> CONFIG_BNA=m
> # CONFIG_NET_VENDOR_QUALCOMM is not set
> CONFIG_NET_VENDOR_RDC=y
> CONFIG_R6040=m
> CONFIG_NET_VENDOR_REALTEK=y
> CONFIG_8139CP=m
> CONFIG_8139TOO=m
> # CONFIG_8139TOO_PIO is not set
> # CONFIG_8139TOO_TUNE_TWISTER is not set
> CONFIG_8139TOO_8129=y
> # CONFIG_8139_OLD_RX_RESET is not set
> CONFIG_R8169=m
> # CONFIG_NET_VENDOR_RENESAS is not set
> CONFIG_NET_VENDOR_ROCKER=y
> CONFIG_ROCKER=m
> # CONFIG_NET_VENDOR_SAMSUNG is not set
> # CONFIG_NET_VENDOR_SEEQ is not set
> CONFIG_NET_VENDOR_SILAN=y
> CONFIG_SC92031=m
> CONFIG_NET_VENDOR_SIS=y
> CONFIG_SIS900=m
> CONFIG_SIS190=m
> # CONFIG_NET_VENDOR_SOLARFLARE is not set
> CONFIG_NET_VENDOR_SMSC=y
> CONFIG_EPIC100=m
> CONFIG_SMSC911X=m
> CONFIG_SMSC9420=m
> # CONFIG_NET_VENDOR_SOCIONEXT is not set
> CONFIG_NET_VENDOR_STMICRO=y
> CONFIG_STMMAC_ETH=m
> # CONFIG_STMMAC_SELFTESTS is not set
> # CONFIG_STMMAC_PLATFORM is not set
> # CONFIG_DWMAC_LOONGSON is not set
> # CONFIG_STMMAC_PCI is not set
> CONFIG_NET_VENDOR_SUN=y
> CONFIG_HAPPYMEAL=m
> CONFIG_SUNGEM=m
> CONFIG_CASSINI=m
> CONFIG_NIU=m
> # CONFIG_NET_VENDOR_SYNOPSYS is not set
> CONFIG_NET_VENDOR_TEHUTI=y
> CONFIG_TEHUTI=m
> CONFIG_NET_VENDOR_TI=y
> # CONFIG_TI_CPSW_PHY_SEL is not set
> CONFIG_TLAN=m
> CONFIG_NET_VENDOR_VERTEXCOM=y
> CONFIG_NET_VENDOR_VIA=y
> CONFIG_VIA_RHINE=m
> CONFIG_VIA_RHINE_MMIO=y
> CONFIG_VIA_VELOCITY=m
> CONFIG_NET_VENDOR_WIZNET=y
> CONFIG_WIZNET_W5100=m
> CONFIG_WIZNET_W5300=m
> # CONFIG_WIZNET_BUS_DIRECT is not set
> # CONFIG_WIZNET_BUS_INDIRECT is not set
> CONFIG_WIZNET_BUS_ANY=y
> CONFIG_NET_VENDOR_XILINX=y
> # CONFIG_XILINX_EMACLITE is not set
> # CONFIG_XILINX_AXI_EMAC is not set
> CONFIG_XILINX_LL_TEMAC=m
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> CONFIG_PHYLINK=m
> CONFIG_PHYLIB=y
> CONFIG_SWPHY=y
> CONFIG_LED_TRIGGER_PHY=y
> CONFIG_FIXED_PHY=y
> CONFIG_SFP=m
>
> #
> # MII PHY device drivers
> #
> CONFIG_AMD_PHY=m
> CONFIG_ADIN_PHY=m
> # CONFIG_ADIN1100_PHY is not set
> CONFIG_AQUANTIA_PHY=m
> CONFIG_AX88796B_PHY=m
> CONFIG_BROADCOM_PHY=m
> CONFIG_BCM54140_PHY=m
> CONFIG_BCM7XXX_PHY=m
> # CONFIG_BCM84881_PHY is not set
> CONFIG_BCM87XX_PHY=m
> CONFIG_BCM_NET_PHYLIB=m
> CONFIG_BCM_NET_PHYPTP=m
> CONFIG_CICADA_PHY=m
> CONFIG_CORTINA_PHY=m
> CONFIG_DAVICOM_PHY=m
> CONFIG_ICPLUS_PHY=m
> CONFIG_LXT_PHY=m
> CONFIG_INTEL_XWAY_PHY=m
> CONFIG_LSI_ET1011C_PHY=m
> CONFIG_MARVELL_PHY=m
> CONFIG_MARVELL_10G_PHY=m
> CONFIG_MARVELL_88X2222_PHY=m
> CONFIG_MAXLINEAR_GPHY=m
> CONFIG_MEDIATEK_GE_PHY=m
> CONFIG_MICREL_PHY=m
> CONFIG_MICROCHIP_PHY=m
> # CONFIG_MICROCHIP_T1_PHY is not set
> CONFIG_MICROSEMI_PHY=m
> CONFIG_MOTORCOMM_PHY=m
> CONFIG_NATIONAL_PHY=m
> CONFIG_NXP_C45_TJA11XX_PHY=m
> # CONFIG_NXP_TJA11XX_PHY is not set
> CONFIG_AT803X_PHY=m
> CONFIG_QSEMI_PHY=m
> CONFIG_REALTEK_PHY=y
> # CONFIG_RENESAS_PHY is not set
> # CONFIG_ROCKCHIP_PHY is not set
> CONFIG_SMSC_PHY=m
> CONFIG_STE10XP=m
> CONFIG_TERANETICS_PHY=m
> CONFIG_DP83822_PHY=m
> # CONFIG_DP83TC811_PHY is not set
> CONFIG_DP83848_PHY=m
> # CONFIG_DP83867_PHY is not set
> CONFIG_DP83869_PHY=m
> # CONFIG_DP83TD510_PHY is not set
> CONFIG_VITESSE_PHY=m
> CONFIG_XILINX_GMII2RGMII=m
> # CONFIG_PSE_CONTROLLER is not set
> CONFIG_CAN_DEV=m
> CONFIG_CAN_VCAN=m
> CONFIG_CAN_VXCAN=m
> CONFIG_CAN_NETLINK=y
> CONFIG_CAN_CALC_BITTIMING=y
> CONFIG_CAN_RX_OFFLOAD=y
> CONFIG_CAN_CAN327=m
> # CONFIG_CAN_FLEXCAN is not set
> # CONFIG_CAN_GRCAN is not set
> # CONFIG_CAN_KVASER_PCIEFD is not set
> CONFIG_CAN_SLCAN=m
> # CONFIG_CAN_C_CAN is not set
> # CONFIG_CAN_CC770 is not set
> CONFIG_CAN_CTUCANFD=m
> CONFIG_CAN_CTUCANFD_PCI=m
> CONFIG_CAN_CTUCANFD_PLATFORM=m
> CONFIG_CAN_IFI_CANFD=m
> CONFIG_CAN_M_CAN=m
> CONFIG_CAN_M_CAN_PCI=m
> # CONFIG_CAN_M_CAN_PLATFORM is not set
> # CONFIG_CAN_MSCAN is not set
> CONFIG_CAN_PEAK_PCIEFD=m
> # CONFIG_CAN_SJA1000 is not set
> # CONFIG_CAN_SOFTING is not set
>
> #
> # CAN USB interfaces
> #
> CONFIG_CAN_8DEV_USB=m
> CONFIG_CAN_EMS_USB=m
> CONFIG_CAN_ESD_USB=m
> # CONFIG_CAN_ETAS_ES58X is not set
> CONFIG_CAN_GS_USB=m
> CONFIG_CAN_KVASER_USB=m
> CONFIG_CAN_MCBA_USB=m
> CONFIG_CAN_PEAK_USB=m
> # CONFIG_CAN_UCAN is not set
> # end of CAN USB interfaces
>
> # CONFIG_CAN_DEBUG_DEVICES is not set
>
> #
> # MCTP Device Drivers
> #
> CONFIG_MCTP_SERIAL=m
> # CONFIG_MCTP_TRANSPORT_I2C is not set
> # end of MCTP Device Drivers
>
> CONFIG_MDIO_DEVICE=y
> CONFIG_MDIO_BUS=y
> CONFIG_FWNODE_MDIO=y
> CONFIG_OF_MDIO=y
> CONFIG_MDIO_DEVRES=y
> CONFIG_MDIO_BITBANG=m
> CONFIG_MDIO_BCM_UNIMAC=m
> CONFIG_MDIO_GPIO=m
> # CONFIG_MDIO_HISI_FEMAC is not set
> CONFIG_MDIO_I2C=m
> CONFIG_MDIO_MVUSB=m
> # CONFIG_MDIO_MSCC_MIIM is not set
> # CONFIG_MDIO_OCTEON is not set
> # CONFIG_MDIO_IPQ4019 is not set
> # CONFIG_MDIO_IPQ8064 is not set
> # CONFIG_MDIO_THUNDER is not set
>
> #
> # MDIO Multiplexers
> #
> # CONFIG_MDIO_BUS_MUX_GPIO is not set
> # CONFIG_MDIO_BUS_MUX_MULTIPLEXER is not set
> # CONFIG_MDIO_BUS_MUX_MMIOREG is not set
>
> #
> # PCS device drivers
> #
> CONFIG_PCS_XPCS=m
> CONFIG_PCS_ALTERA_TSE=m
> # end of PCS device drivers
>
> CONFIG_PPP=m
> CONFIG_PPP_BSDCOMP=m
> CONFIG_PPP_DEFLATE=m
> CONFIG_PPP_FILTER=y
> CONFIG_PPP_MPPE=m
> CONFIG_PPP_MULTILINK=y
> CONFIG_PPPOATM=m
> CONFIG_PPPOE=m
> CONFIG_PPTP=m
> CONFIG_PPPOL2TP=m
> CONFIG_PPP_ASYNC=m
> CONFIG_PPP_SYNC_TTY=m
> CONFIG_SLIP=m
> CONFIG_SLHC=m
> CONFIG_SLIP_COMPRESSED=y
> CONFIG_SLIP_SMART=y
> # CONFIG_SLIP_MODE_SLIP6 is not set
> CONFIG_USB_NET_DRIVERS=y
> CONFIG_USB_CATC=m
> CONFIG_USB_KAWETH=m
> CONFIG_USB_PEGASUS=m
> CONFIG_USB_RTL8150=m
> CONFIG_USB_RTL8152=m
> CONFIG_USB_LAN78XX=m
> CONFIG_USB_USBNET=m
> CONFIG_USB_NET_AX8817X=m
> CONFIG_USB_NET_AX88179_178A=m
> CONFIG_USB_NET_CDCETHER=m
> CONFIG_USB_NET_CDC_EEM=m
> CONFIG_USB_NET_CDC_NCM=m
> CONFIG_USB_NET_HUAWEI_CDC_NCM=m
> CONFIG_USB_NET_CDC_MBIM=m
> CONFIG_USB_NET_DM9601=m
> CONFIG_USB_NET_SR9700=m
> # CONFIG_USB_NET_SR9800 is not set
> CONFIG_USB_NET_SMSC75XX=m
> CONFIG_USB_NET_SMSC95XX=m
> CONFIG_USB_NET_GL620A=m
> CONFIG_USB_NET_NET1080=m
> CONFIG_USB_NET_PLUSB=m
> CONFIG_USB_NET_MCS7830=m
> CONFIG_USB_NET_RNDIS_HOST=m
> CONFIG_USB_NET_CDC_SUBSET_ENABLE=m
> CONFIG_USB_NET_CDC_SUBSET=m
> CONFIG_USB_ALI_M5632=y
> CONFIG_USB_AN2720=y
> CONFIG_USB_BELKIN=y
> CONFIG_USB_ARMLINUX=y
> CONFIG_USB_EPSON2888=y
> CONFIG_USB_KC2190=y
> CONFIG_USB_NET_ZAURUS=m
> CONFIG_USB_NET_CX82310_ETH=m
> CONFIG_USB_NET_KALMIA=m
> CONFIG_USB_NET_QMI_WWAN=m
> CONFIG_USB_HSO=m
> CONFIG_USB_NET_INT51X1=m
> CONFIG_USB_IPHETH=m
> CONFIG_USB_SIERRA_NET=m
> CONFIG_USB_VL600=m
> CONFIG_USB_NET_CH9200=m
> CONFIG_USB_NET_AQC111=m
> CONFIG_USB_RTL8153_ECM=m
> CONFIG_WLAN=y
> # CONFIG_WLAN_VENDOR_ADMTEK is not set
> CONFIG_ATH_COMMON=m
> CONFIG_WLAN_VENDOR_ATH=y
> # CONFIG_ATH_DEBUG is not set
> CONFIG_ATH5K=m
> CONFIG_ATH5K_DEBUG=y
> # CONFIG_ATH5K_TRACER is not set
> CONFIG_ATH5K_PCI=y
> CONFIG_ATH9K_HW=m
> CONFIG_ATH9K_COMMON=m
> CONFIG_ATH9K_COMMON_DEBUG=y
> CONFIG_ATH9K_BTCOEX_SUPPORT=y
> CONFIG_ATH9K=m
> CONFIG_ATH9K_PCI=y
> CONFIG_ATH9K_AHB=y
> CONFIG_ATH9K_DEBUGFS=y
> # CONFIG_ATH9K_STATION_STATISTICS is not set
> # CONFIG_ATH9K_DYNACK is not set
> # CONFIG_ATH9K_WOW is not set
> CONFIG_ATH9K_RFKILL=y
> # CONFIG_ATH9K_CHANNEL_CONTEXT is not set
> CONFIG_ATH9K_PCOEM=y
> CONFIG_ATH9K_PCI_NO_EEPROM=m
> CONFIG_ATH9K_HTC=m
> # CONFIG_ATH9K_HTC_DEBUGFS is not set
> # CONFIG_ATH9K_HWRNG is not set
> # CONFIG_ATH9K_COMMON_SPECTRAL is not set
> CONFIG_CARL9170=m
> CONFIG_CARL9170_LEDS=y
> # CONFIG_CARL9170_DEBUGFS is not set
> CONFIG_CARL9170_WPC=y
> # CONFIG_CARL9170_HWRNG is not set
> CONFIG_ATH6KL=m
> CONFIG_ATH6KL_SDIO=m
> CONFIG_ATH6KL_USB=m
> CONFIG_ATH6KL_DEBUG=y
> # CONFIG_ATH6KL_TRACING is not set
> CONFIG_AR5523=m
> CONFIG_WIL6210=m
> CONFIG_WIL6210_ISR_COR=y
> # CONFIG_WIL6210_TRACING is not set
> CONFIG_WIL6210_DEBUGFS=y
> CONFIG_ATH10K=m
> CONFIG_ATH10K_CE=y
> CONFIG_ATH10K_PCI=m
> # CONFIG_ATH10K_AHB is not set
> CONFIG_ATH10K_SDIO=m
> CONFIG_ATH10K_USB=m
> # CONFIG_ATH10K_DEBUG is not set
> CONFIG_ATH10K_DEBUGFS=y
> # CONFIG_ATH10K_SPECTRAL is not set
> # CONFIG_ATH10K_TRACING is not set
> CONFIG_WCN36XX=m
> # CONFIG_WCN36XX_DEBUGFS is not set
> # CONFIG_ATH11K is not set
> # CONFIG_WLAN_VENDOR_ATMEL is not set
> CONFIG_WLAN_VENDOR_BROADCOM=y
> CONFIG_B43=m
> CONFIG_B43_BCMA=y
> CONFIG_B43_SSB=y
> CONFIG_B43_BUSES_BCMA_AND_SSB=y
> # CONFIG_B43_BUSES_BCMA is not set
> # CONFIG_B43_BUSES_SSB is not set
> CONFIG_B43_PCI_AUTOSELECT=y
> CONFIG_B43_PCICORE_AUTOSELECT=y
> CONFIG_B43_SDIO=y
> CONFIG_B43_BCMA_PIO=y
> CONFIG_B43_PIO=y
> CONFIG_B43_PHY_G=y
> CONFIG_B43_PHY_N=y
> CONFIG_B43_PHY_LP=y
> CONFIG_B43_PHY_HT=y
> CONFIG_B43_LEDS=y
> CONFIG_B43_HWRNG=y
> # CONFIG_B43_DEBUG is not set
> CONFIG_B43LEGACY=m
> CONFIG_B43LEGACY_PCI_AUTOSELECT=y
> CONFIG_B43LEGACY_PCICORE_AUTOSELECT=y
> CONFIG_B43LEGACY_LEDS=y
> CONFIG_B43LEGACY_HWRNG=y
> # CONFIG_B43LEGACY_DEBUG is not set
> CONFIG_B43LEGACY_DMA=y
> CONFIG_B43LEGACY_PIO=y
> CONFIG_B43LEGACY_DMA_AND_PIO_MODE=y
> # CONFIG_B43LEGACY_DMA_MODE is not set
> # CONFIG_B43LEGACY_PIO_MODE is not set
> CONFIG_BRCMUTIL=m
> CONFIG_BRCMSMAC=m
> CONFIG_BRCMSMAC_LEDS=y
> CONFIG_BRCMFMAC=m
> CONFIG_BRCMFMAC_PROTO_BCDC=y
> CONFIG_BRCMFMAC_PROTO_MSGBUF=y
> CONFIG_BRCMFMAC_SDIO=y
> CONFIG_BRCMFMAC_USB=y
> CONFIG_BRCMFMAC_PCIE=y
> # CONFIG_BRCM_TRACING is not set
> # CONFIG_BRCMDBG is not set
> # CONFIG_WLAN_VENDOR_CISCO is not set
> CONFIG_WLAN_VENDOR_INTEL=y
> # CONFIG_IPW2100 is not set
> # CONFIG_IPW2200 is not set
> CONFIG_IWLEGACY=m
> CONFIG_IWL4965=m
> CONFIG_IWL3945=m
>
> #
> # iwl3945 / iwl4965 Debugging Options
> #
> CONFIG_IWLEGACY_DEBUG=y
> CONFIG_IWLEGACY_DEBUGFS=y
> # end of iwl3945 / iwl4965 Debugging Options
>
> CONFIG_IWLWIFI=m
> CONFIG_IWLWIFI_LEDS=y
> CONFIG_IWLDVM=m
> CONFIG_IWLMVM=m
> CONFIG_IWLWIFI_OPMODE_MODULAR=y
>
> #
> # Debugging Options
> #
> CONFIG_IWLWIFI_DEBUG=y
> CONFIG_IWLWIFI_DEBUGFS=y
> # CONFIG_IWLWIFI_DEVICE_TRACING is not set
> # end of Debugging Options
>
> CONFIG_WLAN_VENDOR_INTERSIL=y
> # CONFIG_HOSTAP is not set
> CONFIG_HERMES=m
> CONFIG_HERMES_PRISM=y
> CONFIG_HERMES_CACHE_FW_ON_INIT=y
> CONFIG_PLX_HERMES=m
> # CONFIG_TMD_HERMES is not set
> CONFIG_NORTEL_HERMES=m
> CONFIG_PCI_HERMES=m
> CONFIG_ORINOCO_USB=m
> CONFIG_P54_COMMON=m
> CONFIG_P54_USB=m
> CONFIG_P54_PCI=m
> CONFIG_P54_LEDS=y
> CONFIG_WLAN_VENDOR_MARVELL=y
> CONFIG_LIBERTAS=m
> CONFIG_LIBERTAS_USB=m
> CONFIG_LIBERTAS_SDIO=m
> # CONFIG_LIBERTAS_DEBUG is not set
> CONFIG_LIBERTAS_MESH=y
> # CONFIG_LIBERTAS_THINFIRM is not set
> CONFIG_MWIFIEX=m
> CONFIG_MWIFIEX_SDIO=m
> CONFIG_MWIFIEX_PCIE=m
> CONFIG_MWIFIEX_USB=m
> CONFIG_MWL8K=m
> CONFIG_WLAN_VENDOR_MEDIATEK=y
> CONFIG_MT7601U=m
> CONFIG_MT76_CORE=m
> CONFIG_MT76_LEDS=y
> CONFIG_MT76_USB=m
> CONFIG_MT76_SDIO=m
> CONFIG_MT76x02_LIB=m
> CONFIG_MT76x02_USB=m
> CONFIG_MT76_CONNAC_LIB=m
> CONFIG_MT76x0_COMMON=m
> CONFIG_MT76x0U=m
> CONFIG_MT76x0E=m
> CONFIG_MT76x2_COMMON=m
> CONFIG_MT76x2E=m
> CONFIG_MT76x2U=m
> CONFIG_MT7603E=m
> CONFIG_MT7615_COMMON=m
> CONFIG_MT7615E=m
> CONFIG_MT7663_USB_SDIO_COMMON=m
> CONFIG_MT7663U=m
> CONFIG_MT7663S=m
> CONFIG_MT7915E=m
> CONFIG_MT7921_COMMON=m
> CONFIG_MT7921E=m
> CONFIG_MT7921S=m
> CONFIG_MT7921U=m
> CONFIG_WLAN_VENDOR_MICROCHIP=y
> # CONFIG_WILC1000_SDIO is not set
> # CONFIG_WLAN_VENDOR_PURELIFI is not set
> CONFIG_WLAN_VENDOR_RALINK=y
> CONFIG_RT2X00=m
> CONFIG_RT2400PCI=m
> CONFIG_RT2500PCI=m
> CONFIG_RT61PCI=m
> CONFIG_RT2800PCI=m
> CONFIG_RT2800PCI_RT33XX=y
> CONFIG_RT2800PCI_RT35XX=y
> CONFIG_RT2800PCI_RT53XX=y
> CONFIG_RT2800PCI_RT3290=y
> CONFIG_RT2500USB=m
> CONFIG_RT73USB=m
> CONFIG_RT2800USB=m
> CONFIG_RT2800USB_RT33XX=y
> CONFIG_RT2800USB_RT35XX=y
> CONFIG_RT2800USB_RT3573=y
> CONFIG_RT2800USB_RT53XX=y
> CONFIG_RT2800USB_RT55XX=y
> CONFIG_RT2800USB_UNKNOWN=y
> CONFIG_RT2800_LIB=m
> CONFIG_RT2800_LIB_MMIO=m
> CONFIG_RT2X00_LIB_MMIO=m
> CONFIG_RT2X00_LIB_PCI=m
> CONFIG_RT2X00_LIB_USB=m
> CONFIG_RT2X00_LIB=m
> CONFIG_RT2X00_LIB_FIRMWARE=y
> CONFIG_RT2X00_LIB_CRYPTO=y
> CONFIG_RT2X00_LIB_LEDS=y
> CONFIG_RT2X00_LIB_DEBUGFS=y
> # CONFIG_RT2X00_DEBUG is not set
> CONFIG_WLAN_VENDOR_REALTEK=y
> CONFIG_RTL8180=m
> CONFIG_RTL8187=m
> CONFIG_RTL8187_LEDS=y
> CONFIG_RTL_CARDS=m
> CONFIG_RTL8192CE=m
> CONFIG_RTL8192SE=m
> CONFIG_RTL8192DE=m
> CONFIG_RTL8723AE=m
> CONFIG_RTL8723BE=m
> CONFIG_RTL8188EE=m
> CONFIG_RTL8192EE=m
> CONFIG_RTL8821AE=m
> CONFIG_RTL8192CU=m
> CONFIG_RTLWIFI=m
> CONFIG_RTLWIFI_PCI=m
> CONFIG_RTLWIFI_USB=m
> # CONFIG_RTLWIFI_DEBUG is not set
> CONFIG_RTL8192C_COMMON=m
> CONFIG_RTL8723_COMMON=m
> CONFIG_RTLBTCOEXIST=m
> CONFIG_RTL8XXXU=m
> CONFIG_RTL8XXXU_UNTESTED=y
> CONFIG_RTW88=m
> CONFIG_RTW88_CORE=m
> CONFIG_RTW88_PCI=m
> CONFIG_RTW88_8822B=m
> CONFIG_RTW88_8822C=m
> CONFIG_RTW88_8723D=m
> CONFIG_RTW88_8821C=m
> CONFIG_RTW88_8822BE=m
> CONFIG_RTW88_8822CE=m
> CONFIG_RTW88_8723DE=m
> CONFIG_RTW88_8821CE=m
> # CONFIG_RTW88_DEBUG is not set
> # CONFIG_RTW88_DEBUGFS is not set
> CONFIG_RTW89=m
> CONFIG_RTW89_CORE=m
> CONFIG_RTW89_PCI=m
> CONFIG_RTW89_8852A=m
> CONFIG_RTW89_8852C=m
> CONFIG_RTW89_8852AE=m
> CONFIG_RTW89_8852CE=m
> # CONFIG_RTW89_DEBUGMSG is not set
> # CONFIG_RTW89_DEBUGFS is not set
> CONFIG_WLAN_VENDOR_RSI=y
> CONFIG_RSI_91X=m
> CONFIG_RSI_DEBUGFS=y
> CONFIG_RSI_SDIO=m
> CONFIG_RSI_USB=m
> CONFIG_RSI_COEX=y
> # CONFIG_WLAN_VENDOR_SILABS is not set
> CONFIG_WLAN_VENDOR_ST=y
> CONFIG_CW1200=m
> CONFIG_CW1200_WLAN_SDIO=m
> CONFIG_WLAN_VENDOR_TI=y
> CONFIG_WL1251=m
> CONFIG_WL1251_SDIO=m
> CONFIG_WL12XX=m
> CONFIG_WL18XX=m
> CONFIG_WLCORE=m
> CONFIG_WLCORE_SDIO=m
> CONFIG_WILINK_PLATFORM_DATA=y
> CONFIG_WLAN_VENDOR_ZYDAS=y
> # CONFIG_USB_ZD1201 is not set
> CONFIG_ZD1211RW=m
> # CONFIG_ZD1211RW_DEBUG is not set
> CONFIG_WLAN_VENDOR_QUANTENNA=y
> CONFIG_QTNFMAC=m
> CONFIG_QTNFMAC_PCIE=m
> CONFIG_MAC80211_HWSIM=m
> CONFIG_USB_NET_RNDIS_WLAN=m
> CONFIG_VIRT_WIFI=m
> # CONFIG_WAN is not set
> CONFIG_IEEE802154_DRIVERS=m
> CONFIG_IEEE802154_FAKELB=m
> CONFIG_IEEE802154_ATUSB=m
> # CONFIG_IEEE802154_HWSIM is not set
>
> #
> # Wireless WAN
> #
> CONFIG_WWAN=y
> CONFIG_WWAN_DEBUGFS=y
> CONFIG_WWAN_HWSIM=m
> CONFIG_MHI_WWAN_CTRL=m
> CONFIG_MHI_WWAN_MBIM=m
> CONFIG_MTK_T7XX=m
> # end of Wireless WAN
>
> CONFIG_USB4_NET=m
> CONFIG_NETDEVSIM=m
> CONFIG_NET_FAILOVER=m
> # CONFIG_ISDN is not set
>
> #
> # Input device support
> #
> CONFIG_INPUT=y
> CONFIG_INPUT_LEDS=y
> CONFIG_INPUT_FF_MEMLESS=m
> CONFIG_INPUT_SPARSEKMAP=m
> CONFIG_INPUT_MATRIXKMAP=m
> CONFIG_INPUT_VIVALDIFMAP=m
>
> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=y
> # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
> CONFIG_INPUT_JOYDEV=m
> CONFIG_INPUT_EVDEV=y
> # CONFIG_INPUT_EVBUG is not set
>
> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=y
> # CONFIG_KEYBOARD_ADC is not set
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> # CONFIG_KEYBOARD_ATKBD is not set
> CONFIG_KEYBOARD_QT1050=m
> CONFIG_KEYBOARD_QT1070=m
> # CONFIG_KEYBOARD_QT2160 is not set
> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_GPIO is not set
> # CONFIG_KEYBOARD_GPIO_POLLED is not set
> # CONFIG_KEYBOARD_TCA6416 is not set
> # CONFIG_KEYBOARD_TCA8418 is not set
> # CONFIG_KEYBOARD_MATRIX is not set
> # CONFIG_KEYBOARD_LM8323 is not set
> # CONFIG_KEYBOARD_LM8333 is not set
> # CONFIG_KEYBOARD_MAX7359 is not set
> # CONFIG_KEYBOARD_MCS is not set
> # CONFIG_KEYBOARD_MPR121 is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_OPENCORES is not set
> # CONFIG_KEYBOARD_PINEPHONE is not set
> # CONFIG_KEYBOARD_SAMSUNG is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_OMAP4 is not set
> CONFIG_KEYBOARD_TM2_TOUCHKEY=m
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CAP11XX is not set
> CONFIG_KEYBOARD_BCM=m
> CONFIG_KEYBOARD_CYPRESS_SF=m
> CONFIG_INPUT_MOUSE=y
> # CONFIG_MOUSE_PS2 is not set
> # CONFIG_MOUSE_SERIAL is not set
> CONFIG_MOUSE_APPLETOUCH=m
> CONFIG_MOUSE_BCM5974=m
> CONFIG_MOUSE_CYAPA=m
> CONFIG_MOUSE_ELAN_I2C=m
> CONFIG_MOUSE_ELAN_I2C_I2C=y
> CONFIG_MOUSE_ELAN_I2C_SMBUS=y
> CONFIG_MOUSE_VSXXXAA=m
> # CONFIG_MOUSE_GPIO is not set
> CONFIG_MOUSE_SYNAPTICS_I2C=m
> CONFIG_MOUSE_SYNAPTICS_USB=m
> CONFIG_INPUT_JOYSTICK=y
> CONFIG_JOYSTICK_ANALOG=m
> CONFIG_JOYSTICK_A3D=m
> CONFIG_JOYSTICK_ADC=m
> CONFIG_JOYSTICK_ADI=m
> CONFIG_JOYSTICK_COBRA=m
> CONFIG_JOYSTICK_GF2K=m
> CONFIG_JOYSTICK_GRIP=m
> CONFIG_JOYSTICK_GRIP_MP=m
> CONFIG_JOYSTICK_GUILLEMOT=m
> CONFIG_JOYSTICK_INTERACT=m
> CONFIG_JOYSTICK_SIDEWINDER=m
> CONFIG_JOYSTICK_TMDC=m
> CONFIG_JOYSTICK_IFORCE=m
> CONFIG_JOYSTICK_IFORCE_USB=m
> CONFIG_JOYSTICK_IFORCE_232=m
> # CONFIG_JOYSTICK_WARRIOR is not set
> # CONFIG_JOYSTICK_MAGELLAN is not set
> # CONFIG_JOYSTICK_SPACEORB is not set
> # CONFIG_JOYSTICK_SPACEBALL is not set
> # CONFIG_JOYSTICK_STINGER is not set
> # CONFIG_JOYSTICK_TWIDJOY is not set
> # CONFIG_JOYSTICK_ZHENHUA is not set
> # CONFIG_JOYSTICK_AS5011 is not set
> CONFIG_JOYSTICK_JOYDUMP=m
> CONFIG_JOYSTICK_XPAD=m
> CONFIG_JOYSTICK_XPAD_FF=y
> CONFIG_JOYSTICK_XPAD_LEDS=y
> CONFIG_JOYSTICK_PXRC=m
> CONFIG_JOYSTICK_QWIIC=m
> # CONFIG_JOYSTICK_FSIA6B is not set
> # CONFIG_JOYSTICK_SENSEHAT is not set
> CONFIG_INPUT_TABLET=y
> CONFIG_TABLET_USB_ACECAD=m
> CONFIG_TABLET_USB_AIPTEK=m
> CONFIG_TABLET_USB_HANWANG=m
> CONFIG_TABLET_USB_KBTAB=m
> CONFIG_TABLET_USB_PEGASUS=m
> CONFIG_TABLET_SERIAL_WACOM4=m
> CONFIG_INPUT_TOUCHSCREEN=y
> # CONFIG_TOUCHSCREEN_AD7879 is not set
> # CONFIG_TOUCHSCREEN_ADC is not set
> # CONFIG_TOUCHSCREEN_AR1021_I2C is not set
> CONFIG_TOUCHSCREEN_ATMEL_MXT=m
> # CONFIG_TOUCHSCREEN_ATMEL_MXT_T37 is not set
> # CONFIG_TOUCHSCREEN_AUO_PIXCIR is not set
> # CONFIG_TOUCHSCREEN_BU21013 is not set
> # CONFIG_TOUCHSCREEN_BU21029 is not set
> # CONFIG_TOUCHSCREEN_CHIPONE_ICN8318 is not set
> CONFIG_TOUCHSCREEN_CY8CTMA140=m
> # CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
> # CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
> # CONFIG_TOUCHSCREEN_CYTTSP4_CORE is not set
> # CONFIG_TOUCHSCREEN_DYNAPRO is not set
> # CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
> CONFIG_TOUCHSCREEN_EETI=m
> CONFIG_TOUCHSCREEN_EGALAX=m
> # CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
> # CONFIG_TOUCHSCREEN_EXC3000 is not set
> # CONFIG_TOUCHSCREEN_FUJITSU is not set
> # CONFIG_TOUCHSCREEN_GOODIX is not set
> # CONFIG_TOUCHSCREEN_HIDEEP is not set
> CONFIG_TOUCHSCREEN_HYCON_HY46XX=m
> CONFIG_TOUCHSCREEN_ILI210X=m
> CONFIG_TOUCHSCREEN_ILITEK=m
> # CONFIG_TOUCHSCREEN_S6SY761 is not set
> # CONFIG_TOUCHSCREEN_GUNZE is not set
> # CONFIG_TOUCHSCREEN_EKTF2127 is not set
> CONFIG_TOUCHSCREEN_ELAN=m
> # CONFIG_TOUCHSCREEN_ELO is not set
> # CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
> CONFIG_TOUCHSCREEN_WACOM_I2C=m
> # CONFIG_TOUCHSCREEN_MAX11801 is not set
> CONFIG_TOUCHSCREEN_MCS5000=m
> CONFIG_TOUCHSCREEN_MMS114=m
> # CONFIG_TOUCHSCREEN_MELFAS_MIP4 is not set
> CONFIG_TOUCHSCREEN_MSG2638=m
> # CONFIG_TOUCHSCREEN_MTOUCH is not set
> CONFIG_TOUCHSCREEN_IMAGIS=m
> # CONFIG_TOUCHSCREEN_IMX6UL_TSC is not set
> # CONFIG_TOUCHSCREEN_INEXIO is not set
> CONFIG_TOUCHSCREEN_MK712=m
> # CONFIG_TOUCHSCREEN_PENMOUNT is not set
> CONFIG_TOUCHSCREEN_EDT_FT5X06=m
> # CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
> # CONFIG_TOUCHSCREEN_TOUCHWIN is not set
> CONFIG_TOUCHSCREEN_PIXCIR=m
> # CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
> # CONFIG_TOUCHSCREEN_WM97XX is not set
> CONFIG_TOUCHSCREEN_USB_COMPOSITE=m
> CONFIG_TOUCHSCREEN_USB_EGALAX=y
> CONFIG_TOUCHSCREEN_USB_PANJIT=y
> CONFIG_TOUCHSCREEN_USB_3M=y
> CONFIG_TOUCHSCREEN_USB_ITM=y
> CONFIG_TOUCHSCREEN_USB_ETURBO=y
> CONFIG_TOUCHSCREEN_USB_GUNZE=y
> CONFIG_TOUCHSCREEN_USB_DMC_TSC10=y
> CONFIG_TOUCHSCREEN_USB_IRTOUCH=y
> CONFIG_TOUCHSCREEN_USB_IDEALTEK=y
> CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH=y
> CONFIG_TOUCHSCREEN_USB_GOTOP=y
> CONFIG_TOUCHSCREEN_USB_JASTEC=y
> CONFIG_TOUCHSCREEN_USB_ELO=y
> CONFIG_TOUCHSCREEN_USB_E2I=y
> CONFIG_TOUCHSCREEN_USB_ZYTRONIC=y
> CONFIG_TOUCHSCREEN_USB_ETT_TC45USB=y
> CONFIG_TOUCHSCREEN_USB_NEXIO=y
> CONFIG_TOUCHSCREEN_USB_EASYTOUCH=y
> # CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
> # CONFIG_TOUCHSCREEN_TSC_SERIO is not set
> # CONFIG_TOUCHSCREEN_TSC2004 is not set
> CONFIG_TOUCHSCREEN_TSC2007=m
> CONFIG_TOUCHSCREEN_TSC2007_IIO=y
> CONFIG_TOUCHSCREEN_RM_TS=m
> CONFIG_TOUCHSCREEN_SILEAD=m
> CONFIG_TOUCHSCREEN_SIS_I2C=m
> CONFIG_TOUCHSCREEN_ST1232=m
> # CONFIG_TOUCHSCREEN_STMFTS is not set
> # CONFIG_TOUCHSCREEN_SUR40 is not set
> # CONFIG_TOUCHSCREEN_SX8654 is not set
> # CONFIG_TOUCHSCREEN_TPS6507X is not set
> CONFIG_TOUCHSCREEN_ZET6223=m
> CONFIG_TOUCHSCREEN_ZFORCE=m
> CONFIG_TOUCHSCREEN_COLIBRI_VF50=m
> # CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
> CONFIG_TOUCHSCREEN_IQS5XX=m
> CONFIG_TOUCHSCREEN_ZINITIX=m
> CONFIG_INPUT_MISC=y
> # CONFIG_INPUT_AD714X is not set
> # CONFIG_INPUT_ATMEL_CAPTOUCH is not set
> # CONFIG_INPUT_BMA150 is not set
> CONFIG_INPUT_E3X0_BUTTON=m
> # CONFIG_INPUT_PCSPKR is not set
> CONFIG_INPUT_MAX77650_ONKEY=m
> # CONFIG_INPUT_MMA8450 is not set
> # CONFIG_INPUT_GPIO_BEEPER is not set
> # CONFIG_INPUT_GPIO_DECODER is not set
> CONFIG_INPUT_GPIO_VIBRA=m
> CONFIG_INPUT_ATI_REMOTE2=m
> CONFIG_INPUT_KEYSPAN_REMOTE=m
> CONFIG_INPUT_KXTJ9=m
> CONFIG_INPUT_POWERMATE=m
> CONFIG_INPUT_YEALINK=m
> CONFIG_INPUT_CM109=m
> CONFIG_INPUT_REGULATOR_HAPTIC=m
> CONFIG_INPUT_UINPUT=m
> # CONFIG_INPUT_PCF8574 is not set
> CONFIG_INPUT_PWM_BEEPER=m
> # CONFIG_INPUT_PWM_VIBRA is not set
> CONFIG_INPUT_GPIO_ROTARY_ENCODER=m
> # CONFIG_INPUT_DA7280_HAPTICS is not set
> # CONFIG_INPUT_ADXL34X is not set
> CONFIG_INPUT_IBM_PANEL=m
> # CONFIG_INPUT_IMS_PCU is not set
> CONFIG_INPUT_IQS269A=m
> CONFIG_INPUT_IQS626A=m
> CONFIG_INPUT_IQS7222=m
> CONFIG_INPUT_CMA3000=m
> CONFIG_INPUT_CMA3000_I2C=m
> # CONFIG_INPUT_DRV260X_HAPTICS is not set
> # CONFIG_INPUT_DRV2665_HAPTICS is not set
> # CONFIG_INPUT_DRV2667_HAPTICS is not set
> CONFIG_INPUT_RT5120_PWRKEY=m
> CONFIG_RMI4_CORE=m
> CONFIG_RMI4_I2C=m
> CONFIG_RMI4_SMB=m
> CONFIG_RMI4_F03=y
> CONFIG_RMI4_F03_SERIO=m
> CONFIG_RMI4_2D_SENSOR=y
> CONFIG_RMI4_F11=y
> CONFIG_RMI4_F12=y
> CONFIG_RMI4_F30=y
> CONFIG_RMI4_F34=y
> CONFIG_RMI4_F3A=y
> # CONFIG_RMI4_F54 is not set
> CONFIG_RMI4_F55=y
>
> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=y
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
> # CONFIG_SERIO_I8042 is not set
> CONFIG_SERIO_SERPORT=m
> # CONFIG_SERIO_PCIPS2 is not set
> # CONFIG_SERIO_LIBPS2 is not set
> CONFIG_SERIO_RAW=m
> # CONFIG_SERIO_XILINX_XPS_PS2 is not set
> CONFIG_SERIO_ALTERA_PS2=m
> # CONFIG_SERIO_PS2MULT is not set
> CONFIG_SERIO_ARC_PS2=m
> # CONFIG_SERIO_APBPS2 is not set
> # CONFIG_SERIO_GPIO_PS2 is not set
> # CONFIG_USERIO is not set
> CONFIG_GAMEPORT=m
> CONFIG_GAMEPORT_NS558=m
> CONFIG_GAMEPORT_L4=m
> CONFIG_GAMEPORT_EMU10K1=m
> CONFIG_GAMEPORT_FM801=m
> # end of Hardware I/O ports
> # end of Input device support
>
> #
> # Character devices
> #
> CONFIG_TTY=y
> CONFIG_VT=y
> CONFIG_CONSOLE_TRANSLATIONS=y
> CONFIG_VT_CONSOLE=y
> CONFIG_VT_CONSOLE_SLEEP=y
> CONFIG_HW_CONSOLE=y
> CONFIG_VT_HW_CONSOLE_BINDING=y
> CONFIG_UNIX98_PTYS=y
> # CONFIG_LEGACY_PTYS is not set
> CONFIG_LDISC_AUTOLOAD=y
>
> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=y
> CONFIG_SERIAL_8250=y
> # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> # CONFIG_SERIAL_8250_FINTEK is not set
> CONFIG_SERIAL_8250_CONSOLE=y
> CONFIG_SERIAL_8250_DMA=y
> CONFIG_SERIAL_8250_PCI=y
> CONFIG_SERIAL_8250_EXAR=m
> CONFIG_SERIAL_8250_NR_UARTS=32
> CONFIG_SERIAL_8250_RUNTIME_UARTS=32
> CONFIG_SERIAL_8250_EXTENDED=y
> CONFIG_SERIAL_8250_MANY_PORTS=y
> CONFIG_SERIAL_8250_SHARE_IRQ=y
> # CONFIG_SERIAL_8250_DETECT_IRQ is not set
> CONFIG_SERIAL_8250_RSA=y
> CONFIG_SERIAL_8250_DWLIB=y
> CONFIG_SERIAL_8250_FSL=y
> CONFIG_SERIAL_8250_DW=y
> CONFIG_SERIAL_8250_RT288X=y
> CONFIG_SERIAL_8250_PERICOM=y
> CONFIG_SERIAL_OF_PLATFORM=m
>
> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_KGDB_NMI is not set
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=y
> CONFIG_SERIAL_CORE_CONSOLE=y
> CONFIG_CONSOLE_POLL=y
> CONFIG_SERIAL_ICOM=m
> CONFIG_SERIAL_JSM=m
> # CONFIG_SERIAL_SIFIVE is not set
> # CONFIG_SERIAL_SCCNXP is not set
> CONFIG_SERIAL_SC16IS7XX=m
> # CONFIG_SERIAL_SC16IS7XX_I2C is not set
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> # CONFIG_SERIAL_XILINX_PS_UART is not set
> CONFIG_SERIAL_ARC=m
> CONFIG_SERIAL_ARC_NR_PORTS=1
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> # CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
> # CONFIG_SERIAL_SPRD is not set
> # end of Serial drivers
>
> CONFIG_SERIAL_MCTRL_GPIO=y
> CONFIG_SERIAL_NONSTANDARD=y
> # CONFIG_MOXA_INTELLIO is not set
> # CONFIG_MOXA_SMARTIO is not set
> CONFIG_SYNCLINK_GT=m
> CONFIG_N_HDLC=m
> # CONFIG_PPC_EPAPR_HV_BYTECHAN is not set
> CONFIG_N_GSM=m
> CONFIG_NOZOMI=m
> CONFIG_NULL_TTY=m
> CONFIG_HVC_DRIVER=y
> CONFIG_HVC_IRQ=y
> CONFIG_HVC_CONSOLE=y
> # CONFIG_HVC_OLD_HVSI is not set
> CONFIG_HVC_OPAL=y
> CONFIG_HVC_RTAS=y
> # CONFIG_HVC_UDBG is not set
> CONFIG_HVCS=m
> CONFIG_SERIAL_DEV_BUS=y
> CONFIG_SERIAL_DEV_CTRL_TTYPORT=y
> CONFIG_VIRTIO_CONSOLE=m
> CONFIG_IBM_BSR=m
> # CONFIG_POWERNV_OP_PANEL is not set
> CONFIG_IPMI_HANDLER=m
> CONFIG_IPMI_PLAT_DATA=y
> # CONFIG_IPMI_PANIC_EVENT is not set
> CONFIG_IPMI_DEVICE_INTERFACE=m
> CONFIG_IPMI_SI=m
> CONFIG_IPMI_SSIF=m
> CONFIG_IPMI_IPMB=m
> CONFIG_IPMI_POWERNV=m
> CONFIG_IPMI_WATCHDOG=m
> CONFIG_IPMI_POWEROFF=m
> # CONFIG_IPMB_DEVICE_INTERFACE is not set
> CONFIG_HW_RANDOM=y
> CONFIG_HW_RANDOM_TIMERIOMEM=m
> # CONFIG_HW_RANDOM_BA431 is not set
> CONFIG_HW_RANDOM_VIRTIO=y
> CONFIG_HW_RANDOM_PSERIES=m
> CONFIG_HW_RANDOM_POWERNV=m
> # CONFIG_HW_RANDOM_CCTRNG is not set
> CONFIG_HW_RANDOM_XIPHERA=m
> # CONFIG_APPLICOM is not set
> CONFIG_DEVMEM=y
> CONFIG_NVRAM=y
> CONFIG_DEVPORT=y
> CONFIG_HANGCHECK_TIMER=m
> CONFIG_TCG_TPM=y
> CONFIG_HW_RANDOM_TPM=y
> CONFIG_TCG_TIS_CORE=y
> CONFIG_TCG_TIS=y
> CONFIG_TCG_TIS_I2C=m
> CONFIG_TCG_TIS_I2C_CR50=m
> CONFIG_TCG_TIS_I2C_ATMEL=m
> CONFIG_TCG_TIS_I2C_INFINEON=m
> CONFIG_TCG_TIS_I2C_NUVOTON=m
> CONFIG_TCG_ATMEL=m
> CONFIG_TCG_IBMVTPM=y
> CONFIG_TCG_VTPM_PROXY=m
> # CONFIG_TCG_TIS_ST33ZP24_I2C is not set
> CONFIG_XILLYBUS_CLASS=m
> CONFIG_XILLYBUS=m
> CONFIG_XILLYBUS_PCIE=m
> # CONFIG_XILLYBUS_OF is not set
> CONFIG_XILLYUSB=m
> CONFIG_RANDOM_TRUST_CPU=y
> CONFIG_RANDOM_TRUST_BOOTLOADER=y
> # end of Character devices
>
> #
> # I2C support
> #
> CONFIG_I2C=y
> CONFIG_I2C_BOARDINFO=y
> CONFIG_I2C_COMPAT=y
> CONFIG_I2C_CHARDEV=m
> CONFIG_I2C_MUX=m
>
> #
> # Multiplexer I2C Chip support
> #
> # CONFIG_I2C_ARB_GPIO_CHALLENGE is not set
> # CONFIG_I2C_MUX_GPIO is not set
> CONFIG_I2C_MUX_GPMUX=m
> CONFIG_I2C_MUX_LTC4306=m
> # CONFIG_I2C_MUX_PCA9541 is not set
> # CONFIG_I2C_MUX_PCA954x is not set
> # CONFIG_I2C_MUX_REG is not set
> CONFIG_I2C_MUX_MLXCPLD=m
> # end of Multiplexer I2C Chip support
>
> CONFIG_I2C_HELPER_AUTO=y
> CONFIG_I2C_ALGOBIT=y
> CONFIG_I2C_ALGOPCA=m
>
> #
> # I2C Hardware Bus support
> #
>
> #
> # PC SMBus host controller drivers
> #
> CONFIG_I2C_CCGX_UCSI=m
> # CONFIG_I2C_ALI1535 is not set
> # CONFIG_I2C_ALI1563 is not set
> # CONFIG_I2C_ALI15X3 is not set
> # CONFIG_I2C_AMD756 is not set
> # CONFIG_I2C_AMD8111 is not set
> # CONFIG_I2C_I801 is not set
> # CONFIG_I2C_ISCH is not set
> # CONFIG_I2C_PIIX4 is not set
> CONFIG_I2C_NFORCE2=m
> CONFIG_I2C_NVIDIA_GPU=m
> # CONFIG_I2C_SIS5595 is not set
> # CONFIG_I2C_SIS630 is not set
> # CONFIG_I2C_SIS96X is not set
> # CONFIG_I2C_VIA is not set
> # CONFIG_I2C_VIAPRO is not set
>
> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> # CONFIG_I2C_CBUS_GPIO is not set
> CONFIG_I2C_DESIGNWARE_CORE=m
> CONFIG_I2C_DESIGNWARE_SLAVE=y
> # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> CONFIG_I2C_DESIGNWARE_PCI=m
> # CONFIG_I2C_EMEV2 is not set
> # CONFIG_I2C_GPIO is not set
> CONFIG_I2C_MPC=m
> # CONFIG_I2C_OCORES is not set
> CONFIG_I2C_PCA_PLATFORM=m
> # CONFIG_I2C_RK3X is not set
> CONFIG_I2C_SIMTEC=m
> # CONFIG_I2C_XILINX is not set
>
> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_DIOLAN_U2C=m
> CONFIG_I2C_DLN2=m
> CONFIG_I2C_CP2615=m
> CONFIG_I2C_PCI1XXXX=m
> # CONFIG_I2C_ROBOTFUZZ_OSIF is not set
> # CONFIG_I2C_TAOS_EVM is not set
> CONFIG_I2C_TINY_USB=m
>
> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_OPAL=m
> # CONFIG_I2C_FSI is not set
> CONFIG_I2C_VIRTIO=m
> # end of I2C Hardware Bus support
>
> CONFIG_I2C_STUB=m
> CONFIG_I2C_SLAVE=y
> CONFIG_I2C_SLAVE_EEPROM=m
> # CONFIG_I2C_SLAVE_TESTUNIT is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # end of I2C support
>
> # CONFIG_I3C is not set
> # CONFIG_SPI is not set
> # CONFIG_SPMI is not set
> # CONFIG_HSI is not set
> CONFIG_PPS=y
> # CONFIG_PPS_DEBUG is not set
>
> #
> # PPS clients support
> #
> # CONFIG_PPS_CLIENT_KTIMER is not set
> CONFIG_PPS_CLIENT_LDISC=m
> CONFIG_PPS_CLIENT_GPIO=m
>
> #
> # PPS generators support
> #
>
> #
> # PTP clock support
> #
> CONFIG_PTP_1588_CLOCK=y
> CONFIG_PTP_1588_CLOCK_OPTIONAL=y
> CONFIG_DP83640_PHY=m
> # CONFIG_PTP_1588_CLOCK_INES is not set
> CONFIG_PTP_1588_CLOCK_IDT82P33=m
> CONFIG_PTP_1588_CLOCK_IDTCM=m
> # CONFIG_PTP_1588_CLOCK_OCP is not set
> # end of PTP clock support
>
> # CONFIG_PINCTRL is not set
> CONFIG_GPIOLIB=y
> CONFIG_GPIOLIB_FASTPATH_LIMIT=512
> CONFIG_OF_GPIO=y
> CONFIG_GPIOLIB_IRQCHIP=y
> # CONFIG_DEBUG_GPIO is not set
> CONFIG_GPIO_CDEV=y
> CONFIG_GPIO_CDEV_V1=y
> CONFIG_GPIO_GENERIC=m
>
> #
> # Memory mapped GPIO drivers
> #
> # CONFIG_GPIO_74XX_MMIO is not set
> # CONFIG_GPIO_ALTERA is not set
> CONFIG_GPIO_CADENCE=m
> # CONFIG_GPIO_DWAPB is not set
> CONFIG_GPIO_EXAR=m
> # CONFIG_GPIO_FTGPIO010 is not set
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> # CONFIG_GPIO_GRGPIO is not set
> # CONFIG_GPIO_HLWD is not set
> # CONFIG_GPIO_LOGICVC is not set
> # CONFIG_GPIO_MB86S7X is not set
> # CONFIG_GPIO_SIFIVE is not set
> # CONFIG_GPIO_SYSCON is not set
> # CONFIG_GPIO_XILINX is not set
> # CONFIG_GPIO_AMD_FCH is not set
> # end of Memory mapped GPIO drivers
>
> #
> # I2C GPIO expanders
> #
> # CONFIG_GPIO_ADNP is not set
> # CONFIG_GPIO_GW_PLD is not set
> # CONFIG_GPIO_MAX7300 is not set
> # CONFIG_GPIO_MAX732X is not set
> CONFIG_GPIO_PCA953X=m
> # CONFIG_GPIO_PCA953X_IRQ is not set
> CONFIG_GPIO_PCA9570=m
> CONFIG_GPIO_PCF857X=m
> # CONFIG_GPIO_TPIC2810 is not set
> # end of I2C GPIO expanders
>
> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_BD9571MWV=m
> CONFIG_GPIO_DLN2=m
> CONFIG_GPIO_MAX77650=m
> # end of MFD GPIO expanders
>
> #
> # PCI GPIO expanders
> #
> CONFIG_GPIO_PCI_IDIO_16=m
> # CONFIG_GPIO_PCIE_IDIO_24 is not set
> # CONFIG_GPIO_RDC321X is not set
> # end of PCI GPIO expanders
>
> #
> # USB GPIO expanders
> #
> # end of USB GPIO expanders
>
> #
> # Virtual GPIO drivers
> #
> CONFIG_GPIO_AGGREGATOR=m
> # CONFIG_GPIO_MOCKUP is not set
> CONFIG_GPIO_VIRTIO=m
> # CONFIG_GPIO_SIM is not set
> # end of Virtual GPIO drivers
>
> CONFIG_W1=m
> CONFIG_W1_CON=y
>
> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> CONFIG_W1_MASTER_DS2490=m
> CONFIG_W1_MASTER_DS2482=m
> # CONFIG_W1_MASTER_DS1WM is not set
> # CONFIG_W1_MASTER_GPIO is not set
> # CONFIG_W1_MASTER_SGI is not set
> # end of 1-wire Bus Masters
>
> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=m
> CONFIG_W1_SLAVE_SMEM=m
> CONFIG_W1_SLAVE_DS2405=m
> CONFIG_W1_SLAVE_DS2408=m
> # CONFIG_W1_SLAVE_DS2408_READBACK is not set
> CONFIG_W1_SLAVE_DS2413=m
> CONFIG_W1_SLAVE_DS2406=m
> CONFIG_W1_SLAVE_DS2423=m
> CONFIG_W1_SLAVE_DS2805=m
> CONFIG_W1_SLAVE_DS2430=m
> CONFIG_W1_SLAVE_DS2431=m
> CONFIG_W1_SLAVE_DS2433=m
> CONFIG_W1_SLAVE_DS2433_CRC=y
> CONFIG_W1_SLAVE_DS2438=m
> # CONFIG_W1_SLAVE_DS250X is not set
> CONFIG_W1_SLAVE_DS2780=m
> CONFIG_W1_SLAVE_DS2781=m
> CONFIG_W1_SLAVE_DS28E04=m
> # CONFIG_W1_SLAVE_DS28E17 is not set
> # end of 1-wire Slaves
>
> CONFIG_POWER_RESET=y
> CONFIG_POWER_RESET_GPIO=y
> CONFIG_POWER_RESET_GPIO_RESTART=y
> # CONFIG_POWER_RESET_LTC2952 is not set
> # CONFIG_POWER_RESET_REGULATOR is not set
> # CONFIG_POWER_RESET_RESTART is not set
> # CONFIG_POWER_RESET_SYSCON is not set
> # CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
> # CONFIG_SYSCON_REBOOT_MODE is not set
> # CONFIG_NVMEM_REBOOT_MODE is not set
> CONFIG_POWER_SUPPLY=y
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_POWER_SUPPLY_HWMON=y
> # CONFIG_PDA_POWER is not set
> # CONFIG_GENERIC_ADC_BATTERY is not set
> # CONFIG_IP5XXX_POWER is not set
> # CONFIG_TEST_POWER is not set
> # CONFIG_CHARGER_ADP5061 is not set
> CONFIG_BATTERY_CW2015=m
> # CONFIG_BATTERY_DS2760 is not set
> # CONFIG_BATTERY_DS2780 is not set
> # CONFIG_BATTERY_DS2781 is not set
> # CONFIG_BATTERY_DS2782 is not set
> CONFIG_BATTERY_SAMSUNG_SDI=y
> # CONFIG_BATTERY_SBS is not set
> # CONFIG_CHARGER_SBS is not set
> # CONFIG_MANAGER_SBS is not set
> # CONFIG_BATTERY_BQ27XXX is not set
> # CONFIG_BATTERY_MAX17040 is not set
> # CONFIG_BATTERY_MAX17042 is not set
> # CONFIG_BATTERY_MAX1721X is not set
> # CONFIG_CHARGER_ISP1704 is not set
> # CONFIG_CHARGER_MAX8903 is not set
> # CONFIG_CHARGER_LP8727 is not set
> # CONFIG_CHARGER_GPIO is not set
> # CONFIG_CHARGER_MANAGER is not set
> CONFIG_CHARGER_LT3651=m
> CONFIG_CHARGER_LTC4162L=m
> # CONFIG_CHARGER_DETECTOR_MAX14656 is not set
> CONFIG_CHARGER_MAX77650=m
> CONFIG_CHARGER_MAX77976=m
> CONFIG_CHARGER_MT6370=m
> # CONFIG_CHARGER_BQ2415X is not set
> # CONFIG_CHARGER_BQ24190 is not set
> # CONFIG_CHARGER_BQ24257 is not set
> # CONFIG_CHARGER_BQ24735 is not set
> CONFIG_CHARGER_BQ2515X=m
> # CONFIG_CHARGER_BQ25890 is not set
> # CONFIG_CHARGER_BQ25980 is not set
> CONFIG_CHARGER_BQ256XX=m
> CONFIG_CHARGER_SMB347=m
> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> # CONFIG_BATTERY_GOLDFISH is not set
> CONFIG_BATTERY_RT5033=m
> # CONFIG_CHARGER_RT9455 is not set
> CONFIG_CHARGER_UCS1002=m
> CONFIG_CHARGER_BD99954=m
> CONFIG_BATTERY_UG3105=m
> CONFIG_HWMON=y
> CONFIG_HWMON_VID=m
> # CONFIG_HWMON_DEBUG_CHIP is not set
>
> #
> # Native drivers
> #
> CONFIG_SENSORS_AD7414=m
> CONFIG_SENSORS_AD7418=m
> CONFIG_SENSORS_ADM1025=m
> CONFIG_SENSORS_ADM1026=m
> CONFIG_SENSORS_ADM1029=m
> CONFIG_SENSORS_ADM1031=m
> # CONFIG_SENSORS_ADM1177 is not set
> CONFIG_SENSORS_ADM9240=m
> CONFIG_SENSORS_ADT7X10=m
> CONFIG_SENSORS_ADT7410=m
> CONFIG_SENSORS_ADT7411=m
> CONFIG_SENSORS_ADT7462=m
> CONFIG_SENSORS_ADT7470=m
> CONFIG_SENSORS_ADT7475=m
> # CONFIG_SENSORS_AHT10 is not set
> CONFIG_SENSORS_AQUACOMPUTER_D5NEXT=m
> # CONFIG_SENSORS_AS370 is not set
> CONFIG_SENSORS_ASC7621=m
> CONFIG_SENSORS_AXI_FAN_CONTROL=m
> CONFIG_SENSORS_ATXP1=m
> CONFIG_SENSORS_CORSAIR_CPRO=m
> CONFIG_SENSORS_CORSAIR_PSU=m
> CONFIG_SENSORS_DRIVETEMP=m
> CONFIG_SENSORS_DS620=m
> CONFIG_SENSORS_DS1621=m
> # CONFIG_SENSORS_I5K_AMB is not set
> CONFIG_SENSORS_F75375S=m
> CONFIG_SENSORS_FTSTEUTATES=m
> CONFIG_SENSORS_GL518SM=m
> CONFIG_SENSORS_GL520SM=m
> CONFIG_SENSORS_G760A=m
> CONFIG_SENSORS_G762=m
> # CONFIG_SENSORS_GPIO_FAN is not set
> # CONFIG_SENSORS_HIH6130 is not set
> CONFIG_SENSORS_IBMAEM=m
> CONFIG_SENSORS_IBMPEX=m
> CONFIG_SENSORS_IBMPOWERNV=y
> # CONFIG_SENSORS_IIO_HWMON is not set
> CONFIG_SENSORS_JC42=m
> CONFIG_SENSORS_POWR1220=m
> CONFIG_SENSORS_LINEAGE=m
> CONFIG_SENSORS_LTC2945=m
> CONFIG_SENSORS_LTC2947=m
> CONFIG_SENSORS_LTC2947_I2C=m
> CONFIG_SENSORS_LTC2990=m
> # CONFIG_SENSORS_LTC2992 is not set
> CONFIG_SENSORS_LTC4151=m
> CONFIG_SENSORS_LTC4215=m
> CONFIG_SENSORS_LTC4222=m
> CONFIG_SENSORS_LTC4245=m
> CONFIG_SENSORS_LTC4260=m
> CONFIG_SENSORS_LTC4261=m
> # CONFIG_SENSORS_MAX127 is not set
> CONFIG_SENSORS_MAX16065=m
> CONFIG_SENSORS_MAX1619=m
> CONFIG_SENSORS_MAX1668=m
> CONFIG_SENSORS_MAX197=m
> # CONFIG_SENSORS_MAX31730 is not set
> CONFIG_SENSORS_MAX31760=m
> CONFIG_SENSORS_MAX6620=m
> # CONFIG_SENSORS_MAX6621 is not set
> CONFIG_SENSORS_MAX6639=m
> CONFIG_SENSORS_MAX6650=m
> CONFIG_SENSORS_MAX6697=m
> CONFIG_SENSORS_MAX31790=m
> CONFIG_SENSORS_MCP3021=m
> CONFIG_SENSORS_TC654=m
> # CONFIG_SENSORS_TPS23861 is not set
> CONFIG_SENSORS_MR75203=m
> CONFIG_SENSORS_LM63=m
> CONFIG_SENSORS_LM73=m
> CONFIG_SENSORS_LM75=m
> CONFIG_SENSORS_LM77=m
> CONFIG_SENSORS_LM78=m
> CONFIG_SENSORS_LM80=m
> CONFIG_SENSORS_LM83=m
> CONFIG_SENSORS_LM85=m
> CONFIG_SENSORS_LM87=m
> CONFIG_SENSORS_LM90=m
> CONFIG_SENSORS_LM92=m
> CONFIG_SENSORS_LM93=m
> CONFIG_SENSORS_LM95234=m
> CONFIG_SENSORS_LM95241=m
> CONFIG_SENSORS_LM95245=m
> CONFIG_SENSORS_NTC_THERMISTOR=m
> CONFIG_SENSORS_NCT6775_CORE=m
> CONFIG_SENSORS_NCT6775_I2C=m
> CONFIG_SENSORS_NCT7802=m
> CONFIG_SENSORS_NCT7904=m
> CONFIG_SENSORS_NPCM7XX=m
> CONFIG_SENSORS_NZXT_KRAKEN2=m
> CONFIG_SENSORS_NZXT_SMART2=m
> CONFIG_SENSORS_PCF8591=m
> CONFIG_PMBUS=m
> CONFIG_SENSORS_PMBUS=m
> CONFIG_SENSORS_ADM1266=m
> CONFIG_SENSORS_ADM1275=m
> CONFIG_SENSORS_BEL_PFE=m
> CONFIG_SENSORS_BPA_RS600=m
> CONFIG_SENSORS_DELTA_AHE50DC_FAN=m
> CONFIG_SENSORS_FSP_3Y=m
> CONFIG_SENSORS_IBM_CFFPS=m
> CONFIG_SENSORS_DPS920AB=m
> # CONFIG_SENSORS_INSPUR_IPSPS is not set
> # CONFIG_SENSORS_IR35221 is not set
> # CONFIG_SENSORS_IR36021 is not set
> # CONFIG_SENSORS_IR38064 is not set
> # CONFIG_SENSORS_IRPS5401 is not set
> # CONFIG_SENSORS_ISL68137 is not set
> CONFIG_SENSORS_LM25066=m
> CONFIG_SENSORS_LM25066_REGULATOR=y
> CONFIG_SENSORS_LT7182S=m
> CONFIG_SENSORS_LTC2978=m
> # CONFIG_SENSORS_LTC2978_REGULATOR is not set
> CONFIG_SENSORS_LTC3815=m
> # CONFIG_SENSORS_MAX15301 is not set
> CONFIG_SENSORS_MAX16064=m
> # CONFIG_SENSORS_MAX16601 is not set
> # CONFIG_SENSORS_MAX20730 is not set
> CONFIG_SENSORS_MAX20751=m
> # CONFIG_SENSORS_MAX31785 is not set
> CONFIG_SENSORS_MAX34440=m
> CONFIG_SENSORS_MAX8688=m
> CONFIG_SENSORS_MP2888=m
> CONFIG_SENSORS_MP2975=m
> CONFIG_SENSORS_MP5023=m
> CONFIG_SENSORS_PIM4328=m
> CONFIG_SENSORS_PLI1209BC=m
> CONFIG_SENSORS_PLI1209BC_REGULATOR=y
> CONFIG_SENSORS_PM6764TR=m
> # CONFIG_SENSORS_PXE1610 is not set
> CONFIG_SENSORS_Q54SJ108A2=m
> # CONFIG_SENSORS_STPDDC60 is not set
> CONFIG_SENSORS_TPS40422=m
> CONFIG_SENSORS_TPS53679=m
> CONFIG_SENSORS_TPS546D24=m
> CONFIG_SENSORS_UCD9000=m
> CONFIG_SENSORS_UCD9200=m
> CONFIG_SENSORS_XDPE152=m
> # CONFIG_SENSORS_XDPE122 is not set
> CONFIG_SENSORS_ZL6100=m
> CONFIG_SENSORS_PWM_FAN=m
> CONFIG_SENSORS_SBTSI=m
> # CONFIG_SENSORS_SBRMI is not set
> CONFIG_SENSORS_SHT15=m
> CONFIG_SENSORS_SHT21=m
> CONFIG_SENSORS_SHT3x=m
> # CONFIG_SENSORS_SHT4x is not set
> CONFIG_SENSORS_SHTC1=m
> CONFIG_SENSORS_SIS5595=m
> CONFIG_SENSORS_SY7636A=m
> CONFIG_SENSORS_EMC1403=m
> # CONFIG_SENSORS_EMC2103 is not set
> CONFIG_SENSORS_EMC2305=m
> CONFIG_SENSORS_EMC6W201=m
> CONFIG_SENSORS_SMSC47M192=m
> # CONFIG_SENSORS_STTS751 is not set
> # CONFIG_SENSORS_SMM665 is not set
> CONFIG_SENSORS_ADC128D818=m
> CONFIG_SENSORS_ADS7828=m
> CONFIG_SENSORS_AMC6821=m
> CONFIG_SENSORS_INA209=m
> CONFIG_SENSORS_INA2XX=m
> CONFIG_SENSORS_INA238=m
> CONFIG_SENSORS_INA3221=m
> CONFIG_SENSORS_TC74=m
> CONFIG_SENSORS_THMC50=m
> CONFIG_SENSORS_TMP102=m
> CONFIG_SENSORS_TMP103=m
> CONFIG_SENSORS_TMP108=m
> CONFIG_SENSORS_TMP401=m
> CONFIG_SENSORS_TMP421=m
> CONFIG_SENSORS_TMP464=m
> CONFIG_SENSORS_TMP513=m
> CONFIG_SENSORS_VIA686A=m
> CONFIG_SENSORS_VT8231=m
> CONFIG_SENSORS_W83773G=m
> CONFIG_SENSORS_W83781D=m
> CONFIG_SENSORS_W83791D=m
> CONFIG_SENSORS_W83792D=m
> CONFIG_SENSORS_W83793=m
> CONFIG_SENSORS_W83795=m
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> CONFIG_SENSORS_W83L785TS=m
> CONFIG_SENSORS_W83L786NG=m
> CONFIG_THERMAL=y
> CONFIG_THERMAL_NETLINK=y
> CONFIG_THERMAL_STATISTICS=y
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
> CONFIG_THERMAL_HWMON=y
> # CONFIG_THERMAL_OF is not set
> # CONFIG_THERMAL_WRITABLE_TRIPS is not set
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> CONFIG_THERMAL_GOV_FAIR_SHARE=y
> CONFIG_THERMAL_GOV_STEP_WISE=y
> # CONFIG_THERMAL_GOV_BANG_BANG is not set
> # CONFIG_THERMAL_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
> # CONFIG_THERMAL_EMULATION is not set
> # CONFIG_THERMAL_MMIO is not set
> # CONFIG_GENERIC_ADC_THERMAL is not set
> CONFIG_WATCHDOG=y
> CONFIG_WATCHDOG_CORE=y
> # CONFIG_WATCHDOG_NOWAYOUT is not set
> CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
> CONFIG_WATCHDOG_OPEN_TIMEOUT=0
> CONFIG_WATCHDOG_SYSFS=y
> # CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set
>
> #
> # Watchdog Pretimeout Governors
> #
> # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
>
> #
> # Watchdog Device Drivers
> #
> CONFIG_SOFT_WATCHDOG=m
> # CONFIG_GPIO_WATCHDOG is not set
> # CONFIG_XILINX_WATCHDOG is not set
> # CONFIG_ZIIRAVE_WATCHDOG is not set
> # CONFIG_CADENCE_WATCHDOG is not set
> # CONFIG_DW_WATCHDOG is not set
> # CONFIG_MAX63XX_WATCHDOG is not set
> CONFIG_MAX77620_WATCHDOG=m
> CONFIG_ALIM7101_WDT=m
> CONFIG_I6300ESB_WDT=m
> # CONFIG_MEN_A21_WDT is not set
> CONFIG_PSERIES_WDT=m
> CONFIG_WATCHDOG_RTAS=m
>
> #
> # PCI-based Watchdog Cards
> #
> CONFIG_PCIPCWATCHDOG=m
> CONFIG_WDTPCI=m
>
> #
> # USB-based Watchdog Cards
> #
> CONFIG_USBPCWATCHDOG=m
> CONFIG_SSB_POSSIBLE=y
> CONFIG_SSB=m
> CONFIG_SSB_SPROM=y
> CONFIG_SSB_BLOCKIO=y
> CONFIG_SSB_PCIHOST_POSSIBLE=y
> CONFIG_SSB_PCIHOST=y
> CONFIG_SSB_B43_PCI_BRIDGE=y
> CONFIG_SSB_SDIOHOST_POSSIBLE=y
> CONFIG_SSB_SDIOHOST=y
> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
> CONFIG_SSB_DRIVER_PCICORE=y
> CONFIG_SSB_DRIVER_GPIO=y
> CONFIG_BCMA_POSSIBLE=y
> CONFIG_BCMA=m
> CONFIG_BCMA_BLOCKIO=y
> CONFIG_BCMA_HOST_PCI_POSSIBLE=y
> CONFIG_BCMA_HOST_PCI=y
> # CONFIG_BCMA_HOST_SOC is not set
> CONFIG_BCMA_DRIVER_PCI=y
> CONFIG_BCMA_DRIVER_GMAC_CMN=y
> CONFIG_BCMA_DRIVER_GPIO=y
> # CONFIG_BCMA_DEBUG is not set
>
> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=m
> # CONFIG_MFD_ACT8945A is not set
> # CONFIG_MFD_AS3711 is not set
> # CONFIG_MFD_AS3722 is not set
> # CONFIG_PMIC_ADP5520 is not set
> # CONFIG_MFD_AAT2870_CORE is not set
> # CONFIG_MFD_ATMEL_FLEXCOM is not set
> # CONFIG_MFD_ATMEL_HLCDC is not set
> # CONFIG_MFD_BCM590XX is not set
> CONFIG_MFD_BD9571MWV=m
> # CONFIG_MFD_AXP20X_I2C is not set
> # CONFIG_MFD_MADERA is not set
> # CONFIG_PMIC_DA903X is not set
> # CONFIG_MFD_DA9052_I2C is not set
> # CONFIG_MFD_DA9055 is not set
> # CONFIG_MFD_DA9062 is not set
> # CONFIG_MFD_DA9063 is not set
> # CONFIG_MFD_DA9150 is not set
> CONFIG_MFD_DLN2=m
> # CONFIG_MFD_GATEWORKS_GSC is not set
> # CONFIG_MFD_MC13XXX_I2C is not set
> # CONFIG_MFD_MP2629 is not set
> # CONFIG_MFD_HI6421_PMIC is not set
> # CONFIG_HTC_PASIC3 is not set
> # CONFIG_HTC_I2CPLD is not set
> # CONFIG_LPC_ICH is not set
> # CONFIG_LPC_SCH is not set
> # CONFIG_MFD_IQS62X is not set
> # CONFIG_MFD_JANZ_CMODIO is not set
> # CONFIG_MFD_KEMPLD is not set
> # CONFIG_MFD_88PM800 is not set
> # CONFIG_MFD_88PM805 is not set
> # CONFIG_MFD_88PM860X is not set
> # CONFIG_MFD_MAX14577 is not set
> # CONFIG_MFD_MAX77620 is not set
> CONFIG_MFD_MAX77650=m
> # CONFIG_MFD_MAX77686 is not set
> # CONFIG_MFD_MAX77693 is not set
> CONFIG_MFD_MAX77714=m
> # CONFIG_MFD_MAX77843 is not set
> # CONFIG_MFD_MAX8907 is not set
> # CONFIG_MFD_MAX8925 is not set
> # CONFIG_MFD_MAX8997 is not set
> # CONFIG_MFD_MAX8998 is not set
> # CONFIG_MFD_MT6360 is not set
> CONFIG_MFD_MT6370=m
> # CONFIG_MFD_MT6397 is not set
> # CONFIG_MFD_MENF21BMC is not set
> # CONFIG_MFD_VIPERBOARD is not set
> # CONFIG_MFD_NTXEC is not set
> # CONFIG_MFD_RETU is not set
> # CONFIG_MFD_PCF50633 is not set
> # CONFIG_UCB1400_CORE is not set
> CONFIG_MFD_SY7636A=m
> # CONFIG_MFD_RDC321X is not set
> CONFIG_MFD_RT4831=m
> # CONFIG_MFD_RT5033 is not set
> CONFIG_MFD_RT5120=m
> # CONFIG_MFD_RC5T583 is not set
> # CONFIG_MFD_RK808 is not set
> # CONFIG_MFD_RN5T618 is not set
> # CONFIG_MFD_SEC_CORE is not set
> # CONFIG_MFD_SI476X_CORE is not set
> CONFIG_MFD_SIMPLE_MFD_I2C=m
> CONFIG_MFD_SM501=m
> CONFIG_MFD_SM501_GPIO=y
> # CONFIG_MFD_SKY81452 is not set
> # CONFIG_MFD_STMPE is not set
> CONFIG_MFD_SYSCON=y
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> # CONFIG_MFD_LP3943 is not set
> # CONFIG_MFD_LP8788 is not set
> # CONFIG_MFD_TI_LMU is not set
> # CONFIG_MFD_PALMAS is not set
> # CONFIG_TPS6105X is not set
> # CONFIG_TPS65010 is not set
> # CONFIG_TPS6507X is not set
> # CONFIG_MFD_TPS65086 is not set
> # CONFIG_MFD_TPS65090 is not set
> # CONFIG_MFD_TPS65217 is not set
> # CONFIG_MFD_TI_LP873X is not set
> # CONFIG_MFD_TI_LP87565 is not set
> # CONFIG_MFD_TPS65218 is not set
> # CONFIG_MFD_TPS6586X is not set
> # CONFIG_MFD_TPS65910 is not set
> # CONFIG_MFD_TPS65912_I2C is not set
> # CONFIG_TWL4030_CORE is not set
> # CONFIG_TWL6040_CORE is not set
> CONFIG_MFD_WL1273_CORE=m
> # CONFIG_MFD_LM3533 is not set
> # CONFIG_MFD_TC3589X is not set
> # CONFIG_MFD_TQMX86 is not set
> CONFIG_MFD_VX855=m
> # CONFIG_MFD_LOCHNAGAR is not set
> # CONFIG_MFD_ARIZONA_I2C is not set
> # CONFIG_MFD_WM8400 is not set
> # CONFIG_MFD_WM831X_I2C is not set
> # CONFIG_MFD_WM8350_I2C is not set
> # CONFIG_MFD_WM8994 is not set
> # CONFIG_MFD_ROHM_BD718XX is not set
> # CONFIG_MFD_ROHM_BD71828 is not set
> # CONFIG_MFD_ROHM_BD957XMUF is not set
> # CONFIG_MFD_STPMIC1 is not set
> # CONFIG_MFD_STMFX is not set
> # CONFIG_MFD_ATC260X_I2C is not set
> # CONFIG_MFD_QCOM_PM8008 is not set
> # CONFIG_RAVE_SP_CORE is not set
> CONFIG_MFD_RSMU_I2C=m
> # end of Multifunction device drivers
>
> CONFIG_REGULATOR=y
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=m
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> # CONFIG_REGULATOR_88PG86X is not set
> # CONFIG_REGULATOR_ACT8865 is not set
> # CONFIG_REGULATOR_AD5398 is not set
> CONFIG_REGULATOR_BD9571MWV=m
> # CONFIG_REGULATOR_DA9121 is not set
> # CONFIG_REGULATOR_DA9210 is not set
> # CONFIG_REGULATOR_DA9211 is not set
> # CONFIG_REGULATOR_FAN53555 is not set
> # CONFIG_REGULATOR_FAN53880 is not set
> # CONFIG_REGULATOR_GPIO is not set
> # CONFIG_REGULATOR_ISL9305 is not set
> # CONFIG_REGULATOR_ISL6271A is not set
> # CONFIG_REGULATOR_LP3971 is not set
> # CONFIG_REGULATOR_LP3972 is not set
> # CONFIG_REGULATOR_LP872X is not set
> # CONFIG_REGULATOR_LP8755 is not set
> # CONFIG_REGULATOR_LTC3589 is not set
> # CONFIG_REGULATOR_LTC3676 is not set
> # CONFIG_REGULATOR_MAX1586 is not set
> CONFIG_REGULATOR_MAX77650=m
> # CONFIG_REGULATOR_MAX8649 is not set
> # CONFIG_REGULATOR_MAX8660 is not set
> CONFIG_REGULATOR_MAX8893=m
> # CONFIG_REGULATOR_MAX8952 is not set
> # CONFIG_REGULATOR_MAX20086 is not set
> # CONFIG_REGULATOR_MAX77826 is not set
> # CONFIG_REGULATOR_MCP16502 is not set
> CONFIG_REGULATOR_MP5416=m
> # CONFIG_REGULATOR_MP8859 is not set
> CONFIG_REGULATOR_MP886X=m
> # CONFIG_REGULATOR_MPQ7920 is not set
> # CONFIG_REGULATOR_MT6311 is not set
> CONFIG_REGULATOR_MT6370=m
> # CONFIG_REGULATOR_PCA9450 is not set
> # CONFIG_REGULATOR_PF8X00 is not set
> # CONFIG_REGULATOR_PFUZE100 is not set
> # CONFIG_REGULATOR_PV88060 is not set
> # CONFIG_REGULATOR_PV88080 is not set
> # CONFIG_REGULATOR_PV88090 is not set
> # CONFIG_REGULATOR_PWM is not set
> # CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY is not set
> CONFIG_REGULATOR_RT4801=m
> CONFIG_REGULATOR_RT4831=m
> CONFIG_REGULATOR_RT5120=m
> CONFIG_REGULATOR_RT5190A=m
> CONFIG_REGULATOR_RT5759=m
> CONFIG_REGULATOR_RT6160=m
> CONFIG_REGULATOR_RT6245=m
> CONFIG_REGULATOR_RTQ2134=m
> CONFIG_REGULATOR_RTMV20=m
> CONFIG_REGULATOR_RTQ6752=m
> # CONFIG_REGULATOR_SLG51000 is not set
> CONFIG_REGULATOR_SY7636A=m
> # CONFIG_REGULATOR_SY8106A is not set
> # CONFIG_REGULATOR_SY8824X is not set
> # CONFIG_REGULATOR_SY8827N is not set
> # CONFIG_REGULATOR_TPS51632 is not set
> # CONFIG_REGULATOR_TPS62360 is not set
> CONFIG_REGULATOR_TPS6286X=m
> # CONFIG_REGULATOR_TPS65023 is not set
> # CONFIG_REGULATOR_TPS6507X is not set
> # CONFIG_REGULATOR_TPS65132 is not set
> CONFIG_REGULATOR_VCTRL=m
> CONFIG_RC_CORE=y
> CONFIG_BPF_LIRC_MODE2=y
> CONFIG_LIRC=y
> CONFIG_RC_MAP=m
> CONFIG_RC_DECODERS=y
> CONFIG_IR_IMON_DECODER=m
> CONFIG_IR_JVC_DECODER=m
> CONFIG_IR_MCE_KBD_DECODER=m
> CONFIG_IR_NEC_DECODER=m
> CONFIG_IR_RC5_DECODER=m
> CONFIG_IR_RC6_DECODER=m
> CONFIG_IR_RCMM_DECODER=m
> CONFIG_IR_SANYO_DECODER=m
> CONFIG_IR_SHARP_DECODER=m
> CONFIG_IR_SONY_DECODER=m
> CONFIG_IR_XMP_DECODER=m
> CONFIG_RC_DEVICES=y
> CONFIG_IR_GPIO_CIR=m
> CONFIG_IR_GPIO_TX=m
> CONFIG_IR_HIX5HD2=m
> CONFIG_IR_IGORPLUGUSB=m
> CONFIG_IR_IGUANA=m
> CONFIG_IR_IMON=m
> CONFIG_IR_IMON_RAW=m
> CONFIG_IR_MCEUSB=m
> CONFIG_IR_PWM_TX=m
> CONFIG_IR_REDRAT3=m
> CONFIG_IR_SERIAL=m
> CONFIG_IR_SERIAL_TRANSMITTER=y
> CONFIG_IR_STREAMZAP=m
> CONFIG_IR_TOY=m
> CONFIG_IR_TTUSBIR=m
> CONFIG_RC_ATI_REMOTE=m
> CONFIG_RC_LOOPBACK=m
> CONFIG_RC_XBOX_DVD=m
> CONFIG_CEC_CORE=m
>
> #
> # CEC support
> #
> CONFIG_MEDIA_CEC_RC=y
> CONFIG_MEDIA_CEC_SUPPORT=y
> CONFIG_CEC_CH7322=m
> CONFIG_USB_PULSE8_CEC=m
> CONFIG_USB_RAINSHADOW_CEC=m
> # end of CEC support
>
> CONFIG_MEDIA_SUPPORT=m
> CONFIG_MEDIA_SUPPORT_FILTER=y
> CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
>
> #
> # Media device types
> #
> CONFIG_MEDIA_CAMERA_SUPPORT=y
> CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
> CONFIG_MEDIA_RADIO_SUPPORT=y
> # CONFIG_MEDIA_SDR_SUPPORT is not set
> CONFIG_MEDIA_PLATFORM_SUPPORT=y
> # CONFIG_MEDIA_TEST_SUPPORT is not set
> # end of Media device types
>
> CONFIG_VIDEO_DEV=m
> CONFIG_MEDIA_CONTROLLER=y
> CONFIG_DVB_CORE=m
>
> #
> # Video4Linux options
> #
> CONFIG_VIDEO_V4L2_I2C=y
> CONFIG_VIDEO_V4L2_SUBDEV_API=y
> # CONFIG_VIDEO_ADV_DEBUG is not set
> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> CONFIG_VIDEO_TUNER=m
> # CONFIG_V4L2_FLASH_LED_CLASS is not set
> CONFIG_V4L2_FWNODE=m
> CONFIG_V4L2_ASYNC=m
> CONFIG_VIDEOBUF_GEN=m
> CONFIG_VIDEOBUF_DMA_SG=m
> CONFIG_VIDEOBUF_VMALLOC=m
> # end of Video4Linux options
>
> #
> # Media controller options
> #
> CONFIG_MEDIA_CONTROLLER_DVB=y
> # end of Media controller options
>
> #
> # Digital TV options
> #
> # CONFIG_DVB_MMAP is not set
> CONFIG_DVB_NET=y
> CONFIG_DVB_MAX_ADAPTERS=16
> CONFIG_DVB_DYNAMIC_MINORS=y
> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> # CONFIG_DVB_ULE_DEBUG is not set
> # end of Digital TV options
>
> #
> # Media drivers
> #
>
> #
> # Drivers filtered as selected at 'Filter media drivers'
> #
>
> #
> # Media drivers
> #
> CONFIG_MEDIA_USB_SUPPORT=y
>
> #
> # Webcam devices
> #
> CONFIG_USB_GSPCA=m
> CONFIG_USB_GSPCA_BENQ=m
> CONFIG_USB_GSPCA_CONEX=m
> CONFIG_USB_GSPCA_CPIA1=m
> CONFIG_USB_GSPCA_DTCS033=m
> CONFIG_USB_GSPCA_ETOMS=m
> CONFIG_USB_GSPCA_FINEPIX=m
> CONFIG_USB_GSPCA_JEILINJ=m
> CONFIG_USB_GSPCA_JL2005BCD=m
> CONFIG_USB_GSPCA_KINECT=m
> CONFIG_USB_GSPCA_KONICA=m
> CONFIG_USB_GSPCA_MARS=m
> CONFIG_USB_GSPCA_MR97310A=m
> CONFIG_USB_GSPCA_NW80X=m
> CONFIG_USB_GSPCA_OV519=m
> CONFIG_USB_GSPCA_OV534=m
> CONFIG_USB_GSPCA_OV534_9=m
> CONFIG_USB_GSPCA_PAC207=m
> CONFIG_USB_GSPCA_PAC7302=m
> CONFIG_USB_GSPCA_PAC7311=m
> CONFIG_USB_GSPCA_SE401=m
> CONFIG_USB_GSPCA_SN9C2028=m
> CONFIG_USB_GSPCA_SN9C20X=m
> CONFIG_USB_GSPCA_SONIXB=m
> CONFIG_USB_GSPCA_SONIXJ=m
> CONFIG_USB_GSPCA_SPCA1528=m
> CONFIG_USB_GSPCA_SPCA500=m
> CONFIG_USB_GSPCA_SPCA501=m
> CONFIG_USB_GSPCA_SPCA505=m
> CONFIG_USB_GSPCA_SPCA506=m
> CONFIG_USB_GSPCA_SPCA508=m
> CONFIG_USB_GSPCA_SPCA561=m
> CONFIG_USB_GSPCA_SQ905=m
> CONFIG_USB_GSPCA_SQ905C=m
> CONFIG_USB_GSPCA_SQ930X=m
> CONFIG_USB_GSPCA_STK014=m
> CONFIG_USB_GSPCA_STK1135=m
> CONFIG_USB_GSPCA_STV0680=m
> CONFIG_USB_GSPCA_SUNPLUS=m
> CONFIG_USB_GSPCA_T613=m
> CONFIG_USB_GSPCA_TOPRO=m
> CONFIG_USB_GSPCA_TOUPTEK=m
> CONFIG_USB_GSPCA_TV8532=m
> CONFIG_USB_GSPCA_VC032X=m
> CONFIG_USB_GSPCA_VICAM=m
> CONFIG_USB_GSPCA_XIRLINK_CIT=m
> CONFIG_USB_GSPCA_ZC3XX=m
> CONFIG_USB_GL860=m
> CONFIG_USB_M5602=m
> CONFIG_USB_STV06XX=m
> CONFIG_USB_PWC=m
> # CONFIG_USB_PWC_DEBUG is not set
> CONFIG_USB_PWC_INPUT_EVDEV=y
> CONFIG_USB_S2255=m
> CONFIG_VIDEO_USBTV=m
> CONFIG_USB_VIDEO_CLASS=m
> CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=y
>
> #
> # Analog TV USB devices
> #
> CONFIG_VIDEO_GO7007=m
> CONFIG_VIDEO_GO7007_USB=m
> CONFIG_VIDEO_GO7007_LOADER=m
> CONFIG_VIDEO_GO7007_USB_S2250_BOARD=m
> CONFIG_VIDEO_HDPVR=m
> CONFIG_VIDEO_PVRUSB2=m
> CONFIG_VIDEO_PVRUSB2_SYSFS=y
> CONFIG_VIDEO_PVRUSB2_DVB=y
> # CONFIG_VIDEO_PVRUSB2_DEBUGIFC is not set
> CONFIG_VIDEO_STK1160_COMMON=m
> CONFIG_VIDEO_STK1160=m
>
> #
> # Analog/digital TV USB devices
> #
> CONFIG_VIDEO_AU0828=m
> CONFIG_VIDEO_AU0828_V4L2=y
> # CONFIG_VIDEO_AU0828_RC is not set
> CONFIG_VIDEO_CX231XX=m
> CONFIG_VIDEO_CX231XX_RC=y
> CONFIG_VIDEO_CX231XX_ALSA=m
> CONFIG_VIDEO_CX231XX_DVB=m
>
> #
> # Digital TV USB devices
> #
> CONFIG_DVB_AS102=m
> CONFIG_DVB_B2C2_FLEXCOP_USB=m
> # CONFIG_DVB_B2C2_FLEXCOP_USB_DEBUG is not set
> CONFIG_DVB_USB_V2=m
> CONFIG_DVB_USB_AF9015=m
> CONFIG_DVB_USB_AF9035=m
> CONFIG_DVB_USB_ANYSEE=m
> CONFIG_DVB_USB_AU6610=m
> CONFIG_DVB_USB_AZ6007=m
> CONFIG_DVB_USB_CE6230=m
> CONFIG_DVB_USB_DVBSKY=m
> CONFIG_DVB_USB_EC168=m
> CONFIG_DVB_USB_GL861=m
> CONFIG_DVB_USB_LME2510=m
> CONFIG_DVB_USB_MXL111SF=m
> CONFIG_DVB_USB_RTL28XXU=m
> CONFIG_DVB_USB_ZD1301=m
> CONFIG_DVB_USB=m
> # CONFIG_DVB_USB_DEBUG is not set
> CONFIG_DVB_USB_A800=m
> CONFIG_DVB_USB_AF9005=m
> CONFIG_DVB_USB_AF9005_REMOTE=m
> CONFIG_DVB_USB_AZ6027=m
> CONFIG_DVB_USB_CINERGY_T2=m
> CONFIG_DVB_USB_CXUSB=m
> CONFIG_DVB_USB_CXUSB_ANALOG=y
> CONFIG_DVB_USB_DIB0700=m
> CONFIG_DVB_USB_DIB3000MC=m
> CONFIG_DVB_USB_DIBUSB_MB=m
> # CONFIG_DVB_USB_DIBUSB_MB_FAULTY is not set
> CONFIG_DVB_USB_DIBUSB_MC=m
> CONFIG_DVB_USB_DIGITV=m
> CONFIG_DVB_USB_DTT200U=m
> CONFIG_DVB_USB_DTV5100=m
> CONFIG_DVB_USB_DW2102=m
> CONFIG_DVB_USB_GP8PSK=m
> CONFIG_DVB_USB_M920X=m
> CONFIG_DVB_USB_NOVA_T_USB2=m
> CONFIG_DVB_USB_OPERA1=m
> CONFIG_DVB_USB_PCTV452E=m
> CONFIG_DVB_USB_TECHNISAT_USB2=m
> CONFIG_DVB_USB_TTUSB2=m
> CONFIG_DVB_USB_UMT_010=m
> CONFIG_DVB_USB_VP702X=m
> CONFIG_DVB_USB_VP7045=m
> CONFIG_SMS_USB_DRV=m
> CONFIG_DVB_TTUSB_BUDGET=m
> CONFIG_DVB_TTUSB_DEC=m
>
> #
> # Webcam, TV (analog/digital) USB devices
> #
> CONFIG_VIDEO_EM28XX=m
> CONFIG_VIDEO_EM28XX_V4L2=m
> CONFIG_VIDEO_EM28XX_ALSA=m
> CONFIG_VIDEO_EM28XX_DVB=m
> CONFIG_VIDEO_EM28XX_RC=m
> CONFIG_MEDIA_PCI_SUPPORT=y
>
> #
> # Media capture support
> #
> CONFIG_VIDEO_SOLO6X10=m
> # CONFIG_VIDEO_TW5864 is not set
> # CONFIG_VIDEO_TW68 is not set
> CONFIG_VIDEO_TW686X=m
> # CONFIG_VIDEO_ZORAN is not set
>
> #
> # Media capture/analog TV support
> #
> # CONFIG_VIDEO_DT3155 is not set
> CONFIG_VIDEO_IVTV=m
> # CONFIG_VIDEO_IVTV_ALSA is not set
> CONFIG_VIDEO_FB_IVTV=m
>
> #
> # Media capture/analog/hybrid TV support
> #
> CONFIG_VIDEO_BT848=m
> CONFIG_DVB_BT8XX=m
> CONFIG_VIDEO_CX18=m
> CONFIG_VIDEO_CX18_ALSA=m
> CONFIG_VIDEO_CX23885=m
> CONFIG_MEDIA_ALTERA_CI=m
> # CONFIG_VIDEO_CX25821 is not set
> CONFIG_VIDEO_CX88=m
> CONFIG_VIDEO_CX88_ALSA=m
> CONFIG_VIDEO_CX88_BLACKBIRD=m
> CONFIG_VIDEO_CX88_DVB=m
> CONFIG_VIDEO_CX88_ENABLE_VP3054=y
> CONFIG_VIDEO_CX88_VP3054=m
> CONFIG_VIDEO_CX88_MPEG=m
> CONFIG_VIDEO_SAA7134=m
> CONFIG_VIDEO_SAA7134_ALSA=m
> CONFIG_VIDEO_SAA7134_RC=y
> CONFIG_VIDEO_SAA7134_DVB=m
> CONFIG_VIDEO_SAA7134_GO7007=m
> CONFIG_VIDEO_SAA7164=m
>
> #
> # Media digital TV PCI Adapters
> #
> CONFIG_DVB_B2C2_FLEXCOP_PCI=m
> # CONFIG_DVB_B2C2_FLEXCOP_PCI_DEBUG is not set
> CONFIG_DVB_DDBRIDGE=m
> # CONFIG_DVB_DDBRIDGE_MSIENABLE is not set
> CONFIG_DVB_DM1105=m
> CONFIG_MANTIS_CORE=m
> CONFIG_DVB_MANTIS=m
> CONFIG_DVB_HOPPER=m
> CONFIG_DVB_NGENE=m
> CONFIG_DVB_PLUTO2=m
> CONFIG_DVB_PT1=m
> # CONFIG_DVB_PT3 is not set
> CONFIG_DVB_SMIPCIE=m
> CONFIG_RADIO_ADAPTERS=m
> CONFIG_RADIO_MAXIRADIO=m
> CONFIG_RADIO_SAA7706H=m
> CONFIG_RADIO_SHARK=m
> CONFIG_RADIO_SHARK2=m
> CONFIG_RADIO_SI4713=m
> CONFIG_RADIO_TEA575X=m
> CONFIG_RADIO_TEA5764=m
> # CONFIG_RADIO_TEF6862 is not set
> CONFIG_RADIO_WL1273=m
> CONFIG_USB_DSBR=m
> CONFIG_USB_KEENE=m
> CONFIG_USB_MA901=m
> CONFIG_USB_MR800=m
> # CONFIG_USB_RAREMONO is not set
> CONFIG_RADIO_SI470X=m
> CONFIG_USB_SI470X=m
> CONFIG_I2C_SI470X=m
> # CONFIG_USB_SI4713 is not set
> # CONFIG_PLATFORM_SI4713 is not set
> # CONFIG_I2C_SI4713 is not set
> CONFIG_MEDIA_PLATFORM_DRIVERS=y
> # CONFIG_V4L_PLATFORM_DRIVERS is not set
> # CONFIG_DVB_PLATFORM_DRIVERS is not set
> CONFIG_V4L_MEM2MEM_DRIVERS=y
> # CONFIG_VIDEO_MEM2MEM_DEINTERLACE is not set
>
> #
> # Allegro DVT media platform drivers
> #
>
> #
> # Amlogic media platform drivers
> #
>
> #
> # Amphion drivers
> #
>
> #
> # Aspeed media platform drivers
> #
>
> #
> # Atmel media platform drivers
> #
>
> #
> # Cadence media platform drivers
> #
> CONFIG_VIDEO_CADENCE_CSI2RX=m
> CONFIG_VIDEO_CADENCE_CSI2TX=m
>
> #
> # Chips&Media media platform drivers
> #
>
> #
> # Intel media platform drivers
> #
>
> #
> # Marvell media platform drivers
> #
>
> #
> # Mediatek media platform drivers
> #
>
> #
> # NVidia media platform drivers
> #
>
> #
> # NXP media platform drivers
> #
>
> #
> # Qualcomm media platform drivers
> #
>
> #
> # Renesas media platform drivers
> #
>
> #
> # Rockchip media platform drivers
> #
>
> #
> # Samsung media platform drivers
> #
>
> #
> # STMicroelectronics media platform drivers
> #
>
> #
> # Sunxi media platform drivers
> #
>
> #
> # Texas Instruments drivers
> #
>
> #
> # Verisilicon media platform drivers
> #
>
> #
> # VIA media platform drivers
> #
>
> #
> # Xilinx media platform drivers
> #
>
> #
> # MMC/SDIO DVB adapters
> #
> CONFIG_SMS_SDIO_DRV=m
>
> #
> # FireWire (IEEE 1394) Adapters
> #
> CONFIG_DVB_FIREDTV=m
> CONFIG_DVB_FIREDTV_INPUT=y
> CONFIG_MEDIA_COMMON_OPTIONS=y
>
> #
> # common driver options
> #
> CONFIG_CYPRESS_FIRMWARE=m
> CONFIG_TTPCI_EEPROM=m
> CONFIG_VIDEO_CX2341X=m
> CONFIG_VIDEO_TVEEPROM=m
> CONFIG_DVB_B2C2_FLEXCOP=m
> CONFIG_SMS_SIANO_MDTV=m
> CONFIG_SMS_SIANO_RC=y
> # CONFIG_SMS_SIANO_DEBUGFS is not set
> CONFIG_VIDEOBUF2_CORE=m
> CONFIG_VIDEOBUF2_V4L2=m
> CONFIG_VIDEOBUF2_MEMOPS=m
> CONFIG_VIDEOBUF2_DMA_CONTIG=m
> CONFIG_VIDEOBUF2_VMALLOC=m
> CONFIG_VIDEOBUF2_DMA_SG=m
> CONFIG_VIDEOBUF2_DVB=m
> # end of Media drivers
>
> CONFIG_MEDIA_HIDE_ANCILLARY_SUBDRV=y
>
> #
> # Media ancillary drivers
> #
> CONFIG_MEDIA_ATTACH=y
>
> #
> # IR I2C driver auto-selected by 'Autoselect ancillary drivers'
> #
> CONFIG_VIDEO_IR_I2C=m
>
> #
> # Camera sensor devices
> #
> CONFIG_VIDEO_APTINA_PLL=m
> CONFIG_VIDEO_CCS_PLL=m
> CONFIG_VIDEO_AR0521=m
> CONFIG_VIDEO_HI556=m
> CONFIG_VIDEO_HI846=m
> CONFIG_VIDEO_HI847=m
> CONFIG_VIDEO_IMX208=m
> CONFIG_VIDEO_IMX214=m
> CONFIG_VIDEO_IMX219=m
> CONFIG_VIDEO_IMX258=m
> CONFIG_VIDEO_IMX274=m
> CONFIG_VIDEO_IMX290=m
> CONFIG_VIDEO_IMX319=m
> CONFIG_VIDEO_IMX334=m
> CONFIG_VIDEO_IMX335=m
> CONFIG_VIDEO_IMX355=m
> CONFIG_VIDEO_IMX412=m
> CONFIG_VIDEO_MAX9271_LIB=m
> CONFIG_VIDEO_MT9M001=m
> CONFIG_VIDEO_MT9M032=m
> # CONFIG_VIDEO_MT9M111 is not set
> CONFIG_VIDEO_MT9P031=m
> CONFIG_VIDEO_MT9T001=m
> CONFIG_VIDEO_MT9T112=m
> CONFIG_VIDEO_MT9V011=m
> CONFIG_VIDEO_MT9V032=m
> CONFIG_VIDEO_MT9V111=m
> CONFIG_VIDEO_NOON010PC30=m
> CONFIG_VIDEO_OG01A1B=m
> CONFIG_VIDEO_OV02A10=m
> CONFIG_VIDEO_OV08D10=m
> CONFIG_VIDEO_OV13858=m
> CONFIG_VIDEO_OV13B10=m
> CONFIG_VIDEO_OV2640=m
> CONFIG_VIDEO_OV2659=m
> CONFIG_VIDEO_OV2680=m
> CONFIG_VIDEO_OV2685=m
> CONFIG_VIDEO_OV5640=m
> CONFIG_VIDEO_OV5645=m
> CONFIG_VIDEO_OV5647=m
> CONFIG_VIDEO_OV5648=m
> CONFIG_VIDEO_OV5670=m
> CONFIG_VIDEO_OV5675=m
> CONFIG_VIDEO_OV5693=m
> CONFIG_VIDEO_OV5695=m
> CONFIG_VIDEO_OV6650=m
> CONFIG_VIDEO_OV7251=m
> CONFIG_VIDEO_OV7640=m
> # CONFIG_VIDEO_OV7670 is not set
> CONFIG_VIDEO_OV772X=m
> CONFIG_VIDEO_OV7740=m
> CONFIG_VIDEO_OV8856=m
> CONFIG_VIDEO_OV8865=m
> CONFIG_VIDEO_OV9282=m
> CONFIG_VIDEO_OV9640=m
> CONFIG_VIDEO_OV9650=m
> CONFIG_VIDEO_RDACM20=m
> # CONFIG_VIDEO_RDACM21 is not set
> CONFIG_VIDEO_RJ54N1=m
> CONFIG_VIDEO_S5K4ECGX=m
> CONFIG_VIDEO_S5K5BAF=m
> CONFIG_VIDEO_S5K6A3=m
> CONFIG_VIDEO_S5K6AA=m
> CONFIG_VIDEO_SR030PC30=m
> CONFIG_VIDEO_VS6624=m
> CONFIG_VIDEO_CCS=m
> CONFIG_VIDEO_ET8EK8=m
> CONFIG_VIDEO_M5MOLS=m
> # end of Camera sensor devices
>
> #
> # Lens drivers
> #
> CONFIG_VIDEO_AD5820=m
> CONFIG_VIDEO_AK7375=m
> CONFIG_VIDEO_DW9714=m
> CONFIG_VIDEO_DW9768=m
> CONFIG_VIDEO_DW9807_VCM=m
> # end of Lens drivers
>
> #
> # Flash devices
> #
> CONFIG_VIDEO_ADP1653=m
> CONFIG_VIDEO_LM3560=m
> CONFIG_VIDEO_LM3646=m
> # end of Flash devices
>
> #
> # audio, video and radio I2C drivers auto-selected by 'Autoselect ancillary drivers'
> #
> CONFIG_VIDEO_CS3308=m
> CONFIG_VIDEO_CS5345=m
> CONFIG_VIDEO_CS53L32A=m
> CONFIG_VIDEO_MSP3400=m
> CONFIG_VIDEO_SONY_BTF_MPX=m
> CONFIG_VIDEO_TDA7432=m
> CONFIG_VIDEO_TVAUDIO=m
> CONFIG_VIDEO_UDA1342=m
> CONFIG_VIDEO_VP27SMPX=m
> CONFIG_VIDEO_WM8739=m
> CONFIG_VIDEO_WM8775=m
> CONFIG_VIDEO_SAA6588=m
> CONFIG_VIDEO_SAA711X=m
> CONFIG_VIDEO_TVP5150=m
> CONFIG_VIDEO_TW2804=m
> CONFIG_VIDEO_TW9903=m
> CONFIG_VIDEO_TW9906=m
>
> #
> # Video and audio decoders
> #
> CONFIG_VIDEO_SAA717X=m
> CONFIG_VIDEO_CX25840=m
> CONFIG_VIDEO_SAA7127=m
> CONFIG_VIDEO_UPD64031A=m
> CONFIG_VIDEO_UPD64083=m
> CONFIG_VIDEO_SAA6752HS=m
> CONFIG_VIDEO_M52790=m
> CONFIG_MEDIA_TUNER=m
>
> #
> # Tuner drivers auto-selected by 'Autoselect ancillary drivers'
> #
> CONFIG_MEDIA_TUNER_E4000=m
> CONFIG_MEDIA_TUNER_FC0011=m
> CONFIG_MEDIA_TUNER_FC0012=m
> CONFIG_MEDIA_TUNER_FC0013=m
> CONFIG_MEDIA_TUNER_FC2580=m
> CONFIG_MEDIA_TUNER_IT913X=m
> CONFIG_MEDIA_TUNER_M88RS6000T=m
> CONFIG_MEDIA_TUNER_MAX2165=m
> CONFIG_MEDIA_TUNER_MC44S803=m
> CONFIG_MEDIA_TUNER_MT2060=m
> CONFIG_MEDIA_TUNER_MT2063=m
> CONFIG_MEDIA_TUNER_MT20XX=m
> CONFIG_MEDIA_TUNER_MT2131=m
> CONFIG_MEDIA_TUNER_MT2266=m
> CONFIG_MEDIA_TUNER_MXL5005S=m
> CONFIG_MEDIA_TUNER_MXL5007T=m
> CONFIG_MEDIA_TUNER_QM1D1B0004=m
> CONFIG_MEDIA_TUNER_QM1D1C0042=m
> CONFIG_MEDIA_TUNER_QT1010=m
> CONFIG_MEDIA_TUNER_R820T=m
> CONFIG_MEDIA_TUNER_SI2157=m
> CONFIG_MEDIA_TUNER_SIMPLE=m
> CONFIG_MEDIA_TUNER_TDA18212=m
> CONFIG_MEDIA_TUNER_TDA18218=m
> CONFIG_MEDIA_TUNER_TDA18250=m
> CONFIG_MEDIA_TUNER_TDA18271=m
> CONFIG_MEDIA_TUNER_TDA827X=m
> CONFIG_MEDIA_TUNER_TDA8290=m
> CONFIG_MEDIA_TUNER_TDA9887=m
> CONFIG_MEDIA_TUNER_TEA5761=m
> CONFIG_MEDIA_TUNER_TEA5767=m
> CONFIG_MEDIA_TUNER_TUA9001=m
> CONFIG_MEDIA_TUNER_XC2028=m
> CONFIG_MEDIA_TUNER_XC4000=m
> CONFIG_MEDIA_TUNER_XC5000=m
>
> #
> # DVB Frontend drivers auto-selected by 'Autoselect ancillary drivers'
> #
>
> #
> # Multistandard (satellite) frontends
> #
> CONFIG_DVB_M88DS3103=m
> CONFIG_DVB_MXL5XX=m
> CONFIG_DVB_STB0899=m
> CONFIG_DVB_STB6100=m
> CONFIG_DVB_STV090x=m
> CONFIG_DVB_STV0910=m
> CONFIG_DVB_STV6110x=m
> CONFIG_DVB_STV6111=m
>
> #
> # Multistandard (cable + terrestrial) frontends
> #
> CONFIG_DVB_DRXK=m
> CONFIG_DVB_MN88472=m
> CONFIG_DVB_MN88473=m
> CONFIG_DVB_SI2165=m
> CONFIG_DVB_TDA18271C2DD=m
>
> #
> # DVB-S (satellite) frontends
> #
> CONFIG_DVB_CX24110=m
> CONFIG_DVB_CX24116=m
> CONFIG_DVB_CX24117=m
> CONFIG_DVB_CX24120=m
> CONFIG_DVB_CX24123=m
> CONFIG_DVB_DS3000=m
> CONFIG_DVB_MB86A16=m
> CONFIG_DVB_MT312=m
> CONFIG_DVB_S5H1420=m
> CONFIG_DVB_SI21XX=m
> CONFIG_DVB_STB6000=m
> CONFIG_DVB_STV0288=m
> CONFIG_DVB_STV0299=m
> CONFIG_DVB_STV0900=m
> CONFIG_DVB_STV6110=m
> CONFIG_DVB_TDA10071=m
> CONFIG_DVB_TDA10086=m
> CONFIG_DVB_TDA8083=m
> CONFIG_DVB_TDA826X=m
> CONFIG_DVB_TS2020=m
> CONFIG_DVB_TUNER_CX24113=m
> CONFIG_DVB_TUNER_ITD1000=m
> CONFIG_DVB_ZL10036=m
> CONFIG_DVB_ZL10039=m
>
> #
> # DVB-T (terrestrial) frontends
> #
> CONFIG_DVB_AF9013=m
> CONFIG_DVB_AS102_FE=m
> CONFIG_DVB_CX22700=m
> CONFIG_DVB_CX22702=m
> CONFIG_DVB_CXD2820R=m
> CONFIG_DVB_CXD2841ER=m
> CONFIG_DVB_DIB3000MB=m
> CONFIG_DVB_DIB3000MC=m
> CONFIG_DVB_DIB7000M=m
> CONFIG_DVB_DIB7000P=m
> CONFIG_DVB_DRXD=m
> CONFIG_DVB_EC100=m
> CONFIG_DVB_GP8PSK_FE=m
> CONFIG_DVB_MT352=m
> CONFIG_DVB_NXT6000=m
> CONFIG_DVB_RTL2830=m
> CONFIG_DVB_RTL2832=m
> CONFIG_DVB_SI2168=m
> CONFIG_DVB_SP887X=m
> CONFIG_DVB_STV0367=m
> CONFIG_DVB_TDA10048=m
> CONFIG_DVB_TDA1004X=m
> CONFIG_DVB_ZD1301_DEMOD=m
> CONFIG_DVB_ZL10353=m
>
> #
> # DVB-C (cable) frontends
> #
> CONFIG_DVB_STV0297=m
> CONFIG_DVB_TDA10021=m
> CONFIG_DVB_TDA10023=m
> CONFIG_DVB_VES1820=m
>
> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> CONFIG_DVB_AU8522=m
> CONFIG_DVB_AU8522_DTV=m
> CONFIG_DVB_AU8522_V4L=m
> CONFIG_DVB_BCM3510=m
> CONFIG_DVB_LG2160=m
> CONFIG_DVB_LGDT3305=m
> CONFIG_DVB_LGDT3306A=m
> CONFIG_DVB_LGDT330X=m
> CONFIG_DVB_MXL692=m
> CONFIG_DVB_NXT200X=m
> CONFIG_DVB_OR51132=m
> CONFIG_DVB_OR51211=m
> CONFIG_DVB_S5H1409=m
> CONFIG_DVB_S5H1411=m
>
> #
> # ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_DIB8000=m
> CONFIG_DVB_MB86A20S=m
> CONFIG_DVB_S921=m
>
> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_TC90522=m
>
> #
> # Digital terrestrial only tuners/PLL
> #
> CONFIG_DVB_PLL=m
> CONFIG_DVB_TUNER_DIB0070=m
> CONFIG_DVB_TUNER_DIB0090=m
>
> #
> # SEC control devices for DVB-S
> #
> CONFIG_DVB_A8293=m
> CONFIG_DVB_AF9033=m
> CONFIG_DVB_ATBM8830=m
> CONFIG_DVB_ISL6405=m
> CONFIG_DVB_ISL6421=m
> CONFIG_DVB_ISL6423=m
> CONFIG_DVB_IX2505V=m
> CONFIG_DVB_LGS8GXX=m
> CONFIG_DVB_LNBH25=m
> CONFIG_DVB_LNBP21=m
> CONFIG_DVB_LNBP22=m
> CONFIG_DVB_M88RS2000=m
> CONFIG_DVB_TDA665x=m
> CONFIG_DVB_DRX39XYJ=m
>
> #
> # Common Interface (EN50221) controller drivers
> #
> CONFIG_DVB_CXD2099=m
> CONFIG_DVB_SP2=m
> # end of Media ancillary drivers
>
> #
> # Graphics support
> #
> CONFIG_APERTURE_HELPERS=y
> # CONFIG_AGP is not set
> CONFIG_DRM=y
> CONFIG_DRM_MIPI_DSI=y
> # CONFIG_DRM_DEBUG_MM is not set
> CONFIG_DRM_USE_DYNAMIC_DEBUG=y
> CONFIG_DRM_KUNIT_TEST=m
> CONFIG_DRM_KMS_HELPER=y
> CONFIG_DRM_FBDEV_EMULATION=y
> CONFIG_DRM_FBDEV_OVERALLOC=100
> CONFIG_DRM_LOAD_EDID_FIRMWARE=y
> CONFIG_DRM_DP_AUX_BUS=m
> CONFIG_DRM_DISPLAY_HELPER=m
> CONFIG_DRM_DISPLAY_DP_HELPER=y
> CONFIG_DRM_DISPLAY_HDCP_HELPER=y
> CONFIG_DRM_DISPLAY_HDMI_HELPER=y
> CONFIG_DRM_DP_AUX_CHARDEV=y
> CONFIG_DRM_DP_CEC=y
> CONFIG_DRM_TTM=m
> CONFIG_DRM_BUDDY=m
> CONFIG_DRM_VRAM_HELPER=m
> CONFIG_DRM_TTM_HELPER=m
> CONFIG_DRM_GEM_SHMEM_HELPER=y
> CONFIG_DRM_SCHED=m
>
> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_CH7006=m
> CONFIG_DRM_I2C_SIL164=m
> # CONFIG_DRM_I2C_NXP_TDA998X is not set
> # CONFIG_DRM_I2C_NXP_TDA9950 is not set
> # end of I2C encoder or helper chips
>
> #
> # ARM devices
> #
> # CONFIG_DRM_KOMEDA is not set
> # end of ARM devices
>
> CONFIG_DRM_RADEON=m
> CONFIG_DRM_RADEON_USERPTR=y
> CONFIG_DRM_AMDGPU=m
> CONFIG_DRM_AMDGPU_SI=y
> CONFIG_DRM_AMDGPU_CIK=y
> CONFIG_DRM_AMDGPU_USERPTR=y
>
> #
> # ACP (Audio CoProcessor) Configuration
> #
> CONFIG_DRM_AMD_ACP=y
> # end of ACP (Audio CoProcessor) Configuration
>
> #
> # Display Engine Configuration
> #
> CONFIG_DRM_AMD_DC=y
> CONFIG_DRM_AMD_DC_HDCP=y
> CONFIG_DRM_AMD_DC_SI=y
> # CONFIG_DEBUG_KERNEL_DC is not set
> # end of Display Engine Configuration
>
> CONFIG_HSA_AMD=y
> CONFIG_HSA_AMD_SVM=y
> CONFIG_DRM_NOUVEAU=m
> # CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT is not set
> CONFIG_NOUVEAU_DEBUG=5
> CONFIG_NOUVEAU_DEBUG_DEFAULT=3
> # CONFIG_NOUVEAU_DEBUG_MMU is not set
> # CONFIG_NOUVEAU_DEBUG_PUSH is not set
> CONFIG_DRM_NOUVEAU_BACKLIGHT=y
> # CONFIG_DRM_NOUVEAU_SVM is not set
> CONFIG_DRM_VGEM=m
> CONFIG_DRM_VKMS=m
> CONFIG_DRM_UDL=m
> CONFIG_DRM_AST=m
> CONFIG_DRM_MGAG200=m
> # CONFIG_DRM_RCAR_DW_HDMI is not set
> # CONFIG_DRM_RCAR_USE_LVDS is not set
> # CONFIG_DRM_RCAR_MIPI_DSI is not set
> CONFIG_DRM_QXL=m
> CONFIG_DRM_VIRTIO_GPU=m
> CONFIG_DRM_PANEL=y
>
> #
> # Display Panels
> #
> # CONFIG_DRM_PANEL_ARM_VERSATILE is not set
> # CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596 is not set
> CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0=m
> # CONFIG_DRM_PANEL_BOE_HIMAX8279D is not set
> CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
> CONFIG_DRM_PANEL_DSI_CM=m
> # CONFIG_DRM_PANEL_LVDS is not set
> # CONFIG_DRM_PANEL_SIMPLE is not set
> # CONFIG_DRM_PANEL_EDP is not set
> # CONFIG_DRM_PANEL_EBBG_FT8719 is not set
> CONFIG_DRM_PANEL_ELIDA_KD35T133=m
> CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02=m
> CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D=m
> # CONFIG_DRM_PANEL_ILITEK_ILI9881C is not set
> # CONFIG_DRM_PANEL_INNOLUX_P079ZCA is not set
> # CONFIG_DRM_PANEL_JDI_LT070ME05000 is not set
> CONFIG_DRM_PANEL_JDI_R63452=m
> # CONFIG_DRM_PANEL_KHADAS_TS050 is not set
> # CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04 is not set
> # CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W is not set
> # CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829 is not set
> CONFIG_DRM_PANEL_NOVATEK_NT35510=m
> CONFIG_DRM_PANEL_NOVATEK_NT35560=m
> CONFIG_DRM_PANEL_NOVATEK_NT35950=m
> # CONFIG_DRM_PANEL_NOVATEK_NT36672A is not set
> CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
> # CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO is not set
> CONFIG_DRM_PANEL_ORISETECH_OTM8009A=m
> # CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS is not set
> # CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00 is not set
> # CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
> # CONFIG_DRM_PANEL_RAYDIUM_RM67191 is not set
> # CONFIG_DRM_PANEL_RAYDIUM_RM68200 is not set
> CONFIG_DRM_PANEL_RONBO_RB070D30=m
> CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
> # CONFIG_DRM_PANEL_SAMSUNG_S6D16D0 is not set
> # CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2 is not set
> CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=m
> # CONFIG_DRM_PANEL_SAMSUNG_S6E63M0 is not set
> CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01=m
> # CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0 is not set
> # CONFIG_DRM_PANEL_SAMSUNG_SOFEF00 is not set
> CONFIG_DRM_PANEL_SEIKO_43WVF1G=m
> # CONFIG_DRM_PANEL_SHARP_LQ101R1SX01 is not set
> # CONFIG_DRM_PANEL_SHARP_LS037V7DW01 is not set
> # CONFIG_DRM_PANEL_SHARP_LS043T1LE01 is not set
> # CONFIG_DRM_PANEL_SHARP_LS060T1SX01 is not set
> # CONFIG_DRM_PANEL_SITRONIX_ST7701 is not set
> # CONFIG_DRM_PANEL_SITRONIX_ST7703 is not set
> CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521=m
> # CONFIG_DRM_PANEL_TDO_TL070WSH30 is not set
> # CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA is not set
> CONFIG_DRM_PANEL_VISIONOX_RM69299=m
> # CONFIG_DRM_PANEL_XINPENG_XPP055C272 is not set
> # end of Display Panels
>
> CONFIG_DRM_BRIDGE=y
> CONFIG_DRM_PANEL_BRIDGE=y
>
> #
> # Display Interface Bridges
> #
> # CONFIG_DRM_CDNS_DSI is not set
> CONFIG_DRM_CHIPONE_ICN6211=m
> CONFIG_DRM_CHRONTEL_CH7033=m
> CONFIG_DRM_DISPLAY_CONNECTOR=m
> CONFIG_DRM_ITE_IT6505=m
> CONFIG_DRM_LONTIUM_LT8912B=m
> # CONFIG_DRM_LONTIUM_LT9211 is not set
> # CONFIG_DRM_LONTIUM_LT9611 is not set
> CONFIG_DRM_LONTIUM_LT9611UXC=m
> # CONFIG_DRM_ITE_IT66121 is not set
> # CONFIG_DRM_LVDS_CODEC is not set
> # CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
> # CONFIG_DRM_NWL_MIPI_DSI is not set
> # CONFIG_DRM_NXP_PTN3460 is not set
> # CONFIG_DRM_PARADE_PS8622 is not set
> CONFIG_DRM_PARADE_PS8640=m
> # CONFIG_DRM_SIL_SII8620 is not set
> # CONFIG_DRM_SII902X is not set
> CONFIG_DRM_SII9234=m
> CONFIG_DRM_SIMPLE_BRIDGE=m
> # CONFIG_DRM_THINE_THC63LVD1024 is not set
> CONFIG_DRM_TOSHIBA_TC358762=m
> CONFIG_DRM_TOSHIBA_TC358764=m
> # CONFIG_DRM_TOSHIBA_TC358767 is not set
> CONFIG_DRM_TOSHIBA_TC358768=m
> CONFIG_DRM_TOSHIBA_TC358775=m
> CONFIG_DRM_TI_DLPC3433=m
> CONFIG_DRM_TI_TFP410=m
> # CONFIG_DRM_TI_SN65DSI83 is not set
> CONFIG_DRM_TI_SN65DSI86=m
> CONFIG_DRM_TI_TPD12S015=m
> CONFIG_DRM_ANALOGIX_ANX6345=m
> CONFIG_DRM_ANALOGIX_ANX78XX=m
> CONFIG_DRM_ANALOGIX_DP=m
> CONFIG_DRM_ANALOGIX_ANX7625=m
> # CONFIG_DRM_I2C_ADV7511 is not set
> # CONFIG_DRM_CDNS_MHDP8546 is not set
> # end of Display Interface Bridges
>
> # CONFIG_DRM_ETNAVIV is not set
> # CONFIG_DRM_LOGICVC is not set
> # CONFIG_DRM_MXSFB is not set
> # CONFIG_DRM_IMX_LCDIF is not set
> # CONFIG_DRM_ARCPGU is not set
> CONFIG_DRM_BOCHS=m
> CONFIG_DRM_CIRRUS_QEMU=m
> CONFIG_DRM_GM12U320=m
> CONFIG_DRM_SIMPLEDRM=y
> CONFIG_DRM_GUD=m
> CONFIG_DRM_SSD130X=m
> CONFIG_DRM_SSD130X_I2C=m
> # CONFIG_DRM_LEGACY is not set
> CONFIG_DRM_EXPORT_FOR_TESTS=y
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
> CONFIG_DRM_NOMODESET=y
> CONFIG_DRM_LIB_RANDOM=y
>
> #
> # Frame buffer Devices
> #
> CONFIG_FB_CMDLINE=y
> CONFIG_FB_NOTIFY=y
> CONFIG_FB=y
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_CFB_FILLRECT=y
> CONFIG_FB_CFB_COPYAREA=y
> CONFIG_FB_CFB_IMAGEBLIT=y
> CONFIG_FB_SYS_FILLRECT=y
> CONFIG_FB_SYS_COPYAREA=y
> CONFIG_FB_SYS_IMAGEBLIT=y
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=y
> CONFIG_FB_DEFERRED_IO=y
> CONFIG_FB_BACKLIGHT=m
> CONFIG_FB_MODE_HELPERS=y
> CONFIG_FB_TILEBLITTING=y
>
> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CIRRUS is not set
> # CONFIG_FB_PM2 is not set
> # CONFIG_FB_CYBER2000 is not set
> # CONFIG_FB_OF is not set
> # CONFIG_FB_ASILIANT is not set
> # CONFIG_FB_IMSTT is not set
> # CONFIG_FB_VGA16 is not set
> # CONFIG_FB_UVESA is not set
> # CONFIG_FB_OPENCORES is not set
> # CONFIG_FB_S1D13XXX is not set
> # CONFIG_FB_NVIDIA is not set
> # CONFIG_FB_RIVA is not set
> # CONFIG_FB_I740 is not set
> # CONFIG_FB_MATROX is not set
> # CONFIG_FB_RADEON is not set
> # CONFIG_FB_ATY128 is not set
> # CONFIG_FB_ATY is not set
> # CONFIG_FB_S3 is not set
> # CONFIG_FB_SAVAGE is not set
> # CONFIG_FB_SIS is not set
> # CONFIG_FB_NEOMAGIC is not set
> # CONFIG_FB_KYRO is not set
> # CONFIG_FB_3DFX is not set
> # CONFIG_FB_VOODOO1 is not set
> # CONFIG_FB_VT8623 is not set
> # CONFIG_FB_TRIDENT is not set
> # CONFIG_FB_ARK is not set
> # CONFIG_FB_PM3 is not set
> # CONFIG_FB_CARMINE is not set
> # CONFIG_FB_SM501 is not set
> # CONFIG_FB_SMSCUFX is not set
> # CONFIG_FB_UDL is not set
> # CONFIG_FB_IBM_GXT4500 is not set
> # CONFIG_FB_VIRTUAL is not set
> # CONFIG_FB_METRONOME is not set
> # CONFIG_FB_MB862XX is not set
> # CONFIG_FB_SSD1307 is not set
> # CONFIG_FB_SM712 is not set
> # end of Frame buffer Devices
>
> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=m
> CONFIG_LCD_PLATFORM=m
> CONFIG_BACKLIGHT_CLASS_DEVICE=y
> CONFIG_BACKLIGHT_KTD253=m
> CONFIG_BACKLIGHT_PWM=m
> CONFIG_BACKLIGHT_MT6370=m
> # CONFIG_BACKLIGHT_QCOM_WLED is not set
> CONFIG_BACKLIGHT_RT4831=m
> # CONFIG_BACKLIGHT_ADP8860 is not set
> # CONFIG_BACKLIGHT_ADP8870 is not set
> # CONFIG_BACKLIGHT_LM3630A is not set
> # CONFIG_BACKLIGHT_LM3639 is not set
> CONFIG_BACKLIGHT_LP855X=m
> # CONFIG_BACKLIGHT_GPIO is not set
> # CONFIG_BACKLIGHT_LV5207LP is not set
> # CONFIG_BACKLIGHT_BD6107 is not set
> CONFIG_BACKLIGHT_ARCXCNN=m
> CONFIG_BACKLIGHT_LED=m
> # end of Backlight & LCD device support
>
> CONFIG_VIDEOMODE_HELPERS=y
> CONFIG_HDMI=y
>
> #
> # Console display driver support
> #
> CONFIG_VGA_CONSOLE=y
> CONFIG_DUMMY_CONSOLE=y
> CONFIG_DUMMY_CONSOLE_COLUMNS=80
> CONFIG_DUMMY_CONSOLE_ROWS=25
> CONFIG_FRAMEBUFFER_CONSOLE=y
> # CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
> CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
> CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
> CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=y
> # end of Console display driver support
>
> CONFIG_LOGO=y
> # CONFIG_LOGO_LINUX_MONO is not set
> # CONFIG_LOGO_LINUX_VGA16 is not set
> CONFIG_LOGO_LINUX_CLUT224=y
> # end of Graphics support
>
> CONFIG_SOUND=m
> CONFIG_SOUND_OSS_CORE=y
> CONFIG_SOUND_OSS_CORE_PRECLAIM=y
> CONFIG_SND=m
> CONFIG_SND_TIMER=m
> CONFIG_SND_PCM=m
> CONFIG_SND_HWDEP=m
> CONFIG_SND_SEQ_DEVICE=m
> CONFIG_SND_RAWMIDI=m
> CONFIG_SND_JACK=y
> CONFIG_SND_JACK_INPUT_DEV=y
> CONFIG_SND_OSSEMUL=y
> CONFIG_SND_MIXER_OSS=m
> CONFIG_SND_PCM_OSS=m
> CONFIG_SND_PCM_OSS_PLUGINS=y
> CONFIG_SND_PCM_TIMER=y
> CONFIG_SND_HRTIMER=m
> CONFIG_SND_DYNAMIC_MINORS=y
> CONFIG_SND_MAX_CARDS=32
> # CONFIG_SND_SUPPORT_OLD_API is not set
> CONFIG_SND_PROC_FS=y
> CONFIG_SND_VERBOSE_PROCFS=y
> # CONFIG_SND_VERBOSE_PRINTK is not set
> CONFIG_SND_CTL_FAST_LOOKUP=y
> # CONFIG_SND_DEBUG is not set
> # CONFIG_SND_CTL_INPUT_VALIDATION is not set
> CONFIG_SND_VMASTER=y
> CONFIG_SND_CTL_LED=m
> CONFIG_SND_SEQUENCER=m
> CONFIG_SND_SEQ_DUMMY=m
> CONFIG_SND_SEQUENCER_OSS=m
> CONFIG_SND_SEQ_HRTIMER_DEFAULT=y
> CONFIG_SND_SEQ_MIDI_EVENT=m
> CONFIG_SND_SEQ_MIDI=m
> CONFIG_SND_SEQ_MIDI_EMUL=m
> CONFIG_SND_SEQ_VIRMIDI=m
> CONFIG_SND_MPU401_UART=m
> CONFIG_SND_OPL3_LIB=m
> CONFIG_SND_OPL3_LIB_SEQ=m
> CONFIG_SND_VX_LIB=m
> CONFIG_SND_AC97_CODEC=m
> CONFIG_SND_DRIVERS=y
> CONFIG_SND_DUMMY=m
> CONFIG_SND_ALOOP=m
> CONFIG_SND_VIRMIDI=m
> CONFIG_SND_MTPAV=m
> CONFIG_SND_SERIAL_U16550=m
> CONFIG_SND_SERIAL_GENERIC=m
> CONFIG_SND_MPU401=m
> CONFIG_SND_AC97_POWER_SAVE=y
> CONFIG_SND_AC97_POWER_SAVE_DEFAULT=0
> CONFIG_SND_SB_COMMON=m
> CONFIG_SND_PCI=y
> # CONFIG_SND_AD1889 is not set
> CONFIG_SND_ALS4000=m
> # CONFIG_SND_ATIIXP is not set
> # CONFIG_SND_ATIIXP_MODEM is not set
> CONFIG_SND_AU8810=m
> CONFIG_SND_AU8820=m
> CONFIG_SND_AU8830=m
> # CONFIG_SND_AW2 is not set
> CONFIG_SND_BT87X=m
> # CONFIG_SND_BT87X_OVERCLOCK is not set
> CONFIG_SND_CA0106=m
> CONFIG_SND_CMIPCI=m
> CONFIG_SND_OXYGEN_LIB=m
> CONFIG_SND_OXYGEN=m
> CONFIG_SND_CS4281=m
> CONFIG_SND_CS46XX=m
> CONFIG_SND_CS46XX_NEW_DSP=y
> CONFIG_SND_CTXFI=m
> CONFIG_SND_DARLA20=m
> CONFIG_SND_GINA20=m
> CONFIG_SND_LAYLA20=m
> CONFIG_SND_DARLA24=m
> CONFIG_SND_GINA24=m
> CONFIG_SND_LAYLA24=m
> CONFIG_SND_MONA=m
> CONFIG_SND_MIA=m
> CONFIG_SND_ECHO3G=m
> CONFIG_SND_INDIGO=m
> CONFIG_SND_INDIGOIO=m
> CONFIG_SND_INDIGODJ=m
> CONFIG_SND_INDIGOIOX=m
> CONFIG_SND_INDIGODJX=m
> CONFIG_SND_ENS1370=m
> CONFIG_SND_ENS1371=m
> CONFIG_SND_FM801=m
> CONFIG_SND_FM801_TEA575X_BOOL=y
> CONFIG_SND_HDSP=m
> CONFIG_SND_HDSPM=m
> CONFIG_SND_ICE1724=m
> # CONFIG_SND_INTEL8X0 is not set
> # CONFIG_SND_INTEL8X0M is not set
> CONFIG_SND_KORG1212=m
> CONFIG_SND_LOLA=m
> CONFIG_SND_LX6464ES=m
> CONFIG_SND_MIXART=m
> CONFIG_SND_NM256=m
> CONFIG_SND_PCXHR=m
> CONFIG_SND_RIPTIDE=m
> CONFIG_SND_RME32=m
> CONFIG_SND_RME96=m
> CONFIG_SND_RME9652=m
> # CONFIG_SND_VIA82XX is not set
> # CONFIG_SND_VIA82XX_MODEM is not set
> CONFIG_SND_VIRTUOSO=m
> CONFIG_SND_VX222=m
> CONFIG_SND_YMFPCI=m
>
> #
> # HD-Audio
> #
> CONFIG_SND_HDA=m
> CONFIG_SND_HDA_GENERIC_LEDS=y
> CONFIG_SND_HDA_INTEL=m
> CONFIG_SND_HDA_HWDEP=y
> CONFIG_SND_HDA_RECONFIG=y
> CONFIG_SND_HDA_INPUT_BEEP=y
> CONFIG_SND_HDA_INPUT_BEEP_MODE=0
> CONFIG_SND_HDA_PATCH_LOADER=y
> CONFIG_SND_HDA_CODEC_REALTEK=m
> CONFIG_SND_HDA_CODEC_ANALOG=m
> CONFIG_SND_HDA_CODEC_SIGMATEL=m
> CONFIG_SND_HDA_CODEC_VIA=m
> CONFIG_SND_HDA_CODEC_HDMI=m
> CONFIG_SND_HDA_CODEC_CIRRUS=m
> CONFIG_SND_HDA_CODEC_CS8409=m
> CONFIG_SND_HDA_CODEC_CONEXANT=m
> CONFIG_SND_HDA_CODEC_CA0110=m
> CONFIG_SND_HDA_CODEC_CA0132=m
> CONFIG_SND_HDA_CODEC_CA0132_DSP=y
> CONFIG_SND_HDA_CODEC_CMEDIA=m
> CONFIG_SND_HDA_CODEC_SI3054=m
> CONFIG_SND_HDA_GENERIC=m
> CONFIG_SND_HDA_POWER_SAVE_DEFAULT=1
> CONFIG_SND_HDA_INTEL_HDMI_SILENT_STREAM=y
> # end of HD-Audio
>
> CONFIG_SND_HDA_CORE=m
> CONFIG_SND_HDA_DSP_LOADER=y
> CONFIG_SND_HDA_COMPONENT=y
> CONFIG_SND_HDA_PREALLOC_SIZE=2048
> CONFIG_SND_INTEL_DSP_CONFIG=m
> CONFIG_SND_PPC=y
> CONFIG_SND_USB=y
> CONFIG_SND_USB_AUDIO=m
> CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER=y
> CONFIG_SND_USB_UA101=m
> CONFIG_SND_USB_USX2Y=m
> CONFIG_SND_USB_CAIAQ=m
> CONFIG_SND_USB_CAIAQ_INPUT=y
> CONFIG_SND_USB_6FIRE=m
> CONFIG_SND_USB_HIFACE=m
> CONFIG_SND_BCD2000=m
> CONFIG_SND_USB_LINE6=m
> CONFIG_SND_USB_POD=m
> CONFIG_SND_USB_PODHD=m
> CONFIG_SND_USB_TONEPORT=m
> CONFIG_SND_USB_VARIAX=m
> CONFIG_SND_FIREWIRE=y
> CONFIG_SND_FIREWIRE_LIB=m
> CONFIG_SND_DICE=m
> CONFIG_SND_OXFW=m
> CONFIG_SND_ISIGHT=m
> CONFIG_SND_FIREWORKS=m
> CONFIG_SND_BEBOB=m
> CONFIG_SND_FIREWIRE_DIGI00X=m
> CONFIG_SND_FIREWIRE_TASCAM=m
> CONFIG_SND_FIREWIRE_MOTU=m
> CONFIG_SND_FIREFACE=m
> # CONFIG_SND_SOC is not set
> CONFIG_SND_VIRTIO=m
> CONFIG_AC97_BUS=m
>
> #
> # HID support
> #
> CONFIG_HID=y
> CONFIG_HID_BATTERY_STRENGTH=y
> CONFIG_HIDRAW=y
> CONFIG_UHID=m
> CONFIG_HID_GENERIC=y
>
> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=m
> CONFIG_HID_ACCUTOUCH=m
> CONFIG_HID_ACRUX=m
> CONFIG_HID_ACRUX_FF=y
> CONFIG_HID_APPLE=m
> CONFIG_HID_APPLEIR=m
> # CONFIG_HID_ASUS is not set
> CONFIG_HID_AUREAL=m
> CONFIG_HID_BELKIN=m
> CONFIG_HID_BETOP_FF=m
> CONFIG_HID_BIGBEN_FF=m
> CONFIG_HID_CHERRY=m
> CONFIG_HID_CHICONY=m
> CONFIG_HID_CORSAIR=m
> CONFIG_HID_COUGAR=m
> CONFIG_HID_MACALLY=m
> CONFIG_HID_PRODIKEYS=m
> CONFIG_HID_CMEDIA=m
> CONFIG_HID_CP2112=m
> CONFIG_HID_CREATIVE_SB0540=m
> CONFIG_HID_CYPRESS=m
> CONFIG_HID_DRAGONRISE=m
> CONFIG_DRAGONRISE_FF=y
> CONFIG_HID_EMS_FF=m
> CONFIG_HID_ELAN=m
> CONFIG_HID_ELECOM=m
> CONFIG_HID_ELO=m
> CONFIG_HID_EZKEY=m
> CONFIG_HID_FT260=m
> CONFIG_HID_GEMBIRD=m
> CONFIG_HID_GFRM=m
> CONFIG_HID_GLORIOUS=m
> CONFIG_HID_HOLTEK=m
> CONFIG_HOLTEK_FF=y
> CONFIG_HID_VIVALDI_COMMON=m
> CONFIG_HID_VIVALDI=m
> CONFIG_HID_GT683R=m
> CONFIG_HID_KEYTOUCH=m
> CONFIG_HID_KYE=m
> CONFIG_HID_UCLOGIC=m
> CONFIG_HID_WALTOP=m
> CONFIG_HID_VIEWSONIC=m
> # CONFIG_HID_VRC2 is not set
> CONFIG_HID_XIAOMI=m
> CONFIG_HID_GYRATION=m
> CONFIG_HID_ICADE=m
> CONFIG_HID_ITE=m
> CONFIG_HID_JABRA=m
> CONFIG_HID_TWINHAN=m
> CONFIG_HID_KENSINGTON=m
> CONFIG_HID_LCPOWER=m
> CONFIG_HID_LED=m
> CONFIG_HID_LENOVO=m
> CONFIG_HID_LETSKETCH=m
> CONFIG_HID_LOGITECH=m
> CONFIG_HID_LOGITECH_DJ=m
> CONFIG_HID_LOGITECH_HIDPP=m
> CONFIG_LOGITECH_FF=y
> CONFIG_LOGIRUMBLEPAD2_FF=y
> CONFIG_LOGIG940_FF=y
> CONFIG_LOGIWHEELS_FF=y
> CONFIG_HID_MAGICMOUSE=y
> CONFIG_HID_MALTRON=m
> CONFIG_HID_MAYFLASH=m
> CONFIG_HID_MEGAWORLD_FF=m
> # CONFIG_HID_REDRAGON is not set
> CONFIG_HID_MICROSOFT=m
> CONFIG_HID_MONTEREY=m
> CONFIG_HID_MULTITOUCH=m
> CONFIG_HID_NINTENDO=m
> CONFIG_NINTENDO_FF=y
> CONFIG_HID_NTI=m
> CONFIG_HID_NTRIG=y
> CONFIG_HID_ORTEK=m
> CONFIG_HID_PANTHERLORD=m
> CONFIG_PANTHERLORD_FF=y
> CONFIG_HID_PENMOUNT=m
> CONFIG_HID_PETALYNX=m
> CONFIG_HID_PICOLCD=m
> CONFIG_HID_PICOLCD_FB=y
> CONFIG_HID_PICOLCD_BACKLIGHT=y
> CONFIG_HID_PICOLCD_LCD=y
> CONFIG_HID_PICOLCD_LEDS=y
> CONFIG_HID_PICOLCD_CIR=y
> CONFIG_HID_PLANTRONICS=m
> CONFIG_HID_PLAYSTATION=m
> CONFIG_PLAYSTATION_FF=y
> CONFIG_HID_PXRC=m
> CONFIG_HID_RAZER=m
> CONFIG_HID_PRIMAX=m
> CONFIG_HID_RETRODE=m
> CONFIG_HID_ROCCAT=m
> CONFIG_HID_SAITEK=m
> CONFIG_HID_SAMSUNG=m
> CONFIG_HID_SEMITEK=m
> CONFIG_HID_SIGMAMICRO=m
> CONFIG_HID_SONY=m
> CONFIG_SONY_FF=y
> CONFIG_HID_SPEEDLINK=m
> CONFIG_HID_STEAM=m
> CONFIG_HID_STEELSERIES=m
> CONFIG_HID_SUNPLUS=m
> CONFIG_HID_RMI=m
> CONFIG_HID_GREENASIA=m
> CONFIG_GREENASIA_FF=y
> CONFIG_HID_SMARTJOYPLUS=m
> CONFIG_SMARTJOYPLUS_FF=y
> CONFIG_HID_TIVO=m
> CONFIG_HID_TOPSEED=m
> CONFIG_HID_TOPRE=m
> CONFIG_HID_THINGM=m
> CONFIG_HID_THRUSTMASTER=m
> CONFIG_THRUSTMASTER_FF=y
> CONFIG_HID_UDRAW_PS3=m
> CONFIG_HID_U2FZERO=m
> CONFIG_HID_WACOM=m
> CONFIG_HID_WIIMOTE=m
> CONFIG_HID_XINMO=m
> CONFIG_HID_ZEROPLUS=m
> CONFIG_ZEROPLUS_FF=y
> CONFIG_HID_ZYDACRON=m
> CONFIG_HID_SENSOR_HUB=m
> # CONFIG_HID_SENSOR_CUSTOM_SENSOR is not set
> CONFIG_HID_ALPS=m
> CONFIG_HID_MCP2221=m
> # end of Special HID drivers
>
> #
> # USB HID support
> #
> CONFIG_USB_HID=y
> CONFIG_HID_PID=y
> CONFIG_USB_HIDDEV=y
> # end of USB HID support
>
> #
> # I2C HID support
> #
> # CONFIG_I2C_HID_OF is not set
> CONFIG_I2C_HID_OF_ELAN=m
> # CONFIG_I2C_HID_OF_GOODIX is not set
> # end of I2C HID support
> # end of HID support
>
> CONFIG_USB_OHCI_BIG_ENDIAN_DESC=y
> CONFIG_USB_OHCI_BIG_ENDIAN_MMIO=y
> CONFIG_USB_OHCI_LITTLE_ENDIAN=y
> CONFIG_USB_SUPPORT=y
> CONFIG_USB_COMMON=y
> CONFIG_USB_LED_TRIG=y
> CONFIG_USB_ULPI_BUS=m
> # CONFIG_USB_CONN_GPIO is not set
> CONFIG_USB_ARCH_HAS_HCD=y
> CONFIG_USB=y
> CONFIG_USB_PCI=y
> CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
>
> #
> # Miscellaneous USB options
> #
> CONFIG_USB_DEFAULT_PERSIST=y
> # CONFIG_USB_FEW_INIT_RETRIES is not set
> # CONFIG_USB_DYNAMIC_MINORS is not set
> # CONFIG_USB_OTG is not set
> # CONFIG_USB_OTG_PRODUCTLIST is not set
> CONFIG_USB_LEDS_TRIGGER_USBPORT=m
> CONFIG_USB_AUTOSUSPEND_DELAY=2
> CONFIG_USB_MON=y
>
> #
> # USB Host Controller Drivers
> #
> # CONFIG_USB_C67X00_HCD is not set
> CONFIG_USB_XHCI_HCD=y
> CONFIG_USB_XHCI_DBGCAP=y
> CONFIG_USB_XHCI_PCI=y
> CONFIG_USB_XHCI_PCI_RENESAS=y
> # CONFIG_USB_XHCI_PLATFORM is not set
> CONFIG_USB_EHCI_HCD=y
> CONFIG_USB_EHCI_ROOT_HUB_TT=y
> CONFIG_USB_EHCI_TT_NEWSCHED=y
> CONFIG_USB_EHCI_PCI=y
> # CONFIG_USB_EHCI_FSL is not set
> CONFIG_USB_EHCI_HCD_PPC_OF=y
> # CONFIG_USB_EHCI_HCD_PLATFORM is not set
> # CONFIG_USB_OXU210HP_HCD is not set
> # CONFIG_USB_ISP116X_HCD is not set
> # CONFIG_USB_FOTG210_HCD is not set
> CONFIG_USB_OHCI_HCD=y
> CONFIG_USB_OHCI_HCD_PPC_OF_BE=y
> CONFIG_USB_OHCI_HCD_PPC_OF_LE=y
> CONFIG_USB_OHCI_HCD_PPC_OF=y
> CONFIG_USB_OHCI_HCD_PCI=y
> # CONFIG_USB_OHCI_HCD_PLATFORM is not set
> CONFIG_USB_UHCI_HCD=y
> # CONFIG_USB_U132_HCD is not set
> CONFIG_USB_SL811_HCD=m
> CONFIG_USB_SL811_HCD_ISO=y
> # CONFIG_USB_R8A66597_HCD is not set
> # CONFIG_USB_HCD_BCMA is not set
> # CONFIG_USB_HCD_SSB is not set
> # CONFIG_USB_HCD_TEST_MODE is not set
>
> #
> # USB Device Class drivers
> #
> CONFIG_USB_ACM=m
> CONFIG_USB_PRINTER=m
> CONFIG_USB_WDM=m
> CONFIG_USB_TMC=m
>
> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> #
>
> #
> # also be needed; see USB_STORAGE Help for more info
> #
> CONFIG_USB_STORAGE=m
> # CONFIG_USB_STORAGE_DEBUG is not set
> CONFIG_USB_STORAGE_REALTEK=m
> CONFIG_REALTEK_AUTOPM=y
> CONFIG_USB_STORAGE_DATAFAB=m
> CONFIG_USB_STORAGE_FREECOM=m
> CONFIG_USB_STORAGE_ISD200=m
> CONFIG_USB_STORAGE_USBAT=m
> CONFIG_USB_STORAGE_SDDR09=m
> CONFIG_USB_STORAGE_SDDR55=m
> CONFIG_USB_STORAGE_JUMPSHOT=m
> CONFIG_USB_STORAGE_ALAUDA=m
> CONFIG_USB_STORAGE_ONETOUCH=m
> CONFIG_USB_STORAGE_KARMA=m
> CONFIG_USB_STORAGE_CYPRESS_ATACB=m
> CONFIG_USB_STORAGE_ENE_UB6250=m
> CONFIG_USB_UAS=m
>
> #
> # USB Imaging devices
> #
> CONFIG_USB_MDC800=m
> CONFIG_USB_MICROTEK=m
> CONFIG_USBIP_CORE=m
> CONFIG_USBIP_VHCI_HCD=m
> CONFIG_USBIP_VHCI_HC_PORTS=8
> CONFIG_USBIP_VHCI_NR_HCS=1
> CONFIG_USBIP_HOST=m
> # CONFIG_USBIP_DEBUG is not set
> # CONFIG_USB_CDNS_SUPPORT is not set
> # CONFIG_USB_MUSB_HDRC is not set
> # CONFIG_USB_DWC3 is not set
> # CONFIG_USB_DWC2 is not set
> # CONFIG_USB_CHIPIDEA is not set
> # CONFIG_USB_ISP1760 is not set
>
> #
> # USB port drivers
> #
> CONFIG_USB_SERIAL=y
> CONFIG_USB_SERIAL_CONSOLE=y
> CONFIG_USB_SERIAL_GENERIC=y
> CONFIG_USB_SERIAL_SIMPLE=m
> CONFIG_USB_SERIAL_AIRCABLE=m
> CONFIG_USB_SERIAL_ARK3116=m
> CONFIG_USB_SERIAL_BELKIN=m
> CONFIG_USB_SERIAL_CH341=m
> CONFIG_USB_SERIAL_WHITEHEAT=m
> CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
> CONFIG_USB_SERIAL_CP210X=m
> CONFIG_USB_SERIAL_CYPRESS_M8=m
> CONFIG_USB_SERIAL_EMPEG=m
> CONFIG_USB_SERIAL_FTDI_SIO=m
> CONFIG_USB_SERIAL_VISOR=m
> CONFIG_USB_SERIAL_IPAQ=m
> CONFIG_USB_SERIAL_IR=m
> CONFIG_USB_SERIAL_EDGEPORT=m
> CONFIG_USB_SERIAL_EDGEPORT_TI=m
> # CONFIG_USB_SERIAL_F81232 is not set
> CONFIG_USB_SERIAL_F8153X=m
> CONFIG_USB_SERIAL_GARMIN=m
> CONFIG_USB_SERIAL_IPW=m
> CONFIG_USB_SERIAL_IUU=m
> CONFIG_USB_SERIAL_KEYSPAN_PDA=m
> CONFIG_USB_SERIAL_KEYSPAN=m
> CONFIG_USB_SERIAL_KLSI=m
> CONFIG_USB_SERIAL_KOBIL_SCT=m
> CONFIG_USB_SERIAL_MCT_U232=m
> # CONFIG_USB_SERIAL_METRO is not set
> CONFIG_USB_SERIAL_MOS7720=m
> CONFIG_USB_SERIAL_MOS7840=m
> # CONFIG_USB_SERIAL_MXUPORT is not set
> CONFIG_USB_SERIAL_NAVMAN=m
> CONFIG_USB_SERIAL_PL2303=m
> CONFIG_USB_SERIAL_OTI6858=m
> CONFIG_USB_SERIAL_QCAUX=m
> CONFIG_USB_SERIAL_QUALCOMM=m
> CONFIG_USB_SERIAL_SPCP8X5=m
> CONFIG_USB_SERIAL_SAFE=m
> CONFIG_USB_SERIAL_SAFE_PADDED=y
> CONFIG_USB_SERIAL_SIERRAWIRELESS=m
> CONFIG_USB_SERIAL_SYMBOL=m
> CONFIG_USB_SERIAL_TI=m
> CONFIG_USB_SERIAL_CYBERJACK=m
> CONFIG_USB_SERIAL_WWAN=m
> CONFIG_USB_SERIAL_OPTION=m
> CONFIG_USB_SERIAL_OMNINET=m
> CONFIG_USB_SERIAL_OPTICON=m
> CONFIG_USB_SERIAL_XSENS_MT=m
> # CONFIG_USB_SERIAL_WISHBONE is not set
> CONFIG_USB_SERIAL_SSU100=m
> CONFIG_USB_SERIAL_QT2=m
> CONFIG_USB_SERIAL_UPD78F0730=m
> CONFIG_USB_SERIAL_XR=m
> CONFIG_USB_SERIAL_DEBUG=m
>
> #
> # USB Miscellaneous drivers
> #
> CONFIG_USB_EMI62=m
> CONFIG_USB_EMI26=m
> CONFIG_USB_ADUTUX=m
> CONFIG_USB_SEVSEG=m
> CONFIG_USB_LEGOTOWER=m
> CONFIG_USB_LCD=m
> # CONFIG_USB_CYPRESS_CY7C63 is not set
> # CONFIG_USB_CYTHERM is not set
> CONFIG_USB_IDMOUSE=m
> CONFIG_USB_FTDI_ELAN=m
> CONFIG_USB_APPLEDISPLAY=m
> CONFIG_APPLE_MFI_FASTCHARGE=m
> CONFIG_USB_SISUSBVGA=m
> CONFIG_USB_LD=m
> CONFIG_USB_TRANCEVIBRATOR=m
> CONFIG_USB_IOWARRIOR=m
> # CONFIG_USB_TEST is not set
> # CONFIG_USB_EHSET_TEST_FIXTURE is not set
> CONFIG_USB_ISIGHTFW=m
> CONFIG_USB_YUREX=m
> CONFIG_USB_EZUSB_FX2=m
> CONFIG_USB_HUB_USB251XB=m
> CONFIG_USB_HSIC_USB3503=m
> CONFIG_USB_HSIC_USB4604=m
> # CONFIG_USB_LINK_LAYER_TEST is not set
> CONFIG_USB_CHAOSKEY=m
> CONFIG_USB_ONBOARD_HUB=m
> CONFIG_USB_ATM=m
> CONFIG_USB_SPEEDTOUCH=m
> CONFIG_USB_CXACRU=m
> CONFIG_USB_UEAGLEATM=m
> CONFIG_USB_XUSBATM=m
>
> #
> # USB Physical Layer drivers
> #
> CONFIG_USB_PHY=y
> CONFIG_NOP_USB_XCEIV=m
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_USB_ISP1301 is not set
> # end of USB Physical Layer drivers
>
> # CONFIG_USB_GADGET is not set
> CONFIG_TYPEC=m
> CONFIG_TYPEC_TCPM=m
> CONFIG_TYPEC_TCPCI=m
> # CONFIG_TYPEC_RT1711H is not set
> CONFIG_TYPEC_TCPCI_MT6370=m
> CONFIG_TYPEC_TCPCI_MAXIM=m
> CONFIG_TYPEC_FUSB302=m
> CONFIG_TYPEC_UCSI=m
> CONFIG_UCSI_CCG=m
> CONFIG_UCSI_STM32G0=m
> CONFIG_TYPEC_TPS6598X=m
> # CONFIG_TYPEC_ANX7411 is not set
> CONFIG_TYPEC_RT1719=m
> CONFIG_TYPEC_HD3SS3220=m
> CONFIG_TYPEC_STUSB160X=m
> CONFIG_TYPEC_WUSB3801=m
>
> #
> # USB Type-C Multiplexer/DeMultiplexer Switch support
> #
> CONFIG_TYPEC_MUX_FSA4480=m
> CONFIG_TYPEC_MUX_PI3USB30532=m
> # end of USB Type-C Multiplexer/DeMultiplexer Switch support
>
> #
> # USB Type-C Alternate Mode drivers
> #
> CONFIG_TYPEC_DP_ALTMODE=m
> CONFIG_TYPEC_NVIDIA_ALTMODE=m
> # end of USB Type-C Alternate Mode drivers
>
> CONFIG_USB_ROLE_SWITCH=y
> CONFIG_MMC=m
> CONFIG_PWRSEQ_EMMC=m
> CONFIG_PWRSEQ_SD8787=m
> CONFIG_PWRSEQ_SIMPLE=m
> CONFIG_MMC_BLOCK=m
> CONFIG_MMC_BLOCK_MINORS=8
> CONFIG_SDIO_UART=m
> # CONFIG_MMC_TEST is not set
> # CONFIG_MMC_CRYPTO is not set
>
> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> CONFIG_MMC_SDHCI=m
> CONFIG_MMC_SDHCI_IO_ACCESSORS=y
> CONFIG_MMC_SDHCI_PCI=m
> CONFIG_MMC_RICOH_MMC=y
> CONFIG_MMC_SDHCI_PLTFM=m
> # CONFIG_MMC_SDHCI_OF_ARASAN is not set
> # CONFIG_MMC_SDHCI_OF_AT91 is not set
> # CONFIG_MMC_SDHCI_OF_ESDHC is not set
> # CONFIG_MMC_SDHCI_OF_HLWD is not set
> # CONFIG_MMC_SDHCI_OF_DWCMSHC is not set
> CONFIG_MMC_SDHCI_CADENCE=m
> # CONFIG_MMC_SDHCI_F_SDH30 is not set
> # CONFIG_MMC_SDHCI_MILBEAUT is not set
> CONFIG_MMC_WBSD=m
> CONFIG_MMC_ALCOR=m
> CONFIG_MMC_TIFM_SD=m
> CONFIG_MMC_CB710=m
> CONFIG_MMC_VIA_SDMMC=m
> CONFIG_MMC_VUB300=m
> CONFIG_MMC_USHC=m
> # CONFIG_MMC_USDHI6ROL0 is not set
> CONFIG_MMC_REALTEK_PCI=m
> CONFIG_MMC_REALTEK_USB=m
> CONFIG_MMC_CQHCI=m
> CONFIG_MMC_HSQ=m
> # CONFIG_MMC_TOSHIBA_PCI is not set
> # CONFIG_MMC_MTK is not set
> CONFIG_MMC_SDHCI_XENON=m
> # CONFIG_MMC_SDHCI_OMAP is not set
> # CONFIG_MMC_SDHCI_AM654 is not set
> # CONFIG_SCSI_UFSHCD is not set
> CONFIG_MEMSTICK=m
> # CONFIG_MEMSTICK_DEBUG is not set
>
> #
> # MemoryStick drivers
> #
> # CONFIG_MEMSTICK_UNSAFE_RESUME is not set
> CONFIG_MSPRO_BLOCK=m
> # CONFIG_MS_BLOCK is not set
>
> #
> # MemoryStick Host Controller Drivers
> #
> CONFIG_MEMSTICK_TIFM_MS=m
> CONFIG_MEMSTICK_JMICRON_38X=m
> CONFIG_MEMSTICK_R592=m
> CONFIG_MEMSTICK_REALTEK_PCI=m
> CONFIG_MEMSTICK_REALTEK_USB=m
> CONFIG_NEW_LEDS=y
> CONFIG_LEDS_CLASS=y
> CONFIG_LEDS_CLASS_FLASH=m
> CONFIG_LEDS_CLASS_MULTICOLOR=m
> CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y
>
> #
> # LED drivers
> #
> CONFIG_LEDS_AN30259A=m
> # CONFIG_LEDS_AW2013 is not set
> # CONFIG_LEDS_BCM6328 is not set
> # CONFIG_LEDS_BCM6358 is not set
> CONFIG_LEDS_LM3530=m
> CONFIG_LEDS_LM3532=m
> # CONFIG_LEDS_LM3642 is not set
> CONFIG_LEDS_LM3692X=m
> CONFIG_LEDS_PCA9532=m
> CONFIG_LEDS_PCA9532_GPIO=y
> CONFIG_LEDS_GPIO=m
> CONFIG_LEDS_LP3944=m
> CONFIG_LEDS_LP3952=m
> CONFIG_LEDS_LP50XX=m
> # CONFIG_LEDS_LP55XX_COMMON is not set
> # CONFIG_LEDS_LP8860 is not set
> # CONFIG_LEDS_PCA955X is not set
> # CONFIG_LEDS_PCA963X is not set
> # CONFIG_LEDS_PWM is not set
> CONFIG_LEDS_REGULATOR=m
> # CONFIG_LEDS_BD2802 is not set
> CONFIG_LEDS_LT3593=m
> # CONFIG_LEDS_TCA6507 is not set
> # CONFIG_LEDS_TLC591XX is not set
> CONFIG_LEDS_MAX77650=m
> # CONFIG_LEDS_LM355x is not set
> # CONFIG_LEDS_IS31FL319X is not set
> CONFIG_LEDS_IS31FL32XX=m
>
> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
> #
> CONFIG_LEDS_BLINKM=m
> CONFIG_LEDS_POWERNV=m
> # CONFIG_LEDS_SYSCON is not set
> CONFIG_LEDS_MLXREG=m
> CONFIG_LEDS_USER=m
> # CONFIG_LEDS_TI_LMU_COMMON is not set
>
> #
> # Flash and Torch LED drivers
> #
> CONFIG_LEDS_AS3645A=m
> # CONFIG_LEDS_KTD2692 is not set
> CONFIG_LEDS_LM3601X=m
> # CONFIG_LEDS_RT4505 is not set
> # CONFIG_LEDS_RT8515 is not set
> # CONFIG_LEDS_SGM3140 is not set
>
> #
> # RGB LED drivers
> #
> CONFIG_LEDS_PWM_MULTICOLOR=m
>
> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=y
> CONFIG_LEDS_TRIGGER_TIMER=m
> CONFIG_LEDS_TRIGGER_ONESHOT=m
> CONFIG_LEDS_TRIGGER_DISK=y
> CONFIG_LEDS_TRIGGER_MTD=y
> CONFIG_LEDS_TRIGGER_HEARTBEAT=m
> CONFIG_LEDS_TRIGGER_BACKLIGHT=m
> # CONFIG_LEDS_TRIGGER_CPU is not set
> CONFIG_LEDS_TRIGGER_ACTIVITY=m
> CONFIG_LEDS_TRIGGER_GPIO=m
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=m
>
> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=m
> CONFIG_LEDS_TRIGGER_CAMERA=m
> CONFIG_LEDS_TRIGGER_PANIC=y
> CONFIG_LEDS_TRIGGER_NETDEV=m
> CONFIG_LEDS_TRIGGER_PATTERN=m
> CONFIG_LEDS_TRIGGER_AUDIO=m
> CONFIG_LEDS_TRIGGER_TTY=m
>
> #
> # Simple LED drivers
> #
> CONFIG_ACCESSIBILITY=y
> CONFIG_A11Y_BRAILLE_CONSOLE=y
>
> #
> # Speakup console speech
> #
> CONFIG_SPEAKUP=m
> CONFIG_SPEAKUP_SYNTH_ACNTSA=m
> CONFIG_SPEAKUP_SYNTH_APOLLO=m
> CONFIG_SPEAKUP_SYNTH_AUDPTR=m
> CONFIG_SPEAKUP_SYNTH_BNS=m
> CONFIG_SPEAKUP_SYNTH_DECTLK=m
> # CONFIG_SPEAKUP_SYNTH_DECEXT is not set
> CONFIG_SPEAKUP_SYNTH_LTLK=m
> CONFIG_SPEAKUP_SYNTH_SOFT=m
> CONFIG_SPEAKUP_SYNTH_SPKOUT=m
> CONFIG_SPEAKUP_SYNTH_TXPRT=m
> # CONFIG_SPEAKUP_SYNTH_DUMMY is not set
> # end of Speakup console speech
>
> CONFIG_INFINIBAND=m
> CONFIG_INFINIBAND_USER_MAD=m
> CONFIG_INFINIBAND_USER_ACCESS=m
> CONFIG_INFINIBAND_USER_MEM=y
> CONFIG_INFINIBAND_ON_DEMAND_PAGING=y
> CONFIG_INFINIBAND_ADDR_TRANS=y
> CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=y
> CONFIG_INFINIBAND_VIRT_DMA=y
> # CONFIG_INFINIBAND_BNXT_RE is not set
> CONFIG_INFINIBAND_CXGB4=m
> CONFIG_INFINIBAND_EFA=m
> CONFIG_INFINIBAND_ERDMA=m
> CONFIG_INFINIBAND_IRDMA=m
> CONFIG_MLX4_INFINIBAND=m
> CONFIG_MLX5_INFINIBAND=m
> CONFIG_INFINIBAND_MTHCA=m
> CONFIG_INFINIBAND_MTHCA_DEBUG=y
> CONFIG_INFINIBAND_OCRDMA=m
> CONFIG_INFINIBAND_QEDR=m
> CONFIG_RDMA_RXE=m
> CONFIG_RDMA_SIW=m
> CONFIG_INFINIBAND_IPOIB=m
> CONFIG_INFINIBAND_IPOIB_CM=y
> CONFIG_INFINIBAND_IPOIB_DEBUG=y
> CONFIG_INFINIBAND_IPOIB_DEBUG_DATA=y
> CONFIG_INFINIBAND_SRP=m
> CONFIG_INFINIBAND_SRPT=m
> CONFIG_INFINIBAND_ISER=m
> CONFIG_INFINIBAND_ISERT=m
> CONFIG_INFINIBAND_RTRS=m
> CONFIG_INFINIBAND_RTRS_CLIENT=m
> CONFIG_INFINIBAND_RTRS_SERVER=m
> CONFIG_EDAC_ATOMIC_SCRUB=y
> CONFIG_EDAC_SUPPORT=y
> CONFIG_EDAC=y
> CONFIG_EDAC_LEGACY_SYSFS=y
> # CONFIG_EDAC_DEBUG is not set
> # CONFIG_EDAC_CPC925 is not set
> CONFIG_RTC_LIB=y
> CONFIG_RTC_MC146818_LIB=y
> CONFIG_RTC_CLASS=y
> CONFIG_RTC_HCTOSYS=y
> CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
> CONFIG_RTC_SYSTOHC=y
> CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
> # CONFIG_RTC_DEBUG is not set
> CONFIG_RTC_LIB_KUNIT_TEST=m
> CONFIG_RTC_NVMEM=y
>
> #
> # RTC interfaces
> #
> CONFIG_RTC_INTF_SYSFS=y
> CONFIG_RTC_INTF_PROC=y
> CONFIG_RTC_INTF_DEV=y
> # CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
> # CONFIG_RTC_DRV_TEST is not set
>
> #
> # I2C RTC drivers
> #
> # CONFIG_RTC_DRV_ABB5ZES3 is not set
> CONFIG_RTC_DRV_ABEOZ9=m
> CONFIG_RTC_DRV_ABX80X=m
> CONFIG_RTC_DRV_DS1307=m
> # CONFIG_RTC_DRV_DS1307_CENTURY is not set
> CONFIG_RTC_DRV_DS1374=m
> CONFIG_RTC_DRV_DS1374_WDT=y
> CONFIG_RTC_DRV_DS1672=m
> # CONFIG_RTC_DRV_HYM8563 is not set
> CONFIG_RTC_DRV_MAX6900=m
> CONFIG_RTC_DRV_MAX77686=m
> CONFIG_RTC_DRV_NCT3018Y=m
> CONFIG_RTC_DRV_RS5C372=m
> CONFIG_RTC_DRV_ISL1208=m
> CONFIG_RTC_DRV_ISL12022=m
> CONFIG_RTC_DRV_ISL12026=m
> CONFIG_RTC_DRV_X1205=m
> CONFIG_RTC_DRV_PCF8523=m
> CONFIG_RTC_DRV_PCF85063=m
> # CONFIG_RTC_DRV_PCF85363 is not set
> CONFIG_RTC_DRV_PCF8563=m
> CONFIG_RTC_DRV_PCF8583=m
> CONFIG_RTC_DRV_M41T80=m
> CONFIG_RTC_DRV_M41T80_WDT=y
> CONFIG_RTC_DRV_BQ32K=m
> # CONFIG_RTC_DRV_S35390A is not set
> CONFIG_RTC_DRV_FM3130=m
> CONFIG_RTC_DRV_RX8010=m
> CONFIG_RTC_DRV_RX8581=m
> CONFIG_RTC_DRV_RX8025=m
> CONFIG_RTC_DRV_EM3027=m
> CONFIG_RTC_DRV_RV3028=m
> CONFIG_RTC_DRV_RV3032=m
> # CONFIG_RTC_DRV_RV8803 is not set
> CONFIG_RTC_DRV_SD3078=m
>
> #
> # SPI RTC drivers
> #
> CONFIG_RTC_I2C_AND_SPI=y
>
> #
> # SPI and I2C RTC drivers
> #
> CONFIG_RTC_DRV_DS3232=m
> # CONFIG_RTC_DRV_DS3232_HWMON is not set
> CONFIG_RTC_DRV_PCF2127=m
> CONFIG_RTC_DRV_RV3029C2=m
> CONFIG_RTC_DRV_RV3029_HWMON=y
> # CONFIG_RTC_DRV_RX6110 is not set
>
> #
> # Platform RTC drivers
> #
> CONFIG_RTC_DRV_CMOS=y
> CONFIG_RTC_DRV_DS1286=m
> CONFIG_RTC_DRV_DS1511=m
> CONFIG_RTC_DRV_DS1553=m
> CONFIG_RTC_DRV_DS1685_FAMILY=m
> CONFIG_RTC_DRV_DS1685=y
> # CONFIG_RTC_DRV_DS1689 is not set
> # CONFIG_RTC_DRV_DS17285 is not set
> # CONFIG_RTC_DRV_DS17485 is not set
> # CONFIG_RTC_DRV_DS17885 is not set
> CONFIG_RTC_DRV_DS1742=m
> CONFIG_RTC_DRV_DS2404=m
> CONFIG_RTC_DRV_STK17TA8=m
> # CONFIG_RTC_DRV_M48T86 is not set
> CONFIG_RTC_DRV_M48T35=m
> CONFIG_RTC_DRV_M48T59=m
> CONFIG_RTC_DRV_MSM6242=m
> CONFIG_RTC_DRV_BQ4802=m
> CONFIG_RTC_DRV_RP5C01=m
> CONFIG_RTC_DRV_V3020=m
> CONFIG_RTC_DRV_OPAL=m
> # CONFIG_RTC_DRV_ZYNQMP is not set
>
> #
> # on-CPU RTC drivers
> #
> CONFIG_RTC_DRV_GENERIC=y
> # CONFIG_RTC_DRV_CADENCE is not set
> # CONFIG_RTC_DRV_FTRTC010 is not set
> CONFIG_RTC_DRV_R7301=m
>
> #
> # HID Sensor RTC drivers
> #
> # CONFIG_RTC_DRV_HID_SENSOR_TIME is not set
> # CONFIG_RTC_DRV_GOLDFISH is not set
> CONFIG_DMADEVICES=y
> # CONFIG_DMADEVICES_DEBUG is not set
>
> #
> # DMA Devices
> #
> CONFIG_DMA_ENGINE=y
> CONFIG_DMA_VIRTUAL_CHANNELS=m
> CONFIG_DMA_OF=y
> CONFIG_ALTERA_MSGDMA=m
> # CONFIG_DW_AXI_DMAC is not set
> # CONFIG_FSL_EDMA is not set
> # CONFIG_INTEL_IDMA64 is not set
> # CONFIG_PLX_DMA is not set
> # CONFIG_XILINX_ZYNQMP_DPDMA is not set
> # CONFIG_QCOM_HIDMA_MGMT is not set
> # CONFIG_QCOM_HIDMA is not set
> CONFIG_DW_DMAC_CORE=m
> CONFIG_DW_DMAC=m
> CONFIG_DW_DMAC_PCI=m
> CONFIG_DW_EDMA=m
> CONFIG_DW_EDMA_PCIE=m
> # CONFIG_SF_PDMA is not set
>
> #
> # DMA Clients
> #
> CONFIG_ASYNC_TX_DMA=y
> # CONFIG_DMATEST is not set
>
> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=y
> # CONFIG_SW_SYNC is not set
> CONFIG_UDMABUF=y
> # CONFIG_DMABUF_MOVE_NOTIFY is not set
> # CONFIG_DMABUF_DEBUG is not set
> # CONFIG_DMABUF_SELFTESTS is not set
> CONFIG_DMABUF_HEAPS=y
> CONFIG_DMABUF_SYSFS_STATS=y
> CONFIG_DMABUF_HEAPS_SYSTEM=y
> # end of DMABUF options
>
> CONFIG_AUXDISPLAY=y
> CONFIG_CHARLCD=m
> CONFIG_LINEDISP=m
> CONFIG_HD44780_COMMON=m
> CONFIG_HD44780=m
> # CONFIG_IMG_ASCII_LCD is not set
> CONFIG_HT16K33=m
> # CONFIG_LCD2S is not set
> # CONFIG_PANEL_CHANGE_MESSAGE is not set
> # CONFIG_CHARLCD_BL_OFF is not set
> # CONFIG_CHARLCD_BL_ON is not set
> CONFIG_CHARLCD_BL_FLASH=y
> CONFIG_UIO=m
> # CONFIG_UIO_CIF is not set
> # CONFIG_UIO_PDRV_GENIRQ is not set
> # CONFIG_UIO_DMEM_GENIRQ is not set
> # CONFIG_UIO_AEC is not set
> # CONFIG_UIO_SERCOS3 is not set
> CONFIG_UIO_PCI_GENERIC=m
> # CONFIG_UIO_NETX is not set
> # CONFIG_UIO_PRUSS is not set
> # CONFIG_UIO_MF624 is not set
> CONFIG_UIO_DFL=m
> CONFIG_VFIO=m
> CONFIG_VFIO_IOMMU_SPAPR_TCE=m
> CONFIG_VFIO_SPAPR_EEH=m
> CONFIG_VFIO_VIRQFD=m
> # CONFIG_VFIO_NOIOMMU is not set
> CONFIG_VFIO_PCI_CORE=m
> CONFIG_VFIO_PCI_MMAP=y
> CONFIG_VFIO_PCI_INTX=y
> CONFIG_VFIO_PCI=m
> CONFIG_MLX5_VFIO_PCI=m
> CONFIG_VFIO_MDEV=m
> CONFIG_IRQ_BYPASS_MANAGER=y
> CONFIG_VIRT_DRIVERS=y
> CONFIG_VIRTIO_ANCHOR=y
> CONFIG_VIRTIO=y
> CONFIG_VIRTIO_PCI_LIB=y
> CONFIG_VIRTIO_PCI_LIB_LEGACY=y
> CONFIG_VIRTIO_MENU=y
> CONFIG_VIRTIO_PCI=y
> CONFIG_VIRTIO_PCI_LEGACY=y
> CONFIG_VIRTIO_VDPA=m
> # CONFIG_VIRTIO_PMEM is not set
> CONFIG_VIRTIO_BALLOON=m
> CONFIG_VIRTIO_INPUT=m
> CONFIG_VIRTIO_MMIO=m
> # CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
> CONFIG_VIRTIO_DMA_SHARED_BUFFER=m
> CONFIG_VDPA=m
> CONFIG_VDPA_SIM=m
> CONFIG_VDPA_SIM_NET=m
> CONFIG_VDPA_SIM_BLOCK=m
> CONFIG_VDPA_USER=m
> CONFIG_IFCVF=m
> CONFIG_MLX5_VDPA=y
> CONFIG_MLX5_VDPA_NET=m
> CONFIG_VP_VDPA=m
> CONFIG_VHOST_IOTLB=m
> CONFIG_VHOST_RING=m
> CONFIG_VHOST=m
> CONFIG_VHOST_MENU=y
> CONFIG_VHOST_NET=m
> CONFIG_VHOST_SCSI=m
> CONFIG_VHOST_VSOCK=m
> CONFIG_VHOST_VDPA=m
> # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
>
> #
> # Microsoft Hyper-V guest support
> #
> # end of Microsoft Hyper-V guest support
>
> # CONFIG_GREYBUS is not set
> # CONFIG_COMEDI is not set
> CONFIG_STAGING=y
> # CONFIG_PRISM2_USB is not set
> # CONFIG_RTL8192U is not set
> CONFIG_RTLLIB=m
> CONFIG_RTLLIB_CRYPTO_CCMP=m
> CONFIG_RTLLIB_CRYPTO_TKIP=m
> CONFIG_RTLLIB_CRYPTO_WEP=m
> CONFIG_RTL8192E=m
> CONFIG_RTL8723BS=m
> CONFIG_R8712U=m
> # CONFIG_R8188EU is not set
> # CONFIG_RTS5208 is not set
> # CONFIG_VT6655 is not set
> # CONFIG_VT6656 is not set
>
> #
> # IIO staging drivers
> #
>
> #
> # Accelerometers
> #
> # end of Accelerometers
>
> #
> # Analog to digital converters
> #
> # end of Analog to digital converters
>
> #
> # Analog digital bi-direction converters
> #
> # CONFIG_ADT7316 is not set
> # end of Analog digital bi-direction converters
>
> #
> # Direct Digital Synthesis
> #
> # end of Direct Digital Synthesis
>
> #
> # Network Analyzer, Impedance Converters
> #
> # CONFIG_AD5933 is not set
> # end of Network Analyzer, Impedance Converters
>
> #
> # Active energy metering IC
> #
> # CONFIG_ADE7854 is not set
> # end of Active energy metering IC
>
> #
> # Resolver to digital converters
> #
> # end of Resolver to digital converters
> # end of IIO staging drivers
>
> # CONFIG_FB_SM750 is not set
> CONFIG_STAGING_MEDIA=y
> # CONFIG_VIDEO_MAX96712 is not set
> # CONFIG_STAGING_MEDIA_DEPRECATED is not set
> # CONFIG_STAGING_BOARD is not set
> # CONFIG_LTE_GDM724X is not set
> # CONFIG_KS7010 is not set
> # CONFIG_XIL_AXIS_FIFO is not set
> # CONFIG_FIELDBUS_DEV is not set
> CONFIG_QLGE=m
> # CONFIG_VME_BUS is not set
> # CONFIG_GOLDFISH is not set
> CONFIG_HAVE_CLK=y
> CONFIG_HAVE_CLK_PREPARE=y
> CONFIG_COMMON_CLK=y
> # CONFIG_COMMON_CLK_MAX9485 is not set
> # CONFIG_COMMON_CLK_SI5341 is not set
> # CONFIG_COMMON_CLK_SI5351 is not set
> # CONFIG_COMMON_CLK_SI514 is not set
> CONFIG_COMMON_CLK_SI544=m
> # CONFIG_COMMON_CLK_SI570 is not set
> # CONFIG_COMMON_CLK_CDCE706 is not set
> # CONFIG_COMMON_CLK_CDCE925 is not set
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> CONFIG_COMMON_CLK_AXI_CLKGEN=m
> # CONFIG_COMMON_CLK_PWM is not set
> CONFIG_COMMON_CLK_RS9_PCIE=m
> # CONFIG_COMMON_CLK_VC5 is not set
> CONFIG_COMMON_CLK_VC7=m
> # CONFIG_COMMON_CLK_FIXED_MMIO is not set
> CONFIG_XILINX_VCU=m
> # CONFIG_COMMON_CLK_XLNX_CLKWZRD is not set
> CONFIG_CLK_KUNIT_TEST=m
> CONFIG_CLK_GATE_KUNIT_TEST=m
> CONFIG_HWSPINLOCK=y
>
> #
> # Clock Source drivers
> #
> CONFIG_I8253_LOCK=y
> CONFIG_CLKBLD_I8253=y
> # CONFIG_MICROCHIP_PIT64B is not set
> # end of Clock Source drivers
>
> # CONFIG_MAILBOX is not set
> CONFIG_IOMMU_IOVA=m
> CONFIG_IOMMU_API=y
> CONFIG_IOMMU_SUPPORT=y
>
> #
> # Generic IOMMU Pagetable Support
> #
> # end of Generic IOMMU Pagetable Support
>
> # CONFIG_IOMMU_DEBUGFS is not set
> # CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
> CONFIG_IOMMU_DEFAULT_DMA_LAZY=y
> # CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
> CONFIG_OF_IOMMU=y
> CONFIG_SPAPR_TCE_IOMMU=y
>
> #
> # Remoteproc drivers
> #
> CONFIG_REMOTEPROC=y
> # CONFIG_REMOTEPROC_CDEV is not set
> # end of Remoteproc drivers
>
> #
> # Rpmsg drivers
> #
> # CONFIG_RPMSG_VIRTIO is not set
> # end of Rpmsg drivers
>
> # CONFIG_SOUNDWIRE is not set
>
> #
> # SOC (System On Chip) specific Drivers
> #
>
> #
> # Amlogic SoC drivers
> #
> # end of Amlogic SoC drivers
>
> #
> # Broadcom SoC drivers
> #
> # end of Broadcom SoC drivers
>
> #
> # NXP/Freescale QorIQ SoC drivers
> #
> # CONFIG_QUICC_ENGINE is not set
> # end of NXP/Freescale QorIQ SoC drivers
>
> #
> # fujitsu SoC drivers
> #
> # end of fujitsu SoC drivers
>
> #
> # i.MX SoC drivers
> #
> # end of i.MX SoC drivers
>
> #
> # Enable LiteX SoC Builder specific drivers
> #
> # CONFIG_LITEX_SOC_CONTROLLER is not set
> # end of Enable LiteX SoC Builder specific drivers
>
> #
> # Qualcomm SoC drivers
> #
> # end of Qualcomm SoC drivers
>
> # CONFIG_SOC_TI is not set
>
> #
> # Xilinx SoC drivers
> #
> # end of Xilinx SoC drivers
> # end of SOC (System On Chip) specific Drivers
>
> # CONFIG_PM_DEVFREQ is not set
> CONFIG_EXTCON=y
>
> #
> # Extcon Device Drivers
> #
> # CONFIG_EXTCON_ADC_JACK is not set
> # CONFIG_EXTCON_FSA9480 is not set
> # CONFIG_EXTCON_GPIO is not set
> # CONFIG_EXTCON_MAX3355 is not set
> # CONFIG_EXTCON_PTN5150 is not set
> # CONFIG_EXTCON_RT8973A is not set
> # CONFIG_EXTCON_SM5502 is not set
> # CONFIG_EXTCON_USB_GPIO is not set
> CONFIG_EXTCON_USBC_TUSB320=m
> # CONFIG_MEMORY is not set
> CONFIG_IIO=m
> CONFIG_IIO_BUFFER=y
> CONFIG_IIO_BUFFER_CB=m
> CONFIG_IIO_BUFFER_DMA=m
> CONFIG_IIO_BUFFER_DMAENGINE=m
> CONFIG_IIO_BUFFER_HW_CONSUMER=m
> CONFIG_IIO_KFIFO_BUF=m
> CONFIG_IIO_TRIGGERED_BUFFER=m
> CONFIG_IIO_CONFIGFS=m
> CONFIG_IIO_TRIGGER=y
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
> CONFIG_IIO_SW_DEVICE=m
> CONFIG_IIO_SW_TRIGGER=m
> CONFIG_IIO_TRIGGERED_EVENT=m
>
> #
> # Accelerometers
> #
> CONFIG_ADXL313=m
> CONFIG_ADXL313_I2C=m
> # CONFIG_ADXL345_I2C is not set
> CONFIG_ADXL355=m
> CONFIG_ADXL355_I2C=m
> CONFIG_ADXL367=m
> CONFIG_ADXL367_I2C=m
> CONFIG_ADXL372=m
> CONFIG_ADXL372_I2C=m
> # CONFIG_BMA180 is not set
> # CONFIG_BMA400 is not set
> CONFIG_BMC150_ACCEL=m
> CONFIG_BMC150_ACCEL_I2C=m
> CONFIG_DA280=m
> CONFIG_DA311=m
> # CONFIG_DMARD06 is not set
> # CONFIG_DMARD09 is not set
> CONFIG_DMARD10=m
> # CONFIG_FXLS8962AF_I2C is not set
> CONFIG_HID_SENSOR_ACCEL_3D=m
> CONFIG_IIO_ST_ACCEL_3AXIS=m
> CONFIG_IIO_ST_ACCEL_I2C_3AXIS=m
> # CONFIG_KXSD9 is not set
> CONFIG_KXCJK1013=m
> # CONFIG_MC3230 is not set
> # CONFIG_MMA7455_I2C is not set
> CONFIG_MMA7660=m
> # CONFIG_MMA8452 is not set
> # CONFIG_MMA9551 is not set
> # CONFIG_MMA9553 is not set
> CONFIG_MSA311=m
> CONFIG_MXC4005=m
> CONFIG_MXC6255=m
> # CONFIG_STK8312 is not set
> # CONFIG_STK8BA50 is not set
> # end of Accelerometers
>
> #
> # Analog to digital converters
> #
> # CONFIG_AD7091R5 is not set
> # CONFIG_AD7291 is not set
> # CONFIG_AD7606_IFACE_PARALLEL is not set
> # CONFIG_AD799X is not set
> # CONFIG_ADI_AXI_ADC is not set
> # CONFIG_CC10001_ADC is not set
> CONFIG_DLN2_ADC=m
> CONFIG_ENVELOPE_DETECTOR=m
> # CONFIG_HX711 is not set
> # CONFIG_INA2XX_ADC is not set
> # CONFIG_LTC2471 is not set
> # CONFIG_LTC2485 is not set
> # CONFIG_LTC2497 is not set
> CONFIG_MAX1363=m
> # CONFIG_MAX9611 is not set
> # CONFIG_MCP3422 is not set
> # CONFIG_NAU7802 is not set
> CONFIG_RICHTEK_RTQ6056=m
> # CONFIG_SD_ADC_MODULATOR is not set
> # CONFIG_TI_ADC081C is not set
> CONFIG_TI_ADS1015=m
> # CONFIG_VF610_ADC is not set
> # CONFIG_XILINX_XADC is not set
> # end of Analog to digital converters
>
> #
> # Analog to digital and digital to analog converters
> #
> # end of Analog to digital and digital to analog converters
>
> #
> # Analog Front Ends
> #
> CONFIG_IIO_RESCALE=m
> # end of Analog Front Ends
>
> #
> # Amplifiers
> #
> CONFIG_HMC425=m
> # end of Amplifiers
>
> #
> # Capacitance to digital converters
> #
> # CONFIG_AD7150 is not set
> # CONFIG_AD7746 is not set
> # end of Capacitance to digital converters
>
> #
> # Chemical Sensors
> #
> # CONFIG_ATLAS_PH_SENSOR is not set
> # CONFIG_ATLAS_EZO_SENSOR is not set
> CONFIG_BME680=m
> CONFIG_BME680_I2C=m
> # CONFIG_CCS811 is not set
> # CONFIG_IAQCORE is not set
> CONFIG_PMS7003=m
> CONFIG_SCD30_CORE=m
> CONFIG_SCD30_I2C=m
> CONFIG_SCD30_SERIAL=m
> # CONFIG_SCD4X is not set
> # CONFIG_SENSIRION_SGP30 is not set
> # CONFIG_SENSIRION_SGP40 is not set
> # CONFIG_SPS30_I2C is not set
> # CONFIG_SPS30_SERIAL is not set
> # CONFIG_SENSEAIR_SUNRISE_CO2 is not set
> # CONFIG_VZ89X is not set
> # end of Chemical Sensors
>
> #
> # Hid Sensor IIO Common
> #
> CONFIG_HID_SENSOR_IIO_COMMON=m
> CONFIG_HID_SENSOR_IIO_TRIGGER=m
> # end of Hid Sensor IIO Common
>
> #
> # IIO SCMI Sensors
> #
> # end of IIO SCMI Sensors
>
> #
> # SSP Sensor Common
> #
> # end of SSP Sensor Common
>
> CONFIG_IIO_ST_SENSORS_I2C=m
> CONFIG_IIO_ST_SENSORS_CORE=m
>
> #
> # Digital to analog converters
> #
> # CONFIG_AD5064 is not set
> # CONFIG_AD5380 is not set
> # CONFIG_AD5446 is not set
> # CONFIG_AD5593R is not set
> # CONFIG_AD5696_I2C is not set
> CONFIG_DPOT_DAC=m
> # CONFIG_DS4424 is not set
> # CONFIG_M62332 is not set
> # CONFIG_MAX517 is not set
> # CONFIG_MAX5821 is not set
> # CONFIG_MCP4725 is not set
> # CONFIG_TI_DAC5571 is not set
> # CONFIG_VF610_DAC is not set
> # end of Digital to analog converters
>
> #
> # IIO dummy driver
> #
> # CONFIG_IIO_SIMPLE_DUMMY is not set
> # end of IIO dummy driver
>
> #
> # Filters
> #
> # end of Filters
>
> #
> # Frequency Synthesizers DDS/PLL
> #
>
> #
> # Clock Generator/Distribution
> #
> # end of Clock Generator/Distribution
>
> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> # end of Phase-Locked Loop (PLL) frequency synthesizers
> # end of Frequency Synthesizers DDS/PLL
>
> #
> # Digital gyroscope sensors
> #
> # CONFIG_BMG160 is not set
> CONFIG_FXAS21002C=m
> CONFIG_FXAS21002C_I2C=m
> CONFIG_HID_SENSOR_GYRO_3D=m
> CONFIG_MPU3050=m
> CONFIG_MPU3050_I2C=m
> CONFIG_IIO_ST_GYRO_3AXIS=m
> CONFIG_IIO_ST_GYRO_I2C_3AXIS=m
> # CONFIG_ITG3200 is not set
> # end of Digital gyroscope sensors
>
> #
> # Health Sensors
> #
>
> #
> # Heart Rate Monitors
> #
> # CONFIG_AFE4404 is not set
> CONFIG_MAX30100=m
> # CONFIG_MAX30102 is not set
> # end of Heart Rate Monitors
> # end of Health Sensors
>
> #
> # Humidity sensors
> #
> # CONFIG_AM2315 is not set
> CONFIG_DHT11=m
> # CONFIG_HDC100X is not set
> CONFIG_HDC2010=m
> CONFIG_HID_SENSOR_HUMIDITY=m
> CONFIG_HTS221=m
> CONFIG_HTS221_I2C=m
> # CONFIG_HTU21 is not set
> # CONFIG_SI7005 is not set
> # CONFIG_SI7020 is not set
> # end of Humidity sensors
>
> #
> # Inertial measurement units
> #
> # CONFIG_BMI160_I2C is not set
> CONFIG_BOSCH_BNO055=m
> CONFIG_BOSCH_BNO055_SERIAL=m
> CONFIG_BOSCH_BNO055_I2C=m
> CONFIG_FXOS8700=m
> CONFIG_FXOS8700_I2C=m
> # CONFIG_KMX61 is not set
> CONFIG_INV_ICM42600=m
> CONFIG_INV_ICM42600_I2C=m
> # CONFIG_INV_MPU6050_I2C is not set
> CONFIG_IIO_ST_LSM6DSX=m
> CONFIG_IIO_ST_LSM6DSX_I2C=m
> # CONFIG_IIO_ST_LSM9DS0 is not set
> # end of Inertial measurement units
>
> #
> # Light sensors
> #
> # CONFIG_ADJD_S311 is not set
> CONFIG_ADUX1020=m
> CONFIG_AL3010=m
> # CONFIG_AL3320A is not set
> # CONFIG_APDS9300 is not set
> # CONFIG_APDS9960 is not set
> # CONFIG_AS73211 is not set
> CONFIG_BH1750=m
> # CONFIG_BH1780 is not set
> CONFIG_CM32181=m
> # CONFIG_CM3232 is not set
> # CONFIG_CM3323 is not set
> CONFIG_CM3605=m
> # CONFIG_CM36651 is not set
> CONFIG_GP2AP002=m
> # CONFIG_GP2AP020A00F is not set
> # CONFIG_SENSORS_ISL29018 is not set
> # CONFIG_SENSORS_ISL29028 is not set
> # CONFIG_ISL29125 is not set
> CONFIG_HID_SENSOR_ALS=m
> # CONFIG_HID_SENSOR_PROX is not set
> # CONFIG_JSA1212 is not set
> CONFIG_RPR0521=m
> CONFIG_LTR501=m
> CONFIG_LTRF216A=m
> CONFIG_LV0104CS=m
> # CONFIG_MAX44000 is not set
> CONFIG_MAX44009=m
> # CONFIG_NOA1305 is not set
> CONFIG_OPT3001=m
> CONFIG_PA12203001=m
> # CONFIG_SI1133 is not set
> # CONFIG_SI1145 is not set
> CONFIG_STK3310=m
> CONFIG_ST_UVIS25=m
> CONFIG_ST_UVIS25_I2C=m
> # CONFIG_TCS3414 is not set
> # CONFIG_TCS3472 is not set
> # CONFIG_SENSORS_TSL2563 is not set
> # CONFIG_TSL2583 is not set
> # CONFIG_TSL2591 is not set
> CONFIG_TSL2772=m
> # CONFIG_TSL4531 is not set
> # CONFIG_US5182D is not set
> # CONFIG_VCNL4000 is not set
> CONFIG_VCNL4035=m
> CONFIG_VEML6030=m
> # CONFIG_VEML6070 is not set
> CONFIG_VL6180=m
> CONFIG_ZOPT2201=m
> # end of Light sensors
>
> #
> # Magnetometer sensors
> #
> # CONFIG_AK8974 is not set
> # CONFIG_AK8975 is not set
> # CONFIG_AK09911 is not set
> # CONFIG_BMC150_MAGN_I2C is not set
> # CONFIG_MAG3110 is not set
> CONFIG_HID_SENSOR_MAGNETOMETER_3D=m
> # CONFIG_MMC35240 is not set
> CONFIG_IIO_ST_MAGN_3AXIS=m
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
> # CONFIG_SENSORS_HMC5843_I2C is not set
> CONFIG_SENSORS_RM3100=m
> CONFIG_SENSORS_RM3100_I2C=m
> # CONFIG_YAMAHA_YAS530 is not set
> # end of Magnetometer sensors
>
> #
> # Multiplexers
> #
> CONFIG_IIO_MUX=m
> # end of Multiplexers
>
> #
> # Inclinometer sensors
> #
> CONFIG_HID_SENSOR_INCLINOMETER_3D=m
> CONFIG_HID_SENSOR_DEVICE_ROTATION=m
> # end of Inclinometer sensors
>
> CONFIG_IIO_RESCALE_KUNIT_TEST=m
> CONFIG_IIO_FORMAT_KUNIT_TEST=m
>
> #
> # Triggers - standalone
> #
> # CONFIG_IIO_HRTIMER_TRIGGER is not set
> CONFIG_IIO_INTERRUPT_TRIGGER=m
> CONFIG_IIO_TIGHTLOOP_TRIGGER=m
> # CONFIG_IIO_SYSFS_TRIGGER is not set
> # end of Triggers - standalone
>
> #
> # Linear and angular position sensors
> #
> CONFIG_HID_SENSOR_CUSTOM_INTEL_HINGE=m
> # end of Linear and angular position sensors
>
> #
> # Digital potentiometers
> #
> CONFIG_AD5110=m
> CONFIG_AD5272=m
> # CONFIG_DS1803 is not set
> # CONFIG_MAX5432 is not set
> CONFIG_MCP4018=m
> # CONFIG_MCP4531 is not set
> # CONFIG_TPL0102 is not set
> # end of Digital potentiometers
>
> #
> # Digital potentiostats
> #
> CONFIG_LMP91000=m
> # end of Digital potentiostats
>
> #
> # Pressure sensors
> #
> CONFIG_ABP060MG=m
> CONFIG_BMP280=m
> CONFIG_BMP280_I2C=m
> # CONFIG_DLHL60D is not set
> # CONFIG_DPS310 is not set
> # CONFIG_HID_SENSOR_PRESS is not set
> # CONFIG_HP03 is not set
> CONFIG_ICP10100=m
> CONFIG_MPL115=m
> CONFIG_MPL115_I2C=m
> # CONFIG_MPL3115 is not set
> # CONFIG_MS5611 is not set
> # CONFIG_MS5637 is not set
> # CONFIG_IIO_ST_PRESS is not set
> # CONFIG_T5403 is not set
> # CONFIG_HP206C is not set
> # CONFIG_ZPA2326 is not set
> # end of Pressure sensors
>
> #
> # Lightning sensors
> #
> # end of Lightning sensors
>
> #
> # Proximity and distance sensors
> #
> # CONFIG_ISL29501 is not set
> # CONFIG_LIDAR_LITE_V2 is not set
> CONFIG_MB1232=m
> # CONFIG_PING is not set
> # CONFIG_RFD77402 is not set
> # CONFIG_SRF04 is not set
> CONFIG_SX_COMMON=m
> CONFIG_SX9310=m
> CONFIG_SX9324=m
> CONFIG_SX9360=m
> # CONFIG_SX9500 is not set
> # CONFIG_SRF08 is not set
> CONFIG_VCNL3020=m
> CONFIG_VL53L0X_I2C=m
> # end of Proximity and distance sensors
>
> #
> # Resolver to digital converters
> #
> # end of Resolver to digital converters
>
> #
> # Temperature sensors
> #
> CONFIG_HID_SENSOR_TEMP=m
> CONFIG_MLX90614=m
> CONFIG_MLX90632=m
> # CONFIG_TMP006 is not set
> # CONFIG_TMP007 is not set
> CONFIG_TMP117=m
> # CONFIG_TSYS01 is not set
> # CONFIG_TSYS02D is not set
> # end of Temperature sensors
>
> # CONFIG_NTB is not set
> CONFIG_PWM=y
> CONFIG_PWM_SYSFS=y
> # CONFIG_PWM_DEBUG is not set
> # CONFIG_PWM_ATMEL_TCB is not set
> # CONFIG_PWM_CLK is not set
> CONFIG_PWM_DWC=m
> # CONFIG_PWM_FSL_FTM is not set
> # CONFIG_PWM_PCA9685 is not set
> # CONFIG_PWM_XILINX is not set
>
> #
> # IRQ chip support
> #
> CONFIG_IRQCHIP=y
> # CONFIG_AL_FIC is not set
> # CONFIG_XILINX_INTC is not set
> # end of IRQ chip support
>
> # CONFIG_IPACK_BUS is not set
> CONFIG_RESET_CONTROLLER=y
> # CONFIG_RESET_TI_SYSCON is not set
> CONFIG_RESET_TI_TPS380X=m
>
> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=y
> CONFIG_GENERIC_PHY_MIPI_DPHY=y
> # CONFIG_PHY_CAN_TRANSCEIVER is not set
>
> #
> # PHY drivers for Broadcom platforms
> #
> # CONFIG_BCM_KONA_USB2_PHY is not set
> # end of PHY drivers for Broadcom platforms
>
> CONFIG_PHY_CADENCE_TORRENT=m
> # CONFIG_PHY_CADENCE_DPHY is not set
> CONFIG_PHY_CADENCE_DPHY_RX=m
> CONFIG_PHY_CADENCE_SIERRA=m
> CONFIG_PHY_CADENCE_SALVO=m
> # CONFIG_PHY_PXA_28NM_HSIC is not set
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> # CONFIG_PHY_LAN966X_SERDES is not set
> # CONFIG_PHY_CPCAP_USB is not set
> # CONFIG_PHY_MAPPHONE_MDM6600 is not set
> # CONFIG_PHY_OCELOT_SERDES is not set
> # CONFIG_PHY_QCOM_USB_HS is not set
> # CONFIG_PHY_QCOM_USB_HSIC is not set
> # CONFIG_PHY_TUSB1210 is not set
> # end of PHY Subsystem
>
> CONFIG_POWERCAP=y
> # CONFIG_IDLE_INJECT is not set
> CONFIG_DTPM=y
> CONFIG_DTPM_CPU=y
> CONFIG_DTPM_DEVFREQ=y
> # CONFIG_MCB is not set
>
> #
> # Performance monitor support
> #
> # end of Performance monitor support
>
> CONFIG_RAS=y
> CONFIG_USB4=y
> # CONFIG_USB4_DEBUGFS_WRITE is not set
> # CONFIG_USB4_DMA_TEST is not set
>
> #
> # Android
> #
> # CONFIG_ANDROID_BINDER_IPC is not set
> # end of Android
>
> CONFIG_LIBNVDIMM=m
> CONFIG_BLK_DEV_PMEM=m
> CONFIG_ND_CLAIM=y
> # CONFIG_BTT is not set
> CONFIG_ND_PFN=m
> CONFIG_NVDIMM_PFN=y
> CONFIG_NVDIMM_DAX=y
> CONFIG_OF_PMEM=m
> CONFIG_NVDIMM_KEYS=y
> CONFIG_DAX=y
> CONFIG_DEV_DAX=m
> CONFIG_DEV_DAX_PMEM=m
> CONFIG_DEV_DAX_KMEM=m
> CONFIG_NVMEM=y
> CONFIG_NVMEM_SYSFS=y
> CONFIG_NVMEM_RMEM=m
> # CONFIG_NVMEM_U_BOOT_ENV is not set
>
> #
> # HW tracing support
> #
> # CONFIG_STM is not set
> # CONFIG_INTEL_TH is not set
> # end of HW tracing support
>
> CONFIG_FPGA=m
> CONFIG_ALTERA_PR_IP_CORE=m
> CONFIG_ALTERA_PR_IP_CORE_PLAT=m
> CONFIG_FPGA_MGR_ALTERA_CVP=m
> CONFIG_FPGA_BRIDGE=m
> # CONFIG_ALTERA_FREEZE_BRIDGE is not set
> CONFIG_XILINX_PR_DECOUPLER=m
> CONFIG_FPGA_REGION=m
> CONFIG_OF_FPGA_REGION=m
> CONFIG_FPGA_DFL=m
> CONFIG_FPGA_DFL_FME=m
> CONFIG_FPGA_DFL_FME_MGR=m
> CONFIG_FPGA_DFL_FME_BRIDGE=m
> CONFIG_FPGA_DFL_FME_REGION=m
> CONFIG_FPGA_DFL_AFU=m
> CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000=m
> CONFIG_FPGA_DFL_PCI=m
> CONFIG_FSI=m
> # CONFIG_FSI_NEW_DEV_NODE is not set
> CONFIG_FSI_MASTER_GPIO=m
> CONFIG_FSI_MASTER_HUB=m
> CONFIG_FSI_MASTER_ASPEED=m
> CONFIG_FSI_SCOM=m
> CONFIG_FSI_SBEFIFO=m
> CONFIG_FSI_OCC=m
> CONFIG_MULTIPLEXER=m
>
> #
> # Multiplexer drivers
> #
> CONFIG_MUX_ADG792A=m
> CONFIG_MUX_GPIO=m
> CONFIG_MUX_MMIO=m
> # end of Multiplexer drivers
>
> # CONFIG_SIOX is not set
> # CONFIG_SLIMBUS is not set
> CONFIG_INTERCONNECT=y
> # CONFIG_COUNTER is not set
> # CONFIG_MOST is not set
> # CONFIG_PECI is not set
> # CONFIG_HTE is not set
> # end of Device Drivers
>
> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=y
> CONFIG_VALIDATE_FS_PARSER=y
> CONFIG_FS_IOMAP=y
> # CONFIG_EXT2_FS is not set
> # CONFIG_EXT3_FS is not set
> CONFIG_EXT4_FS=y
> CONFIG_EXT4_USE_FOR_EXT2=y
> CONFIG_EXT4_FS_POSIX_ACL=y
> CONFIG_EXT4_FS_SECURITY=y
> # CONFIG_EXT4_DEBUG is not set
> CONFIG_EXT4_KUNIT_TESTS=m
> CONFIG_JBD2=y
> # CONFIG_JBD2_DEBUG is not set
> CONFIG_FS_MBCACHE=y
> CONFIG_REISERFS_FS=m
> # CONFIG_REISERFS_CHECK is not set
> CONFIG_REISERFS_PROC_INFO=y
> CONFIG_REISERFS_FS_XATTR=y
> CONFIG_REISERFS_FS_POSIX_ACL=y
> CONFIG_REISERFS_FS_SECURITY=y
> CONFIG_JFS_FS=m
> CONFIG_JFS_POSIX_ACL=y
> CONFIG_JFS_SECURITY=y
> # CONFIG_JFS_DEBUG is not set
> # CONFIG_JFS_STATISTICS is not set
> CONFIG_XFS_FS=m
> CONFIG_XFS_SUPPORT_V4=y
> CONFIG_XFS_QUOTA=y
> CONFIG_XFS_POSIX_ACL=y
> # CONFIG_XFS_RT is not set
> CONFIG_XFS_ONLINE_SCRUB=y
> # CONFIG_XFS_ONLINE_REPAIR is not set
> # CONFIG_XFS_WARN is not set
> # CONFIG_XFS_DEBUG is not set
> CONFIG_GFS2_FS=m
> CONFIG_GFS2_FS_LOCKING_DLM=y
> CONFIG_OCFS2_FS=m
> CONFIG_OCFS2_FS_O2CB=m
> CONFIG_OCFS2_FS_USERSPACE_CLUSTER=m
> # CONFIG_OCFS2_FS_STATS is not set
> # CONFIG_OCFS2_DEBUG_MASKLOG is not set
> # CONFIG_OCFS2_DEBUG_FS is not set
> CONFIG_BTRFS_FS=y
> CONFIG_BTRFS_FS_POSIX_ACL=y
> # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> # CONFIG_BTRFS_DEBUG is not set
> # CONFIG_BTRFS_ASSERT is not set
> # CONFIG_BTRFS_FS_REF_VERIFY is not set
> CONFIG_NILFS2_FS=m
> CONFIG_F2FS_FS=m
> CONFIG_F2FS_STAT_FS=y
> CONFIG_F2FS_FS_XATTR=y
> CONFIG_F2FS_FS_POSIX_ACL=y
> CONFIG_F2FS_FS_SECURITY=y
> # CONFIG_F2FS_CHECK_FS is not set
> # CONFIG_F2FS_FAULT_INJECTION is not set
> CONFIG_F2FS_FS_COMPRESSION=y
> CONFIG_F2FS_FS_LZO=y
> CONFIG_F2FS_FS_LZORLE=y
> CONFIG_F2FS_FS_LZ4=y
> CONFIG_F2FS_FS_LZ4HC=y
> CONFIG_F2FS_FS_ZSTD=y
> CONFIG_F2FS_IOSTAT=y
> CONFIG_F2FS_UNFAIR_RWSEM=y
> CONFIG_ZONEFS_FS=m
> CONFIG_FS_DAX=y
> CONFIG_FS_DAX_PMD=y
> CONFIG_FS_POSIX_ACL=y
> CONFIG_EXPORTFS=y
> CONFIG_EXPORTFS_BLOCK_OPS=y
> CONFIG_FILE_LOCKING=y
> CONFIG_FS_ENCRYPTION=y
> CONFIG_FS_ENCRYPTION_ALGS=y
> CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
> CONFIG_FS_VERITY=y
> # CONFIG_FS_VERITY_DEBUG is not set
> # CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
> CONFIG_FSNOTIFY=y
> CONFIG_DNOTIFY=y
> CONFIG_INOTIFY_USER=y
> CONFIG_FANOTIFY=y
> CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
> CONFIG_QUOTA=y
> CONFIG_QUOTA_NETLINK_INTERFACE=y
> # CONFIG_PRINT_QUOTA_WARNING is not set
> # CONFIG_QUOTA_DEBUG is not set
> CONFIG_QUOTA_TREE=y
> # CONFIG_QFMT_V1 is not set
> CONFIG_QFMT_V2=y
> CONFIG_QUOTACTL=y
> CONFIG_AUTOFS4_FS=y
> CONFIG_AUTOFS_FS=y
> CONFIG_FUSE_FS=m
> CONFIG_CUSE=m
> CONFIG_VIRTIO_FS=m
> CONFIG_FUSE_DAX=y
> CONFIG_OVERLAY_FS=m
> # CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
> CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
> # CONFIG_OVERLAY_FS_INDEX is not set
> # CONFIG_OVERLAY_FS_XINO_AUTO is not set
> # CONFIG_OVERLAY_FS_METACOPY is not set
>
> #
> # Caches
> #
> CONFIG_NETFS_SUPPORT=m
> CONFIG_NETFS_STATS=y
> CONFIG_FSCACHE=m
> CONFIG_FSCACHE_STATS=y
> # CONFIG_FSCACHE_DEBUG is not set
> CONFIG_CACHEFILES=m
> # CONFIG_CACHEFILES_DEBUG is not set
> # CONFIG_CACHEFILES_ERROR_INJECTION is not set
> # CONFIG_CACHEFILES_ONDEMAND is not set
> # end of Caches
>
> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=m
> CONFIG_JOLIET=y
> CONFIG_ZISOFS=y
> CONFIG_UDF_FS=m
> # end of CD-ROM/DVD Filesystems
>
> #
> # DOS/FAT/EXFAT/NT Filesystems
> #
> CONFIG_FAT_FS=m
> CONFIG_MSDOS_FS=m
> CONFIG_VFAT_FS=m
> CONFIG_FAT_DEFAULT_CODEPAGE=437
> CONFIG_FAT_DEFAULT_IOCHARSET="ascii"
> # CONFIG_FAT_DEFAULT_UTF8 is not set
> CONFIG_FAT_KUNIT_TEST=m
> CONFIG_EXFAT_FS=m
> CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
> # CONFIG_NTFS_FS is not set
> CONFIG_NTFS3_FS=m
> # CONFIG_NTFS3_64BIT_CLUSTER is not set
> CONFIG_NTFS3_LZX_XPRESS=y
> CONFIG_NTFS3_FS_POSIX_ACL=y
> # end of DOS/FAT/EXFAT/NT Filesystems
>
> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=y
> CONFIG_PROC_KCORE=y
> CONFIG_PROC_VMCORE=y
> CONFIG_PROC_VMCORE_DEVICE_DUMP=y
> CONFIG_PROC_SYSCTL=y
> CONFIG_PROC_PAGE_MONITOR=y
> CONFIG_PROC_CHILDREN=y
> CONFIG_KERNFS=y
> CONFIG_SYSFS=y
> CONFIG_TMPFS=y
> CONFIG_TMPFS_POSIX_ACL=y
> CONFIG_TMPFS_XATTR=y
> CONFIG_TMPFS_INODE64=y
> CONFIG_ARCH_SUPPORTS_HUGETLBFS=y
> CONFIG_HUGETLBFS=y
> CONFIG_HUGETLB_PAGE=y
> CONFIG_MEMFD_CREATE=y
> CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
> CONFIG_CONFIGFS_FS=y
> # end of Pseudo filesystems
>
> CONFIG_MISC_FILESYSTEMS=y
> CONFIG_ORANGEFS_FS=m
> # CONFIG_ADFS_FS is not set
> CONFIG_AFFS_FS=m
> CONFIG_ECRYPT_FS=m
> # CONFIG_ECRYPT_FS_MESSAGING is not set
> CONFIG_HFS_FS=m
> CONFIG_HFSPLUS_FS=m
> CONFIG_BEFS_FS=m
> # CONFIG_BEFS_DEBUG is not set
> # CONFIG_BFS_FS is not set
> # CONFIG_EFS_FS is not set
> CONFIG_JFFS2_FS=m
> CONFIG_JFFS2_FS_DEBUG=0
> CONFIG_JFFS2_FS_WRITEBUFFER=y
> # CONFIG_JFFS2_FS_WBUF_VERIFY is not set
> CONFIG_JFFS2_SUMMARY=y
> CONFIG_JFFS2_FS_XATTR=y
> CONFIG_JFFS2_FS_POSIX_ACL=y
> CONFIG_JFFS2_FS_SECURITY=y
> # CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
> CONFIG_JFFS2_ZLIB=y
> CONFIG_JFFS2_RTIME=y
> CONFIG_UBIFS_FS=m
> # CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
> CONFIG_UBIFS_FS_LZO=y
> CONFIG_UBIFS_FS_ZLIB=y
> CONFIG_UBIFS_FS_ZSTD=y
> CONFIG_UBIFS_ATIME_SUPPORT=y
> CONFIG_UBIFS_FS_XATTR=y
> CONFIG_UBIFS_FS_SECURITY=y
> CONFIG_UBIFS_FS_AUTHENTICATION=y
> # CONFIG_CRAMFS is not set
> CONFIG_SQUASHFS=m
> # CONFIG_SQUASHFS_FILE_CACHE is not set
> CONFIG_SQUASHFS_FILE_DIRECT=y
> CONFIG_SQUASHFS_DECOMP_SINGLE=y
> # CONFIG_SQUASHFS_DECOMP_MULTI is not set
> # CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
> CONFIG_SQUASHFS_XATTR=y
> CONFIG_SQUASHFS_ZLIB=y
> CONFIG_SQUASHFS_LZ4=y
> CONFIG_SQUASHFS_LZO=y
> CONFIG_SQUASHFS_XZ=y
> CONFIG_SQUASHFS_ZSTD=y
> # CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
> # CONFIG_SQUASHFS_EMBEDDED is not set
> CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3
> # CONFIG_VXFS_FS is not set
> CONFIG_MINIX_FS=m
> # CONFIG_OMFS_FS is not set
> # CONFIG_HPFS_FS is not set
> # CONFIG_QNX4FS_FS is not set
> # CONFIG_QNX6FS_FS is not set
> CONFIG_ROMFS_FS=m
> CONFIG_ROMFS_BACKED_BY_BLOCK=y
> # CONFIG_ROMFS_BACKED_BY_MTD is not set
> # CONFIG_ROMFS_BACKED_BY_BOTH is not set
> CONFIG_ROMFS_ON_BLOCK=y
> CONFIG_PSTORE=y
> CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
> CONFIG_PSTORE_DEFLATE_COMPRESS=y
> CONFIG_PSTORE_LZO_COMPRESS=m
> CONFIG_PSTORE_LZ4_COMPRESS=m
> CONFIG_PSTORE_LZ4HC_COMPRESS=m
> CONFIG_PSTORE_842_COMPRESS=y
> # CONFIG_PSTORE_ZSTD_COMPRESS is not set
> CONFIG_PSTORE_COMPRESS=y
> CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
> # CONFIG_PSTORE_LZO_COMPRESS_DEFAULT is not set
> # CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT is not set
> # CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT is not set
> # CONFIG_PSTORE_842_COMPRESS_DEFAULT is not set
> CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
> # CONFIG_PSTORE_CONSOLE is not set
> # CONFIG_PSTORE_PMSG is not set
> # CONFIG_PSTORE_FTRACE is not set
> CONFIG_PSTORE_RAM=m
> # CONFIG_PSTORE_BLK is not set
> CONFIG_SYSV_FS=m
> CONFIG_UFS_FS=m
> # CONFIG_UFS_FS_WRITE is not set
> # CONFIG_UFS_DEBUG is not set
> CONFIG_EROFS_FS=m
> # CONFIG_EROFS_FS_DEBUG is not set
> CONFIG_EROFS_FS_XATTR=y
> CONFIG_EROFS_FS_POSIX_ACL=y
> CONFIG_EROFS_FS_SECURITY=y
> CONFIG_EROFS_FS_ZIP=y
> CONFIG_EROFS_FS_ZIP_LZMA=y
> CONFIG_NETWORK_FILESYSTEMS=y
> CONFIG_NFS_FS=m
> # CONFIG_NFS_V2 is not set
> CONFIG_NFS_V3=m
> CONFIG_NFS_V3_ACL=y
> CONFIG_NFS_V4=m
> CONFIG_NFS_SWAP=y
> CONFIG_NFS_V4_1=y
> CONFIG_NFS_V4_2=y
> CONFIG_PNFS_FILE_LAYOUT=m
> CONFIG_PNFS_BLOCK=m
> CONFIG_PNFS_FLEXFILE_LAYOUT=m
> CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN="kernel.org"
> # CONFIG_NFS_V4_1_MIGRATION is not set
> CONFIG_NFS_V4_SECURITY_LABEL=y
> CONFIG_NFS_FSCACHE=y
> # CONFIG_NFS_USE_LEGACY_DNS is not set
> CONFIG_NFS_USE_KERNEL_DNS=y
> CONFIG_NFS_DEBUG=y
> CONFIG_NFS_DISABLE_UDP_SUPPORT=y
> # CONFIG_NFS_V4_2_READ_PLUS is not set
> CONFIG_NFSD=m
> CONFIG_NFSD_V2_ACL=y
> CONFIG_NFSD_V3_ACL=y
> CONFIG_NFSD_V4=y
> CONFIG_NFSD_PNFS=y
> CONFIG_NFSD_BLOCKLAYOUT=y
> CONFIG_NFSD_SCSILAYOUT=y
> CONFIG_NFSD_FLEXFILELAYOUT=y
> CONFIG_NFSD_V4_2_INTER_SSC=y
> CONFIG_NFSD_V4_SECURITY_LABEL=y
> CONFIG_GRACE_PERIOD=m
> CONFIG_LOCKD=m
> CONFIG_LOCKD_V4=y
> CONFIG_NFS_ACL_SUPPORT=m
> CONFIG_NFS_COMMON=y
> CONFIG_NFS_V4_2_SSC_HELPER=y
> CONFIG_SUNRPC=m
> CONFIG_SUNRPC_GSS=m
> CONFIG_SUNRPC_BACKCHANNEL=y
> CONFIG_SUNRPC_SWAP=y
> CONFIG_RPCSEC_GSS_KRB5=m
> CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES=y
> CONFIG_SUNRPC_DEBUG=y
> CONFIG_SUNRPC_XPRT_RDMA=m
> CONFIG_CEPH_FS=m
> CONFIG_CEPH_FSCACHE=y
> CONFIG_CEPH_FS_POSIX_ACL=y
> CONFIG_CEPH_FS_SECURITY_LABEL=y
> CONFIG_CIFS=m
> # CONFIG_CIFS_STATS2 is not set
> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
> CONFIG_CIFS_UPCALL=y
> CONFIG_CIFS_XATTR=y
> CONFIG_CIFS_POSIX=y
> CONFIG_CIFS_DEBUG=y
> # CONFIG_CIFS_DEBUG2 is not set
> # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> CONFIG_CIFS_DFS_UPCALL=y
> CONFIG_CIFS_SWN_UPCALL=y
> # CONFIG_CIFS_SMB_DIRECT is not set
> CONFIG_CIFS_FSCACHE=y
> # CONFIG_SMB_SERVER is not set
> CONFIG_SMBFS_COMMON=m
> CONFIG_CODA_FS=m
> CONFIG_AFS_FS=m
> CONFIG_AFS_DEBUG=y
> CONFIG_AFS_FSCACHE=y
> # CONFIG_AFS_DEBUG_CURSOR is not set
> CONFIG_9P_FS=m
> CONFIG_9P_FSCACHE=y
> CONFIG_9P_FS_POSIX_ACL=y
> CONFIG_9P_FS_SECURITY=y
> CONFIG_NLS=y
> CONFIG_NLS_DEFAULT="utf8"
> CONFIG_NLS_CODEPAGE_437=y
> CONFIG_NLS_CODEPAGE_737=m
> CONFIG_NLS_CODEPAGE_775=m
> CONFIG_NLS_CODEPAGE_850=m
> CONFIG_NLS_CODEPAGE_852=m
> CONFIG_NLS_CODEPAGE_855=m
> CONFIG_NLS_CODEPAGE_857=m
> CONFIG_NLS_CODEPAGE_860=m
> CONFIG_NLS_CODEPAGE_861=m
> CONFIG_NLS_CODEPAGE_862=m
> CONFIG_NLS_CODEPAGE_863=m
> CONFIG_NLS_CODEPAGE_864=m
> CONFIG_NLS_CODEPAGE_865=m
> CONFIG_NLS_CODEPAGE_866=m
> CONFIG_NLS_CODEPAGE_869=m
> CONFIG_NLS_CODEPAGE_936=m
> CONFIG_NLS_CODEPAGE_950=m
> CONFIG_NLS_CODEPAGE_932=m
> CONFIG_NLS_CODEPAGE_949=m
> CONFIG_NLS_CODEPAGE_874=m
> CONFIG_NLS_ISO8859_8=m
> CONFIG_NLS_CODEPAGE_1250=m
> CONFIG_NLS_CODEPAGE_1251=m
> CONFIG_NLS_ASCII=y
> CONFIG_NLS_ISO8859_1=m
> CONFIG_NLS_ISO8859_2=m
> CONFIG_NLS_ISO8859_3=m
> CONFIG_NLS_ISO8859_4=m
> CONFIG_NLS_ISO8859_5=m
> CONFIG_NLS_ISO8859_6=m
> CONFIG_NLS_ISO8859_7=m
> CONFIG_NLS_ISO8859_9=m
> CONFIG_NLS_ISO8859_13=m
> CONFIG_NLS_ISO8859_14=m
> CONFIG_NLS_ISO8859_15=m
> CONFIG_NLS_KOI8_R=m
> CONFIG_NLS_KOI8_U=m
> CONFIG_NLS_MAC_ROMAN=m
> CONFIG_NLS_MAC_CELTIC=m
> CONFIG_NLS_MAC_CENTEURO=m
> CONFIG_NLS_MAC_CROATIAN=m
> CONFIG_NLS_MAC_CYRILLIC=m
> CONFIG_NLS_MAC_GAELIC=m
> CONFIG_NLS_MAC_GREEK=m
> CONFIG_NLS_MAC_ICELAND=m
> CONFIG_NLS_MAC_INUIT=m
> CONFIG_NLS_MAC_ROMANIAN=m
> CONFIG_NLS_MAC_TURKISH=m
> CONFIG_NLS_UTF8=m
> CONFIG_DLM=m
> # CONFIG_DLM_DEPRECATED_API is not set
> CONFIG_DLM_DEBUG=y
> CONFIG_UNICODE=y
> # CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
> CONFIG_IO_WQ=y
> # end of File systems
>
> #
> # Security options
> #
> CONFIG_KEYS=y
> CONFIG_KEYS_REQUEST_CACHE=y
> CONFIG_PERSISTENT_KEYRINGS=y
> CONFIG_BIG_KEYS=y
> CONFIG_TRUSTED_KEYS=y
> CONFIG_TRUSTED_KEYS_TPM=y
> CONFIG_ENCRYPTED_KEYS=y
> # CONFIG_USER_DECRYPTED_DATA is not set
> CONFIG_KEY_DH_OPERATIONS=y
> CONFIG_KEY_NOTIFICATIONS=y
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=y
> CONFIG_SECURITYFS=y
> CONFIG_SECURITY_NETWORK=y
> CONFIG_SECURITY_INFINIBAND=y
> CONFIG_SECURITY_NETWORK_XFRM=y
> CONFIG_SECURITY_PATH=y
> CONFIG_LSM_MMAP_MIN_ADDR=65535
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
> CONFIG_HARDENED_USERCOPY=y
> CONFIG_FORTIFY_SOURCE=y
> # CONFIG_STATIC_USERMODEHELPER is not set
> CONFIG_SECURITY_SELINUX=y
> CONFIG_SECURITY_SELINUX_BOOTPARAM=y
> # CONFIG_SECURITY_SELINUX_DISABLE is not set
> CONFIG_SECURITY_SELINUX_DEVELOP=y
> CONFIG_SECURITY_SELINUX_AVC_STATS=y
> CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=0
> CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=9
> CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=256
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> # CONFIG_SECURITY_LOADPIN is not set
> CONFIG_SECURITY_YAMA=y
> # CONFIG_SECURITY_SAFESETID is not set
> CONFIG_SECURITY_LOCKDOWN_LSM=y
> CONFIG_SECURITY_LOCKDOWN_LSM_EARLY=y
> CONFIG_LOCK_DOWN_KERNEL_FORCE_NONE=y
> # CONFIG_LOCK_DOWN_KERNEL_FORCE_INTEGRITY is not set
> # CONFIG_LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY is not set
> CONFIG_SECURITY_LANDLOCK=y
> CONFIG_INTEGRITY=y
> CONFIG_INTEGRITY_SIGNATURE=y
> CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
> CONFIG_INTEGRITY_TRUSTED_KEYRING=y
> CONFIG_INTEGRITY_PLATFORM_KEYRING=y
> CONFIG_LOAD_PPC_KEYS=y
> CONFIG_INTEGRITY_AUDIT=y
> CONFIG_IMA=y
> CONFIG_IMA_KEXEC=y
> CONFIG_IMA_MEASURE_PCR_IDX=10
> CONFIG_IMA_LSM_RULES=y
> CONFIG_IMA_NG_TEMPLATE=y
> # CONFIG_IMA_SIG_TEMPLATE is not set
> CONFIG_IMA_DEFAULT_TEMPLATE="ima-ng"
> # CONFIG_IMA_DEFAULT_HASH_SHA1 is not set
> CONFIG_IMA_DEFAULT_HASH_SHA256=y
> # CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
> CONFIG_IMA_DEFAULT_HASH="sha256"
> CONFIG_IMA_WRITE_POLICY=y
> CONFIG_IMA_READ_POLICY=y
> CONFIG_IMA_APPRAISE=y
> CONFIG_IMA_ARCH_POLICY=y
> # CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
> CONFIG_IMA_APPRAISE_BOOTPARAM=y
> CONFIG_IMA_APPRAISE_MODSIG=y
> # CONFIG_IMA_TRUSTED_KEYRING is not set
> # CONFIG_IMA_KEYRINGS_PERMIT_SIGNED_BY_BUILTIN_OR_SECONDARY is not set
> CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=y
> CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=y
> CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=y
> # CONFIG_IMA_DISABLE_HTABLE is not set
> CONFIG_EVM=y
> CONFIG_EVM_ATTR_FSUUID=y
> # CONFIG_EVM_ADD_XATTRS is not set
> # CONFIG_EVM_LOAD_X509 is not set
> CONFIG_DEFAULT_SECURITY_SELINUX=y
> # CONFIG_DEFAULT_SECURITY_DAC is not set
> CONFIG_LSM="lockdown,yama,integrity,selinux,bpf,landlock"
>
> #
> # Kernel hardening options
> #
>
> #
> # Memory initialization
> #
> CONFIG_INIT_STACK_NONE=y
> # CONFIG_GCC_PLUGIN_STRUCTLEAK_USER is not set
> # CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF is not set
> # CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL is not set
> # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> # end of Memory initialization
>
> CONFIG_RANDSTRUCT_NONE=y
> # CONFIG_RANDSTRUCT_FULL is not set
> # CONFIG_RANDSTRUCT_PERFORMANCE is not set
> # end of Kernel hardening options
> # end of Security options
>
> CONFIG_XOR_BLOCKS=y
> CONFIG_ASYNC_CORE=m
> CONFIG_ASYNC_MEMCPY=m
> CONFIG_ASYNC_XOR=m
> CONFIG_ASYNC_PQ=m
> CONFIG_ASYNC_RAID6_RECOV=m
> CONFIG_CRYPTO=y
>
> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_FIPS=y
> CONFIG_CRYPTO_FIPS_NAME="Linux Kernel Cryptographic API"
> # CONFIG_CRYPTO_FIPS_CUSTOM_VERSION is not set
> CONFIG_CRYPTO_ALGAPI=y
> CONFIG_CRYPTO_ALGAPI2=y
> CONFIG_CRYPTO_AEAD=y
> CONFIG_CRYPTO_AEAD2=y
> CONFIG_CRYPTO_SKCIPHER=y
> CONFIG_CRYPTO_SKCIPHER2=y
> CONFIG_CRYPTO_HASH=y
> CONFIG_CRYPTO_HASH2=y
> CONFIG_CRYPTO_RNG=y
> CONFIG_CRYPTO_RNG2=y
> CONFIG_CRYPTO_RNG_DEFAULT=y
> CONFIG_CRYPTO_AKCIPHER2=y
> CONFIG_CRYPTO_AKCIPHER=y
> CONFIG_CRYPTO_KPP2=y
> CONFIG_CRYPTO_KPP=y
> CONFIG_CRYPTO_ACOMP2=y
> CONFIG_CRYPTO_MANAGER=y
> CONFIG_CRYPTO_MANAGER2=y
> CONFIG_CRYPTO_USER=m
> # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> # CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is not set
> CONFIG_CRYPTO_GF128MUL=y
> CONFIG_CRYPTO_NULL=y
> CONFIG_CRYPTO_NULL2=y
> CONFIG_CRYPTO_PCRYPT=m
> # CONFIG_CRYPTO_CRYPTD is not set
> CONFIG_CRYPTO_AUTHENC=y
> CONFIG_CRYPTO_TEST=m
> CONFIG_CRYPTO_ENGINE=m
> # end of Crypto core or helper
>
> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=y
> CONFIG_CRYPTO_DH=y
> CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
> CONFIG_CRYPTO_ECC=y
> CONFIG_CRYPTO_ECDH=y
> CONFIG_CRYPTO_ECDSA=y
> CONFIG_CRYPTO_ECRDSA=m
> # CONFIG_CRYPTO_SM2 is not set
> CONFIG_CRYPTO_CURVE25519=m
> # end of Public-key cryptography
>
> #
> # Block ciphers
> #
> CONFIG_CRYPTO_AES=y
> CONFIG_CRYPTO_AES_TI=m
> # CONFIG_CRYPTO_ARIA is not set
> CONFIG_CRYPTO_BLOWFISH=m
> CONFIG_CRYPTO_BLOWFISH_COMMON=m
> CONFIG_CRYPTO_CAMELLIA=m
> CONFIG_CRYPTO_CAST_COMMON=m
> CONFIG_CRYPTO_CAST5=m
> CONFIG_CRYPTO_CAST6=m
> CONFIG_CRYPTO_DES=m
> CONFIG_CRYPTO_FCRYPT=m
> CONFIG_CRYPTO_SERPENT=m
> # CONFIG_CRYPTO_SM4_GENERIC is not set
> CONFIG_CRYPTO_TWOFISH=m
> CONFIG_CRYPTO_TWOFISH_COMMON=m
> # end of Block ciphers
>
> #
> # Length-preserving ciphers and modes
> #
> CONFIG_CRYPTO_ADIANTUM=m
> CONFIG_CRYPTO_CHACHA20=m
> CONFIG_CRYPTO_CBC=y
> CONFIG_CRYPTO_CFB=y
> CONFIG_CRYPTO_CTR=y
> CONFIG_CRYPTO_CTS=y
> CONFIG_CRYPTO_ECB=y
> CONFIG_CRYPTO_HCTR2=m
> CONFIG_CRYPTO_KEYWRAP=m
> CONFIG_CRYPTO_LRW=m
> CONFIG_CRYPTO_OFB=y
> CONFIG_CRYPTO_PCBC=m
> CONFIG_CRYPTO_XCTR=m
> CONFIG_CRYPTO_XTS=y
> CONFIG_CRYPTO_NHPOLY1305=m
> # end of Length-preserving ciphers and modes
>
> #
> # AEAD (authenticated encryption with associated data) ciphers
> #
> CONFIG_CRYPTO_AEGIS128=m
> CONFIG_CRYPTO_CHACHA20POLY1305=m
> CONFIG_CRYPTO_CCM=y
> CONFIG_CRYPTO_GCM=y
> CONFIG_CRYPTO_SEQIV=y
> CONFIG_CRYPTO_ECHAINIV=m
> CONFIG_CRYPTO_ESSIV=m
> # end of AEAD (authenticated encryption with associated data) ciphers
>
> #
> # Hashes, digests, and MACs
> #
> CONFIG_CRYPTO_BLAKE2B=y
> CONFIG_CRYPTO_CMAC=y
> CONFIG_CRYPTO_GHASH=y
> CONFIG_CRYPTO_HMAC=y
> CONFIG_CRYPTO_MD4=m
> CONFIG_CRYPTO_MD5=y
> CONFIG_CRYPTO_MICHAEL_MIC=m
> CONFIG_CRYPTO_POLYVAL=m
> CONFIG_CRYPTO_POLY1305=m
> CONFIG_CRYPTO_RMD160=m
> CONFIG_CRYPTO_SHA1=y
> CONFIG_CRYPTO_SHA256=y
> CONFIG_CRYPTO_SHA512=y
> CONFIG_CRYPTO_SHA3=y
> # CONFIG_CRYPTO_SM3_GENERIC is not set
> CONFIG_CRYPTO_STREEBOG=m
> CONFIG_CRYPTO_VMAC=m
> CONFIG_CRYPTO_WP512=m
> CONFIG_CRYPTO_XCBC=m
> CONFIG_CRYPTO_XXHASH=y
> # end of Hashes, digests, and MACs
>
> #
> # CRCs (cyclic redundancy checks)
> #
> CONFIG_CRYPTO_CRC32C=y
> CONFIG_CRYPTO_CRC32=m
> CONFIG_CRYPTO_CRCT10DIF=y
> CONFIG_CRYPTO_CRC64_ROCKSOFT=y
> # end of CRCs (cyclic redundancy checks)
>
> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=y
> CONFIG_CRYPTO_LZO=y
> CONFIG_CRYPTO_842=y
> CONFIG_CRYPTO_LZ4=m
> CONFIG_CRYPTO_LZ4HC=m
> CONFIG_CRYPTO_ZSTD=m
> # end of Compression
>
> #
> # Random number generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=m
> CONFIG_CRYPTO_DRBG_MENU=y
> CONFIG_CRYPTO_DRBG_HMAC=y
> CONFIG_CRYPTO_DRBG_HASH=y
> CONFIG_CRYPTO_DRBG_CTR=y
> CONFIG_CRYPTO_DRBG=y
> CONFIG_CRYPTO_JITTERENTROPY=y
> CONFIG_CRYPTO_KDF800108_CTR=y
> # end of Random number generation
>
> #
> # Userspace interface
> #
> CONFIG_CRYPTO_USER_API=y
> CONFIG_CRYPTO_USER_API_HASH=y
> CONFIG_CRYPTO_USER_API_SKCIPHER=y
> CONFIG_CRYPTO_USER_API_RNG=y
> # CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
> CONFIG_CRYPTO_USER_API_AEAD=y
> # CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE is not set
> CONFIG_CRYPTO_STATS=y
> # end of Userspace interface
>
> CONFIG_CRYPTO_HASH_INFO=y
>
> #
> # Accelerated Cryptographic Algorithms for CPU (powerpc)
> #
> CONFIG_CRYPTO_CRC32C_VPMSUM=m
> CONFIG_CRYPTO_CRCT10DIF_VPMSUM=m
> # CONFIG_CRYPTO_VPMSUM_TESTER is not set
> # CONFIG_CRYPTO_MD5_PPC is not set
> # CONFIG_CRYPTO_SHA1_PPC is not set
> # end of Accelerated Cryptographic Algorithms for CPU (powerpc)
>
> CONFIG_CRYPTO_HW=y
> CONFIG_CRYPTO_DEV_NX=y
> CONFIG_CRYPTO_DEV_NX_COMPRESS=y
> CONFIG_CRYPTO_DEV_NX_COMPRESS_PSERIES=y
> CONFIG_CRYPTO_DEV_NX_COMPRESS_POWERNV=y
> CONFIG_CRYPTO_DEV_ATMEL_I2C=m
> CONFIG_CRYPTO_DEV_ATMEL_ECC=m
> CONFIG_CRYPTO_DEV_ATMEL_SHA204A=m
> CONFIG_CRYPTO_DEV_QAT=m
> CONFIG_CRYPTO_DEV_QAT_DH895xCC=m
> CONFIG_CRYPTO_DEV_QAT_C3XXX=m
> CONFIG_CRYPTO_DEV_QAT_C62X=m
> CONFIG_CRYPTO_DEV_QAT_4XXX=m
> CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=m
> CONFIG_CRYPTO_DEV_QAT_C3XXXVF=m
> CONFIG_CRYPTO_DEV_QAT_C62XVF=m
> # CONFIG_CRYPTO_DEV_NITROX_CNN55XX is not set
> CONFIG_CRYPTO_DEV_VMX=y
> CONFIG_CRYPTO_DEV_VMX_ENCRYPT=m
> CONFIG_CRYPTO_DEV_CHELSIO=m
> CONFIG_CRYPTO_DEV_VIRTIO=m
> # CONFIG_CRYPTO_DEV_SAFEXCEL is not set
> # CONFIG_CRYPTO_DEV_CCREE is not set
> # CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=y
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
> CONFIG_X509_CERTIFICATE_PARSER=y
> CONFIG_PKCS8_PRIVATE_KEY_PARSER=m
> CONFIG_PKCS7_MESSAGE_PARSER=y
> # CONFIG_PKCS7_TEST_KEY is not set
> CONFIG_SIGNED_PE_FILE_VERIFICATION=y
> # CONFIG_FIPS_SIGNATURE_SELFTEST is not set
>
> #
> # Certificates for signature checking
> #
> CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
> CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
> # CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
> CONFIG_SYSTEM_TRUSTED_KEYRING=y
> CONFIG_SYSTEM_TRUSTED_KEYS=""
> CONFIG_SYSTEM_EXTRA_CERTIFICATE=y
> CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=4096
> CONFIG_SECONDARY_TRUSTED_KEYRING=y
> CONFIG_SYSTEM_BLACKLIST_KEYRING=y
> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
> # CONFIG_SYSTEM_REVOCATION_LIST is not set
> CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE=y
> # end of Certificates for signature checking
>
> CONFIG_BINARY_PRINTF=y
>
> #
> # Library routines
> #
> CONFIG_RAID6_PQ=y
> # CONFIG_RAID6_PQ_BENCHMARK is not set
> CONFIG_LINEAR_RANGES=y
> CONFIG_PACKING=y
> CONFIG_BITREVERSE=y
> CONFIG_GENERIC_STRNCPY_FROM_USER=y
> CONFIG_GENERIC_STRNLEN_USER=y
> CONFIG_GENERIC_NET_UTILS=y
> CONFIG_CORDIC=m
> CONFIG_PRIME_NUMBERS=m
> CONFIG_RATIONAL=y
> CONFIG_GENERIC_PCI_IOMAP=y
> CONFIG_GENERIC_IOMAP=y
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
>
> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_UTILS=y
> CONFIG_CRYPTO_LIB_AES=y
> CONFIG_CRYPTO_LIB_ARC4=m
> CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
> CONFIG_CRYPTO_LIB_CHACHA=y
> CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=m
> CONFIG_CRYPTO_LIB_CURVE25519=m
> CONFIG_CRYPTO_LIB_DES=m
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
> CONFIG_CRYPTO_LIB_POLY1305=y
> CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
> CONFIG_CRYPTO_LIB_SHA1=y
> CONFIG_CRYPTO_LIB_SHA256=y
> # end of Crypto library routines
>
> CONFIG_CRC_CCITT=y
> CONFIG_CRC16=y
> CONFIG_CRC_T10DIF=y
> CONFIG_CRC64_ROCKSOFT=y
> CONFIG_CRC_ITU_T=m
> CONFIG_CRC32=y
> # CONFIG_CRC32_SELFTEST is not set
> CONFIG_CRC32_SLICEBY8=y
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC64=y
> CONFIG_CRC4=m
> CONFIG_CRC7=m
> CONFIG_LIBCRC32C=y
> CONFIG_CRC8=m
> CONFIG_XXHASH=y
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_842_COMPRESS=y
> CONFIG_842_DECOMPRESS=y
> CONFIG_ZLIB_INFLATE=y
> CONFIG_ZLIB_DEFLATE=y
> CONFIG_LZO_COMPRESS=y
> CONFIG_LZO_DECOMPRESS=y
> CONFIG_LZ4_COMPRESS=m
> CONFIG_LZ4HC_COMPRESS=m
> CONFIG_LZ4_DECOMPRESS=y
> CONFIG_ZSTD_COMMON=y
> CONFIG_ZSTD_COMPRESS=y
> CONFIG_ZSTD_DECOMPRESS=y
> CONFIG_XZ_DEC=y
> CONFIG_XZ_DEC_X86=y
> CONFIG_XZ_DEC_POWERPC=y
> CONFIG_XZ_DEC_IA64=y
> CONFIG_XZ_DEC_ARM=y
> CONFIG_XZ_DEC_ARMTHUMB=y
> CONFIG_XZ_DEC_SPARC=y
> CONFIG_XZ_DEC_MICROLZMA=y
> CONFIG_XZ_DEC_BCJ=y
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_DECOMPRESS_GZIP=y
> CONFIG_DECOMPRESS_BZIP2=y
> CONFIG_DECOMPRESS_LZMA=y
> CONFIG_DECOMPRESS_XZ=y
> CONFIG_DECOMPRESS_LZO=y
> CONFIG_DECOMPRESS_LZ4=y
> CONFIG_DECOMPRESS_ZSTD=y
> CONFIG_GENERIC_ALLOCATOR=y
> CONFIG_REED_SOLOMON=m
> CONFIG_REED_SOLOMON_ENC8=y
> CONFIG_REED_SOLOMON_DEC8=y
> CONFIG_TEXTSEARCH=y
> CONFIG_TEXTSEARCH_KMP=m
> CONFIG_TEXTSEARCH_BM=m
> CONFIG_TEXTSEARCH_FSM=m
> CONFIG_BTREE=y
> CONFIG_INTERVAL_TREE=y
> CONFIG_XARRAY_MULTI=y
> CONFIG_ASSOCIATIVE_ARRAY=y
> CONFIG_HAS_IOMEM=y
> CONFIG_HAS_IOPORT_MAP=y
> CONFIG_HAS_DMA=y
> CONFIG_DMA_OPS=y
> CONFIG_DMA_OPS_BYPASS=y
> CONFIG_ARCH_HAS_DMA_MAP_DIRECT=y
> CONFIG_NEED_SG_DMA_LENGTH=y
> CONFIG_NEED_DMA_MAP_STATE=y
> CONFIG_ARCH_DMA_ADDR_T_64BIT=y
> CONFIG_DMA_DECLARE_COHERENT=y
> CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
> CONFIG_SWIOTLB=y
> # CONFIG_DMA_RESTRICTED_POOL is not set
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_DMA_MAP_BENCHMARK is not set
> CONFIG_SGL_ALLOC=y
> CONFIG_IOMMU_HELPER=y
> CONFIG_CHECK_SIGNATURE=y
> # CONFIG_FORCE_NR_CPUS is not set
> CONFIG_CPU_RMAP=y
> CONFIG_DQL=y
> CONFIG_GLOB=y
> # CONFIG_GLOB_SELFTEST is not set
> CONFIG_NLATTR=y
> CONFIG_LRU_CACHE=m
> CONFIG_CLZ_TAB=y
> CONFIG_IRQ_POLL=y
> CONFIG_MPILIB=y
> CONFIG_SIGNATURE=y
> CONFIG_DIMLIB=y
> CONFIG_LIBFDT=y
> CONFIG_OID_REGISTRY=y
> CONFIG_HAVE_GENERIC_VDSO=y
> CONFIG_GENERIC_GETTIMEOFDAY=y
> CONFIG_GENERIC_VDSO_TIME_NS=y
> CONFIG_FONT_SUPPORT=y
> # CONFIG_FONTS is not set
> CONFIG_FONT_8x8=y
> CONFIG_FONT_8x16=y
> CONFIG_SG_POOL=y
> CONFIG_ARCH_HAS_PMEM_API=y
> CONFIG_MEMREGION=y
> CONFIG_ARCH_HAS_MEMREMAP_COMPAT_ALIGN=y
> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
> CONFIG_ARCH_HAS_COPY_MC=y
> CONFIG_ARCH_STACKWALK=y
> CONFIG_STACKDEPOT=y
> CONFIG_SBITMAP=y
> CONFIG_PARMAN=m
> CONFIG_OBJAGG=m
> # end of Library routines
>
> CONFIG_PLDMFW=y
> CONFIG_ASN1_ENCODER=y
> CONFIG_POLYNOMIAL=m
>
> #
> # Kernel hacking
> #
>
> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=y
> # CONFIG_PRINTK_CALLER is not set
> # CONFIG_STACKTRACE_BUILD_ID is not set
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
> CONFIG_DYNAMIC_DEBUG=y
> CONFIG_DYNAMIC_DEBUG_CORE=y
> CONFIG_SYMBOLIC_ERRNAME=y
> CONFIG_DEBUG_BUGVERBOSE=y
> # end of printk and dmesg options
>
> CONFIG_DEBUG_KERNEL=y
> # CONFIG_DEBUG_MISC is not set
>
> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=y
> CONFIG_AS_HAS_NON_CONST_LEB128=y
> # CONFIG_DEBUG_INFO_NONE is not set
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
> # CONFIG_DEBUG_INFO_DWARF4 is not set
> # CONFIG_DEBUG_INFO_DWARF5 is not set
> # CONFIG_DEBUG_INFO_REDUCED is not set
> # CONFIG_DEBUG_INFO_COMPRESSED is not set
> # CONFIG_DEBUG_INFO_SPLIT is not set
> CONFIG_DEBUG_INFO_BTF=y
> CONFIG_PAHOLE_HAS_SPLIT_BTF=y
> CONFIG_DEBUG_INFO_BTF_MODULES=y
> # CONFIG_MODULE_ALLOW_BTF_MISMATCH is not set
> # CONFIG_GDB_SCRIPTS is not set
> CONFIG_FRAME_WARN=2048
> CONFIG_STRIP_ASM_SYMS=y
> # CONFIG_READABLE_ASM is not set
> CONFIG_HEADERS_INSTALL=y
> # CONFIG_DEBUG_SECTION_MISMATCH is not set
> CONFIG_SECTION_MISMATCH_WARN_ONLY=y
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # end of Compile-time checks and compiler options
>
> #
> # Generic Kernel Debugging Instruments
> #
> CONFIG_MAGIC_SYSRQ=y
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x0
> CONFIG_MAGIC_SYSRQ_SERIAL=y
> CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
> CONFIG_DEBUG_FS=y
> CONFIG_DEBUG_FS_ALLOW_ALL=y
> # CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
> # CONFIG_DEBUG_FS_ALLOW_NONE is not set
> CONFIG_HAVE_ARCH_KGDB=y
> CONFIG_KGDB=y
> CONFIG_KGDB_HONOUR_BLOCKLIST=y
> CONFIG_KGDB_SERIAL_CONSOLE=y
> CONFIG_KGDB_TESTS=y
> # CONFIG_KGDB_TESTS_ON_BOOT is not set
> # CONFIG_KGDB_KDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
> # CONFIG_UBSAN is not set
> # end of Generic Kernel Debugging Instruments
>
> #
> # Networking Debugging
> #
> # CONFIG_NET_DEV_REFCNT_TRACKER is not set
> # CONFIG_NET_NS_REFCNT_TRACKER is not set
> # CONFIG_DEBUG_NET is not set
> # end of Networking Debugging
>
> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=y
> # CONFIG_DEBUG_PAGEALLOC is not set
> CONFIG_SLUB_DEBUG=y
> # CONFIG_SLUB_DEBUG_ON is not set
> CONFIG_PAGE_OWNER=y
> CONFIG_PAGE_POISONING=y
> # CONFIG_DEBUG_PAGE_REF is not set
> CONFIG_DEBUG_RODATA_TEST=y
> CONFIG_ARCH_HAS_DEBUG_WX=y
> CONFIG_DEBUG_WX=y
> CONFIG_GENERIC_PTDUMP=y
> CONFIG_PTDUMP_CORE=y
> # CONFIG_PTDUMP_DEBUGFS is not set
> # CONFIG_DEBUG_OBJECTS is not set
> # CONFIG_SHRINKER_DEBUG is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=y
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> CONFIG_SCHED_STACK_END_CHECK=y
> CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
> CONFIG_DEBUG_VM_IRQSOFF=y
> CONFIG_DEBUG_VM=y
> # CONFIG_DEBUG_VM_MAPLE_TREE is not set
> # CONFIG_DEBUG_VM_RB is not set
> # CONFIG_DEBUG_VM_PGFLAGS is not set
> # CONFIG_DEBUG_VM_PGTABLE is not set
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
> # CONFIG_DEBUG_VIRTUAL is not set
> CONFIG_DEBUG_MEMORY_INIT=y
> # CONFIG_DEBUG_PER_CPU_MAPS is not set
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
> CONFIG_DEBUG_STACKOVERFLOW=y
> CONFIG_HAVE_ARCH_KASAN=y
> CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
> CONFIG_ARCH_DISABLE_KASAN_INLINE=y
> CONFIG_CC_HAS_KASAN_GENERIC=y
> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
> # CONFIG_KASAN is not set
> CONFIG_HAVE_ARCH_KFENCE=y
> CONFIG_KFENCE=y
> CONFIG_KFENCE_SAMPLE_INTERVAL=100
> CONFIG_KFENCE_NUM_OBJECTS=255
> # CONFIG_KFENCE_DEFERRABLE is not set
> CONFIG_KFENCE_STRESS_TEST_FAULTS=0
> # CONFIG_KFENCE_KUNIT_TEST is not set
> # end of Memory Debugging
>
> CONFIG_DEBUG_SHIRQ=y
>
> #
> # Debug Oops, Lockups and Hangs
> #
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=0
> CONFIG_LOCKUP_DETECTOR=y
> CONFIG_SOFTLOCKUP_DETECTOR=y
> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> CONFIG_HARDLOCKUP_DETECTOR=y
> # CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
> # CONFIG_DETECT_HUNG_TASK is not set
> # CONFIG_WQ_WATCHDOG is not set
> # CONFIG_TEST_LOCKUP is not set
> # end of Debug Oops, Lockups and Hangs
>
> #
> # Scheduler Debugging
> #
> CONFIG_SCHED_DEBUG=y
> CONFIG_SCHED_INFO=y
> CONFIG_SCHEDSTATS=y
> # end of Scheduler Debugging
>
> # CONFIG_DEBUG_TIMEKEEPING is not set
>
> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=y
> # CONFIG_PROVE_LOCKING is not set
> # CONFIG_LOCK_STAT is not set
> # CONFIG_DEBUG_RT_MUTEXES is not set
> # CONFIG_DEBUG_SPINLOCK is not set
> # CONFIG_DEBUG_MUTEXES is not set
> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> # CONFIG_DEBUG_RWSEMS is not set
> # CONFIG_DEBUG_LOCK_ALLOC is not set
> # CONFIG_DEBUG_ATOMIC_SLEEP is not set
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> CONFIG_LOCK_TORTURE_TEST=m
> # CONFIG_WW_MUTEX_SELFTEST is not set
> # CONFIG_SCF_TORTURE_TEST is not set
> # CONFIG_CSD_LOCK_WAIT_DEBUG is not set
> # end of Lock Debugging (spinlocks, mutexes, etc...)
>
> # CONFIG_DEBUG_IRQFLAGS is not set
> CONFIG_STACKTRACE=y
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
>
> #
> # Debug kernel data structures
> #
> CONFIG_DEBUG_LIST=y
> # CONFIG_DEBUG_PLIST is not set
> # CONFIG_DEBUG_SG is not set
> # CONFIG_DEBUG_NOTIFIERS is not set
> CONFIG_BUG_ON_DATA_CORRUPTION=y
> # CONFIG_DEBUG_MAPLE_TREE is not set
> # end of Debug kernel data structures
>
> # CONFIG_DEBUG_CREDENTIALS is not set
>
> #
> # RCU Debugging
> #
> CONFIG_TORTURE_TEST=m
> # CONFIG_RCU_SCALE_TEST is not set
> CONFIG_RCU_TORTURE_TEST=m
> # CONFIG_RCU_REF_SCALE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=60
> CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
> # CONFIG_RCU_TRACE is not set
> # CONFIG_RCU_EQS_DEBUG is not set
> # end of RCU Debugging
>
> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
> CONFIG_LATENCYTOP=y
> CONFIG_NOP_TRACER=y
> CONFIG_HAVE_FUNCTION_TRACER=y
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
> CONFIG_HAVE_DYNAMIC_FTRACE=y
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
> CONFIG_HAVE_C_RECORDMCOUNT=y
> CONFIG_TRACER_MAX_TRACE=y
> CONFIG_TRACE_CLOCK=y
> CONFIG_RING_BUFFER=y
> CONFIG_EVENT_TRACING=y
> CONFIG_CONTEXT_SWITCH_TRACER=y
> CONFIG_TRACING=y
> CONFIG_GENERIC_TRACER=y
> CONFIG_TRACING_SUPPORT=y
> CONFIG_FTRACE=y
> CONFIG_BOOTTIME_TRACING=y
> CONFIG_FUNCTION_TRACER=y
> CONFIG_FUNCTION_GRAPH_TRACER=y
> CONFIG_DYNAMIC_FTRACE=y
> CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
> CONFIG_DYNAMIC_FTRACE_WITH_ARGS=y
> CONFIG_FUNCTION_PROFILER=y
> CONFIG_STACK_TRACER=y
> # CONFIG_IRQSOFF_TRACER is not set
> CONFIG_SCHED_TRACER=y
> CONFIG_HWLAT_TRACER=y
> CONFIG_OSNOISE_TRACER=y
> CONFIG_TIMERLAT_TRACER=y
> CONFIG_FTRACE_SYSCALLS=y
> CONFIG_TRACER_SNAPSHOT=y
> # CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
> CONFIG_BRANCH_PROFILE_NONE=y
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> CONFIG_BLK_DEV_IO_TRACE=y
> CONFIG_KPROBE_EVENTS=y
> # CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
> CONFIG_UPROBE_EVENTS=y
> CONFIG_BPF_EVENTS=y
> CONFIG_DYNAMIC_EVENTS=y
> CONFIG_PROBE_EVENTS=y
> # CONFIG_BPF_KPROBE_OVERRIDE is not set
> CONFIG_FTRACE_MCOUNT_RECORD=y
> CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT=y
> CONFIG_TRACING_MAP=y
> CONFIG_SYNTH_EVENTS=y
> CONFIG_HIST_TRIGGERS=y
> # CONFIG_TRACE_EVENT_INJECT is not set
> # CONFIG_TRACEPOINT_BENCHMARK is not set
> CONFIG_RING_BUFFER_BENCHMARK=m
> CONFIG_TRACE_EVAL_MAP_FILE=y
> # CONFIG_FTRACE_RECORD_RECURSION is not set
> # CONFIG_FTRACE_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
> # CONFIG_PREEMPTIRQ_DELAY_TEST is not set
> # CONFIG_SYNTH_EVENT_GEN_TEST is not set
> # CONFIG_KPROBE_EVENT_GEN_TEST is not set
> # CONFIG_HIST_TRIGGERS_DEBUG is not set
> CONFIG_DA_MON_EVENTS=y
> CONFIG_DA_MON_EVENTS_ID=y
> CONFIG_RV=y
> CONFIG_RV_MON_WWNR=y
> CONFIG_RV_REACTORS=y
> CONFIG_RV_REACT_PRINTK=y
> CONFIG_RV_REACT_PANIC=y
> # CONFIG_SAMPLES is not set
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
> CONFIG_STRICT_DEVMEM=y
> CONFIG_IO_STRICT_DEVMEM=y
>
> #
> # powerpc Debugging
> #
> CONFIG_PPC_DISABLE_WERROR=y
> CONFIG_PRINT_STACK_DEPTH=64
> # CONFIG_HCALL_STATS is not set
> CONFIG_PPC_EMULATED_STATS=y
> # CONFIG_CODE_PATCHING_SELFTEST is not set
> # CONFIG_JUMP_LABEL_FEATURE_CHECKS is not set
> # CONFIG_FTR_FIXUP_SELFTEST is not set
> CONFIG_MSI_BITMAP_SELFTEST=y
> # CONFIG_PPC_IRQ_SOFT_MASK_DEBUG is not set
> # CONFIG_PPC_RFI_SRR_DEBUG is not set
> CONFIG_XMON=y
> # CONFIG_XMON_DEFAULT is not set
> CONFIG_XMON_DISASSEMBLY=y
> CONFIG_XMON_DEFAULT_RO_MODE=y
> CONFIG_DEBUGGER=y
> CONFIG_BOOTX_TEXT=y
> # CONFIG_PPC_EARLY_DEBUG is not set
> # CONFIG_PPC_FAST_ENDIAN_SWITCH is not set
> # end of powerpc Debugging
>
> #
> # Kernel Testing and Coverage
> #
> CONFIG_KUNIT=m
> CONFIG_KUNIT_DEBUGFS=y
> CONFIG_KUNIT_TEST=m
> CONFIG_KUNIT_EXAMPLE_TEST=m
> CONFIG_KUNIT_ALL_TESTS=m
> CONFIG_KUNIT_DEFAULT_ENABLED=y
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> CONFIG_FUNCTION_ERROR_INJECTION=y
> # CONFIG_FAULT_INJECTION is not set
> CONFIG_ARCH_HAS_KCOV=y
> CONFIG_CC_HAS_SANCOV_TRACE_PC=y
> CONFIG_RUNTIME_TESTING_MENU=y
> # CONFIG_LKDTM is not set
> CONFIG_CPUMASK_KUNIT_TEST=m
> # CONFIG_TEST_LIST_SORT is not set
> # CONFIG_TEST_MIN_HEAP is not set
> CONFIG_TEST_SORT=m
> # CONFIG_TEST_DIV64 is not set
> CONFIG_KPROBES_SANITY_TEST=m
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_TEST_REF_TRACKER is not set
> # CONFIG_RBTREE_TEST is not set
> # CONFIG_REED_SOLOMON_TEST is not set
> # CONFIG_INTERVAL_TREE_TEST is not set
> # CONFIG_PERCPU_TEST is not set
> CONFIG_ATOMIC64_SELFTEST=y
> CONFIG_ASYNC_RAID6_TEST=m
> # CONFIG_TEST_HEXDUMP is not set
> # CONFIG_STRING_SELFTEST is not set
> # CONFIG_TEST_STRING_HELPERS is not set
> # CONFIG_TEST_STRSCPY is not set
> CONFIG_TEST_KSTRTOX=y
> # CONFIG_TEST_PRINTF is not set
> # CONFIG_TEST_SCANF is not set
> # CONFIG_TEST_BITMAP is not set
> # CONFIG_TEST_UUID is not set
> # CONFIG_TEST_XARRAY is not set
> # CONFIG_TEST_RHASHTABLE is not set
> # CONFIG_TEST_SIPHASH is not set
> # CONFIG_TEST_IDA is not set
> # CONFIG_TEST_PARMAN is not set
> # CONFIG_TEST_LKM is not set
> # CONFIG_TEST_BITOPS is not set
> CONFIG_TEST_VMALLOC=m
> # CONFIG_TEST_USER_COPY is not set
> CONFIG_TEST_BPF=m
> # CONFIG_TEST_BLACKHOLE_DEV is not set
> # CONFIG_FIND_BIT_BENCHMARK is not set
> # CONFIG_TEST_FIRMWARE is not set
> # CONFIG_TEST_SYSCTL is not set
> CONFIG_BITFIELD_KUNIT=m
> CONFIG_HASH_KUNIT_TEST=m
> CONFIG_RESOURCE_KUNIT_TEST=m
> CONFIG_SYSCTL_KUNIT_TEST=m
> CONFIG_LIST_KUNIT_TEST=m
> CONFIG_LINEAR_RANGES_TEST=m
> CONFIG_CMDLINE_KUNIT_TEST=m
> CONFIG_BITS_TEST=m
> CONFIG_SLUB_KUNIT_TEST=m
> CONFIG_RATIONAL_KUNIT_TEST=m
> CONFIG_MEMCPY_KUNIT_TEST=m
> CONFIG_IS_SIGNED_TYPE_KUNIT_TEST=m
> CONFIG_OVERFLOW_KUNIT_TEST=m
> CONFIG_STACKINIT_KUNIT_TEST=m
> CONFIG_FORTIFY_KUNIT_TEST=m
> # CONFIG_TEST_UDELAY is not set
> # CONFIG_TEST_STATIC_KEYS is not set
> # CONFIG_TEST_DYNAMIC_DEBUG is not set
> # CONFIG_TEST_KMOD is not set
> # CONFIG_TEST_MEMCAT_P is not set
> # CONFIG_TEST_LIVEPATCH is not set
> # CONFIG_TEST_OBJAGG is not set
> # CONFIG_TEST_MEMINIT is not set
> CONFIG_TEST_HMM=m
> # CONFIG_TEST_FREE_PAGES is not set
> CONFIG_ARCH_USE_MEMTEST=y
> # CONFIG_MEMTEST is not set
> # end of Kernel Testing and Coverage
>
> #
> # Rust hacking
> #
> # end of Rust hacking
> # end of Kernel hacking
