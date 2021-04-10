Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8794735ADFE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 16:09:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHcLT3LdBz3c1P
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 00:09:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Ukx/6bcp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=Ukx/6bcp; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHcL21yjwz2y8G
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 00:08:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RTtiSoWYCZ04uVGpMhjmbWk2I8ENKaw5/2meK4GSvVY=; b=Ukx/6bcpMFZOkdXU+6AgH4koIC
 JYQO1FzV6/eHzojqXmXhQ/Z2nX30bYjwSNpUwoyoumWWCurMZmGxnEEecD4PaJKmp4GXz6p1b2+/q
 0RMOdRNqSOTRFvUwSPVFDwmRSjjZ3ITuDSJ2aLHHPe64xqcxY+ZqKMubFJS1QJtFXq4Kxm3hnd3of
 BUO/DXOBYmNDLsQ1dD5dC1DSv1nb1TAKfNZI+Mr+uPZqIQ8bzPe8DP+78gLma/EybXZRgoiB8h8sl
 A7MmK5nSVyMIc1DrKxYN/Zbg0WVr4tZgOm6InniGGemi70dpNNfZB+gF4ZdfcKuxzTQhjyUXVU1QB
 g8Q5EMEA==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lVEGC-001lqY-BT; Sat, 10 Apr 2021 14:07:08 +0000
Date: Sat, 10 Apr 2021 15:06:52 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: Bogus struct page layout on 32-bit
Message-ID: <20210410140652.GY2531743@casper.infradead.org>
References: <20210409185105.188284-3-willy@infradead.org>
 <202104100656.N7EVvkNZ-lkp@intel.com>
 <20210410024313.GX2531743@casper.infradead.org>
 <20210410082158.79ad09a6@carbon>
 <CAC_iWjLXZ6-hhvmvee6r4R_N64u-hrnLqE_CSS1nQk+YaMQQnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC_iWjLXZ6-hhvmvee6r4R_N64u-hrnLqE_CSS1nQk+YaMQQnA@mail.gmail.com>
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
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>,
 Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
 clang-built-linux@googlegroups.com, open list <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Jesper Dangaard Brouer <brouer@redhat.com>, linux-fsdevel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Matteo Croce <mcroce@linux.microsoft.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

How about moving the flags into the union?  A bit messy, but we don't
have to play games with __packed__.

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 1210a8e41fad..f374d2f06255 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -68,16 +68,22 @@ struct mem_cgroup;
 #endif
 
 struct page {
-	unsigned long flags;		/* Atomic flags, some possibly
-					 * updated asynchronously */
 	/*
-	 * Five words (20/40 bytes) are available in this union.
-	 * WARNING: bit 0 of the first word is used for PageTail(). That
-	 * means the other users of this union MUST NOT use the bit to
+	 * This union is six words (24 / 48 bytes) in size.
+	 * The first word is reserved for atomic flags, often updated
+	 * asynchronously.  Use the PageFoo() macros to access it.  Some
+	 * of the flags can be reused for your own purposes, but the
+	 * word as a whole often contains other information and overwriting
+	 * it will cause functions like page_zone() and page_node() to stop
+	 * working correctly.
+	 *
+	 * Bit 0 of the second word is used for PageTail(). That
+	 * means the other users of this union MUST leave the bit zero to
 	 * avoid collision and false-positive PageTail().
 	 */
 	union {
 		struct {	/* Page cache and anonymous pages */
+			unsigned long flags;
 			/**
 			 * @lru: Pageout list, eg. active_list protected by
 			 * lruvec->lru_lock.  Sometimes used as a generic list
@@ -96,6 +102,8 @@ struct page {
 			unsigned long private;
 		};
 		struct {	/* page_pool used by netstack */
+			unsigned long _pp_flags;
+			unsigned long _pp_pad;
 			/**
 			 * @dma_addr: might require a 64-bit value even on
 			 * 32-bit architectures.
@@ -103,6 +111,7 @@ struct page {
 			dma_addr_t dma_addr;
 		};
 		struct {	/* slab, slob and slub */
+			unsigned long _slab_flags;
 			union {
 				struct list_head slab_list;
 				struct {	/* Partial pages */
@@ -130,6 +139,7 @@ struct page {
 			};
 		};
 		struct {	/* Tail pages of compound page */
+			unsigned long _tail1_flags;
 			unsigned long compound_head;	/* Bit zero is set */
 
 			/* First tail page only */
@@ -139,12 +149,14 @@ struct page {
 			unsigned int compound_nr; /* 1 << compound_order */
 		};
 		struct {	/* Second tail page of compound page */
+			unsigned long _tail2_flags;
 			unsigned long _compound_pad_1;	/* compound_head */
 			atomic_t hpage_pinned_refcount;
 			/* For both global and memcg */
 			struct list_head deferred_list;
 		};
 		struct {	/* Page table pages */
+			unsigned long _pt_flags;
 			unsigned long _pt_pad_1;	/* compound_head */
 			pgtable_t pmd_huge_pte; /* protected by page->ptl */
 			unsigned long _pt_pad_2;	/* mapping */
@@ -159,6 +171,7 @@ struct page {
 #endif
 		};
 		struct {	/* ZONE_DEVICE pages */
+			unsigned long _zd_flags;
 			/** @pgmap: Points to the hosting device page map. */
 			struct dev_pagemap *pgmap;
 			void *zone_device_data;
@@ -174,8 +187,11 @@ struct page {
 			 */
 		};
 
-		/** @rcu_head: You can use this to free a page by RCU. */
-		struct rcu_head rcu_head;
+		struct {
+			unsigned long _rcu_flags;
+			/** @rcu_head: You can use this to free a page by RCU. */
+			struct rcu_head rcu_head;
+		};
 	};
 
 	union {		/* This union is 4 bytes in size. */
