Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B99797F1355
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 13:31:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KObO+6rB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYn184hHKz3dSm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 23:31:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KObO+6rB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYmzN5Lqbz2yhZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 23:29:36 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6c39ad730aaso3420841b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 04:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700483374; x=1701088174; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AIk7AbhJsW9eI62mKYQ2rkcdPJNjRacR/OdDnhUOic=;
        b=KObO+6rBI3p9yYZDz0q/ijY+NnGM/TCB/hrVyinNiMeu/RvdxRwbsqvGn8a3rR0xtQ
         TYpwLE4nx5wvIm43pwFbl9pxZgscCl5LDt8IrbucmWGlf3kjrGpgiL6IAmgQD0670cLU
         FFSY7OrB4BJdY/u6DeWHM0RbLNKzo2JXG4w1VLlhsELxNoXJg0YQ94N8HEh1hYUyJn4H
         ZO/H7Be14MgxjjPrrXJsTLVnSpIyDJLqNSiHPVtz4ls+UXmEliFWq8LXtoMisUlwZPox
         6zd2WzvexgkdUqr0IdkNDmTDqy99a8ft93BedQLQQ7s/KCm2v17b77V86DuIMmvi+3mD
         5wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700483374; x=1701088174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AIk7AbhJsW9eI62mKYQ2rkcdPJNjRacR/OdDnhUOic=;
        b=ve4Jm7ZG0YSPzeIzth0dm1pjySvUKF+8MtLVJR4GnUEp43wPsVo2nEOkzqbSNZ9rVt
         W44CcwBMysZMB+edizMnR+QVeIMgi3wGi2RvY7CEm2q3qKYBg71337oGWYXNSRYht0ee
         2zWhd1/VZ7rDBNzT/ActiM1gwuzPjAZgp6i8tHhCaW1gPcbzyvvihJvxTjZPCjpFdytf
         OQDvJP42IWbuKq//ktgYh3KQn/ZuclKTXfm2rT61tVi1K2MxmB96KODJKfhf9G232bKf
         2sVhqSP8+hInEvNYMJNPJEmRTLyFu3Yl6yo8teOQ6ZsSg5vN8/HOtvx1suBVWY+Ln/RE
         TkdQ==
X-Gm-Message-State: AOJu0Yy93qxPvDZB6cia/4n2tm2eiwRhyjPPHZlWNl/u4KATldH3Q+/G
	j8BzPK3MyurgQKJqxgCxDBU=
X-Google-Smtp-Source: AGHT+IHXYdEdlfMsZ45SCaLhC2tM2bY8qSW/M7grjYqtZC31LiALWBxgKLFG725Jn//bmEyqOc5Y5g==
X-Received: by 2002:a05:6a20:3d84:b0:187:94ca:2a91 with SMTP id s4-20020a056a203d8400b0018794ca2a91mr5379042pzi.39.1700483373821;
        Mon, 20 Nov 2023 04:29:33 -0800 (PST)
Received: from wheely.local0.net (203-219-179-16.tpgi.com.au. [203.219.179.16])
        by smtp.gmail.com with ESMTPSA id d13-20020a056a00244d00b00690fe1c928csm6047477pfj.147.2023.11.20.04.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 04:29:33 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 1/4] KVM: selftests: Move pgd_created check into virt_pgd_alloc
Date: Mon, 20 Nov 2023 22:29:17 +1000
Message-ID: <20231120122920.293076-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231120122920.293076-1-npiggin@gmail.com>
References: <20231120122920.293076-1-npiggin@gmail.com>
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
Cc: Sean Christopherson <seanjc@google.com>, linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

virt_arch_pgd_alloc all do the same test and set of pgd_created. Move
this into common code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 tools/testing/selftests/kvm/include/kvm_util_base.h | 5 +++++
 tools/testing/selftests/kvm/lib/aarch64/processor.c | 4 ----
 tools/testing/selftests/kvm/lib/riscv/processor.c   | 4 ----
 tools/testing/selftests/kvm/lib/s390x/processor.c   | 4 ----
 tools/testing/selftests/kvm/lib/x86_64/processor.c  | 7 ++-----
 5 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index a18db6a7b3cf..e592a75ec052 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -846,7 +846,12 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm);
 
 static inline void virt_pgd_alloc(struct kvm_vm *vm)
 {
+	if (vm->pgd_created)
+		return;
+
 	virt_arch_pgd_alloc(vm);
+
+	vm->pgd_created = true;
 }
 
 /*
diff --git a/tools/testing/selftests/kvm/lib/aarch64/processor.c b/tools/testing/selftests/kvm/lib/aarch64/processor.c
index 6fe12e985ba5..69743d4c6748 100644
--- a/tools/testing/selftests/kvm/lib/aarch64/processor.c
+++ b/tools/testing/selftests/kvm/lib/aarch64/processor.c
@@ -96,13 +96,9 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 {
 	size_t nr_pages = page_align(vm, ptrs_per_pgd(vm) * 8) / vm->page_size;
 
-	if (vm->pgd_created)
-		return;
-
 	vm->pgd = vm_phy_pages_alloc(vm, nr_pages,
 				     KVM_GUEST_PAGE_TABLE_MIN_PADDR,
 				     vm->memslots[MEM_REGION_PT]);
-	vm->pgd_created = true;
 }
 
 static void _virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index d146ca71e0c0..7695ba2cd369 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -57,13 +57,9 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 {
 	size_t nr_pages = page_align(vm, ptrs_per_pte(vm) * 8) / vm->page_size;
 
-	if (vm->pgd_created)
-		return;
-
 	vm->pgd = vm_phy_pages_alloc(vm, nr_pages,
 				     KVM_GUEST_PAGE_TABLE_MIN_PADDR,
 				     vm->memslots[MEM_REGION_PT]);
-	vm->pgd_created = true;
 }
 
 void virt_arch_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr)
diff --git a/tools/testing/selftests/kvm/lib/s390x/processor.c b/tools/testing/selftests/kvm/lib/s390x/processor.c
index 15945121daf1..358e03f09c7a 100644
--- a/tools/testing/selftests/kvm/lib/s390x/processor.c
+++ b/tools/testing/selftests/kvm/lib/s390x/processor.c
@@ -17,16 +17,12 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	TEST_ASSERT(vm->page_size == 4096, "Unsupported page size: 0x%x",
 		    vm->page_size);
 
-	if (vm->pgd_created)
-		return;
-
 	paddr = vm_phy_pages_alloc(vm, PAGES_PER_REGION,
 				   KVM_GUEST_PAGE_TABLE_MIN_PADDR,
 				   vm->memslots[MEM_REGION_PT]);
 	memset(addr_gpa2hva(vm, paddr), 0xff, PAGES_PER_REGION * vm->page_size);
 
 	vm->pgd = paddr;
-	vm->pgd_created = true;
 }
 
 /*
diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index d8288374078e..2ec64bb45db2 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -127,11 +127,8 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	TEST_ASSERT(vm->mode == VM_MODE_PXXV48_4K, "Attempt to use "
 		"unknown or unsupported guest mode, mode: 0x%x", vm->mode);
 
-	/* If needed, create page map l4 table. */
-	if (!vm->pgd_created) {
-		vm->pgd = vm_alloc_page_table(vm);
-		vm->pgd_created = true;
-	}
+	/* Create page map l4 table. */
+	vm->pgd = vm_alloc_page_table(vm);
 }
 
 static void *virt_get_pte(struct kvm_vm *vm, uint64_t *parent_pte,
-- 
2.42.0

