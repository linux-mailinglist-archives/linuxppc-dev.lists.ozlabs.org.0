Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E42362C53D9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 13:19:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChcJH6DNGzDrCv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 23:19:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=vBt34Bck; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chc7r5vX6zDrCm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 23:12:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=WXAvlj8sBk2RdzEpcLbJIMj6YxrEqCvZ8aLKdoJEykM=; b=vBt34BckTzuxfPdRs6WzS6jl4U
 VMOgpb4TEclazpBWZFkBbC8RDZzxfyaCCsqZTH10v33Y9GOCdAchDmgd6bC8otUGCCPj1bOt0oACC
 u10faOlb2zRaRVENzRze4mruA5lUFRcTwut9JpdIhzKkqPyyAet1vZRoUhpTwN3KsL6Xuh2qhDYsb
 MNxFGsfN+kP/94UUc8oj7U/AWLpIgnf6qmwssN0L3COcdvoIaJNwgXkMSzyjn0zvb9KjalQIBX1Fq
 5utgHyiFydFkKzl2tMDsnnLgOlK/BgCGb/3/drFLdfgrh8UTj+JUn/oJ6fDra3kDabeuw3NgnPvj5
 IcE5bbnA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiG7c-0000OT-Ol; Thu, 26 Nov 2020 12:11:36 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1342330280E;
 Thu, 26 Nov 2020 13:11:34 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id EBF8E25F0FB42; Thu, 26 Nov 2020 13:11:33 +0100 (CET)
Message-ID: <20201126121121.102580109@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 26 Nov 2020 13:01:16 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kan.liang@linux.intel.com, mingo@kernel.org, acme@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@redhat.com,
 eranian@google.com
Subject: [PATCH v2 2/6] mm: Introduce pXX_leaf_size()
References: <20201126120114.071913521@infradead.org>
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
For such architectures a leaf can actually be part of a larger entry.

Provide generic helpers to determine the size of a page-table leaf.

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
+#define pgd_leaf_size(x) (1ULL << PGDIR_SHIFT)
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


