Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BA72AF452
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 16:01:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWScg2L9CzDqf4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 02:01:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=haT7YXCn; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZtY7AKnw; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWSRH3cGDzDqnK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 01:53:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605106424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Hsf7UMhD6lshsPcxUgvuFvPmAOlqNJdpUrKbgxNpTM=;
 b=haT7YXCn1cV48CbIrR/kHFhuRSZAuW+0ciDv3AzCi9YsMrHGrj2rhkqvc02q05ciuEXjMg
 kmiQ44bLJchYabdS9gkkSnqMMpNs2KMGLK2fBBC1cOXkwJpfmv/dh1P+hDJC2o9GgbXuvg
 JEYTv1Lyw/akBVQvjS5MifIJ4UkLKVo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605106425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Hsf7UMhD6lshsPcxUgvuFvPmAOlqNJdpUrKbgxNpTM=;
 b=ZtY7AKnwla1oDW2EzeWTIah9DIr+iePMmqSi7+4QCv4vq48i/WneT9mqwH3sOKeWiD544I
 GM/mwdd2G+8m+KRxOGKn1HGxHnKoSFwEOx2IE0jVIq8eIpMeTJtjX4sLShlaK690AAi5rd
 9pAK3iwTxxXq5IEwVF6XPPooHqenZes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-4-5p_oIVPD2UIPJW38q9Qg-1; Wed, 11 Nov 2020 09:53:40 -0500
X-MC-Unique: 4-5p_oIVPD2UIPJW38q9Qg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8054CFF25;
 Wed, 11 Nov 2020 14:53:38 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-151.ams2.redhat.com [10.36.114.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45E3727BB5;
 Wed, 11 Nov 2020 14:53:35 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] powerpc/mm: factor out creating/removing linear mapping
Date: Wed, 11 Nov 2020 15:53:17 +0100
Message-Id: <20201111145322.15793-4-david@redhat.com>
In-Reply-To: <20201111145322.15793-1-david@redhat.com>
References: <20201111145322.15793-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Michal Hocko <mhocko@suse.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Rashmica Gupta <rashmica.g@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We want to stop abusing memory hotplug infrastructure in memtrace code
to perform allocations and remove the linear mapping. Instead we will use
alloc_contig_pages() and remove the linear mapping manually.

Let's factor out creating/removing the linear mapping into
arch_create_linear_mapping() / arch_remove_linear_mapping() - so in the
future, we might be able to have whole arch_add_memory() /
arch_remove_memory() be implemented in common code.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Rashmica Gupta <rashmica.g@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/mm/mem.c          | 41 +++++++++++++++++++++++-----------
 include/linux/memory_hotplug.h |  3 +++
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 01ec2a252f09..8a86d81f8df0 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -120,34 +120,26 @@ static void flush_dcache_range_chunked(unsigned long start, unsigned long stop,
 	}
 }
 
-int __ref arch_add_memory(int nid, u64 start, u64 size,
-			  struct mhp_params *params)
+int __ref arch_create_linear_mapping(int nid, u64 start, u64 size,
+				     struct mhp_params *params)
 {
-	unsigned long start_pfn = start >> PAGE_SHIFT;
-	unsigned long nr_pages = size >> PAGE_SHIFT;
 	int rc;
 
 	start = (unsigned long)__va(start);
 	rc = create_section_mapping(start, start + size, nid,
 				    params->pgprot);
 	if (rc) {
-		pr_warn("Unable to create mapping for hot added memory 0x%llx..0x%llx: %d\n",
+		pr_warn("Unable to create linear mapping for 0x%llx..0x%llx: %d\n",
 			start, start + size, rc);
 		return -EFAULT;
 	}
-
-	return __add_pages(nid, start_pfn, nr_pages, params);
+	return 0;
 }
 
-void __ref arch_remove_memory(int nid, u64 start, u64 size,
-			     struct vmem_altmap *altmap)
+void __ref arch_remove_linear_mapping(u64 start, u64 size)
 {
-	unsigned long start_pfn = start >> PAGE_SHIFT;
-	unsigned long nr_pages = size >> PAGE_SHIFT;
 	int ret;
 
-	__remove_pages(start_pfn, nr_pages, altmap);
-
 	/* Remove htab bolted mappings for this section of memory */
 	start = (unsigned long)__va(start);
 	flush_dcache_range_chunked(start, start + size, FLUSH_CHUNK_SIZE);
@@ -160,6 +152,29 @@ void __ref arch_remove_memory(int nid, u64 start, u64 size,
 	 */
 	vm_unmap_aliases();
 }
+
+int __ref arch_add_memory(int nid, u64 start, u64 size,
+			  struct mhp_params *params)
+{
+	unsigned long start_pfn = start >> PAGE_SHIFT;
+	unsigned long nr_pages = size >> PAGE_SHIFT;
+	int rc;
+
+	rc = arch_create_linear_mapping(nid, start, size, params);
+	if (rc)
+		return rc;
+	return __add_pages(nid, start_pfn, nr_pages, params);
+}
+
+void __ref arch_remove_memory(int nid, u64 start, u64 size,
+			      struct vmem_altmap *altmap)
+{
+	unsigned long start_pfn = start >> PAGE_SHIFT;
+	unsigned long nr_pages = size >> PAGE_SHIFT;
+
+	__remove_pages(start_pfn, nr_pages, altmap);
+	arch_remove_linear_mapping(start, size);
+}
 #endif
 
 #ifndef CONFIG_NEED_MULTIPLE_NODES
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index d65c6fdc5cfc..00b9e9bd3850 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -375,6 +375,9 @@ extern struct page *sparse_decode_mem_map(unsigned long coded_mem_map,
 					  unsigned long pnum);
 extern struct zone *zone_for_pfn_range(int online_type, int nid, unsigned start_pfn,
 		unsigned long nr_pages);
+extern int arch_create_linear_mapping(int nid, u64 start, u64 size,
+				      struct mhp_params *params);
+void arch_remove_linear_mapping(u64 start, u64 size);
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
 #endif /* __LINUX_MEMORY_HOTPLUG_H */
-- 
2.26.2

