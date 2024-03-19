Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B195C87F947
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:16:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k7LxATRn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPgj4sj3z3wRv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:16:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k7LxATRn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPL82KHKz3vby
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:01:04 +1100 (AEDT)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5a470320194so2466375eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835261; x=1711440061; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VAyLVBNs98eyzAZ6tU9po3MJ8lcsuAPyekaTSdXNeg=;
        b=k7LxATRn97JYhLea1Z2oGADll4I8GIWs1DVuogDbxD+YqLZFH0h5PTVGaJ6BHdynIk
         ub9Rm8I3Vnp6gBt8LmEgp3IvrfOQ6uoC3OM/UciT27Bo7b+9CEhYdYipvx/4o+m4L9No
         E43vxEwspBJnHaNZiKui1bjFq+8VQj6LDOOGDNsHyBI00mAMq3qFdUwQDmH/vPM1ORKQ
         FxM4bCSCf+XtjVvuIFV38aJiYzUN51+mWaa+4hPS/bzMtTdNVQqGoOj1UVo1T0+zWkUz
         zXarv6+XKefuiCvAw64IFLeNkMnvlcF4Ovoeavp/MdByxEXw8gQ5zkhliRvlY1prT4Lx
         0M9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835261; x=1711440061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VAyLVBNs98eyzAZ6tU9po3MJ8lcsuAPyekaTSdXNeg=;
        b=rAGI27A3lAI8bS7gcWcQXov7knzwva6Nrhy9mX1QTlPXDR5aVI/aH4pj7edyH12+PN
         HNdjTGuOmoEa0mNxhymaRb7bDBGr93qFIeFVdWCKCB9LGYgNjhDI/bSZiUVVly7EQ6TI
         UKPy20YoBSZAsy/sCUlJhqktHu+W7+iJ9nAGrwooSNuAoxSwdkIK933z42eNQ2LP/X5b
         fxaZlV/52EFsgJ8qU3n+q4JWSRd/IZL4AEnON7tFUiK19tpeFZo4meNQ0sp1VBzxfuWP
         zsdJw6nYI2g4k4xpwlqM9uS8FB4YzRMjWoI+kBJy3sv00BU3nDDwtYXA1hTxLzMG8a+T
         qUlg==
X-Forwarded-Encrypted: i=1; AJvYcCUPoh3dbJqOmKXfkxmSw6fEEFONOEzYSUM0SPePxWrZQI/ibPJcMvBh6SzjiPjDH2GRqM9ARModYZZBKQlJrFyY50yz0bIXugR1coWYJA==
X-Gm-Message-State: AOJu0YzzuLE/VPQnhVXT21MPVhz5LP3w/Tyb9JWV+BaK39byibVwMfD7
	rtWlpYRIv2uX0p+5I5kA4+Fjpv896dUHv0x34Hu3adQ6ggXo6Z9p
X-Google-Smtp-Source: AGHT+IER5OJcj3/5Kz8fO1aD101lLMaRMXWcnt/KQnM6vB7JwjBpRiMlzvINL7Sym91NrUe84MOEYQ==
X-Received: by 2002:a05:6359:4ca6:b0:17e:4b00:843a with SMTP id kk38-20020a0563594ca600b0017e4b00843amr2533435rwc.5.1710835260911;
        Tue, 19 Mar 2024 01:01:00 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.01.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:00:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 22/35] powerpc: add SMP and IPI support
Date: Tue, 19 Mar 2024 17:59:13 +1000
Message-ID: <20240319075926.2422707-23-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240319075926.2422707-1-npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc SMP support is very primitive and does not set up a first-class
runtime environment for secondary CPUs.

This reworks SMP support, and provides a complete C and harness
environment for the secondaries, including interrupt handling, as well
as IPI support.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/processor.h |  23 +++
 lib/powerpc/asm/reg.h       |   1 +
 lib/powerpc/asm/setup.h     |   2 -
 lib/powerpc/asm/smp.h       |  46 +++--
 lib/powerpc/io.c            |  15 +-
 lib/powerpc/processor.c     |   7 +-
 lib/powerpc/setup.c         |  90 +++++++---
 lib/powerpc/smp.c           | 282 +++++++++++++++++++++++++----
 lib/ppc64/asm-offsets.c     |   7 +
 lib/ppc64/asm/atomic.h      |   6 +
 lib/ppc64/asm/barrier.h     |   3 +
 lib/ppc64/asm/opal.h        |   7 +
 powerpc/Makefile.common     |   1 +
 powerpc/cstart64.S          |  49 ++++-
 powerpc/selftest.c          |   4 +-
 powerpc/smp.c               | 348 ++++++++++++++++++++++++++++++++++++
 powerpc/tm.c                |   4 +-
 powerpc/unittests.cfg       |   8 +
 18 files changed, 818 insertions(+), 85 deletions(-)
 create mode 100644 lib/ppc64/asm/atomic.h
 create mode 100644 powerpc/smp.c

diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index eed37d1f4..a3859b5d4 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -16,6 +16,7 @@ extern bool cpu_has_siar;
 extern bool cpu_has_heai;
 extern bool cpu_has_prefix;
 extern bool cpu_has_sc_lev;
+extern bool cpu_has_pause_short;
 
 static inline uint64_t mfspr(int nr)
 {
@@ -45,6 +46,28 @@ static inline void mtmsr(uint64_t msr)
 	asm volatile ("mtmsrd %[msr]" :: [msr] "r" (msr) : "memory");
 }
 
+static inline void local_irq_enable(void)
+{
+	unsigned long msr;
+
+	asm volatile(
+"		mfmsr	%0		\n \
+		ori	%0,%0,%1	\n \
+		mtmsrd	%0,1		"
+		: "=r"(msr) : "i"(MSR_EE): "memory");
+}
+
+static inline void local_irq_disable(void)
+{
+	unsigned long msr;
+
+	asm volatile(
+"		mfmsr	%0		\n \
+		andc	%0,%0,%1	\n \
+		mtmsrd	%0,1		"
+		: "=r"(msr) : "r"(MSR_EE): "memory");
+}
+
 /*
  * This returns true on PowerNV / OPAL machines which run in hypervisor
  * mode. False on pseries / PAPR machines that run in guest mode.
diff --git a/lib/powerpc/asm/reg.h b/lib/powerpc/asm/reg.h
index d6097f48f..d2ca964c4 100644
--- a/lib/powerpc/asm/reg.h
+++ b/lib/powerpc/asm/reg.h
@@ -19,6 +19,7 @@
 #define SPR_SPRG1	0x111
 #define SPR_SPRG2	0x112
 #define SPR_SPRG3	0x113
+#define SPR_TBU40	0x11e
 #define SPR_PVR		0x11f
 #define   PVR_VERSION_MASK	UL(0xffff0000)
 #define   PVR_VER_970		UL(0x00390000)
diff --git a/lib/powerpc/asm/setup.h b/lib/powerpc/asm/setup.h
index cc7cf5e25..9ca318ce6 100644
--- a/lib/powerpc/asm/setup.h
+++ b/lib/powerpc/asm/setup.h
@@ -8,8 +8,6 @@
 #include <libcflat.h>
 
 #define NR_CPUS			8	/* arbitrarily set for now */
-extern u32 cpus[NR_CPUS];
-extern int nr_cpus;
 
 extern uint64_t tb_hz;
 
diff --git a/lib/powerpc/asm/smp.h b/lib/powerpc/asm/smp.h
index 21940b4bc..4519e5436 100644
--- a/lib/powerpc/asm/smp.h
+++ b/lib/powerpc/asm/smp.h
@@ -2,21 +2,45 @@
 #define _ASMPOWERPC_SMP_H_
 
 #include <libcflat.h>
+#include <asm/processor.h>
 
-extern int nr_threads;
+typedef void (*secondary_entry_fn)(int cpu_id);
 
-struct start_threads {
-	int nr_threads;
-	int nr_started;
-};
+struct cpu {
+	unsigned long server_no;
+	unsigned long stack;
+	unsigned long exception_stack;
+	secondary_entry_fn entry;
+} __attribute__((packed)); /* used by asm */
 
-typedef void (*secondary_entry_fn)(void);
+extern int nr_cpus_present;
+extern int nr_cpus_online;
+extern struct cpu cpus[];
 
-extern void halt(void);
+register struct cpu *__current_cpu asm("r13");
+static inline struct cpu *current_cpu(void)
+{
+	return __current_cpu;
+}
 
-extern int start_thread(int cpu_id, secondary_entry_fn entry, uint32_t r3);
-extern struct start_threads start_cpu(int cpu_node, secondary_entry_fn entry,
-				      uint32_t r3);
-extern bool start_all_cpus(secondary_entry_fn entry, uint32_t r3);
+static inline int smp_processor_id(void)
+{
+	return current_cpu()->server_no;
+}
+
+void cpu_init(struct cpu *cpu, int cpu_id);
+
+extern void halt(int cpu_id);
+
+extern bool start_all_cpus(secondary_entry_fn entry);
+extern void stop_all_cpus(void);
+
+struct pt_regs;
+void register_ipi(void (*fn)(struct pt_regs *, void *), void *data);
+void unregister_ipi(void);
+void cpu_init_ipis(void);
+void local_ipi_enable(void);
+void local_ipi_disable(void);
+void send_ipi(int cpu_id);
 
 #endif /* _ASMPOWERPC_SMP_H_ */
diff --git a/lib/powerpc/io.c b/lib/powerpc/io.c
index ab7bb843c..cb7f2f050 100644
--- a/lib/powerpc/io.c
+++ b/lib/powerpc/io.c
@@ -10,6 +10,7 @@
 #include <asm/rtas.h>
 #include <asm/setup.h>
 #include <asm/processor.h>
+#include <asm/atomic.h>
 #include "io.h"
 
 static struct spinlock print_lock;
@@ -55,13 +56,17 @@ extern void halt(int code);
 
 void exit(int code)
 {
+	static int exited = 0;
+
 // FIXME: change this print-exit/rtas-poweroff to chr_testdev_exit(),
 //        maybe by plugging chr-testdev into a spapr-vty.
-	printf("\nEXIT: STATUS=%d\n", ((code) << 1) | 1);
-	if (machine_is_powernv())
-		opal_power_off();
-	else
-		rtas_power_off();
+	if (atomic_fetch_inc(&exited) == 0) {
+		printf("\nEXIT: STATUS=%d\n", ((code) << 1) | 1);
+		if (machine_is_powernv())
+			opal_power_off();
+		else
+			rtas_power_off();
+	}
 	halt(code);
 	__builtin_unreachable();
 }
diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
index 1b4bb0d61..a6ce3c905 100644
--- a/lib/powerpc/processor.c
+++ b/lib/powerpc/processor.c
@@ -13,6 +13,7 @@
 #include <asm/barrier.h>
 #include <asm/hcall.h>
 #include <asm/handlers.h>
+#include <asm/smp.h>
 
 static struct {
 	void (*func)(struct pt_regs *, void *data);
@@ -44,6 +45,8 @@ void do_handle_exception(struct pt_regs *regs)
 {
 	unsigned char v;
 
+	__current_cpu = (struct cpu *)mfspr(SPR_SPRG0);
+
 	v = regs->trap >> 5;
 
 	if (v < 128 && handlers[v].func) {
@@ -51,8 +54,8 @@ void do_handle_exception(struct pt_regs *regs)
 		return;
 	}
 
-	printf("Unhandled cpu exception %#lx at NIA:0x%016lx MSR:0x%016lx\n",
-			regs->trap, regs->nip, regs->msr);
+	printf("Unhandled CPU%d exception %#lx at NIA:0x%016lx MSR:0x%016lx\n",
+		smp_processor_id(), regs->trap, regs->nip, regs->msr);
 	dump_frame_stack((void *)regs->nip, (void *)regs->gpr[1]);
 	abort();
 }
diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
index 496af40f8..16f009152 100644
--- a/lib/powerpc/setup.c
+++ b/lib/powerpc/setup.c
@@ -2,7 +2,7 @@
  * Initialize machine setup information and I/O.
  *
  * After running setup() unit tests may query how many cpus they have
- * (nr_cpus), how much memory they have (PHYSICAL_END - PHYSICAL_START),
+ * (nr_cpus_present), how much memory they have (PHYSICAL_END - PHYSICAL_START),
  * may use dynamic memory allocation (malloc, etc.), printf, and exit.
  * Finally, argc and argv are also ready to be passed to main().
  *
@@ -17,6 +17,7 @@
 #include <alloc_phys.h>
 #include <argv.h>
 #include <asm/setup.h>
+#include <asm/smp.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
 #include <asm/processor.h>
@@ -28,8 +29,8 @@ extern unsigned long stacktop;
 char *initrd;
 u32 initrd_size;
 
-u32 cpus[NR_CPUS] = { [0 ... NR_CPUS-1] = (~0U) };
-int nr_cpus;
+u32 cpu_to_hwid[NR_CPUS] = { [0 ... NR_CPUS-1] = (~0U) };
+int nr_cpus_present;
 uint64_t tb_hz;
 
 struct mem_region mem_regions[NR_MEM_REGIONS];
@@ -44,13 +45,32 @@ struct cpu_set_params {
 
 static void cpu_set(int fdtnode, u64 regval, void *info)
 {
+	const struct fdt_property *prop;
+	u32 *threads;
 	static bool read_common_info = false;
 	struct cpu_set_params *params = info;
-	int cpu = nr_cpus++;
-
-	assert_msg(cpu < NR_CPUS, "Number cpus exceeds maximum supported (%d).", NR_CPUS);
-
-	cpus[cpu] = regval;
+	int nr_threads;
+	int len, i;
+
+	/* Get the id array of threads on this node */
+	prop = fdt_get_property(dt_fdt(), fdtnode,
+				"ibm,ppc-interrupt-server#s", &len);
+	assert(prop);
+
+	nr_threads = len >> 2; /* Divide by 4 since 4 bytes per thread */
+	threads = (u32 *)prop->data; /* Array of valid ids */
+
+	for (i = 0; i < nr_threads; i++) {
+		if (nr_cpus_present >= NR_CPUS) {
+			static bool warned = false;
+			if (!warned) {
+				printf("Warning: Number of present CPUs exceeds maximum supported (%d).\n", NR_CPUS);
+				warned = true;
+			}
+			break;
+		}
+		cpu_to_hwid[nr_cpus_present++] = fdt32_to_cpu(threads[i]);
+	}
 
 	if (!read_common_info) {
 		const struct fdt_property *prop;
@@ -84,32 +104,25 @@ bool cpu_has_siar;
 bool cpu_has_heai;
 bool cpu_has_prefix;
 bool cpu_has_sc_lev; /* sc interrupt has LEV field in SRR1 */
+bool cpu_has_pause_short;
 
-static void cpu_init(void)
+static void cpu_init_params(void)
 {
 	struct cpu_set_params params;
 	int ret;
 
-	nr_cpus = 0;
+	nr_cpus_present = 0;
 	ret = dt_for_each_cpu_node(cpu_set, &params);
 	assert(ret == 0);
 	__icache_bytes = params.icache_bytes;
 	__dcache_bytes = params.dcache_bytes;
 	tb_hz = params.tb_hz;
 
-	/* Interrupt Endianness */
-	if (machine_is_pseries()) {
-#if  __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
-		hcall(H_SET_MODE, 1, 4, 0, 0);
-#else
-		hcall(H_SET_MODE, 0, 4, 0, 0);
-#endif
-	}
-
 	switch (mfspr(SPR_PVR) & PVR_VERSION_MASK) {
 	case PVR_VER_POWER10:
 		cpu_has_prefix = true;
 		cpu_has_sc_lev = true;
+		cpu_has_pause_short = true;
 	case PVR_VER_POWER9:
 	case PVR_VER_POWER8E:
 	case PVR_VER_POWER8NVL:
@@ -175,19 +188,37 @@ static void mem_init(phys_addr_t freemem_start)
 #define EXCEPTION_STACK_SIZE	SZ_64K
 
 static char boot_exception_stack[EXCEPTION_STACK_SIZE];
+struct cpu cpus[NR_CPUS];
+
+void cpu_init(struct cpu *cpu, int cpu_id)
+{
+	cpu->server_no = cpu_id;
+
+	cpu->stack = (unsigned long)memalign(SZ_4K, SZ_64K);
+	cpu->stack += SZ_64K - 64;
+	cpu->exception_stack = (unsigned long)memalign(SZ_4K, SZ_64K);
+	cpu->exception_stack += SZ_64K - 64;
+}
 
 void setup(const void *fdt)
 {
 	void *freemem = &stacktop;
 	const char *bootargs, *tmp;
+	struct cpu *cpu;
 	u32 fdt_size;
 	int ret;
 
 	cpu_has_hv = !!(mfmsr() & (1ULL << MSR_HV_BIT));
 
-	/* set exception stack address for this CPU (in SPGR0) */
-	asm volatile ("mtsprg0 %[addr]" ::
-		      [addr] "r" (boot_exception_stack));
+	memset(cpus, 0xff, sizeof(cpus));
+
+	cpu = &cpus[0];
+	cpu->server_no = fdt_boot_cpuid_phys(fdt);
+	cpu->exception_stack = (unsigned long)boot_exception_stack;
+	cpu->exception_stack += SZ_64K - 64;
+
+	mtspr(SPR_SPRG0, (unsigned long)cpu);
+	__current_cpu = cpu;
 
 	enable_mcheck();
 
@@ -230,8 +261,19 @@ void setup(const void *fdt)
 
 	assert(STACK_INT_FRAME_SIZE % 16 == 0);
 
-	/* call init functions */
-	cpu_init();
+	/* set parameters from dt */
+	cpu_init_params();
+
+	/* Interrupt Endianness */
+	if (machine_is_pseries()) {
+#if  __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+		hcall(H_SET_MODE, 1, 4, 0, 0);
+#else
+		hcall(H_SET_MODE, 0, 4, 0, 0);
+#endif
+	}
+
+	cpu_init_ipis();
 
 	/* cpu_init must be called before mem_init */
 	mem_init(PAGE_ALIGN((unsigned long)freemem));
diff --git a/lib/powerpc/smp.c b/lib/powerpc/smp.c
index 3e211eba8..a3bf85d44 100644
--- a/lib/powerpc/smp.c
+++ b/lib/powerpc/smp.c
@@ -6,58 +6,253 @@
  * This work is licensed under the terms of the GNU LGPL, version 2.
  */
 
+#include <alloc.h>
 #include <devicetree.h>
+#include <asm/atomic.h>
+#include <asm/barrier.h>
+#include <asm/processor.h>
 #include <asm/time.h>
 #include <asm/setup.h>
+#include <asm/opal.h>
+#include <asm/hcall.h>
 #include <asm/rtas.h>
 #include <asm/smp.h>
 
-int nr_threads;
-
 struct secondary_entry_data {
 	secondary_entry_fn entry;
-	uint64_t r3;
-	int nr_started;
 };
 
+int nr_cpus_online = 1;
+
+static void stop_self(int cpu_id)
+{
+	if (machine_is_powernv()) {
+		if (opal_call(OPAL_RETURN_CPU, 0, 0, 0) != OPAL_SUCCESS) {
+			printf("OPAL_RETURN_CPU failed\n");
+		}
+	} else {
+		rtas_stop_self();
+	}
+
+	printf("failed to stop cpu %d\n", cpu_id);
+	assert(0);
+}
+
+void main_secondary(struct cpu *cpu);
+void main_secondary(struct cpu *cpu)
+{
+	mtspr(SPR_SPRG0, (unsigned long)cpu);
+	__current_cpu = cpu;
+
+	enable_mcheck();
+
+	cpu_init_ipis();
+
+	atomic_fetch_inc(&nr_cpus_online);
+
+	cpu->entry(cpu->server_no);
+
+	mb();
+	atomic_fetch_dec(&nr_cpus_online);
+
+	stop_self(cpu->server_no);
+}
+
+enum OpalThreadStatus {
+        OPAL_THREAD_INACTIVE = 0x0,
+        OPAL_THREAD_STARTED = 0x1,
+        OPAL_THREAD_UNAVAILABLE = 0x2 /* opal-v3 */
+};
+
+#define H_EOI		0x64
+#define H_CPPR		0x68
+#define H_IPI		0x6c
+#define H_XIRR		0x74
+
+static void (*ipi_fn)(struct pt_regs *regs, void *data);
+
+static void dbell_handler(struct pt_regs *regs, void *data)
+{
+	/* sync */
+	ipi_fn(regs, data);
+}
+
+static void extint_handler(struct pt_regs *regs, void *data)
+{
+	int32_t xirr;
+	int32_t xisr;
+	int64_t rc;
+
+	asm volatile("mr r3,%1 ; sc 1 ; mr %0,r4" : "=r"(xirr) : "r"(H_XIRR));
+	xisr = xirr & 0xffffff;
+
+	if (xisr == 2) { /* IPI */
+		rc = hcall(H_IPI, smp_processor_id(), 0xff);
+		assert(rc == H_SUCCESS);
+	}
+
+	xirr |= (5 << 24);
+	rc = hcall(H_EOI, xirr);
+	assert(rc == H_SUCCESS);
+
+	/* lower IPI */
+	ipi_fn(regs, data);
+}
+
+void cpu_init_ipis(void)
+{
+	if (machine_is_powernv()) {
+		/* skiboot can leave some messages set */
+		unsigned long rb = (5 << (63-36));
+		asm volatile("msgclr	%0" :: "r"(rb) : "memory");
+	}
+}
+
+void local_ipi_enable(void)
+{
+	if (machine_is_pseries()) {
+		hcall(H_CPPR, 5);
+	}
+}
+
+void local_ipi_disable(void)
+{
+	if (machine_is_pseries()) {
+		hcall(H_CPPR, 0);
+	}
+}
+
+void register_ipi(void (*fn)(struct pt_regs *, void *), void *data)
+{
+	ipi_fn = fn;
+	if (machine_is_powernv()) {
+		handle_exception(0xe80, &dbell_handler, data);
+	} else {
+		handle_exception(0x500, &extint_handler, data);
+	}
+}
+
+void unregister_ipi(void)
+{
+	if (machine_is_powernv()) {
+		handle_exception(0xe80, NULL, NULL);
+	} else {
+		handle_exception(0x500, NULL, NULL);
+	}
+}
+
+void send_ipi(int cpu_id)
+{
+	if (machine_is_powernv()) {
+		unsigned long rb = (5 << (63-36)) | cpu_id;
+		asm volatile("lwsync" ::: "memory");
+		asm volatile("msgsnd	%0" :: "r"(rb) : "memory");
+	} else {
+		hcall(H_IPI, cpu_id, 4);
+	}
+}
+
+static int nr_started = 1;
+
+extern void start_secondary(uint64_t server_no); /* asm entry point */
+
+static bool cpu_is_running(int cpu_id)
+{
+	if (machine_is_powernv()) {
+		int64_t ret;
+		uint8_t status;
+
+		ret = opal_call(OPAL_QUERY_CPU_STATUS, cpu_id, (unsigned long)&status, 0);
+		if (ret != OPAL_SUCCESS) {
+			printf("OPAL_QUERY_CPU_STATUS failed for cpu %d\n", cpu_id);
+			return false;
+		}
+		return (status != OPAL_THREAD_INACTIVE);
+	} else {
+		uint32_t query_token;
+		int outputs[1], ret;
+
+		ret = rtas_token("query-cpu-stopped-state", &query_token);
+		if (ret != 0) {
+			printf("rtas token query-cpu-stopped-state failed\n");
+			return false;
+		}
+
+		ret = rtas_call(query_token, 1, 2, outputs, cpu_id);
+		if (ret) {
+			printf("query-cpu-stopped-state failed for cpu %d\n", cpu_id);
+			return ret;
+		}
+		if (outputs[0]) /* cpu not in stopped state */
+			return true;
+		return false;
+	}
+}
+
 /*
  * Start stopped thread cpu_id at entry
  * Returns:	<0 on failure to start stopped cpu
  *		0  on success
  *		>0 on cpu not in stopped state
  */
-int start_thread(int cpu_id, secondary_entry_fn entry, uint32_t r3)
+static int start_thread(int cpu_id, secondary_entry_fn entry)
 {
-	uint32_t query_token, start_token;
-	int outputs[1], ret;
+	struct cpu *cpu;
+	uint64_t tb;
 
-	ret = rtas_token("query-cpu-stopped-state", &query_token);
-	assert(ret == 0);
-	ret = rtas_token("start-cpu", &start_token);
-	assert(ret == 0);
+	if (nr_started >= NR_CPUS) {
+		/* Reached limit */
+		return -1;
+	}
+
+	if (cpu_id == smp_processor_id()) {
+		/* Boot CPU already started */
+		return -1;
+	}
 
-	ret = rtas_call(query_token, 1, 2, outputs, cpu_id);
-	if (ret) {
-		printf("query-cpu-stopped-state failed for cpu %d\n", cpu_id);
-	} else if (!outputs[0]) { /* cpu in stopped state */
-		ret = rtas_call(start_token, 3, 1, NULL, cpu_id, entry, r3);
-		if (ret)
+	tb = get_tb();
+	while (cpu_is_running(cpu_id)) {
+		if (get_tb() - tb > 3*tb_hz) {
+			printf("Unable to start running CPU:%d\n", cpu_id);
+			return 1;
+		}
+	}
+
+	cpu = &cpus[nr_started];
+	nr_started++;
+
+	cpu_init(cpu, cpu_id);
+	cpu->entry = entry;
+
+	if (machine_is_powernv()) {
+		if (opal_call(OPAL_START_CPU, cpu_id, (unsigned long)start_secondary, 0) != OPAL_SUCCESS) {
 			printf("failed to start cpu %d\n", cpu_id);
-	} else { /* cpu not in stopped state */
-		ret = outputs[0];
+			return -1;
+		}
+	} else {
+		uint32_t start_token;
+		int ret;
+
+		ret = rtas_token("start-cpu", &start_token);
+		assert(ret == 0);
+
+		ret = rtas_call(start_token, 3, 1, NULL, cpu_id, start_secondary, cpu_id);
+		if (ret) {
+			printf("failed to start cpu %d\n", cpu_id);
+			return ret;
+		}
 	}
 
-	return ret;
+	return 0;
 }
 
 /*
  * Start all stopped threads (vcpus) on cpu_node
  * Returns: Number of stopped cpus which were successfully started
  */
-struct start_threads start_cpu(int cpu_node, secondary_entry_fn entry,
-			       uint32_t r3)
+static void start_core(int cpu_node, secondary_entry_fn entry)
 {
-	int len, i, nr_threads, nr_started = 0;
+	int len, i, nr_threads;
 	const struct fdt_property *prop;
 	u32 *threads;
 
@@ -67,23 +262,18 @@ struct start_threads start_cpu(int cpu_node, secondary_entry_fn entry,
 	assert(prop);
 
 	nr_threads = len >> 2; /* Divide by 4 since 4 bytes per thread */
-	threads = (u32 *)prop->data; /* Array of valid ids */
 
-	for (i = 0; i < nr_threads; i++) {
-		if (!start_thread(fdt32_to_cpu(threads[i]), entry, r3))
-			nr_started++;
-	}
+	threads = (u32 *)prop->data; /* Array of valid ids */
 
-	return (struct start_threads) { nr_threads, nr_started };
+	for (i = 0; i < nr_threads; i++)
+		start_thread(fdt32_to_cpu(threads[i]), entry);
 }
 
 static void start_each_secondary(int fdtnode, u64 regval __unused, void *info)
 {
 	struct secondary_entry_data *datap = info;
-	struct start_threads ret = start_cpu(fdtnode, datap->entry, datap->r3);
 
-	nr_threads += ret.nr_threads;
-	datap->nr_started += ret.nr_started;
+	start_core(fdtnode, datap->entry);
 }
 
 /*
@@ -92,14 +282,34 @@ static void start_each_secondary(int fdtnode, u64 regval __unused, void *info)
  * Returns:	TRUE on success
  *		FALSE on failure
  */
-bool start_all_cpus(secondary_entry_fn entry, uint32_t r3)
+bool start_all_cpus(secondary_entry_fn entry)
 {
-	struct secondary_entry_data data = { entry, r3,	0 };
+	struct secondary_entry_data data = { entry };
+	uint64_t tb;
 	int ret;
 
+	assert(nr_cpus_online == 1);
+	assert(nr_started == 1);
 	ret = dt_for_each_cpu_node(start_each_secondary, &data);
 	assert(ret == 0);
+	assert(nr_started == nr_cpus_present);
 
-	/* We expect that we come in with one thread already started */
-	return data.nr_started == nr_threads - 1;
+	tb = get_tb();
+	while (nr_cpus_online < nr_cpus_present) {
+		if (get_tb() - tb > 3*tb_hz) {
+			printf("failed to start all secondaries\n");
+			assert(0);
+		}
+		cpu_relax();
+	}
+
+	return 1;
+}
+
+void stop_all_cpus(void)
+{
+	while (nr_cpus_online > 1)
+		cpu_relax();
+	mb();
+	nr_started = 1;
 }
diff --git a/lib/ppc64/asm-offsets.c b/lib/ppc64/asm-offsets.c
index 7843a20b4..0ac2c9a75 100644
--- a/lib/ppc64/asm-offsets.c
+++ b/lib/ppc64/asm-offsets.c
@@ -6,6 +6,8 @@
 #include <libcflat.h>
 #include <kbuild.h>
 #include <asm/ptrace.h>
+#include <asm/setup.h>
+#include <asm/smp.h>
 
 int main(void)
 {
@@ -50,5 +52,10 @@ int main(void)
 	DEFINE(_XER, STACK_FRAME_OVERHEAD+offsetof(struct pt_regs, xer));
 	DEFINE(_CCR, STACK_FRAME_OVERHEAD+offsetof(struct pt_regs, ccr));
 	DEFINE(_TRAP, STACK_FRAME_OVERHEAD+offsetof(struct pt_regs, trap));
+
+	DEFINE(SIZEOF_STRUCT_CPU, sizeof(struct cpu));
+	DEFINE(EXCEPTION_STACK, offsetof(struct cpu, exception_stack));
+	DEFINE(MAX_CPUS, NR_CPUS);
+
 	return 0;
 }
diff --git a/lib/ppc64/asm/atomic.h b/lib/ppc64/asm/atomic.h
new file mode 100644
index 000000000..0f461b9ce
--- /dev/null
+++ b/lib/ppc64/asm/atomic.h
@@ -0,0 +1,6 @@
+#ifndef _POWERPC_ATOMIC_H_
+#define _POWERPC_ATOMIC_H_
+
+#include "asm-generic/atomic.h"
+
+#endif /* _POWERPC_ATOMIC_H_ */
diff --git a/lib/ppc64/asm/barrier.h b/lib/ppc64/asm/barrier.h
index 76f6efa78..475434b6a 100644
--- a/lib/ppc64/asm/barrier.h
+++ b/lib/ppc64/asm/barrier.h
@@ -1,6 +1,9 @@
 #ifndef _ASMPPC64_BARRIER_H_
 #define _ASMPPC64_BARRIER_H_
 
+#define cpu_relax() asm volatile("or 1,1,1 ; or 2,2,2" ::: "memory")
+#define pause_short() asm volatile(".long 0x7c40003c" ::: "memory")
+
 #define mb() asm volatile("sync":::"memory")
 #define rmb() asm volatile("sync":::"memory")
 #define wmb() asm volatile("sync":::"memory")
diff --git a/lib/ppc64/asm/opal.h b/lib/ppc64/asm/opal.h
index de64e2c8d..6c3e9ffe2 100644
--- a/lib/ppc64/asm/opal.h
+++ b/lib/ppc64/asm/opal.h
@@ -2,14 +2,21 @@
 #ifndef _ASMPPC64_OPAL_H_
 #define _ASMPPC64_OPAL_H_
 
+#include <stdint.h>
+
 #define OPAL_SUCCESS				0
 
 #define OPAL_CONSOLE_WRITE			1
 #define OPAL_CONSOLE_READ			2
 #define OPAL_CEC_POWER_DOWN			5
 #define OPAL_POLL_EVENTS			10
+#define OPAL_START_CPU				41
+#define OPAL_QUERY_CPU_STATUS			42
+#define OPAL_RETURN_CPU				69
 #define OPAL_REINIT_CPUS			70
 # define OPAL_REINIT_CPUS_HILE_BE		(1 << 0)
 # define OPAL_REINIT_CPUS_HILE_LE		(1 << 1)
 
+int64_t opal_call(int64_t token, int64_t arg1, int64_t arg2, int64_t arg3);
+
 #endif
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index 68165fc25..744dfc1f7 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -12,6 +12,7 @@ tests-common = \
 	$(TEST_DIR)/rtas.elf \
 	$(TEST_DIR)/emulator.elf \
 	$(TEST_DIR)/tm.elf \
+	$(TEST_DIR)/smp.elf \
 	$(TEST_DIR)/sprs.elf \
 	$(TEST_DIR)/interrupts.elf
 
diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
index 405cb0561..8c4da65bc 100644
--- a/powerpc/cstart64.S
+++ b/powerpc/cstart64.S
@@ -125,6 +125,49 @@ start:
 	bl	exit
 	b	halt
 
+/*
+ * start_secondary is the secondary entry point. r3 contains the cpu id
+ */
+.globl start_secondary
+start_secondary:
+	FIXUP_ENDIAN
+	/* Switch to 64-bit mode */
+	mfmsr	r1
+	li	r2,1
+	sldi	r2,r2,MSR_SF_BIT
+	or	r1,r1,r2
+	mtmsrd	r1
+
+	bl	0f
+0:	mflr	r31
+	subi	r31, r31, 0b - start	/* QEMU's kernel load address */
+
+	ld	r2, (p_toc - start)(r31)
+
+	LOAD_REG_ADDR(r9, cpus)
+	li	r8,0
+	li	r7,0
+1:	ldx	r6,r9,r7
+	cmpd	r6,r3
+	beq	2f
+	addi	r7,r7,SIZEOF_STRUCT_CPU
+	addi	r8,r8,1
+	cmpdi	r8,MAX_CPUS
+	bne	1b
+	b	.
+
+2:	add	r3,r9,r7
+	ld	r1,8(r3)
+
+	/* Zero backpointers in initial stack frame so backtrace() stops */
+	li	r0,0
+	std	r0,0(r1)
+	std	r0,16(r1)
+
+	bl	main_secondary
+	bl	exit
+	b	halt
+
 .align 3
 p_stack:	.llong  stackptr
 p_toc:		.llong  tocptr
@@ -257,7 +300,8 @@ do_handle_exception_return:
 	. = \vec
 
 	mtsprg1	r1	/* save r1 */
-	mfsprg0	r1	/* get exception stack address */
+	mfsprg0	r1	/* get struct cpu address */
+	ld	r1,EXCEPTION_STACK(r1)	/* get exception stack address */
 	subi	r1,r1, INT_FRAME_SIZE
 
 	/* save r0 and ctr to call generic handler */
@@ -273,7 +317,8 @@ do_handle_exception_return:
 	. = \vec
 
 	mtsprg1	r1	/* save r1 */
-	mfsprg0	r1	/* get exception stack address */
+	mfsprg0	r1	/* get struct cpu address */
+	ld	r1,EXCEPTION_STACK(r1)	/* get exception stack address */
 	subi	r1,r1, INT_FRAME_SIZE
 
 	/* save r0 and ctr to call generic handler */
diff --git a/powerpc/selftest.c b/powerpc/selftest.c
index 7acff7104..8d1a2c767 100644
--- a/powerpc/selftest.c
+++ b/powerpc/selftest.c
@@ -8,6 +8,7 @@
 #include <libcflat.h>
 #include <util.h>
 #include <asm/setup.h>
+#include <asm/smp.h>
 
 static void check_setup(int argc, char **argv)
 {
@@ -34,7 +35,8 @@ static void check_setup(int argc, char **argv)
 
 		} else if (strcmp(argv[i], "smp") == 0) {
 
-			report(nr_cpus == (int)val, "nr_cpus = %d", nr_cpus);
+			report(nr_cpus_present == (int)val,
+				"nr_cpus_present = %d", nr_cpus_present);
 			++nr_tests;
 		}
 
diff --git a/powerpc/smp.c b/powerpc/smp.c
new file mode 100644
index 000000000..644cf1c75
--- /dev/null
+++ b/powerpc/smp.c
@@ -0,0 +1,348 @@
+/* SPDX-License-Identifier: LGPL-2.0-only */
+/*
+ * SMP and IPI Tests
+ *
+ * Copyright 2024 Nicholas Piggin, IBM Corp.
+ */
+#include <libcflat.h>
+#include <asm/atomic.h>
+#include <asm/barrier.h>
+#include <asm/processor.h>
+#include <asm/time.h>
+#include <asm/smp.h>
+#include <asm/setup.h>
+#include <asm/ppc_asm.h>
+#include <devicetree.h>
+
+static volatile bool start_test_running = true;
+static volatile int nr_cpus_started;
+
+static void start_fn(int cpu_id)
+{
+	atomic_fetch_inc(&nr_cpus_started);
+	while (start_test_running)
+		cpu_relax();
+	atomic_fetch_dec(&nr_cpus_started);
+}
+
+static void test_start_cpus(int argc, char **argv)
+{
+	uint64_t tb;
+
+	if (argc > 2)
+		report_abort("Unsupported argument: '%s'", argv[2]);
+
+	nr_cpus_started = 1;
+	if (!start_all_cpus(start_fn))
+		report_abort("Failed to start secondary cpus");
+
+	tb = get_tb();
+	while (nr_cpus_started < nr_cpus_present) {
+		cpu_relax();
+		if (get_tb() - tb > tb_hz * 5)
+			report_abort("Failed to start all secondaries");
+	}
+
+	if (nr_cpus_started != nr_cpus_online)
+		report_abort("Started CPUs does not match online");
+
+	barrier();
+	start_test_running = false;
+	barrier();
+
+	tb = get_tb();
+	while (nr_cpus_started > 1) {
+		cpu_relax();
+		if (get_tb() - tb > tb_hz * 5)
+			report_abort("Failed to stop all secondaries");
+	}
+
+	stop_all_cpus();
+
+	report(true, "start cpus");
+}
+
+static volatile int nr_cpus_ipi = 0;
+
+static void ipi_handler(struct pt_regs *regs, void *data)
+{
+	atomic_fetch_inc(&nr_cpus_ipi);
+}
+
+static volatile bool ipi_test_running = true;
+
+static void ipi_fn(int cpu_id)
+{
+	local_ipi_enable();
+
+	mtspr(SPR_DEC, 0x7fffffff);
+	local_irq_enable();
+	while (ipi_test_running)
+		cpu_relax();
+	local_irq_disable();
+
+	local_ipi_disable();
+}
+
+static void test_ipi_cpus(int argc, char **argv)
+{
+	uint64_t tb;
+	int i;
+
+	if (argc > 2)
+		report_abort("Unsupported argument: '%s'", argv[2]);
+
+	if (nr_cpus_present < 2) {
+		report_skip("Requires SMP (2 or more CPUs)");
+		return;
+	}
+
+	register_ipi(ipi_handler, NULL);
+
+	if (!start_all_cpus(ipi_fn))
+		report_abort("Failed to start secondary cpus");
+
+	for (i = 1; i < nr_cpus_online; i++)
+		send_ipi(cpus[i].server_no);
+
+	tb = get_tb();
+	while (nr_cpus_ipi < nr_cpus_online - 1) {
+		cpu_relax();
+		if (get_tb() - tb > tb_hz * 5)
+			report_abort("Secondaries failed to respond to IPIs");
+	}
+
+	send_ipi(cpus[1].server_no);
+
+	tb = get_tb();
+	while (nr_cpus_ipi < nr_cpus_online) {
+		cpu_relax();
+		if (get_tb() - tb > tb_hz * 5)
+			report_abort("Secondaries failed to respond to IPIs");
+	}
+
+	ipi_test_running = false;
+
+	stop_all_cpus();
+
+	assert(nr_cpus_ipi == nr_cpus_present);
+
+	unregister_ipi();
+
+	report(true, "IPI cpus");
+}
+
+static uint64_t time;
+static bool time_went_backward;
+
+static void check_and_record_time(void)
+{
+	uint64_t tb;
+	uint64_t t;
+	uint64_t old;
+
+	t = time;
+again:
+	barrier();
+	tb = get_tb();
+	asm volatile("1: ldarx %0,0,%1 ; cmpd %0,%2 ; bne 2f ; stdcx. %3,0,%1 ; bne- 1b; 2:" : "=&r"(old) : "r"(&time), "r"(t), "r"(tb) : "memory", "cr0");
+	assert(tb >= t);
+	if (old != t) {
+		t = old;
+		goto again;
+	}
+	if (old > tb)
+		time_went_backward = true;
+}
+
+static void update_time(int64_t tb_offset)
+{
+	uint64_t new_tb;
+
+	new_tb = get_tb() + tb_offset;
+	mtspr(SPR_TBU40, new_tb);
+	if ((get_tb() & 0xFFFFFF) < (new_tb & 0xFFFFFF)) {
+		new_tb += 0x1000000;
+		mtspr(SPR_TBU40, new_tb);
+	}
+}
+
+static void time_sync_fn(int cpu_id)
+{
+	uint64_t start = get_tb();
+
+	while (!time_went_backward && get_tb() - start < tb_hz*2) {
+		check_and_record_time();
+		cpu_relax();
+	}
+
+	while (!time_went_backward && get_tb() - start < tb_hz*2) {
+		check_and_record_time();
+		udelay(1);
+	}
+
+	if (machine_is_powernv()) {
+		while (!time_went_backward && get_tb() - start < tb_hz*2) {
+			check_and_record_time();
+			update_time(0x1234000000);
+			cpu_relax();
+			update_time(-0x1234000000);
+		}
+	}
+}
+
+static void test_time_sync(int argc, char **argv)
+{
+	if (argc > 2)
+		report_abort("Unsupported argument: '%s'", argv[2]);
+
+	if (nr_cpus_present < 2) {
+		report_skip("Requires SMP (2 or more CPUs)");
+		return;
+	}
+
+	time_went_backward = false;
+
+	if (!start_all_cpus(time_sync_fn))
+		report_abort("Failed to start secondary cpus");
+
+	time_sync_fn(-1);
+
+	stop_all_cpus();
+
+	report(!time_went_backward, "time sync");
+}
+
+static volatile bool relax_test_running = true;
+
+static int relax_loop_count[NR_CPUS];
+
+static void relax_fn(int cpu_id)
+{
+	volatile int i = 0;
+
+	while (relax_test_running) {
+		cpu_relax();
+		i++;
+	}
+
+	relax_loop_count[cpu_id] = i;
+}
+
+#define ITERS 1000000
+
+static void test_relax(int argc, char **argv)
+{
+	volatile int i;
+	int count;
+
+	if (argc > 2)
+		report_abort("Unsupported argument: '%s'", argv[2]);
+
+	if (nr_cpus_present < 2) {
+		report_skip("Requires SMP (2 or more CPUs)");
+		return;
+	}
+
+	if (!start_all_cpus(relax_fn))
+		report_abort("Failed to start secondary cpus");
+
+	for (i = 0; i < ITERS; i++)
+		;
+
+	relax_test_running = false;
+
+	stop_all_cpus();
+
+	count = 0;
+	for (i = 0; i < NR_CPUS; i++)
+		count += relax_loop_count[i];
+	if (count == 0)
+		count = 1;
+
+	report(true, "busy-loops on CPU:%d vs cpu_relax-loops on others %ld%%", smp_processor_id(), (long)ITERS * 100 / count);
+}
+
+static volatile bool pause_test_running = true;
+
+static int pause_loop_count[NR_CPUS];
+
+static void pause_fn(int cpu_id)
+{
+	volatile int i = 0;
+
+	while (pause_test_running) {
+		pause_short();
+		i++;
+	}
+
+	pause_loop_count[cpu_id] = i;
+}
+
+#define ITERS 1000000
+
+static void test_pause(int argc, char **argv)
+{
+	volatile int i;
+	int count;
+
+	if (argc > 2)
+		report_abort("Unsupported argument: '%s'", argv[2]);
+
+	if (!cpu_has_pause_short)
+		return;
+
+	if (nr_cpus_present < 2) {
+		report_skip("Requires SMP (2 or more CPUs)");
+		return;
+	}
+
+	if (!start_all_cpus(pause_fn))
+		report_abort("Failed to start secondary cpus");
+
+	for (i = 0; i < ITERS; i++)
+		;
+
+	pause_test_running = false;
+
+	stop_all_cpus();
+
+	count = 0;
+	for (i = 0; i < NR_CPUS; i++)
+		count += pause_loop_count[i];
+
+	report(true, "busy-loops on CPU:%d vs pause_short-loops on others %ld%%", smp_processor_id(), (long)ITERS * 100 / count);
+}
+
+struct {
+	const char *name;
+	void (*func)(int argc, char **argv);
+} hctests[] = {
+	{ "start_cpus", test_start_cpus },
+	{ "ipi_cpus", test_ipi_cpus },
+	{ "time_sync", test_time_sync },
+	{ "cpu_relax", test_relax },
+	{ "pause", test_pause },
+	{ NULL, NULL }
+};
+
+int main(int argc, char **argv)
+{
+	bool all;
+	int i;
+
+	all = argc == 1 || !strcmp(argv[1], "all");
+
+	report_prefix_push("smp");
+
+	for (i = 0; hctests[i].name != NULL; i++) {
+		if (all || strcmp(argv[1], hctests[i].name) == 0) {
+			report_prefix_push(hctests[i].name);
+			hctests[i].func(argc, argv);
+			report_prefix_pop();
+		}
+	}
+
+	report_prefix_pop();
+	return report_summary();
+}
diff --git a/powerpc/tm.c b/powerpc/tm.c
index 6b1ceeb6e..efbcf1f12 100644
--- a/powerpc/tm.c
+++ b/powerpc/tm.c
@@ -89,7 +89,7 @@ static void test_h_cede_tm(int argc, char **argv)
 	if (argc > 2)
 		report_abort("Unsupported argument: '%s'", argv[2]);
 
-	if (!start_all_cpus(halt, 0))
+	if (!start_all_cpus(halt))
 		report_abort("Failed to start secondary cpus");
 
 	if (!enable_tm())
@@ -133,7 +133,7 @@ int main(int argc, char **argv)
 		report_skip("TM is not available");
 		goto done;
 	}
-	report(cpus_with_tm == nr_cpus,
+	report(cpus_with_tm == nr_cpus_present,
 	       "TM available in all 'ibm,pa-features' properties");
 
 	all = argc == 1 || !strcmp(argv[1], "all");
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 9fdc86b66..ddce409a8 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -74,6 +74,14 @@ file = emulator.elf
 [interrupts]
 file = interrupts.elf
 
+[smp]
+file = smp.elf
+smp = 2
+
+[smp-smt]
+file = smp.elf
+smp = 8,threads=4
+
 [h_cede_tm]
 file = tm.elf
 machine = pseries
-- 
2.42.0

