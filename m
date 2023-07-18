Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7027589FC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 02:16:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=iijdn5XD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5GZp1TMcz3dmH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 10:16:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=iijdn5XD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3byw3zaykdfok62fb48gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5FzY2HxWz3c2j
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 09:49:29 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-55c1fd0f723so2812966a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 16:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724167; x=1692316167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SY4++Pw7jN82rDNqoaD2dHTLrQhm/Cpf9xmKrcaKe3Q=;
        b=iijdn5XDnjegnaaZfYZHmIdkKvvbAR+aFZwPs8fwv123kJVz2p2h/9oBWkdPqyaRsS
         tYPXzs8KW5tlit8ApBuNWuWVjoEh89xnSIsgu/Whq88891SPn+gBWtiDPpY3l3dMc6wN
         ZjIh27i9FIC2CgcS+8BUw/DTO5qbR+xqgce5EIjbVioflun88hYQpcoeohA5Q62CdacX
         bkVvUE31SkOaTSOFjNAxW/3riwskjxgdetH4j8mMZ5lGin7O2rYWfZ3WzOi8k2zslRid
         eo6zcZxWKCaMvtsfl3KXqqEZuMntBe3POabIgGzEM7GnbE1ZCGONcRiVjXe/yh+0wR7u
         lHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724167; x=1692316167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SY4++Pw7jN82rDNqoaD2dHTLrQhm/Cpf9xmKrcaKe3Q=;
        b=cCHXSvEDcyYGVKC7fQx5q/E9Y5oUtBEKjK3Q0+OjPiybr9rvd7evq9qOAtCJGdZAJr
         C/TaawIa//6MCOGqhSxP/2ARNaWhivwgDnPUMV4vFgqUk06U2grjL68zouSuCWqPxuPF
         +p/HBrnS5oWJcRhkG+yxyg1W2YnL5zit+/IsASrqyEmSVq5BysuWbV1qv4+lfVV6h8xx
         EypZibEeYnGHzKn8G0kmcJZZZLO6m52gcx1rRdW6EKuv00zKngUZHwIu8kkCrIlKozDM
         fx6OL8o5rqQthxsDpD385SVVtWRSw/dEF7fA+LW2LgFIePf/5HSjq3N1DJdSVFhIaDJZ
         hHFQ==
X-Gm-Message-State: ABy/qLZUs3ggCC9jg00F4ctpwLyl5BEPi/vE0gSF7RodNaitc8ri2XjR
	0zMRqbI4cTNgqDLmDfz5sAXkO4M5WT4=
X-Google-Smtp-Source: APBJJlGpCneoSQTZl+h8R9VWDYL/V/WxbKXYmZJOD4TnVpMy34jgsMpJIAUA/D5Xqm41I27LXxp2p+nHZ10=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:7112:0:b0:534:6929:8ff5 with SMTP id
 m18-20020a637112000000b0053469298ff5mr109745pgc.10.1689724167553; Tue, 18 Jul
 2023 16:49:27 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:45:12 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-30-seanjc@google.com>
Subject: [RFC PATCH v11 29/29] KVM: selftests: Test KVM exit behavior for
 private memory/access
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ackerley Tng <ackerleytng@google.com>

"Testing private access when memslot gets deleted" tests the behavior
of KVM when a private memslot gets deleted while the VM is using the
private memslot. When KVM looks up the deleted (slot = NULL) memslot,
KVM should exit to userspace with KVM_EXIT_MEMORY_FAULT.

In the second test, upon a private access to non-private memslot, KVM
should also exit to userspace with KVM_EXIT_MEMORY_FAULT.

sean: These testcases belong in set_memory_region_test.c, they're private
variants on existing testscases and aren't as robust, e.g. don't ensure
the vCPU is actually running and accessing memory when converting and
deleting.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../kvm/x86_64/private_mem_kvm_exits_test.c   | 115 ++++++++++++++++++
 2 files changed, 116 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_test.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 18c43336ede3..cb9450022302 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -81,6 +81,7 @@ TEST_GEN_PROGS_x86_64 += x86_64/nested_exceptions_test
 TEST_GEN_PROGS_x86_64 += x86_64/platform_info_test
 TEST_GEN_PROGS_x86_64 += x86_64/pmu_event_filter_test
 TEST_GEN_PROGS_x86_64 += x86_64/private_mem_conversions_test
+TEST_GEN_PROGS_x86_64 += x86_64/private_mem_kvm_exits_test
 TEST_GEN_PROGS_x86_64 += x86_64/set_boot_cpu_id
 TEST_GEN_PROGS_x86_64 += x86_64/set_sregs_test
 TEST_GEN_PROGS_x86_64 += x86_64/smaller_maxphyaddr_emulation_test
diff --git a/tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_test.c b/tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_test.c
new file mode 100644
index 000000000000..8daaa08c0d90
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_test.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2022, Google LLC.
+ */
+#include <linux/kvm.h>
+#include <pthread.h>
+#include <stdint.h>
+
+#include "kvm_util.h"
+#include "processor.h"
+#include "test_util.h"
+
+/* Arbitrarily selected to avoid overlaps with anything else */
+#define EXITS_TEST_GVA 0xc0000000
+#define EXITS_TEST_GPA EXITS_TEST_GVA
+#define EXITS_TEST_NPAGES 1
+#define EXITS_TEST_SIZE (EXITS_TEST_NPAGES * PAGE_SIZE)
+#define EXITS_TEST_SLOT 10
+
+static uint64_t guest_repeatedly_read(void)
+{
+	volatile uint64_t value;
+
+	while (true)
+		value = *((uint64_t *) EXITS_TEST_GVA);
+
+	return value;
+}
+
+static uint32_t run_vcpu_get_exit_reason(struct kvm_vcpu *vcpu)
+{
+	vcpu_run(vcpu);
+
+	return vcpu->run->exit_reason;
+}
+
+const struct vm_shape protected_vm_shape = {
+	.mode = VM_MODE_DEFAULT,
+	.type = KVM_X86_SW_PROTECTED_VM,
+};
+
+static void test_private_access_memslot_deleted(void)
+{
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+	pthread_t vm_thread;
+	void *thread_return;
+	uint32_t exit_reason;
+
+	vm = vm_create_shape_with_one_vcpu(protected_vm_shape, &vcpu,
+					   guest_repeatedly_read);
+
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    EXITS_TEST_GPA, EXITS_TEST_SLOT,
+				    EXITS_TEST_NPAGES,
+				    KVM_MEM_PRIVATE);
+
+	virt_map(vm, EXITS_TEST_GVA, EXITS_TEST_GPA, EXITS_TEST_NPAGES);
+
+	/* Request to access page privately */
+	vm_mem_set_private(vm, EXITS_TEST_GPA, EXITS_TEST_SIZE);
+
+	pthread_create(&vm_thread, NULL,
+		       (void *(*)(void *))run_vcpu_get_exit_reason,
+		       (void *)vcpu);
+
+	vm_mem_region_delete(vm, EXITS_TEST_SLOT);
+
+	pthread_join(vm_thread, &thread_return);
+	exit_reason = (uint32_t)(uint64_t)thread_return;
+
+	ASSERT_EQ(exit_reason, KVM_EXIT_MEMORY_FAULT);
+	ASSERT_EQ(vcpu->run->memory.flags, KVM_MEMORY_EXIT_FLAG_PRIVATE);
+	ASSERT_EQ(vcpu->run->memory.gpa, EXITS_TEST_GPA);
+	ASSERT_EQ(vcpu->run->memory.size, EXITS_TEST_SIZE);
+
+	kvm_vm_free(vm);
+}
+
+static void test_private_access_memslot_not_private(void)
+{
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+	uint32_t exit_reason;
+
+	vm = vm_create_shape_with_one_vcpu(protected_vm_shape, &vcpu,
+					   guest_repeatedly_read);
+
+	/* Add a non-private memslot (flags = 0) */
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    EXITS_TEST_GPA, EXITS_TEST_SLOT,
+				    EXITS_TEST_NPAGES, 0);
+
+	virt_map(vm, EXITS_TEST_GVA, EXITS_TEST_GPA, EXITS_TEST_NPAGES);
+
+	/* Request to access page privately */
+	vm_mem_set_private(vm, EXITS_TEST_GPA, EXITS_TEST_SIZE);
+
+	exit_reason = run_vcpu_get_exit_reason(vcpu);
+
+	ASSERT_EQ(exit_reason, KVM_EXIT_MEMORY_FAULT);
+	ASSERT_EQ(vcpu->run->memory.flags, KVM_MEMORY_EXIT_FLAG_PRIVATE);
+	ASSERT_EQ(vcpu->run->memory.gpa, EXITS_TEST_GPA);
+	ASSERT_EQ(vcpu->run->memory.size, EXITS_TEST_SIZE);
+
+	kvm_vm_free(vm);
+}
+
+int main(int argc, char *argv[])
+{
+	TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));
+
+	test_private_access_memslot_deleted();
+	test_private_access_memslot_not_private();
+}
-- 
2.41.0.255.g8b1d071c50-goog

