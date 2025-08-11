Return-Path: <linuxppc-dev+bounces-10800-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA6AB207AF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 13:27:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0smG0x57z3d24;
	Mon, 11 Aug 2025 21:26:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754911614;
	cv=none; b=kbY6JQlWnPaB4LC1TQ2WIugwyk57/E82pssMT//WQ16DUwIgIo4rxio1VC1FuxHpnF+kQaVorQXhHulGGcT6OaBy7BDOi8MdIjTfcZcMF8kQWJtQQM8jD4YncAOhqbM7YmmeR25zkYcbRr7bGpHO9Sowc3M+xDKydOgCA5XArh2WCyEZHQLSXflD9r9OByqeDjy4H/Cj7Hl7BbUn0Htn1LHi3QVDEskUbAtVTvnspgBVSal4PNc6xjFJlCKGhTqmYiHPnYcd2tZjcKY+A32nSjllX30kDov61ljN8oeG9Ipg4KMmmftonKcuqm2oYhdTJ7Q+6PMfRBKXrhrAx6bdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754911614; c=relaxed/relaxed;
	bh=DNeO4mnK34t1j+RunD3+GtheXBl5F9uGzS1IAgGiaS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=M+nkHI80m+4BxNEM+MpPSF/OOl/cj4RcZ1zRVLH6UtAYn1iefMNSBfOLl1VOwcHaAejn1qo31Kl0ru/nDkYWPJ3E40wsJg/cMn4nBPgm7Fu68Ug0PPAF80mOlatR+RPgz2TTgcE90YSd0xjR1I6RWJZOqL5YU2ds/9s4DtrNTuwQ7YSdhqxOTXAfYe1+o0OqN4XTJQr725ukTM0+HwDZXrBhuXuHOtHdGerFBbueaKxCw5YEft9hJfMyzaRFsbR4qNPGe4FVNgyNjeG469wB/iOOvRpOeFdOYS0Pl9RWtbHDFpTYiHxvP11USQwwUOUBLVWTokLTqxPqtB+K5cHIgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pt5Q9C49; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pt5Q9C49; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pt5Q9C49;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pt5Q9C49;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0smF2SXDz3cp1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 21:26:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DNeO4mnK34t1j+RunD3+GtheXBl5F9uGzS1IAgGiaS8=;
	b=Pt5Q9C49U0MA2RSk9HKbRM8Qj/VtWDWDUkjRRhWmCh7hzKi00By8B7MrmJp3usNiWDbtun
	BAVsihozI0YFiYUZAAoy3CjdDK4S39RsTGNdp2Vxm4EZd7J9Nb3xQaEH9LmCCiXwAXIjE0
	dWs64th2nV0epC/0zXScEQG+ZMBYhmQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DNeO4mnK34t1j+RunD3+GtheXBl5F9uGzS1IAgGiaS8=;
	b=Pt5Q9C49U0MA2RSk9HKbRM8Qj/VtWDWDUkjRRhWmCh7hzKi00By8B7MrmJp3usNiWDbtun
	BAVsihozI0YFiYUZAAoy3CjdDK4S39RsTGNdp2Vxm4EZd7J9Nb3xQaEH9LmCCiXwAXIjE0
	dWs64th2nV0epC/0zXScEQG+ZMBYhmQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-4JNEYsywPHWOoYNT2YIIxQ-1; Mon, 11 Aug 2025 07:26:48 -0400
X-MC-Unique: 4JNEYsywPHWOoYNT2YIIxQ-1
X-Mimecast-MFC-AGG-ID: 4JNEYsywPHWOoYNT2YIIxQ_1754911608
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45359bfe631so21791965e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 04:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911607; x=1755516407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNeO4mnK34t1j+RunD3+GtheXBl5F9uGzS1IAgGiaS8=;
        b=aXLzJX6fjIEK8rih0IBEzs0lHFcXW8w7QYKKo7ZqjfCclwgxTxDS1UJQVFFNIcUoWn
         dOa0xJQ2s/NGmbfizNPgYwb1bkedad3W36OFzwcID6DUXYGryYoac1lKC0g6ewaluWEr
         La5oHr8aYwd3EOQVzQmzG0cNXH5vbf0et78v4oul8xy1SWjajKSvJsb1Cq5I6dYrdNrc
         r+BjBmKSwLUusg9W6PxTDkVYRoNk0MLgnpMAd/uKYwceDIrP/GO+N7Xy00jt6o17JCrJ
         vUS99OiE626HnHTXrnTB3fGvAfjWYbE4sjgQDiNWJm4+vYPGkkKC2rfGsVyH6ma+m7EU
         +W+A==
X-Forwarded-Encrypted: i=1; AJvYcCW3lwUWOKBtjW08JkTKFR5RLuahHxy8lQ/XJLL0Hul+HjvXFjv8UfmmapvXeW2YG5E/2JS8XvFk48OZRYc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzzlT6oL2jPc2uVR5uEuXBw6voa/gLJqj0Fm2587UwjCJtrS1DN
	37Vz0fxoK4rGT6DVUnwv9atQhTOmL5z5PD8vRyDO6u2hZ7sPqoSgO/Q7dZdwkEeK2FfcLTG3Hfi
	BNC8tMUgPiW9TXN05tHGL08AQk8c4X7Sn8tMrXwwzbHKw+A7AZN2Ez3MpDJRD+07tO74=
X-Gm-Gg: ASbGncumvtYOje/e00m/C1GyfaR22+JEIV+TYjDvUMpzYh8p1r2CDYpECHUCxOY7lvg
	GaixFTtZTQICNFy417MGNV8YluQ0DlwxOI7M+b3dngtrliSya16IIETu+DsyXhzJPq2iuKqnbNX
	a79dLEWujSmBIasqt8WEwxCEOXwFgR/QPCJ0lS/JQbXzMAsz+1q1ZTcAGeZ1nlcma3ck1Q5R9eq
	81GOBF9ifIWRr8OqWFk7vBxpeSOh2QRSJwIhthErCUxyc8/qjeAHXF3sURJsZ83XO+2mYoBDBHk
	7IP6WzuQwotzovXC5iVPOrQ0KnAhrtR/av3AimwVRcrGxXGl1q7IW97AuVhKWzUdeQNzT1hOIVs
	vvWL/WfenitQkkIwttrxRV97Q
X-Received: by 2002:a05:600c:4746:b0:453:23fe:ca86 with SMTP id 5b1f17b1804b1-459f4ea0f2dmr115559555e9.4.1754911607425;
        Mon, 11 Aug 2025 04:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+SYBbVCDa86Al3Rw//iuzbWoSgvjLT8uLZDTY5p6isO9HqDz+nOTt8CKLJXWJJ2UJD3ft4A==
X-Received: by 2002:a05:600c:4746:b0:453:23fe:ca86 with SMTP id 5b1f17b1804b1-459f4ea0f2dmr115559215e9.4.1754911607000;
        Mon, 11 Aug 2025 04:26:47 -0700 (PDT)
Received: from localhost (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de. [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459e6214640sm259832575e9.1.2025.08.11.04.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:26:46 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Hugh Dickins <hughd@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v3 05/11] mm/huge_memory: mark PMD mappings of the huge zero folio special
Date: Mon, 11 Aug 2025 13:26:25 +0200
Message-ID: <20250811112631.759341-6-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811112631.759341-1-david@redhat.com>
References: <20250811112631.759341-1-david@redhat.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SDU-1iFEHvEclfuNCvQ9C5ZxQxoOeSCbn4uUR35h2Ug_1754911608
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The huge zero folio is refcounted (+mapcounted -- is that a word?)
differently than "normal" folios, similarly (but different) to the ordinary
shared zeropage.

For this reason, we special-case these pages in
vm_normal_page*/vm_normal_folio*, and only allow selected callers to
still use them (e.g., GUP can still take a reference on them).

vm_normal_page_pmd() already filters out the huge zero folio, to
indicate it a special (return NULL). However, so far we are not making
use of pmd_special() on architectures that support it
(CONFIG_ARCH_HAS_PTE_SPECIAL), like we would with the ordinary shared
zeropage.

Let's mark PMD mappings of the huge zero folio similarly as special, so we
can avoid the manual check for the huge zero folio with
CONFIG_ARCH_HAS_PTE_SPECIAL next, and only perform the check on
!CONFIG_ARCH_HAS_PTE_SPECIAL.

In copy_huge_pmd(), where we have a manual pmd_special() check to handle
PFNMAP, we have to manually rule out the huge zero folio. That code
needs a serious cleanup, but that's something for another day.

While at it, update the doc regarding the shared zero folios.

No functional change intended: vm_normal_page_pmd() still returns NULL
when it encounters the huge zero folio.

Reviewed-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c |  8 ++++++--
 mm/memory.c      | 15 ++++++++++-----
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index ec89e0607424e..58bac83e7fa31 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1309,6 +1309,7 @@ static void set_huge_zero_folio(pgtable_t pgtable, struct mm_struct *mm,
 {
 	pmd_t entry;
 	entry = folio_mk_pmd(zero_folio, vma->vm_page_prot);
+	entry = pmd_mkspecial(entry);
 	pgtable_trans_huge_deposit(mm, pmd, pgtable);
 	set_pmd_at(mm, haddr, pmd, entry);
 	mm_inc_nr_ptes(mm);
@@ -1418,7 +1419,9 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 	if (fop.is_folio) {
 		entry = folio_mk_pmd(fop.folio, vma->vm_page_prot);
 
-		if (!is_huge_zero_folio(fop.folio)) {
+		if (is_huge_zero_folio(fop.folio)) {
+			entry = pmd_mkspecial(entry);
+		} else {
 			folio_get(fop.folio);
 			folio_add_file_rmap_pmd(fop.folio, &fop.folio->page, vma);
 			add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
@@ -1643,7 +1646,8 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 	int ret = -ENOMEM;
 
 	pmd = pmdp_get_lockless(src_pmd);
-	if (unlikely(pmd_present(pmd) && pmd_special(pmd))) {
+	if (unlikely(pmd_present(pmd) && pmd_special(pmd) &&
+		     !is_huge_zero_pmd(pmd))) {
 		dst_ptl = pmd_lock(dst_mm, dst_pmd);
 		src_ptl = pmd_lockptr(src_mm, src_pmd);
 		spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
diff --git a/mm/memory.c b/mm/memory.c
index 0ba4f6b718471..626caedce35e0 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -555,7 +555,14 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
  *
  * "Special" mappings do not wish to be associated with a "struct page" (either
  * it doesn't exist, or it exists but they don't want to touch it). In this
- * case, NULL is returned here. "Normal" mappings do have a struct page.
+ * case, NULL is returned here. "Normal" mappings do have a struct page and
+ * are ordinarily refcounted.
+ *
+ * Page mappings of the shared zero folios are always considered "special", as
+ * they are not ordinarily refcounted: neither the refcount nor the mapcount
+ * of these folios is adjusted when mapping them into user page tables.
+ * Selected page table walkers (such as GUP) can still identify mappings of the
+ * shared zero folios and work with the underlying "struct page".
  *
  * There are 2 broad cases. Firstly, an architecture may define a pte_special()
  * pte bit, in which case this function is trivial. Secondly, an architecture
@@ -585,9 +592,8 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
  *
  * VM_MIXEDMAP mappings can likewise contain memory with or without "struct
  * page" backing, however the difference is that _all_ pages with a struct
- * page (that is, those where pfn_valid is true) are refcounted and considered
- * normal pages by the VM. The only exception are zeropages, which are
- * *never* refcounted.
+ * page (that is, those where pfn_valid is true, except the shared zero
+ * folios) are refcounted and considered normal pages by the VM.
  *
  * The disadvantage is that pages are refcounted (which can be slower and
  * simply not an option for some PFNMAP users). The advantage is that we
@@ -667,7 +673,6 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 {
 	unsigned long pfn = pmd_pfn(pmd);
 
-	/* Currently it's only used for huge pfnmaps */
 	if (unlikely(pmd_special(pmd)))
 		return NULL;
 
-- 
2.50.1


