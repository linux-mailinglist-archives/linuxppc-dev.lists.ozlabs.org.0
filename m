Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 921012C5469
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 14:04:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChdJM6jBtzDqQN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 00:04:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=wzMOScsX; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chd920L8JzDqGG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 23:58:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OmvQdFopBLZnetfVov8lKdmxyzvQ2BvCMtbiLF5Egek=; b=wzMOScsXwmXt/1jaMZr/Y+za8H
 6I2xg6valXoiCc9xRuyQtxnJAnUvVakrGSl3rIi/YAfMVh2ZinciGRgAZnhYSEUZd6Jz6kdClXrwm
 aI2C60yvVOAFkQZ+2mRlV0huSVPmJbtYLzsEo96vYzKBAfYbJKG9H9dsD/o+uFYfch65ChxNGXDZz
 thOJXN94UYmhhPKPm20f2Qq0RikEAohjco458uYmKukBpMtE2D0xMbGGIr8mA0L2dVZWu5qAXw6Tw
 +cotDiUekn7kLB1BsV4ULIdc1yuluC9QAO1z51E9Ces2m6UyNEqixWAYWE8eONvkMFeJD/Asknchv
 HmDQ0iUw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGqL-0006s2-Q2; Thu, 26 Nov 2020 12:57:50 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8CF3530280E;
 Thu, 26 Nov 2020 13:57:47 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 6B10C20222D92; Thu, 26 Nov 2020 13:57:47 +0100 (CET)
Date: Thu, 26 Nov 2020 13:57:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kan.liang@linux.intel.com, mingo@kernel.org, acme@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
 jolsa@redhat.com, eranian@google.com
Subject: Re: [PATCH v2 4/6] arm64/mm: Implement pXX_leaf_size() support
Message-ID: <20201126125747.GG2414@hirez.programming.kicks-ass.net>
References: <20201126120114.071913521@infradead.org>
 <20201126121121.226210959@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126121121.226210959@infradead.org>
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
Cc: linux-arch@vger.kernel.org, ak@linux.intel.com, catalin.marinas@arm.com,
 linuxppc-dev@lists.ozlabs.org, willy@infradead.org,
 linux-kernel@vger.kernel.org, dave.hansen@intel.com, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com, sparclinux@vger.kernel.org, will@kernel.org,
 davem@davemloft.net, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Now with pmd_cont() defined...

---
Subject: arm64/mm: Implement pXX_leaf_size() support
From: Peter Zijlstra <peterz@infradead.org>
Date: Fri Nov 13 11:46:06 CET 2020

ARM64 has non-pagetable aligned large page support with PTE_CONT, when
this bit is set the page is part of a super-page. Match the hugetlb
code and support these super pages for PTE and PMD levels.

This enables PERF_SAMPLE_{DATA,CODE}_PAGE_SIZE to report accurate
pagetable leaf sizes.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/arm64/include/asm/pgtable.h |    4 ++++
 1 file changed, 4 insertions(+)

--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -407,6 +407,7 @@ static inline int pmd_trans_huge(pmd_t p
 #define pmd_dirty(pmd)		pte_dirty(pmd_pte(pmd))
 #define pmd_young(pmd)		pte_young(pmd_pte(pmd))
 #define pmd_valid(pmd)		pte_valid(pmd_pte(pmd))
+#define pmd_cont(pmd)		pte_cont(pmd_pte(pmd))
 #define pmd_wrprotect(pmd)	pte_pmd(pte_wrprotect(pmd_pte(pmd)))
 #define pmd_mkold(pmd)		pte_pmd(pte_mkold(pmd_pte(pmd)))
 #define pmd_mkwrite(pmd)	pte_pmd(pte_mkwrite(pmd_pte(pmd)))
@@ -503,6 +504,9 @@ extern pgprot_t phys_mem_access_prot(str
 				 PMD_TYPE_SECT)
 #define pmd_leaf(pmd)		pmd_sect(pmd)
 
+#define pmd_leaf_size(pmd)	(pmd_cont(pmd) ? CONT_PMD_SIZE : PMD_SIZE)
+#define pte_leaf_size(pte)	(pte_cont(pte) ? CONT_PTE_SIZE : PAGE_SIZE)
+
 #if defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS < 3
 static inline bool pud_sect(pud_t pud) { return false; }
 static inline bool pud_table(pud_t pud) { return true; }
