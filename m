Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3C364460A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 15:49:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRNbG54tBz3bgR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 01:48:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M7g4hFCn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M7g4hFCn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M7g4hFCn;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M7g4hFCn;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRNZL0NHyz2yxQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 01:48:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670338087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/J/bI9dhyjQ/usSRNhI5biIirU1QHLlTc54Jeh9AEr0=;
	b=M7g4hFCnth3RIcNBBKeS8fcAGHHkW4q14jgjS0XzyVavv56h4gX6dnlIJPi1CjVxUOcnTP
	rr1Vw5jTA+qIojfFsLgOY/N4m4rPyEbSYnn4s35GTQAgjqP+eXoiJSDH/pwXMSxyP2Cbvo
	fVedjS5ObNbzQrRqPrRgedQfKkaWLWA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670338087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/J/bI9dhyjQ/usSRNhI5biIirU1QHLlTc54Jeh9AEr0=;
	b=M7g4hFCnth3RIcNBBKeS8fcAGHHkW4q14jgjS0XzyVavv56h4gX6dnlIJPi1CjVxUOcnTP
	rr1Vw5jTA+qIojfFsLgOY/N4m4rPyEbSYnn4s35GTQAgjqP+eXoiJSDH/pwXMSxyP2Cbvo
	fVedjS5ObNbzQrRqPrRgedQfKkaWLWA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-8CVFD73pPtiuCMFV0N15hg-1; Tue, 06 Dec 2022 09:48:01 -0500
X-MC-Unique: 8CVFD73pPtiuCMFV0N15hg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E4EA38164C3;
	Tue,  6 Dec 2022 14:48:00 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A3F6492B04;
	Tue,  6 Dec 2022 14:47:54 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable RFC 01/26] mm/debug_vm_pgtable: more pte_swp_exclusive() sanity checks
Date: Tue,  6 Dec 2022 15:47:05 +0100
Message-Id: <20221206144730.163732-2-david@redhat.com>
In-Reply-To: <20221206144730.163732-1-david@redhat.com>
References: <20221206144730.163732-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>, David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We want to implement __HAVE_ARCH_PTE_SWP_EXCLUSIVE on all architectures.
Let's extend our sanity checks, especially testing that our PTE bit
does not affect:
* is_swap_pte() -> pte_present() and pte_none()
* the swap entry + type
* pte_swp_soft_dirty()

Especially, the pfn_pte() is dodgy when the swap PTE layout differs
heavily from ordinary PTEs. Let's properly construct a swap PTE from
swap type+offset.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/debug_vm_pgtable.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index c631ade3f1d2..0506622016d9 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -807,13 +807,34 @@ static void __init pmd_swap_soft_dirty_tests(struct pgtable_debug_args *args) {
 static void __init pte_swap_exclusive_tests(struct pgtable_debug_args *args)
 {
 #ifdef __HAVE_ARCH_PTE_SWP_EXCLUSIVE
-	pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
+	unsigned long max_swapfile_size = generic_max_swapfile_size();
+	swp_entry_t entry, entry2;
+	pte_t pte;
 
 	pr_debug("Validating PTE swap exclusive\n");
+
+	/* Create a swp entry with all possible bits set */
+	entry = swp_entry((1 << MAX_SWAPFILES_SHIFT) - 1,
+			  max_swapfile_size - 1);
+
+	pte = swp_entry_to_pte(entry);
+	WARN_ON(pte_swp_exclusive(pte));
+	WARN_ON(!is_swap_pte(pte));
+	entry2 = pte_to_swp_entry(pte);
+	WARN_ON(memcmp(&entry, &entry2, sizeof(entry)));
+
 	pte = pte_swp_mkexclusive(pte);
 	WARN_ON(!pte_swp_exclusive(pte));
+	WARN_ON(!is_swap_pte(pte));
+	WARN_ON(pte_swp_soft_dirty(pte));
+	entry2 = pte_to_swp_entry(pte);
+	WARN_ON(memcmp(&entry, &entry2, sizeof(entry)));
+
 	pte = pte_swp_clear_exclusive(pte);
 	WARN_ON(pte_swp_exclusive(pte));
+	WARN_ON(!is_swap_pte(pte));
+	entry2 = pte_to_swp_entry(pte);
+	WARN_ON(memcmp(&entry, &entry2, sizeof(entry)));
 #endif /* __HAVE_ARCH_PTE_SWP_EXCLUSIVE */
 }
 
-- 
2.38.1

