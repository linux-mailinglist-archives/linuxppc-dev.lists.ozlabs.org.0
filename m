Return-Path: <linuxppc-dev+bounces-17913-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KXEEAXlrmmsJwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17913-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 16:19:33 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5973B23B887
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 16:19:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV0zj51QDz3c9d;
	Tue, 10 Mar 2026 02:19:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773069569;
	cv=none; b=mucw68qxuv8v+X/q88QYQpZV8R7/8WQDcjE9Lsg6xaCH+FtxT9R/nZe0C7E76lcC3tw32mrXoyHKl5QTTomDsDJ887MehIPjCdGjY7Ifkfm7EQx4C1TEvw/g4selX5KpIKQ/iDxG9xa+ixRQaPD/xyHtykAX8bdG9+m2irBX8waEqs6GER+JChjGMUuK+LWbThsVEX3wtbnOrQbx145EPx/Bvdfmzmpov7bcsL1yn+OaaI5Xtl51GLQHGztQnccMvN4clSi9g1WIJSAwOaf8b1WIodXFue2ATuAHnmgwIvrX81FsDLHxPH1tZPdtX0kqCGLQHgk/wViGt75OWV784g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773069569; c=relaxed/relaxed;
	bh=8TSEUSGyzIrSnUfG1DVi5eGrw9YR0I+2760zFGy4g+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbwF4WxcK/GqqHVjbgMncw420f0ZCgfRSpQ3Bh5/uCSwRt7MJojJGGsBUa8aDR5xHpQqZfmZuhkJt9jUEYizLBe446Y98NXBnnQY0nZsG7knnVtdansXz5MVIcp5ejZpEceElYn2CCSDPcBgidbgBNr7QMmK/sYGn4zwSbzDY4/2TENc2GUzRyFxbWW/CxalYl+X50kRvyJrEBBsJgyGOLMoEagjm7lccTsHJnw96tr2XkIucITt7LaYdXA6CZdYW+xBvOudxiJAzrnsAXrzsOJb4vsIH1g2cbr3KtkKgcndAyOoJB90xyqg2d9fz2pUhE1zMp0PHi8jMsRZ4fIb+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vIzLDFSz; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=vIzLDFSz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV0zh5tlMz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 02:19:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0F1F43A8D;
	Mon,  9 Mar 2026 15:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B98AC4CEF7;
	Mon,  9 Mar 2026 15:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773069566;
	bh=Mhr7tHNnk4w6+iI/utOSEhEAAttuf6c8xcPh/66ACkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vIzLDFSzRjakKohtre+2VeVYCY78KNKV3+vsvOm4E91ML/9l4r5EZZ+H73I/hKO3F
	 +ymncYI/de8NbufE4brWEUyrTiWHk5hR4K/ODmDyvuR8uVZXpCDVCky0p3O0yIIj/V
	 5/S/nWoXlmvP+gF3GyW18r8iURaGdQ7QSgf7rHclKZkN+mavll8dKHMfh11QOJA8qF
	 pn777/LRL7Y0CRCImdIB7ue6zCaTupvWYrAu67gKmPH76E13Cg6AbI7tb59lhTh8Rx
	 0Y9XxMlJvjbf32TuaMTLmyoKbJKfWIHiR7E9KZqnbICSP+ItP6CoXrazRZ5L2DRS/Z
	 auQaLD4Xrx4vg==
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v2 2/4] mm: move vma_mmu_pagesize() from hugetlb to vma.c
Date: Mon,  9 Mar 2026 16:18:59 +0100
Message-ID: <20260309151901.123947-3-david@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309151901.123947-1-david@kernel.org>
References: <20260309151901.123947-1-david@kernel.org>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 5973B23B887
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17913-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[kvack.org,lists.ozlabs.org,vger.kernel.org,kernel.org,linux-foundation.org,linux.ibm.com,gmail.com,ellerman.id.au,linux.dev,suse.de,oracle.com,google.com,suse.com,redhat.com,intel.com];
	FORGED_SENDER(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:david@kernel.org,m:akpm@linux-foundation.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:ljs@kernel.org,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:pbonzini@redhat.com,m:dan.j.williams@intel.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

vma_mmu_pagesize() is also queried on non-hugetlb VMAs and does not
really belong into hugetlb.c.

PPC64 provides a custom overwrite with CONFIG_HUGETLB_PAGE, see
arch/powerpc/mm/book3s64/slice.c, so we cannot easily make this a
static inline function.

So let's move it to vma.c and add some proper kerneldoc.

To make vma tests happy, add a simple vma_kernel_pagesize() stub in
tools/testing/vma/include/custom.h.

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/hugetlb.h            |  7 -------
 include/linux/mm.h                 |  2 ++
 mm/hugetlb.c                       | 11 -----------
 mm/vma.c                           | 21 +++++++++++++++++++++
 tools/testing/vma/include/custom.h |  5 +++++
 5 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 44c1848a2c21..aaf3d472e6b5 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -777,8 +777,6 @@ static inline unsigned long huge_page_size(const struct hstate *h)
 	return (unsigned long)PAGE_SIZE << h->order;
 }
 
-extern unsigned long vma_mmu_pagesize(struct vm_area_struct *vma);
-
 static inline unsigned long huge_page_mask(struct hstate *h)
 {
 	return h->mask;
@@ -1175,11 +1173,6 @@ static inline unsigned long huge_page_mask(struct hstate *h)
 	return PAGE_MASK;
 }
 
-static inline unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
-{
-	return PAGE_SIZE;
-}
-
 static inline unsigned int huge_page_order(struct hstate *h)
 {
 	return 0;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 227809790f1a..22d338933c84 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1327,6 +1327,8 @@ static inline unsigned long vma_kernel_pagesize(struct vm_area_struct *vma)
 	return PAGE_SIZE;
 }
 
+unsigned long vma_mmu_pagesize(struct vm_area_struct *vma);
+
 static inline
 struct vm_area_struct *vma_find(struct vma_iterator *vmi, unsigned long max)
 {
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 66eadfa9e958..f6ecca9aae01 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1017,17 +1017,6 @@ static pgoff_t vma_hugecache_offset(struct hstate *h,
 			(vma->vm_pgoff >> huge_page_order(h));
 }
 
-/*
- * Return the page size being used by the MMU to back a VMA. In the majority
- * of cases, the page size used by the kernel matches the MMU size. On
- * architectures where it differs, an architecture-specific 'strong'
- * version of this symbol is required.
- */
-__weak unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
-{
-	return vma_kernel_pagesize(vma);
-}
-
 /*
  * Flags for MAP_PRIVATE reservations.  These are stored in the bottom
  * bits of the reservation map pointer, which are always clear due to
diff --git a/mm/vma.c b/mm/vma.c
index be64f781a3aa..e95fd5a5fe5c 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -3300,3 +3300,24 @@ int insert_vm_struct(struct mm_struct *mm, struct vm_area_struct *vma)
 
 	return 0;
 }
+
+/**
+ * vma_mmu_pagesize - Default MMU page size granularity for this VMA.
+ * @vma: The user mapping.
+ *
+ * In the common case, the default page size used by the MMU matches the
+ * default page size used by the kernel (see vma_kernel_pagesize()). On
+ * architectures where it differs, an architecture-specific 'strong' version
+ * of this symbol is required.
+ *
+ * The default MMU page size is not affected by Transparent Huge Pages
+ * being in effect, or any usage of larger MMU page sizes (either through
+ * architectural huge-page mappings or other explicit/implicit coalescing of
+ * virtual ranges performed by the MMU).
+ *
+ * Return: The default MMU page size granularity for this VMA.
+ */
+__weak unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
+{
+	return vma_kernel_pagesize(vma);
+}
diff --git a/tools/testing/vma/include/custom.h b/tools/testing/vma/include/custom.h
index 802a76317245..4305a5b6e433 100644
--- a/tools/testing/vma/include/custom.h
+++ b/tools/testing/vma/include/custom.h
@@ -117,3 +117,8 @@ static inline vma_flags_t __mk_vma_flags(size_t count, const vma_flag_t *bits)
 			vma_flag_set(&flags, bits[i]);
 	return flags;
 }
+
+static inline unsigned long vma_kernel_pagesize(struct vm_area_struct *vma)
+{
+	return PAGE_SIZE;
+}
-- 
2.43.0


