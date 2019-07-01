Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3DF231D6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 12:56:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456wnK41wszDqLb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 20:56:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456wlz21YSzDqDb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 20:55:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 456wlx3QRKz9s55; Mon, 20 May 2019 20:55:25 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 456wlx339kz9s6w; Mon, 20 May 2019 20:55:25 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] selftests/powerpc: Add a test of spectre_v2 mitigations
Date: Mon, 20 May 2019 20:55:20 +1000
Message-Id: <20190520105520.22274-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: naveen.n.rao@linux.ibm.com, anton@samba.org, npiggin@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This test uses the PMU to count branch prediction hits/misses for a
known loop, and compare the result to the reported spectre v2
mitigation.

This gives us a way of sanity checking that the reported mitigation is
actually in effect.

Sample output for some cases, eg:

  Power9:
    sysfs reports: 'Vulnerable'
     PM_BR_PRED_CCACHE: result        368 running/enabled 5792777124
    PM_BR_MPRED_CCACHE: result        319 running/enabled 5792775546
     PM_BR_PRED_PCACHE: result 2147483281 running/enabled 5792773128
    PM_BR_MPRED_PCACHE: result  213604201 running/enabled 5792771640
    Miss percent 9 %
    OK - Measured branch prediction rates match reported spectre v2 mitigation.

    sysfs reports: 'Mitigation: Indirect branch serialisation (kernel only)'
     PM_BR_PRED_CCACHE: result        895 running/enabled 5780320920
    PM_BR_MPRED_CCACHE: result        822 running/enabled 5780312414
     PM_BR_PRED_PCACHE: result 2147482754 running/enabled 5780308836
    PM_BR_MPRED_PCACHE: result  213639731 running/enabled 5780307912
    Miss percent 9 %
    OK - Measured branch prediction rates match reported spectre v2 mitigation.

    sysfs reports: 'Mitigation: Indirect branch cache disabled'
     PM_BR_PRED_CCACHE: result 2147483649 running/enabled 20540186160
    PM_BR_MPRED_CCACHE: result 2147483649 running/enabled 20540180056
     PM_BR_PRED_PCACHE: result          0 running/enabled 20540176090
    PM_BR_MPRED_PCACHE: result          0 running/enabled 20540174182
    Miss percent 100 %
    OK - Measured branch prediction rates match reported spectre v2 mitigation.

  Power8:
    sysfs reports: 'Vulnerable'
     PM_BR_PRED_CCACHE: result 2147483649 running/enabled 3505888142
    PM_BR_MPRED_CCACHE: result          9 running/enabled 3505882788
    Miss percent 0 %
    OK - Measured branch prediction rates match reported spectre v2 mitigation.

    sysfs reports: 'Mitigation: Indirect branch cache disabled'
     PM_BR_PRED_CCACHE: result 2147483649 running/enabled 16931421988
    PM_BR_MPRED_CCACHE: result 2147483649 running/enabled 16931416478
    Miss percent 100 %
    OK - Measured branch prediction rates match reported spectre v2 mitigation.
    success: spectre_v2

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../testing/selftests/powerpc/include/utils.h |   1 +
 .../selftests/powerpc/security/Makefile       |   3 +-
 .../selftests/powerpc/security/branch_loops.S |  82 +++++++
 .../selftests/powerpc/security/spectre_v2.c   | 218 ++++++++++++++++++
 tools/testing/selftests/powerpc/utils.c       |  20 ++
 5 files changed, 323 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/security/branch_loops.S
 create mode 100644 tools/testing/selftests/powerpc/security/spectre_v2.c

diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index 7636bf45d5d5..be493b4823f7 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -34,6 +34,7 @@ int pick_online_cpu(void);
 
 int read_debugfs_file(char *debugfs_file, int *result);
 int write_debugfs_file(char *debugfs_file, int result);
+int read_sysfs_file(char *debugfs_file, char *result, size_t result_size);
 void set_dscr(unsigned long val);
 int perf_event_open_counter(unsigned int type,
 			    unsigned long config, int group_fd);
diff --git a/tools/testing/selftests/powerpc/security/Makefile b/tools/testing/selftests/powerpc/security/Makefile
index 85861c46b445..d68e6031695c 100644
--- a/tools/testing/selftests/powerpc/security/Makefile
+++ b/tools/testing/selftests/powerpc/security/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0+
 
-TEST_GEN_PROGS := rfi_flush
+TEST_GEN_PROGS := rfi_flush spectre_v2
 top_srcdir = ../../../../..
 
 CFLAGS += -I../../../../../usr/include
@@ -8,3 +8,4 @@ CFLAGS += -I../../../../../usr/include
 include ../../lib.mk
 
 $(TEST_GEN_PROGS): ../harness.c ../utils.c
+$(OUTPUT)/spectre_v2: ../pmu/event.c branch_loops.S
diff --git a/tools/testing/selftests/powerpc/security/branch_loops.S b/tools/testing/selftests/powerpc/security/branch_loops.S
new file mode 100644
index 000000000000..22e9204e3421
--- /dev/null
+++ b/tools/testing/selftests/powerpc/security/branch_loops.S
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2019, Michael Ellerman, IBM Corp.
+ */
+
+#include <ppc-asm.h>
+
+	.data
+
+jump_table:
+	.long	0x0
+	.long	(.Lstate_1 - .Lstate_0)
+	.long	(.Lstate_2 - .Lstate_0)
+	.long	(.Lstate_3 - .Lstate_0)
+	.long	(.Lstate_4 - .Lstate_0)
+	.long	(.Lstate_5 - .Lstate_0)
+	.long	(.Lstate_6 - .Lstate_0)
+	.long	(.Lstate_7 - .Lstate_0)
+
+	.text
+
+#define ITER_SHIFT	31
+
+.macro state number
+	.balign	32
+.Lstate_\number:
+	.if	\number==7
+	li	r3, 0
+	.else
+	li	r3, \number+1
+	.endif
+	b	.Lloop
+.endm
+
+FUNC_START(pattern_cache_loop)
+	li	r3, 0
+	li	r4, 1
+	sldi	r4, r4, ITER_SHIFT
+
+.Lloop:	cmpdi	r4, 0
+	beqlr
+
+	addi	r4, r4, -1
+
+	ld	r6, jump_table@got(%r2)
+	sldi	r5, r3, 2
+	lwax	r6, r5, r6
+	ld	r7, .Lstate_0@got(%r2)
+	add	r6, r6, r7
+	mtctr	r6
+	bctr
+
+	state	0
+	state	1
+	state	2
+	state	3
+	state	4
+	state	5
+	state	6
+	state	7
+
+FUNC_END(pattern_cache_loop)
+
+
+FUNC_START(indirect_branch_loop)
+	li	r3, 1
+	sldi	r3, r3, ITER_SHIFT
+
+1:	cmpdi	r3, 0
+	beqlr
+
+	addi	r3, r3, -1
+
+	ld	r4, 2f@got(%r2)
+	mtctr	r4
+	bctr
+
+	.balign 32
+2:	b	1b
+
+FUNC_END(indirect_branch_loop)
diff --git a/tools/testing/selftests/powerpc/security/spectre_v2.c b/tools/testing/selftests/powerpc/security/spectre_v2.c
new file mode 100644
index 000000000000..8c6b982af2a8
--- /dev/null
+++ b/tools/testing/selftests/powerpc/security/spectre_v2.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2018-2019 IBM Corporation.
+ */
+
+#define __SANE_USERSPACE_TYPES__
+
+#include <sys/types.h>
+#include <stdint.h>
+#include <malloc.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdio.h>
+#include <sys/prctl.h>
+#include "utils.h"
+
+#include "../pmu/event.h"
+
+
+extern void pattern_cache_loop(void);
+extern void indirect_branch_loop(void);
+
+static int do_count_loop(struct event *events, bool is_p9, s64 *miss_percent)
+{
+	u64 pred, mpred;
+
+	prctl(PR_TASK_PERF_EVENTS_ENABLE);
+
+	if (is_p9)
+		pattern_cache_loop();
+	else
+		indirect_branch_loop();
+
+	prctl(PR_TASK_PERF_EVENTS_DISABLE);
+
+	event_read(&events[0]);
+	event_read(&events[1]);
+
+	// We could scale all the events by running/enabled but we're lazy
+	// As long as the PMU is uncontended they should all run
+	FAIL_IF(events[0].result.running != events[0].result.enabled);
+	FAIL_IF(events[1].result.running != events[1].result.enabled);
+
+	pred =  events[0].result.value;
+	mpred = events[1].result.value;
+
+	if (is_p9) {
+		event_read(&events[2]);
+		event_read(&events[3]);
+		FAIL_IF(events[2].result.running != events[2].result.enabled);
+		FAIL_IF(events[3].result.running != events[3].result.enabled);
+
+		pred  += events[2].result.value;
+		mpred += events[3].result.value;
+	}
+
+	*miss_percent = 100 * mpred / pred;
+
+	return 0;
+}
+
+static void setup_event(struct event *e, u64 config, char *name)
+{
+	event_init_named(e, config, name);
+
+	e->attr.disabled = 1;
+	e->attr.exclude_kernel = 1;
+	e->attr.exclude_hv = 1;
+	e->attr.exclude_idle = 1;
+}
+
+enum spectre_v2_state {
+	VULNERABLE = 0,
+	UNKNOWN = 1,		// Works with FAIL_IF()
+	NOT_AFFECTED,
+	BRANCH_SERIALISATION,
+	COUNT_CACHE_DISABLED,
+	COUNT_CACHE_FLUSH_SW,
+	COUNT_CACHE_FLUSH_HW,
+	BTB_FLUSH,
+};
+
+static enum spectre_v2_state get_sysfs_state(void)
+{
+	enum spectre_v2_state state = UNKNOWN;
+	char buf[256];
+	int len;
+
+	memset(buf, 0, sizeof(buf));
+	FAIL_IF(read_sysfs_file("devices/system/cpu/vulnerabilities/spectre_v2", buf, sizeof(buf)));
+
+	// Make sure it's NULL terminated
+	buf[sizeof(buf) - 1] = '\0';
+
+	// Trim the trailing newline
+	len = strlen(buf);
+	FAIL_IF(len < 1);
+	buf[len - 1] = '\0';
+
+	printf("sysfs reports: '%s'\n", buf);
+
+	// Order matters
+	if (strstr(buf, "Vulnerable"))
+		state = VULNERABLE;
+	else if (strstr(buf, "Not affected"))
+		state = NOT_AFFECTED;
+	else if (strstr(buf, "Indirect branch serialisation (kernel only)"))
+		state = BRANCH_SERIALISATION;
+	else if (strstr(buf, "Indirect branch cache disabled"))
+		state = COUNT_CACHE_DISABLED;
+	else if (strstr(buf, "Software count cache flush (hardware accelerated)"))
+		state = COUNT_CACHE_FLUSH_HW;
+	else if (strstr(buf, "Software count cache flush"))
+		state = COUNT_CACHE_FLUSH_SW;
+	else if (strstr(buf, "Branch predictor state flush"))
+		state = BTB_FLUSH;
+
+	return state;
+}
+
+#define PM_BR_PRED_CCACHE	0x040a4	// P8 + P9
+#define PM_BR_MPRED_CCACHE	0x040ac	// P8 + P9
+#define PM_BR_PRED_PCACHE	0x048a0	// P9 only
+#define PM_BR_MPRED_PCACHE	0x048b0	// P9 only
+
+#define SPRN_PVR 287
+
+int spectre_v2_test(void)
+{
+	enum spectre_v2_state state;
+	struct event events[4];
+	s64 miss_percent;
+	bool is_p9;
+
+	state = get_sysfs_state();
+	if (state == UNKNOWN) {
+		printf("Error: couldn't determine spectre_v2 mitigation state?\n");
+		return -1;
+	}
+
+	memset(events, 0, sizeof(events));
+
+	setup_event(&events[0], PM_BR_PRED_CCACHE,  "PM_BR_PRED_CCACHE");
+	setup_event(&events[1], PM_BR_MPRED_CCACHE, "PM_BR_MPRED_CCACHE");
+	FAIL_IF(event_open(&events[0]));
+	FAIL_IF(event_open_with_group(&events[1], events[0].fd) == -1);
+
+	is_p9 = ((mfspr(SPRN_PVR) >>  16) & 0xFFFF) == 0x4e;
+
+	if (is_p9) {
+		// Count pattern cache too
+		setup_event(&events[2], PM_BR_PRED_PCACHE,  "PM_BR_PRED_PCACHE");
+		setup_event(&events[3], PM_BR_MPRED_PCACHE, "PM_BR_MPRED_PCACHE");
+
+		FAIL_IF(event_open_with_group(&events[2], events[0].fd) == -1);
+		FAIL_IF(event_open_with_group(&events[3], events[0].fd) == -1);
+	}
+
+	FAIL_IF(do_count_loop(events, is_p9, &miss_percent));
+
+	event_report_justified(&events[0], 18, 10);
+	event_report_justified(&events[1], 18, 10);
+	event_close(&events[0]);
+	event_close(&events[1]);
+
+	if (is_p9) {
+		event_report_justified(&events[2], 18, 10);
+		event_report_justified(&events[3], 18, 10);
+		event_close(&events[2]);
+		event_close(&events[3]);
+	}
+
+	printf("Miss percent %lld %%\n", miss_percent);
+
+	switch (state) {
+	case VULNERABLE:
+	case NOT_AFFECTED:
+	case COUNT_CACHE_FLUSH_SW:
+	case COUNT_CACHE_FLUSH_HW:
+		// These should all not affect userspace branch prediction
+		if (miss_percent > 15) {
+			printf("Branch misses > 15%% unexpected in this configuration!\n");
+			printf("Possible mis-match between reported & actual mitigation\n");
+			return 1;
+		}
+		break;
+	case BRANCH_SERIALISATION:
+		// This seems to affect userspace branch prediction a bit?
+		if (miss_percent > 25) {
+			printf("Branch misses > 25%% unexpected in this configuration!\n");
+			printf("Possible mis-match between reported & actual mitigation\n");
+			return 1;
+		}
+		break;
+	case COUNT_CACHE_DISABLED:
+		if (miss_percent < 95) {
+			printf("Branch misses < 20%% unexpected in this configuration!\n");
+			printf("Possible mis-match between reported & actual mitigation\n");
+			return 1;
+		}
+		break;
+	case UNKNOWN:
+	case BTB_FLUSH:
+		printf("Not sure!\n");
+		return 1;
+	}
+
+	printf("OK - Measured branch prediction rates match reported spectre v2 mitigation.\n");
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	return test_harness(spectre_v2_test, "spectre_v2");
+}
diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index ed62f4153d3e..5c7dbd693584 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -127,6 +127,26 @@ bool is_ppc64le(void)
 	return strcmp(uts.machine, "ppc64le") == 0;
 }
 
+int read_sysfs_file(char *fpath, char *result, size_t result_size)
+{
+	char path[PATH_MAX] = "/sys/";
+	int rc = -1, fd;
+
+	strncat(path, fpath, PATH_MAX - strlen(path) - 1);
+
+	if ((fd = open(path, O_RDONLY)) < 0)
+		return rc;
+
+	rc = read(fd, result, result_size);
+
+	close(fd);
+
+	if (rc < 0)
+		return rc;
+
+	return 0;
+}
+
 int read_debugfs_file(char *debugfs_file, int *result)
 {
 	int rc = -1, fd;
-- 
2.20.1

