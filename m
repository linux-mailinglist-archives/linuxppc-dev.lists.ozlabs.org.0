Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F56C22E4A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 06:13:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFRJ03d6zzF1P6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 14:13:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFR1c1nk0zF0l1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 14:01:08 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06R3WLsh030291; Mon, 27 Jul 2020 00:00:57 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32gh92xfpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 00:00:57 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06R3gHi6052025;
 Mon, 27 Jul 2020 00:00:57 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32gh92xfnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 00:00:56 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06R40qw9022646;
 Mon, 27 Jul 2020 04:00:54 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 32gcqk12tf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 04:00:54 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06R40p0r43450382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 04:00:51 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C34B052050;
 Mon, 27 Jul 2020 04:00:51 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7E12452052;
 Mon, 27 Jul 2020 04:00:50 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 6/6] selftests/powerpc: Add test for pkey siginfo
 verification
Date: Mon, 27 Jul 2020 09:30:40 +0530
Message-Id: <ce40b6ee270bda52e8f4088578ed2faf7d1d509a.1595821792.git.sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1595821792.git.sandipan@linux.ibm.com>
References: <cover.1595821792.git.sandipan@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_02:2020-07-24,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=3 lowpriorityscore=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270021
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
Cc: fweimer@redhat.com, aneesh.kumar@linux.ibm.com, linuxram@us.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit c46241a370a61 ("powerpc/pkeys: Check vma before
returning key fault error to the user") fixes a bug which
causes the kernel to set the wrong pkey in siginfo when a
pkey fault occurs after two competing threads that have
allocated different pkeys, one fully permissive and the
other restrictive, attempt to protect a common page at the
same time. This adds a test to detect the bug.

Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 tools/testing/selftests/powerpc/mm/.gitignore |   1 +
 tools/testing/selftests/powerpc/mm/Makefile   |   5 +-
 .../selftests/powerpc/mm/pkey_siginfo.c       | 332 ++++++++++++++++++
 3 files changed, 337 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/mm/pkey_siginfo.c

diff --git a/tools/testing/selftests/powerpc/mm/.gitignore b/tools/testing/selftests/powerpc/mm/.gitignore
index 8f841f925baa5..36ec2c4ccdea4 100644
--- a/tools/testing/selftests/powerpc/mm/.gitignore
+++ b/tools/testing/selftests/powerpc/mm/.gitignore
@@ -9,3 +9,4 @@ large_vm_fork_separation
 bad_accesses
 tlbie_test
 pkey_exec_prot
+pkey_siginfo
diff --git a/tools/testing/selftests/powerpc/mm/Makefile b/tools/testing/selftests/powerpc/mm/Makefile
index f9fa0ba7435c4..558b7ccc93932 100644
--- a/tools/testing/selftests/powerpc/mm/Makefile
+++ b/tools/testing/selftests/powerpc/mm/Makefile
@@ -3,7 +3,8 @@ noarg:
 	$(MAKE) -C ../
 
 TEST_GEN_PROGS := hugetlb_vs_thp_test subpage_prot prot_sao segv_errors wild_bctr \
-		  large_vm_fork_separation bad_accesses pkey_exec_prot
+		  large_vm_fork_separation bad_accesses pkey_exec_prot \
+		  pkey_siginfo
 TEST_GEN_PROGS_EXTENDED := tlbie_test
 TEST_GEN_FILES := tempfile
 
@@ -18,8 +19,10 @@ $(OUTPUT)/wild_bctr: CFLAGS += -m64
 $(OUTPUT)/large_vm_fork_separation: CFLAGS += -m64
 $(OUTPUT)/bad_accesses: CFLAGS += -m64
 $(OUTPUT)/pkey_exec_prot: CFLAGS += -m64
+$(OUTPUT)/pkey_siginfo: CFLAGS += -m64
 
 $(OUTPUT)/tempfile:
 	dd if=/dev/zero of=$@ bs=64k count=1
 
 $(OUTPUT)/tlbie_test: LDLIBS += -lpthread
+$(OUTPUT)/pkey_siginfo: LDLIBS += -lpthread
diff --git a/tools/testing/selftests/powerpc/mm/pkey_siginfo.c b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
new file mode 100644
index 0000000000000..0c57f88f7f01a
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
@@ -0,0 +1,332 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2020, Sandipan Das, IBM Corp.
+ *
+ * Test if the signal information reports the correct memory protection
+ * key upon getting a key access violation fault for a page that was
+ * attempted to be protected by two different keys from two competing
+ * threads at the same time.
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <signal.h>
+
+#include <unistd.h>
+#include <pthread.h>
+#include <sys/mman.h>
+
+#include "pkeys.h"
+
+#define PPC_INST_NOP	0x60000000
+#define PPC_INST_BLR	0x4e800020
+#define PROT_RWX	(PROT_READ | PROT_WRITE | PROT_EXEC)
+
+#define NUM_ITERATIONS	1000000
+
+static volatile sig_atomic_t perm_pkey, rest_pkey;
+static volatile sig_atomic_t rights, fault_count;
+static volatile unsigned int *volatile fault_addr;
+static pthread_barrier_t iteration_barrier;
+
+static void segv_handler(int signum, siginfo_t *sinfo, void *ctx)
+{
+	void *pgstart;
+	size_t pgsize;
+	int pkey;
+
+	pkey = siginfo_pkey(sinfo);
+
+	/* Check if this fault originated from a pkey access violation */
+	if (sinfo->si_code != SEGV_PKUERR) {
+		sigsafe_err("got a fault for an unexpected reason\n");
+		_exit(1);
+	}
+
+	/* Check if this fault originated from the expected address */
+	if (sinfo->si_addr != (void *) fault_addr) {
+		sigsafe_err("got a fault for an unexpected address\n");
+		_exit(1);
+	}
+
+	/* Check if this fault originated from the restrictive pkey */
+	if (pkey != rest_pkey) {
+		sigsafe_err("got a fault for an unexpected pkey\n");
+		_exit(1);
+	}
+
+	/* Check if too many faults have occurred for the same iteration */
+	if (fault_count > 0) {
+		sigsafe_err("got too many faults for the same address\n");
+		_exit(1);
+	}
+
+	pgsize = getpagesize();
+	pgstart = (void *) ((unsigned long) fault_addr & ~(pgsize - 1));
+
+	/*
+	 * If the current fault occurred due to lack of execute rights,
+	 * reassociate the page with the exec-only pkey since execute
+	 * rights cannot be changed directly for the faulting pkey as
+	 * IAMR is inaccessible from userspace.
+	 *
+	 * Otherwise, if the current fault occurred due to lack of
+	 * read-write rights, change the AMR permission bits for the
+	 * pkey.
+	 *
+	 * This will let the test continue.
+	 */
+	if (rights == PKEY_DISABLE_EXECUTE &&
+	    mprotect(pgstart, pgsize, PROT_EXEC))
+		_exit(1);
+	else
+		pkey_set_rights(pkey, 0);
+
+	fault_count++;
+}
+
+struct region {
+	unsigned long rights;
+	unsigned int *base;
+	size_t size;
+};
+
+static void *protect(void *p)
+{
+	unsigned long rights;
+	unsigned int *base;
+	size_t size;
+	int tid, i;
+
+	tid = gettid();
+	base = ((struct region *) p)->base;
+	size = ((struct region *) p)->size;
+	FAIL_IF_EXIT(!base);
+
+	/* No read, write and execute restrictions */
+	rights = 0;
+
+	printf("tid %d, pkey permissions are %s\n", tid, pkey_rights(rights));
+
+	/* Allocate the permissive pkey */
+	perm_pkey = sys_pkey_alloc(0, rights);
+	FAIL_IF_EXIT(perm_pkey < 0);
+
+	/*
+	 * Repeatedly try to protect the common region with a permissive
+	 * pkey
+	 */
+	for (i = 0; i < NUM_ITERATIONS; i++) {
+		/*
+		 * Wait until the other thread has finished allocating the
+		 * restrictive pkey or until the next iteration has begun
+		 */
+		pthread_barrier_wait(&iteration_barrier);
+
+		/* Try to associate the permissive pkey with the region */
+		FAIL_IF_EXIT(sys_pkey_mprotect(base, size, PROT_RWX,
+					       perm_pkey));
+	}
+
+	/* Free the permissive pkey */
+	sys_pkey_free(perm_pkey);
+
+	return NULL;
+}
+
+static void *protect_access(void *p)
+{
+	size_t size, numinsns;
+	unsigned int *base;
+	int tid, i;
+
+	tid = gettid();
+	base = ((struct region *) p)->base;
+	size = ((struct region *) p)->size;
+	rights = ((struct region *) p)->rights;
+	numinsns = size / sizeof(base[0]);
+	FAIL_IF_EXIT(!base);
+
+	/* Allocate the restrictive pkey */
+	rest_pkey = sys_pkey_alloc(0, rights);
+	FAIL_IF_EXIT(rest_pkey < 0);
+
+	printf("tid %d, pkey permissions are %s\n", tid, pkey_rights(rights));
+	printf("tid %d, %s randomly in range [%p, %p]\n", tid,
+	       (rights == PKEY_DISABLE_EXECUTE) ? "execute" :
+	       (rights == PKEY_DISABLE_WRITE)  ? "write" : "read",
+	       base, base + numinsns);
+
+	/*
+	 * Repeatedly try to protect the common region with a restrictive
+	 * pkey and read, write or execute from it
+	 */
+	for (i = 0; i < NUM_ITERATIONS; i++) {
+		/*
+		 * Wait until the other thread has finished allocating the
+		 * permissive pkey or until the next iteration has begun
+		 */
+		pthread_barrier_wait(&iteration_barrier);
+
+		/* Try to associate the restrictive pkey with the region */
+		FAIL_IF_EXIT(sys_pkey_mprotect(base, size, PROT_RWX,
+					       rest_pkey));
+
+		/* Choose a random instruction word address from the region */
+		fault_addr = base + (rand() % numinsns);
+		fault_count = 0;
+
+		switch (rights) {
+		/* Read protection test */
+		case PKEY_DISABLE_ACCESS:
+			/*
+			 * Read an instruction word from the region and
+			 * verify if it has not been overwritten to
+			 * something unexpected
+			 */
+			FAIL_IF_EXIT(*fault_addr != PPC_INST_NOP &&
+				     *fault_addr != PPC_INST_BLR);
+			break;
+
+		/* Write protection test */
+		case PKEY_DISABLE_WRITE:
+			/*
+			 * Write an instruction word to the region and
+			 * verify if the overwrite has succeeded
+			 */
+			*fault_addr = PPC_INST_BLR;
+			FAIL_IF_EXIT(*fault_addr != PPC_INST_BLR);
+			break;
+
+		/* Execute protection test */
+		case PKEY_DISABLE_EXECUTE:
+			/* Jump to the region and execute instructions */
+			asm volatile(
+				"mtctr	%0; bctrl"
+				: : "r"(fault_addr) : "ctr", "lr");
+			break;
+		}
+
+		/*
+		 * Restore the restrictions originally imposed by the
+		 * restrictive pkey as the signal handler would have
+		 * cleared out the corresponding AMR bits
+		 */
+		pkey_set_rights(rest_pkey, rights);
+	}
+
+	/* Free restrictive pkey */
+	sys_pkey_free(rest_pkey);
+
+	return NULL;
+}
+
+static void reset_pkeys(unsigned long rights)
+{
+	int pkeys[NR_PKEYS], i;
+
+	/* Exhaustively allocate all available pkeys */
+	for (i = 0; i < NR_PKEYS; i++)
+		pkeys[i] = sys_pkey_alloc(0, rights);
+
+	/* Free all allocated pkeys */
+	for (i = 0; i < NR_PKEYS; i++)
+		sys_pkey_free(pkeys[i]);
+}
+
+static int test(void)
+{
+	pthread_t prot_thread, pacc_thread;
+	struct sigaction act;
+	pthread_attr_t attr;
+	size_t numinsns;
+	struct region r;
+	int ret, i;
+
+	srand(time(NULL));
+	ret = pkeys_unsupported();
+	if (ret)
+		return ret;
+
+	/* Allocate the region */
+	r.size = getpagesize();
+	r.base = mmap(NULL, r.size, PROT_RWX,
+		      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	FAIL_IF(r.base == MAP_FAILED);
+
+	/*
+	 * Fill the region with no-ops with a branch at the end
+	 * for returning to the caller
+	 */
+	numinsns = r.size / sizeof(r.base[0]);
+	for (i = 0; i < numinsns - 1; i++)
+		r.base[i] = PPC_INST_NOP;
+	r.base[i] = PPC_INST_BLR;
+
+	/* Setup SIGSEGV handler */
+	act.sa_handler = 0;
+	act.sa_sigaction = segv_handler;
+	FAIL_IF(sigprocmask(SIG_SETMASK, 0, &act.sa_mask) != 0);
+	act.sa_flags = SA_SIGINFO;
+	act.sa_restorer = 0;
+	FAIL_IF(sigaction(SIGSEGV, &act, NULL) != 0);
+
+	/*
+	 * For these tests, the parent process should clear all bits of
+	 * AMR and IAMR, i.e. impose no restrictions, for all available
+	 * pkeys. This will be the base for the initial AMR and IAMR
+	 * values for all the test thread pairs.
+	 *
+	 * If the AMR and IAMR bits of all available pkeys are cleared
+	 * before running the tests and a fault is generated when
+	 * attempting to read, write or execute instructions from a
+	 * pkey protected region, the pkey responsible for this must be
+	 * the one from the protect-and-access thread since the other
+	 * one is fully permissive. Despite that, if the pkey reported
+	 * by siginfo is not the restrictive pkey, then there must be a
+	 * kernel bug.
+	 */
+	reset_pkeys(0);
+
+	/* Setup barrier for protect and protect-and-access threads */
+	FAIL_IF(pthread_attr_init(&attr) != 0);
+	FAIL_IF(pthread_barrier_init(&iteration_barrier, NULL, 2) != 0);
+
+	/* Setup and start protect and protect-and-read threads */
+	puts("starting thread pair (protect, protect-and-read)");
+	r.rights = PKEY_DISABLE_ACCESS;
+	FAIL_IF(pthread_create(&prot_thread, &attr, &protect, &r) != 0);
+	FAIL_IF(pthread_create(&pacc_thread, &attr, &protect_access, &r) != 0);
+	FAIL_IF(pthread_join(prot_thread, NULL) != 0);
+	FAIL_IF(pthread_join(pacc_thread, NULL) != 0);
+
+	/* Setup and start protect and protect-and-write threads */
+	puts("starting thread pair (protect, protect-and-write)");
+	r.rights = PKEY_DISABLE_WRITE;
+	FAIL_IF(pthread_create(&prot_thread, &attr, &protect, &r) != 0);
+	FAIL_IF(pthread_create(&pacc_thread, &attr, &protect_access, &r) != 0);
+	FAIL_IF(pthread_join(prot_thread, NULL) != 0);
+	FAIL_IF(pthread_join(pacc_thread, NULL) != 0);
+
+	/* Setup and start protect and protect-and-execute threads */
+	puts("starting thread pair (protect, protect-and-execute)");
+	r.rights = PKEY_DISABLE_EXECUTE;
+	FAIL_IF(pthread_create(&prot_thread, &attr, &protect, &r) != 0);
+	FAIL_IF(pthread_create(&pacc_thread, &attr, &protect_access, &r) != 0);
+	FAIL_IF(pthread_join(prot_thread, NULL) != 0);
+	FAIL_IF(pthread_join(pacc_thread, NULL) != 0);
+
+	/* Cleanup */
+	FAIL_IF(pthread_attr_destroy(&attr) != 0);
+	FAIL_IF(pthread_barrier_destroy(&iteration_barrier) != 0);
+	munmap(r.base, r.size);
+
+	return 0;
+}
+
+int main(void)
+{
+	test_harness(test, "pkey_siginfo");
+}
-- 
2.25.1

