Return-Path: <linuxppc-dev+bounces-7240-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEEAA6AC2C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 18:39:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJXrt5bhJz2yD8;
	Fri, 21 Mar 2025 04:39:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742492382;
	cv=none; b=JKEP+FTThS2ilz3JnOb/0f51ddQIljFjp/wWdhczw2wROJbIaWiOtjLWuVMBOLna89yqUYJDWhGgHZZGABQxDpN/GAQgupSCFtrR57i95sdf74iOwUvB9ok87loCDD0Kohe2Xmk67tnTz9CmTZEWuAwBnl9m1bVYT+hR/ZgYFgN2pUoZEch8Km+hV2sZVimPecbRQwXxAN0LjsqRbd1I5ryqQuvGsmGfC4LChRBO+65+pHnQ5gqmAfae4AqBkLDsy5ZLdChpT3I8g1ZNlZvz7Jgr9jMS9XsubnlEjKCR+jGrGkR95th7qm2KCG872ZwNJ83Lv+jxlW+qklojnJcEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742492382; c=relaxed/relaxed;
	bh=L1LeZ1NqRBiJP18aw9wNSepnO5CEnnjsFwRWiKcady0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PmJQZDIX01r9Rp0SDHCsnn5ziwSk/pPexhS9qza5oL5JBRERuhAmdysS+TIYCeai/XpdhjDA6r1jF+8Hxo3Mj3uPml5bKZb6xsmYq8dTxLkHXZonDy8yBaX4RnOSkTS9ZiKUOShtuZPuBzrXNrEuP7EwGA0A4U/Eml/WrgA3YcKY5BnWx/J6nEUZn5TfX491m1B+uuWOhC9y6LNhOCG81YhCVeSQIKqhHVXr2KCCQ5ppmdTAoxgh90bhV7z1g/lIXjTorkYGmFUvBowxLP9uyxLQi+buI/wfYohP6MYE1Ge7UL+nN3qd8jQmxz4gyLQjcX/Ygmdqs6XqeGfcceP2uQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YZM6U1QR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=33flczwykddknpmziwbjjbgz.xjhgdipskkx-yzqgdnon.jugvwn.jmb@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YZM6U1QR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=33flczwykddknpmziwbjjbgz.xjhgdipskkx-yzqgdnon.jugvwn.jmb@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJXrs6XKHz305P
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 04:39:41 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2262051205aso9807895ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 10:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742492380; x=1743097180; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L1LeZ1NqRBiJP18aw9wNSepnO5CEnnjsFwRWiKcady0=;
        b=YZM6U1QRNFnWJWLj0MKxEGlNeWkOlPGf3nebO5OCrSxnhJJe5lpbQe0TkE5cG5ZeiG
         u26h4qwQrO2yX5KmKTl+QVRwPcwDQHaA5/XVbLLZqs9IEnVTEHDyCuAkgPmg+w8NywH1
         F1PwdwL+yck7Jm/AyTHTb3BHEwl4OzcJtfWXTgu6Svn8UR2vStOaOmgVN/qvCrLNrTf5
         Y14AXZndId4xoSlwcKdz7YNxVed9rVpNXLVsWGcqO5151If32Jdk3RVmxq0aPg1GP95Y
         /YBznDMLeA6YqNEKNA/7vO4IPBbTNx6SRhhxu9PNY4A7n9/p/ALo+AfErGyoDoAxjytB
         9Wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742492380; x=1743097180;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L1LeZ1NqRBiJP18aw9wNSepnO5CEnnjsFwRWiKcady0=;
        b=FUzZmXOEI9Ht+LOpDugk0IPWotPybhZt4ZP2FQfRUTKupAA/MEVpGD/AfPdjGavNeM
         xQEP6wHxpIShyhnkvYUGmAro+Qbh+Dc8c69JKMU6Dl8TYB8QxJlkM+is3tPuQaa4k9FY
         ElN69T5xoHC37Qx9XDkEf7x57bUyRqzMrKiq5Fg0Nd0zSwRozxcvQAGIBgyjXTDmp8Sb
         qnz7PPKUqTKWGPAxBmONFXqiB/AWUKqz1P4vZm3tPAvLXuE5YhUHX9hrvYZ1lhhVLVbs
         ydYQn35ojzhF/f/oCsB4ouwLml6Dv7D6h+tORIF/C4s1hyTO3f5hjTs5I1vDxU+DW9oD
         nU4w==
X-Forwarded-Encrypted: i=1; AJvYcCVQAy+i/HWCp5Z2bZpGnjVhKfd44sAVV4rucV8v28C+kxuusempwsJ54UsQs6Rafzpa2Ht7qILIOjOT1F4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyljHZXRAwfvIpgfM6RxVqPz6klHCTYYrWA779dXxCnYlHh+CKO
	7OGqurYV6mc7CA6sbj5DZ5MPMfNyDINJdaVXYWbQn4Q6YsvMfUGUoIvZXkC1p8s9/o4dIYqvU87
	QeA==
X-Google-Smtp-Source: AGHT+IFIgtoncBq9NM/3xD7Imlcbq1xmz7ZhqdBzB7CyCMtuFxcwQyRcHUOe3EsR477ZgjHZHfVYEHABcPU=
X-Received: from plbkj16.prod.google.com ([2002:a17:903:6d0:b0:220:ecac:27e5])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e888:b0:223:35cb:e421
 with SMTP id d9443c01a7336-22780e258cemr2827355ad.49.1742492380069; Thu, 20
 Mar 2025 10:39:40 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:39:31 -0700
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
Message-ID: <20250320173931.1583800-4-surenb@google.com>
Subject: [RFC 3/3] mm: integrate GCMA with CMA using dt-bindings
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

This patch introduces a new "guarantee" property for shared-dma-pool.
With this property, admin can create specific memory pool as
GCMA-based CMA if they care about allocation success rate and latency.
The downside of GCMA is that it can host only clean file-backed pages
since it's using cleancache as its secondary user.

Signed-off-by: Minchan Kim <minchan@google.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 arch/powerpc/kernel/fadump.c |  2 +-
 include/linux/cma.h          |  2 +-
 kernel/dma/contiguous.c      | 11 ++++++++++-
 mm/cma.c                     | 33 ++++++++++++++++++++++++++-------
 mm/cma.h                     |  1 +
 mm/cma_sysfs.c               | 10 ++++++++++
 6 files changed, 49 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4b371c738213..4eb7be0cdcdb 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -111,7 +111,7 @@ void __init fadump_cma_init(void)
 		return;
 	}
 
-	rc = cma_init_reserved_mem(base, size, 0, "fadump_cma", &fadump_cma);
+	rc = cma_init_reserved_mem(base, size, 0, "fadump_cma", &fadump_cma, false);
 	if (rc) {
 		pr_err("Failed to init cma area for firmware-assisted dump,%d\n", rc);
 		/*
diff --git a/include/linux/cma.h b/include/linux/cma.h
index 62d9c1cf6326..3207db979e94 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -46,7 +46,7 @@ extern int __init cma_declare_contiguous_multi(phys_addr_t size,
 extern int cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 					unsigned int order_per_bit,
 					const char *name,
-					struct cma **res_cma);
+					struct cma **res_cma, bool gcma);
 extern struct page *cma_alloc(struct cma *cma, unsigned long count, unsigned int align,
 			      bool no_warn);
 extern bool cma_pages_valid(struct cma *cma, const struct page *pages, unsigned long count);
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 055da410ac71..a68b3123438c 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -459,6 +459,7 @@ static int __init rmem_cma_setup(struct reserved_mem *rmem)
 	unsigned long node = rmem->fdt_node;
 	bool default_cma = of_get_flat_dt_prop(node, "linux,cma-default", NULL);
 	struct cma *cma;
+	bool gcma;
 	int err;
 
 	if (size_cmdline != -1 && default_cma) {
@@ -476,7 +477,15 @@ static int __init rmem_cma_setup(struct reserved_mem *rmem)
 		return -EINVAL;
 	}
 
-	err = cma_init_reserved_mem(rmem->base, rmem->size, 0, rmem->name, &cma);
+	gcma = !!of_get_flat_dt_prop(node, "guarantee", NULL);
+#ifndef CONFIG_GCMA
+	if (gcma) {
+		pr_err("Reserved memory: unable to setup GCMA region, GCMA is not enabled\n");
+		return -EINVAL;
+	}
+#endif
+	err = cma_init_reserved_mem(rmem->base, rmem->size, 0, rmem->name,
+				    &cma, gcma);
 	if (err) {
 		pr_err("Reserved memory: unable to setup CMA region\n");
 		return err;
diff --git a/mm/cma.c b/mm/cma.c
index b06d5fe73399..f12cef849e58 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -26,6 +26,7 @@
 #include <linux/cma.h>
 #include <linux/highmem.h>
 #include <linux/io.h>
+#include <linux/gcma.h>
 #include <linux/kmemleak.h>
 #include <trace/events/cma.h>
 
@@ -165,11 +166,18 @@ static void __init cma_activate_area(struct cma *cma)
 			count = cmr->early_pfn - cmr->base_pfn;
 			bitmap_count = cma_bitmap_pages_to_bits(cma, count);
 			bitmap_set(cmr->bitmap, 0, bitmap_count);
+		} else {
+			count = 0;
 		}
 
-		for (pfn = cmr->early_pfn; pfn < cmr->base_pfn + cmr->count;
-		     pfn += pageblock_nr_pages)
-			init_cma_reserved_pageblock(pfn_to_page(pfn));
+		if (cma->gcma) {
+			gcma_register_area(cma->name, cmr->early_pfn,
+					   cma->count - count);
+		} else {
+			for (pfn = cmr->early_pfn; pfn < cmr->base_pfn + cmr->count;
+			     pfn += pageblock_nr_pages)
+				init_cma_reserved_pageblock(pfn_to_page(pfn));
+		}
 	}
 
 	spin_lock_init(&cma->lock);
@@ -270,7 +278,7 @@ static void __init cma_drop_area(struct cma *cma)
 int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 				 unsigned int order_per_bit,
 				 const char *name,
-				 struct cma **res_cma)
+				 struct cma **res_cma, bool gcma)
 {
 	struct cma *cma;
 	int ret;
@@ -301,6 +309,7 @@ int __init cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 	cma->ranges[0].count = cma->count;
 	cma->nranges = 1;
 	cma->nid = NUMA_NO_NODE;
+	cma->gcma = gcma;
 
 	*res_cma = cma;
 
@@ -721,7 +730,8 @@ static int __init __cma_declare_contiguous_nid(phys_addr_t base,
 		base = addr;
 	}
 
-	ret = cma_init_reserved_mem(base, size, order_per_bit, name, res_cma);
+	ret = cma_init_reserved_mem(base, size, order_per_bit, name, res_cma,
+				    false);
 	if (ret)
 		memblock_phys_free(base, size);
 
@@ -815,7 +825,13 @@ static int cma_range_alloc(struct cma *cma, struct cma_memrange *cmr,
 
 		pfn = cmr->base_pfn + (bitmap_no << cma->order_per_bit);
 		mutex_lock(&cma->alloc_mutex);
-		ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA, gfp);
+		if (cma->gcma) {
+			gcma_alloc_range(pfn, count);
+			ret = 0;
+		} else {
+			ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA,
+						 gfp);
+		}
 		mutex_unlock(&cma->alloc_mutex);
 		if (ret == 0) {
 			page = pfn_to_page(pfn);
@@ -992,7 +1008,10 @@ bool cma_release(struct cma *cma, const struct page *pages,
 	if (r == cma->nranges)
 		return false;
 
-	free_contig_range(pfn, count);
+	if (cma->gcma)
+		gcma_free_range(pfn, count);
+	else
+		free_contig_range(pfn, count);
 	cma_clear_bitmap(cma, cmr, pfn, count);
 	cma_sysfs_account_release_pages(cma, count);
 	trace_cma_release(cma->name, pfn, pages, count);
diff --git a/mm/cma.h b/mm/cma.h
index 41a3ab0ec3de..c2a5576d7987 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -47,6 +47,7 @@ struct cma {
 	char name[CMA_MAX_NAME];
 	int nranges;
 	struct cma_memrange ranges[CMA_MAX_RANGES];
+	bool gcma;
 #ifdef CONFIG_CMA_SYSFS
 	/* the number of CMA page successful allocations */
 	atomic64_t nr_pages_succeeded;
diff --git a/mm/cma_sysfs.c b/mm/cma_sysfs.c
index 97acd3e5a6a5..4ecc36270a4d 100644
--- a/mm/cma_sysfs.c
+++ b/mm/cma_sysfs.c
@@ -80,6 +80,15 @@ static ssize_t available_pages_show(struct kobject *kobj,
 }
 CMA_ATTR_RO(available_pages);
 
+static ssize_t gcma_show(struct kobject *kobj,
+			 struct kobj_attribute *attr, char *buf)
+{
+	struct cma *cma = cma_from_kobj(kobj);
+
+	return sysfs_emit(buf, "%d\n", cma->gcma);
+}
+CMA_ATTR_RO(gcma);
+
 static void cma_kobj_release(struct kobject *kobj)
 {
 	struct cma *cma = cma_from_kobj(kobj);
@@ -95,6 +104,7 @@ static struct attribute *cma_attrs[] = {
 	&release_pages_success_attr.attr,
 	&total_pages_attr.attr,
 	&available_pages_attr.attr,
+	&gcma_attr.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(cma);
-- 
2.49.0.rc1.451.g8f38331e32-goog


