Return-Path: <linuxppc-dev+bounces-378-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CDD95B9B6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:14:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRXh5t23z2yyq;
	Fri, 23 Aug 2024 01:13:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339588;
	cv=none; b=eXVdUk8qJ9JtvvVf/pGDHroWZeKm7LyHV5fR8boegEBEn7UFcjE+kp3E8HVl5im6LEQIbgqwThXcRSv/ubsBSqBO4vHnD7rmCUID+b8Tl0YYbb3f4XiCp7QiICNtdScK1Pjmak5ge9G+B5hFMyRQnpBcJLpKaZZ8aFO8xvyQ0KcvMoFPwl4UVq+LUxwwZ4QVIRVn63cQeEZG36VBrUOXlLvdxG9vUSQAjQl3j22kbefgGevwtBc9kbGgtnsNqFi58nn/EmPbgEXXVED64F7VOq4088jzvui+cHATWOcHUkP0ckaSg5cadO8VGqv6lgWlzOmu/qrTuWEwnf6IriLCfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339588; c=relaxed/relaxed;
	bh=hcli0Td5f2QXcIZuDvn/8dKsjYNziEJ78ahe7tKTuic=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=O1brngCmkxV4hQC57eweoHoQ6L07jxkE11qNadsiOsW77C/AK1EHDk7CoA8gwjBn4LjIJtTMyK3ZLxD0x+ZLyyLRHHsV3EpvKtp78FUY/2qFFbQWX05IbqSNbNLBXhANXKLsTdd37CBdAOu/J0oIQgGy6pnv+e/CuDqs57ELRck6CrH1WAYEifKmaHlFuWcxAqNR84iDvb1gGOduUr0R56EeJXHALS2zC4y91+FkUrImFxfCtTLIuRgcV0Zb2jxegC2pE7Uly06qfVjf5rkw18U968NCL6tO1/K9I1OY1Yu2jIt8vfNhx22pZCBXdjw86lBWVvrfS939VjAjfHHFEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRXh4NyYz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:13:08 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8794DA7;
	Thu, 22 Aug 2024 08:13:03 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9C703F58B;
	Thu, 22 Aug 2024 08:12:33 -0700 (PDT)
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
Subject: [PATCH v5 17/30] arm64: add pte_access_permitted_no_overlay()
Date: Thu, 22 Aug 2024 16:11:00 +0100
Message-Id: <20240822151113.1479789-18-joey.gouly@arm.com>
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

We do not want take POE into account when clearing the MTE tags.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git arch/arm64/include/asm/pgtable.h arch/arm64/include/asm/pgtable.h
index 1d0f18d30e1e..61a674942a6b 100644
--- arch/arm64/include/asm/pgtable.h
+++ arch/arm64/include/asm/pgtable.h
@@ -156,8 +156,10 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
  * not set) must return false. PROT_NONE mappings do not have the
  * PTE_VALID bit set.
  */
-#define pte_access_permitted(pte, write) \
+#define pte_access_permitted_no_overlay(pte, write) \
 	(((pte_val(pte) & (PTE_VALID | PTE_USER)) == (PTE_VALID | PTE_USER)) && (!(write) || pte_write(pte)))
+#define pte_access_permitted(pte, write) \
+	pte_access_permitted_no_overlay(pte, write)
 #define pmd_access_permitted(pmd, write) \
 	(pte_access_permitted(pmd_pte(pmd), (write)))
 #define pud_access_permitted(pud, write) \
@@ -373,10 +375,11 @@ static inline void __sync_cache_and_tags(pte_t pte, unsigned int nr_pages)
 	/*
 	 * If the PTE would provide user space access to the tags associated
 	 * with it then ensure that the MTE tags are synchronised.  Although
-	 * pte_access_permitted() returns false for exec only mappings, they
-	 * don't expose tags (instruction fetches don't check tags).
+	 * pte_access_permitted_no_overlay() returns false for exec only
+	 * mappings, they don't expose tags (instruction fetches don't check
+	 * tags).
 	 */
-	if (system_supports_mte() && pte_access_permitted(pte, false) &&
+	if (system_supports_mte() && pte_access_permitted_no_overlay(pte, false) &&
 	    !pte_special(pte) && pte_tagged(pte))
 		mte_sync_tags(pte, nr_pages);
 }
-- 
2.25.1


