Return-Path: <linuxppc-dev+bounces-7241-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75311A6AC2F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 18:40:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJXrw0htjz305P;
	Fri, 21 Mar 2025 04:39:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742492384;
	cv=none; b=NMbC/RbWQQIa8HAaS6nsMSZMyOjCPTTla+bsWke/IhmyBecgHYnq5nGvzflvARly0zcZMao0gBwSZm+wpiJI7+ouxyK3HwpKjUU68sUNA7Xi7UJkENswdxeb6AIeca+l3+P9HSVwLNRB4AYKl+Faujh+q7J16MeHSRVevsip/Xt1fI94pltjQqFxm99FEOEDFA9PWftrJCHv2lHavLwo7/WbWpMm1861hNKetPo3AF3XFGrlnSwWi6pb8ZOYpoZ8F4M94E7+vET4+2/EUalJ94aaA/B8C399bNqQA9nkSnhdZ7xyOTu0JzCKECtKEYZMFYBL7G9is2nAGcTGCvJZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742492384; c=relaxed/relaxed;
	bh=utO18jM3DqI43jAs46xftkc+iTkKZEsg2nm4Y+WIpWw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a2AMhTxmLflwRLFPCIqrNBCKXW+bmkASm95l9r2sIqrbOK0/5pZXqyuN3mF6j9q6XwcZsdCJ2MeeXNzhXb2lSOPme4pHNAMN/apUc+SJQNb7NDQ8vChNwH/YS09cGzML/nqAkt6cGElTV9Fj37QgJEmdcnOhHQPAnuED/iQ5X6SetuZq0X5X0sX7bewcDRU1DPHnX21/ki2NKo4KEMOuqwFg9RwEyUFryx19m2XaELfTNHxLiUnPvf+Up7mZoLnyV3vKphNjvq0E6sLv9N6KdLuaxmlnjUA4y0NDBLeQvnsWjJ7Fpz2gNwT1PUyd5TqylJ6nIWMW1sUQaH1ELRxrWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=a45bynko; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=32llczwykddclnkxguzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=a45bynko;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=32llczwykddclnkxguzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJXrq6zKKz2xy7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 04:39:39 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff581215f7so1357864a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 10:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742492378; x=1743097178; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=utO18jM3DqI43jAs46xftkc+iTkKZEsg2nm4Y+WIpWw=;
        b=a45bynkoUSrft2iidMS9GvgYHFj8KVt7lvGDxDg7wZRsh/hbme8LJQ6bpIGjcRqF39
         PAuA6q+vvRdL2e/efnz77CHeoDwvHZ4FfTBas8A6tdlOVaXIexCxtlSzYYxqj7sFTMqZ
         yGmB76BvE4P7B5hnzyaQiIZDnGlp5JMaDx8mFmIbxiwfuvlLSK+BiUWPySf1zOQxbq7a
         xrK+QkgDD7nh1HPqphNwWlGEe0cswg/rUu+lP12dGSVqaHRcSPB6d1kHgrojwSZ4T1Mv
         1SehrQFqcJp3pwh1WcxhiQbt4tlsCU7UIzxZGn7pfogVSV0pnlcMMaMKvZS0GKk5UJWv
         uzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742492378; x=1743097178;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=utO18jM3DqI43jAs46xftkc+iTkKZEsg2nm4Y+WIpWw=;
        b=DPyPekcr7JbWPHo0NNyh3r6VHfpVQ5E4ie6ftos5eFbm1jViidwt17Qlft8Zn0w6wi
         QS0TCAqVYR3Th3oiemr7Yvk5iB/5V63xDNDVX/aXRen+UFrzkCOMj/6o5SougU6j0CQu
         mauV8z8TQiESG4uRZi/hI+6gHQWkCnvWayzTdjYltHIJtd9jsHe7b8fL76q0E2meC7a7
         k7W3neg//oTeNheLWw+SFM7oGiNVd/0WCeCyuvKHmZUgphMYwr6ofYusSaPSGt6HYgGc
         ntpe0Jx6vafAQyz8YoqlK1NfCg0iRdPU6mpm2bU1w34dIj9kFA0Q+sfGO3dbB6FqQ5ZJ
         D9cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWlWJYUBkh8pPNTJ89qYHpL71VIqdGctCbvau1tQp4moK1JLAxXYLajrd4I5gTuTKQdMgbCj/vbo1+V7Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwMD4dnhhipjaNfmf0qixtngqH9RVum0QeCOYbcaQlucwnZgKnf
	5lLd0YxNMbUTi23k1nwKQrjD+TbqnwkWTyMA3Fpzm/Krer7zXvFujrazQm+lmXR+dwnZ8iWQz7U
	CRg==
X-Google-Smtp-Source: AGHT+IGjhRps2uk6ZFQZIC7R3fpxDHdrRFbLqUZ0BLeU3xJE1wYlTDOJepff3lsj9OvAu2ohK9dAI+Xpphc=
X-Received: from pjf11.prod.google.com ([2002:a17:90b:3f0b:b0:2fa:1803:2f9f])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2743:b0:2ff:5a9d:9390
 with SMTP id 98e67ed59e1d1-3030fe779bbmr123144a91.8.1742492378297; Thu, 20
 Mar 2025 10:39:38 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:39:30 -0700
In-Reply-To: <20250320173931.1583800-1-surenb@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20250320173931.1583800-1-surenb@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250320173931.1583800-3-surenb@google.com>
Subject: [RFC 2/3] mm: introduce GCMA
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org, david@redhat.com, vbabka@suse.cz, 
	lorenzo.stoakes@oracle.com, liam.howlett@oracle.com, alexandru.elisei@arm.com, 
	peterx@redhat.com, hannes@cmpxchg.org, mhocko@kernel.org, 
	m.szyprowski@samsung.com, iamjoonsoo.kim@lge.com, mina86@mina86.com, 
	axboe@kernel.dk, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	hch@infradead.org, jack@suse.cz, hbathini@linux.ibm.com, 
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com, aneesh.kumar@kernel.org, 
	bhelgaas@google.com, sj@kernel.org, fvdl@google.com, ziy@nvidia.com, 
	yuzhao@google.com, minchan@kernel.org, surenb@google.com, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Minchan Kim <minchan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Minchan Kim <minchan@google.com>

This patch introduces GCMA (Guaranteed Contiguous Memory Allocator)
cleacache backend which reserves some amount of memory at the boot
and then donates it to store clean file-backed pages in the cleancache.
GCMA aims to guarantee contiguous memory allocation success as well as
low and deterministic allocation latency.

Notes:
Originally, the idea was posted by SeongJae Park and Minchan Kim [1].
Later Minchan reworked it to be used in Android as a reference for
Android vendors to use [2].

[1] https://lwn.net/Articles/619865/
[2] https://android-review.googlesource.com/q/topic:%22gcma_6.12%22

Signed-off-by: Minchan Kim <minchan@google.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/gcma.h |  12 ++++
 mm/Kconfig           |  15 +++++
 mm/Makefile          |   1 +
 mm/gcma.c            | 155 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 183 insertions(+)
 create mode 100644 include/linux/gcma.h
 create mode 100644 mm/gcma.c

diff --git a/include/linux/gcma.h b/include/linux/gcma.h
new file mode 100644
index 000000000000..2ce40fcc74a5
--- /dev/null
+++ b/include/linux/gcma.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __GCMA_H__
+#define __GCMA_H__
+
+#include <linux/types.h>
+
+int gcma_register_area(const char *name,
+		       unsigned long start_pfn, unsigned long count);
+void gcma_alloc_range(unsigned long start_pfn, unsigned long count);
+void gcma_free_range(unsigned long start_pfn, unsigned long count);
+
+#endif /* __GCMA_H__ */
diff --git a/mm/Kconfig b/mm/Kconfig
index d6ebf0fb0432..85268ef901b6 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1002,6 +1002,21 @@ config CMA_AREAS
 
 	  If unsure, leave the default value "8" in UMA and "20" in NUMA.
 
+config GCMA
+       bool "GCMA (Guaranteed Contiguous Memory Allocator)"
+       depends on CLEANCACHE
+	help
+	  This enables the Guaranteed Contiguous Memory Allocator to allow
+	  low latency guaranteed contiguous memory allocations. Memory
+	  reserved by GCMA is donated to cleancache to be used as pagecache
+	  extension. Once GCMA allocation is requested, necessary pages are
+	  taken back from the cleancache and used to satisfy the request.
+	  Cleancache guarantees low latency successful allocation as long
+	  as the total size of GCMA allocations does not exceed the size of
+	  the memory donated to the cleancache.
+
+	  If unsure, say "N".
+
 config MEM_SOFT_DIRTY
 	bool "Track memory changes"
 	depends on CHECKPOINT_RESTORE && HAVE_ARCH_SOFT_DIRTY && PROC_FS
diff --git a/mm/Makefile b/mm/Makefile
index 084dbe9edbc4..2173d395d371 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -149,3 +149,4 @@ obj-$(CONFIG_EXECMEM) += execmem.o
 obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
 obj-$(CONFIG_PT_RECLAIM) += pt_reclaim.o
 obj-$(CONFIG_CLEANCACHE) += cleancache.o
+obj-$(CONFIG_GCMA)	+= gcma.o
diff --git a/mm/gcma.c b/mm/gcma.c
new file mode 100644
index 000000000000..263e63da0c89
--- /dev/null
+++ b/mm/gcma.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * GCMA (Guaranteed Contiguous Memory Allocator)
+ *
+ */
+
+#define pr_fmt(fmt) "gcma: " fmt
+
+#include <linux/cleancache.h>
+#include <linux/gcma.h>
+#include <linux/hashtable.h>
+#include <linux/highmem.h>
+#include <linux/idr.h>
+#include <linux/slab.h>
+#include <linux/xarray.h>
+
+#define MAX_GCMA_AREAS		64
+#define GCMA_AREA_NAME_MAX_LEN	32
+
+struct gcma_area {
+	int area_id;
+	unsigned long start_pfn;
+	unsigned long end_pfn;
+	char name[GCMA_AREA_NAME_MAX_LEN];
+};
+
+static struct gcma_area areas[MAX_GCMA_AREAS];
+static atomic_t nr_gcma_area = ATOMIC_INIT(0);
+static DEFINE_SPINLOCK(gcma_area_lock);
+
+static void alloc_page_range(struct gcma_area *area,
+			     unsigned long start_pfn, unsigned long end_pfn)
+{
+	unsigned long scanned = 0;
+	unsigned long pfn;
+	struct page *page;
+	int err;
+
+	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
+		if (!(++scanned % XA_CHECK_SCHED))
+			cond_resched();
+
+		page = pfn_to_page(pfn);
+		err = cleancache_backend_get_folio(area->area_id, page_folio(page));
+		VM_BUG_ON(err);
+	}
+}
+
+static void free_page_range(struct gcma_area *area,
+			    unsigned long start_pfn, unsigned long end_pfn)
+{
+	unsigned long scanned = 0;
+	unsigned long pfn;
+	struct page *page;
+	int err;
+
+	for (pfn = start_pfn; pfn < end_pfn; pfn++) {
+		if (!(++scanned % XA_CHECK_SCHED))
+			cond_resched();
+
+		page = pfn_to_page(pfn);
+		err = cleancache_backend_put_folio(area->area_id,
+						   page_folio(page));
+		VM_BUG_ON(err);
+	}
+}
+
+int gcma_register_area(const char *name,
+		       unsigned long start_pfn, unsigned long count)
+{
+	LIST_HEAD(folios);
+	int i, area_id;
+	int nr_area;
+	int ret = 0;
+
+	for (i = 0; i < count; i++) {
+		struct folio *folio;
+
+		folio = page_folio(pfn_to_page(start_pfn + i));
+		list_add(&folio->lru, &folios);
+	}
+
+	area_id = cleancache_register_backend(name, &folios);
+	if (area_id < 0)
+		return area_id;
+
+	spin_lock(&gcma_area_lock);
+
+	nr_area = atomic_read(&nr_gcma_area);
+	if (nr_area < MAX_GCMA_AREAS) {
+		struct gcma_area *area = &areas[nr_area];
+
+		area->area_id = area_id;
+		area->start_pfn = start_pfn;
+		area->end_pfn = start_pfn + count;
+		strscpy(area->name, name);
+		/* Ensure above stores complete before we increase the count */
+		atomic_set_release(&nr_gcma_area, nr_area + 1);
+	} else {
+		ret = -ENOMEM;
+	}
+
+	spin_unlock(&gcma_area_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gcma_register_area);
+
+void gcma_alloc_range(unsigned long start_pfn, unsigned long count)
+{
+	int nr_area = atomic_read_acquire(&nr_gcma_area);
+	unsigned long end_pfn = start_pfn + count;
+	struct gcma_area *area;
+	int i;
+
+	for (i = 0; i < nr_area; i++) {
+		unsigned long s_pfn, e_pfn;
+
+		area = &areas[i];
+		if (area->end_pfn <= start_pfn)
+			continue;
+
+		if (area->start_pfn > end_pfn)
+			continue;
+
+		s_pfn = max(start_pfn, area->start_pfn);
+		e_pfn = min(end_pfn, area->end_pfn);
+		alloc_page_range(area, s_pfn, e_pfn);
+	}
+}
+EXPORT_SYMBOL_GPL(gcma_alloc_range);
+
+void gcma_free_range(unsigned long start_pfn, unsigned long count)
+{
+	int nr_area = atomic_read_acquire(&nr_gcma_area);
+	unsigned long end_pfn = start_pfn + count;
+	struct gcma_area *area;
+	int i;
+
+	for (i = 0; i < nr_area; i++) {
+		unsigned long s_pfn, e_pfn;
+
+		area = &areas[i];
+		if (area->end_pfn <= start_pfn)
+			continue;
+
+		if (area->start_pfn > end_pfn)
+			continue;
+
+		s_pfn = max(start_pfn, area->start_pfn);
+		e_pfn = min(end_pfn, area->end_pfn);
+		free_page_range(area, s_pfn, e_pfn);
+	}
+}
+EXPORT_SYMBOL_GPL(gcma_free_range);
-- 
2.49.0.rc1.451.g8f38331e32-goog


