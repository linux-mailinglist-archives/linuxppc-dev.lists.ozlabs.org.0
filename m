Return-Path: <linuxppc-dev+bounces-11310-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C197B35946
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 11:44:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB2nQ3pd3z3dRT;
	Tue, 26 Aug 2025 19:44:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756201482;
	cv=none; b=V+/DLikPsBZeLab1IoV8IGdM3tYf0wmPBg1zD3gqjkJq0/Rcbr5TCena9lD8b+yzP8z0Ese15rLF01fCD4luSfx+InsxvZ0pGluGbBg35ZW2JRkBosu7pCGFZooxDuMHVmgPVZqb1dJwo25RGkni2iw/PKbV1kYcn9dMT8zsZxFLyvWPEqEwm4akF/lcZAJExNOagaINCnuJnEACv93RTxYXnnGvJ+3KwoHJmZDxYI268yu1I3CB8/34TUq7CA/nBS9IA/aPZaLCl/m+ZYcMkN0yDmLRGUoEqBuidhhaNFrEUmGyel1qHO4lkcQQQFiOp8pQHGS2GjhbJ7gN+/0F6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756201482; c=relaxed/relaxed;
	bh=440g2MCDS70C5GUzL38qGyO0LLNuUeiYROjtfaXpBNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYZQnmzES+l9eU9A06wyZYnL2UwrdOmbWG/LdhoNZ7Vsk/o5NuNk76hCMKhGmZ9GRHsfuNO3Tk0AqKSDjdFrsaXFM/lnwy73swBHOlhjOpiQ7ge7gZNyPvezw8vbx09iXw1pWeDC6paJbj0dy8OBMeRc03zwDYEi5ner7+BXtTFfxr2H2whfRK3fvbaT5OwbRzHh6rHL8guGyW+94I8x15olqaQbEBGF1KjPwFdkf0M9cA7dtFM+p3FsA5YymogQgihqr0zN4+HIRJvvYJeRk8B9cZYnSWbotk+n11CNBl6WMFvE4ZkeSFDZ81xPrwDb5ClLOM2f+hO86u4kaBfccg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=FPBwE9KU; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=FPBwE9KU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cB2nL6DYQz3dJn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 19:44:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=440g2MCDS70C5GUzL38qGyO0LLNuUeiYROjtfaXpBNc=; b=FPBwE9KUGGI/Sp3bL/acaKowb0
	7dBUnevCp9OWqlkv9crqDWUTNOIbCLOMN/T9tqAwnwMYrPzXEj9yyGyz0ow3rppgSuXO0n3rnCTnZ
	hbdOaDwnl3oqQAHNpd9Fn5SzxpJTHrRWqeTKLgDJXFpR2IZlYzkYD/fCqz+NN4+of5+3yX0uYkfPg
	PaOw2Ezaq/9hhJkSFkDCnczBva1CpLxuF4KoCP0ma/IapXbieiRt/XE7TIvctQiglRagLttO70nvJ
	f9kPrSg1stJ8+Am80MEMoKSYX86s7pTU3aesVdudUWaaV2/LbuqVBto3mY7tNQn/WfcX8WbgI1wV6
	60QvIjyw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqDf-0000000GSI9-19tL;
	Tue, 26 Aug 2025 09:44:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 871BE300323; Tue, 26 Aug 2025 11:43:58 +0200 (CEST)
Date: Tue, 26 Aug 2025 11:43:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	thomas.weissschuh@linutronix.de, Li Chen <chenl311@chinatelecom.cn>,
	Bibo Mao <maobibo@loongson.cn>, Mete Durlu <meted@linux.ibm.com>,
	Tobias Huschle <huschle@linux.ibm.com>,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
	Guo Weikang <guoweikang.kernel@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Brian Gerst <brgerst@gmail.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andrea Righi <arighi@nvidia.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>
Subject: Re: [PATCH v7 4/8] powerpc/smp: Introduce CONFIG_SCHED_MC to guard
 MC scheduling bits
Message-ID: <20250826094358.GG3245006@noisy.programming.kicks-ass.net>
References: <20250826041319.1284-1-kprateek.nayak@amd.com>
 <20250826041319.1284-5-kprateek.nayak@amd.com>
 <609a980b-cbe3-442b-a492-91722870b156@csgroup.eu>
 <20250826080706.GC3245006@noisy.programming.kicks-ass.net>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250826080706.GC3245006@noisy.programming.kicks-ass.net>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 26, 2025 at 10:07:06AM +0200, Peter Zijlstra wrote:
> On Tue, Aug 26, 2025 at 06:49:29AM +0200, Christophe Leroy wrote:
> > 
> > 
> > Le 26/08/2025 à 06:13, K Prateek Nayak a écrit :
> > > PowerPC enables the MC scheduling domain by default on systems with
> > > coregroup support without having a SCHED_MC config in Kconfig.
> > > 
> > > The scheduler uses CONFIG_SCHED_MC to introduce the MC domain in the
> > > default topology (core) and to optimize the default CPU selection
> > > routine (sched-ext).
> > > 
> > > Introduce CONFIG_SCHED_MC for powerpc and note that it should be
> > > preferably enabled given the current default behavior. This also ensures
> > > PowerPC is tested during future developments that come to depend on
> > > CONFIG_SCHED_MC.
> > > 
> > > Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> > > ---
> > >   arch/powerpc/Kconfig           | 9 +++++++++
> > >   arch/powerpc/include/asm/smp.h | 2 ++
> > >   arch/powerpc/kernel/smp.c      | 4 ++++
> > >   3 files changed, 15 insertions(+)
> > > 
> > > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > > index 93402a1d9c9f..e954ab3f635f 100644
> > > --- a/arch/powerpc/Kconfig
> > > +++ b/arch/powerpc/Kconfig
> > > @@ -971,6 +971,15 @@ config SCHED_SMT
> > >   	  when dealing with POWER5 cpus at a cost of slightly increased
> > >   	  overhead in some places. If unsure say N here.
> > > +config SCHED_MC
> > > +	bool "Multi-Core Cache (MC) scheduler support"
> > > +	depends on PPC64 && SMP
> > > +	default y
> > > +	help
> > > +	  MC scheduler support improves the CPU scheduler's decision making
> > > +	  when dealing with POWER systems that contain multiple Last Level
> > > +	  Cache instances on the same socket. If unsure say Y here.
> > > +
> > 
> > You shouldn't duplicate CONFIG_SCHED_MC in every architecture, instead you
> > should define a CONFIG_ARCH_HAS_SCHED_MC in arch/Kconfig that gets selected
> > by architectures then have CONFIG_SCHED_MC defined in init/Kconfig or
> > kernel/Kconfig or so.
> 
> Let me add this first -- it is currently duplicated. Then I'll see about
> merging the thing across architectures.

So what I added to power was:

config SCHED_MC
	def_bool y
	depends on PPC64 && SMP

because that is more or less the behaviour that was there, per the
existing SDTL_INIT().

---

Now, when I look at unifying those config options (there's a metric ton
of crap that's duplicated in the arch/*/Kconfig), I end up with something
like the below.

And while that isn't exact, it is the closest I could make it without
making a giant mess of things.

WDYT?

---
 Kconfig           |   38 ++++++++++++++++++++++++++++++++++++++
 arm/Kconfig       |   18 ++----------------
 arm64/Kconfig     |   26 +++-----------------------
 loongarch/Kconfig |   19 ++-----------------
 mips/Kconfig      |   16 ++--------------
 parisc/Kconfig    |    9 +--------
 powerpc/Kconfig   |   15 +++------------
 riscv/Kconfig     |    9 +--------
 s390/Kconfig      |    8 ++------
 sparc/Kconfig     |   20 ++------------------
 x86/Kconfig       |   27 ++++-----------------------
 11 files changed, 60 insertions(+), 145 deletions(-)

--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -41,6 +41,44 @@ config HOTPLUG_SMT
 config SMT_NUM_THREADS_DYNAMIC
 	bool
 
+config ARCH_SUPPORTS_SCHED_SMT
+	bool
+
+config ARCH_SUPPORTS_SCHED_CLUSTER
+	bool
+
+config ARCH_SUPPORTS_SCHED_MC
+	bool
+
+config SCHED_SMT
+	bool "SMT (Hyperthreading) scheduler support"
+	depends on ARCH_SUPPORTS_SCHED_SMT
+	default y
+	help
+	  Improves the CPU scheduler's decision making when dealing with
+	  MultiThreading at a cost of slightly increased overhead in some
+	  places. If unsure say N here.
+
+config SCHED_CLUSTER
+	bool "Cluster scheduler support"
+	depends on ARCH_SUPPORTS_SCHED_CLUSTER
+	default y
+	help
+	  Cluster scheduler support improves the CPU scheduler's decision
+	  making when dealing with machines that have clusters of CPUs.
+	  Cluster usually means a couple of CPUs which are placed closely
+	  by sharing mid-level caches, last-level cache tags or internal
+	  busses.
+
+config SCHED_MC
+	bool "Multi-Core Cache (MC) scheduler support"
+	depends on ARCH_SUPPORTS_SCHED_MC
+	default y
+	help
+	  Multi-core scheduler support improves the CPU scheduler's decision
+	  making when dealing with multi-core CPU chips at a cost of slightly
+	  increased overhead in some places. If unsure say N here.
+
 # Selected by HOTPLUG_CORE_SYNC_DEAD or HOTPLUG_CORE_SYNC_FULL
 config HOTPLUG_CORE_SYNC
 	bool
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -941,28 +941,14 @@ config IRQSTACKS
 config ARM_CPU_TOPOLOGY
 	bool "Support cpu topology definition"
 	depends on SMP && CPU_V7
+	select ARCH_SUPPORTS_SCHED_MC
+	select ARCH_SUPPORTS_SCHED_SMT
 	default y
 	help
 	  Support ARM cpu topology definition. The MPIDR register defines
 	  affinity between processors which is then used to describe the cpu
 	  topology of an ARM System.
 
-config SCHED_MC
-	bool "Multi-core scheduler support"
-	depends on ARM_CPU_TOPOLOGY
-	help
-	  Multi-core scheduler support improves the CPU scheduler's decision
-	  making when dealing with multi-core CPU chips at a cost of slightly
-	  increased overhead in some places. If unsure say N here.
-
-config SCHED_SMT
-	bool "SMT scheduler support"
-	depends on ARM_CPU_TOPOLOGY
-	help
-	  Improves the CPU scheduler's decision making when dealing with
-	  MultiThreading at a cost of slightly increased overhead in some
-	  places. If unsure say N here.
-
 config HAVE_ARM_SCU
 	bool
 	help
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -108,6 +108,9 @@ config ARM64
 	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_RT
+	select ARCH_SUPPORTS_SCHED_SMT
+	select ARCH_SUPPORTS_SCHED_CLUSTER
+	select ARCH_SUPPORTS_SCHED_MC
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
@@ -1505,29 +1508,6 @@ config CPU_LITTLE_ENDIAN
 
 endchoice
 
-config SCHED_MC
-	bool "Multi-core scheduler support"
-	help
-	  Multi-core scheduler support improves the CPU scheduler's decision
-	  making when dealing with multi-core CPU chips at a cost of slightly
-	  increased overhead in some places. If unsure say N here.
-
-config SCHED_CLUSTER
-	bool "Cluster scheduler support"
-	help
-	  Cluster scheduler support improves the CPU scheduler's decision
-	  making when dealing with machines that have clusters of CPUs.
-	  Cluster usually means a couple of CPUs which are placed closely
-	  by sharing mid-level caches, last-level cache tags or internal
-	  busses.
-
-config SCHED_SMT
-	bool "SMT scheduler support"
-	help
-	  Improves the CPU scheduler's decision making when dealing with
-	  MultiThreading at a cost of slightly increased overhead in some
-	  places. If unsure say N here.
-
 config NR_CPUS
 	int "Maximum number of CPUs (2-4096)"
 	range 2 4096
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -70,6 +70,8 @@ config LOONGARCH
 	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select ARCH_SUPPORTS_RT
+	select ARCH_SUPPORTS_SCHED_SMT if SMP
+	select ARCH_SUPPORTS_SCHED_MC  if SMP
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_MEMTEST
@@ -448,23 +450,6 @@ config EFI_STUB
 	  This kernel feature allows the kernel to be loaded directly by
 	  EFI firmware without the use of a bootloader.
 
-config SCHED_SMT
-	bool "SMT scheduler support"
-	depends on SMP
-	default y
-	help
-	  Improves scheduler's performance when there are multiple
-	  threads in one physical core.
-
-config SCHED_MC
-	bool "Multi-core scheduler support"
-	depends on SMP
-	default y
-	help
-	  Multi-core scheduler support improves the CPU scheduler's decision
-	  making when dealing with multi-core CPU chips at a cost of slightly
-	  increased overhead in some places.
-
 config SMP
 	bool "Multi-Processing support"
 	help
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2223,7 +2223,7 @@ config MIPS_MT_SMP
 	select SMP
 	select SMP_UP
 	select SYS_SUPPORTS_SMP
-	select SYS_SUPPORTS_SCHED_SMT
+	select ARCH_SUPPORTS_SCHED_SMT
 	select MIPS_PERF_SHARED_TC_COUNTERS
 	help
 	  This is a kernel model which is known as SMVP. This is supported
@@ -2235,18 +2235,6 @@ config MIPS_MT_SMP
 config MIPS_MT
 	bool
 
-config SCHED_SMT
-	bool "SMT (multithreading) scheduler support"
-	depends on SYS_SUPPORTS_SCHED_SMT
-	default n
-	help
-	  SMT scheduler support improves the CPU scheduler's decision making
-	  when dealing with MIPS MT enabled cores at a cost of slightly
-	  increased overhead in some places. If unsure say N here.
-
-config SYS_SUPPORTS_SCHED_SMT
-	bool
-
 config SYS_SUPPORTS_MULTITHREADING
 	bool
 
@@ -2318,7 +2306,7 @@ config MIPS_CPS
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select SYNC_R4K if (CEVT_R4K || CSRC_R4K)
 	select SYS_SUPPORTS_HOTPLUG_CPU
-	select SYS_SUPPORTS_SCHED_SMT if CPU_MIPSR6
+	select ARCH_SUPPORTS_SCHED_SMT if CPU_MIPSR6
 	select SYS_SUPPORTS_SMP
 	select WEAK_ORDERING
 	select GENERIC_IRQ_MIGRATION if HOTPLUG_CPU
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -44,6 +44,7 @@ config PARISC
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_ARCH_TOPOLOGY if SMP
+	select ARCH_SUPPORTS_SCHED_MC if SMP && PA8X00
 	select GENERIC_CPU_DEVICES if !SMP
 	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select SYSCTL_ARCH_UNALIGN_ALLOW
@@ -319,14 +320,6 @@ config SMP
 
 	  If you don't know what to do here, say N.
 
-config SCHED_MC
-	bool "Multi-core scheduler support"
-	depends on GENERIC_ARCH_TOPOLOGY && PA8X00
-	help
-	  Multi-core scheduler support improves the CPU scheduler's decision
-	  making when dealing with multi-core CPU chips at a cost of slightly
-	  increased overhead in some places. If unsure say N here.
-
 config IRQSTACKS
 	bool "Use separate kernel stacks when processing interrupts"
 	default y
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -170,6 +170,9 @@ config PPC
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx
+	select ARCH_SUPPORTS_SCHED_SMT		if PPC64 && SMP
+	select ARCH_SUPPORTS_SCHED_MC		if PPC64 && SMP
+	select SCHED_MC				if ARCH_SUPPORTS_SCHED_MC
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_MEMTEST
@@ -963,18 +966,6 @@ config PPC_PROT_SAO_LPAR
 config PPC_COPRO_BASE
 	bool
 
-config SCHED_SMT
-	bool "SMT (Hyperthreading) scheduler support"
-	depends on PPC64 && SMP
-	help
-	  SMT scheduler support improves the CPU scheduler's decision making
-	  when dealing with POWER5 cpus at a cost of slightly increased
-	  overhead in some places. If unsure say N here.
-
-config SCHED_MC
-	def_bool y
-	depends on PPC64 && SMP
-
 config PPC_DENORMALISATION
 	bool "PowerPC denormalisation exception handling"
 	depends on PPC_BOOK3S_64
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -72,6 +72,7 @@ config RISCV
 	select ARCH_SUPPORTS_PER_VMA_LOCK if MMU
 	select ARCH_SUPPORTS_RT
 	select ARCH_SUPPORTS_SHADOW_CALL_STACK if HAVE_SHADOW_CALL_STACK
+	select ARCH_SUPPORTS_SCHED_MC if SMP
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
@@ -453,14 +454,6 @@ config SMP
 
 	  If you don't know what to do here, say N.
 
-config SCHED_MC
-	bool "Multi-core scheduler support"
-	depends on SMP
-	help
-	  Multi-core scheduler support improves the CPU scheduler's decision
-	  making when dealing with multi-core CPU chips at a cost of slightly
-	  increased overhead in some places. If unsure say N here.
-
 config NR_CPUS
 	int "Maximum number of CPUs (2-512)"
 	depends on SMP
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -547,15 +547,11 @@ config NODES_SHIFT
 	depends on NUMA
 	default "1"
 
-config SCHED_SMT
-	def_bool n
-
-config SCHED_MC
-	def_bool n
-
 config SCHED_TOPOLOGY
 	def_bool y
 	prompt "Topology scheduler support"
+	select ARCH_SUPPORTS_SCHED_SMT
+	select ARCH_SUPPORTS_SCHED_MC
 	select SCHED_SMT
 	select SCHED_MC
 	help
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -110,6 +110,8 @@ config SPARC64
 	select HAVE_SETUP_PER_CPU_AREA
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
+	select ARCH_SUPPORTS_SCHED_SMT if SMP
+	select ARCH_SUPPORTS_SCHED_MC  if SMP
 
 config ARCH_PROC_KCORE_TEXT
 	def_bool y
@@ -288,24 +290,6 @@ if SPARC64 || COMPILE_TEST
 source "kernel/power/Kconfig"
 endif
 
-config SCHED_SMT
-	bool "SMT (Hyperthreading) scheduler support"
-	depends on SPARC64 && SMP
-	default y
-	help
-	  SMT scheduler support improves the CPU scheduler's decision making
-	  when dealing with SPARC cpus at a cost of slightly increased overhead
-	  in some places. If unsure say N here.
-
-config SCHED_MC
-	bool "Multi-core scheduler support"
-	depends on SPARC64 && SMP
-	default y
-	help
-	  Multi-core scheduler support improves the CPU scheduler's decision
-	  making when dealing with multi-core CPU chips at a cost of slightly
-	  increased overhead in some places. If unsure say N here.
-
 config CMDLINE_BOOL
 	bool "Default bootloader kernel arguments"
 	depends on SPARC64
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -330,6 +330,10 @@ config X86
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
 	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
 	select ARCH_SUPPORTS_PT_RECLAIM		if X86_64
+	select ARCH_SUPPORTS_SCHED_SMT		if SMP
+	select SCHED_SMT			if SMP
+	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
+	select ARCH_SUPPORTS_SCHED_MC		if SMP
 
 config INSTRUCTION_DECODER
 	def_bool y
@@ -1036,29 +1040,6 @@ config NR_CPUS
 	  This is purely to save memory: each supported CPU adds about 8KB
 	  to the kernel image.
 
-config SCHED_CLUSTER
-	bool "Cluster scheduler support"
-	depends on SMP
-	default y
-	help
-	  Cluster scheduler support improves the CPU scheduler's decision
-	  making when dealing with machines that have clusters of CPUs.
-	  Cluster usually means a couple of CPUs which are placed closely
-	  by sharing mid-level caches, last-level cache tags or internal
-	  busses.
-
-config SCHED_SMT
-	def_bool y if SMP
-
-config SCHED_MC
-	def_bool y
-	prompt "Multi-core scheduler support"
-	depends on SMP
-	help
-	  Multi-core scheduler support improves the CPU scheduler's decision
-	  making when dealing with multi-core CPU chips at a cost of slightly
-	  increased overhead in some places. If unsure say N here.
-
 config SCHED_MC_PRIO
 	bool "CPU core priorities scheduler support"
 	depends on SCHED_MC

