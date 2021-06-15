Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1D23A7F37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 15:27:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G48HW6Lgdz3c6V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 23:27:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Yvjhr/bJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+01b1093948f83d17b939+6505+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=Yvjhr/bJ; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G48GY5fxyz2xb8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 23:26:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=1X21SF/7fmwg2FrGG5ahYeKQk8ivw4suEk6vCt/uQZM=; b=Yvjhr/bJmyJ/QCD+GCduqR8jqD
 RfTnBcPS7gxLwW7kxITRtCz0LU2jOF9jpt0JwCS1WO3/TpTYsfE0R4dPtZGTRx/ju2FqDrozih8Jk
 aiZGKwiuEcyhdyeL+PmvjvkV5PFLRvauaMoSuuu9uM+vJl3qs/9CTh7sD2QjB2KjfOb65mtU2myUn
 qkfsk6YjZlAK3U/zrVA/R5JbS2FbFJIRHZFLKMBJGzz6h8RCblaDBYsnT/foXESa+zQPlmJelf4oX
 Vi9UPEtaewyVKmdkil7ItuM/Sw7khkyPbd4o6gm/aAiy9bj/1GtYW24JZAJ9XsVUcVZw0mxAa3egy
 OVadjXDg==;
Received: from [2001:4bb8:19b:fdce:9045:1e63:20f0:ca9] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt942-006nuT-C1; Tue, 15 Jun 2021 13:25:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 01/18] mm: add a kunmap_local_dirty helper
Date: Tue, 15 Jun 2021 15:24:39 +0200
Message-Id: <20210615132456.753241-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615132456.753241-1-hch@lst.de>
References: <20210615132456.753241-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 dm-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a helper that calls flush_kernel_dcache_page before unmapping the
local mapping.  flush_kernel_dcache_page is required for all pages
potentially mapped into userspace that were written to using kmap*,
so having a helper that does the right thing can be very convenient.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/highmem-internal.h | 7 +++++++
 include/linux/highmem.h          | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/include/linux/highmem-internal.h b/include/linux/highmem-internal.h
index 7902c7d8b55f..bd37706db147 100644
--- a/include/linux/highmem-internal.h
+++ b/include/linux/highmem-internal.h
@@ -224,4 +224,11 @@ do {								\
 	__kunmap_local(__addr);					\
 } while (0)
 
+#define kunmap_local_dirty(__page, __addr)			\
+do {								\
+	if (!PageSlab(__page))					\
+		flush_kernel_dcache_page(__page);		\
+	kunmap_local(__addr);					\
+} while (0)
+
 #endif
diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 832b49b50c7b..65f548db4f2d 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -93,6 +93,10 @@ static inline void kmap_flush_unused(void);
  * On HIGHMEM enabled systems mapping a highmem page has the side effect of
  * disabling migration in order to keep the virtual address stable across
  * preemption. No caller of kmap_local_page() can rely on this side effect.
+ *
+ * If data is written to the returned kernel mapping, the callers needs to
+ * unmap the mapping using kunmap_local_dirty(), else kunmap_local() should
+ * be used.
  */
 static inline void *kmap_local_page(struct page *page);
 
-- 
2.30.2

