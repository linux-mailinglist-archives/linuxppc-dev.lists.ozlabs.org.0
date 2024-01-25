Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5BA83CC3B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 20:34:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S62N9o3p;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S62N9o3p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLWGt5jPTz3cYK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 06:34:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S62N9o3p;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S62N9o3p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLWFF1LN3z30MD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 06:32:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706211166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=82AmjG/O5udPRimJWVv8/kqN5WdZj3aSPBj/SjaK3u4=;
	b=S62N9o3pikqaOBOr/Na222g/JLhRYzYPiVMP+GcGw6L5Cw+hxQKUNYHyADo1J0B1+Q2tuQ
	fknCq8WPzEc2dr1SixRCqay7iR2SzNlYPgm8Ryqy8AmWCRvCXCN2U80kjouxo7N3jC1vpX
	si9JTBm/ktie7CrlHIBsvGtCGZfVBEM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706211166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=82AmjG/O5udPRimJWVv8/kqN5WdZj3aSPBj/SjaK3u4=;
	b=S62N9o3pikqaOBOr/Na222g/JLhRYzYPiVMP+GcGw6L5Cw+hxQKUNYHyADo1J0B1+Q2tuQ
	fknCq8WPzEc2dr1SixRCqay7iR2SzNlYPgm8Ryqy8AmWCRvCXCN2U80kjouxo7N3jC1vpX
	si9JTBm/ktie7CrlHIBsvGtCGZfVBEM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-J0yUPAt0OCGNPncPGz6sEA-1; Thu, 25 Jan 2024 14:32:42 -0500
X-MC-Unique: J0yUPAt0OCGNPncPGz6sEA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFA1F8432A6;
	Thu, 25 Jan 2024 19:32:40 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.193.154])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 81D45492BC6;
	Thu, 25 Jan 2024 19:32:35 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/15] arm64/mm: Make set_ptes() robust when OAs cross 48-bit boundary
Date: Thu, 25 Jan 2024 20:32:13 +0100
Message-ID: <20240125193227.444072-2-david@redhat.com>
In-Reply-To: <20240125193227.444072-1-david@redhat.com>
References: <20240125193227.444072-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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
Cc: David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" 
 <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ryan Roberts <ryan.roberts@arm.com>

Since the high bits [51:48] of an OA are not stored contiguously in the
PTE, there is a theoretical bug in set_ptes(), which just adds PAGE_SIZE
to the pte to get the pte with the next pfn. This works until the pfn
crosses the 48-bit boundary, at which point we overflow into the upper
attributes.

Of course one could argue (and Matthew Wilcox has :) that we will never
see a folio cross this boundary because we only allow naturally aligned
power-of-2 allocation, so this would require a half-petabyte folio. So
its only a theoretical bug. But its better that the code is robust
regardless.

I've implemented pte_next_pfn() as part of the fix, which is an opt-in
core-mm interface. So that is now available to the core-mm, which will
be needed shortly to support forthcoming fork()-batching optimizations.

Link: https://lkml.kernel.org/r/20240125173534.1659317-1-ryan.roberts@arm.com
Fixes: 4a169d61c2ed ("arm64: implement the new page table range API")
Closes: https://lore.kernel.org/linux-mm/fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com/
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/arm64/include/asm/pgtable.h | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 79ce70fbb751c..52d0b0a763f16 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -341,6 +341,22 @@ static inline void __sync_cache_and_tags(pte_t pte, unsigned int nr_pages)
 		mte_sync_tags(pte, nr_pages);
 }
 
+/*
+ * Select all bits except the pfn
+ */
+static inline pgprot_t pte_pgprot(pte_t pte)
+{
+	unsigned long pfn = pte_pfn(pte);
+
+	return __pgprot(pte_val(pfn_pte(pfn, __pgprot(0))) ^ pte_val(pte));
+}
+
+#define pte_next_pfn pte_next_pfn
+static inline pte_t pte_next_pfn(pte_t pte)
+{
+	return pfn_pte(pte_pfn(pte) + 1, pte_pgprot(pte));
+}
+
 static inline void set_ptes(struct mm_struct *mm,
 			    unsigned long __always_unused addr,
 			    pte_t *ptep, pte_t pte, unsigned int nr)
@@ -354,7 +370,7 @@ static inline void set_ptes(struct mm_struct *mm,
 		if (--nr == 0)
 			break;
 		ptep++;
-		pte_val(pte) += PAGE_SIZE;
+		pte = pte_next_pfn(pte);
 	}
 }
 #define set_ptes set_ptes
@@ -433,16 +449,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 	return clear_pte_bit(pte, __pgprot(PTE_SWP_EXCLUSIVE));
 }
 
-/*
- * Select all bits except the pfn
- */
-static inline pgprot_t pte_pgprot(pte_t pte)
-{
-	unsigned long pfn = pte_pfn(pte);
-
-	return __pgprot(pte_val(pfn_pte(pfn, __pgprot(0))) ^ pte_val(pte));
-}
-
 #ifdef CONFIG_NUMA_BALANCING
 /*
  * See the comment in include/linux/pgtable.h
-- 
2.43.0

