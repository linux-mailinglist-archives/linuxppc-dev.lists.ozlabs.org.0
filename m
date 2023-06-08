Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 258EB7275BF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 05:30:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qc8qz6Nftz3fB4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 13:30:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RXSSoF6/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=RXSSoF6/;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qc8j85Sjwz3c71
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 13:25:00 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b01dac1a82so180175ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 20:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686194698; x=1688786698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKaHgr+HL1117S3Jb0aiH5upNruURl+KhWKkgZPggeU=;
        b=RXSSoF6/UG7yQ3r8E8hAePxnc2Sm1OYVC6HZJwNG7h/9pNEy0g4rhTDZORYspmc4j+
         JlKG7R/MRd5qsIXjy4XTgvLjLo+4nMBz72TXeGkeEJuf2mV4SxpotNfga70I7vBkzKgE
         Ok15EbcgRrzT/XsJ+gCoL7oYSsrqq5iMth45B+y2RzHIvvBtPNS/tKMizfol39chJ7F5
         2EoUTqjGPnOPBpCxnBwphX9kxwKf8xIPi3rtK6ycBGa0+Bk4DmMAdmeHzVDc9kuHBfFL
         SO/uX2LZkKld7RViInfEeHW4Sk8M5ldvrPOhWkVBSWg55tH4//wbFJPKquxzs2UjPTu4
         C1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686194698; x=1688786698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKaHgr+HL1117S3Jb0aiH5upNruURl+KhWKkgZPggeU=;
        b=e0odKcdrAJLM2ETJGRqSZTAXw4lbko9dwNoQlgmkVa96A9/NJ1VpuKo93law8De/p0
         LZ8uFneeHS1ILFgzctZ22IWLnuywvQDHhskMH9tk/OrDzhmczGzuCVuyjoxebInRJ+c3
         72M8FYtZniPaicrOMQeT0paufrQuamHnkOQobaJhP8fkelKDhVv5GNUXw6E8taGBcK+1
         /rWTNVxgty5opitWot/m2s0qw6FQ38IszCqP6R3L0kT4m1iuB4s2601OBWdAUomlHtzJ
         P3kw56yyHn3P+/lTNbJkGncqXfv6DtFKW37HMOnOn+fUXg01WwMqH9nxyiFxDu8dAPwk
         EeZA==
X-Gm-Message-State: AC+VfDzqDKeENxQGr46M1YwC+ELimUjcTU7Ex9WVPReLkz+31nhwJ8RO
	3NkA4kzeerinPrTClm86Sbk=
X-Google-Smtp-Source: ACHHUZ7I51jMXcRhU4L0iRuO4wTdv5VNRALpAastt2XMOL+tebny1cqSEqZmj7MsagjiwC9XLtJeEg==
X-Received: by 2002:a17:90a:1901:b0:259:e75a:bdc9 with SMTP id 1-20020a17090a190100b00259e75abdc9mr827229pjg.27.1686194698170;
        Wed, 07 Jun 2023 20:24:58 -0700 (PDT)
Received: from wheely.local0.net (58-6-224-112.tpgi.com.au. [58.6.224.112])
        by smtp.gmail.com with ESMTPSA id s12-20020a17090a5d0c00b0025930e50e28sm2015629pji.41.2023.06.07.20.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 20:24:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 6/6] KVM: PPC: selftests: Add interrupt performance tester
Date: Thu,  8 Jun 2023 13:24:25 +1000
Message-Id: <20230608032425.59796-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608032425.59796-1-npiggin@gmail.com>
References: <20230608032425.59796-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a little perf tester for interrupts that go to guest, host, and
userspace.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../selftests/kvm/powerpc/interrupt_perf.c    | 199 ++++++++++++++++++
 2 files changed, 200 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/powerpc/interrupt_perf.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index aa3a8ca676c2..834f98971b0c 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -184,6 +184,7 @@ TEST_GEN_PROGS_riscv += kvm_page_table_test
 TEST_GEN_PROGS_riscv += set_memory_region_test
 TEST_GEN_PROGS_riscv += kvm_binary_stats_test
 
+TEST_GEN_PROGS_powerpc += powerpc/interrupt_perf
 TEST_GEN_PROGS_powerpc += powerpc/null_test
 TEST_GEN_PROGS_powerpc += powerpc/rtas_hcall
 TEST_GEN_PROGS_powerpc += powerpc/tlbiel_test
diff --git a/tools/testing/selftests/kvm/powerpc/interrupt_perf.c b/tools/testing/selftests/kvm/powerpc/interrupt_perf.c
new file mode 100644
index 000000000000..50d078899e22
--- /dev/null
+++ b/tools/testing/selftests/kvm/powerpc/interrupt_perf.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Test basic guest interrupt/exit performance.
+ */
+
+#define _GNU_SOURCE /* for program_invocation_short_name */
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sched.h>
+#include <sys/ioctl.h>
+#include <sys/time.h>
+#include <sys/sysinfo.h>
+#include <signal.h>
+
+#include "test_util.h"
+#include "kvm_util.h"
+#include "kselftest.h"
+#include "processor.h"
+#include "helpers.h"
+#include "hcall.h"
+
+static bool timeout;
+static unsigned long count;
+static struct kvm_vm *kvm_vm;
+
+static void set_timer(int sec)
+{
+	struct itimerval timer;
+
+	timeout = false;
+
+	timer.it_value.tv_sec  = sec;
+	timer.it_value.tv_usec = 0;
+	timer.it_interval = timer.it_value;
+	TEST_ASSERT(setitimer(ITIMER_REAL, &timer, NULL) == 0,
+			"setitimer failed %s", strerror(errno));
+}
+
+static void sigalrm_handler(int sig)
+{
+	timeout = true;
+	sync_global_to_guest(kvm_vm, timeout);
+}
+
+static void init_timers(void)
+{
+	TEST_ASSERT(signal(SIGALRM, sigalrm_handler) != SIG_ERR,
+		    "Failed to register SIGALRM handler, errno = %d (%s)",
+		    errno, strerror(errno));
+}
+
+static void program_interrupt_handler(struct ex_regs *regs)
+{
+	regs->nia += 4;
+}
+
+static void program_interrupt_guest_code(void)
+{
+	unsigned long nr = 0;
+
+	while (!timeout) {
+		asm volatile("trap");
+		nr++;
+		barrier();
+	}
+	count = nr;
+
+	GUEST_DONE();
+}
+
+static void program_interrupt_test(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	/* Create VM */
+	vm = vm_create_with_one_vcpu(&vcpu, program_interrupt_guest_code);
+	kvm_vm = vm;
+	vm_install_exception_handler(vm, 0x700, program_interrupt_handler);
+
+	set_timer(1);
+
+	while (!timeout) {
+		vcpu_run(vcpu);
+		barrier();
+	}
+
+	sync_global_from_guest(vm, count);
+
+	kvm_vm = NULL;
+	vm_install_exception_handler(vm, 0x700, NULL);
+
+	kvm_vm_free(vm);
+
+	printf("%lu guest interrupts per second\n", count);
+	count = 0;
+}
+
+static void heai_guest_code(void)
+{
+	unsigned long nr = 0;
+
+	while (!timeout) {
+		asm volatile(".long 0");
+		nr++;
+		barrier();
+	}
+	count = nr;
+
+	GUEST_DONE();
+}
+
+static void heai_test(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	/* Create VM */
+	vm = vm_create_with_one_vcpu(&vcpu, heai_guest_code);
+	kvm_vm = vm;
+	vm_install_exception_handler(vm, 0x700, program_interrupt_handler);
+
+	set_timer(1);
+
+	while (!timeout) {
+		vcpu_run(vcpu);
+		barrier();
+	}
+
+	sync_global_from_guest(vm, count);
+
+	kvm_vm = NULL;
+	vm_install_exception_handler(vm, 0x700, NULL);
+
+	kvm_vm_free(vm);
+
+	printf("%lu guest exits per second\n", count);
+	count = 0;
+}
+
+static void hcall_guest_code(void)
+{
+	for (;;)
+		hcall0(H_RTAS);
+}
+
+static void hcall_test(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	/* Create VM */
+	vm = vm_create_with_one_vcpu(&vcpu, hcall_guest_code);
+	kvm_vm = vm;
+
+	set_timer(1);
+
+	while (!timeout) {
+		vcpu_run(vcpu);
+		count++;
+		barrier();
+	}
+
+	kvm_vm = NULL;
+
+	kvm_vm_free(vm);
+
+	printf("%lu KVM exits per second\n", count);
+	count = 0;
+}
+
+struct testdef {
+	const char *name;
+	void (*test)(void);
+} testlist[] = {
+	{ "guest interrupt test", program_interrupt_test},
+	{ "guest exit test", heai_test},
+	{ "KVM exit test", hcall_test},
+};
+
+int main(int argc, char *argv[])
+{
+	int idx;
+
+	ksft_print_header();
+
+	ksft_set_plan(ARRAY_SIZE(testlist));
+
+	init_timers();
+
+	for (idx = 0; idx < ARRAY_SIZE(testlist); idx++) {
+		testlist[idx].test();
+		ksft_test_result_pass("%s\n", testlist[idx].name);
+	}
+
+	ksft_finished();	/* Print results and exit() accordingly */
+}
-- 
2.40.1

