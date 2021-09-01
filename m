Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D60373FE420
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 22:33:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0G3v5RdFz3cC0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 06:33:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=VbGD7hFS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--seanjc.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com;
 envelope-from=39eivyqykdio6so1xqu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--seanjc.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=VbGD7hFS; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0G0R18d7z2yKK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 06:30:47 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 p69-20020a254248000000b00598282d96ceso727760yba.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Sep 2021 13:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=ykZtX60InoQ+yRr8PfNM+D6t0AhIzKhZ8NE3DcoiQ+0=;
 b=VbGD7hFSMcn3APw1x+XM4lLFJ0MYVk58v4lg6AsGRwMuFh2ExwSZjtDiZzbORwbbmh
 UMUrxHsshbrDPBeO3ZjJYWohvdyC+I8Q/3pft9FEPJJ+Ir3VAAbGEQMayu2XLzKBhUpI
 +gG90ohxHRHxZkRB5GrLB8pnPgjG0zbrGti/p16qp/XAkq46gvWZo4ML0ZwHBcdXwlWC
 Dikqw4viH/ZUQf5gFwGKBqHepL+9lS0kKmT69EPnyR5BCTjrrLYYdDt0G0yIECdLhgvK
 HE0iYvGZ0aBOky7Esy+0+0RsgYLwm0Pb33e1UHxVYJ2M8rjpQ2llYy5zkg/Gq27scGMC
 TQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=ykZtX60InoQ+yRr8PfNM+D6t0AhIzKhZ8NE3DcoiQ+0=;
 b=XKQQsHqzD085neBlIepi/AhmwynpPzYNNO6cN5KhbHgN9eiAYKoHRlxfF42lp+r+I8
 PkqGIDRQTWDXR0qwKczVUOKiTGVBaXdtFyLu1aohHp1YFXcXg5GTB7Y+JEpKwXmbX0Ge
 N/M88luZDfDK5YLWdktcmzClcxfjl53thHLoxvPPDcOW8nl2hwNNU6AGhx6yD8zxRjS6
 Zo6O4NYCnxb8io2UuLa+6UQaVy0aDrh7dtIxuOHHE8WAcwiuqiUfuYfF9hwjCS+GW0mQ
 78b1X8e9uKFkv4n7JfWu35ioShUlcUOGD7DX/pE8siYDFaF1IsMlvEbTSo4pbAkiHEp7
 19Sw==
X-Gm-Message-State: AOAM532halgykYoOaZlWUc1OYowafym4E2N5R/Cddk+jkDUQlqJnSQss
 BChg/vA/3Jtq3vJeZ4B9i9wE5XsTBtA=
X-Google-Smtp-Source: ABdhPJwy6mwPsuPn6i9gOnF5FRxK541PnX4XH95Z9xHMikbHF7JBMmGCqEm/yzgRV0Ga4VDORpl0WETPuqM=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:9935:5a5e:c7b6:e649])
 (user=seanjc job=sendgmr) by 2002:a25:4907:: with SMTP id
 w7mr1842981yba.393.1630528245035; 
 Wed, 01 Sep 2021 13:30:45 -0700 (PDT)
Date: Wed,  1 Sep 2021 13:30:29 -0700
In-Reply-To: <20210901203030.1292304-1-seanjc@google.com>
Message-Id: <20210901203030.1292304-5-seanjc@google.com>
Mime-Version: 1.0
References: <20210901203030.1292304-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH v3 4/5] KVM: selftests: Add a test for KVM_RUN+rseq to detect
 task migration bugs
From: Sean Christopherson <seanjc@google.com>
To: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Oleg Nesterov <oleg@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
 Andy Lutomirski <luto@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, Ben Gardon <bgardon@google.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, Peter Foley <pefoley@google.com>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Sean Christopherson <seanjc@google.com>, Shakeel Butt <shakeelb@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a test to verify an rseq's CPU ID is updated correctly if the task is
migrated while the kernel is handling KVM_RUN.  This is a regression test
for a bug introduced by commit 72c3c0fe54a3 ("x86/kvm: Use generic xfer
to guest work function"), where TIF_NOTIFY_RESUME would be cleared by KVM
without updating rseq, leading to a stale CPU ID and other badness.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/.gitignore  |   1 +
 tools/testing/selftests/kvm/Makefile    |   3 +
 tools/testing/selftests/kvm/rseq_test.c | 236 ++++++++++++++++++++++++
 3 files changed, 240 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/rseq_test.c

diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
index 0709af0144c8..6d031ff6b68e 100644
--- a/tools/testing/selftests/kvm/.gitignore
+++ b/tools/testing/selftests/kvm/.gitignore
@@ -47,6 +47,7 @@
 /kvm_page_table_test
 /memslot_modification_stress_test
 /memslot_perf_test
+/rseq_test
 /set_memory_region_test
 /steal_time
 /kvm_binary_stats_test
diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 5832f510a16c..0756e79cb513 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -80,6 +80,7 @@ TEST_GEN_PROGS_x86_64 += kvm_create_max_vcpus
 TEST_GEN_PROGS_x86_64 += kvm_page_table_test
 TEST_GEN_PROGS_x86_64 += memslot_modification_stress_test
 TEST_GEN_PROGS_x86_64 += memslot_perf_test
+TEST_GEN_PROGS_x86_64 += rseq_test
 TEST_GEN_PROGS_x86_64 += set_memory_region_test
 TEST_GEN_PROGS_x86_64 += steal_time
 TEST_GEN_PROGS_x86_64 += kvm_binary_stats_test
@@ -92,6 +93,7 @@ TEST_GEN_PROGS_aarch64 += dirty_log_test
 TEST_GEN_PROGS_aarch64 += dirty_log_perf_test
 TEST_GEN_PROGS_aarch64 += kvm_create_max_vcpus
 TEST_GEN_PROGS_aarch64 += kvm_page_table_test
+TEST_GEN_PROGS_aarch64 += rseq_test
 TEST_GEN_PROGS_aarch64 += set_memory_region_test
 TEST_GEN_PROGS_aarch64 += steal_time
 TEST_GEN_PROGS_aarch64 += kvm_binary_stats_test
@@ -103,6 +105,7 @@ TEST_GEN_PROGS_s390x += demand_paging_test
 TEST_GEN_PROGS_s390x += dirty_log_test
 TEST_GEN_PROGS_s390x += kvm_create_max_vcpus
 TEST_GEN_PROGS_s390x += kvm_page_table_test
+TEST_GEN_PROGS_s390x += rseq_test
 TEST_GEN_PROGS_s390x += set_memory_region_test
 TEST_GEN_PROGS_s390x += kvm_binary_stats_test
 
diff --git a/tools/testing/selftests/kvm/rseq_test.c b/tools/testing/selftests/kvm/rseq_test.c
new file mode 100644
index 000000000000..060538bd405a
--- /dev/null
+++ b/tools/testing/selftests/kvm/rseq_test.c
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#define _GNU_SOURCE /* for program_invocation_short_name */
+#include <errno.h>
+#include <fcntl.h>
+#include <pthread.h>
+#include <sched.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <signal.h>
+#include <syscall.h>
+#include <sys/ioctl.h>
+#include <asm/barrier.h>
+#include <linux/atomic.h>
+#include <linux/rseq.h>
+#include <linux/unistd.h>
+
+#include "kvm_util.h"
+#include "processor.h"
+#include "test_util.h"
+
+#define VCPU_ID 0
+
+static __thread volatile struct rseq __rseq = {
+	.cpu_id = RSEQ_CPU_ID_UNINITIALIZED,
+};
+
+/*
+ * Use an arbitrary, bogus signature for configuring rseq, this test does not
+ * actually enter an rseq critical section.
+ */
+#define RSEQ_SIG 0xdeadbeef
+
+/*
+ * Any bug related to task migration is likely to be timing-dependent; perform
+ * a large number of migrations to reduce the odds of a false negative.
+ */
+#define NR_TASK_MIGRATIONS 100000
+
+static pthread_t migration_thread;
+static cpu_set_t possible_mask;
+static bool done;
+
+static atomic_t seq_cnt;
+
+static void guest_code(void)
+{
+	for (;;)
+		GUEST_SYNC(0);
+}
+
+static void sys_rseq(int flags)
+{
+	int r;
+
+	r = syscall(__NR_rseq, &__rseq, sizeof(__rseq), flags, RSEQ_SIG);
+	TEST_ASSERT(!r, "rseq failed, errno = %d (%s)", errno, strerror(errno));
+}
+
+static void *migration_worker(void *ign)
+{
+	cpu_set_t allowed_mask;
+	int r, i, nr_cpus, cpu;
+
+	CPU_ZERO(&allowed_mask);
+
+	nr_cpus = CPU_COUNT(&possible_mask);
+
+	for (i = 0; i < NR_TASK_MIGRATIONS; i++) {
+		cpu = i % nr_cpus;
+		if (!CPU_ISSET(cpu, &possible_mask))
+			continue;
+
+		CPU_SET(cpu, &allowed_mask);
+
+		/*
+		 * Bump the sequence count twice to allow the reader to detect
+		 * that a migration may have occurred in between rseq and sched
+		 * CPU ID reads.  An odd sequence count indicates a migration
+		 * is in-progress, while a completely different count indicates
+		 * a migration occurred since the count was last read.
+		 */
+		atomic_inc(&seq_cnt);
+
+		/*
+		 * Ensure the odd count is visible while sched_getcpu() isn't
+		 * stable, i.e. while changing affinity is in-progress.
+		 */
+		smp_wmb();
+		r = sched_setaffinity(0, sizeof(allowed_mask), &allowed_mask);
+		TEST_ASSERT(!r, "sched_setaffinity failed, errno = %d (%s)",
+			    errno, strerror(errno));
+		smp_wmb();
+		atomic_inc(&seq_cnt);
+
+		CPU_CLR(cpu, &allowed_mask);
+
+		/*
+		 * Wait 1-10us before proceeding to the next iteration and more
+		 * specifically, before bumping seq_cnt again.  A delay is
+		 * needed on three fronts:
+		 *
+		 *  1. To allow sched_setaffinity() to prompt migration before
+		 *     ioctl(KVM_RUN) enters the guest so that TIF_NOTIFY_RESUME
+		 *     (or TIF_NEED_RESCHED, which indirectly leads to handling
+		 *     NOTIFY_RESUME) is handled in KVM context.
+		 *
+		 *     If NOTIFY_RESUME/NEED_RESCHED is set after KVM enters
+		 *     the guest, the guest will trigger a IO/MMIO exit all the
+		 *     way to userspace and the TIF flags will be handled by
+		 *     the generic "exit to userspace" logic, not by KVM.  The
+		 *     exit to userspace is necessary to give the test a chance
+		 *     to check the rseq CPU ID (see #2).
+		 *
+		 *     Alternatively, guest_code() could include an instruction
+		 *     to trigger an exit that is handled by KVM, but any such
+		 *     exit requires architecture specific code.
+		 *
+		 *  2. To let ioctl(KVM_RUN) make its way back to the test
+		 *     before the next round of migration.  The test's check on
+		 *     the rseq CPU ID must wait for migration to complete in
+		 *     order to avoid false positive, thus any kernel rseq bug
+		 *     will be missed if the next migration starts before the
+		 *     check completes.
+		 *
+		 *  3. To ensure the read-side makes efficient forward progress,
+		 *     e.g. if sched_getcpu() involves a syscall.  Stalling the
+		 *     read-side means the test will spend more time waiting for
+		 *     sched_getcpu() to stabilize and less time trying to hit
+		 *     the timing-dependent bug.
+		 *
+		 * Because any bug in this area is likely to be timing-dependent,
+		 * run with a range of delays at 1us intervals from 1us to 10us
+		 * as a best effort to avoid tuning the test to the point where
+		 * it can hit _only_ the original bug and not detect future
+		 * regressions.
+		 *
+		 * The original bug can reproduce with a delay up to ~500us on
+		 * x86-64, but starts to require more iterations to reproduce
+		 * as the delay creeps above ~10us, and the average runtime of
+		 * each iteration obviously increases as well.  Cap the delay
+		 * at 10us to keep test runtime reasonable while minimizing
+		 * potential coverage loss.
+		 *
+		 * The lower bound for reproducing the bug is likely below 1us,
+		 * e.g. failures occur on x86-64 with nanosleep(0), but at that
+		 * point the overhead of the syscall likely dominates the delay.
+		 * Use usleep() for simplicity and to avoid unnecessary kernel
+		 * dependencies.
+		 */
+		usleep((i % 10) + 1);
+	}
+	done = true;
+	return NULL;
+}
+
+int main(int argc, char *argv[])
+{
+	int r, i, snapshot;
+	struct kvm_vm *vm;
+	u32 cpu, rseq_cpu;
+
+	/* Tell stdout not to buffer its content */
+	setbuf(stdout, NULL);
+
+	r = sched_getaffinity(0, sizeof(possible_mask), &possible_mask);
+	TEST_ASSERT(!r, "sched_getaffinity failed, errno = %d (%s)", errno,
+		    strerror(errno));
+
+	if (CPU_COUNT(&possible_mask) < 2) {
+		print_skip("Only one CPU, task migration not possible\n");
+		exit(KSFT_SKIP);
+	}
+
+	sys_rseq(0);
+
+	/*
+	 * Create and run a dummy VM that immediately exits to userspace via
+	 * GUEST_SYNC, while concurrently migrating the process by setting its
+	 * CPU affinity.
+	 */
+	vm = vm_create_default(VCPU_ID, 0, guest_code);
+
+	pthread_create(&migration_thread, NULL, migration_worker, 0);
+
+	for (i = 0; !done; i++) {
+		vcpu_run(vm, VCPU_ID);
+		TEST_ASSERT(get_ucall(vm, VCPU_ID, NULL) == UCALL_SYNC,
+			    "Guest failed?");
+
+		/*
+		 * Verify rseq's CPU matches sched's CPU.  Ensure migration
+		 * doesn't occur between sched_getcpu() and reading the rseq
+		 * cpu_id by rereading both if the sequence count changes, or
+		 * if the count is odd (migration in-progress).
+		 */
+		do {
+			/*
+			 * Drop bit 0 to force a mismatch if the count is odd,
+			 * i.e. if a migration is in-progress.
+			 */
+			snapshot = atomic_read(&seq_cnt) & ~1;
+
+			/*
+			 * Ensure reading sched_getcpu() and rseq.cpu_id
+			 * complete in a single "no migration" window, i.e. are
+			 * not reordered across the seq_cnt reads.
+			 */
+			smp_rmb();
+			cpu = sched_getcpu();
+			rseq_cpu = READ_ONCE(__rseq.cpu_id);
+			smp_rmb();
+		} while (snapshot != atomic_read(&seq_cnt));
+
+		TEST_ASSERT(rseq_cpu == cpu,
+			    "rseq CPU = %d, sched CPU = %d\n", rseq_cpu, cpu);
+	}
+
+	/*
+	 * Sanity check that the test was able to enter the guest a reasonable
+	 * number of times, e.g. didn't get stalled too often/long waiting for
+	 * sched_getcpu() to stabilize.  A 2:1 migration:KVM_RUN ratio is a
+	 * fairly conservative ratio on x86-64, which can do _more_ KVM_RUNs
+	 * than migrations given the 1us+ delay in the migration task.
+	 */
+	TEST_ASSERT(i > (NR_TASK_MIGRATIONS / 2),
+		    "Only performed %d KVM_RUNs, task stalled too much?\n", i);
+
+	pthread_join(migration_thread, NULL);
+
+	kvm_vm_free(vm);
+
+	sys_rseq(RSEQ_FLAG_UNREGISTER);
+
+	return 0;
+}
-- 
2.33.0.153.gba50c8fa24-goog

