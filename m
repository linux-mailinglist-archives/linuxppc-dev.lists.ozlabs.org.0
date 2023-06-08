Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9A17275B6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 05:27:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qc8lh65gcz3fbJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 13:27:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KoW2Cai7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KoW2Cai7;
	dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qc8hr3gl2z3cGk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 13:24:44 +1000 (AEST)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-39a505b901dso134282b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 20:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686194682; x=1688786682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amk+85rcFOEG0VcwuC0GEJTQvC7gKI7CfBL/n9y3Wjk=;
        b=KoW2Cai7O57Pl3gqJ9zgbc22dpLlVb7iGVHoWl5Z8VXh082/fIfw3dubwBorOs33IQ
         4ZCqSaIt8cQJtOOSvoYpIq2TThd6bR0sVQkNy5WQZJWVGo4P1nPuDY5YxPlObTQ9jXsa
         WAq3ku+12nxQomVObqlFCWMwrsuySN589sjuFj+0VjDH5LRNTLoECGq5Ba4OcP70NfUi
         5NSq5VJrVLPbxzfxDZhHfjBX5gh5eCzTTqNHQGZtRHb/FW5zNTv6KZ+8CpzDlFfPPXzG
         vFrN3/WXaK2NdzHWZXROg59TOz0RGZkY4EMtbJjcH5JyKoUuiyKGkaYdMusMAr5jkvKN
         LI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686194682; x=1688786682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amk+85rcFOEG0VcwuC0GEJTQvC7gKI7CfBL/n9y3Wjk=;
        b=Jjil4ojA5ShTxEWRMQ/xloAY1iCvp/fRxmUQmoY8+jbCbmJQ4lBKanL2DhqXxMCKtn
         L06XJ2BtsFvhHEGJICAariOXiqIBCbBnGnDMBTjWky4/6UzHdQlCypYBbnkcvj2hZcHY
         2epjLHNltXQxrlW+zxlxUPSkHpg2y4HGPkzMBPXp0Q/lj8LtaJX/n3HODyGxaDcBu+y8
         4xY0JPUrdHx4w0ZfugJ3cdvMb1sk9mXe1h8bmFxOKQtotgI9oPNIkT0/UhTsKlN/FL7a
         dsdZT6mpnJanVNL7wB0MOQjFI2tKS3mCrFiQR0j/wYg7SkG19bpH3Gssw4bTozfcoaqy
         H5sw==
X-Gm-Message-State: AC+VfDwCEIJ6mHoOh2S+BoZTMfmlKFzv8xDqMGxO8ij/2fIdRIgVDS1s
	3YFM1/Ija2+F8EIrO26UhBeQOrMsVqg=
X-Google-Smtp-Source: ACHHUZ52jpFSNcSJqFuHZeU6QrpkZcVwzp1YQoGV2ph/MtJ+gQ0dqW58LzXNOK9Zb3AWfX1DlRKnmg==
X-Received: by 2002:a05:6808:496:b0:394:45ad:3ea7 with SMTP id z22-20020a056808049600b0039445ad3ea7mr7593080oid.5.1686194681878;
        Wed, 07 Jun 2023 20:24:41 -0700 (PDT)
Received: from wheely.local0.net (58-6-224-112.tpgi.com.au. [58.6.224.112])
        by smtp.gmail.com with ESMTPSA id s12-20020a17090a5d0c00b0025930e50e28sm2015629pji.41.2023.06.07.20.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 20:24:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 2/6] KVM: selftests: Add aligned guest physical page allocator
Date: Thu,  8 Jun 2023 13:24:21 +1000
Message-Id: <20230608032425.59796-3-npiggin@gmail.com>
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

powerpc will require this to allocate MMU tables in guest memory that
are larger than guest base page size.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .../selftests/kvm/include/kvm_util_base.h     |  2 +
 tools/testing/selftests/kvm/lib/kvm_util.c    | 44 ++++++++++++-------
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index d630a0a1877c..42d03ae08ecb 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -680,6 +680,8 @@ const char *exit_reason_str(unsigned int exit_reason);
 
 vm_paddr_t vm_phy_page_alloc(struct kvm_vm *vm, vm_paddr_t paddr_min,
 			     uint32_t memslot);
+vm_paddr_t vm_phy_pages_alloc_align(struct kvm_vm *vm, size_t num, size_t align,
+			      vm_paddr_t paddr_min, uint32_t memslot);
 vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
 			      vm_paddr_t paddr_min, uint32_t memslot);
 vm_paddr_t vm_alloc_page_table(struct kvm_vm *vm);
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 298c4372fb1a..68558d60f949 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1903,6 +1903,7 @@ const char *exit_reason_str(unsigned int exit_reason)
  * Input Args:
  *   vm - Virtual Machine
  *   num - number of pages
+ *   align - pages alignment
  *   paddr_min - Physical address minimum
  *   memslot - Memory region to allocate page from
  *
@@ -1916,7 +1917,7 @@ const char *exit_reason_str(unsigned int exit_reason)
  * and their base address is returned. A TEST_ASSERT failure occurs if
  * not enough pages are available at or above paddr_min.
  */
-vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
+vm_paddr_t vm_phy_pages_alloc_align(struct kvm_vm *vm, size_t num, size_t align,
 			      vm_paddr_t paddr_min, uint32_t memslot)
 {
 	struct userspace_mem_region *region;
@@ -1930,24 +1931,27 @@ vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
 		paddr_min, vm->page_size);
 
 	region = memslot2region(vm, memslot);
-	base = pg = paddr_min >> vm->page_shift;
-
-	do {
-		for (; pg < base + num; ++pg) {
-			if (!sparsebit_is_set(region->unused_phy_pages, pg)) {
-				base = pg = sparsebit_next_set(region->unused_phy_pages, pg);
-				break;
+	base = paddr_min >> vm->page_shift;
+
+again:
+	base = (base + align - 1) & ~(align - 1);
+	for (pg = base; pg < base + num; ++pg) {
+		if (!sparsebit_is_set(region->unused_phy_pages, pg)) {
+			base = sparsebit_next_set(region->unused_phy_pages, pg);
+			if (!base) {
+				fprintf(stderr, "No guest physical pages "
+					"available, paddr_min: 0x%lx "
+					"page_size: 0x%x memslot: %u "
+					"num_pages: %lu align: %lu\n",
+					paddr_min, vm->page_size, memslot,
+					num, align);
+				fputs("---- vm dump ----\n", stderr);
+				vm_dump(stderr, vm, 2);
+				TEST_ASSERT(false, "false");
+				abort();
 			}
+			goto again;
 		}
-	} while (pg && pg != base + num);
-
-	if (pg == 0) {
-		fprintf(stderr, "No guest physical page available, "
-			"paddr_min: 0x%lx page_size: 0x%x memslot: %u\n",
-			paddr_min, vm->page_size, memslot);
-		fputs("---- vm dump ----\n", stderr);
-		vm_dump(stderr, vm, 2);
-		abort();
 	}
 
 	for (pg = base; pg < base + num; ++pg)
@@ -1956,6 +1960,12 @@ vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
 	return base * vm->page_size;
 }
 
+vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
+			      vm_paddr_t paddr_min, uint32_t memslot)
+{
+	return vm_phy_pages_alloc_align(vm, num, 1, paddr_min, memslot);
+}
+
 vm_paddr_t vm_phy_page_alloc(struct kvm_vm *vm, vm_paddr_t paddr_min,
 			     uint32_t memslot)
 {
-- 
2.40.1

