Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B838679F7ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 04:24:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Nb9sed/E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmLkG41bwz3fbq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 12:24:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Nb9sed/E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3uwgczqykdfok62fb48gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmL5v5Dj7z3c8v
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 11:56:35 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c0c3ccd3d6so4001145ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 18:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656594; x=1695261394; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6d59dJ9WRF4CIf/96OLgpi5904fNPKOKnB6AeL+fWuI=;
        b=Nb9sed/EEtUxgyFccw8/2JyX/kJOMioeP9bNl8BobJfutVzQYwDQK53JdiF4pKNMcs
         IeqhE9ewNd0SokoPiwhPKa5sGMJbYPIHJ+hvtSMfJeKXk6yqoleWGRt68hl6amN1MIb2
         bPFggNulee0jBWi8RWqlIeYuM18JK77LDsJb6u5FKPCK+o5ZPPnJgpJpKrgRWuSSLhOS
         eDu2HStfuUDVOXJ9pOZqsORjjSb1GP86l8DuKREmXVZdN+LOMBIX2uTVhjUN4vZyRotw
         RRk/Sf6aJ87p8byYDGcdaSk/2a2RXpVgRcQVWHGAa9gEc7FCNXAgIdQsiK39lcaPvs+l
         v9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656594; x=1695261394;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6d59dJ9WRF4CIf/96OLgpi5904fNPKOKnB6AeL+fWuI=;
        b=Keo68fSo9Ca6amwNeXmSAgnVkYs/1TOZcQSDVFEcEuDiu4Z+e0305FFg85UZizxKUf
         hGogW1Oofm7EdPcZ5P1TLyndqg5DeGmiNLJuwILogxFjqy4sHjFgvrS1eGl9GDbq2gte
         /V8jV5oVJdm8QGv+zgMQT6Vga1cs4gd6yHphxQ/pSWc9NtsVGwKnBTMy2Xe7Sdf8JjMD
         7cPMIUeiB1zAnsB06JwkanfGAogpk49Q/3ulXAsHDnepR1/M4z7JbiodeGdQQDrxOURj
         QOpHOYwqbKVzFvLA2D3hzV8QP7g6KlTAuaiFKOvQgSR25PrxgfUjUVdKfwphQeEvWlmj
         CikA==
X-Gm-Message-State: AOJu0YwPahRgL0mkzVNCuQm2IUZQWVw2f5VVK/1nTZUD5Yo7psDqz1fw
	0TyFYwqrWqeBBH6T/Bi1+g8Xt7yctHQ=
X-Google-Smtp-Source: AGHT+IFzfhVkixKoPQtGcLMCaK6G8PArrix4K5c3tLhejBjfYUO+G8+9tOF2VAFi/BYmIBrSELG28dy7Zc8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c701:b0:1bf:4e9d:8fc9 with SMTP id
 p1-20020a170902c70100b001bf4e9d8fc9mr148367plp.11.1694656593996; Wed, 13 Sep
 2023 18:56:33 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:27 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-30-seanjc@google.com>
Subject: [RFC PATCH v12 29/33] KVM: selftests: Add x86-only selftest for
 private memory conversions
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Ani
 sh Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Vishal Annapurve <vannapurve@google.com>

Add a selftest to exercise implicit/explicit conversion functionality
within KVM and verify:

 - Shared memory is visible to host userspace
 - Private memory is not visible to host userspace
 - Host userspace and guest can communicate over shared memory
 - Data in shared backing is preserved across conversions (test's
   host userspace doesn't free the data)
 - Private memory is bound to the lifetime of the VM

Ideally, KVM's selftests infrastructure would be reworked to allow backing
a single region of guest memory with multiple memslots for _all_ backing
types and shapes, i.e. ideally the code for using a single backing fd
across multiple memslots would work for "regular" memory as well.  But
sadly, support for KVM_CREATE_GUEST_MEMFD has languished for far too long,
and overhauling selftests' memslots infrastructure would likely open a can
of worms, i.e. delay things even further.

Signed-off-by: Vishal Annapurve <vannapurve@google.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../kvm/x86_64/private_mem_conversions_test.c | 410 ++++++++++++++++++
 2 files changed, 411 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index a3bb36fb3cfc..b709a52d5cdb 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -81,6 +81,7 @@ TEST_GEN_PROGS_x86_64 += x86_64/monitor_mwait_test
 TEST_GEN_PROGS_x86_64 += x86_64/nested_exceptions_test
 TEST_GEN_PROGS_x86_64 += x86_64/platform_info_test
 TEST_GEN_PROGS_x86_64 += x86_64/pmu_event_filter_test
+TEST_GEN_PROGS_x86_64 += x86_64/private_mem_conversions_test
 TEST_GEN_PROGS_x86_64 += x86_64/set_boot_cpu_id
 TEST_GEN_PROGS_x86_64 += x86_64/set_sregs_test
 TEST_GEN_PROGS_x86_64 += x86_64/smaller_maxphyaddr_emulation_test
diff --git a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
new file mode 100644
index 000000000000..50541246d6fd
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022, Google LLC.
+ */
+#define _GNU_SOURCE /* for program_invocation_short_name */
+#include <fcntl.h>
+#include <limits.h>
+#include <pthread.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+
+#include <linux/compiler.h>
+#include <linux/kernel.h>
+#include <linux/kvm_para.h>
+#include <linux/memfd.h>
+#include <linux/sizes.h>
+
+#include <test_util.h>
+#include <kvm_util.h>
+#include <processor.h>
+
+#define BASE_DATA_SLOT		10
+#define BASE_DATA_GPA		((uint64_t)(1ull << 32))
+#define PER_CPU_DATA_SIZE	((uint64_t)(SZ_2M + PAGE_SIZE))
+
+/* Horrific macro so that the line info is captured accurately :-( */
+#define memcmp_g(gpa, pattern,  size)							\
+do {											\
+	uint8_t *mem = (uint8_t *)gpa;							\
+	size_t i;									\
+											\
+	for (i = 0; i < size; i++)							\
+		__GUEST_ASSERT(mem[i] == pattern,					\
+			       "Expected 0x%x at offset %lu (gpa 0x%llx), got 0x%x",	\
+			       pattern, i, gpa + i, mem[i]);				\
+} while (0)
+
+static void memcmp_h(uint8_t *mem, uint8_t pattern, size_t size)
+{
+	size_t i;
+
+	for (i = 0; i < size; i++)
+		TEST_ASSERT(mem[i] == pattern,
+			    "Expected 0x%x at offset %lu, got 0x%x",
+			    pattern, i, mem[i]);
+}
+
+/*
+ * Run memory conversion tests with explicit conversion:
+ * Execute KVM hypercall to map/unmap gpa range which will cause userspace exit
+ * to back/unback private memory. Subsequent accesses by guest to the gpa range
+ * will not cause exit to userspace.
+ *
+ * Test memory conversion scenarios with following steps:
+ * 1) Access private memory using private access and verify that memory contents
+ *   are not visible to userspace.
+ * 2) Convert memory to shared using explicit conversions and ensure that
+ *   userspace is able to access the shared regions.
+ * 3) Convert memory back to private using explicit conversions and ensure that
+ *   userspace is again not able to access converted private regions.
+ */
+
+#define GUEST_STAGE(o, s) { .offset = o, .size = s }
+
+enum ucall_syncs {
+	SYNC_SHARED,
+	SYNC_PRIVATE,
+};
+
+static void guest_sync_shared(uint64_t gpa, uint64_t size,
+			      uint8_t current_pattern, uint8_t new_pattern)
+{
+	GUEST_SYNC5(SYNC_SHARED, gpa, size, current_pattern, new_pattern);
+}
+
+static void guest_sync_private(uint64_t gpa, uint64_t size, uint8_t pattern)
+{
+	GUEST_SYNC4(SYNC_PRIVATE, gpa, size, pattern);
+}
+
+/* Arbitrary values, KVM doesn't care about the attribute flags. */
+#define MAP_GPA_SHARED		BIT(0)
+#define MAP_GPA_DO_FALLOCATE	BIT(1)
+
+static void guest_map_mem(uint64_t gpa, uint64_t size, bool map_shared,
+			  bool do_fallocate)
+{
+	uint64_t flags = 0;
+
+	if (map_shared)
+		flags |= MAP_GPA_SHARED;
+	if (do_fallocate)
+		flags |= MAP_GPA_DO_FALLOCATE;
+	kvm_hypercall_map_gpa_range(gpa, size, flags);
+}
+
+static void guest_map_shared(uint64_t gpa, uint64_t size, bool do_fallocate)
+{
+	guest_map_mem(gpa, size, true, do_fallocate);
+}
+
+static void guest_map_private(uint64_t gpa, uint64_t size, bool do_fallocate)
+{
+	guest_map_mem(gpa, size, false, do_fallocate);
+}
+
+static void guest_run_test(uint64_t base_gpa, bool do_fallocate)
+{
+	struct {
+		uint64_t offset;
+		uint64_t size;
+		uint8_t pattern;
+	} stages[] = {
+		GUEST_STAGE(0, PAGE_SIZE),
+		GUEST_STAGE(0, SZ_2M),
+		GUEST_STAGE(PAGE_SIZE, PAGE_SIZE),
+		GUEST_STAGE(PAGE_SIZE, SZ_2M),
+		GUEST_STAGE(SZ_2M, PAGE_SIZE),
+	};
+	const uint8_t init_p = 0xcc;
+	uint64_t j;
+	int i;
+
+	/* Memory should be shared by default. */
+	memset((void *)base_gpa, ~init_p, PER_CPU_DATA_SIZE);
+	guest_sync_shared(base_gpa, PER_CPU_DATA_SIZE, (uint8_t)~init_p, init_p);
+	memcmp_g(base_gpa, init_p, PER_CPU_DATA_SIZE);
+
+	for (i = 0; i < ARRAY_SIZE(stages); i++) {
+		uint64_t gpa = base_gpa + stages[i].offset;
+		uint64_t size = stages[i].size;
+		uint8_t p1 = 0x11;
+		uint8_t p2 = 0x22;
+		uint8_t p3 = 0x33;
+		uint8_t p4 = 0x44;
+
+		/*
+		 * Set the test region to pattern one to differentiate it from
+		 * the data range as a whole (contains the initial pattern).
+		 */
+		memset((void *)gpa, p1, size);
+
+		/*
+		 * Convert to private, set and verify the private data, and
+		 * then verify that the rest of the data (map shared) still
+		 * holds the initial pattern, and that the host always sees the
+		 * shared memory (initial pattern).  Unlike shared memory,
+		 * punching a hole in private memory is destructive, i.e.
+		 * previous values aren't guaranteed to be preserved.
+		 */
+		guest_map_private(gpa, size, do_fallocate);
+
+		if (size > PAGE_SIZE) {
+			memset((void *)gpa, p2, PAGE_SIZE);
+			goto skip;
+		}
+
+		memset((void *)gpa, p2, size);
+		guest_sync_private(gpa, size, p1);
+
+		/*
+		 * Verify that the private memory was set to pattern two, and
+		 * that shared memory still holds the initial pattern.
+		 */
+		memcmp_g(gpa, p2, size);
+		if (gpa > base_gpa)
+			memcmp_g(base_gpa, init_p, gpa - base_gpa);
+		if (gpa + size < base_gpa + PER_CPU_DATA_SIZE)
+			memcmp_g(gpa + size, init_p,
+				 (base_gpa + PER_CPU_DATA_SIZE) - (gpa + size));
+
+		/*
+		 * Convert odd-number page frames back to shared to verify KVM
+		 * also correctly handles holes in private ranges.
+		 */
+		for (j = 0; j < size; j += PAGE_SIZE) {
+			if ((j >> PAGE_SHIFT) & 1) {
+				guest_map_shared(gpa + j, PAGE_SIZE, do_fallocate);
+				guest_sync_shared(gpa + j, PAGE_SIZE, p1, p3);
+
+				memcmp_g(gpa + j, p3, PAGE_SIZE);
+			} else {
+				guest_sync_private(gpa + j, PAGE_SIZE, p1);
+			}
+		}
+
+skip:
+		/*
+		 * Convert the entire region back to shared, explicitly write
+		 * pattern three to fill in the even-number frames before
+		 * asking the host to verify (and write pattern four).
+		 */
+		guest_map_shared(gpa, size, do_fallocate);
+		memset((void *)gpa, p3, size);
+		guest_sync_shared(gpa, size, p3, p4);
+		memcmp_g(gpa, p4, size);
+
+		/* Reset the shared memory back to the initial pattern. */
+		memset((void *)gpa, init_p, size);
+
+		/*
+		 * Free (via PUNCH_HOLE) *all* private memory so that the next
+		 * iteration starts from a clean slate, e.g. with respect to
+		 * whether or not there are pages/folios in guest_mem.
+		 */
+		guest_map_shared(base_gpa, PER_CPU_DATA_SIZE, true);
+	}
+}
+
+static void guest_code(uint64_t base_gpa)
+{
+	/*
+	 * Run everything twice, with and without doing fallocate() on the
+	 * guest_memfd backing when converting between shared and private.
+	 */
+	guest_run_test(base_gpa, false);
+	guest_run_test(base_gpa, true);
+	GUEST_DONE();
+}
+
+static void handle_exit_hypercall(struct kvm_vcpu *vcpu)
+{
+	struct kvm_run *run = vcpu->run;
+	uint64_t gpa = run->hypercall.args[0];
+	uint64_t size = run->hypercall.args[1] * PAGE_SIZE;
+	bool map_shared = run->hypercall.args[2] & MAP_GPA_SHARED;
+	bool do_fallocate = run->hypercall.args[2] & MAP_GPA_DO_FALLOCATE;
+	struct kvm_vm *vm = vcpu->vm;
+
+	TEST_ASSERT(run->hypercall.nr == KVM_HC_MAP_GPA_RANGE,
+		    "Wanted MAP_GPA_RANGE (%u), got '%llu'",
+		    KVM_HC_MAP_GPA_RANGE, run->hypercall.nr);
+
+	if (do_fallocate)
+		vm_guest_mem_fallocate(vm, gpa, size, map_shared);
+
+	vm_set_memory_attributes(vm, gpa, size,
+				 map_shared ? 0 : KVM_MEMORY_ATTRIBUTE_PRIVATE);
+	run->hypercall.ret = 0;
+}
+
+static bool run_vcpus;
+
+static void *__test_mem_conversions(void *__vcpu)
+{
+	struct kvm_vcpu *vcpu = __vcpu;
+	struct kvm_run *run = vcpu->run;
+	struct kvm_vm *vm = vcpu->vm;
+	struct ucall uc;
+
+	while (!READ_ONCE(run_vcpus))
+		;
+
+	for ( ;; ) {
+		vcpu_run(vcpu);
+
+		if (run->exit_reason == KVM_EXIT_HYPERCALL) {
+			handle_exit_hypercall(vcpu);
+			continue;
+		}
+
+		TEST_ASSERT(run->exit_reason == KVM_EXIT_IO,
+			    "Wanted KVM_EXIT_IO, got exit reason: %u (%s)",
+			    run->exit_reason, exit_reason_str(run->exit_reason));
+
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+		case UCALL_SYNC: {
+			uint8_t *hva = addr_gpa2hva(vm, uc.args[1]);
+			uint64_t size = uc.args[2];
+
+			TEST_ASSERT(uc.args[0] == SYNC_SHARED ||
+				    uc.args[0] == SYNC_PRIVATE,
+				    "Unknown sync command '%ld'", uc.args[0]);
+
+			/* In all cases, the host should observe the shared data. */
+			memcmp_h(hva, uc.args[3], size);
+
+			/* For shared, write the new pattern to guest memory. */
+			if (uc.args[0] == SYNC_SHARED)
+				memset(hva, uc.args[4], size);
+			break;
+		}
+		case UCALL_DONE:
+			return NULL;
+		default:
+			TEST_FAIL("Unknown ucall 0x%lx.", uc.cmd);
+		}
+	}
+}
+
+static void test_mem_conversions(enum vm_mem_backing_src_type src_type, uint32_t nr_vcpus,
+				 uint32_t nr_memslots)
+{
+	/*
+	 * Allocate enough memory so that each vCPU's chunk of memory can be
+	 * naturally aligned with respect to the size of the backing store.
+	 */
+	const size_t size = align_up(PER_CPU_DATA_SIZE, get_backing_src_pagesz(src_type));
+	const size_t memfd_size = size * nr_vcpus;
+	struct kvm_vcpu *vcpus[KVM_MAX_VCPUS];
+	pthread_t threads[KVM_MAX_VCPUS];
+	uint64_t gmem_flags;
+	struct kvm_vm *vm;
+	int memfd, i, r;
+
+	const struct vm_shape shape = {
+		.mode = VM_MODE_DEFAULT,
+		.type = KVM_X86_SW_PROTECTED_VM,
+	};
+
+	vm = __vm_create_with_vcpus(shape, nr_vcpus, 0, guest_code, vcpus);
+
+	vm_enable_cap(vm, KVM_CAP_EXIT_HYPERCALL, (1 << KVM_HC_MAP_GPA_RANGE));
+
+	if (backing_src_can_be_huge(src_type))
+		gmem_flags = KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
+	else
+		gmem_flags = 0;
+	memfd = vm_create_guest_memfd(vm, memfd_size, gmem_flags);
+
+	for (i = 0; i < nr_memslots; i++)
+		vm_mem_add(vm, src_type, BASE_DATA_GPA + size * i,
+			   BASE_DATA_SLOT + i, size / vm->page_size,
+			   KVM_MEM_PRIVATE, memfd, size * i);
+
+	for (i = 0; i < nr_vcpus; i++) {
+		uint64_t gpa =  BASE_DATA_GPA + i * size;
+
+		vcpu_args_set(vcpus[i], 1, gpa);
+
+		virt_map(vm, gpa, gpa, size / vm->page_size);
+
+		pthread_create(&threads[i], NULL, __test_mem_conversions, vcpus[i]);
+	}
+
+	WRITE_ONCE(run_vcpus, true);
+
+	for (i = 0; i < nr_vcpus; i++)
+		pthread_join(threads[i], NULL);
+
+	kvm_vm_free(vm);
+
+	/*
+	 * Allocate and free memory from the guest_memfd after closing the VM
+	 * fd.  The guest_memfd is gifted a reference to its owning VM, i.e.
+	 * should prevent the VM from being fully destroyed until the last
+	 * reference to the guest_memfd is also put.
+	 */
+	r = fallocate(memfd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0, memfd_size);
+	TEST_ASSERT(!r, __KVM_SYSCALL_ERROR("fallocate()", r));
+
+	r = fallocate(memfd, FALLOC_FL_KEEP_SIZE, 0, memfd_size);
+	TEST_ASSERT(!r, __KVM_SYSCALL_ERROR("fallocate()", r));
+}
+
+static void usage(const char *cmd)
+{
+	puts("");
+	printf("usage: %s [-h] [-m] [-s mem_type] [-n nr_vcpus]\n", cmd);
+	puts("");
+	backing_src_help("-s");
+	puts("");
+	puts(" -n: specify the number of vcpus (default: 1)");
+	puts("");
+	puts(" -m: use multiple memslots (default: 1)");
+	puts("");
+}
+
+int main(int argc, char *argv[])
+{
+	enum vm_mem_backing_src_type src_type = DEFAULT_VM_MEM_SRC;
+	bool use_multiple_memslots = false;
+	uint32_t nr_vcpus = 1;
+	uint32_t nr_memslots;
+	int opt;
+
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_EXIT_HYPERCALL));
+	TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));
+
+	while ((opt = getopt(argc, argv, "hms:n:")) != -1) {
+		switch (opt) {
+		case 's':
+			src_type = parse_backing_src_type(optarg);
+			break;
+		case 'n':
+			nr_vcpus = atoi_positive("nr_vcpus", optarg);
+			break;
+		case 'm':
+			use_multiple_memslots = true;
+			break;
+		case 'h':
+		default:
+			usage(argv[0]);
+			exit(0);
+		}
+	}
+
+	nr_memslots = use_multiple_memslots ? nr_vcpus : 1;
+
+	test_mem_conversions(src_type, nr_vcpus, nr_memslots);
+
+	return 0;
+}
-- 
2.42.0.283.g2d96d420d3-goog

