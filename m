Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3679F6DB8BC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 06:04:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PthTD0n72z3fgl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 14:04:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=L+xOxDgY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=L+xOxDgY;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PthNk1mhHz3fYD
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 14:00:54 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id m18so388051plx.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 21:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680926452; x=1683518452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urJp/BAdSkaYpcrB6kEZ/DojlaCXwavrN0LyIu1f5qc=;
        b=L+xOxDgYR2QlpG0E+28oMr5bGUSKSCDI026WnS7qfn/uMMhdYeDpZ4xqmipJYZOp6N
         iFPK7AVQ6lrIT34uNijzFurOF5KutXjr5I9SEH/DWJUHyDkW/DezxCRlz6j5UVq71Nkr
         MNAnCWuUBPcYUYgC3nsS6f+CE4UurWHRE6Zfi15Z2XiDtklweaPOeRNSKVtRNBNKT24a
         VR9kAXS5bqiO0jEiPk0Md0QB4sIGfC+Yh0S1UexDXwknRqXcEobVrqMy397je/Qqbb90
         XEY+tyvrC0AMLNy0OJ88ZWNUDcAeTwD4oQgL9dNJZZjP49ENkNoN/vDbspCq5pzAVW7K
         4aEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680926452; x=1683518452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urJp/BAdSkaYpcrB6kEZ/DojlaCXwavrN0LyIu1f5qc=;
        b=XKo1zdFfxZLhw0nh4byLvcUKqnsnndKETct+PL3XM/h+wL8HB2EGE3Wkapt6q59B09
         1CGO2yF5zv48qKy1HCshMNEgg1cI0tJbI0ge6TkbBHtggBhRG7obdmDn2bdwihOHPiL4
         MFNIp6k1Q6/IBqraJFbK62xwGkGqSmO8evwwnz3TrzLpOBuT+Ojsa2YHQ3qw/ciZrdpK
         ne3OWH8Vi8elALl4fqkRKI01I+voVb/thNs1l5RGLd8HabPnKXZ6WwuOleV90vaTVSqe
         aJHZ7FlHpk+/HpYhmQzVFJx2l/8fWECqw8ZNMBONyoal6ah31b1T6ibo34IjbKtwglN6
         bSug==
X-Gm-Message-State: AAQBX9ekK7VR2Q5lhCYocAAPGrzW5Iv5ISqAg1ehDEy7aP+K4wg7Br+f
	PxU8Rc0PRoEbOsP0dhu/j2I=
X-Google-Smtp-Source: AKy350aaKgOlMhod4SyXpt2dDfiAokBi2thBWxFr3j8EfN1C1a1V+aj686JZ14hHCAO9m+SOHBpE5A==
X-Received: by 2002:a05:6a20:7a95:b0:d9:4269:4d2b with SMTP id u21-20020a056a207a9500b000d942694d2bmr742983pzh.0.1680926451906;
        Fri, 07 Apr 2023 21:00:51 -0700 (PDT)
Received: from wheely.local0.net ([203.59.189.25])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b006328ee1e56csm263872pfw.2.2023.04.07.21.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 21:00:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 4/4] KVM: PPC: selftests: add selftests sanity tests
Date: Sat,  8 Apr 2023 14:00:20 +1000
Message-Id: <20230408040020.868929-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230408040020.868929-1-npiggin@gmail.com>
References: <20230408040020.868929-1-npiggin@gmail.com>
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
Cc: kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-kselftest@vger.kernel.org, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add tests that exercise very basic functions of the kvm selftests
framework, guest creation, ucalls, hcalls, copying data between guest
and host, interrupts and page faults.

These don't stress KVM so much as being useful when developing support
for powerpc.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 tools/testing/selftests/kvm/Makefile          |   2 +
 .../selftests/kvm/include/powerpc/hcall.h     |   2 +
 .../testing/selftests/kvm/powerpc/null_test.c | 166 ++++++++++++++++++
 .../selftests/kvm/powerpc/rtas_hcall.c        | 146 +++++++++++++++
 4 files changed, 316 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/powerpc/null_test.c
 create mode 100644 tools/testing/selftests/kvm/powerpc/rtas_hcall.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 908602a9f513..d4052eccaaee 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -181,6 +181,8 @@ TEST_GEN_PROGS_riscv += kvm_page_table_test
 TEST_GEN_PROGS_riscv += set_memory_region_test
 TEST_GEN_PROGS_riscv += kvm_binary_stats_test
 
+TEST_GEN_PROGS_powerpc += powerpc/null_test
+TEST_GEN_PROGS_powerpc += powerpc/rtas_hcall
 TEST_GEN_PROGS_powerpc += demand_paging_test
 TEST_GEN_PROGS_powerpc += dirty_log_test
 TEST_GEN_PROGS_powerpc += kvm_create_max_vcpus
diff --git a/tools/testing/selftests/kvm/include/powerpc/hcall.h b/tools/testing/selftests/kvm/include/powerpc/hcall.h
index ba119f5a3fef..04c7d2d13020 100644
--- a/tools/testing/selftests/kvm/include/powerpc/hcall.h
+++ b/tools/testing/selftests/kvm/include/powerpc/hcall.h
@@ -12,6 +12,8 @@
 #define UCALL_R4_UCALL	0x5715 // regular ucall, r5 contains ucall pointer
 #define UCALL_R4_SIMPLE	0x0000 // simple exit usable by asm with no ucall data
 
+#define H_RTAS		0xf000
+
 int64_t hcall0(uint64_t token);
 int64_t hcall1(uint64_t token, uint64_t arg1);
 int64_t hcall2(uint64_t token, uint64_t arg1, uint64_t arg2);
diff --git a/tools/testing/selftests/kvm/powerpc/null_test.c b/tools/testing/selftests/kvm/powerpc/null_test.c
new file mode 100644
index 000000000000..31db0b6becd6
--- /dev/null
+++ b/tools/testing/selftests/kvm/powerpc/null_test.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Tests for guest creation, run, ucall, interrupt, and vm dumping.
+ */
+
+#define _GNU_SOURCE /* for program_invocation_short_name */
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+
+#include "test_util.h"
+#include "kvm_util.h"
+#include "kselftest.h"
+#include "processor.h"
+#include "helpers.h"
+
+extern void guest_code_asm(void);
+asm(".global guest_code_asm");
+asm(".balign 4");
+asm("guest_code_asm:");
+asm("li 3,0"); // H_UCALL
+asm("li 4,0"); // UCALL_R4_SIMPLE
+asm("sc 1");
+
+static void test_asm(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code_asm);
+
+	vcpu_run(vcpu);
+	handle_ucall(vcpu, UCALL_NONE);
+
+	kvm_vm_free(vm);
+}
+
+static void guest_code_ucall(void)
+{
+	GUEST_DONE();
+}
+
+static void test_ucall(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code_ucall);
+
+	vcpu_run(vcpu);
+	handle_ucall(vcpu, UCALL_DONE);
+
+	kvm_vm_free(vm);
+}
+
+static void trap_handler(struct ex_regs *regs)
+{
+	GUEST_SYNC(1);
+	regs->nia += 4;
+}
+
+static void guest_code_trap(void)
+{
+	GUEST_SYNC(0);
+	asm volatile("trap");
+	GUEST_DONE();
+}
+
+static void test_trap(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code_trap);
+	vm_install_exception_handler(vm, 0x700, trap_handler);
+
+	vcpu_run(vcpu);
+	host_sync(vcpu, 0);
+	vcpu_run(vcpu);
+	host_sync(vcpu, 1);
+	vcpu_run(vcpu);
+	handle_ucall(vcpu, UCALL_DONE);
+
+	vm_install_exception_handler(vm, 0x700, NULL);
+
+	kvm_vm_free(vm);
+}
+
+static void dsi_handler(struct ex_regs *regs)
+{
+	GUEST_SYNC(1);
+	regs->nia += 4;
+}
+
+static void guest_code_dsi(void)
+{
+	GUEST_SYNC(0);
+	asm volatile("stb %r0,0(0)");
+	GUEST_DONE();
+}
+
+static void test_dsi(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code_dsi);
+	vm_install_exception_handler(vm, 0x300, dsi_handler);
+
+	vcpu_run(vcpu);
+	host_sync(vcpu, 0);
+	vcpu_run(vcpu);
+	host_sync(vcpu, 1);
+	vcpu_run(vcpu);
+	handle_ucall(vcpu, UCALL_DONE);
+
+	vm_install_exception_handler(vm, 0x300, NULL);
+
+	kvm_vm_free(vm);
+}
+
+static void test_dump(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code_ucall);
+
+	vcpu_run(vcpu);
+	handle_ucall(vcpu, UCALL_DONE);
+
+	printf("Testing vm_dump...\n");
+	vm_dump(stderr, vm, 2);
+
+	kvm_vm_free(vm);
+}
+
+
+struct testdef {
+	const char *name;
+	void (*test)(void);
+} testlist[] = {
+	{ "null asm test", test_asm},
+	{ "null ucall test", test_ucall},
+	{ "trap test", test_trap},
+	{ "page fault test", test_dsi},
+	{ "vm dump test", test_dump},
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
+	for (idx = 0; idx < ARRAY_SIZE(testlist); idx++) {
+		testlist[idx].test();
+		ksft_test_result_pass("%s\n", testlist[idx].name);
+	}
+
+	ksft_finished();	/* Print results and exit() accordingly */
+}
diff --git a/tools/testing/selftests/kvm/powerpc/rtas_hcall.c b/tools/testing/selftests/kvm/powerpc/rtas_hcall.c
new file mode 100644
index 000000000000..4d5532eac650
--- /dev/null
+++ b/tools/testing/selftests/kvm/powerpc/rtas_hcall.c
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Test the KVM H_RTAS hcall and copying buffers between guest and host.
+ */
+
+#define _GNU_SOURCE /* for program_invocation_short_name */
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+
+#include "test_util.h"
+#include "kvm_util.h"
+#include "kselftest.h"
+#include "hcall.h"
+
+struct rtas_args {
+	__be32 token;
+	__be32 nargs;
+	__be32 nret;
+	__be32 args[16];
+        __be32 *rets;     /* Pointer to return values in args[]. */
+};
+
+static void guest_code(void)
+{
+	struct rtas_args r;
+	int64_t rc;
+
+	r.token = cpu_to_be32(0xdeadbeef);
+	r.nargs = cpu_to_be32(3);
+	r.nret = cpu_to_be32(2);
+	r.rets = &r.args[3];
+	r.args[0] = cpu_to_be32(0x1000);
+	r.args[1] = cpu_to_be32(0x1001);
+	r.args[2] = cpu_to_be32(0x1002);
+	rc = hcall1(H_RTAS, (uint64_t)&r);
+	GUEST_ASSERT(rc == 0);
+	GUEST_ASSERT_1(be32_to_cpu(r.rets[0]) == 0xabc, be32_to_cpu(r.rets[0]));
+	GUEST_ASSERT_1(be32_to_cpu(r.rets[1]) == 0x123, be32_to_cpu(r.rets[1]));
+
+	GUEST_DONE();
+}
+
+int main(int argc, char *argv[])
+{
+	struct kvm_regs regs;
+	struct rtas_args *r;
+	vm_vaddr_t rtas_vaddr;
+	struct ucall uc;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	uint64_t tmp;
+	int ret;
+
+	ksft_print_header();
+
+	ksft_set_plan(1);
+
+	/* Create VM */
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+
+	printf("Running H_RTAS guest vcpu.\n");
+
+	ret = _vcpu_run(vcpu);
+	TEST_ASSERT(ret == 0, "vcpu_run failed: %d\n", ret);
+	switch ((tmp = get_ucall(vcpu, &uc))) {
+	case UCALL_NONE:
+		break; // good
+	case UCALL_DONE:
+		TEST_FAIL("Unexpected final guest exit %lu\n", tmp);
+		break;
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT_N(uc, "values: %lu (0x%lx)\n",
+				      GUEST_ASSERT_ARG(uc, 0),
+				      GUEST_ASSERT_ARG(uc, 0));
+		break;
+	default:
+		TEST_FAIL("Unexpected guest exit %lu\n", tmp);
+	}
+
+	TEST_ASSERT(vcpu->run->exit_reason == KVM_EXIT_PAPR_HCALL,
+		    "Expected PAPR_HCALL exit, got %s\n",
+		    exit_reason_str(vcpu->run->exit_reason));
+	TEST_ASSERT(vcpu->run->papr_hcall.nr == H_RTAS,
+		    "Expected H_RTAS exit, got %lld\n",
+		    vcpu->run->papr_hcall.nr);
+
+	printf("Got H_RTAS exit.\n");
+
+	vcpu_regs_get(vcpu, &regs);
+	rtas_vaddr = regs.gpr[4];
+	printf("H_RTAS rtas_args at gEA=0x%lx\n", rtas_vaddr);
+
+	r = addr_gva2hva(vm, rtas_vaddr);
+
+	TEST_ASSERT(r->token == cpu_to_be32(0xdeadbeef),
+		    "Expected RTAS token 0xdeadbeef, got 0x%x\n",
+		    be32_to_cpu(r->token));
+	TEST_ASSERT(r->nargs == cpu_to_be32(3),
+		    "Expected RTAS nargs 3, got %u\n",
+		    be32_to_cpu(r->nargs));
+	TEST_ASSERT(r->nret == cpu_to_be32(2),
+		    "Expected RTAS nret 2, got %u\n",
+		    be32_to_cpu(r->nret));
+	TEST_ASSERT(r->args[0] == cpu_to_be32(0x1000),
+		    "Expected args[0] to be 0x1000, got 0x%x\n",
+		    be32_to_cpu(r->args[0]));
+	TEST_ASSERT(r->args[1] == cpu_to_be32(0x1001),
+		    "Expected args[1] to be 0x1001, got 0x%x\n",
+		    be32_to_cpu(r->args[1]));
+	TEST_ASSERT(r->args[2] == cpu_to_be32(0x1002),
+		    "Expected args[2] to be 0x1002, got 0x%x\n",
+		    be32_to_cpu(r->args[2]));
+
+	printf("Guest rtas_args is correct, setting rets.\n");
+
+	r->args[3] = cpu_to_be32(0xabc);
+	r->args[4] = cpu_to_be32(0x123);
+
+	regs.gpr[3] = 0;
+	vcpu_regs_set(vcpu, &regs);
+
+	printf("Running H_RTAS guest vcpu again (hcall return H_SUCCESS).\n");
+
+	ret = _vcpu_run(vcpu);
+	TEST_ASSERT(ret == 0, "vcpu_run failed: %d\n", ret);
+	switch ((tmp = get_ucall(vcpu, &uc))) {
+	case UCALL_DONE:
+		printf("Got final guest exit.\n");
+		break;
+	case UCALL_ABORT:
+		REPORT_GUEST_ASSERT_N(uc, "values: %lu (0x%lx)\n",
+				      GUEST_ASSERT_ARG(uc, 0),
+				      GUEST_ASSERT_ARG(uc, 0));
+		break;
+	default:
+		TEST_FAIL("Unexpected guest exit %lu\n", tmp);
+	}
+
+	kvm_vm_free(vm);
+
+	ksft_test_result_pass("%s\n", "rtas test");
+	ksft_finished();	/* Print results and exit() accordingly */
+}
-- 
2.40.0

