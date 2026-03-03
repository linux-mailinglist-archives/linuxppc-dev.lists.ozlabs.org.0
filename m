Return-Path: <linuxppc-dev+bounces-17582-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GI2O7j5pmk7bgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17582-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:09:44 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B7F1F216A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 16:09:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQK34745Bz3cB0;
	Wed, 04 Mar 2026 02:09:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772550576;
	cv=none; b=KKYFcEE4SvMBEtD3xZLiZN7lfK375RiNEuw/GEHtsivjbQLgeou4b2UE5oh8Uys/9m4/T1EC1y8u/bGDUuFvqzVkz9TuCDtqRMgNybfMDXCZ1vyyNU/zQ4+PV4778u6ghE2jCZiHO+tf/nIEoKah68mjLf22y0GguYqpNL/eH6dFgrSOJ8DQ0oEZI32dQnAcHFPNDkxYB+9YLXnNRQRKnQamlQRGw0HufwtqDXnWe3UZ6VPb6pcou5irNhhGULWDMdTU853K+ufUJrEW/hK+MRT0GvF1TWY+MK9VuIyoUzBufzdjtJ0ciFDbNd9+6VnLDoc0rJkWlc555y5566btsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772550576; c=relaxed/relaxed;
	bh=XWwx95+5DBBI+UgWgEV3WU0RFdh3z8Iqlj0xN/Cbdcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n63hiZUo/lBLYC0HTqZMleadByBUFBq9BX3CuSiD91jmRlTZ1gDvjGnb8SA4hHiwxfzTAOHlpDqK8eg4PCupRiaeMEQlXd9XfxW4exxs+yDNzmBdDjOkjFu9JoP/Y4WtVeRCUSlOq4W0qbKDHqGF4F16ya7a4PaE9nVXvNoB3g1grmwuyaE6OEeVcWykgsJD+VrGEVeh2EBF4sCayRIKMNdON1x7AyCjfcshTX32iU0Yy8Z/mkOV/2TjJMXm2u+poV6//iiJzKs8NVA6CB8ToWwh3WI5+6e2z9S0407Usm5FmdzcBaqJBih65aIhwE532siImASlxo5UpgRIw6c34Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQK336Kpnz3bsC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 02:09:35 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 556221595;
	Tue,  3 Mar 2026 07:08:58 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D45D3F73B;
	Tue,  3 Mar 2026 07:09:00 -0800 (PST)
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
	Jeremy Linton <jeremy.linton@arm.com>,
	David Laight <david.laight.linux@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v5 2/2] randomize_kstack: Unify random source across arches
Date: Tue,  3 Mar 2026 15:08:39 +0000
Message-ID: <20260303150840.3789438-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303150840.3789438-1-ryan.roberts@arm.com>
References: <20260303150840.3789438-1-ryan.roberts@arm.com>
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
X-Rspamd-Queue-Id: F0B7F1F216A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	TAGGED_FROM(0.00)[bounces-17582-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:arnd@arndb.de,m:mark.rutland@arm.com,m:Jason@zx2c4.com,m:ardb@kernel.org,m:jeremy.linton@arm.com,m:david.laight.linux@gmail.com,m:ryan.roberts@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[ryan.roberts@arm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,linutronix.de,redhat.com,alien8.de,linux.intel.com,arndb.de,zx2c4.com,gmail.com];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[ryan.roberts@arm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.966];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

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
    from user space [*].

  - The architecture code is simplified. All it has to do now is call
    add_random_kstack_offset() in the syscall path.

  - The strength of the randomness can be reasoned about independently
    of the architecture.

  - Arches previously using get_random_u16() now have much faster
    syscall paths, see below results.

[*] Additionally, this gets rid of some redundant work on s390 and x86.
Before this patch, those architectures called
choose_random_kstack_offset() under arch_exit_to_user_mode_prepare(),
which is also called for exception returns to userspace which were *not*
syscalls (e.g. regular interrupts). Getting rid of
choose_random_kstack_offset() avoids a small amount of redundant work
for the non-syscall cases.

In some configurations, add_random_kstack_offset() will now call
instrumentable code, so for a couple of arches, I have moved the call a
bit later to the first point where instrumentation is allowed. This
doesn't impact the efficacy of the mechanism.

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
| Benchmark       | Result Class |  per-cpu-prng |  per-cpu-prng |
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

Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/Kconfig                         |  5 ++-
 arch/arm64/kernel/syscall.c          | 11 ------
 arch/loongarch/kernel/syscall.c      | 11 ------
 arch/powerpc/kernel/syscall.c        | 16 ++-------
 arch/riscv/kernel/traps.c            | 12 -------
 arch/s390/include/asm/entry-common.h |  8 -----
 arch/s390/kernel/syscall.c           |  2 +-
 arch/x86/entry/syscall_32.c          |  4 +--
 arch/x86/entry/syscall_64.c          |  2 +-
 arch/x86/include/asm/entry-common.h  | 12 -------
 include/linux/randomize_kstack.h     | 52 +++++++++-------------------
 include/linux/sched.h                |  4 ---
 init/main.c                          |  8 +++++
 kernel/fork.c                        |  1 -
 14 files changed, 33 insertions(+), 115 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 102ddbd4298ef..f134527ace10e 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1519,9 +1519,8 @@ config HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
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
index c062badd1a566..358ddfbf1401a 100644
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
index 1249d82c1cd0a..85da7e050d977 100644
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
index be159ad4b77bd..b762677f87371 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -20,8 +20,6 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 
 	kuap_lock();
 
-	add_random_kstack_offset();
-
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
 
@@ -30,6 +28,8 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 	CT_WARN_ON(ct_state() == CT_STATE_KERNEL);
 	user_exit_irqoff();
 
+	add_random_kstack_offset();
+
 	BUG_ON(regs_is_unrecoverable(regs));
 	BUG_ON(!user_mode(regs));
 	BUG_ON(arch_irq_disabled_regs(regs));
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
index 5fb57fad188a9..461279a7bd864 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -344,18 +344,6 @@ void do_trap_ecall_u(struct pt_regs *regs)
 			syscall_handler(regs, syscall);
 		}
 
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
index 979af986a8feb..35450a4853239 100644
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
diff --git a/arch/s390/kernel/syscall.c b/arch/s390/kernel/syscall.c
index 795b6cca74c9b..1cf49af74a1df 100644
--- a/arch/s390/kernel/syscall.c
+++ b/arch/s390/kernel/syscall.c
@@ -96,8 +96,8 @@ void noinstr __do_syscall(struct pt_regs *regs, int per_trap)
 {
 	unsigned long nr;
 
-	add_random_kstack_offset();
 	enter_from_user_mode(regs);
+	add_random_kstack_offset();
 	regs->psw = get_lowcore()->svc_old_psw;
 	regs->int_code = get_lowcore()->svc_int_code;
 	update_timer_sys();
diff --git a/arch/x86/entry/syscall_32.c b/arch/x86/entry/syscall_32.c
index 8e829575e12f9..31b9492fe851d 100644
--- a/arch/x86/entry/syscall_32.c
+++ b/arch/x86/entry/syscall_32.c
@@ -247,7 +247,6 @@ __visible noinstr void do_int80_syscall_32(struct pt_regs *regs)
 {
 	int nr = syscall_32_enter(regs);
 
-	add_random_kstack_offset();
 	/*
 	 * Subtlety here: if ptrace pokes something larger than 2^31-1 into
 	 * orig_ax, the int return value truncates it. This matches
@@ -256,6 +255,7 @@ __visible noinstr void do_int80_syscall_32(struct pt_regs *regs)
 	nr = syscall_enter_from_user_mode(regs, nr);
 	instrumentation_begin();
 
+	add_random_kstack_offset();
 	do_syscall_32_irqs_on(regs, nr);
 
 	instrumentation_end();
@@ -268,7 +268,6 @@ static noinstr bool __do_fast_syscall_32(struct pt_regs *regs)
 	int nr = syscall_32_enter(regs);
 	int res;
 
-	add_random_kstack_offset();
 	/*
 	 * This cannot use syscall_enter_from_user_mode() as it has to
 	 * fetch EBP before invoking any of the syscall entry work
@@ -277,6 +276,7 @@ static noinstr bool __do_fast_syscall_32(struct pt_regs *regs)
 	enter_from_user_mode(regs);
 
 	instrumentation_begin();
+	add_random_kstack_offset();
 	local_irq_enable();
 	/* Fetch EBP from where the vDSO stashed it. */
 	if (IS_ENABLED(CONFIG_X86_64)) {
diff --git a/arch/x86/entry/syscall_64.c b/arch/x86/entry/syscall_64.c
index b6e68ea98b839..71f032504e731 100644
--- a/arch/x86/entry/syscall_64.c
+++ b/arch/x86/entry/syscall_64.c
@@ -86,10 +86,10 @@ static __always_inline bool do_syscall_x32(struct pt_regs *regs, int nr)
 /* Returns true to return using SYSRET, or false to use IRET */
 __visible noinstr bool do_syscall_64(struct pt_regs *regs, int nr)
 {
-	add_random_kstack_offset();
 	nr = syscall_enter_from_user_mode(regs, nr);
 
 	instrumentation_begin();
+	add_random_kstack_offset();
 
 	if (!do_syscall_x64(regs, nr) && !do_syscall_x32(regs, nr) && nr != -1) {
 		/* Invalid system call, but still a system call. */
diff --git a/arch/x86/include/asm/entry-common.h b/arch/x86/include/asm/entry-common.h
index ce3eb6d5fdf9f..7535131c711bb 100644
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
index 5d3916ca747cc..024fc20e77622 100644
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
index 8358e430dd7fd..a7b4a980eb2f0 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1592,10 +1592,6 @@ struct task_struct {
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
index 0a1d8529212e9..c9638a6946dca 100644
--- a/init/main.c
+++ b/init/main.c
@@ -833,6 +833,14 @@ static inline void initcall_debug_enable(void)
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
index 5715adeb6adfe..1f738c28ca07b 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2234,7 +2234,6 @@ __latent_entropy struct task_struct *copy_process(
 	if (retval)
 		goto bad_fork_cleanup_io;
 
-	random_kstack_task_init(p);
 	stackleak_task_init(p);
 
 	if (pid != &init_struct_pid) {
-- 
2.43.0


