Return-Path: <linuxppc-dev+bounces-15159-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A1ECEEA75
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 14:13:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djPJ30Lycz2yP8;
	Sat, 03 Jan 2026 00:12:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767359570;
	cv=none; b=Zq+67fT/bYObEM/8gPNiVVXlm6CrJBHxrRFIaPd+0/yQk2g0TGOpH67VzPfdSFBV4jvfItqdmuDPJs4YycSWyLcjeFuvBpiuQLHQtXnB3YOYlLx7637tvyqtsLPwyJAVZXOzX2xi988ZAcrbn+3PYxDEX1WYASPmXa42HARvOK+OoUTLnBBmj9qULpswqIHCE19NVUV8lgoa5w9FV348UVZxpwyOTo8klYU3mVikj76Wzrs+PfSY44CoKUiVgdEoYSo2Oxr7xJ2Qg+/r2cfEadX70yZATbNKT1/AAukdEZZEQQT2/J9+w4Ew+dt2KPA+aHw6U1PqQnz+kMGUE9LabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767359570; c=relaxed/relaxed;
	bh=tuxaivvCONesnENCRmCGjaz0dGt8ZUZZt7J4O+ThkXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m962Ra7t/o544hJoI9BLd4m6Hkp1L7TmgnIxh+waEWIN7EMSJPW3y31LXTPgIt+DICkI8csMOpqvdD3MRb1YrbPliV8Vm24ITu9Y6rSM7Ogngh8YmOW0cu/j2FA5zefzKWoTueqzAi+KuGINbwgWWwW3WDhJjM6LbAbFBd6IU6sajaDCaSSDPqRUnOr0nhKBXvJ0NFr4Shpg6ThRV2vOXcJ1dPMKaUf7nzJYyDCsKuE6ESmVdXJ0A4pl2W/gnSliXf9uRCJDvvpp2wZk9gF4KeOvBjEqQRJTOP2YQNRH9g26kt078DwuOMUiY+0PMri4cAmPrgalb3wlcYORGZnGWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djPJ21jsLz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jan 2026 00:12:50 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E6901595;
	Fri,  2 Jan 2026 05:12:12 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FDE33F5A1;
	Fri,  2 Jan 2026 05:12:15 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Mark Rutland <mark.rutland@arm.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v3 3/3] randomize_kstack: Unify random source across arches
Date: Fri,  2 Jan 2026 13:11:54 +0000
Message-ID: <20260102131156.3265118-4-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102131156.3265118-1-ryan.roberts@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Previously different architectures were using random sources of
differing strength and cost to decide the random kstack offset. A number
of architectures (loongarch, powerpc, s390, x86) were using their
timestamp counter, at whatever the frequency happened to be. Other
arches (arm64, riscv) were using entropy from the crng via
get_random_u16().

There have been concerns that in some cases the timestamp counters may
be too weak, because they can be easily guessed or influenced by user
space. And get_random_u16() has been shown to be too costly for the
level of protection kstack offset randomization provides.

So let's use a common, architecture-agnostic source of entropy; a
per-cpu prng, seeded at boot-time from the crng. This has a few
benefits:

  - We can remove choose_random_kstack_offset(); That was only there to
    try to make the timestamp counter value a bit harder to influence
    from user space.

  - The architecture code is simplified. All it has to do now is call
    add_random_kstack_offset() in the syscall path.

  - The strength of the randomness can be reasoned about independently
    of the architecture.

  - Arches previously using get_random_u16() now have much faster
    syscall paths, see below results.

There have been some claims that a prng may be less strong than the
timestamp counter if not regularly reseeded. But the prng has a period
of about 2^113. So as long as the prng state remains secret, it should
not be possible to guess. If the prng state can be accessed, we have
bigger problems.

Additionally, we are only consuming 6 bits to randomize the stack, so
there are only 64 possible random offsets. I assert that it would be
trivial for an attacker to brute force by repeating their attack and
waiting for the random stack offset to be the desired one. The prng
approach seems entirely proportional to this level of protection.

Performance data are provided below. The baseline is v6.18 with rndstack
on for each respective arch. (I)/(R) indicate statistically significant
improvement/regression. arm64 platform is AWS Graviton3 (m7g.metal).
x86_64 platform is AWS Sapphire Rapids (m7i.24xlarge):

+-----------------+--------------+---------------+---------------+
| Benchmark       | Result Class | per-task-prng | per-task-prng |
|                 |              | arm64 (metal) |   x86_64 (VM) |
+=================+==============+===============+===============+
| syscall/getpid  | mean (ns)    |    (I) -9.50% |   (I) -17.65% |
|                 | p99 (ns)     |   (I) -59.24% |   (I) -24.41% |
|                 | p99.9 (ns)   |   (I) -59.52% |   (I) -28.52% |
+-----------------+--------------+---------------+---------------+
| syscall/getppid | mean (ns)    |    (I) -9.52% |   (I) -19.24% |
|                 | p99 (ns)     |   (I) -59.25% |   (I) -25.03% |
|                 | p99.9 (ns)   |   (I) -59.50% |   (I) -28.17% |
+-----------------+--------------+---------------+---------------+
| syscall/invalid | mean (ns)    |   (I) -10.31% |   (I) -18.56% |
|                 | p99 (ns)     |   (I) -60.79% |   (I) -20.06% |
|                 | p99.9 (ns)   |   (I) -61.04% |   (I) -25.04% |
+-----------------+--------------+---------------+---------------+

I tested an earlier version of this change on x86 bare metal and it
showed a smaller but still significant improvement. The bare metal
system wasn't available this time around so testing was done in a VM
instance. I'm guessing the cost of rdtsc is higher for VMs.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/Kconfig                         |  5 ++-
 arch/arm64/kernel/syscall.c          | 11 ------
 arch/loongarch/kernel/syscall.c      | 11 ------
 arch/powerpc/kernel/syscall.c        | 12 -------
 arch/riscv/kernel/traps.c            | 12 -------
 arch/s390/include/asm/entry-common.h |  8 -----
 arch/x86/include/asm/entry-common.h  | 12 -------
 include/linux/randomize_kstack.h     | 52 +++++++++-------------------
 include/linux/sched.h                |  4 ---
 init/main.c                          |  8 +++++
 kernel/fork.c                        |  1 -
 11 files changed, 27 insertions(+), 109 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 31220f512b16..8591fe7b4ac1 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1516,9 +1516,8 @@ config HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
 	def_bool n
 	help
 	  An arch should select this symbol if it can support kernel stack
-	  offset randomization with calls to add_random_kstack_offset()
-	  during syscall entry and choose_random_kstack_offset() during
-	  syscall exit. Careful removal of -fstack-protector-strong and
+	  offset randomization with a call to add_random_kstack_offset()
+	  during syscall entry. Careful removal of -fstack-protector-strong and
 	  -fstack-protector should also be applied to the entry code and
 	  closely examined, as the artificial stack bump looks like an array
 	  to the compiler, so it will attempt to add canary checks regardless
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index c062badd1a56..358ddfbf1401 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -52,17 +52,6 @@ static void invoke_syscall(struct pt_regs *regs, unsigned int scno,
 	}
 
 	syscall_set_return_value(current, regs, 0, ret);
-
-	/*
-	 * This value will get limited by KSTACK_OFFSET_MAX(), which is 10
-	 * bits. The actual entropy will be further reduced by the compiler
-	 * when applying stack alignment constraints: the AAPCS mandates a
-	 * 16-byte aligned SP at function boundaries, which will remove the
-	 * 4 low bits from any entropy chosen here.
-	 *
-	 * The resulting 6 bits of entropy is seen in SP[9:4].
-	 */
-	choose_random_kstack_offset(get_random_u16());
 }
 
 static inline bool has_syscall_work(unsigned long flags)
diff --git a/arch/loongarch/kernel/syscall.c b/arch/loongarch/kernel/syscall.c
index 1249d82c1cd0..85da7e050d97 100644
--- a/arch/loongarch/kernel/syscall.c
+++ b/arch/loongarch/kernel/syscall.c
@@ -79,16 +79,5 @@ void noinstr __no_stack_protector do_syscall(struct pt_regs *regs)
 					   regs->regs[7], regs->regs[8], regs->regs[9]);
 	}
 
-	/*
-	 * This value will get limited by KSTACK_OFFSET_MAX(), which is 10
-	 * bits. The actual entropy will be further reduced by the compiler
-	 * when applying stack alignment constraints: 16-bytes (i.e. 4-bits)
-	 * aligned, which will remove the 4 low bits from any entropy chosen
-	 * here.
-	 *
-	 * The resulting 6 bits of entropy is seen in SP[9:4].
-	 */
-	choose_random_kstack_offset(get_cycles());
-
 	syscall_exit_to_user_mode(regs);
 }
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index be159ad4b77b..b3d8b0f9823b 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -173,17 +173,5 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 	}
 #endif
 
-	/*
-	 * Ultimately, this value will get limited by KSTACK_OFFSET_MAX(),
-	 * so the maximum stack offset is 1k bytes (10 bits).
-	 *
-	 * The actual entropy will be further reduced by the compiler when
-	 * applying stack alignment constraints: the powerpc architecture
-	 * may have two kinds of stack alignment (16-bytes and 8-bytes).
-	 *
-	 * So the resulting 6 or 7 bits of entropy is seen in SP[9:4] or SP[9:3].
-	 */
-	choose_random_kstack_offset(mftb());
-
 	return ret;
 }
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 80230de167de..79b285bdfd1a 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -342,18 +342,6 @@ void do_trap_ecall_u(struct pt_regs *regs)
 		if (syscall >= 0 && syscall < NR_syscalls)
 			syscall_handler(regs, syscall);
 
-		/*
-		 * Ultimately, this value will get limited by KSTACK_OFFSET_MAX(),
-		 * so the maximum stack offset is 1k bytes (10 bits).
-		 *
-		 * The actual entropy will be further reduced by the compiler when
-		 * applying stack alignment constraints: 16-byte (i.e. 4-bit) aligned
-		 * for RV32I or RV64I.
-		 *
-		 * The resulting 6 bits of entropy is seen in SP[9:4].
-		 */
-		choose_random_kstack_offset(get_random_u16());
-
 		syscall_exit_to_user_mode(regs);
 	} else {
 		irqentry_state_t state = irqentry_nmi_enter(regs);
diff --git a/arch/s390/include/asm/entry-common.h b/arch/s390/include/asm/entry-common.h
index 979af986a8fe..35450a485323 100644
--- a/arch/s390/include/asm/entry-common.h
+++ b/arch/s390/include/asm/entry-common.h
@@ -51,14 +51,6 @@ static __always_inline void arch_exit_to_user_mode(void)
 
 #define arch_exit_to_user_mode arch_exit_to_user_mode
 
-static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
-						  unsigned long ti_work)
-{
-	choose_random_kstack_offset(get_tod_clock_fast());
-}
-
-#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
-
 static __always_inline bool arch_in_rcu_eqs(void)
 {
 	if (IS_ENABLED(CONFIG_KVM))
diff --git a/arch/x86/include/asm/entry-common.h b/arch/x86/include/asm/entry-common.h
index ce3eb6d5fdf9..7535131c711b 100644
--- a/arch/x86/include/asm/entry-common.h
+++ b/arch/x86/include/asm/entry-common.h
@@ -82,18 +82,6 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
 	current_thread_info()->status &= ~(TS_COMPAT | TS_I386_REGS_POKED);
 #endif
 
-	/*
-	 * This value will get limited by KSTACK_OFFSET_MAX(), which is 10
-	 * bits. The actual entropy will be further reduced by the compiler
-	 * when applying stack alignment constraints (see cc_stack_align4/8 in
-	 * arch/x86/Makefile), which will remove the 3 (x86_64) or 2 (ia32)
-	 * low bits from any entropy chosen here.
-	 *
-	 * Therefore, final stack offset entropy will be 7 (x86_64) or
-	 * 8 (ia32) bits.
-	 */
-	choose_random_kstack_offset(rdtsc());
-
 	/* Avoid unnecessary reads of 'x86_ibpb_exit_to_user' */
 	if (cpu_feature_enabled(X86_FEATURE_IBPB_EXIT_TO_USER) &&
 	    this_cpu_read(x86_ibpb_exit_to_user)) {
diff --git a/include/linux/randomize_kstack.h b/include/linux/randomize_kstack.h
index 5d3916ca747c..024fc20e7762 100644
--- a/include/linux/randomize_kstack.h
+++ b/include/linux/randomize_kstack.h
@@ -6,6 +6,7 @@
 #include <linux/kernel.h>
 #include <linux/jump_label.h>
 #include <linux/percpu-defs.h>
+#include <linux/prandom.h>
 
 DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
 			 randomize_kstack_offset);
@@ -45,9 +46,22 @@ DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
 #define KSTACK_OFFSET_MAX(x)	((x) & 0b1111111100)
 #endif
 
+DECLARE_PER_CPU(struct rnd_state, kstack_rnd_state);
+
+static __always_inline u32 get_kstack_offset(void)
+{
+	struct rnd_state *state;
+	u32 rnd;
+
+	state = &get_cpu_var(kstack_rnd_state);
+	rnd = prandom_u32_state(state);
+	put_cpu_var(kstack_rnd_state);
+
+	return rnd;
+}
+
 /**
- * add_random_kstack_offset - Increase stack utilization by previously
- *			      chosen random offset
+ * add_random_kstack_offset - Increase stack utilization by a random offset.
  *
  * This should be used in the syscall entry path after user registers have been
  * stored to the stack. Preemption may be enabled. For testing the resulting
@@ -56,47 +70,15 @@ DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
 #define add_random_kstack_offset() do {					\
 	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,	\
 				&randomize_kstack_offset)) {		\
-		u32 offset = current->kstack_offset;			\
+		u32 offset = get_kstack_offset();			\
 		u8 *ptr = __kstack_alloca(KSTACK_OFFSET_MAX(offset));	\
 		/* Keep allocation even after "ptr" loses scope. */	\
 		asm volatile("" :: "r"(ptr) : "memory");		\
 	}								\
 } while (0)
 
-/**
- * choose_random_kstack_offset - Choose the random offset for the next
- *				 add_random_kstack_offset()
- *
- * This should only be used during syscall exit. Preemption may be enabled. This
- * position in the syscall flow is done to frustrate attacks from userspace
- * attempting to learn the next offset:
- * - Maximize the timing uncertainty visible from userspace: if the
- *   offset is chosen at syscall entry, userspace has much more control
- *   over the timing between choosing offsets. "How long will we be in
- *   kernel mode?" tends to be more difficult to predict than "how long
- *   will we be in user mode?"
- * - Reduce the lifetime of the new offset sitting in memory during
- *   kernel mode execution. Exposure of "thread-local" memory content
- *   (e.g. current, percpu, etc) tends to be easier than arbitrary
- *   location memory exposure.
- */
-#define choose_random_kstack_offset(rand) do {				\
-	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,	\
-				&randomize_kstack_offset)) {		\
-		u32 offset = current->kstack_offset;			\
-		offset = ror32(offset, 5) ^ (rand);			\
-		current->kstack_offset = offset;			\
-	}								\
-} while (0)
-
-static inline void random_kstack_task_init(struct task_struct *tsk)
-{
-	tsk->kstack_offset = 0;
-}
 #else /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
 #define add_random_kstack_offset()		do { } while (0)
-#define choose_random_kstack_offset(rand)	do { } while (0)
-#define random_kstack_task_init(tsk)		do { } while (0)
 #endif /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
 
 #endif
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 9e0080ed1484..d395f2810fac 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1591,10 +1591,6 @@ struct task_struct {
 	unsigned long			prev_lowest_stack;
 #endif
 
-#ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
-	u32				kstack_offset;
-#endif
-
 #ifdef CONFIG_X86_MCE
 	void __user			*mce_vaddr;
 	__u64				mce_kflags;
diff --git a/init/main.c b/init/main.c
index 27fcbbde933e..8626e048095a 100644
--- a/init/main.c
+++ b/init/main.c
@@ -830,6 +830,14 @@ static inline void initcall_debug_enable(void)
 #ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
 DEFINE_STATIC_KEY_MAYBE_RO(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
 			   randomize_kstack_offset);
+DEFINE_PER_CPU(struct rnd_state, kstack_rnd_state);
+
+static int __init random_kstack_init(void)
+{
+	prandom_seed_full_state(&kstack_rnd_state);
+	return 0;
+}
+late_initcall(random_kstack_init);
 
 static int __init early_randomize_kstack_offset(char *buf)
 {
diff --git a/kernel/fork.c b/kernel/fork.c
index b061e1edbc43..68d9766288fd 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2232,7 +2232,6 @@ __latent_entropy struct task_struct *copy_process(
 	if (retval)
 		goto bad_fork_cleanup_io;
 
-	random_kstack_task_init(p);
 	stackleak_task_init(p);
 
 	if (pid != &init_struct_pid) {
-- 
2.43.0


