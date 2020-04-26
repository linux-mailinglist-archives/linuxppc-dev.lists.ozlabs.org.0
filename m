Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB51E1B8F75
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 13:45:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4995gj5wCRzDqf3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Apr 2020 21:45:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4995f65sz0zDqV5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 21:43:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=f6urYhzl; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4995f53mntz9sRf; Sun, 26 Apr 2020 21:43:57 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4995f52sqzz9sSG; Sun, 26 Apr 2020 21:43:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1587901437;
 bh=Tya8Q3SFHiSJr7FWesNjKMbO70lsdJC8sygy5v4GxZY=;
 h=From:To:Subject:Date:From;
 b=f6urYhzlVYD2za8y4BCT36VSC+YJZsBmy66ij/kcqQ1VZP62K3QsrdX/bjx+jdUgs
 3+Hr8MyT3HgZLr6diwXhZ9VV8pz0NO9b9utUztGjBVyWRytoj7VHGRSGFOsZsNYusg
 KBirScqQkOXbytScVJCnCq85p6hII0/LCp5bg7lGhSereggStRd81UMRJ4t5/OGLj5
 4VtRLX37pjYgORyjKGRiQCBNESdDNJk9AnbnBJoqqVTCDRcJdQrkDSVSIXcSUIEGW9
 s0zWtbfAuDvCarDa2FIj2uSy/ofWPoNF79apS7Ta4D2onDtF7CekCP8xI9SIQmeHaS
 r41nOkazHyOFw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] selftests/powerpc: Add a test of counting larx/stcx
Date: Sun, 26 Apr 2020 21:44:10 +1000
Message-Id: <20200426114410.3917383-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is based on the count_instructions test.

However this one also counts the number of failed stcx's, and in
conjunction with knowing the size of the stcx loop, can calculate the
total number of instructions executed even in the face of
non-deterministic stcx failures.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../testing/selftests/powerpc/pmu/.gitignore  |   1 +
 tools/testing/selftests/powerpc/pmu/Makefile  |   8 +-
 .../selftests/powerpc/pmu/count_stcx_fail.c   | 161 ++++++++++++++++++
 tools/testing/selftests/powerpc/pmu/loop.S    |  35 ++++
 4 files changed, 203 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/count_stcx_fail.c

diff --git a/tools/testing/selftests/powerpc/pmu/.gitignore b/tools/testing/selftests/powerpc/pmu/.gitignore
index ff7896903d7b..f69b1e2641a1 100644
--- a/tools/testing/selftests/powerpc/pmu/.gitignore
+++ b/tools/testing/selftests/powerpc/pmu/.gitignore
@@ -2,3 +2,4 @@
 count_instructions
 l3_bank_test
 per_event_excludes
+count_stcx_fail
diff --git a/tools/testing/selftests/powerpc/pmu/Makefile b/tools/testing/selftests/powerpc/pmu/Makefile
index 19046db995fe..904672fb78dd 100644
--- a/tools/testing/selftests/powerpc/pmu/Makefile
+++ b/tools/testing/selftests/powerpc/pmu/Makefile
@@ -2,7 +2,7 @@
 noarg:
 	$(MAKE) -C ../
 
-TEST_GEN_PROGS := count_instructions l3_bank_test per_event_excludes
+TEST_GEN_PROGS := count_instructions count_stcx_fail l3_bank_test per_event_excludes
 EXTRA_SOURCES := ../harness.c event.c lib.c ../utils.c
 
 top_srcdir = ../../../../..
@@ -13,8 +13,12 @@ all: $(TEST_GEN_PROGS) ebb
 $(TEST_GEN_PROGS): $(EXTRA_SOURCES)
 
 # loop.S can only be built 64-bit
+$(OUTPUT)/count_instructions: CFLAGS += -m64
 $(OUTPUT)/count_instructions: loop.S count_instructions.c $(EXTRA_SOURCES)
-	$(CC) $(CFLAGS) -m64 -o $@ $^
+
+$(OUTPUT)/count_stcx_fail: CFLAGS += -m64
+$(OUTPUT)/count_stcx_fail: loop.S $(EXTRA_SOURCES)
+
 
 $(OUTPUT)/per_event_excludes: ../utils.c
 
diff --git a/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c b/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c
new file mode 100644
index 000000000000..7b4ac4537702
--- /dev/null
+++ b/tools/testing/selftests/powerpc/pmu/count_stcx_fail.c
@@ -0,0 +1,161 @@
+/*
+ * Copyright 2013, Michael Ellerman, IBM Corp.
+ * Licensed under GPLv2.
+ */
+
+#define _GNU_SOURCE
+
+#include <stdio.h>
+#include <stdbool.h>
+#include <string.h>
+#include <sys/prctl.h>
+
+#include "event.h"
+#include "utils.h"
+#include "lib.h"
+
+extern void thirty_two_instruction_loop_with_ll_sc(u64 loops, u64 *ll_sc_target);
+
+static void setup_event(struct event *e, u64 config, int type, char *name)
+{
+	event_init_opts(e, config, type, name);
+
+	e->attr.disabled = 1;
+	e->attr.exclude_kernel = 1;
+	e->attr.exclude_hv = 1;
+	e->attr.exclude_idle = 1;
+}
+
+static int do_count_loop(struct event *events, u64 instructions,
+			 u64 overhead, bool report)
+{
+	s64 difference, expected;
+	double percentage;
+	u64 dummy;
+
+	prctl(PR_TASK_PERF_EVENTS_ENABLE);
+
+	/* Run for 1M instructions */
+	thirty_two_instruction_loop_with_ll_sc(instructions >> 5, &dummy);
+
+	prctl(PR_TASK_PERF_EVENTS_DISABLE);
+
+	event_read(&events[0]);
+	event_read(&events[1]);
+	event_read(&events[2]);
+
+	expected = instructions + overhead + (events[2].result.value * 10);
+	difference = events[0].result.value - expected;
+	percentage = (double)difference / events[0].result.value * 100;
+
+	if (report) {
+		printf("-----\n");
+		event_report(&events[0]);
+		event_report(&events[1]);
+		event_report(&events[2]);
+
+		printf("Looped for %llu instructions, overhead %llu\n", instructions, overhead);
+		printf("Expected %llu\n", expected);
+		printf("Actual   %llu\n", events[0].result.value);
+		printf("Delta    %lld, %f%%\n", difference, percentage);
+	}
+
+	event_reset(&events[0]);
+	event_reset(&events[1]);
+	event_reset(&events[2]);
+
+	if (difference < 0)
+		difference = -difference;
+
+	/* Tolerate a difference below 0.0001 % */
+	difference *= 10000 * 100;
+	if (difference / events[0].result.value)
+		return -1;
+
+	return 0;
+}
+
+/* Count how many instructions it takes to do a null loop */
+static u64 determine_overhead(struct event *events)
+{
+	u64 current, overhead;
+	int i;
+
+	do_count_loop(events, 0, 0, false);
+	overhead = events[0].result.value;
+
+	for (i = 0; i < 100; i++) {
+		do_count_loop(events, 0, 0, false);
+		current = events[0].result.value;
+		if (current < overhead) {
+			printf("Replacing overhead %llu with %llu\n", overhead, current);
+			overhead = current;
+		}
+	}
+
+	return overhead;
+}
+
+#define	PM_MRK_STCX_FAIL	0x03e158
+#define PM_STCX_FAIL	0x01e058
+
+static int test_body(void)
+{
+	struct event events[3];
+	u64 overhead;
+
+	setup_event(&events[0], PERF_COUNT_HW_INSTRUCTIONS, PERF_TYPE_HARDWARE, "instructions");
+	setup_event(&events[1], PERF_COUNT_HW_CPU_CYCLES, PERF_TYPE_HARDWARE, "cycles");
+	setup_event(&events[2], PM_STCX_FAIL, PERF_TYPE_RAW, "stcx_fail");
+
+	if (event_open(&events[0])) {
+		perror("perf_event_open");
+		return -1;
+	}
+
+	if (event_open_with_group(&events[1], events[0].fd)) {
+		perror("perf_event_open");
+		return -1;
+	}
+
+	if (event_open_with_group(&events[2], events[0].fd)) {
+		perror("perf_event_open");
+		return -1;
+	}
+
+	overhead = determine_overhead(events);
+	printf("Overhead of null loop: %llu instructions\n", overhead);
+
+	/* Run for 1Mi instructions */
+	FAIL_IF(do_count_loop(events, 1000000, overhead, true));
+
+	/* Run for 10Mi instructions */
+	FAIL_IF(do_count_loop(events, 10000000, overhead, true));
+
+	/* Run for 100Mi instructions */
+	FAIL_IF(do_count_loop(events, 100000000, overhead, true));
+
+	/* Run for 1Bi instructions */
+	FAIL_IF(do_count_loop(events, 1000000000, overhead, true));
+
+	/* Run for 16Bi instructions */
+	FAIL_IF(do_count_loop(events, 16000000000, overhead, true));
+
+	/* Run for 64Bi instructions */
+	FAIL_IF(do_count_loop(events, 64000000000, overhead, true));
+
+	event_close(&events[0]);
+	event_close(&events[1]);
+
+	return 0;
+}
+
+static int count_ll_sc(void)
+{
+	return eat_cpu(test_body);
+}
+
+int main(void)
+{
+	return test_harness(count_ll_sc, "count_ll_sc");
+}
diff --git a/tools/testing/selftests/powerpc/pmu/loop.S b/tools/testing/selftests/powerpc/pmu/loop.S
index 8cc9b5e2c9de..c52ba09b6fed 100644
--- a/tools/testing/selftests/powerpc/pmu/loop.S
+++ b/tools/testing/selftests/powerpc/pmu/loop.S
@@ -41,3 +41,38 @@ FUNC_START(thirty_two_instruction_loop)
 	subi	r3,r3,1
 	b	FUNC_NAME(thirty_two_instruction_loop)
 FUNC_END(thirty_two_instruction_loop)
+
+FUNC_START(thirty_two_instruction_loop_with_ll_sc)
+	cmpdi	r3,0
+	beqlr
+	addi	r5,r5,1
+	addi	r5,r5,1
+	addi	r5,r5,1		# 5
+	addi	r5,r5,1
+	addi	r5,r5,1
+	addi	r5,r5,1
+	addi	r5,r5,1
+1:	ldarx	r6,0,r4		# 10
+	addi	r5,r5,1
+	addi	r5,r5,1
+	addi	r5,r5,1
+	addi	r5,r5,1
+	addi	r5,r5,1		# 15
+	addi	r5,r5,1
+	addi	r5,r5,1
+	stdcx.	r6,0,r4
+	bne-	1b
+	addi	r5,r5,1		# 20
+	addi	r5,r5,1
+	addi	r5,r5,1
+	addi	r5,r5,1
+	addi	r5,r5,1
+	addi	r5,r5,1		# 25
+	addi	r5,r5,1
+	addi	r5,r5,1
+	addi	r5,r5,1
+	addi	r5,r5,1
+	addi	r5,r5,1		# 30
+	subi	r3,r3,1
+	b	FUNC_NAME(thirty_two_instruction_loop_with_ll_sc)
+FUNC_END(thirty_two_instruction_loop_with_ll_sc)
-- 
2.25.1

