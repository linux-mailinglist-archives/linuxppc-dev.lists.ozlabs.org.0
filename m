Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD0B8BBB7B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:44:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bK8ErWJa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWnRR4xnjz3vj2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:44:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bK8ErWJa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn7P3LF8z3cWq
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:30:09 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6f4302187c0so2229767b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825808; x=1715430608; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvlqWTm5R6hH1aJHvySsaUaw6d4VUJ6a487Wd4qHA3w=;
        b=bK8ErWJajUZwROjyc0u/MEHPI9AKpYFsoD+toixJvR8RU+g5+yPEUx7ooBKJ942Ixm
         HN3emNMxP9e3WQjInyVsoAJG2/wY/cPIq2x39cdHZ8xrN1jisyZqp3CeNEZ64qGAv+ke
         puxr1neOZJdhGt1IU5Q95ikUQBwaDY9SvCNENH+l1OwvsYaZU5QqW1vm0s3sdTdF6XCE
         o+SpKGnQEsVuprizIDR4kCd7OaXXTlZPgoeJIranU/jAez9I5fBkYQvZEsgTweohGq8b
         k2kWp7NuMWL+kVWmDFiYP8mJqI0yTVJhD3V4ZYsDXWYboh0/QrY3sGUvbECBfuCvmy86
         2nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825808; x=1715430608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvlqWTm5R6hH1aJHvySsaUaw6d4VUJ6a487Wd4qHA3w=;
        b=k9JQLIwkl1CrUSPGvVZuSiu+I/0vQb/PLoZJEeivBN9W0x6iJUUimtkQxIhb/rVeiy
         KtearM7qYSisusDINJRLPejJB4TUhKdS5xj9jgJA+F2m0iguxRCONrGzOeU1KioNS0FO
         glJ6ICqX0ShKpRyjvyNVPUyBTHvyQTerW0ZbPOZHuwyqV4oXKz0IezLwQ3Uck/lulz29
         BHTDYiHd3CTJN9CRX94YI+6gd4yD0Gw2qaY34WuRAobUcKyr5D7K8YA8QNYdLrfQMVrS
         Bgu1TiLvzr3Azzrl7AihTbjNYO9My7LegLPQ0LD+RbvumiXiLVIkGsoJ5k2C9MUsvHYo
         HJcA==
X-Forwarded-Encrypted: i=1; AJvYcCX5HRhiV2dS6sK9/QO/7vwsOo4dQ7NZ6+NppLYtSus7mUM6Fncn0jdnE/Il61nXpLvDILbpjuTd9KDPpRSnmsjn48swWs4Ic2Vb10h2ow==
X-Gm-Message-State: AOJu0YyM2QMSCbnvSGhRx5r+SF4+6VNWaLVYw/j6uaTWhugQwPmsDmpC
	eL9dmraycv5L5TdRa/ZLpSXpNX1u0EL0he+NrQq0Web/T6wjmMef
X-Google-Smtp-Source: AGHT+IGtGsf5x/pEdQUlJKVmIg6cVX+m/JLMV6X990354Hcrk/iR00AB92q+lWqDkq9PpcE6KITNrA==
X-Received: by 2002:a05:6a20:da83:b0:1af:81fd:63be with SMTP id iy3-20020a056a20da8300b001af81fd63bemr7138409pzb.13.1714825807773;
        Sat, 04 May 2024 05:30:07 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:30:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 20/31] powerpc: Add atomics tests
Date: Sat,  4 May 2024 22:28:26 +1000
Message-ID: <20240504122841.1177683-21-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504122841.1177683-1-npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/Makefile.common |   1 +
 powerpc/atomics.c       | 375 ++++++++++++++++++++++++++++++++++++++++
 powerpc/unittests.cfg   |   9 +
 3 files changed, 385 insertions(+)
 create mode 100644 powerpc/atomics.c

diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index 1ee9c25d6..420103c87 100644
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
index 000000000..975711fc8
--- /dev/null
+++ b/powerpc/atomics.c
@@ -0,0 +1,375 @@
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
+	/* unaligned larx/stcx. is not required by the ISA to cause an exception, in TCG the stcx does not. */
+	report_kfail(true, old == 0 && *var == 0 && got_interrupt && recorded_regs.trap == 0x600, "unaligned stwcx. causes fault");
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
index 5c458996b..a4210ab2a 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -83,6 +83,15 @@ file = smp.elf
 smp = 8,threads=4
 accel = tcg,thread=single
 
+[atomics]
+file = atomics.elf
+
+[atomics-migration]
+file = atomics.elf
+machine = pseries
+extra_params = -append "migration -m"
+groups = migration
+
 [h_cede_tm]
 file = tm.elf
 machine = pseries
-- 
2.43.0

