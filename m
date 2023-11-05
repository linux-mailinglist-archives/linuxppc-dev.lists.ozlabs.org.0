Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B761D7E155B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Nov 2023 17:58:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J5wG7fnP;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J5wG7fnP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SNgf94Wlyz3w49
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 03:58:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J5wG7fnP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J5wG7fnP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SNg7N2pCCz3clH
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 03:34:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699202093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/lhWGWGrQ6KTenP/DS+/XR8+yfBHvDZZ4ODppqjVMQ=;
	b=J5wG7fnPHZlDXLNSzJLV4TRsienoJH5lPcWz/b5ccwSOhG2KMch1pk58YiMvZ4XUv2MsL7
	Ap2foAv2EEsISLsBM2u9AhZYTIPfrwHaocEE+43ZUG74Hy+TSWEj3lpUPgPz/2rnXPl3HL
	EmSpBoRqLl9Gw5QnKeGJUsUgUfzFq0s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699202093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/lhWGWGrQ6KTenP/DS+/XR8+yfBHvDZZ4ODppqjVMQ=;
	b=J5wG7fnPHZlDXLNSzJLV4TRsienoJH5lPcWz/b5ccwSOhG2KMch1pk58YiMvZ4XUv2MsL7
	Ap2foAv2EEsISLsBM2u9AhZYTIPfrwHaocEE+43ZUG74Hy+TSWEj3lpUPgPz/2rnXPl3HL
	EmSpBoRqLl9Gw5QnKeGJUsUgUfzFq0s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-56_0juESPsatACszOU-i_w-1; Sun, 05 Nov 2023 11:34:50 -0500
X-MC-Unique: 56_0juESPsatACszOU-i_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F838810FC1;
	Sun,  5 Nov 2023 16:34:48 +0000 (UTC)
Received: from avogadro.redhat.com (unknown [10.39.192.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5BED2166B26;
	Sun,  5 Nov 2023 16:34:40 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sean Christopherson <seanjc@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 31/34] KVM: selftests: Expand set_memory_region_test to validate guest_memfd()
Date: Sun,  5 Nov 2023 17:30:34 +0100
Message-ID: <20231105163040.14904-32-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-1-pbonzini@redhat.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, Vlastimil Babka <vbabka@suse.cz>, =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve 
 <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Chao Peng <chao.p.peng@linux.intel.com>

Expand set_memory_region_test to exercise various positive and negative
testcases for private memory.

 - Non-guest_memfd() file descriptor for private memory
 - guest_memfd() from different VM
 - Overlapping bindings
 - Unaligned bindings

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
[sean: trim the testcases to remove duplicate coverage]
Signed-off-by: Sean Christopherson <seanjc@google.com>
Message-Id: <20231027182217.3615211-34-seanjc@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .../selftests/kvm/include/kvm_util_base.h     |  10 ++
 .../selftests/kvm/set_memory_region_test.c    | 100 ++++++++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 8ec122f5fcc8..e4d2cd9218b2 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -819,6 +819,16 @@ static inline struct kvm_vm *vm_create_barebones(void)
 	return ____vm_create(VM_SHAPE_DEFAULT);
 }
 
+static inline struct kvm_vm *vm_create_barebones_protected_vm(void)
+{
+	const struct vm_shape shape = {
+		.mode = VM_MODE_DEFAULT,
+		.type = KVM_X86_SW_PROTECTED_VM,
+	};
+
+	return ____vm_create(shape);
+}
+
 static inline struct kvm_vm *vm_create(uint32_t nr_runnable_vcpus)
 {
 	return __vm_create(VM_SHAPE_DEFAULT, nr_runnable_vcpus, 0);
diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index b32960189f5f..1891774eb6d4 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -385,6 +385,98 @@ static void test_add_max_memory_regions(void)
 	kvm_vm_free(vm);
 }
 
+
+static void test_invalid_guest_memfd(struct kvm_vm *vm, int memfd,
+				     size_t offset, const char *msg)
+{
+	int r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
+					     MEM_REGION_GPA, MEM_REGION_SIZE,
+					     0, memfd, offset);
+	TEST_ASSERT(r == -1 && errno == EINVAL, "%s", msg);
+}
+
+static void test_add_private_memory_region(void)
+{
+	struct kvm_vm *vm, *vm2;
+	int memfd, i;
+
+	pr_info("Testing ADD of KVM_MEM_GUEST_MEMFD memory regions\n");
+
+	vm = vm_create_barebones_protected_vm();
+
+	test_invalid_guest_memfd(vm, vm->kvm_fd, 0, "KVM fd should fail");
+	test_invalid_guest_memfd(vm, vm->fd, 0, "VM's fd should fail");
+
+	memfd = kvm_memfd_alloc(MEM_REGION_SIZE, false);
+	test_invalid_guest_memfd(vm, memfd, 0, "Regular memfd() should fail");
+	close(memfd);
+
+	vm2 = vm_create_barebones_protected_vm();
+	memfd = vm_create_guest_memfd(vm2, MEM_REGION_SIZE, 0);
+	test_invalid_guest_memfd(vm, memfd, 0, "Other VM's guest_memfd() should fail");
+
+	vm_set_user_memory_region2(vm2, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
+				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
+	close(memfd);
+	kvm_vm_free(vm2);
+
+	memfd = vm_create_guest_memfd(vm, MEM_REGION_SIZE, 0);
+	for (i = 1; i < PAGE_SIZE; i++)
+		test_invalid_guest_memfd(vm, memfd, i, "Unaligned offset should fail");
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
+				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
+	close(memfd);
+
+	kvm_vm_free(vm);
+}
+
+static void test_add_overlapping_private_memory_regions(void)
+{
+	struct kvm_vm *vm;
+	int memfd;
+	int r;
+
+	pr_info("Testing ADD of overlapping KVM_MEM_GUEST_MEMFD memory regions\n");
+
+	vm = vm_create_barebones_protected_vm();
+
+	memfd = vm_create_guest_memfd(vm, MEM_REGION_SIZE * 4, 0);
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
+				   MEM_REGION_GPA, MEM_REGION_SIZE * 2, 0, memfd, 0);
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT + 1, KVM_MEM_GUEST_MEMFD,
+				   MEM_REGION_GPA * 2, MEM_REGION_SIZE * 2,
+				   0, memfd, MEM_REGION_SIZE * 2);
+
+	/*
+	 * Delete the first memslot, and then attempt to recreate it except
+	 * with a "bad" offset that results in overlap in the guest_memfd().
+	 */
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
+				   MEM_REGION_GPA, 0, NULL, -1, 0);
+
+	/* Overlap the front half of the other slot. */
+	r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
+					 MEM_REGION_GPA * 2 - MEM_REGION_SIZE,
+					 MEM_REGION_SIZE * 2,
+					 0, memfd, 0);
+	TEST_ASSERT(r == -1 && errno == EEXIST, "%s",
+		    "Overlapping guest_memfd() bindings should fail with EEXIST");
+
+	/* And now the back half of the other slot. */
+	r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
+					 MEM_REGION_GPA * 2 + MEM_REGION_SIZE,
+					 MEM_REGION_SIZE * 2,
+					 0, memfd, 0);
+	TEST_ASSERT(r == -1 && errno == EEXIST, "%s",
+		    "Overlapping guest_memfd() bindings should fail with EEXIST");
+
+	close(memfd);
+	kvm_vm_free(vm);
+}
+
 int main(int argc, char *argv[])
 {
 #ifdef __x86_64__
@@ -401,6 +493,14 @@ int main(int argc, char *argv[])
 
 	test_add_max_memory_regions();
 
+	if (kvm_has_cap(KVM_CAP_GUEST_MEMFD) &&
+	    (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM))) {
+		test_add_private_memory_region();
+		test_add_overlapping_private_memory_regions();
+	} else {
+		pr_info("Skipping tests for KVM_MEM_GUEST_MEMFD memory regions\n");
+	}
+
 #ifdef __x86_64__
 	if (argc > 1)
 		loops = atoi_positive("Number of iterations", argv[1]);
-- 
2.39.1


