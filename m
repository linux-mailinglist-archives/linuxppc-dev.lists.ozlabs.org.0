Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F32A48159B8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 15:05:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OvFewJcu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ssnsg4r0bz3cSY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 01:05:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OvFewJcu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnQW5c5hz3cWR
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:45:07 +1100 (AEDT)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7b771176f80so113044039f.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734304; x=1703339104; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUxdWUEeUS7YbGCkPwCZCxccHaPmqiH0f1Oqr+oPpYw=;
        b=OvFewJcuitcSOD/hX7DBVFlD/nSfA/z+5z40rOAVrcpO5qFFs8mVE+/b4bcp4p0awN
         IhW3IuIdUW4TklJsbRJRd7iH1ucQIIRrLvgFEEPTLFbhZnxd/CUGbPp23itk5+lGGh3k
         i8orYpkLm+MuESOoXDbTvZvpwjIL3V0VQ0PTlao4Vi92RLY58mtZVmFQwlk8Iof38hEU
         0o9xss+LDJAe4dOiSnDMHLt5oTF2Tm4+7Mav6/v5IQvu0D2HCNTIVW8kfVZrDs8g5AkT
         oIHcf9BVF4lWFDqrb5nZ3Op4AtdHgDPZDr+nalxT/hV/4QGd/0JGlJopgTz8DNOLvmDR
         XmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734304; x=1703339104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUxdWUEeUS7YbGCkPwCZCxccHaPmqiH0f1Oqr+oPpYw=;
        b=jWBk0H7zHVIqDBTuYHE3GQtpba89nbTwoPniF8MNHJwBIzwOgN4k7hdJpdLmSnIe/q
         b79usaUVJF2DlK7vATNec+m8U1fFHA2r6qzWppcWOCPMFXw05ubD48XU0M1mCmFnFz3n
         XmXd8jEp/xk7GlXmOCKhsjN83+/wscuNuh14TimedN66m+mFct42kS6ZrZbyNG8fjHr+
         smttv+rlE5VG8n3kl37ep8n/2nw80aqd9xiRraUuokFgTFm4yWoi/zmjdw5luj/FkLyB
         OlmUwwb0xGqraRw/vOqnB9LtAkJOTcg2v/84Xv7X4dJ5uRy5yCSsyis3sdYtfhYBg3oo
         ecOQ==
X-Gm-Message-State: AOJu0YylSbm6DC1B3VF+KviFN+ZByiTb3dmxIHdlUc30Kf8coecy1qL8
	GqD/rp3x0RgPI4rVxJU7BUo=
X-Google-Smtp-Source: AGHT+IFvrnLPi67rwkf6o7zfJuGLq5oR3zSYglnytu/eMPyE5gK+4UQOGLtd6i+Q1Ng4QdjiWUgwMQ==
X-Received: by 2002:a05:6e02:18cc:b0:35d:6a39:faeb with SMTP id s12-20020a056e0218cc00b0035d6a39faebmr22311178ilu.10.1702734304489;
        Sat, 16 Dec 2023 05:45:04 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:45:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 26/29] powerpc: add SMP and IPI support
Date: Sat, 16 Dec 2023 23:42:53 +1000
Message-ID: <20231216134257.1743345-27-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231216134257.1743345-1-npiggin@gmail.com>
References: <20231216134257.1743345-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc SMP support is very primitive and does not set up a first-class
runtime environment for secondary CPUs.

This adds more complete support for a C environment and interrupt
handling, as well as IPI support.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/processor.h |   6 +
 lib/powerpc/asm/setup.h     |   3 +-
 lib/powerpc/asm/smp.h       |  23 ++--
 lib/powerpc/setup.c         |  37 +++--
 lib/powerpc/smp.c           | 264 ++++++++++++++++++++++++++++++++----
 lib/ppc64/asm/atomic.h      |   6 +
 lib/ppc64/asm/opal.h        |   5 +
 powerpc/Makefile.common     |   1 +
 powerpc/cstart64.S          |  46 +++++++
 powerpc/interrupts.c        |  10 --
 powerpc/smp.c               | 221 ++++++++++++++++++++++++++++++
 powerpc/tm.c                |   2 +-
 powerpc/unittests.cfg       |   8 ++
 13 files changed, 570 insertions(+), 62 deletions(-)
 create mode 100644 lib/ppc64/asm/atomic.h
 create mode 100644 powerpc/smp.c

diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index 6368a9ee..924451da 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -15,6 +15,7 @@ void do_handle_exception(struct pt_regs *regs);
 #define SPR_SPRG1	0x111
 #define SPR_SPRG2	0x112
 #define SPR_SPRG3	0x113
+#define SPR_TBU40	0x11e
 
 static inline uint64_t mfspr(int nr)
 {
@@ -53,6 +54,11 @@ static inline bool machine_is_powernv(void)
 	return !!(mfmsr() & (1ULL << MSR_HV_BIT));
 }
 
+static inline uint64_t smp_processor_id(void)
+{
+	return mfspr(SPR_SPRG2);
+}
+
 static inline uint64_t get_tb(void)
 {
 	return mfspr(SPR_TB);
diff --git a/lib/powerpc/asm/setup.h b/lib/powerpc/asm/setup.h
index cc7cf5e2..c0d892da 100644
--- a/lib/powerpc/asm/setup.h
+++ b/lib/powerpc/asm/setup.h
@@ -8,9 +8,10 @@
 #include <libcflat.h>
 
 #define NR_CPUS			8	/* arbitrarily set for now */
-extern u32 cpus[NR_CPUS];
 extern int nr_cpus;
 
+#define EXCEPTION_STACK_SIZE	(32*1024) /* 32kB */
+
 extern uint64_t tb_hz;
 
 #define NR_MEM_REGIONS		8
diff --git a/lib/powerpc/asm/smp.h b/lib/powerpc/asm/smp.h
index 21940b4b..163bbeec 100644
--- a/lib/powerpc/asm/smp.h
+++ b/lib/powerpc/asm/smp.h
@@ -3,20 +3,21 @@
 
 #include <libcflat.h>
 
-extern int nr_threads;
+typedef void (*secondary_entry_fn)(int cpu_id);
 
-struct start_threads {
-	int nr_threads;
-	int nr_started;
-};
+extern void halt(int cpu_id);
 
-typedef void (*secondary_entry_fn)(void);
+extern bool start_all_cpus(secondary_entry_fn entry);
+extern void stop_all_cpus(void);
 
-extern void halt(void);
+struct pt_regs;
+void register_ipi(void (*fn)(struct pt_regs *, void *), void *data);
+void unregister_ipi(void);
+void cpu_init_ipis(void);
+void local_ipi_enable(void);
+void local_ipi_disable(void);
+void send_ipi(int cpu_id);
 
-extern int start_thread(int cpu_id, secondary_entry_fn entry, uint32_t r3);
-extern struct start_threads start_cpu(int cpu_node, secondary_entry_fn entry,
-				      uint32_t r3);
-extern bool start_all_cpus(secondary_entry_fn entry, uint32_t r3);
+extern int nr_cpus_online;
 
 #endif /* _ASMPOWERPC_SMP_H_ */
diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
index 2b7e27b0..41830ead 100644
--- a/lib/powerpc/setup.c
+++ b/lib/powerpc/setup.c
@@ -17,6 +17,7 @@
 #include <alloc_phys.h>
 #include <argv.h>
 #include <asm/setup.h>
+#include <asm/smp.h>
 #include <asm/page.h>
 #include <asm/ptrace.h>
 #include <asm/processor.h>
@@ -28,7 +29,7 @@ extern unsigned long stacktop;
 char *initrd;
 u32 initrd_size;
 
-u32 cpus[NR_CPUS] = { [0 ... NR_CPUS-1] = (~0U) };
+u32 cpu_to_hwid[NR_CPUS] = { [0 ... NR_CPUS-1] = (~0U) };
 int nr_cpus;
 uint64_t tb_hz;
 
@@ -42,23 +43,31 @@ struct cpu_set_params {
 	uint64_t tb_hz;
 };
 
-#define EXCEPTION_STACK_SIZE	(32*1024) /* 32kB */
-
-static char exception_stack[NR_CPUS][EXCEPTION_STACK_SIZE];
+static char boot_exception_stack[EXCEPTION_STACK_SIZE];
 
 static void cpu_set(int fdtnode, u64 regval, void *info)
 {
+	const struct fdt_property *prop;
+	u32 *threads;
 	static bool read_common_info = false;
 	struct cpu_set_params *params = info;
-	int cpu = nr_cpus++;
+	int nr_threads;
+	int len, i;
 
-	assert_msg(cpu < NR_CPUS, "Number cpus exceeds maximum supported (%d).", NR_CPUS);
+	/* Get the id array of threads on this node */
+	prop = fdt_get_property(dt_fdt(), fdtnode,
+				"ibm,ppc-interrupt-server#s", &len);
+	assert(prop);
 
-	cpus[cpu] = regval;
+	nr_threads = len >> 2; /* Divide by 4 since 4 bytes per thread */
+	threads = (u32 *)prop->data; /* Array of valid ids */
+
+	assert_msg(nr_cpus + nr_threads <= NR_CPUS, "Number cpus exceeds maximum supported (%d).", NR_CPUS);
+
+	for (i = 0; i < nr_threads; i++) {
+		cpu_to_hwid[nr_cpus++] = fdt32_to_cpu(threads[i]);
+	}
 
-	/* set exception stack address for this CPU (in SPGR0) */
-	asm volatile ("mtsprg0 %[addr]" ::
-		      [addr] "r" (exception_stack[cpu + 1]));
 
 	if (!read_common_info) {
 		const struct fdt_property *prop;
@@ -161,6 +170,10 @@ void setup(const void *fdt)
 	u32 fdt_size;
 	int ret;
 
+	/* set exception stack address for this CPU (in SPGR0) */
+	asm volatile ("mtsprg0 %[addr]" :: [addr] "r" (boot_exception_stack +
+							EXCEPTION_STACK_SIZE));
+
 	enable_mcheck();
 
 	/*
@@ -202,6 +215,10 @@ void setup(const void *fdt)
 
 	assert(STACK_INT_FRAME_SIZE % 16 == 0);
 
+	mtspr(SPR_SPRG2, fdt_boot_cpuid_phys(dt_fdt()));
+
+	cpu_init_ipis();
+
 	/* call init functions */
 	cpu_init();
 
diff --git a/lib/powerpc/smp.c b/lib/powerpc/smp.c
index afe43617..96e3219a 100644
--- a/lib/powerpc/smp.c
+++ b/lib/powerpc/smp.c
@@ -6,55 +6,250 @@
  * This work is licensed under the terms of the GNU LGPL, version 2.
  */
 
+#include <alloc.h>
 #include <devicetree.h>
+#include <asm/atomic.h>
+#include <asm/barrier.h>
+#include <asm/processor.h>
 #include <asm/setup.h>
+#include <asm/opal.h>
+#include <asm/hcall.h>
 #include <asm/rtas.h>
 #include <asm/smp.h>
 
-int nr_threads;
+struct start_threads {
+	int nr_threads;
+	int nr_started;
+};
 
 struct secondary_entry_data {
 	secondary_entry_fn entry;
-	uint64_t r3;
 	int nr_started;
 };
 
+struct cpu {
+	uint64_t server_no;
+	unsigned long stack;
+	unsigned long exception_stack;
+	secondary_entry_fn entry;
+} __attribute__((packed)); /* used by asm */
+
+int nr_cpus_online = 1;
+
+struct cpu start_secondary_cpus[NR_CPUS];
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
+	asm volatile ("mtsprg0 %[addr]" :: [addr] "r" (cpu->exception_stack +
+							EXCEPTION_STACK_SIZE));
+	mtspr(SPR_SPRG2, cpu->server_no);
+
+	enable_mcheck();
+
+	cpu_init_ipis();
+
+	atomic_fetch_inc(&nr_cpus_online);
+
+	cpu->entry(cpu->server_no);
+
+	atomic_fetch_dec(&nr_cpus_online);
+
+	stop_self(cpu->server_no);
+}
+
+#define OPAL_START_CPU				41
+#define OPAL_QUERY_CPU_STATUS			42
+#define OPAL_RETURN_CPU				69
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
+	if (!machine_is_powernv()) {
+		hcall(H_CPPR, 5);
+	}
+}
+
+void local_ipi_disable(void)
+{
+	if (!machine_is_powernv()) {
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
+static int nr_started = 0;
+extern void start_secondary(uint64_t server_no); /* asm entry point */
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
 
-	ret = rtas_token("query-cpu-stopped-state", &query_token);
-	assert(ret == 0);
-	ret = rtas_token("start-cpu", &start_token);
-	assert(ret == 0);
+	cpu = &start_secondary_cpus[nr_started];
+	nr_started++;
 
-	ret = rtas_call(query_token, 1, 2, outputs, cpu_id);
-	if (ret) {
-		printf("query-cpu-stopped-state failed for cpu %d\n", cpu_id);
-	} else if (!outputs[0]) { /* cpu in stopped state */
-		ret = rtas_call(start_token, 3, 1, NULL, cpu_id, entry, r3);
-		if (ret)
+	cpu->server_no = cpu_id;
+	if (cpu_id == smp_processor_id()) {
+		/* Boot CPU already started */
+		return -1;
+	}
+
+	cpu->stack = (unsigned long)memalign(4096, 64*1024);
+	cpu->stack += 64*1024 - 64;
+	cpu->exception_stack = (unsigned long)memalign(4096, EXCEPTION_STACK_SIZE);
+	cpu->entry = entry;
+
+	if (machine_is_powernv()) {
+		int64_t ret;
+		uint8_t status;
+
+		ret = opal_call(OPAL_QUERY_CPU_STATUS, cpu_id, (unsigned long)&status, 0);
+		if (ret != OPAL_SUCCESS) {
+			printf("OPAL_QUERY_CPU_STATUS failed for cpu %d\n", cpu_id);
+			return -1;
+		}
+		if (status != OPAL_THREAD_INACTIVE) {
+			printf("cpu %d not in stopped state\n", cpu_id);
+			return -1;
+		}
+		if (opal_call(OPAL_START_CPU, cpu_id, (unsigned long)start_secondary, 0) != OPAL_SUCCESS) {
 			printf("failed to start cpu %d\n", cpu_id);
-	} else { /* cpu not in stopped state */
-		ret = outputs[0];
+			return -1;
+		}
+	} else {
+		uint32_t query_token, start_token;
+		int outputs[1], ret;
+
+		ret = rtas_token("query-cpu-stopped-state", &query_token);
+		assert(ret == 0);
+		ret = rtas_token("start-cpu", &start_token);
+		assert(ret == 0);
+
+		ret = rtas_call(query_token, 1, 2, outputs, cpu_id);
+		if (ret) {
+			printf("query-cpu-stopped-state failed for cpu %d\n", cpu_id);
+			return ret;
+		}
+		if (outputs[0]) { /* cpu not in stopped state */
+			ret = outputs[0];
+			printf("cpu %d not in stopped state\n", cpu_id);
+			return ret;
+		}
+		ret = rtas_call(start_token, 3, 1, NULL, cpu_id, start_secondary, cpu_id);
+		if (ret) {
+			printf("failed to start cpu %d\n", cpu_id);
+			return ret;
+		}
 	}
 
-	return ret;
+	return 0;
 }
 
+static int nr_cpus_present;
+
 /*
  * Start all stopped threads (vcpus) on cpu_node
  * Returns: Number of stopped cpus which were successfully started
  */
-struct start_threads start_cpu(int cpu_node, secondary_entry_fn entry,
-			       uint32_t r3)
+static int start_core(int cpu_node, secondary_entry_fn entry)
 {
 	int len, i, nr_threads, nr_started = 0;
 	const struct fdt_property *prop;
@@ -66,23 +261,23 @@ struct start_threads start_cpu(int cpu_node, secondary_entry_fn entry,
 	assert(prop);
 
 	nr_threads = len >> 2; /* Divide by 4 since 4 bytes per thread */
+	nr_cpus_present += nr_threads;
+
 	threads = (u32 *)prop->data; /* Array of valid ids */
 
 	for (i = 0; i < nr_threads; i++) {
-		if (!start_thread(fdt32_to_cpu(threads[i]), entry, r3))
+		if (!start_thread(fdt32_to_cpu(threads[i]), entry))
 			nr_started++;
 	}
 
-	return (struct start_threads) { nr_threads, nr_started };
+	return nr_started;
 }
 
 static void start_each_secondary(int fdtnode, u64 regval __unused, void *info)
 {
 	struct secondary_entry_data *datap = info;
-	struct start_threads ret = start_cpu(fdtnode, datap->entry, datap->r3);
 
-	nr_threads += ret.nr_threads;
-	datap->nr_started += ret.nr_started;
+	datap->nr_started += start_core(fdtnode, datap->entry);
 }
 
 /*
@@ -91,14 +286,25 @@ static void start_each_secondary(int fdtnode, u64 regval __unused, void *info)
  * Returns:	TRUE on success
  *		FALSE on failure
  */
-bool start_all_cpus(secondary_entry_fn entry, uint32_t r3)
+bool start_all_cpus(secondary_entry_fn entry)
 {
-	struct secondary_entry_data data = { entry, r3,	0 };
+	struct secondary_entry_data data = { entry, 0 };
 	int ret;
 
+	memset(start_secondary_cpus, 0xff, sizeof(start_secondary_cpus));
+
+	assert(nr_cpus_online == 1);
+
+	nr_started = 0;
+	nr_cpus_present = 0;
 	ret = dt_for_each_cpu_node(start_each_secondary, &data);
 	assert(ret == 0);
 
-	/* We expect that we come in with one thread already started */
-	return data.nr_started == nr_threads - 1;
+	return 1;
+}
+
+void stop_all_cpus(void)
+{
+	while (nr_cpus_online > 1)
+		cpu_relax();
 }
diff --git a/lib/ppc64/asm/atomic.h b/lib/ppc64/asm/atomic.h
new file mode 100644
index 00000000..0f461b9c
--- /dev/null
+++ b/lib/ppc64/asm/atomic.h
@@ -0,0 +1,6 @@
+#ifndef _POWERPC_ATOMIC_H_
+#define _POWERPC_ATOMIC_H_
+
+#include "asm-generic/atomic.h"
+
+#endif /* _POWERPC_ATOMIC_H_ */
diff --git a/lib/ppc64/asm/opal.h b/lib/ppc64/asm/opal.h
index 7b1299f7..ce6dbb16 100644
--- a/lib/ppc64/asm/opal.h
+++ b/lib/ppc64/asm/opal.h
@@ -2,14 +2,19 @@
 #ifndef _ASMPPC64_HCALL_H_
 #define _ASMPPC64_HCALL_H_
 
+#include <stdint.h>
+
 #define OPAL_SUCCESS				0
 
 #define OPAL_CONSOLE_WRITE			1
 #define OPAL_CONSOLE_READ			2
 #define OPAL_CEC_POWER_DOWN			5
 #define OPAL_POLL_EVENTS			10
+#define OPAL_RETURN_CPU				69
 #define OPAL_REINIT_CPUS			70
 # define OPAL_REINIT_CPUS_HILE_BE		(1 << 0)
 # define OPAL_REINIT_CPUS_HILE_LE		(1 << 1)
 
+int64_t opal_call(int64_t token, int64_t arg1, int64_t arg2, int64_t arg3);
+
 #endif
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index b340a53b..f9dd937a 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -11,6 +11,7 @@ tests-common = \
 	$(TEST_DIR)/rtas.elf \
 	$(TEST_DIR)/emulator.elf \
 	$(TEST_DIR)/tm.elf \
+	$(TEST_DIR)/smp.elf \
 	$(TEST_DIR)/sprs.elf \
 	$(TEST_DIR)/interrupts.elf
 
diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
index 51d632da..57edd0ae 100644
--- a/powerpc/cstart64.S
+++ b/powerpc/cstart64.S
@@ -128,6 +128,52 @@ start:
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
+	LOAD_REG_ADDR(r9, start_secondary_cpus)
+	li	r8,0
+	li	r7,0
+1:	ldx	r6,r9,r7
+	cmpd	r6,r3
+	beq	2f
+	addi	r7,r7,32 /* sizeof (struct cpu) */
+	addi	r8,r8,1
+	cmpdi	r8,16 /* MAX_CPUS */
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
+	/* Create entry frame */
+	stdu	r1,-INT_FRAME_SIZE(r1)
+
+	bl	main_secondary
+	bl	exit
+	b	halt
+
 .align 3
 p_stack:	.llong  stackptr
 p_toc:		.llong  tocptr
diff --git a/powerpc/interrupts.c b/powerpc/interrupts.c
index 3217b15e..14805d76 100644
--- a/powerpc/interrupts.c
+++ b/powerpc/interrupts.c
@@ -12,16 +12,6 @@
 #include <asm/processor.h>
 #include <asm/barrier.h>
 
-#define SPR_LPCR	0x13E
-#define LPCR_HDICE	0x1UL
-#define SPR_DEC		0x016
-#define SPR_HDEC	0x136
-
-#define MSR_DR		0x0010ULL
-#define MSR_IR		0x0020ULL
-#define MSR_EE		0x8000ULL
-#define MSR_ME		0x1000ULL
-
 static bool cpu_has_heir(void)
 {
 	uint32_t pvr = mfspr(287);	/* Processor Version Register */
diff --git a/powerpc/smp.c b/powerpc/smp.c
new file mode 100644
index 00000000..b0a99069
--- /dev/null
+++ b/powerpc/smp.c
@@ -0,0 +1,221 @@
+/*
+ * This work is licensed under the terms of the GNU LGPL, version 2.
+ * SMP Tests
+ */
+#include <libcflat.h>
+#include <asm/atomic.h>
+#include <asm/barrier.h>
+#include <asm/processor.h>
+#include <asm/smp.h>
+#include <asm/setup.h>
+#include <asm/ppc_asm.h>
+#include <devicetree.h>
+
+static volatile int nr_cpus_started;
+static volatile int secondary_cpu_id;
+
+static void start_fn(int cpu_id)
+{
+	atomic_fetch_inc(&nr_cpus_started);
+}
+
+static void test_start_cpus(int argc, char **argv)
+{
+	if (argc > 2)
+		report_abort("Unsupported argument: '%s'", argv[2]);
+
+	nr_cpus_started = 1;
+	if (!start_all_cpus(start_fn))
+		report_abort("Failed to start secondary cpus");
+
+	while (nr_cpus_started < nr_cpus)
+		cpu_relax();
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
+static void local_irq_enable(void)
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
+static void local_irq_disable(void)
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
+static volatile bool ipi_test_running = true;
+
+static void ipi_fn(int cpu_id)
+{
+	local_ipi_enable();
+
+	secondary_cpu_id = cpu_id;
+	atomic_fetch_inc(&nr_cpus_started);
+	mtspr(SPR_DEC, 0x7fffffff);
+	local_irq_enable();
+	while (ipi_test_running)
+		cpu_relax();
+	local_irq_disable();
+
+	local_ipi_disable();
+	atomic_fetch_dec(&nr_cpus_started);
+}
+
+static void test_ipi_cpus(int argc, char **argv)
+{
+	if (argc > 2)
+		report_abort("Unsupported argument: '%s'", argv[2]);
+
+	register_ipi(ipi_handler, NULL);
+
+	nr_cpus_started = 1;
+	if (!start_all_cpus(ipi_fn))
+		report_abort("Failed to start secondary cpus");
+
+	while (nr_cpus_started < nr_cpus)
+		cpu_relax();
+
+	send_ipi(secondary_cpu_id);
+
+	while (nr_cpus_ipi < 1)
+		cpu_relax();
+
+	send_ipi(secondary_cpu_id);
+
+	while (nr_cpus_ipi < 2)
+		cpu_relax();
+
+	ipi_test_running = false;
+
+	while (nr_cpus_started > 1)
+		cpu_relax();
+
+	msleep(1000);
+
+	stop_all_cpus();
+
+	assert(nr_cpus_ipi == 2);
+
+	unregister_ipi();
+
+	report(true, "IPI cpus");
+}
+
+static uint64_t time;
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
+	assert(old <= tb);
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
+	while (get_tb() - start < tb_hz*3) {
+		check_and_record_time();
+		update_time(0x1234000000);
+		cpu_relax();
+		update_time(-0x1234000000);
+		udelay(1);
+	}
+}
+
+static void test_time_sync(int argc, char **argv)
+{
+	if (argc > 2)
+		report_abort("Unsupported argument: '%s'", argv[2]);
+
+	if (!machine_is_powernv()) {
+		report_skip("requires powernv");
+		return;
+	}
+
+	if (!start_all_cpus(time_sync_fn))
+		report_abort("Failed to start secondary cpus");
+
+	time_sync_fn(-1);
+
+	stop_all_cpus();
+
+	report(true, "time sync");
+}
+
+struct {
+	const char *name;
+	void (*func)(int argc, char **argv);
+} hctests[] = {
+	{ "start_cpus", test_start_cpus },
+	{ "ipi_cpus", test_ipi_cpus },
+	{ "time_sync", test_time_sync },
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
index 7fa91636..84ab3dc9 100644
--- a/powerpc/tm.c
+++ b/powerpc/tm.c
@@ -88,7 +88,7 @@ static void test_h_cede_tm(int argc, char **argv)
 	if (argc > 2)
 		report_abort("Unsupported argument: '%s'", argv[2]);
 
-	if (!start_all_cpus(halt, 0))
+	if (!start_all_cpus(halt))
 		report_abort("Failed to start secondary cpus");
 
 	if (!enable_tm())
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 1ae9a00e..727712bb 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -72,6 +72,14 @@ file = emulator.elf
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

