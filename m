Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 892C32B1A36
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 12:43:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXc6S1JSBzDqGx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 22:43:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXc1T5F8vzDr0l
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 22:38:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=dkK1YwAwJr6lV1mVrW1fmTp7v30s/RnaMPTh1AauuPg=; b=jwH7GTwDtA84bsBUM9o4vuVEkW
 ZeAbQl6jHxR4+xuUnQIwtknl/di1ZCq40VnwcPZGKy6TagfKuXAh2fLZFicppmulcXlgcvuvh2r8Z
 c7Jq9QnjzcgauBep3FWOb8Y6r9ilHINvVSS7Qr8hGcM5rRp/YYgOH46mSK1wDqLiQ/j8z6oYiPtjR
 GHsPJNEx1oZjKPh7asip5nIE4cHNqeeZeYff4h9vIWDqEyEyRT8YaKuAiYhvu1y9D65398AgCQEh9
 wjxeTXYYIYwvMtVz5qAgWpoPsHLhodoaF0AYy8HbUGpcUgGY25+iuVP4orPPVQ4Guk6Zn0qdt0SIy
 ZlHdpB2A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdXPM-0002Xm-HI; Fri, 13 Nov 2020 11:38:24 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 60E0D306102;
 Fri, 13 Nov 2020 12:38:19 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id 3D7702BCDBFD3; Fri, 13 Nov 2020 12:38:19 +0100 (CET)
Message-ID: <20201113113426.465239104@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 13 Nov 2020 12:19:03 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kan.liang@linux.intel.com, mingo@kernel.org, acme@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@redhat.com,
 eranian@google.com
Subject: [PATCH 2/5] mm: Introduce pXX_leaf_size()
References: <20201113111901.743573013@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 peterz@infradead.org, linuxppc-dev@lists.ozlabs.org, willy@infradead.org,
 linux-kernel@vger.kernel.org, dave.hansen@intel.com, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com, sparclinux@vger.kernel.org, will@kernel.org,
 davem@davemloft.net, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A number of architectures have non-pagetable aligned huge/large pages.
For such architectures a leaf can actually be part of a larger TLB
entry.

Provide generic helpers to determine the TLB size of a page-table
leaf.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/pgtable.h |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1536,4 +1536,20 @@ typedef unsigned int pgtbl_mod_mask;
 #define pmd_leaf(x)	0
 #endif
 
+#ifndef pgd_leaf_size
+#define pgd_leaf_size(x) PGD_SIZE
+#endif
+#ifndef p4d_leaf_size
+#define p4d_leaf_size(x) P4D_SIZE
+#endif
+#ifndef pud_leaf_size
+#define pud_leaf_size(x) PUD_SIZE
+#endif
+#ifndef pmd_leaf_size
+#define pmd_leaf_size(x) PMD_SIZE
+#endif
+#ifndef pte_leaf_size
+#define pte_leaf_size(x) PAGE_SIZE
+#endif
+
 #endif /* _LINUX_PGTABLE_H */


