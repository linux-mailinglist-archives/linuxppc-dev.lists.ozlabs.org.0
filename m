Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FC1899897
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:54:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HR48iaU4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sk63CMfz3vqR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:54:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HR48iaU4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sLQ4VQwz3vYc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:37:34 +1100 (AEDT)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-369e33098ccso3673065ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306251; x=1712911051; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mT2VnDmlH3x4+T3UaLT+6gNbmui4tNMadCiVypZO+0Y=;
        b=HR48iaU4oAU8lrRv9LCWORODfiH1ZUTZJAUxA3a3T2IKUyD/vBG+Q7cHG08y9YzQ4y
         +rtA2wR6VQVuePtSu/Nqwy0Th9ykjuul22uNGnM3TO0kYG1NSHaqNjQydMOOgUy6VIJX
         ixzK9kxhXPQRJ2JwW43pvIvvYB6L4WGDEy8cTyoSxdaK14Q0BNHwOepJOAMSL9LlqHKd
         Q6rihHsVEIkGdVCi//HgqpFqZJBKP0gNyYRXvZdBoGR7IKh9hwXfpfT7WuQZqjpRSWdf
         3Vt3v13KwqQfZ62W0MgepCrh8o+e6KyPXqMQbRGokcv7aeRr2Im+N5S00xujwDoRVPKS
         kByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306251; x=1712911051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mT2VnDmlH3x4+T3UaLT+6gNbmui4tNMadCiVypZO+0Y=;
        b=VrVW00jd9ePYFhfdT9D3J+8OxzXkboB1wwrA/pD5HuTUf7hMXqx9DNDL0VvkDwh/iY
         qajz2Okl5dOyntchTbytV3fcggJIsAlXO9e/ruohxn7apycGGGh49Sz8gdsetE+8ZuaL
         Z3/bbU2oHCiBGnuYfhVJdEkajBbdUWN8i4IhvJjyTQNt83JmhwcVeMn0bp2Ltu/ITRYL
         yFkX+KlvcI7paX+eXyT7WP9d3IZJ4Q+KrtNLXVVloFkNTuYPeDcEQw521ShKFAh/6Fo7
         1h8z1JDPH+lVXaKAncZtTuDftapftn1q3HJOJk2r+Aa7gBiiqcAGdtphC2iuKiW8BksL
         KwBg==
X-Forwarded-Encrypted: i=1; AJvYcCU8hNLsqS8Tou2/5RGfCGuCj1jfxdOnoFbBd7ap8jTW1Pb1avCGdZv42gLf/GH9knNQ6dwbTacsgkg2Ua7lKSWuQrEnhwV3lpoh+TiqFA==
X-Gm-Message-State: AOJu0Yx0frdgdHuUoFXF4HhCe25WCv3nPL36TXCSJFQvSc4vz0hKQ3mE
	rDac2LqoAm3PlHhk+zI1l5AjTjWOZl+lh79bDuLh65Bt6+REAcCj76M0WWUN
X-Google-Smtp-Source: AGHT+IGYfDVi7WlMWFqUVUq2/bJ78w78Erq3WWaodDUjqY3d4vMgFAha4pIxWJ+OGnZvQK9RuXUTBw==
X-Received: by 2002:a05:6e02:12e6:b0:36a:68d:2a4 with SMTP id l6-20020a056e0212e600b0036a068d02a4mr699057iln.31.1712306251509;
        Fri, 05 Apr 2024 01:37:31 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:37:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 25/35] powerpc: Add atomics tests
Date: Fri,  5 Apr 2024 18:35:26 +1000
Message-ID: <20240405083539.374995-26-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405083539.374995-1-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/Makefile.common |   1 +
 powerpc/atomics.c       | 374 ++++++++++++++++++++++++++++++++++++++++
 powerpc/unittests.cfg   |   9 +
 3 files changed, 384 insertions(+)
 create mode 100644 powerpc/atomics.c

diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index 02af54b83..b6f9b3b85 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -11,6 +11,7 @@ tests-common = \
 	$(TEST_DIR)/spapr_hcall.elf \
 	$(TEST_DIR)/rtas.elf \
 	$(TEST_DIR)/emulator.elf \
+	$(TEST_DIR)/atomics.elf \
 	$(TEST_DIR)/tm.elf \
 	$(TEST_DIR)/smp.elf \
 	$(TEST_DIR)/sprs.elf \
diff --git a/powerpc/atomics.c b/powerpc/atomics.c
new file mode 100644
index 000000000..c3d1cef52
--- /dev/null
+++ b/powerpc/atomics.c
@@ -0,0 +1,374 @@
+/* SPDX-License-Identifier: LGPL-2.0-only */
+/*
+ * Test some powerpc instructions
+ *
+ * Copyright 2024 Nicholas Piggin, IBM Corp.
+ */
+#include <stdint.h>
+#include <libcflat.h>
+#include <migrate.h>
+#include <asm/processor.h>
+#include <asm/time.h>
+#include <asm/atomic.h>
+#include <asm/setup.h>
+#include <asm/barrier.h>
+#include <asm/smp.h>
+
+static bool do_migrate;
+static bool do_record;
+
+#define RSV_SIZE 128
+
+static uint8_t granule[RSV_SIZE] __attribute((__aligned__(RSV_SIZE)));
+
+static void spin_lock(unsigned int *lock)
+{
+	unsigned int old;
+
+	asm volatile ("1:"
+		      "lwarx	%0,0,%2;"
+		      "cmpwi	%0,0;"
+		      "bne	1b;"
+		      "stwcx.	%1,0,%2;"
+		      "bne-	1b;"
+		      "lwsync;"
+		      : "=&r"(old) : "r"(1), "r"(lock) : "cr0", "memory");
+}
+
+static void spin_unlock(unsigned int *lock)
+{
+	asm volatile("lwsync;"
+		     "stw	%1,%0;"
+		     : "+m"(*lock) : "r"(0) : "memory");
+}
+
+static volatile bool got_interrupt;
+static volatile struct pt_regs recorded_regs;
+
+static void interrupt_handler(struct pt_regs *regs, void *opaque)
+{
+	assert(!got_interrupt);
+	got_interrupt = true;
+	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
+	regs_advance_insn(regs);
+}
+
+static void test_lwarx_stwcx(int argc, char *argv[])
+{
+	unsigned int *var = (unsigned int *)granule;
+	unsigned int old;
+	unsigned int result;
+
+	*var = 0;
+	asm volatile ("1:"
+		      "lwarx	%0,0,%2;"
+		      "stwcx.	%1,0,%2;"
+		      "bne-	1b;"
+		      : "=&r"(old) : "r"(1), "r"(var) : "cr0", "memory");
+	report(old == 0 && *var == 1, "simple update");
+
+	*var = 0;
+	asm volatile ("li	%0,0;"
+		      "stwcx.	%1,0,%2;"
+		      "stwcx.	%1,0,%2;"
+		      "bne-	1f;"
+		      "li	%0,1;"
+		      "1:"
+		      : "=&r"(result)
+		      : "r"(1), "r"(var) : "cr0", "memory");
+	report(result == 0 && *var == 0, "failed stwcx. (no reservation)");
+
+	*var = 0;
+	asm volatile ("li	%0,0;"
+		      "lwarx	%1,0,%4;"
+		      "stw	%3,0(%4);"
+		      "stwcx.	%2,0,%4;"
+		      "bne-	1f;"
+		      "li	%0,1;"
+		      "1:"
+		      : "=&r"(result), "=&r"(old)
+		      : "r"(1), "r"(2), "r"(var) : "cr0", "memory");
+	/* This is implementation specific, so don't fail */
+	if (result == 0 && *var == 2)
+		report(true, "failed stwcx. (intervening store)");
+	else
+		report(true, "succeeded stwcx. (intervening store)");
+
+	handle_exception(0x600, interrupt_handler, NULL);
+	handle_exception(0x700, interrupt_handler, NULL);
+
+	/* Implementations may not necessarily invoke the alignment interrupt */
+	old = 10;
+	*var = 0;
+	asm volatile (
+		      "lwarx	%0,0,%1;"
+		      : "+&r"(old) : "r"((char *)var + 1));
+	report(old == 10 && got_interrupt && recorded_regs.trap == 0x600, "unaligned lwarx causes fault");
+	got_interrupt = false;
+
+	/*
+	 * Unaligned stwcx. is more difficult to test, at least under QEMU,
+	 * the store does not proceed if there is no matching reservation, so
+	 * the alignment handler does not get invoked. This is okay according
+	 * to the Power ISA (unalignment does not necessarily invoke the
+	 * alignment interrupt). But POWER CPUs do cause alignment interrupt.
+	 */
+	*var = 0;
+	asm volatile (
+		      "lwarx	%0,0,%2;"
+		      "stwcx.	%1,0,%3;"
+		      : "=&r"(old) : "r"(1), "r"(var), "r"((char *)var+1) : "cr0", "memory");
+	report(old == 0 && *var == 0 && got_interrupt && recorded_regs.trap == 0x600, "unaligned stwcx. causes fault");
+	got_interrupt = false;
+
+	handle_exception(0x600, NULL, NULL);
+
+}
+
+static void test_lqarx_stqcx(int argc, char *argv[])
+{
+	union {
+		__int128_t var;
+		struct {
+#if  __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+			unsigned long var1;
+			unsigned long var2;
+#else
+			unsigned long var2;
+			unsigned long var1;
+#endif
+		};
+	} var __attribute__((aligned(16)));
+	register unsigned long new1 asm("r8");
+	register unsigned long new2 asm("r9");
+	register unsigned long old1 asm("r10");
+	register unsigned long old2 asm("r11");
+	unsigned int result;
+
+	var.var1 = 1;
+	var.var2 = 2;
+
+	(void)new2;
+	(void)old2;
+
+	old1 = 0;
+	old2 = 0;
+	new1 = 3;
+	new2 = 4;
+	asm volatile ("1:"
+		      "lqarx	%0,0,%4;"
+		      "stqcx.	%2,0,%4;"
+		      "bne-	1b;"
+		      : "=&r"(old1), "=&r"(old2)
+		      : "r"(new1), "r"(new2), "r"(&var)
+		      : "cr0", "memory");
+
+	report(old1 == 2 && old2 == 1 && var.var1 == 4 && var.var2 == 3,
+			"simple update");
+
+	var.var1 = 1;
+	var.var2 = 2;
+	new1 = 3;
+	new2 = 4;
+	asm volatile ("li	%0,0;"
+		      "stqcx.	%1,0,%3;"
+		      "stqcx.	%1,0,%3;"
+		      "bne-	1f;"
+		      "li	%0,1;"
+		      "1:"
+		      : "=&r"(result)
+		      : "r"(new1), "r"(new2), "r"(&var)
+		      : "cr0", "memory");
+	report(result == 0 && var.var1 == 1 && var.var2 == 2,
+			"failed stqcx. (no reservation)");
+
+	var.var1 = 1;
+	var.var2 = 2;
+	new1 = 3;
+	new2 = 4;
+	asm volatile ("li	%0,0;"
+		      "lqarx	%1,0,%6;"
+		      "std	%5,0(%6);"
+		      "stqcx.	%3,0,%6;"
+		      "bne-	1f;"
+		      "li	%0,1;"
+		      "1:"
+		      : "=&r"(result), "=&r"(old1), "=&r"(old2)
+		      : "r"(new1), "r"(new2), "r"(0), "r"(&var)
+		      : "cr0", "memory");
+	/* This is implementation specific, so don't fail */
+	if (result == 0 && (var.var1 == 0 || var.var2 == 0))
+		report(true, "failed stqcx. (intervening store)");
+	else
+		report(true, "succeeded stqcx. (intervening store)");
+}
+
+static void test_migrate_reserve(int argc, char *argv[])
+{
+	unsigned int *var = (unsigned int *)granule;
+	unsigned int old;
+	int i;
+	int succeed = 0;
+
+	if (!do_migrate)
+		return;
+
+	for (i = 0; i < 10; i++) {
+		*var = 0x12345;
+		asm volatile ("lwarx	%0,0,%1" : "=&r"(old) : "r"(var) : "memory");
+		migrate_quiet();
+		asm volatile ("stwcx.	%0,0,%1" : : "r"(0xf00d), "r"(var) : "cr0", "memory");
+		if (*var == 0xf00d)
+			succeed++;
+	}
+
+	if (do_record) {
+		/*
+		 * Running under TCG record-replay, reservations must not
+		 * be lost by migration
+		 */
+		report(succeed > 0, "migrated reservation is not lost");
+	} else {
+		report(succeed == 0, "migrated reservation is lost");
+	}
+
+	report_prefix_pop();
+}
+
+#define ITERS 10000000
+static int test_counter = 0;
+static void test_inc_perf(int argc, char *argv[])
+{
+	int i;
+	uint64_t tb1, tb2;
+
+	tb1 = get_tb();
+	for (i = 0; i < ITERS; i++)
+		__atomic_fetch_add(&test_counter, 1, __ATOMIC_RELAXED);
+	tb2 = get_tb();
+	report(true, "atomic add takes %ldns", (tb2 - tb1) * 1000000000 / ITERS / tb_hz);
+
+	tb1 = get_tb();
+	for (i = 0; i < ITERS; i++)
+		__atomic_fetch_add(&test_counter, 1, __ATOMIC_SEQ_CST);
+	tb2 = get_tb();
+	report(true, "sequentially conssistent atomic add takes %ldns", (tb2 - tb1) * 1000000000 / ITERS / tb_hz);
+}
+
+static long smp_inc_counter = 0;
+static int smp_inc_started;
+
+static void smp_inc_fn(int cpu_id)
+{
+	long i;
+
+	atomic_fetch_inc(&smp_inc_started);
+	while (smp_inc_started < nr_cpus_present)
+		cpu_relax();
+
+	for (i = 0; i < ITERS; i++)
+		atomic_fetch_inc(&smp_inc_counter);
+	atomic_fetch_dec(&smp_inc_started);
+}
+
+static void test_smp_inc(int argc, char **argv)
+{
+	if (nr_cpus_present < 2)
+		return;
+
+	if (!start_all_cpus(smp_inc_fn))
+		report_abort("Failed to start secondary cpus");
+
+	while (smp_inc_started < nr_cpus_present - 1)
+		cpu_relax();
+	smp_inc_fn(smp_processor_id());
+	while (smp_inc_started > 0)
+		cpu_relax();
+
+	stop_all_cpus();
+
+	report(smp_inc_counter == nr_cpus_present * ITERS, "counter lost no increments");
+}
+
+static long smp_lock_counter __attribute__((aligned(128))) = 0;
+static unsigned int smp_lock __attribute__((aligned(128)));
+static int smp_lock_started;
+
+static void smp_lock_fn(int cpu_id)
+{
+	long i;
+
+	atomic_fetch_inc(&smp_lock_started);
+	while (smp_lock_started < nr_cpus_present)
+		cpu_relax();
+
+	for (i = 0; i < ITERS; i++) {
+		spin_lock(&smp_lock);
+		smp_lock_counter++;
+		spin_unlock(&smp_lock);
+	}
+	atomic_fetch_dec(&smp_lock_started);
+}
+
+static void test_smp_lock(int argc, char **argv)
+{
+	if (nr_cpus_present < 2)
+		return;
+
+	if (!start_all_cpus(smp_lock_fn))
+		report_abort("Failed to start secondary cpus");
+
+	while (smp_lock_started < nr_cpus_present - 1)
+		cpu_relax();
+	smp_lock_fn(smp_processor_id());
+	while (smp_lock_started > 0)
+		cpu_relax();
+
+	stop_all_cpus();
+
+	report(smp_lock_counter == nr_cpus_present * ITERS, "counter lost no increments");
+}
+
+struct {
+	const char *name;
+	void (*func)(int argc, char **argv);
+} hctests[] = {
+	{ "lwarx/stwcx", test_lwarx_stwcx },
+	{ "lqarx/stqcx", test_lqarx_stqcx },
+	{ "migration", test_migrate_reserve },
+	{ "performance", test_inc_perf },
+	{ "SMP-atomic", test_smp_inc },
+	{ "SMP-lock", test_smp_lock },
+	{ NULL, NULL }
+};
+
+int main(int argc, char **argv)
+{
+	int i;
+	int all;
+
+	all = argc == 1 || !strcmp(argv[1], "all");
+
+	for (i = 1; i < argc; i++) {
+		if (strcmp(argv[i], "-r") == 0) {
+			do_record = true;
+		}
+		if (strcmp(argv[i], "-m") == 0) {
+			do_migrate = true;
+		}
+	}
+
+	report_prefix_push("atomics");
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
+
+	return report_summary();
+}
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 71bfc935d..803a636cb 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -88,6 +88,15 @@ file = smp.elf
 smp = 8,threads=4
 accel = tcg,thread=single
 
+[atomics]
+file = atomics.elf
+
+[atomics-migration]
+file = atomics.elf
+machine = pseries
+extra_params = -append "'migration -m'"
+groups = migration
+
 [h_cede_tm]
 file = tm.elf
 machine = pseries
-- 
2.43.0

