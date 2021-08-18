Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E94103EF6C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 02:15:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gq7hp5qmRz3cQd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 10:15:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=sh+QVsG0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--seanjc.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com;
 envelope-from=3cfacyqykdjedzv84x19916z.x97638fiaax-yzg63ded.9k6vwd.9c1@flex--seanjc.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=sh+QVsG0; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gq7dG3sMMz3bWC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 10:12:34 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 c63-20020a25e5420000b0290580b26e708aso950288ybh.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 17:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=HGsy1AYzAaNzOmCNqthC1tCvP/rp7O5tcVnL7Zz8tBI=;
 b=sh+QVsG0ol48I0ldcdsbPdihtJRoNYZPe0D2QiktQlpO0cKb5nXByr86R+F1H8DvLa
 betvTNViADCpa2luSEIvXPH5Tm/3E/6pbWXlndcN5d2jGZuAgR9zTROn/eA+cgT/+AJq
 mUFR/B4LKLSlB7Pd9Px3yOreOSwSXzVr7/o1BEs7xvewKCyRqqCyuksorGhU6Nuc9cBN
 V/nM7cq6QqTmJEM+a/L8JscwoAxz6CA4MUNwpv1pJkJSU9IFycWQDD1jE95g5EcZOY6z
 phLtJF9xi4TR7XKdoU09nlD54YfMfylCa9FlWIHeq58yCT/f9K1eaok/zfAbCBch1u+n
 7bEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=HGsy1AYzAaNzOmCNqthC1tCvP/rp7O5tcVnL7Zz8tBI=;
 b=iMa2TVcvT9w0lRGrRrr5Iq5diHzcxzUXN3zkTvcyRpW21+v/j6PwuQEZXOPyfnOlQk
 aG1wEAoB6HGbmcoW2C3MWtO5SU2xUHsN/HS3lBouJ5SXPnr+vBpwJeXc4bwxET5kJVXL
 zbJJYXAlZdnYW2+y3fzUxM23xJTMrPPbIovrY26aDErckkiXrFb9CkHoh5/Frkr8Evem
 S6B1IoYDSnbQt0yVsXxiepEujs0dP0aAZniPJULShLFFIkkJjxzNJsCzHn96/x6a4T30
 q9LAey6vSABPtm3kqvKNBJboHyDuIGw+YSAYuroYHfXgSGkcOAyoMzLmy1KGqnHt8A73
 OKrg==
X-Gm-Message-State: AOAM533IeN5eHaezJjfs3HEuk4QMKRW8z/YMdmTVuQSGKWaYEfTWJFZ7
 S7EhEfZTcN2grVuFWnv90Yk+vEBei3o=
X-Google-Smtp-Source: ABdhPJxKuNoi8BurtLgbuppXh+jBMCzbufP37yZkuLi1u+HzA7x/QRXt4AsLOGUGibA7aBEUElEO9ttIYL8=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:158e:55a:74dd:5197])
 (user=seanjc job=sendgmr) by 2002:a25:db82:: with SMTP id
 g124mr7742228ybf.46.1629245552432; 
 Tue, 17 Aug 2021 17:12:32 -0700 (PDT)
Date: Tue, 17 Aug 2021 17:12:09 -0700
In-Reply-To: <20210818001210.4073390-1-seanjc@google.com>
Message-Id: <20210818001210.4073390-5-seanjc@google.com>
Mime-Version: 1.0
References: <20210818001210.4073390-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 4/5] KVM: selftests: Add a test for KVM_RUN+rseq to detect
 task migration bugs
From: Sean Christopherson <seanjc@google.com>
To: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>, Oleg Nesterov <oleg@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, 
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 Ben Gardon <bgardon@google.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
 Peter Foley <pefoley@google.com>, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Sean Christopherson <seanjc@google.com>,
 Shakeel Butt <shakeelb@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
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
 tools/testing/selftests/kvm/rseq_test.c | 131 ++++++++++++++++++++++++
 3 files changed, 135 insertions(+)
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
index 000000000000..90ed535eded7
--- /dev/null
+++ b/tools/testing/selftests/kvm/rseq_test.c
@@ -0,0 +1,131 @@
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
+#define RSEQ_SIG 0xdeadbeef
+
+static pthread_t migration_thread;
+static cpu_set_t possible_mask;
+static bool done;
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
+	for (i = 0; i < 20000; i++) {
+		cpu = i % nr_cpus;
+		if (!CPU_ISSET(cpu, &possible_mask))
+			continue;
+
+		CPU_SET(cpu, &allowed_mask);
+
+		r = sched_setaffinity(0, sizeof(allowed_mask), &allowed_mask);
+		TEST_ASSERT(!r, "sched_setaffinity failed, errno = %d (%s)", errno,
+			    strerror(errno));
+
+		CPU_CLR(cpu, &allowed_mask);
+
+		usleep(10);
+	}
+	done = true;
+	return NULL;
+}
+
+int main(int argc, char *argv[])
+{
+	struct kvm_vm *vm;
+	u32 cpu, rseq_cpu;
+	int r;
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
+	while (!done) {
+		vcpu_run(vm, VCPU_ID);
+		TEST_ASSERT(get_ucall(vm, VCPU_ID, NULL) == UCALL_SYNC,
+			    "Guest failed?");
+
+		cpu = sched_getcpu();
+		rseq_cpu = READ_ONCE(__rseq.cpu_id);
+
+		/*
+		 * Verify rseq's CPU matches sched's CPU, and that sched's CPU
+		 * is stable.  This doesn't handle the case where the task is
+		 * migrated between sched_getcpu() and reading rseq, and again
+		 * between reading rseq and sched_getcpu(), but in practice no
+		 * false positives have been observed, while on the other hand
+		 * blocking migration while this thread reads CPUs messes with
+		 * the timing and prevents hitting failures on a buggy kernel.
+		 */
+		TEST_ASSERT(rseq_cpu == cpu || cpu != sched_getcpu(),
+			    "rseq CPU = %d, sched CPU = %d\n", rseq_cpu, cpu);
+	}
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
2.33.0.rc1.237.g0d66db33f3-goog

