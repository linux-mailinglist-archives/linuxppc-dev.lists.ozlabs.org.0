Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D90C741808
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 20:31:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=BizrC7/B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrqtB2vQgz3blN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 04:31:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=BizrC7/B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3xxyczaykdpimyuhdwaiiafy.wigfchorjjw-xypfcmnm.itfuvm.ila@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrqsG3qH7z2yQB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 04:30:56 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2630eecfa6dso1520859a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 11:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687977053; x=1690569053;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ueHpMMvGqjRgBfgpfgl/iGq7B0H1Tdq44HndljUB2L8=;
        b=BizrC7/BsGstGZtcIJS0Qsu1R//5wSSkMFEFg3Pc23Qg2XQ1moE1TsenQrJrhhRV1E
         kECs0e9AyAoSwsTreqocvfNbnNEe780163mpmBChGwodJJu2aRauIkr0lDzH2MFXstvi
         h7foAENkBjj1CfEAmC2iU0bFn+IFPfjJIhEGKmEL1Naw+OYJvRpir/iVSiqNpWZ564H5
         v440XCeaCsqmJNBf6JzQBsKhZU6FLyerNqdeA1aO0JCQK1kosTjS0cr5vk8SZgL05oK/
         ssrOvxiASmUfk0JVd15EK8Uzu0iTxsFp65EZCqD6lxG2nMeUDqUTOBnpud/iq3j+E01W
         Y23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687977053; x=1690569053;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueHpMMvGqjRgBfgpfgl/iGq7B0H1Tdq44HndljUB2L8=;
        b=F22vV4ou6geaH6B7nJYxMb+w2TPdo3GBWoLLyN4EklKsCxCFzlmnGIpdQexf1C4Z2x
         LTxm39hXSLrtRtakmh3nsMD6tjdM0fRK1yANPZUZmNInKvRuicpMhWEniB8lA5DAkxB6
         B7AI0XjUK71544MSTLY+ud+P05abFcA+SmuWEvvA2t8eRrpSgN+ycrsUW8+CLZMjKd9n
         TmR2DzhV+y8Q99am6D5qmOvwJx/9hcmhjnwL1j+NJw9/g1ZLPGukBB3NENKmls390jQ/
         Fct6WOeIJhLh81e4JkZaa+0nGn/Jnqf45r0QulrGlpg+ofjQHPlm96lg28JbEbrtyDcj
         4wOA==
X-Gm-Message-State: AC+VfDzfmz4HGNFeyCz9hvmp7IbyenR567Ool2ny6WltitDZ+JgXtXy6
	OQD5GZuPmNG/OYvxLjIr1iNUOUM6mxk=
X-Google-Smtp-Source: ACHHUZ48vEGEz5ddHZxRDJM+Uc+tbhPZS9Q73x0oofnefC5lc94LCPVeQ6Cp49UOl6BTUpUDaW+mjQWMgpw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:1488:b0:262:e394:f054 with SMTP id
 js8-20020a17090b148800b00262e394f054mr1809737pjb.2.1687977053514; Wed, 28 Jun
 2023 11:30:53 -0700 (PDT)
Date: Wed, 28 Jun 2023 11:30:52 -0700
In-Reply-To: <20230408040020.868929-2-npiggin@gmail.com>
Mime-Version: 1.0
References: <20230408040020.868929-1-npiggin@gmail.com> <20230408040020.868929-2-npiggin@gmail.com>
Message-ID: <ZJx8XCJwfSif1Ahc@google.com>
Subject: Re: [PATCH v2 1/4] KVM: selftests: Move pgd_created check into virt_pgd_alloc
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
> virt_arch_pgd_alloc all do the same test and set of pgd_created. Move
> this into common code.

Can you give virt_arch_dump() and addr_gva2gpa() the same treatment?  E.g. either
in one patch or in separate patches:

---
 tools/testing/selftests/kvm/include/kvm_util_base.h | 4 +++-
 tools/testing/selftests/kvm/lib/aarch64/processor.c | 6 ------
 tools/testing/selftests/kvm/lib/powerpc/processor.c | 3 ---
 tools/testing/selftests/kvm/lib/riscv/processor.c   | 6 ------
 tools/testing/selftests/kvm/lib/s390x/processor.c   | 3 ---
 tools/testing/selftests/kvm/lib/x86_64/processor.c  | 3 ---
 6 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index e52405c9fa8b..2545d65483f3 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -908,6 +908,7 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva);
 
 static inline vm_paddr_t addr_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 {
+	TEST_ASSERT(vm->pgd_created, "No guest mappings have been estalished");
 	return addr_arch_gva2gpa(vm, gva);
 }
 
@@ -930,7 +931,8 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent);
 
 static inline void virt_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 {
-	virt_arch_dump(stream, vm, indent);
+	if (vm->pgd_created)
+		virt_arch_dump(stream, vm, indent);
 }
 
 
diff --git a/tools/testing/selftests/kvm/lib/aarch64/processor.c b/tools/testing/selftests/kvm/lib/aarch64/processor.c
index 3da3ec7c5b23..932fa9d350af 100644
--- a/tools/testing/selftests/kvm/lib/aarch64/processor.c
+++ b/tools/testing/selftests/kvm/lib/aarch64/processor.c
@@ -157,9 +157,6 @@ uint64_t *virt_get_pte_hva(struct kvm_vm *vm, vm_vaddr_t gva)
 {
 	uint64_t *ptep;
 
-	if (!vm->pgd_created)
-		goto unmapped_gva;
-
 	ptep = addr_gpa2hva(vm, vm->pgd) + pgd_index(vm, gva) * 8;
 	if (!ptep)
 		goto unmapped_gva;
@@ -222,9 +219,6 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	int level = 4 - (vm->pgtable_levels - 1);
 	uint64_t pgd, *ptep;
 
-	if (!vm->pgd_created)
-		return;
-
 	for (pgd = vm->pgd; pgd < vm->pgd + ptrs_per_pgd(vm) * 8; pgd += 8) {
 		ptep = addr_gpa2hva(vm, pgd);
 		if (!*ptep)
diff --git a/tools/testing/selftests/kvm/lib/powerpc/processor.c b/tools/testing/selftests/kvm/lib/powerpc/processor.c
index 57d64d281467..589c5eb15abf 100644
--- a/tools/testing/selftests/kvm/lib/powerpc/processor.c
+++ b/tools/testing/selftests/kvm/lib/powerpc/processor.c
@@ -246,9 +246,6 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 {
 	vm_paddr_t pt = vm->pgd;
 
-	if (!vm->pgd_created)
-		return;
-
 	virt_dump_pt(stream, vm, pt, 0, 1, indent);
 }
 
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index 7695ba2cd369..251581364643 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -111,9 +111,6 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 	uint64_t *ptep;
 	int level = vm->pgtable_levels - 1;
 
-	if (!vm->pgd_created)
-		goto unmapped_gva;
-
 	ptep = addr_gpa2hva(vm, vm->pgd) + pte_index(vm, gva, level) * 8;
 	if (!ptep)
 		goto unmapped_gva;
@@ -162,9 +159,6 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	int level = vm->pgtable_levels - 1;
 	uint64_t pgd, *ptep;
 
-	if (!vm->pgd_created)
-		return;
-
 	for (pgd = vm->pgd; pgd < vm->pgd + ptrs_per_pte(vm) * 8; pgd += 8) {
 		ptep = addr_gpa2hva(vm, pgd);
 		if (!*ptep)
diff --git a/tools/testing/selftests/kvm/lib/s390x/processor.c b/tools/testing/selftests/kvm/lib/s390x/processor.c
index 358e03f09c7a..39f4b87b9b15 100644
--- a/tools/testing/selftests/kvm/lib/s390x/processor.c
+++ b/tools/testing/selftests/kvm/lib/s390x/processor.c
@@ -145,9 +145,6 @@ static void virt_dump_region(FILE *stream, struct kvm_vm *vm, uint8_t indent,
 
 void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 {
-	if (!vm->pgd_created)
-		return;
-
 	virt_dump_region(stream, vm, indent, vm->pgd);
 }
 
diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index d4deb2718e86..32ed0eba3fbd 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -307,9 +307,6 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	uint64_t *pde, *pde_start;
 	uint64_t *pte, *pte_start;
 
-	if (!vm->pgd_created)
-		return;
-
 	fprintf(stream, "%*s                                          "
 		"                no\n", indent, "");
 	fprintf(stream, "%*s      index hvaddr         gpaddr         "

base-commit: 84e95f5585f25b5199e23c8547867616337103bd
-- 
