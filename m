Return-Path: <linuxppc-dev+bounces-376-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D7C95B9AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:14:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRXR6y9lz2yxp;
	Fri, 23 Aug 2024 01:12:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339575;
	cv=none; b=iU4AskLEUJpq0y02wObg+K8v0lBPshN0+LFpucMD6VbRbqwt8pQ39+DqOiQZkPmgXG9X24Zt4ANl6Eo0JitKw6rPvwWwYNePMuiVVK9mwPue1dDnN5Tx1wTY2dbkKNGa8U5VH/oE4TZKIH5quINfHAyo5+6D2mFssXRPAPaP7wNlOTi0gGsjsuCfutr+B3qHF4HmasqWVHT4i+bTZQJaAQXxtVYJ7SJWgKAHfll96wxVrMX2VSshlD4DCwRTP8vChnZJ3DWVMK/vPAjR6OUDP3Yj0d9qVOxCQjouhqYaXzKYQSLKlXSBxvXK0dJO1/G1aqP5PO0dI3ZlRFL/sQpFoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339575; c=relaxed/relaxed;
	bh=rtB0cFu4yhRz/z4tCR4fwR+sWZaGlGCX641JW7j6vJM=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=ns9gVPnnheyp//OWL/+ymiYn+CmKyE5y3/bYOUakZdk1P9aELOxETZ/cLKNCRB75VtW5XHiC79b7c1kNmeF3YqetmEYTltZENoa3aqRJu+YLHUkHAdxEFxFCz/pHjvMmU3xRWUl+civg1bRH2WESORUF3+Ec4Uznc/axlYzZz6r6j2s/iOJpuw7D0Obwnnyq9AZwm0luTAND/EX60ZFllyaUeSdoghtKfR+GDd4os1GeMDAedS3QCw9rNBYIUVOk47f7cK9Zp4QkM0qp/b4NVHxJLLtHvytS+jRA4vx6Cvsev/Gkh+Ek39+1BtA+4qqaEJcVxppHyH2fyt0RxDNZOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRXR5VCDz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:12:55 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D16131655;
	Thu, 22 Aug 2024 08:12:50 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2D423F58B;
	Thu, 22 Aug 2024 08:12:20 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com,
	akpm@linux-foundation.org,
	aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com,
	anshuman.khandual@arm.com,
	bp@alien8.de,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	maz@kernel.org,
	mingo@redhat.com,
	mpe@ellerman.id.au,
	naveen.n.rao@linux.ibm.com,
	npiggin@gmail.com,
	oliver.upton@linux.dev,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com,
	tglx@linutronix.de,
	will@kernel.org,
	x86@kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 14/30] arm64: convert protection key into vm_flags and pgprot values
Date: Thu, 22 Aug 2024 16:10:57 +0100
Message-Id: <20240822151113.1479789-15-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822151113.1479789-1-joey.gouly@arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify arch_calc_vm_prot_bits() and vm_get_page_prot() such that the pkey
value is set in the vm_flags and then into the pgprot value.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/mman.h | 10 +++++++++-
 arch/arm64/mm/mmap.c          | 11 +++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git arch/arm64/include/asm/mman.h arch/arm64/include/asm/mman.h
index 5966ee4a6154..52791715f6e6 100644
--- arch/arm64/include/asm/mman.h
+++ arch/arm64/include/asm/mman.h
@@ -7,7 +7,7 @@
 #include <uapi/asm/mman.h>
 
 static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
-	unsigned long pkey __always_unused)
+	unsigned long pkey)
 {
 	unsigned long ret = 0;
 
@@ -17,6 +17,14 @@ static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
 	if (system_supports_mte() && (prot & PROT_MTE))
 		ret |= VM_MTE;
 
+#ifdef CONFIG_ARCH_HAS_PKEYS
+	if (system_supports_poe()) {
+		ret |= pkey & BIT(0) ? VM_PKEY_BIT0 : 0;
+		ret |= pkey & BIT(1) ? VM_PKEY_BIT1 : 0;
+		ret |= pkey & BIT(2) ? VM_PKEY_BIT2 : 0;
+	}
+#endif
+
 	return ret;
 }
 #define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
diff --git arch/arm64/mm/mmap.c arch/arm64/mm/mmap.c
index 642bdf908b22..7e3ad97e27d8 100644
--- arch/arm64/mm/mmap.c
+++ arch/arm64/mm/mmap.c
@@ -102,6 +102,17 @@ pgprot_t vm_get_page_prot(unsigned long vm_flags)
 	if (vm_flags & VM_MTE)
 		prot |= PTE_ATTRINDX(MT_NORMAL_TAGGED);
 
+#ifdef CONFIG_ARCH_HAS_PKEYS
+	if (system_supports_poe()) {
+		if (vm_flags & VM_PKEY_BIT0)
+			prot |= PTE_PO_IDX_0;
+		if (vm_flags & VM_PKEY_BIT1)
+			prot |= PTE_PO_IDX_1;
+		if (vm_flags & VM_PKEY_BIT2)
+			prot |= PTE_PO_IDX_2;
+	}
+#endif
+
 	return __pgprot(prot);
 }
 EXPORT_SYMBOL(vm_get_page_prot);
-- 
2.25.1


