Return-Path: <linuxppc-dev+bounces-10804-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FDBB207BB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 13:27:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0smS56Rgz3d88;
	Mon, 11 Aug 2025 21:27:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754911624;
	cv=none; b=KfFVsTRk9bec8In4UoEXLoelOLl4MQ5HXGWzLGcAkKn2BsPPHPrGfgzA6a/CEKOeW3BfKmqOVKWRKojT1Zu1+lcSyJADwikYZAfG1rQSeCSwb7glVNCtGRd6r0uAFkOcCctAFGc1iSOz2qmwKP75KEvKRo15zAjWK5u7XBkeCwVCdmY2bezLRWb7mKLFU9dIUqQytsFyXeJNZY9+fHxHP/+RY/+gDBNnQTtihkIFxStVdAXfrAL0WCJvQ3MQryvj/1DY4dZ+M8HNA7eFMBUOsLBS6ssGDOsKvN5KYSS3TkR0bOuXFJaKQ6GmPdgSX2TrH/6/kQXROmSmGad1x3TrhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754911624; c=relaxed/relaxed;
	bh=+EOzLE+RTai94Qoe+vHWeyxEes26RRi+ewlRPXeNOJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Ti6OqvUwFD1ExOQA4stfxWxCAVKyRKTy2hLR0+CrmAWe1sWXJ4wh57HN6B7LP53avvEykcooxhIksyqEKGP3EOiIlkCH3ftbU2ONk0YZbRNGcTP41HVThUSEtHaXwQljvWnGJ8rni1T6MyIJ/NRIhTgBB6+uAh4iZqEhRXzbCn9O/gsOVOzvYxKdvO0FvuNmejCoHCmgpFcptySzU9RwoOkaVGIDBt7wAbBMaLqPswlKsM/Yqes5ZYLtMfZQhtQWrS6cDuvB8uUsdy6efmHUjx3QCIdaNipb/OfB+HN7x6slQKRNBcx78Eli/KSPxAteFNegwhgMpGAWxbdNWZ0vCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hVVP4aue; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hVVP4aue; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hVVP4aue;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hVVP4aue;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0smR5S1jz3d2c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 21:27:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EOzLE+RTai94Qoe+vHWeyxEes26RRi+ewlRPXeNOJQ=;
	b=hVVP4aueCoOS7lXCo5xbS+v7oP0xgL8ED/uuvs96r2r+XPEQFC+n58IffKorap5T7fHJrL
	yT7LMfceSSk69jDWhWbdXbLbhvjy37KEvsHbOpt9Rf07tU/+ZjPVpgjxc4Jzbn3oJs0EP/
	IeZOU8sHJGj5IluQtLXwWiamM+NW5UA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+EOzLE+RTai94Qoe+vHWeyxEes26RRi+ewlRPXeNOJQ=;
	b=hVVP4aueCoOS7lXCo5xbS+v7oP0xgL8ED/uuvs96r2r+XPEQFC+n58IffKorap5T7fHJrL
	yT7LMfceSSk69jDWhWbdXbLbhvjy37KEvsHbOpt9Rf07tU/+ZjPVpgjxc4Jzbn3oJs0EP/
	IeZOU8sHJGj5IluQtLXwWiamM+NW5UA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-Qde5_HdBPh6XLF8Igeqmcg-1; Mon, 11 Aug 2025 07:26:59 -0400
X-MC-Unique: Qde5_HdBPh6XLF8Igeqmcg-1
X-Mimecast-MFC-AGG-ID: Qde5_HdBPh6XLF8Igeqmcg_1754911618
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b90ab438b9so469405f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 04:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911618; x=1755516418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EOzLE+RTai94Qoe+vHWeyxEes26RRi+ewlRPXeNOJQ=;
        b=wZvv0LHnWE+/LoVXt9eE5bzkfNk9D1NyqLnAYS0UjTZjqQTRLeLXjQkgEF8TVK6OTK
         +QvXxPfH1TgIrDOkhzYxuSHsef8nniX5sWQ2iltcTS6bKvS6HxkMZ+ojaReLul9Qcftw
         iWFWxNl2Q8wQDwKE1ks1h29OJq/P6PPLYbpeNh0VXgrGH6Qb7+2KLVnw13nx11aOKt0I
         pFwGe7nZMyZ6uMNfHRz2FSQiNgB7slPWZYYZmaDDKwIFxZl7iIlEObi5V+1dkTmiHlRM
         XY+f4W3TcXZZswxTzZXmiDl9AR+cblmDTTEWtJEuq7BuLdi5TktskDlA/F8hm1ndF3vU
         hN+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmuREAIS60RyXO/+jqXsFzheCPmY1hHwOsOntDZqpPZA3EjuVZCJ3R0tHdI/8i2tn2dmES2B9ETxruJGs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyRP2lQfyLMig9I59ny0+lr6CYZEdI1ko7QZNPDK/ddJoHqUSps
	rNmSxrTwzoa17JfairMizYQ15IqZHQl0g6OsYcLa46c4hfnwEltCySjB9F9ZZwb6hht8diV/Rzk
	PoUEjrSAlBcFOkiO2bNDLZV3MzvgH0j+2+9nHHGnp4OeN82JTg0G0o2lX8Yxt5R+wmXU=
X-Gm-Gg: ASbGnctmzj3B1PYjowuPWt2kkBPrAKJs4iEA8/iQgjTlvAl5Gbm06UgLoLMkBi1gUP6
	Fih6t7ieQNoFZz1VOi6uMOM1qIu11wU7g82oMzFswfeIHafc0BWvc9jzVWBICco/nCMr1jFh3wx
	3+oyiFfhDOQIu5Na/t4rA42rg01wX1dYE4vLXzq9kDXZPR5lzcT3aT+ULhFMkqsJYo5y42SIoXP
	HbM5KnvODyG1dO5N6BrydVp5BYX2s7bZinlQpUNb6EMhVN6nH6ioNn6XxMD1MjHiqRbDlh7qyJu
	a7dzfL/zPOWWzzTVwTQa2yDP2+LvzJSXiEzc+jflirkmO4W0IuhAgSdl7/i2qqRL42/8thC5Wjy
	8nqHeaBSUrkSksXQ6Mn9bMbQw
X-Received: by 2002:a05:6000:40da:b0:3b7:9d87:97c6 with SMTP id ffacd0b85a97d-3b900b552ccmr11182502f8f.44.1754911617675;
        Mon, 11 Aug 2025 04:26:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgzaZVe/bWq5ilsSm3I+nGmnBoU4tOWHlsDn35ubDMQPCamCfdsJ8Ebz2VnZDz+OwT7Da1fQ==
X-Received: by 2002:a05:6000:40da:b0:3b7:9d87:97c6 with SMTP id ffacd0b85a97d-3b900b552ccmr11182439f8f.44.1754911617130;
        Mon, 11 Aug 2025 04:26:57 -0700 (PDT)
Received: from localhost (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de. [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c453d6esm40173200f8f.37.2025.08.11.04.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:26:56 -0700 (PDT)
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
Subject: [PATCH v3 09/11] mm/memory: factor out common code from vm_normal_page_*()
Date: Mon, 11 Aug 2025 13:26:29 +0200
Message-ID: <20250811112631.759341-10-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: aYwBz7DIPeCbxLGyKqVTVi8aXYgnTzkcNMjFscomu7Y_1754911618
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's reduce the code duplication and factor out the non-pte/pmd related
magic into __vm_normal_page().

To keep it simpler, check the pfn against both zero folios, which
shouldn't really make a difference.

It's a good question if we can even hit the !CONFIG_ARCH_HAS_PTE_SPECIAL
scenario in the PMD case in practice: but doesn't really matter, as
it's now all unified in vm_normal_page_pfn().

Add kerneldoc for all involved functions.

Note that, as a side product, we now:
* Support the find_special_page special thingy also for PMD
* Don't check for is_huge_zero_pfn() anymore if we have
  CONFIG_ARCH_HAS_PTE_SPECIAL and the PMD is not special. The
  VM_WARN_ON_ONCE would catch any abuse

No functional change intended.

Reviewed-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 186 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 109 insertions(+), 77 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index dc0107354d37b..78af3f243cee7 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -614,8 +614,14 @@ static void print_bad_page_map(struct vm_area_struct *vma,
 #define print_bad_pte(vma, addr, pte, page) \
 	print_bad_page_map(vma, addr, pte_val(pte), page, PGTABLE_LEVEL_PTE)
 
-/*
- * vm_normal_page -- This function gets the "struct page" associated with a pte.
+/**
+ * __vm_normal_page() - Get the "struct page" associated with a page table entry.
+ * @vma: The VMA mapping the page table entry.
+ * @addr: The address where the page table entry is mapped.
+ * @pfn: The PFN stored in the page table entry.
+ * @special: Whether the page table entry is marked "special".
+ * @level: The page table level for error reporting purposes only.
+ * @entry: The page table entry value for error reporting purposes only.
  *
  * "Special" mappings do not wish to be associated with a "struct page" (either
  * it doesn't exist, or it exists but they don't want to touch it). In this
@@ -628,10 +634,10 @@ static void print_bad_page_map(struct vm_area_struct *vma,
  * Selected page table walkers (such as GUP) can still identify mappings of the
  * shared zero folios and work with the underlying "struct page".
  *
- * There are 2 broad cases. Firstly, an architecture may define a pte_special()
- * pte bit, in which case this function is trivial. Secondly, an architecture
- * may not have a spare pte bit, which requires a more complicated scheme,
- * described below.
+ * There are 2 broad cases. Firstly, an architecture may define a "special"
+ * page table entry bit, such as pte_special(), in which case this function is
+ * trivial. Secondly, an architecture may not have a spare page table
+ * entry bit, which requires a more complicated scheme, described below.
  *
  * A raw VM_PFNMAP mapping (ie. one that is not COWed) is always considered a
  * special mapping (even if there are underlying and valid "struct pages").
@@ -664,63 +670,94 @@ static void print_bad_page_map(struct vm_area_struct *vma,
  * don't have to follow the strict linearity rule of PFNMAP mappings in
  * order to support COWable mappings.
  *
+ * Return: Returns the "struct page" if this is a "normal" mapping. Returns
+ *	   NULL if this is a "special" mapping.
  */
-struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
-			    pte_t pte)
+static inline struct page *__vm_normal_page(struct vm_area_struct *vma,
+		unsigned long addr, unsigned long pfn, bool special,
+		unsigned long long entry, enum pgtable_level level)
 {
-	unsigned long pfn = pte_pfn(pte);
-
 	if (IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL)) {
-		if (likely(!pte_special(pte)))
-			goto check_pfn;
-		if (vma->vm_ops && vma->vm_ops->find_special_page)
-			return vma->vm_ops->find_special_page(vma, addr);
-		if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
-			return NULL;
-		if (is_zero_pfn(pfn))
-			return NULL;
-
-		print_bad_pte(vma, addr, pte, NULL);
-		return NULL;
-	}
-
-	/* !CONFIG_ARCH_HAS_PTE_SPECIAL case follows: */
-
-	if (unlikely(vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP))) {
-		if (vma->vm_flags & VM_MIXEDMAP) {
-			if (!pfn_valid(pfn))
+		if (unlikely(special)) {
+			if (vma->vm_ops && vma->vm_ops->find_special_page)
+				return vma->vm_ops->find_special_page(vma, addr);
+			if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
 				return NULL;
-			if (is_zero_pfn(pfn))
-				return NULL;
-			goto out;
-		} else {
-			unsigned long off;
-			off = (addr - vma->vm_start) >> PAGE_SHIFT;
-			if (pfn == vma->vm_pgoff + off)
-				return NULL;
-			if (!is_cow_mapping(vma->vm_flags))
+			if (is_zero_pfn(pfn) || is_huge_zero_pfn(pfn))
 				return NULL;
+
+			print_bad_page_map(vma, addr, entry, NULL, level);
+			return NULL;
 		}
-	}
+		/*
+		 * With CONFIG_ARCH_HAS_PTE_SPECIAL, any special page table
+		 * mappings (incl. shared zero folios) are marked accordingly.
+		 */
+	} else {
+		if (unlikely(vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))) {
+			if (vma->vm_flags & VM_MIXEDMAP) {
+				/* If it has a "struct page", it's "normal". */
+				if (!pfn_valid(pfn))
+					return NULL;
+			} else {
+				unsigned long off = (addr - vma->vm_start) >> PAGE_SHIFT;
 
-	if (is_zero_pfn(pfn))
-		return NULL;
+				/* Only CoW'ed anon folios are "normal". */
+				if (pfn == vma->vm_pgoff + off)
+					return NULL;
+				if (!is_cow_mapping(vma->vm_flags))
+					return NULL;
+			}
+		}
+
+		if (is_zero_pfn(pfn) || is_huge_zero_pfn(pfn))
+			return NULL;
+	}
 
-check_pfn:
 	if (unlikely(pfn > highest_memmap_pfn)) {
-		print_bad_pte(vma, addr, pte, NULL);
+		/* Corrupted page table entry. */
+		print_bad_page_map(vma, addr, entry, NULL, level);
 		return NULL;
 	}
-
 	/*
 	 * NOTE! We still have PageReserved() pages in the page tables.
-	 * eg. VDSO mappings can cause them to exist.
+	 * For example, VDSO mappings can cause them to exist.
 	 */
-out:
-	VM_WARN_ON_ONCE(is_zero_pfn(pfn));
+	VM_WARN_ON_ONCE(is_zero_pfn(pfn) || is_huge_zero_pfn(pfn));
 	return pfn_to_page(pfn);
 }
 
+/**
+ * vm_normal_page() - Get the "struct page" associated with a PTE
+ * @vma: The VMA mapping the @pte.
+ * @addr: The address where the @pte is mapped.
+ * @pte: The PTE.
+ *
+ * Get the "struct page" associated with a PTE. See __vm_normal_page()
+ * for details on "normal" and "special" mappings.
+ *
+ * Return: Returns the "struct page" if this is a "normal" mapping. Returns
+ *	   NULL if this is a "special" mapping.
+ */
+struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
+			    pte_t pte)
+{
+	return __vm_normal_page(vma, addr, pte_pfn(pte), pte_special(pte),
+				pte_val(pte), PGTABLE_LEVEL_PTE);
+}
+
+/**
+ * vm_normal_folio() - Get the "struct folio" associated with a PTE
+ * @vma: The VMA mapping the @pte.
+ * @addr: The address where the @pte is mapped.
+ * @pte: The PTE.
+ *
+ * Get the "struct folio" associated with a PTE. See __vm_normal_page()
+ * for details on "normal" and "special" mappings.
+ *
+ * Return: Returns the "struct folio" if this is a "normal" mapping. Returns
+ *	   NULL if this is a "special" mapping.
+ */
 struct folio *vm_normal_folio(struct vm_area_struct *vma, unsigned long addr,
 			    pte_t pte)
 {
@@ -732,42 +769,37 @@ struct folio *vm_normal_folio(struct vm_area_struct *vma, unsigned long addr,
 }
 
 #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
+/**
+ * vm_normal_page_pmd() - Get the "struct page" associated with a PMD
+ * @vma: The VMA mapping the @pmd.
+ * @addr: The address where the @pmd is mapped.
+ * @pmd: The PMD.
+ *
+ * Get the "struct page" associated with a PTE. See __vm_normal_page()
+ * for details on "normal" and "special" mappings.
+ *
+ * Return: Returns the "struct page" if this is a "normal" mapping. Returns
+ *	   NULL if this is a "special" mapping.
+ */
 struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 				pmd_t pmd)
 {
-	unsigned long pfn = pmd_pfn(pmd);
-
-	if (unlikely(pmd_special(pmd)))
-		return NULL;
-
-	if (unlikely(vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP))) {
-		if (vma->vm_flags & VM_MIXEDMAP) {
-			if (!pfn_valid(pfn))
-				return NULL;
-			goto out;
-		} else {
-			unsigned long off;
-			off = (addr - vma->vm_start) >> PAGE_SHIFT;
-			if (pfn == vma->vm_pgoff + off)
-				return NULL;
-			if (!is_cow_mapping(vma->vm_flags))
-				return NULL;
-		}
-	}
-
-	if (is_huge_zero_pfn(pfn))
-		return NULL;
-	if (unlikely(pfn > highest_memmap_pfn))
-		return NULL;
-
-	/*
-	 * NOTE! We still have PageReserved() pages in the page tables.
-	 * eg. VDSO mappings can cause them to exist.
-	 */
-out:
-	return pfn_to_page(pfn);
+	return __vm_normal_page(vma, addr, pmd_pfn(pmd), pmd_special(pmd),
+				pmd_val(pmd), PGTABLE_LEVEL_PMD);
 }
 
+/**
+ * vm_normal_folio_pmd() - Get the "struct folio" associated with a PMD
+ * @vma: The VMA mapping the @pmd.
+ * @addr: The address where the @pmd is mapped.
+ * @pmd: The PMD.
+ *
+ * Get the "struct folio" associated with a PTE. See __vm_normal_page()
+ * for details on "normal" and "special" mappings.
+ *
+ * Return: Returns the "struct folio" if this is a "normal" mapping. Returns
+ *	   NULL if this is a "special" mapping.
+ */
 struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
 				  unsigned long addr, pmd_t pmd)
 {
-- 
2.50.1


