Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F5D7417FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 20:24:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=uztf5Fp5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrqkG1M9wz30hw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 04:24:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=uztf5Fp5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3xhqczaykdfch3zc815dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrqjN3TRTz306B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 04:24:06 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-57059e6f9c7so3143517b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 11:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687976644; x=1690568644;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=waAceiGJaJIZM1rTpOnkG9zmisMavGazW+tCIuQxkVs=;
        b=uztf5Fp5P1E97NMF0TnBlrtUrLMVUIP+ugYLlYTLoMigD6DZmxK1UVGc4x0qOAilGZ
         3NQuryCqq+mJLuHVnFuYq5gFv9zOc4zLevxO6JGgddH4qfYggUedW1saX8zlX/mAnAEZ
         SCb3+ZTeHSismRmZh66YwkIxzDUiJlMcqjKXMOv81gn0cA+pjTowGfXTAF/h0QGT3L9m
         FZP1kps4tKKxQkML9vtiFdJBw2zClRgrkUO01L/tPSPUW/m2olCw2HkrhuNy4Xh3WB9C
         XOQaQOKWtjn2BhMtioSImBFAAHFGF1RzbFU6oNXLA/hk3x/m52kNiphchoACPfNn058o
         WKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687976644; x=1690568644;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=waAceiGJaJIZM1rTpOnkG9zmisMavGazW+tCIuQxkVs=;
        b=fnz20a+c06jeWJkeOn6bw6tlXrGIlRVocPZfOfGiGf3QN2CYW9433LIqFlahrpxYwu
         iDxW9edto9Dcw2PKRqnXGldX9N8h3mODtwmJllcCGwevRCzTmeAjiwtwbGAPqKDh1HOr
         IQy+NhhDQec6EsgyZvdgiAxeey0zp7ZEluX2rjLpJdMSvw6TB6y4YfDsoGu4+6TTBC73
         OtEVXpzn5RbIxrvy1jFGeJbkILuXSXW3ahR9NJ3swV7PTE4aOIZwHzUpd+TJ0c9gi2UJ
         +iFG724z18vpIo0gj2IkoucXBYP7HcYrrNgPMjTiMk6PxRtkwn6E3qJmqcAH3mvghVkG
         hrXQ==
X-Gm-Message-State: ABy/qLbAGOHcwXK92PI5B0QdZl1AoTFue2g7Kt23RJdL5wVZPhxTZsZX
	YpbROKME0Eaz/oTEJewIfWofTMy8ZP8=
X-Google-Smtp-Source: APBJJlFJ6sGH4qbNrqxIT5rwqmY40tMuEfge6iB7SEY8W4FiNZZhLRUeObmDZffAE9DcMoPnJfeiEPM9npE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:ad48:0:b0:56c:f903:8678 with SMTP id
 l8-20020a81ad48000000b0056cf9038678mr30187ywk.2.1687976644502; Wed, 28 Jun
 2023 11:24:04 -0700 (PDT)
Date: Wed, 28 Jun 2023 11:24:02 -0700
In-Reply-To: <20230408040020.868929-3-npiggin@gmail.com>
Mime-Version: 1.0
References: <20230408040020.868929-1-npiggin@gmail.com> <20230408040020.868929-3-npiggin@gmail.com>
Message-ID: <ZJx6wqgS4TOi/D4j@google.com>
Subject: Re: [PATCH v2 2/4] KVM: selftests: Add aligned guest physical page allocator
From: Sean Christopherson <seanjc@google.com>
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 08, 2023, Nicholas Piggin wrote:
> powerpc will require this to allocate MMU tables in guest memory that
> are aligned and larger than the base page size.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  .../selftests/kvm/include/kvm_util_base.h     |  2 +
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 44 ++++++++++++-------
>  2 files changed, 29 insertions(+), 17 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
> index 16425da16861..8a27bd4111ff 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -679,6 +679,8 @@ const char *exit_reason_str(unsigned int exit_reason);
>  
>  vm_paddr_t vm_phy_page_alloc(struct kvm_vm *vm, vm_paddr_t paddr_min,
>  			     uint32_t memslot);
> +vm_paddr_t vm_phy_pages_alloc_align(struct kvm_vm *vm, size_t num, size_t align,
> +			      vm_paddr_t paddr_min, uint32_t memslot);
>  vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
>  			      vm_paddr_t paddr_min, uint32_t memslot);
>  vm_paddr_t vm_alloc_page_table(struct kvm_vm *vm);
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 8ec20ac33de0..4f15bbbb8f5e 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -1898,6 +1898,7 @@ const char *exit_reason_str(unsigned int exit_reason)
>   * Input Args:
>   *   vm - Virtual Machine
>   *   num - number of pages
> + *   align - pages alignment
>   *   paddr_min - Physical address minimum
>   *   memslot - Memory region to allocate page from
>   *
> @@ -1911,7 +1912,7 @@ const char *exit_reason_str(unsigned int exit_reason)
>   * and their base address is returned. A TEST_ASSERT failure occurs if
>   * not enough pages are available at or above paddr_min.
>   */
> -vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
> +vm_paddr_t vm_phy_pages_alloc_align(struct kvm_vm *vm, size_t num, size_t align,

I'd prefer to use double underscores, even though they are imperfect, because
appending a single specifier always seems to result in the name becoming stale
sooner or later, e.g. when another param with a default is added.

And IIUC, PPC requires the page tables to be naturally aligned, so rather than
expose the inner helper and copy+paste the rather odd KVM_GUEST_PAGE_TABLE_MIN_PADDR
and vm->memslots[MEM_REGION_PT] stuff, what if we instead have vm_alloc_page_table()
deal with the alignment?  And provide a PPC-specific wrapper so that other
architectures don't need to manually specify '1' page?

E.g.

---
 .../selftests/kvm/include/kvm_util_base.h      | 18 +++++++++++++++---
 tools/testing/selftests/kvm/lib/kvm_util.c     | 14 ++++++++------
 .../selftests/kvm/lib/powerpc/processor.c      |  8 ++------
 3 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index f14a059f58fb..e52405c9fa8b 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -700,11 +700,23 @@ const char *exit_reason_str(unsigned int exit_reason);
 
 vm_paddr_t vm_phy_page_alloc(struct kvm_vm *vm, vm_paddr_t paddr_min,
 			     uint32_t memslot);
-vm_paddr_t vm_phy_pages_alloc_align(struct kvm_vm *vm, size_t num, size_t align,
-			      vm_paddr_t paddr_min, uint32_t memslot);
 vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
 			      vm_paddr_t paddr_min, uint32_t memslot);
-vm_paddr_t vm_alloc_page_table(struct kvm_vm *vm);
+
+vm_paddr_t __vm_alloc_page_table(struct kvm_vm *vm, size_t nr_pages);
+
+/*
+ * PowerPC conditionally needs to allocate multiple pages for each page table,
+ * all other architectures consume exactly one page per table.
+ */
+#if defined(__powerpc64__
+#define vm_alloc_page_table __vm_alloc_page_table
+#else
+static inline vm_alloc_page_table(struct kvm_vm *vm)
+{
+	return __vm_alloc_page_table(vm, 1)
+}
+#endif
 
 /*
  * ____vm_create() does KVM_CREATE_VM and little else.  __vm_create() also
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 70f792ba444c..ffd18afe9725 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1946,8 +1946,9 @@ const char *exit_reason_str(unsigned int exit_reason)
  * and their base address is returned. A TEST_ASSERT failure occurs if
  * not enough pages are available at or above paddr_min.
  */
-vm_paddr_t vm_phy_pages_alloc_align(struct kvm_vm *vm, size_t num, size_t align,
-			      vm_paddr_t paddr_min, uint32_t memslot)
+static vm_paddr_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
+				       size_t align, vm_paddr_t paddr_min,
+				       uint32_t memslot)
 {
 	struct userspace_mem_region *region;
 	sparsebit_idx_t pg, base;
@@ -1992,7 +1993,7 @@ vm_paddr_t vm_phy_pages_alloc_align(struct kvm_vm *vm, size_t num, size_t align,
 vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
 			      vm_paddr_t paddr_min, uint32_t memslot)
 {
-	return vm_phy_pages_alloc_align(vm, num, 1, paddr_min, memslot);
+	return __vm_phy_pages_alloc(vm, num, 1, paddr_min, memslot);
 }
 
 vm_paddr_t vm_phy_page_alloc(struct kvm_vm *vm, vm_paddr_t paddr_min,
@@ -2001,10 +2002,11 @@ vm_paddr_t vm_phy_page_alloc(struct kvm_vm *vm, vm_paddr_t paddr_min,
 	return vm_phy_pages_alloc(vm, 1, paddr_min, memslot);
 }
 
-vm_paddr_t vm_alloc_page_table(struct kvm_vm *vm)
+vm_paddr_t __vm_alloc_page_table(struct kvm_vm *vm)
 {
-	return vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				 vm->memslots[MEM_REGION_PT]);
+	return __vm_phy_pages_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
+				    nr_pages, nr_pages,
+				    vm->memslots[MEM_REGION_PT]);
 }
 
 /*
diff --git a/tools/testing/selftests/kvm/lib/powerpc/processor.c b/tools/testing/selftests/kvm/lib/powerpc/processor.c
index 7052ce9b5029..57d64d281467 100644
--- a/tools/testing/selftests/kvm/lib/powerpc/processor.c
+++ b/tools/testing/selftests/kvm/lib/powerpc/processor.c
@@ -44,9 +44,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	pgd_pages = (1UL << (RADIX_PGD_INDEX_SIZE + 3)) >> vm->page_shift;
 	if (!pgd_pages)
 		pgd_pages = 1;
-	pgtb = vm_phy_pages_alloc_align(vm, pgd_pages, pgd_pages,
-					KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-					vm->memslots[MEM_REGION_PT]);
+	pt = vm_alloc_page_table(vm, pgd_pages);
 	vm->pgd = pgtb;
 
 	/* Set the base page directory in the proc table */
@@ -168,9 +166,7 @@ void virt_arch_pg_map(struct kvm_vm *vm, uint64_t gva, uint64_t gpa)
 		pt_pages = (1ULL << (nls + 3)) >> vm->page_shift;
 		if (!pt_pages)
 			pt_pages = 1;
-		pt = vm_phy_pages_alloc_align(vm, pt_pages, pt_pages,
-					KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-					vm->memslots[MEM_REGION_PT]);
+		pt = vm_alloc_page_table(vm, pt_pages);
 		pde = PDE_VALID | nls | pt;
 		*pdep = cpu_to_be64(pde);
 	}

base-commit: 15a281f5c83f34d4d1808e5f790403b0770c5e78
-- 

