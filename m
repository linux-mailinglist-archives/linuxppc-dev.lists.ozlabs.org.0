Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F70587F971
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:22:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IQCuiW7k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPqG6wkTz776T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:22:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IQCuiW7k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c30; helo=mail-oo1-xc30.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPLx61Sqz3vfb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:01:45 +1100 (AEDT)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5a47abe2ff7so2046510eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835303; x=1711440103; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4V9DMm5uSUsFZwShNvLzFyDowiDRUN/JREmEJLYYvh4=;
        b=IQCuiW7kON66KRvf+L0vvsEiWHcnjCyzTUagfgb/I3lEyXp2CHkk8JrEGBsBhQ7kUm
         4x3umogBv+Hse5UyvqzWEw2a4XqtXf/YT8x5H2bAC0CMEAkVnDVgCGPHvcoGV672wMMm
         6X4+8RSlWz80fdPT6KmmbxPjgJA1YTlI3jXxlz80M+DMqhRRMawmj1JsBhWVHvC6BnFK
         uHeXoey9JpPWBJpavYYNhTB4hqDVqg3rjJMrGjkxkA891gy7ROFRsWUpCeqHj5nzh9Ei
         qzR2I+qxgQFRoQAnVS06bdlLfzXR69oR2OezqU3NsqcIA1sm0dfzwbHF/i1pXMcM99qS
         V8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835303; x=1711440103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4V9DMm5uSUsFZwShNvLzFyDowiDRUN/JREmEJLYYvh4=;
        b=JTo3i0jnmLCf9GgFTbfok/OimlngazVseTH53VxkFVNNzlIKqEj6uCdvD4Lg4X5avZ
         BzeBBmZOibDvOsP7DWFpBwlwtpfiHUxJ1FSU2JPOSE+qs0+uKeC5e5UwpLiQW4kFqDwe
         0nO1BruA/+BTqulYHxFCC24Jp22T1O89EFa884IQkeU8ih20HfnaTHzfT39LN5gDE6zT
         lPpnkhMTlBCJs3kd0Fgo9U1bblsGDI/rhTaY7dtBANoJGQyj8RGcdOggu0sdsjGpGYGQ
         I+UElnWySjosIqAGj0TzyVJYAYT0Fkc6sgfUUONwiYyURf5ObzvUK5rXgsZRinSQQjJb
         Im4A==
X-Forwarded-Encrypted: i=1; AJvYcCXwdpIzJsAftVSPI/PxUdCG9QMSse3/U+svmkFCZbIerJVD6ggbhVDUxKyPhc+1UUehVbVNQ2WzqFKMxu5nn7+Jnvf/q/n48Be8cbls+A==
X-Gm-Message-State: AOJu0YzuJn26tn4Gdi1WUA1G2o49lgLXadqvDu5wHkjM5cry9+DaggAH
	JKRFdDOJm4hR4RfRiM44aU1ZgFSyKnyZGyCEqgNUOEUgoIv9p6kPM80fdpeQeEY=
X-Google-Smtp-Source: AGHT+IEt+NscoRi6n00XI5VhxDOMyWtBlUHhlXL3LXHFPBG6XVtQ3ppVYZJ8b1XdLMEXBihI+PjOIQ==
X-Received: by 2002:a05:6358:64a0:b0:176:99f3:8d11 with SMTP id g32-20020a05635864a000b0017699f38d11mr8312869rwh.32.1710835302950;
        Tue, 19 Mar 2024 01:01:42 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.01.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:01:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 31/35] powerpc: add usermode support
Date: Tue, 19 Mar 2024 17:59:22 +1000
Message-ID: <20240319075926.2422707-32-npiggin@gmail.com>
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

The biggest difficulty for user mode is MMU support. Otherwise it is
a simple matter of setting and clearing MSR[PR] with rfid and sc
respectively.

Some common harness operations will fail in usermode, so some workarounds
are reqiured (e.g., puts() can't be used directly).

A usermode privileged instruction interrupt test is added.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/processor.h |  9 +++++++++
 lib/powerpc/asm/reg.h       |  1 +
 lib/powerpc/asm/smp.h       |  1 +
 lib/powerpc/io.c            |  7 +++++++
 lib/powerpc/processor.c     | 38 +++++++++++++++++++++++++++++++++++++
 lib/powerpc/rtas.c          |  3 +++
 lib/powerpc/setup.c         |  8 ++++++--
 lib/powerpc/spinlock.c      |  4 ++++
 lib/ppc64/mmu.c             |  2 ++
 powerpc/interrupts.c        | 28 +++++++++++++++++++++++++++
 10 files changed, 99 insertions(+), 2 deletions(-)

diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index d348239c5..749155696 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -19,6 +19,8 @@ extern bool cpu_has_prefix;
 extern bool cpu_has_sc_lev;
 extern bool cpu_has_pause_short;
 
+bool in_usermode(void);
+
 static inline uint64_t mfspr(int nr)
 {
 	uint64_t ret;
@@ -51,6 +53,8 @@ static inline void local_irq_enable(void)
 {
 	unsigned long msr;
 
+	assert(!in_usermode());
+
 	asm volatile(
 "		mfmsr	%0		\n \
 		ori	%0,%0,%1	\n \
@@ -62,6 +66,8 @@ static inline void local_irq_disable(void)
 {
 	unsigned long msr;
 
+	assert(!in_usermode());
+
 	asm volatile(
 "		mfmsr	%0		\n \
 		andc	%0,%0,%1	\n \
@@ -90,4 +96,7 @@ static inline bool machine_is_pseries(void)
 void enable_mcheck(void);
 void disable_mcheck(void);
 
+void enter_usermode(void);
+void exit_usermode(void);
+
 #endif /* _ASMPOWERPC_PROCESSOR_H_ */
diff --git a/lib/powerpc/asm/reg.h b/lib/powerpc/asm/reg.h
index b2fab4313..69ef21adb 100644
--- a/lib/powerpc/asm/reg.h
+++ b/lib/powerpc/asm/reg.h
@@ -58,5 +58,6 @@
 #define MSR_SE		UL(0x0400)		/* Single Step Enable */
 #define MSR_EE		UL(0x8000)
 #define MSR_ME		UL(0x1000)
+#define MSR_PR		UL(0x4000)
 
 #endif
diff --git a/lib/powerpc/asm/smp.h b/lib/powerpc/asm/smp.h
index 820c05e9e..b96a55903 100644
--- a/lib/powerpc/asm/smp.h
+++ b/lib/powerpc/asm/smp.h
@@ -11,6 +11,7 @@ struct cpu {
 	unsigned long server_no;
 	unsigned long stack;
 	unsigned long exception_stack;
+	bool in_user;
 	secondary_entry_fn entry;
 	pgd_t *pgtable;
 } __attribute__((packed)); /* used by asm */
diff --git a/lib/powerpc/io.c b/lib/powerpc/io.c
index cb7f2f050..5c2810884 100644
--- a/lib/powerpc/io.c
+++ b/lib/powerpc/io.c
@@ -11,6 +11,7 @@
 #include <asm/setup.h>
 #include <asm/processor.h>
 #include <asm/atomic.h>
+#include <asm/smp.h>
 #include "io.h"
 
 static struct spinlock print_lock;
@@ -41,10 +42,16 @@ void io_init(void)
 
 void puts(const char *s)
 {
+	bool user = in_usermode();
+
+	if (user)
+		exit_usermode();
 	spin_lock(&print_lock);
 	while (*s)
 		putchar(*s++);
 	spin_unlock(&print_lock);
+	if (user)
+		enter_usermode();
 }
 
 /*
diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
index 09f6bb9d8..6c3000d5c 100644
--- a/lib/powerpc/processor.c
+++ b/lib/powerpc/processor.c
@@ -47,6 +47,8 @@ void do_handle_exception(struct pt_regs *regs)
 	unsigned char v;
 
 	__current_cpu = (struct cpu *)mfspr(SPR_SPRG0);
+	if (in_usermode())
+		current_cpu()->in_user = false;
 
 	/*
 	 * We run with AIL=0, so interrupts taken with MMU disabled.
@@ -60,6 +62,8 @@ void do_handle_exception(struct pt_regs *regs)
 
 	if (v < 128 && handlers[v].func) {
 		handlers[v].func(regs, handlers[v].data);
+		if (regs->msr & MSR_PR)
+			current_cpu()->in_user = true;
 		return;
 	}
 
@@ -169,3 +173,37 @@ void disable_mcheck(void)
 {
 	rfid_msr(mfmsr() & ~MSR_ME);
 }
+
+bool in_usermode(void)
+{
+	return current_cpu()->in_user;
+}
+
+static void usermode_sc_handler(struct pt_regs *regs, void *data)
+{
+	regs->msr &= ~(MSR_PR|MSR_EE);
+	/* Interrupt return handler will keep in_user clear */
+}
+
+void enter_usermode(void)
+{
+	assert_msg(!in_usermode(), "enter_usermode called with in_usermode");
+	/* mfmsr would fault in usermode anyway */
+	assert_msg(!(mfmsr() & MSR_PR), "enter_usermode called from user mode");
+	assert_msg(!(mfmsr() & MSR_EE), "enter_usermode called with interrupts enabled");
+	assert_msg((mfmsr() & (MSR_IR|MSR_DR)) == (MSR_IR|MSR_DR),
+		"enter_usermode called with virtual memory disabled");
+
+	handle_exception(0xc00, usermode_sc_handler, NULL);
+	rfid_msr(mfmsr() | (MSR_PR|MSR_IR|MSR_DR|MSR_EE));
+	current_cpu()->in_user = true;
+}
+
+void exit_usermode(void)
+{
+	assert_msg(in_usermode(), "enter_usermode called with !in_usermode");
+	asm volatile("sc 0" ::: "memory");
+	handle_exception(0xc00, NULL, NULL);
+	assert(!in_usermode());
+	assert(!(mfmsr() & MSR_PR));
+}
diff --git a/lib/powerpc/rtas.c b/lib/powerpc/rtas.c
index b477a38e0..9c1e0affc 100644
--- a/lib/powerpc/rtas.c
+++ b/lib/powerpc/rtas.c
@@ -9,6 +9,7 @@
 #include <libfdt/libfdt.h>
 #include <devicetree.h>
 #include <asm/spinlock.h>
+#include <asm/smp.h>
 #include <asm/hcall.h>
 #include <asm/io.h>
 #include <asm/rtas.h>
@@ -137,6 +138,8 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 	va_list list;
 	int ret;
 
+	assert_msg(!in_usermode(), "May not make RTAS call from user mode\n");
+
 	spin_lock(&rtas_lock);
 
 	va_start(list, outputs);
diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
index ba659cc2b..30b988a5c 100644
--- a/lib/powerpc/setup.c
+++ b/lib/powerpc/setup.c
@@ -201,8 +201,11 @@ void cpu_init(struct cpu *cpu, int cpu_id)
 	cpu->exception_stack = (unsigned long)memalign(SZ_4K, SZ_64K);
 	cpu->exception_stack += SZ_64K - 64;
 	cpu->pgtable = NULL;
+	cpu->in_user = false;
 }
 
+bool is_hvmode;
+
 void setup(const void *fdt)
 {
 	void *freemem = &stacktop;
@@ -211,8 +214,6 @@ void setup(const void *fdt)
 	u32 fdt_size;
 	int ret;
 
-	cpu_has_hv = !!(mfmsr() & (1ULL << MSR_HV_BIT));
-
 	memset(cpus, 0xff, sizeof(cpus));
 
 	cpu = &cpus[0];
@@ -220,10 +221,13 @@ void setup(const void *fdt)
 	cpu->exception_stack = (unsigned long)boot_exception_stack;
 	cpu->exception_stack += SZ_64K - 64;
 	cpu->pgtable = NULL;
+	cpu->in_user = false;
 
 	mtspr(SPR_SPRG0, (unsigned long)cpu);
 	__current_cpu = cpu;
 
+	cpu_has_hv = !!(mfmsr() & (1ULL << MSR_HV_BIT));
+
 	enable_mcheck();
 
 	/*
diff --git a/lib/powerpc/spinlock.c b/lib/powerpc/spinlock.c
index 623a1f2c1..2c4904a33 100644
--- a/lib/powerpc/spinlock.c
+++ b/lib/powerpc/spinlock.c
@@ -9,6 +9,8 @@
  */
 void spin_lock(struct spinlock *lock)
 {
+	assert(!in_usermode());
+
 	if (!multithreaded) {
 		assert(lock->v == 0);
 		lock->v = 1;
@@ -20,7 +22,9 @@ void spin_lock(struct spinlock *lock)
 
 void spin_unlock(struct spinlock *lock)
 {
+	assert(!in_usermode());
 	assert(lock->v == 1);
+
 	if (!multithreaded) {
 		lock->v = 0;
 	} else {
diff --git a/lib/ppc64/mmu.c b/lib/ppc64/mmu.c
index ac9c0a285..4129f726c 100644
--- a/lib/ppc64/mmu.c
+++ b/lib/ppc64/mmu.c
@@ -42,6 +42,7 @@ void mmu_enable(pgd_t *pgtable)
 
 	cpu->pgtable = pgtable;
 
+	assert(!in_usermode());
 	mtmsr(mfmsr() | (MSR_IR|MSR_DR));
 }
 
@@ -51,6 +52,7 @@ void mmu_disable(void)
 
 	cpu->pgtable = NULL;
 
+	assert(!in_usermode());
 	mtmsr(mfmsr() & ~(MSR_IR|MSR_DR));
 }
 
diff --git a/powerpc/interrupts.c b/powerpc/interrupts.c
index 6bed26e41..ba965ff76 100644
--- a/powerpc/interrupts.c
+++ b/powerpc/interrupts.c
@@ -326,6 +326,33 @@ static void test_illegal(void)
 	report_prefix_pop();
 }
 
+static void dec_ignore_handler(struct pt_regs *regs, void *data)
+{
+	mtspr(SPR_DEC, 0x7fffffff);
+}
+
+static void test_privileged(void)
+{
+	unsigned long msr;
+
+	if (!mmu_enabled())
+		return;
+
+	report_prefix_push("privileged instruction");
+
+	handle_exception(0x700, &program_handler, NULL);
+	handle_exception(0x900, &dec_ignore_handler, NULL);
+	enter_usermode();
+	asm volatile("mfmsr %0" : "=r"(msr) :: "memory");
+	exit_usermode();
+	report(got_interrupt, "interrupt on privileged instruction");
+	got_interrupt = false;
+	handle_exception(0x900, NULL, NULL);
+	handle_exception(0x700, NULL, NULL);
+
+	report_prefix_pop();
+}
+
 static void sc_handler(struct pt_regs *regs, void *data)
 {
 	got_interrupt = true;
@@ -478,6 +505,7 @@ int main(int argc, char **argv)
 		test_mce();
 	test_mmu();
 	test_illegal();
+	test_privileged();
 	test_dec();
 	test_sc();
 	test_trace();
-- 
2.42.0

