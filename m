Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06507F523A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 18:09:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478mvr6m3szF5v3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 04:09:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="2NplVyIr"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478mdX3kwhzF7Zy
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 03:56:48 +1100 (AEDT)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C773120656;
 Fri,  8 Nov 2019 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573232206;
 bh=Tagl3dqlME39jKEiwNwwIJa2r7VfVKZVveKIBX3A3P4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=2NplVyIrIvg917ng+LbHscYPFLP27dZOj+E/kzV6EQW9hpGRiYJQ7s/2/v7wn0Xpn
 FcR2q4g0O6qh07y03+oq1yv2X8lJ8YXmyCH+N7IQT8ZG1WBgyoq843gihYQFBGeZvh
 XUNRDIeABmJw4KvM2yiIrI8PgG5ZMfCLPw2IJhnc=
Subject: Patch "selftests/powerpc: Add test case for tlbie vs mtpidr ordering
 issue" has been added to the 4.14-stable tree
To: 20190924035254.24612-4-aneesh.kumar@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, sandipan@linux.ibm.com
From: <gregkh@linuxfoundation.org>
Date: Fri, 08 Nov 2019 17:56:25 +0100
In-Reply-To: <20191017080505.8348-5-sandipan@linux.ibm.com>
Message-ID: <157323218524149@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is a note to let you know that I've just added the patch titled

    selftests/powerpc: Add test case for tlbie vs mtpidr ordering issue

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     selftests-powerpc-add-test-case-for-tlbie-vs-mtpidr-ordering-issue.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Fri 08 Nov 2019 05:55:09 PM CET
From: Sandipan Das <sandipan@linux.ibm.com>
Date: Thu, 17 Oct 2019 13:35:04 +0530
Subject: selftests/powerpc: Add test case for tlbie vs mtpidr ordering issue
To: gregkh@linuxfoundation.org
Cc: stable@vger.kernel.org, aneesh.kumar@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Message-ID: <20191017080505.8348-5-sandipan@linux.ibm.com>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

commit 93cad5f789951eaa27c3392b15294b4e51253944 upstream.

Cc: stable@vger.kernel.org # v4.14
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
[mpe: Some minor fixes to make it build]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20190924035254.24612-4-aneesh.kumar@linux.ibm.com
[sandipan: Backported to v4.14]
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/testing/selftests/powerpc/mm/Makefile     |    2 
 tools/testing/selftests/powerpc/mm/tlbie_test.c |  734 ++++++++++++++++++++++++
 2 files changed, 736 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/mm/tlbie_test.c

--- a/tools/testing/selftests/powerpc/mm/Makefile
+++ b/tools/testing/selftests/powerpc/mm/Makefile
@@ -3,6 +3,7 @@ noarg:
 	$(MAKE) -C ../
 
 TEST_GEN_PROGS := hugetlb_vs_thp_test subpage_prot prot_sao
+TEST_GEN_PROGS_EXTENDED := tlbie_test
 TEST_GEN_FILES := tempfile
 
 include ../../lib.mk
@@ -14,3 +15,4 @@ $(OUTPUT)/prot_sao: ../utils.c
 $(OUTPUT)/tempfile:
 	dd if=/dev/zero of=$@ bs=64k count=1
 
+$(OUTPUT)/tlbie_test: LDLIBS += -lpthread
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mm/tlbie_test.c
@@ -0,0 +1,734 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright 2019, Nick Piggin, Gautham R. Shenoy, Aneesh Kumar K.V, IBM Corp.
+ */
+
+/*
+ *
+ * Test tlbie/mtpidr race. We have 4 threads doing flush/load/compare/store
+ * sequence in a loop. The same threads also rung a context switch task
+ * that does sched_yield() in loop.
+ *
+ * The snapshot thread mark the mmap area PROT_READ in between, make a copy
+ * and copy it back to the original area. This helps us to detect if any
+ * store continued to happen after we marked the memory PROT_READ.
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <sys/ipc.h>
+#include <sys/shm.h>
+#include <sys/stat.h>
+#include <sys/time.h>
+#include <linux/futex.h>
+#include <unistd.h>
+#include <asm/unistd.h>
+#include <string.h>
+#include <stdlib.h>
+#include <fcntl.h>
+#include <sched.h>
+#include <time.h>
+#include <stdarg.h>
+#include <sched.h>
+#include <pthread.h>
+#include <signal.h>
+#include <sys/prctl.h>
+
+static inline void dcbf(volatile unsigned int *addr)
+{
+	__asm__ __volatile__ ("dcbf %y0; sync" : : "Z"(*(unsigned char *)addr) : "memory");
+}
+
+static void err_msg(char *msg)
+{
+
+	time_t now;
+	time(&now);
+	printf("=================================\n");
+	printf("    Error: %s\n", msg);
+	printf("    %s", ctime(&now));
+	printf("=================================\n");
+	exit(1);
+}
+
+static char *map1;
+static char *map2;
+static pid_t rim_process_pid;
+
+/*
+ * A "rim-sequence" is defined to be the sequence of the following
+ * operations performed on a memory word:
+ *	1) FLUSH the contents of that word.
+ *	2) LOAD the contents of that word.
+ *	3) COMPARE the contents of that word with the content that was
+ *	           previously stored at that word
+ *	4) STORE new content into that word.
+ *
+ * The threads in this test that perform the rim-sequence are termed
+ * as rim_threads.
+ */
+
+/*
+ * A "corruption" is defined to be the failed COMPARE operation in a
+ * rim-sequence.
+ *
+ * A rim_thread that detects a corruption informs about it to all the
+ * other rim_threads, and the mem_snapshot thread.
+ */
+static volatile unsigned int corruption_found;
+
+/*
+ * This defines the maximum number of rim_threads in this test.
+ *
+ * The THREAD_ID_BITS denote the number of bits required
+ * to represent the thread_ids [0..MAX_THREADS - 1].
+ * We are being a bit paranoid here and set it to 8 bits,
+ * though 6 bits suffice.
+ *
+ */
+#define MAX_THREADS 		64
+#define THREAD_ID_BITS		8
+#define THREAD_ID_MASK		((1 << THREAD_ID_BITS) - 1)
+static unsigned int rim_thread_ids[MAX_THREADS];
+static pthread_t rim_threads[MAX_THREADS];
+
+
+/*
+ * Each rim_thread works on an exclusive "chunk" of size
+ * RIM_CHUNK_SIZE.
+ *
+ * The ith rim_thread works on the ith chunk.
+ *
+ * The ith chunk begins at
+ * map1 + (i * RIM_CHUNK_SIZE)
+ */
+#define RIM_CHUNK_SIZE  	1024
+#define BITS_PER_BYTE 		8
+#define WORD_SIZE     		(sizeof(unsigned int))
+#define WORD_BITS		(WORD_SIZE * BITS_PER_BYTE)
+#define WORDS_PER_CHUNK		(RIM_CHUNK_SIZE/WORD_SIZE)
+
+static inline char *compute_chunk_start_addr(unsigned int thread_id)
+{
+	char *chunk_start;
+
+	chunk_start = (char *)((unsigned long)map1 +
+			       (thread_id * RIM_CHUNK_SIZE));
+
+	return chunk_start;
+}
+
+/*
+ * The "word-offset" of a word-aligned address inside a chunk, is
+ * defined to be the number of words that precede the address in that
+ * chunk.
+ *
+ * WORD_OFFSET_BITS denote the number of bits required to represent
+ * the word-offsets of all the word-aligned addresses of a chunk.
+ */
+#define WORD_OFFSET_BITS	(__builtin_ctz(WORDS_PER_CHUNK))
+#define WORD_OFFSET_MASK	((1 << WORD_OFFSET_BITS) - 1)
+
+static inline unsigned int compute_word_offset(char *start, unsigned int *addr)
+{
+	unsigned int delta_bytes, ret;
+	delta_bytes = (unsigned long)addr - (unsigned long)start;
+
+	ret = delta_bytes/WORD_SIZE;
+
+	return ret;
+}
+
+/*
+ * A "sweep" is defined to be the sequential execution of the
+ * rim-sequence by a rim_thread on its chunk one word at a time,
+ * starting from the first word of its chunk and ending with the last
+ * word of its chunk.
+ *
+ * Each sweep of a rim_thread is uniquely identified by a sweep_id.
+ * SWEEP_ID_BITS denote the number of bits required to represent
+ * the sweep_ids of rim_threads.
+ *
+ * As to why SWEEP_ID_BITS are computed as a function of THREAD_ID_BITS,
+ * WORD_OFFSET_BITS, and WORD_BITS, see the "store-pattern" below.
+ */
+#define SWEEP_ID_BITS		(WORD_BITS - (THREAD_ID_BITS + WORD_OFFSET_BITS))
+#define SWEEP_ID_MASK		((1 << SWEEP_ID_BITS) - 1)
+
+/*
+ * A "store-pattern" is the word-pattern that is stored into a word
+ * location in the 4)STORE step of the rim-sequence.
+ *
+ * In the store-pattern, we shall encode:
+ *
+ *      - The thread-id of the rim_thread performing the store
+ *        (The most significant THREAD_ID_BITS)
+ *
+ *      - The word-offset of the address into which the store is being
+ *        performed (The next WORD_OFFSET_BITS)
+ *
+ *      - The sweep_id of the current sweep in which the store is
+ *        being performed. (The lower SWEEP_ID_BITS)
+ *
+ * Store Pattern: 32 bits
+ * |------------------|--------------------|---------------------------------|
+ * |    Thread id     |  Word offset       |         sweep_id                |
+ * |------------------|--------------------|---------------------------------|
+ *    THREAD_ID_BITS     WORD_OFFSET_BITS          SWEEP_ID_BITS
+ *
+ * In the store pattern, the (Thread-id + Word-offset) uniquely identify the
+ * address to which the store is being performed i.e,
+ *    address == map1 +
+ *              (Thread-id * RIM_CHUNK_SIZE) + (Word-offset * WORD_SIZE)
+ *
+ * And the sweep_id in the store pattern identifies the time when the
+ * store was performed by the rim_thread.
+ *
+ * We shall use this property in the 3)COMPARE step of the
+ * rim-sequence.
+ */
+#define SWEEP_ID_SHIFT	0
+#define WORD_OFFSET_SHIFT	(SWEEP_ID_BITS)
+#define THREAD_ID_SHIFT		(WORD_OFFSET_BITS + SWEEP_ID_BITS)
+
+/*
+ * Compute the store pattern for a given thread with id @tid, at
+ * location @addr in the sweep identified by @sweep_id
+ */
+static inline unsigned int compute_store_pattern(unsigned int tid,
+						 unsigned int *addr,
+						 unsigned int sweep_id)
+{
+	unsigned int ret = 0;
+	char *start = compute_chunk_start_addr(tid);
+	unsigned int word_offset = compute_word_offset(start, addr);
+
+	ret += (tid & THREAD_ID_MASK) << THREAD_ID_SHIFT;
+	ret += (word_offset & WORD_OFFSET_MASK) << WORD_OFFSET_SHIFT;
+	ret += (sweep_id & SWEEP_ID_MASK) << SWEEP_ID_SHIFT;
+	return ret;
+}
+
+/* Extract the thread-id from the given store-pattern */
+static inline unsigned int extract_tid(unsigned int pattern)
+{
+	unsigned int ret;
+
+	ret = (pattern >> THREAD_ID_SHIFT) & THREAD_ID_MASK;
+	return ret;
+}
+
+/* Extract the word-offset from the given store-pattern */
+static inline unsigned int extract_word_offset(unsigned int pattern)
+{
+	unsigned int ret;
+
+	ret = (pattern >> WORD_OFFSET_SHIFT) & WORD_OFFSET_MASK;
+
+	return ret;
+}
+
+/* Extract the sweep-id from the given store-pattern */
+static inline unsigned int extract_sweep_id(unsigned int pattern)
+
+{
+	unsigned int ret;
+
+	ret = (pattern >> SWEEP_ID_SHIFT) & SWEEP_ID_MASK;
+
+	return ret;
+}
+
+/************************************************************
+ *                                                          *
+ *          Logging the output of the verification          *
+ *                                                          *
+ ************************************************************/
+#define LOGDIR_NAME_SIZE 100
+static char logdir[LOGDIR_NAME_SIZE];
+
+static FILE *fp[MAX_THREADS];
+static const char logfilename[] ="Thread-%02d-Chunk";
+
+static inline void start_verification_log(unsigned int tid,
+					  unsigned int *addr,
+					  unsigned int cur_sweep_id,
+					  unsigned int prev_sweep_id)
+{
+	FILE *f;
+	char logfile[30];
+	char path[LOGDIR_NAME_SIZE + 30];
+	char separator[2] = "/";
+	char *chunk_start = compute_chunk_start_addr(tid);
+	unsigned int size = RIM_CHUNK_SIZE;
+
+	sprintf(logfile, logfilename, tid);
+	strcpy(path, logdir);
+	strcat(path, separator);
+	strcat(path, logfile);
+	f = fopen(path, "w");
+
+	if (!f) {
+		err_msg("Unable to create logfile\n");
+	}
+
+	fp[tid] = f;
+
+	fprintf(f, "----------------------------------------------------------\n");
+	fprintf(f, "PID                = %d\n", rim_process_pid);
+	fprintf(f, "Thread id          = %02d\n", tid);
+	fprintf(f, "Chunk Start Addr   = 0x%016lx\n", (unsigned long)chunk_start);
+	fprintf(f, "Chunk Size         = %d\n", size);
+	fprintf(f, "Next Store Addr    = 0x%016lx\n", (unsigned long)addr);
+	fprintf(f, "Current sweep-id   = 0x%08x\n", cur_sweep_id);
+	fprintf(f, "Previous sweep-id  = 0x%08x\n", prev_sweep_id);
+	fprintf(f, "----------------------------------------------------------\n");
+}
+
+static inline void log_anamoly(unsigned int tid, unsigned int *addr,
+			       unsigned int expected, unsigned int observed)
+{
+	FILE *f = fp[tid];
+
+	fprintf(f, "Thread %02d: Addr 0x%lx: Expected 0x%x, Observed 0x%x\n",
+	        tid, (unsigned long)addr, expected, observed);
+	fprintf(f, "Thread %02d: Expected Thread id   = %02d\n", tid, extract_tid(expected));
+	fprintf(f, "Thread %02d: Observed Thread id   = %02d\n", tid, extract_tid(observed));
+	fprintf(f, "Thread %02d: Expected Word offset = %03d\n", tid, extract_word_offset(expected));
+	fprintf(f, "Thread %02d: Observed Word offset = %03d\n", tid, extract_word_offset(observed));
+	fprintf(f, "Thread %02d: Expected sweep-id    = 0x%x\n", tid, extract_sweep_id(expected));
+	fprintf(f, "Thread %02d: Observed sweep-id    = 0x%x\n", tid, extract_sweep_id(observed));
+	fprintf(f, "----------------------------------------------------------\n");
+}
+
+static inline void end_verification_log(unsigned int tid, unsigned nr_anamolies)
+{
+	FILE *f = fp[tid];
+	char logfile[30];
+	char path[LOGDIR_NAME_SIZE + 30];
+	char separator[] = "/";
+
+	fclose(f);
+
+	if (nr_anamolies == 0) {
+		remove(path);
+		return;
+	}
+
+	sprintf(logfile, logfilename, tid);
+	strcpy(path, logdir);
+	strcat(path, separator);
+	strcat(path, logfile);
+
+	printf("Thread %02d chunk has %d corrupted words. For details check %s\n",
+		tid, nr_anamolies, path);
+}
+
+/*
+ * When a COMPARE step of a rim-sequence fails, the rim_thread informs
+ * everyone else via the shared_memory pointed to by
+ * corruption_found variable. On seeing this, every thread verifies the
+ * content of its chunk as follows.
+ *
+ * Suppose a thread identified with @tid was about to store (but not
+ * yet stored) to @next_store_addr in its current sweep identified
+ * @cur_sweep_id. Let @prev_sweep_id indicate the previous sweep_id.
+ *
+ * This implies that for all the addresses @addr < @next_store_addr,
+ * Thread @tid has already performed a store as part of its current
+ * sweep. Hence we expect the content of such @addr to be:
+ *    |-------------------------------------------------|
+ *    | tid   | word_offset(addr) |    cur_sweep_id     |
+ *    |-------------------------------------------------|
+ *
+ * Since Thread @tid is yet to perform stores on address
+ * @next_store_addr and above, we expect the content of such an
+ * address @addr to be:
+ *    |-------------------------------------------------|
+ *    | tid   | word_offset(addr) |    prev_sweep_id    |
+ *    |-------------------------------------------------|
+ *
+ * The verifier function @verify_chunk does this verification and logs
+ * any anamolies that it finds.
+ */
+static void verify_chunk(unsigned int tid, unsigned int *next_store_addr,
+		  unsigned int cur_sweep_id,
+		  unsigned int prev_sweep_id)
+{
+	unsigned int *iter_ptr;
+	unsigned int size = RIM_CHUNK_SIZE;
+	unsigned int expected;
+	unsigned int observed;
+	char *chunk_start = compute_chunk_start_addr(tid);
+
+	int nr_anamolies = 0;
+
+	start_verification_log(tid, next_store_addr,
+			       cur_sweep_id, prev_sweep_id);
+
+	for (iter_ptr = (unsigned int *)chunk_start;
+	     (unsigned long)iter_ptr < (unsigned long)chunk_start + size;
+	     iter_ptr++) {
+		unsigned int expected_sweep_id;
+
+		if (iter_ptr < next_store_addr) {
+			expected_sweep_id = cur_sweep_id;
+		} else {
+			expected_sweep_id = prev_sweep_id;
+		}
+
+		expected = compute_store_pattern(tid, iter_ptr, expected_sweep_id);
+
+		dcbf((volatile unsigned int*)iter_ptr); //Flush before reading
+		observed = *iter_ptr;
+
+	        if (observed != expected) {
+			nr_anamolies++;
+			log_anamoly(tid, iter_ptr, expected, observed);
+		}
+	}
+
+	end_verification_log(tid, nr_anamolies);
+}
+
+static void set_pthread_cpu(pthread_t th, int cpu)
+{
+	cpu_set_t run_cpu_mask;
+	struct sched_param param;
+
+	CPU_ZERO(&run_cpu_mask);
+	CPU_SET(cpu, &run_cpu_mask);
+	pthread_setaffinity_np(th, sizeof(cpu_set_t), &run_cpu_mask);
+
+	param.sched_priority = 1;
+	if (0 && sched_setscheduler(0, SCHED_FIFO, &param) == -1) {
+		/* haven't reproduced with this setting, it kills random preemption which may be a factor */
+		fprintf(stderr, "could not set SCHED_FIFO, run as root?\n");
+	}
+}
+
+static void set_mycpu(int cpu)
+{
+	cpu_set_t run_cpu_mask;
+	struct sched_param param;
+
+	CPU_ZERO(&run_cpu_mask);
+	CPU_SET(cpu, &run_cpu_mask);
+	sched_setaffinity(0, sizeof(cpu_set_t), &run_cpu_mask);
+
+	param.sched_priority = 1;
+	if (0 && sched_setscheduler(0, SCHED_FIFO, &param) == -1) {
+		fprintf(stderr, "could not set SCHED_FIFO, run as root?\n");
+	}
+}
+
+static volatile int segv_wait;
+
+static void segv_handler(int signo, siginfo_t *info, void *extra)
+{
+	while (segv_wait) {
+		sched_yield();
+	}
+
+}
+
+static void set_segv_handler(void)
+{
+	struct sigaction sa;
+
+	sa.sa_flags = SA_SIGINFO;
+	sa.sa_sigaction = segv_handler;
+
+	if (sigaction(SIGSEGV, &sa, NULL) == -1) {
+		perror("sigaction");
+		exit(EXIT_FAILURE);
+	}
+}
+
+int timeout = 0;
+/*
+ * This function is executed by every rim_thread.
+ *
+ * This function performs sweeps over the exclusive chunks of the
+ * rim_threads executing the rim-sequence one word at a time.
+ */
+static void *rim_fn(void *arg)
+{
+	unsigned int tid = *((unsigned int *)arg);
+
+	int size = RIM_CHUNK_SIZE;
+	char *chunk_start = compute_chunk_start_addr(tid);
+
+	unsigned int prev_sweep_id;
+	unsigned int cur_sweep_id = 0;
+
+	/* word access */
+	unsigned int pattern = cur_sweep_id;
+	unsigned int *pattern_ptr = &pattern;
+	unsigned int *w_ptr, read_data;
+
+	set_segv_handler();
+
+	/*
+	 * Let us initialize the chunk:
+	 *
+	 * Each word-aligned address addr in the chunk,
+	 * is initialized to :
+	 *    |-------------------------------------------------|
+	 *    | tid   | word_offset(addr) |         0           |
+	 *    |-------------------------------------------------|
+	 */
+	for (w_ptr = (unsigned int *)chunk_start;
+	     (unsigned long)w_ptr < (unsigned long)(chunk_start) + size;
+	     w_ptr++) {
+
+		*pattern_ptr = compute_store_pattern(tid, w_ptr, cur_sweep_id);
+		*w_ptr = *pattern_ptr;
+	}
+
+	while (!corruption_found && !timeout) {
+		prev_sweep_id = cur_sweep_id;
+		cur_sweep_id = cur_sweep_id + 1;
+
+		for (w_ptr = (unsigned int *)chunk_start;
+		     (unsigned long)w_ptr < (unsigned long)(chunk_start) + size;
+		     w_ptr++)  {
+			unsigned int old_pattern;
+
+			/*
+			 * Compute the pattern that we would have
+			 * stored at this location in the previous
+			 * sweep.
+			 */
+			old_pattern = compute_store_pattern(tid, w_ptr, prev_sweep_id);
+
+			/*
+			 * FLUSH:Ensure that we flush the contents of
+			 *       the cache before loading
+			 */
+			dcbf((volatile unsigned int*)w_ptr); //Flush
+
+			/* LOAD: Read the value */
+			read_data = *w_ptr; //Load
+
+			/*
+			 * COMPARE: Is it the same as what we had stored
+			 *          in the previous sweep ? It better be!
+			 */
+			if (read_data != old_pattern) {
+				/* No it isn't! Tell everyone */
+				corruption_found = 1;
+			}
+
+			/*
+			 * Before performing a store, let us check if
+			 * any rim_thread has found a corruption.
+			 */
+			if (corruption_found || timeout) {
+				/*
+				 * Yes. Someone (including us!) has found
+				 * a corruption :(
+				 *
+				 * Let us verify that our chunk is
+				 * correct.
+				 */
+				/* But first, let us allow the dust to settle down! */
+				verify_chunk(tid, w_ptr, cur_sweep_id, prev_sweep_id);
+
+				return 0;
+			}
+
+			/*
+			 * Compute the new pattern that we are going
+			 * to write to this location
+			 */
+			*pattern_ptr = compute_store_pattern(tid, w_ptr, cur_sweep_id);
+
+			/*
+			 * STORE: Now let us write this pattern into
+			 *        the location
+			 */
+			*w_ptr = *pattern_ptr;
+		}
+	}
+
+	return NULL;
+}
+
+
+static unsigned long start_cpu = 0;
+static unsigned long nrthreads = 4;
+
+static pthread_t mem_snapshot_thread;
+
+static void *mem_snapshot_fn(void *arg)
+{
+	int page_size = getpagesize();
+	size_t size = page_size;
+	void *tmp = malloc(size);
+
+	while (!corruption_found && !timeout) {
+		/* Stop memory migration once corruption is found */
+		segv_wait = 1;
+
+		mprotect(map1, size, PROT_READ);
+
+		/*
+		 * Load from the working alias (map1). Loading from map2
+		 * also fails.
+		 */
+		memcpy(tmp, map1, size);
+
+		/*
+		 * Stores must go via map2 which has write permissions, but
+		 * the corrupted data tends to be seen in the snapshot buffer,
+		 * so corruption does not appear to be introduced at the
+		 * copy-back via map2 alias here.
+		 */
+		memcpy(map2, tmp, size);
+		/*
+		 * Before releasing other threads, must ensure the copy
+		 * back to
+		 */
+		asm volatile("sync" ::: "memory");
+		mprotect(map1, size, PROT_READ|PROT_WRITE);
+		asm volatile("sync" ::: "memory");
+		segv_wait = 0;
+
+		usleep(1); /* This value makes a big difference */
+	}
+
+	return 0;
+}
+
+void alrm_sighandler(int sig)
+{
+	timeout = 1;
+}
+
+int main(int argc, char *argv[])
+{
+	int c;
+	int page_size = getpagesize();
+	time_t now;
+	int i, dir_error;
+	pthread_attr_t attr;
+	key_t shm_key = (key_t) getpid();
+	int shmid, run_time = 20 * 60;
+	struct sigaction sa_alrm;
+
+	snprintf(logdir, LOGDIR_NAME_SIZE,
+		 "/tmp/logdir-%u", (unsigned int)getpid());
+	while ((c = getopt(argc, argv, "r:hn:l:t:")) != -1) {
+		switch(c) {
+		case 'r':
+			start_cpu = strtoul(optarg, NULL, 10);
+			break;
+		case 'h':
+			printf("%s [-r <start_cpu>] [-n <nrthreads>] [-l <logdir>] [-t <timeout>]\n", argv[0]);
+			exit(0);
+			break;
+		case 'n':
+			nrthreads = strtoul(optarg, NULL, 10);
+			break;
+		case 'l':
+			strncpy(logdir, optarg, LOGDIR_NAME_SIZE);
+			break;
+		case 't':
+			run_time = strtoul(optarg, NULL, 10);
+			break;
+		default:
+			printf("invalid option\n");
+			exit(0);
+			break;
+		}
+	}
+
+	if (nrthreads > MAX_THREADS)
+		nrthreads = MAX_THREADS;
+
+	shmid = shmget(shm_key, page_size, IPC_CREAT|0666);
+	if (shmid < 0) {
+		err_msg("Failed shmget\n");
+	}
+
+	map1 = shmat(shmid, NULL, 0);
+	if (map1 == (void *) -1) {
+		err_msg("Failed shmat");
+	}
+
+	map2 = shmat(shmid, NULL, 0);
+	if (map2 == (void *) -1) {
+		err_msg("Failed shmat");
+	}
+
+	dir_error = mkdir(logdir, 0755);
+
+	if (dir_error) {
+		err_msg("Failed mkdir");
+	}
+
+	printf("start_cpu list:%lu\n", start_cpu);
+	printf("number of worker threads:%lu + 1 snapshot thread\n", nrthreads);
+	printf("Allocated address:0x%016lx + secondary map:0x%016lx\n", (unsigned long)map1, (unsigned long)map2);
+	printf("logdir at : %s\n", logdir);
+	printf("Timeout: %d seconds\n", run_time);
+
+	time(&now);
+	printf("=================================\n");
+	printf("     Starting Test\n");
+	printf("     %s", ctime(&now));
+	printf("=================================\n");
+
+	for (i = 0; i < nrthreads; i++) {
+		if (1 && !fork()) {
+			prctl(PR_SET_PDEATHSIG, SIGKILL);
+			set_mycpu(start_cpu + i);
+			for (;;)
+				sched_yield();
+			exit(0);
+		}
+	}
+
+
+	sa_alrm.sa_handler = &alrm_sighandler;
+	sigemptyset(&sa_alrm.sa_mask);
+	sa_alrm.sa_flags = 0;
+
+	if (sigaction(SIGALRM, &sa_alrm, 0) == -1) {
+		err_msg("Failed signal handler registration\n");
+	}
+
+	alarm(run_time);
+
+	pthread_attr_init(&attr);
+	for (i = 0; i < nrthreads; i++) {
+		rim_thread_ids[i] = i;
+		pthread_create(&rim_threads[i], &attr, rim_fn, &rim_thread_ids[i]);
+		set_pthread_cpu(rim_threads[i], start_cpu + i);
+	}
+
+	pthread_create(&mem_snapshot_thread, &attr, mem_snapshot_fn, map1);
+	set_pthread_cpu(mem_snapshot_thread, start_cpu + i);
+
+
+	pthread_join(mem_snapshot_thread, NULL);
+	for (i = 0; i < nrthreads; i++) {
+		pthread_join(rim_threads[i], NULL);
+	}
+
+	if (!timeout) {
+		time(&now);
+		printf("=================================\n");
+		printf("      Data Corruption Detected\n");
+		printf("      %s", ctime(&now));
+		printf("      See logfiles in %s\n", logdir);
+		printf("=================================\n");
+		return 1;
+	}
+	return 0;
+}


Patches currently in stable-queue which might be from sandipan@linux.ibm.com are

queue-4.14/powerpc-book3s64-mm-don-t-do-tlbie-fixup-for-some-hardware-revisions.patch
queue-4.14/selftests-powerpc-add-test-case-for-tlbie-vs-mtpidr-ordering-issue.patch
queue-4.14/selftests-powerpc-fix-compile-error-on-tlbie_test-due-to-newer-gcc.patch
queue-4.14/powerpc-mm-fixup-tlbie-vs-mtpidr-mtlpidr-ordering-issue-on-power9.patch
queue-4.14/powerpc-mm-fixup-tlbie-vs-store-ordering-issue-on-power9.patch
queue-4.14/powerpc-book3s64-radix-rename-cpu_ftr_p9_tlbie_bug-feature-flag.patch
