Return-Path: <linuxppc-dev+bounces-364-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2140D95B982
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:12:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWX3YZcz2yk7;
	Fri, 23 Aug 2024 01:12:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339528;
	cv=none; b=bmzX/JS2TRpZqRS/REF0HGvBe6ky96LnlZVFZjW9oGTF7371gYvlr20+8mdiBRF5HTPxXmwmHU6pQZs5ueb74PwEZIuw789e0l2j1UMYKsUNAS4D/mJiVQGlO4QJS6Df80cTNBLYjXuPMNzyHRuRriYI31kOyFO37By9IUOkPu50rbY1beMSPScJGVqPQ44tL4qrTGPqfezNKV2TS7KxpRphEG7rC3wQ1ocJuLBso8htosjGiUFRIA2dCkZs05OcHy3PthHWewgY6DB+5s75aXVs2ftdFxfPiLP9wZc33CAPOYF77ul5/XeBUVCAYSW74LX8aHdXbhLWLPe3wk3kpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339528; c=relaxed/relaxed;
	bh=AN5yxhdKyzfZdHqEo2A34b5U0fOr4xo1lXLMZ11v71Q=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=aTY+9IKlu/VjE1quGx+CAB0t4a9nVd0yS7BgJho9m7mjm9/CirpwPkNpthR7AZV5yRXi+s9Jq408GMj1aTPE9LXSXetx7mbJsPd6WN03qL5NqIUfaBIR0BEVtySL4eBOreAnjWfRJJ91GpR2tHSkPFfgB//KYNk9y3onuHM7zoSxhqB1qFN1EjkC8e23eoDI0igHmCd5T1IYacsGYMrgWPkEOKkparlQrWLr4Cp7uo5gbb8Z70YVwjdLo3fFMVc9xJ2ujDQXX1hufcyLncRzb8K3lYCGZZooiX8S97rYLcVuSqFdH9EntcSA2k+8xOEU9v0XEWfCB1LISAMGeDiNuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRWX24wNz2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:12:08 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6108A1595;
	Thu, 22 Aug 2024 08:12:03 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 336263F58B;
	Thu, 22 Aug 2024 08:11:33 -0700 (PDT)
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
Subject: [PATCH v5 03/30] mm: use ARCH_PKEY_BITS to define VM_PKEY_BITN
Date: Thu, 22 Aug 2024 16:10:46 +0100
Message-Id: <20240822151113.1479789-4-joey.gouly@arm.com>
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

Use the new CONFIG_ARCH_PKEY_BITS to simplify setting these bits
for different architectures.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-mm@kvack.org
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 fs/proc/task_mmu.c |  2 ++
 include/linux/mm.h | 16 ++++++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git fs/proc/task_mmu.c fs/proc/task_mmu.c
index 5f171ad7b436..2c5f4814aef9 100644
--- fs/proc/task_mmu.c
+++ fs/proc/task_mmu.c
@@ -976,7 +976,9 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 		[ilog2(VM_PKEY_BIT0)]	= "",
 		[ilog2(VM_PKEY_BIT1)]	= "",
 		[ilog2(VM_PKEY_BIT2)]	= "",
+#if VM_PKEY_BIT3
 		[ilog2(VM_PKEY_BIT3)]	= "",
+#endif
 #if VM_PKEY_BIT4
 		[ilog2(VM_PKEY_BIT4)]	= "",
 #endif
diff --git include/linux/mm.h include/linux/mm.h
index 6549d0979b28..56dc2481cc0f 100644
--- include/linux/mm.h
+++ include/linux/mm.h
@@ -330,12 +330,16 @@ extern unsigned int kobjsize(const void *objp);
 #endif /* CONFIG_ARCH_USES_HIGH_VMA_FLAGS */
 
 #ifdef CONFIG_ARCH_HAS_PKEYS
-# define VM_PKEY_SHIFT	VM_HIGH_ARCH_BIT_0
-# define VM_PKEY_BIT0	VM_HIGH_ARCH_0	/* A protection key is a 4-bit value */
-# define VM_PKEY_BIT1	VM_HIGH_ARCH_1	/* on x86 and 5-bit value on ppc64   */
-# define VM_PKEY_BIT2	VM_HIGH_ARCH_2
-# define VM_PKEY_BIT3	VM_HIGH_ARCH_3
-#ifdef CONFIG_PPC
+# define VM_PKEY_SHIFT VM_HIGH_ARCH_BIT_0
+# define VM_PKEY_BIT0  VM_HIGH_ARCH_0
+# define VM_PKEY_BIT1  VM_HIGH_ARCH_1
+# define VM_PKEY_BIT2  VM_HIGH_ARCH_2
+#if CONFIG_ARCH_PKEY_BITS > 3
+# define VM_PKEY_BIT3  VM_HIGH_ARCH_3
+#else
+# define VM_PKEY_BIT3  0
+#endif
+#if CONFIG_ARCH_PKEY_BITS > 4
 # define VM_PKEY_BIT4  VM_HIGH_ARCH_4
 #else
 # define VM_PKEY_BIT4  0
-- 
2.25.1


