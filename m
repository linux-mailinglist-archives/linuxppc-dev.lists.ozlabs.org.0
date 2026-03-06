Return-Path: <linuxppc-dev+bounces-17798-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNpbAYKpqmnjVAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17798-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 11:16:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE8321E8CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 11:16:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS2PV4rMNz3c5f;
	Fri, 06 Mar 2026 21:16:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772792190;
	cv=none; b=kZkoGzAX460COC7ZaDO0S1Koq62wHlPzXraUeg52VaxHBSi4wZFTOYhFp4y/AlzL4Cz36Bewum04m2hCTkKtttJ/paZVv1ZC1QEDzhsmpnkacl/e7E9p/3E93Mdicg/TLpou6S4KtQ7ALCaxV9E5EY3jHeKsCWSq8HdP+NrFasFq4F8YgSCy/FxoO9Glox8VLf0nVW/M7FppoS394r36atr2tt3541t/wTcEmQx50KEbpmRq8sa6Bp0HiWZPTJ5BwYSZxCExO2tHcc64GqCOX+o+e0Yo2aWg7Ti7mLyZTjl/FcRFNNkz/6eIwCEs0Qbb/V7CRMSfrAlq7y0xVH2jcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772792190; c=relaxed/relaxed;
	bh=CbrFa9bU212XLxnE6Ld1YOCTHoFWytuOTtuzGGl9GOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KThSiAO+pzt0LEs1kBS3PACoYHoz5S1nh1R/MoMOKcH2RYpMdYJi/fXIfrUONSnQh0nvDrTIb6WDYJqe7oAUW/X73w5BXQXK4I1HJbHHI1H2YCOQfaW08H7tCGEHFCZsHpq5qjDqYN681P15gANHK9RnonNjKao3C0RKLFI8GjvCL4zXGrv4Get785skHhaZV3ePQKmpcgUaVEDxddzmOFUEBFSJMa9qJabKU7x8NQs/z+4EbufycBmfq8/4uLlbrJF1uidp3Z2kdtaqbQf1wFxX2yYKz7xldMwKnW9YpseDTpqKwmz9fbAO+ik2o55NElZ7MzjBlXeTpxYwwD9jKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kU39nsPR; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kU39nsPR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS2PT60zCz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 21:16:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A495A40940;
	Fri,  6 Mar 2026 10:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365D2C19422;
	Fri,  6 Mar 2026 10:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772792187;
	bh=wXe+RSv0ZEZP5PzCGaEji2iLfOC9MuiizNczqfoD3ig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kU39nsPRVeuy80Xot7u6yG6vMyTyS6h997P73CrnD4Uyqpy624AKPN+ubADcvkfjP
	 a9iQwyewJuuytTvKDcC/8rOKLTG+an15rRuwx+T+iSmhFomRVzbckAYuOcC2XpFSfW
	 VJQPEroBKqE353sSdphB/CJ63WiHqv/e3xNlbCxcDuNrYeksB/HvFo1KsposSbh8Sl
	 PI28L4pG8bvlXORzyDFf9BS12DIJAg4ARA2xLpvXN7ZI6dl/T25TwCjGcuIUXAqM0S
	 xf0xFt+3UQAMKk0VL72N2I+xwG9I0cY3dWhbq9dS0zjPmHnC7FnkAFx/4kfoe9mtCY
	 hIfrH0bn+WFaA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v1 1/4] mm: move vma_kernel_pagesize() from hugetlb to mm.h
Date: Fri,  6 Mar 2026 11:15:57 +0100
Message-ID: <20260306101600.57355-2-david@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306101600.57355-1-david@kernel.org>
References: <20260306101600.57355-1-david@kernel.org>
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
X-Rspamd-Queue-Id: 1CE8321E8CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17798-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:david@kernel.org,m:dan.j.williams@intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

In the past, only hugetlb had special "vma_kernel_pagesize()"
requirements, so it provided its own implementation.

In commit 05ea88608d4e ("mm, hugetlbfs: introduce ->pagesize() to
vm_operations_struct") we generalized that approach by providing a
vm_ops->pagesize() callback to be used by device-dax.

Once device-dax started using that callback in commit c1d53b92b95c
("device-dax: implement ->pagesize() for smaps to report MMUPageSize")
it was missed that CONFIG_DEV_DAX does not depend on hugetlb support.

So building a kernel with CONFIG_DEV_DAX but without CONFIG_HUGETLBFS
would not pick up that value.

Fix it by moving vma_kernel_pagesize() to mm.h, providing only a single
implementation. While at it, improve the kerneldoc a bit.

Ideally, we'd move vma_mmu_pagesize() as well to the header. However,
its __weak symbol might be overwritten by a PPC variant in hugetlb code.
So let's leave it in there for now, as it really only matters for some
hugetlb oddities.

This was found by code inspection.

Fixes: c1d53b92b95c ("device-dax: implement ->pagesize() for smaps to report MMUPageSize")
Cc: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/linux/hugetlb.h |  7 -------
 include/linux/mm.h      | 20 ++++++++++++++++++++
 mm/hugetlb.c            | 17 -----------------
 3 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 65910437be1c..44c1848a2c21 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -777,8 +777,6 @@ static inline unsigned long huge_page_size(const struct hstate *h)
 	return (unsigned long)PAGE_SIZE << h->order;
 }
 
-extern unsigned long vma_kernel_pagesize(struct vm_area_struct *vma);
-
 extern unsigned long vma_mmu_pagesize(struct vm_area_struct *vma);
 
 static inline unsigned long huge_page_mask(struct hstate *h)
@@ -1177,11 +1175,6 @@ static inline unsigned long huge_page_mask(struct hstate *h)
 	return PAGE_MASK;
 }
 
-static inline unsigned long vma_kernel_pagesize(struct vm_area_struct *vma)
-{
-	return PAGE_SIZE;
-}
-
 static inline unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
 {
 	return PAGE_SIZE;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 44e04a42fe77..227809790f1a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1307,6 +1307,26 @@ static inline bool vma_is_shared_maywrite(const struct vm_area_struct *vma)
 	return is_shared_maywrite(&vma->flags);
 }
 
+/**
+ * vma_kernel_pagesize - Default page size granularity for this VMA.
+ * @vma: The user mapping.
+ *
+ * The kernel page size specifies in which granularity VMA modifications
+ * can be performed. Folios in this VMA will be aligned to, and at least
+ * the size of the number of bytes returned by this function.
+ *
+ * The default kernel page size is not affected by Transparent Huge Pages
+ * being in effect.
+ *
+ * Return: The default page size granularity for this VMA.
+ */
+static inline unsigned long vma_kernel_pagesize(struct vm_area_struct *vma)
+{
+	if (unlikely(vma->vm_ops && vma->vm_ops->pagesize))
+		return vma->vm_ops->pagesize(vma);
+	return PAGE_SIZE;
+}
+
 static inline
 struct vm_area_struct *vma_find(struct vma_iterator *vmi, unsigned long max)
 {
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 1d41fa3dd43e..66eadfa9e958 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1017,23 +1017,6 @@ static pgoff_t vma_hugecache_offset(struct hstate *h,
 			(vma->vm_pgoff >> huge_page_order(h));
 }
 
-/**
- * vma_kernel_pagesize - Page size granularity for this VMA.
- * @vma: The user mapping.
- *
- * Folios in this VMA will be aligned to, and at least the size of the
- * number of bytes returned by this function.
- *
- * Return: The default size of the folios allocated when backing a VMA.
- */
-unsigned long vma_kernel_pagesize(struct vm_area_struct *vma)
-{
-	if (vma->vm_ops && vma->vm_ops->pagesize)
-		return vma->vm_ops->pagesize(vma);
-	return PAGE_SIZE;
-}
-EXPORT_SYMBOL_GPL(vma_kernel_pagesize);
-
 /*
  * Return the page size being used by the MMU to back a VMA. In the majority
  * of cases, the page size used by the kernel matches the MMU size. On
-- 
2.43.0


