Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E0C79F7E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 04:22:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Hx9jDwlJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmLgd673Tz3dRw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 12:22:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Hx9jDwlJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3tmgczqykdfch3zc815dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmL5r38RFz3cRn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 11:56:32 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d81646fcf3eso628245276.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 18:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656590; x=1695261390; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=1D+mcCC4ruo3JVlv7Hlb74B5VrYwifsCPpHX73yGnr0=;
        b=Hx9jDwlJeO93PA6mJTOkL5B4VlZRMQvnc2b4qYQ3py+IBHd//JwakR3+7DpYC6YIL4
         nYC6HlzlVPb6AXJPRru9qX4LkL317HkHazUV4Je0rgrZwHmwh/PIxGJGjS7ojLfPH/i3
         NaNCZ80cIOguN2eloN1Z/6ffIIB8IqJYvMLwr+3v1vk2FNEWqNoejNMIXZM/G6BXXhyq
         qfJMwEb41p0FyjXDZQqIzeFiGsUmoxLPCse8eXQ1OBDkV2jwog6MGMfwPYKqx/ZuOPBg
         FGyo1fPM2QiR0i3HqSEdn6d5WH98Wg0cF+CWP57Vp+qYVOibiQQ/fgQovJNCDVeYTol6
         oo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656590; x=1695261390;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1D+mcCC4ruo3JVlv7Hlb74B5VrYwifsCPpHX73yGnr0=;
        b=bBQ0qJhRCF80opl5qTAXThHgpPX945Jr1rIk0S/02xRoWjSZmW9hiND1J1M4mfJbqD
         wlTfByuvksvQVaos8cg8AugDYvRN3U6k9mMwgeTS/lkskg/9TqCSRIsqKuMPSp4k3kc3
         moiXU7svDETNwSkaxjvEoM/QYMLiMqm/dZ6GSK0TD5v1QlQMm/BPmc8fWWbp8UUOFO6T
         c80TKoXg2Pg/qM4COM20ajVk0J2RajBEaMfjtaCnaXgT9Ftht1fDwe4Pm0XB2M0sNWvA
         tUR5dvN9iMe86/ZigJNIRyQUHCIA0Mh/3LdKUHxp4pE1oNB8Cj1Ghzgniu/Yhe8UWICA
         ztqw==
X-Gm-Message-State: AOJu0YwI8fzEndWrkmTyp4gBXcSPfkvChAQ3Cy02/TcJkyi5NieKrM2g
	b6yh0Yx4NKCw+TIfc9welzZ2EBXtsAE=
X-Google-Smtp-Source: AGHT+IFoTDeavyD2giEESqlhSPBk+MO+O3rBZm4uq7G0VqTMxwWtU4QKtOyPXHglJsay30cXObwzZigXcjo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:c9:b0:d35:bf85:5aa0 with SMTP id
 i9-20020a05690200c900b00d35bf855aa0mr115311ybs.4.1694656590375; Wed, 13 Sep
 2023 18:56:30 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:25 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-28-seanjc@google.com>
Subject: [RFC PATCH v12 27/33] KVM: selftests: Introduce VM "shape" to allow
 tests to specify the VM type
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

Add a "vm_shape" structure to encapsulate the selftests-defined "mode",
along with the KVM-defined "type" for use when creating a new VM.  "mode"
tracks physical and virtual address properties, as well as the preferred
backing memory type, while "type" corresponds to the VM type.

Taking the VM type will allow adding tests for KVM_CREATE_GUEST_MEMFD,
a.k.a. guest private memory, without needing an entirely separate set of
helpers.  Guest private memory is effectively usable only by confidential
VM types, and it's expected that x86 will double down and require unique
VM types for TDX and SNP guests.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/dirty_log_test.c  |  2 +-
 .../selftests/kvm/include/kvm_util_base.h     | 54 +++++++++++++++----
 .../selftests/kvm/kvm_page_table_test.c       |  2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 43 +++++++--------
 tools/testing/selftests/kvm/lib/memstress.c   |  3 +-
 .../kvm/x86_64/ucna_injection_test.c          |  2 +-
 6 files changed, 72 insertions(+), 34 deletions(-)

diff --git a/tools/testing/selftests/kvm/dirty_log_test.c b/tools/testing/selftests/kvm/dirty_log_test.c
index 936f3a8d1b83..6cbecf499767 100644
--- a/tools/testing/selftests/kvm/dirty_log_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_test.c
@@ -699,7 +699,7 @@ static struct kvm_vm *create_vm(enum vm_guest_mode mode, struct kvm_vcpu **vcpu,
 
 	pr_info("Testing guest mode: %s\n", vm_guest_mode_string(mode));
 
-	vm = __vm_create(mode, 1, extra_mem_pages);
+	vm = __vm_create(VM_SHAPE(mode), 1, extra_mem_pages);
 
 	log_mode_create_vm_done(vm);
 	*vcpu = vm_vcpu_add(vm, 0, guest_code);
diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index a0315503ac3e..b608fbb832d5 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -188,6 +188,23 @@ enum vm_guest_mode {
 	NUM_VM_MODES,
 };
 
+struct vm_shape {
+	enum vm_guest_mode mode;
+	unsigned int type;
+};
+
+#define VM_TYPE_DEFAULT			0
+
+#define VM_SHAPE(__mode)			\
+({						\
+	struct vm_shape shape = {		\
+		.mode = (__mode),		\
+		.type = VM_TYPE_DEFAULT		\
+	};					\
+						\
+	shape;					\
+})
+
 #if defined(__aarch64__)
 
 extern enum vm_guest_mode vm_mode_default;
@@ -220,6 +237,8 @@ extern enum vm_guest_mode vm_mode_default;
 
 #endif
 
+#define VM_SHAPE_DEFAULT	VM_SHAPE(VM_MODE_DEFAULT)
+
 #define MIN_PAGE_SIZE		(1U << MIN_PAGE_SHIFT)
 #define PTES_PER_MIN_PAGE	ptes_per_page(MIN_PAGE_SIZE)
 
@@ -784,21 +803,21 @@ vm_paddr_t vm_alloc_page_table(struct kvm_vm *vm);
  * __vm_create() does NOT create vCPUs, @nr_runnable_vcpus is used purely to
  * calculate the amount of memory needed for per-vCPU data, e.g. stacks.
  */
-struct kvm_vm *____vm_create(enum vm_guest_mode mode);
-struct kvm_vm *__vm_create(enum vm_guest_mode mode, uint32_t nr_runnable_vcpus,
+struct kvm_vm *____vm_create(struct vm_shape shape);
+struct kvm_vm *__vm_create(struct vm_shape shape, uint32_t nr_runnable_vcpus,
 			   uint64_t nr_extra_pages);
 
 static inline struct kvm_vm *vm_create_barebones(void)
 {
-	return ____vm_create(VM_MODE_DEFAULT);
+	return ____vm_create(VM_SHAPE_DEFAULT);
 }
 
 static inline struct kvm_vm *vm_create(uint32_t nr_runnable_vcpus)
 {
-	return __vm_create(VM_MODE_DEFAULT, nr_runnable_vcpus, 0);
+	return __vm_create(VM_SHAPE_DEFAULT, nr_runnable_vcpus, 0);
 }
 
-struct kvm_vm *__vm_create_with_vcpus(enum vm_guest_mode mode, uint32_t nr_vcpus,
+struct kvm_vm *__vm_create_with_vcpus(struct vm_shape shape, uint32_t nr_vcpus,
 				      uint64_t extra_mem_pages,
 				      void *guest_code, struct kvm_vcpu *vcpus[]);
 
@@ -806,17 +825,27 @@ static inline struct kvm_vm *vm_create_with_vcpus(uint32_t nr_vcpus,
 						  void *guest_code,
 						  struct kvm_vcpu *vcpus[])
 {
-	return __vm_create_with_vcpus(VM_MODE_DEFAULT, nr_vcpus, 0,
+	return __vm_create_with_vcpus(VM_SHAPE_DEFAULT, nr_vcpus, 0,
 				      guest_code, vcpus);
 }
 
+
+struct kvm_vm *__vm_create_shape_with_one_vcpu(struct vm_shape shape,
+					       struct kvm_vcpu **vcpu,
+					       uint64_t extra_mem_pages,
+					       void *guest_code);
+
 /*
  * Create a VM with a single vCPU with reasonable defaults and @extra_mem_pages
  * additional pages of guest memory.  Returns the VM and vCPU (via out param).
  */
-struct kvm_vm *__vm_create_with_one_vcpu(struct kvm_vcpu **vcpu,
-					 uint64_t extra_mem_pages,
-					 void *guest_code);
+static inline struct kvm_vm *__vm_create_with_one_vcpu(struct kvm_vcpu **vcpu,
+						       uint64_t extra_mem_pages,
+						       void *guest_code)
+{
+	return __vm_create_shape_with_one_vcpu(VM_SHAPE_DEFAULT, vcpu,
+					       extra_mem_pages, guest_code);
+}
 
 static inline struct kvm_vm *vm_create_with_one_vcpu(struct kvm_vcpu **vcpu,
 						     void *guest_code)
@@ -824,6 +853,13 @@ static inline struct kvm_vm *vm_create_with_one_vcpu(struct kvm_vcpu **vcpu,
 	return __vm_create_with_one_vcpu(vcpu, 0, guest_code);
 }
 
+static inline struct kvm_vm *vm_create_shape_with_one_vcpu(struct vm_shape shape,
+							   struct kvm_vcpu **vcpu,
+							   void *guest_code)
+{
+	return __vm_create_shape_with_one_vcpu(shape, vcpu, 0, guest_code);
+}
+
 struct kvm_vcpu *vm_recreate_with_one_vcpu(struct kvm_vm *vm);
 
 void kvm_pin_this_task_to_pcpu(uint32_t pcpu);
diff --git a/tools/testing/selftests/kvm/kvm_page_table_test.c b/tools/testing/selftests/kvm/kvm_page_table_test.c
index 69f26d80c821..e37dc9c21888 100644
--- a/tools/testing/selftests/kvm/kvm_page_table_test.c
+++ b/tools/testing/selftests/kvm/kvm_page_table_test.c
@@ -254,7 +254,7 @@ static struct kvm_vm *pre_init_before_test(enum vm_guest_mode mode, void *arg)
 
 	/* Create a VM with enough guest pages */
 	guest_num_pages = test_mem_size / guest_page_size;
-	vm = __vm_create_with_vcpus(mode, nr_vcpus, guest_num_pages,
+	vm = __vm_create_with_vcpus(VM_SHAPE(mode), nr_vcpus, guest_num_pages,
 				    guest_code, test_args.vcpus);
 
 	/* Align down GPA of the testing memslot */
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index bf2bd5c39a96..68afea10b469 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -209,7 +209,7 @@ __weak void vm_vaddr_populate_bitmap(struct kvm_vm *vm)
 		(1ULL << (vm->va_bits - 1)) >> vm->page_shift);
 }
 
-struct kvm_vm *____vm_create(enum vm_guest_mode mode)
+struct kvm_vm *____vm_create(struct vm_shape shape)
 {
 	struct kvm_vm *vm;
 
@@ -221,13 +221,13 @@ struct kvm_vm *____vm_create(enum vm_guest_mode mode)
 	vm->regions.hva_tree = RB_ROOT;
 	hash_init(vm->regions.slot_hash);
 
-	vm->mode = mode;
-	vm->type = 0;
+	vm->mode = shape.mode;
+	vm->type = shape.type;
 
-	vm->pa_bits = vm_guest_mode_params[mode].pa_bits;
-	vm->va_bits = vm_guest_mode_params[mode].va_bits;
-	vm->page_size = vm_guest_mode_params[mode].page_size;
-	vm->page_shift = vm_guest_mode_params[mode].page_shift;
+	vm->pa_bits = vm_guest_mode_params[vm->mode].pa_bits;
+	vm->va_bits = vm_guest_mode_params[vm->mode].va_bits;
+	vm->page_size = vm_guest_mode_params[vm->mode].page_size;
+	vm->page_shift = vm_guest_mode_params[vm->mode].page_shift;
 
 	/* Setup mode specific traits. */
 	switch (vm->mode) {
@@ -265,7 +265,7 @@ struct kvm_vm *____vm_create(enum vm_guest_mode mode)
 		/*
 		 * Ignore KVM support for 5-level paging (vm->va_bits == 57),
 		 * it doesn't take effect unless a CR4.LA57 is set, which it
-		 * isn't for this VM_MODE.
+		 * isn't for this mode (48-bit virtual address space).
 		 */
 		TEST_ASSERT(vm->va_bits == 48 || vm->va_bits == 57,
 			    "Linear address width (%d bits) not supported",
@@ -285,10 +285,11 @@ struct kvm_vm *____vm_create(enum vm_guest_mode mode)
 		vm->pgtable_levels = 5;
 		break;
 	default:
-		TEST_FAIL("Unknown guest mode, mode: 0x%x", mode);
+		TEST_FAIL("Unknown guest mode: 0x%x", vm->mode);
 	}
 
 #ifdef __aarch64__
+	TEST_ASSERT(!vm->type, "ARM doesn't support test-provided types");
 	if (vm->pa_bits != 40)
 		vm->type = KVM_VM_TYPE_ARM_IPA_SIZE(vm->pa_bits);
 #endif
@@ -347,19 +348,19 @@ static uint64_t vm_nr_pages_required(enum vm_guest_mode mode,
 	return vm_adjust_num_guest_pages(mode, nr_pages);
 }
 
-struct kvm_vm *__vm_create(enum vm_guest_mode mode, uint32_t nr_runnable_vcpus,
+struct kvm_vm *__vm_create(struct vm_shape shape, uint32_t nr_runnable_vcpus,
 			   uint64_t nr_extra_pages)
 {
-	uint64_t nr_pages = vm_nr_pages_required(mode, nr_runnable_vcpus,
+	uint64_t nr_pages = vm_nr_pages_required(shape.mode, nr_runnable_vcpus,
 						 nr_extra_pages);
 	struct userspace_mem_region *slot0;
 	struct kvm_vm *vm;
 	int i;
 
-	pr_debug("%s: mode='%s' pages='%ld'\n", __func__,
-		 vm_guest_mode_string(mode), nr_pages);
+	pr_debug("%s: mode='%s' type='%d', pages='%ld'\n", __func__,
+		 vm_guest_mode_string(shape.mode), shape.type, nr_pages);
 
-	vm = ____vm_create(mode);
+	vm = ____vm_create(shape);
 
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, 0);
 	for (i = 0; i < NR_MEM_REGIONS; i++)
@@ -400,7 +401,7 @@ struct kvm_vm *__vm_create(enum vm_guest_mode mode, uint32_t nr_runnable_vcpus,
  * extra_mem_pages is only used to calculate the maximum page table size,
  * no real memory allocation for non-slot0 memory in this function.
  */
-struct kvm_vm *__vm_create_with_vcpus(enum vm_guest_mode mode, uint32_t nr_vcpus,
+struct kvm_vm *__vm_create_with_vcpus(struct vm_shape shape, uint32_t nr_vcpus,
 				      uint64_t extra_mem_pages,
 				      void *guest_code, struct kvm_vcpu *vcpus[])
 {
@@ -409,7 +410,7 @@ struct kvm_vm *__vm_create_with_vcpus(enum vm_guest_mode mode, uint32_t nr_vcpus
 
 	TEST_ASSERT(!nr_vcpus || vcpus, "Must provide vCPU array");
 
-	vm = __vm_create(mode, nr_vcpus, extra_mem_pages);
+	vm = __vm_create(shape, nr_vcpus, extra_mem_pages);
 
 	for (i = 0; i < nr_vcpus; ++i)
 		vcpus[i] = vm_vcpu_add(vm, i, guest_code);
@@ -417,15 +418,15 @@ struct kvm_vm *__vm_create_with_vcpus(enum vm_guest_mode mode, uint32_t nr_vcpus
 	return vm;
 }
 
-struct kvm_vm *__vm_create_with_one_vcpu(struct kvm_vcpu **vcpu,
-					 uint64_t extra_mem_pages,
-					 void *guest_code)
+struct kvm_vm *__vm_create_shape_with_one_vcpu(struct vm_shape shape,
+					       struct kvm_vcpu **vcpu,
+					       uint64_t extra_mem_pages,
+					       void *guest_code)
 {
 	struct kvm_vcpu *vcpus[1];
 	struct kvm_vm *vm;
 
-	vm = __vm_create_with_vcpus(VM_MODE_DEFAULT, 1, extra_mem_pages,
-				    guest_code, vcpus);
+	vm = __vm_create_with_vcpus(shape, 1, extra_mem_pages, guest_code, vcpus);
 
 	*vcpu = vcpus[0];
 	return vm;
diff --git a/tools/testing/selftests/kvm/lib/memstress.c b/tools/testing/selftests/kvm/lib/memstress.c
index df457452d146..d05487e5a371 100644
--- a/tools/testing/selftests/kvm/lib/memstress.c
+++ b/tools/testing/selftests/kvm/lib/memstress.c
@@ -168,7 +168,8 @@ struct kvm_vm *memstress_create_vm(enum vm_guest_mode mode, int nr_vcpus,
 	 * The memory is also added to memslot 0, but that's a benign side
 	 * effect as KVM allows aliasing HVAs in meslots.
 	 */
-	vm = __vm_create_with_vcpus(mode, nr_vcpus, slot0_pages + guest_num_pages,
+	vm = __vm_create_with_vcpus(VM_SHAPE(mode), nr_vcpus,
+				    slot0_pages + guest_num_pages,
 				    memstress_guest_code, vcpus);
 
 	args->vm = vm;
diff --git a/tools/testing/selftests/kvm/x86_64/ucna_injection_test.c b/tools/testing/selftests/kvm/x86_64/ucna_injection_test.c
index 85f34ca7e49e..0ed32ec903d0 100644
--- a/tools/testing/selftests/kvm/x86_64/ucna_injection_test.c
+++ b/tools/testing/selftests/kvm/x86_64/ucna_injection_test.c
@@ -271,7 +271,7 @@ int main(int argc, char *argv[])
 
 	kvm_check_cap(KVM_CAP_MCE);
 
-	vm = __vm_create(VM_MODE_DEFAULT, 3, 0);
+	vm = __vm_create(VM_SHAPE_DEFAULT, 3, 0);
 
 	kvm_ioctl(vm->kvm_fd, KVM_X86_GET_MCE_CAP_SUPPORTED,
 		  &supported_mcg_caps);
-- 
2.42.0.283.g2d96d420d3-goog

