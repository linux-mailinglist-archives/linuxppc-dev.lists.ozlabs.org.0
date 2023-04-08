Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D236DB8BA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 06:03:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PthRC4kKdz3fd9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 14:03:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TKnbOTcL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TKnbOTcL;
	dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PthNX5pCgz3fWY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 14:00:44 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-517baf1bc87so67271a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 21:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680926442; x=1683518442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unH+fWcNwVMc4/m+QY2lOb5+1jkFSiaecoJbQLZexkQ=;
        b=TKnbOTcLocqQ2UusYfn6Us8cVF34l4WBWuqok/u51/uyL5BjN18WSeC6z+i/CeU489
         DX3GrxfgC2wthiNYrfVLCqwJ44fKODT5/VkP25mnxbKMemJTlSr1OgBv/Kwn/23N3hmQ
         BB7qv2JJmIpVXP3+oMRT+dgWFPSYsICbUmTpXk6kj9zlR8HrBxrRvXxACj0XA+uBYLdA
         W9QCbhsap7oAHz9ntW+41a6K26o7tHylHPWRktn6gyTa+ate0PjjhR/pwlIea4cZ7z1N
         O8pO66rEMhlVah1kPHPmPPqWc3SJ9e/x5+MY81Fk5V9N1ZLtcP8kCevvGjrAmuNapC0V
         HaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680926442; x=1683518442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unH+fWcNwVMc4/m+QY2lOb5+1jkFSiaecoJbQLZexkQ=;
        b=gMlScuLT/ghH9SwEScH3f2pepL3Kb1YlN+crvr+BFqCy4wHbQeHdeyRMLCBE9lnS5o
         wCfbXpxdVPR3jlNGIEbMfS4GA2utd/3V5Jj+pxg+eodhGNn0B31VpQk4F/RsjmeEFtUf
         pib+jQnjssD0lO+YAk8A28yDPQcj6WfMZB0p3Q8wJyBQaFG91CjPM+m/YI1qZXRGtTei
         Qth3DmtZ5tLJlGenej+q32WcLGfffOE8KCeLJOKKVIM5Cvi2GMoaAJjzVd1tBAWG5w64
         zI5uJotpi5MBDqagCoA+BRUL8DfYFt4NR9ulJ8HsYGIaeS4D2iAq+vJ1Rhf/4UfgW37I
         h0aA==
X-Gm-Message-State: AAQBX9c1MhZA88QuVbF4/DT+IdvojBlPm90CxsJ6YsMCqwPOCQ+TlyG0
	FYe4eKYZy+Eg/W30I4VB2R0=
X-Google-Smtp-Source: AKy350b5GtmYLXAIhhFklYnJXBu5LgydaeEDK4ky0aUKG6RmVXG+EpiWnUIX86ANdpXUiuyBwu+HKA==
X-Received: by 2002:aa7:96d3:0:b0:627:e577:4331 with SMTP id h19-20020aa796d3000000b00627e5774331mr4408583pfq.1.1680926442520;
        Fri, 07 Apr 2023 21:00:42 -0700 (PDT)
Received: from wheely.local0.net ([203.59.189.25])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b006328ee1e56csm263872pfw.2.2023.04.07.21.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 21:00:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 2/4] KVM: selftests: Add aligned guest physical page allocator
Date: Sat,  8 Apr 2023 14:00:18 +1000
Message-Id: <20230408040020.868929-3-npiggin@gmail.com>
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

powerpc will require this to allocate MMU tables in guest memory that
are aligned and larger than the base page size.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .../selftests/kvm/include/kvm_util_base.h     |  2 +
 tools/testing/selftests/kvm/lib/kvm_util.c    | 44 ++++++++++++-------
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 16425da16861..8a27bd4111ff 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -679,6 +679,8 @@ const char *exit_reason_str(unsigned int exit_reason);
 
 vm_paddr_t vm_phy_page_alloc(struct kvm_vm *vm, vm_paddr_t paddr_min,
 			     uint32_t memslot);
+vm_paddr_t vm_phy_pages_alloc_align(struct kvm_vm *vm, size_t num, size_t align,
+			      vm_paddr_t paddr_min, uint32_t memslot);
 vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
 			      vm_paddr_t paddr_min, uint32_t memslot);
 vm_paddr_t vm_alloc_page_table(struct kvm_vm *vm);
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 8ec20ac33de0..4f15bbbb8f5e 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1898,6 +1898,7 @@ const char *exit_reason_str(unsigned int exit_reason)
  * Input Args:
  *   vm - Virtual Machine
  *   num - number of pages
+ *   align - pages alignment
  *   paddr_min - Physical address minimum
  *   memslot - Memory region to allocate page from
  *
@@ -1911,7 +1912,7 @@ const char *exit_reason_str(unsigned int exit_reason)
  * and their base address is returned. A TEST_ASSERT failure occurs if
  * not enough pages are available at or above paddr_min.
  */
-vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
+vm_paddr_t vm_phy_pages_alloc_align(struct kvm_vm *vm, size_t num, size_t align,
 			      vm_paddr_t paddr_min, uint32_t memslot)
 {
 	struct userspace_mem_region *region;
@@ -1925,24 +1926,27 @@ vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
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
@@ -1951,6 +1955,12 @@ vm_paddr_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t num,
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
2.40.0

