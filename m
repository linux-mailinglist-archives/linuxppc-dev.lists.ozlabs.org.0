Return-Path: <linuxppc-dev+bounces-10805-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74704B207BD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 13:28:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0smT60VFz3d8F;
	Mon, 11 Aug 2025 21:27:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754911625;
	cv=none; b=fuvyPlY1V1bcmF67BoChuKHdIFMdnoAbt2kACMZnHLmQQ8rBZOh2oobJ2U+c8GbTWRBU5ybmLbHqt9mQZNHP/hp5uoKdKGjQe77CoyCzwPS38C7ZogJrMcI8QF7xmXYbfOM4GX1ZzTOtSY18rQQMfgHylunPNFf2/IwmkM921TnbhUkWNyasVWdKdbDgdIxAWWccd6cauuGVJnyol924wHqpSKOq1kHbV270x/bnJ6m5ARpM+A3C+2ldbRWcT1bANsKeISNUygyCWpZKGRA6Z4kdBbWcWLTCiNDIF5E850Y3h6tf40ZSmgT70eTY8vTzZDZb2m19uOa8eEVIHH3h1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754911625; c=relaxed/relaxed;
	bh=DfX1fQMnvUejv+2+JWwebv5CirI4aCq8/b8BncrLfY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Ef4NJQj/fwr2Y8beuI8K9J2AVLQHUK3kqMeFcJ3MdWeaKxn7mgcRCS5o7kX1v36zzkvgsZhfBnXT4fFHTM6rB7b8NDvcEvyVdLNpEDLFQe+YL4ZMRRNShHpCG8K6sgYeE2pz7DH2VAfpjld5M/rBpsBeExLEcMsbE1YtlJ3vCffxXfa743kBPYNFBdfwewAWYO076YNmZ0f+EXTRGuo3TIcBoiEzh1Y2SFHnqDhgx6P75l8vu5xO6IY00xRXE1YwLAusxlHbwFCIbosvgdXBq29fALaQdpm0nt0NexelCJIGvy3uX3KQIMdn6I5L4cx5XAPHTIlGoS+j43jLWyiGYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M/Jia8yl; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CxTuQZwf; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M/Jia8yl;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CxTuQZwf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0smT1Jk9z3d2c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 21:27:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DfX1fQMnvUejv+2+JWwebv5CirI4aCq8/b8BncrLfY4=;
	b=M/Jia8ylEwFnEJIKIYmljTKYo6R6xqrWqn7X4qPa7gz2cUI61e6gR5b/lj8ZsoHg25RODd
	7L/Bk+QO9Vk4qZFIlTdOl5Su7iT7lyFRpqmDRGuSznrNiln0F0y1SakoWlmwOXtsRQLwKm
	Vi2RIdft5S16EXXPZ1No4hLtFCTYXQA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DfX1fQMnvUejv+2+JWwebv5CirI4aCq8/b8BncrLfY4=;
	b=CxTuQZwffcoPFUShD7Ep+f2OWf6PfzuUl5X4vprn4U28q8DAomhO95kAo0FbbECQHomVD/
	q2kqqmh03tbPzK+jz5f0OiL4xiNZPpFpsWo0OY2zPqpjDDNRcHWyCdXajoILEI8jhslJLn
	2MzcNKZ4jOjzKbRWeNDrwfL6ikoLEyg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-5OZ9R6U5M2S2QWavav471g-1; Mon, 11 Aug 2025 07:27:01 -0400
X-MC-Unique: 5OZ9R6U5M2S2QWavav471g-1
X-Mimecast-MFC-AGG-ID: 5OZ9R6U5M2S2QWavav471g_1754911620
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-458bb0e68c6so26522365e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 04:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911620; x=1755516420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfX1fQMnvUejv+2+JWwebv5CirI4aCq8/b8BncrLfY4=;
        b=LhbngOCbt9VMBQ9qbb7h9LvKhENKV0hzVjc4yc3foD+VgtJyeJXW33XocR+SrZ92L3
         cawi+Gx9+t6zoMea/HOEiuxGYljAz1sEfJB3JD+/gz8pSoS8TqmWM2l9OK8+OBu0Qb3E
         DKfWC04DjwLqwXy9PwvmWnFTNHlXiO4DY9oOM0NHCktC1RpwK0p0KJ2fMXrIio9+nOBm
         rVZj16C4TQBXMPrx9XkCXh5maAiUxlD1CAyraHKiFZ9DRmpoGy0nsfkXNgKcpXQbNhub
         rSxxYBMreSGYkNQg4D9eE0lkoIlozg4u2BBhOsSNwKkafdF/IYd+yLw3/1RjUhPfx2up
         ttDA==
X-Forwarded-Encrypted: i=1; AJvYcCX4S8htSy+H2vWNnAqOQw2HSzPGB8DTTsVPqLOTQLCFb0qilaDcKwUfUXjxbi8l2Xqe5RkEneZnivzpg7o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzVDKmKuaWN24Dh+dqam1b7UJmC2G2kz7ICau9N0aMBD5cc1+nK
	4hctV9ACvfCs4XfX4Ss1n/PVKpeuXpwefzrqOyfnmD8Jggrjr/3ekxh0TIXqiK7IBgxjqioQ8+k
	LFWtcBeCMr+eZREnxS71ZFYWvJzs/wT3hO2VgGs6dcOrKfO8rBRkpqvCYJMkN5nlZxfWNRthi0L
	8=
X-Gm-Gg: ASbGncuP0jgjqZrmRQ/6j5LlysobdcpcqG2guldX9Pm4tkseAjJxGUPpSLmj2hE8xH8
	SkukeEliSfpbZTWb4hXrw9FAmwjQx7AECkfGgi+hm0MayCvBbZodYolg90crWsGCT8c+t/Ik5Dy
	gtz0fXw9CSHmRluVIZCJNaPl2SvcAiKfgHdsWyT5RbpyuHuX/pF7UuAlvoYbruwMRWyNtlyY3zA
	SPkLnlQ+SQHTrY/jlM2ROpzquGx5qtWWLWVAa3KV1eUif1ZxQj7nUkN6eCIXmR6uDgp0eAr4K5W
	ww3kUfJbRMK0hJ3p6PDwOKYxB2CcAhQ1u3O+e4AhXaqIbEY2L3babUvDYFRbG5GZgN01QBG/mWE
	5V2PKCpfzWz1sVq0FARQkyoLu
X-Received: by 2002:a05:600c:c493:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-459faf4758bmr80581175e9.11.1754911620224;
        Mon, 11 Aug 2025 04:27:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBm+6FX9Xdf6wc1nTSJlLqt7RXq7PC8peG73SnR2aY3/2U0Fhn5nWzADDyt5hVIbhoPtrtZw==
X-Received: by 2002:a05:600c:c493:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-459faf4758bmr80581015e9.11.1754911619781;
        Mon, 11 Aug 2025 04:26:59 -0700 (PDT)
Received: from localhost (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de. [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458be70c5f7sm376335155e9.26.2025.08.11.04.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:26:59 -0700 (PDT)
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
	Lance Yang <lance.yang@linux.dev>,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [PATCH v3 10/11] mm: introduce and use vm_normal_page_pud()
Date: Mon, 11 Aug 2025 13:26:30 +0200
Message-ID: <20250811112631.759341-11-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: aszgeYNvaFuXSBP9gjKT1OJABLgpIpsWzelLXx98xMA_1754911620
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's introduce vm_normal_page_pud(), which ends up being fairly simple
because of our new common helpers and there not being a PUD-sized zero
folio.

Use vm_normal_page_pud() in folio_walk_start() to resolve a TODO,
structuring the code like the other (pmd/pte) cases. Defer
introducing vm_normal_folio_pud() until really used.

Note that we can so far get PUDs with hugetlb, daxfs and PFNMAP entries.

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h |  2 ++
 mm/memory.c        | 19 +++++++++++++++++++
 mm/pagewalk.c      | 20 ++++++++++----------
 3 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index b626d1bacef52..8ca7d2fa71343 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2360,6 +2360,8 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
 				  unsigned long addr, pmd_t pmd);
 struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 				pmd_t pmd);
+struct page *vm_normal_page_pud(struct vm_area_struct *vma, unsigned long addr,
+		pud_t pud);
 
 void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
 		  unsigned long size);
diff --git a/mm/memory.c b/mm/memory.c
index 78af3f243cee7..6f806bf3cc994 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -809,6 +809,25 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
 		return page_folio(page);
 	return NULL;
 }
+
+/**
+ * vm_normal_page_pud() - Get the "struct page" associated with a PUD
+ * @vma: The VMA mapping the @pud.
+ * @addr: The address where the @pud is mapped.
+ * @pud: The PUD.
+ *
+ * Get the "struct page" associated with a PUD. See __vm_normal_page()
+ * for details on "normal" and "special" mappings.
+ *
+ * Return: Returns the "struct page" if this is a "normal" mapping. Returns
+ *	   NULL if this is a "special" mapping.
+ */
+struct page *vm_normal_page_pud(struct vm_area_struct *vma,
+		unsigned long addr, pud_t pud)
+{
+	return __vm_normal_page(vma, addr, pud_pfn(pud), pud_special(pud),
+				pud_val(pud), PGTABLE_LEVEL_PUD);
+}
 #endif
 
 /**
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index 648038247a8d2..c6753d370ff4e 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -902,23 +902,23 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 		fw->pudp = pudp;
 		fw->pud = pud;
 
-		/*
-		 * TODO: FW_MIGRATION support for PUD migration entries
-		 * once there are relevant users.
-		 */
-		if (!pud_present(pud) || pud_special(pud)) {
+		if (pud_none(pud)) {
 			spin_unlock(ptl);
 			goto not_found;
-		} else if (!pud_leaf(pud)) {
+		} else if (pud_present(pud) && !pud_leaf(pud)) {
 			spin_unlock(ptl);
 			goto pmd_table;
+		} else if (pud_present(pud)) {
+			page = vm_normal_page_pud(vma, addr, pud);
+			if (page)
+				goto found;
 		}
 		/*
-		 * TODO: vm_normal_page_pud() will be handy once we want to
-		 * support PUD mappings in VM_PFNMAP|VM_MIXEDMAP VMAs.
+		 * TODO: FW_MIGRATION support for PUD migration entries
+		 * once there are relevant users.
 		 */
-		page = pud_page(pud);
-		goto found;
+		spin_unlock(ptl);
+		goto not_found;
 	}
 
 pmd_table:
-- 
2.50.1


