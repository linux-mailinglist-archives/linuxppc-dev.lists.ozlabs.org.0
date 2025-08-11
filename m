Return-Path: <linuxppc-dev+bounces-10799-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C3FB207AC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 13:27:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0smC3Qw4z3cyM;
	Mon, 11 Aug 2025 21:26:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754911611;
	cv=none; b=KqsC8tTibQ93OgXwvV38ve7a5gTrqxAxm6Ck360Q+4UeGUe/yp7gKfdXIn8u/8F7MreOyOCIEy2yvd1i9oskPl5C4RNaHUcb9jnDUrahhPVxuhYgIJI0DFVl6LiDn+XZYAwPEx8GnWm4vls53mO/aw2mOMNhXQJvf05eakS5UOlkAj3cKKDuvA7eXPxSkllENnkIYbd/5p8kwZWeYbGT0Dni/q4gNjfHD/Cg2Ddl512CW+M2maouG2opVtAmcz6lGHJLFKYftkDAK23yUVjHPByM3Tao46E7GQTVxNpiGZaS1YXiU6pDU9qmlF5rZAZ7EylbxfaIP4ke3aZvsf4tvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754911611; c=relaxed/relaxed;
	bh=2CQ37fr3U8Nz67n3Rs/zLbnQBIPHeKcdveRJNY/DHTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ZZNuU2Eyu04nPuQEX+RNBiFJSKbg5qWggZXobEMbNnUkmk8Sbrat5iV0/Kfopu0JilTvqtLNe/VpaAvhj6ZPQCebc+Lo4r86Un1/tCMNBIA17qXrGmokORQ6Wp+QlhGAXnhFmocJpr54e8qqo/sC9XYaE+2gLLoysTs9SY3XRwC4X+rFnk2kXtfG3rYXv05ACTiRxkk+hesbWGH5vj2VzDoHG1EHmE2KRX0oSWO6MwDoNpACvqnDVOhxr0RZuQtuJrf5qcKRLYjDC+BZS0qGuwFMLv73KGGEvJ8P9kLYEJd5VVGRyZCfBBkEgyhODgsz1ubLPU292Jfdr1oGYEjBiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HF8efkpC; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bhvyXPXj; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HF8efkpC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bhvyXPXj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0smB4y2cz3cp1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 21:26:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2CQ37fr3U8Nz67n3Rs/zLbnQBIPHeKcdveRJNY/DHTc=;
	b=HF8efkpCovdeGRPT70MfYPsAaEiWTZ0y0ohE1OCjP9NFvhh3mBJAR0NzOoyN7yRZsnnMbv
	yKxXZRR0BGgjmmJxZDPiXaWdv0OP1kCchRY6xd42FcdTIX36zkbmkucopok+npSTISmJWr
	YmszCzw+ACqKcu3akQc4KqyhROT33jU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2CQ37fr3U8Nz67n3Rs/zLbnQBIPHeKcdveRJNY/DHTc=;
	b=bhvyXPXjtwqlReG8OyNSLqE8KswakdudPYd7bhNp++LvBDitDc5tTLVAL+//lzuNBh81rd
	+CqFCvFP1TkZX4F3g+Bl19wEWkqoGxv4gSTa4nocgROw7o/00Zfji9H/zetjylnFNMosfd
	I2aISqgGrjlhuRGfzAAS21AE46sfPzo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-PNNN0295NqG4iMtz6VKxjw-1; Mon, 11 Aug 2025 07:26:46 -0400
X-MC-Unique: PNNN0295NqG4iMtz6VKxjw-1
X-Mimecast-MFC-AGG-ID: PNNN0295NqG4iMtz6VKxjw_1754911605
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so22157435e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 04:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911605; x=1755516405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CQ37fr3U8Nz67n3Rs/zLbnQBIPHeKcdveRJNY/DHTc=;
        b=Pd96D6lMFOgeg3YI9PbCAqYJAph4Hn2+VHtqlKcgqkcA/2iIgQSN9qEdj5wDdUVmv7
         wjnQn9kLWG7Rody/TVGygKRT3ak+MGGzYVWuXsuX6y8NlLlppgWU6tWcKszSDrWNTI65
         qpUPBGZkOjd4IPyAfmNDIFnon+5FlfVVmbGhQdvi/LdhPVBApa91vHyDadD+bzcoo57u
         R2CMraZbyoyyODdOJ27jxKxNHAMi4Svy5NYvextOlRa5HVntiOWG89QIhzodAF+00G4Q
         EnHOo3LZA4106I/aSHxFSU7j6e0VTl2GnravlW8gPgQDzAZh7Y3xw8eKdOC5SYMEIq11
         ZvXg==
X-Forwarded-Encrypted: i=1; AJvYcCX/nL/4P6RvCobMx6XKNpNQwjlZQnUUi4e/IkF8ClzNjEJE5V79B/K9rkiRX5S1nOEN5RuK+j09X+5WKK4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw62mufk20nH5b7BsHBJ11bP4rXqWsoW7Q02/L3xJFYFcjYhdGb
	/7n3dLyN8dznqWGwr6uQwIGO46B6B287Qll/Jbx+r2tvosO27oBbKTHhTCnDhDJzF6JYp+oPcwl
	MDtffmZ6nauslsr361iZFR+kOSmEs8bQtVFTBeas8sOWDtcjB/cuSv8O9iIudu08K7d4=
X-Gm-Gg: ASbGncsVD8b4779GENsyIwtI0lMuE32TDhDXD+s2WZ4VIL1vqJmTA0mwePedWWh7RBK
	4FNsDE1GdFr2fOLLIXoL8fOH6w1Mt5Q8IfdTpgTHd+TcjzbNFsooC/76BNfiUfNa2m0uyrR1l+m
	PqFPukMpYl6tleFYuRyfGuSMVpBmKjPare9spzNgtbD21YBBJiTzP/w99L+HJoBQEysHIuD7m8f
	ANVTH430ra2IvRnz6nTiuhGWQESvrNdJmT016ISEhpwhW7hfiYigrhIirKpEyFrvoFjR5UI7Mv8
	r1xFJbY6JIxHIQ0dxm9Zt1ichrzJFovPje/nHbccrkVZTdALmEscbZnSMnofHmHdOKFHjSLoMhA
	kEZAXVXPQliIEdjnPogR5WofH
X-Received: by 2002:a05:6000:220c:b0:3b3:9c75:acc6 with SMTP id ffacd0b85a97d-3b900b579abmr8417842f8f.59.1754911604947;
        Mon, 11 Aug 2025 04:26:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhtoj1JC1TeyGzrT2XifHRNOizQnW6DZ2myFR7vrwjVvSFSoQpoWzRIG0dK3lnMunpNHs17g==
X-Received: by 2002:a05:6000:220c:b0:3b3:9c75:acc6 with SMTP id ffacd0b85a97d-3b900b579abmr8417828f8f.59.1754911604480;
        Mon, 11 Aug 2025 04:26:44 -0700 (PDT)
Received: from localhost (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de. [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c4696c8sm39325003f8f.55.2025.08.11.04.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:26:43 -0700 (PDT)
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
	Alistair Popple <apopple@nvidia.com>
Subject: [PATCH v3 04/11] fs/dax: use vmf_insert_folio_pmd() to insert the huge zero folio
Date: Mon, 11 Aug 2025 13:26:24 +0200
Message-ID: <20250811112631.759341-5-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: TCtbrnc9dFZLoBf01b6x-go5rYBUgSb1aA8YqiFVK2A_1754911605
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's convert to vmf_insert_folio_pmd().

There is a theoretical change in behavior: in the unlikely case there is
already something mapped, we'll now still call trace_dax_pmd_load_hole()
and return VM_FAULT_NOPAGE.

Previously, we would have returned VM_FAULT_FALLBACK, and the caller
would have zapped the PMD to try a PTE fault.

However, that behavior was different to other PTE+PMD faults, when there
would already be something mapped, and it's not even clear if it could
be triggered.

Assuming the huge zero folio is already mapped, all good, no need to
fallback to PTEs.

Assuming there is already a leaf page table ... the behavior would be
just like when trying to insert a PMD mapping a folio through
dax_fault_iter()->vmf_insert_folio_pmd().

Assuming there is already something else mapped as PMD? It sounds like
a BUG, and the behavior would be just like when trying to insert a PMD
mapping a folio through dax_fault_iter()->vmf_insert_folio_pmd().

So, it sounds reasonable to not handle huge zero folios differently
to inserting PMDs mapping folios when there already is something mapped.

Reviewed-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 fs/dax.c | 47 ++++++++++-------------------------------------
 1 file changed, 10 insertions(+), 37 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 4229513806bea..ae90706674a3f 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1375,51 +1375,24 @@ static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
 		const struct iomap_iter *iter, void **entry)
 {
 	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
-	unsigned long pmd_addr = vmf->address & PMD_MASK;
-	struct vm_area_struct *vma = vmf->vma;
 	struct inode *inode = mapping->host;
-	pgtable_t pgtable = NULL;
 	struct folio *zero_folio;
-	spinlock_t *ptl;
-	pmd_t pmd_entry;
-	unsigned long pfn;
+	vm_fault_t ret;
 
 	zero_folio = mm_get_huge_zero_folio(vmf->vma->vm_mm);
 
-	if (unlikely(!zero_folio))
-		goto fallback;
-
-	pfn = page_to_pfn(&zero_folio->page);
-	*entry = dax_insert_entry(xas, vmf, iter, *entry, pfn,
-				  DAX_PMD | DAX_ZERO_PAGE);
-
-	if (arch_needs_pgtable_deposit()) {
-		pgtable = pte_alloc_one(vma->vm_mm);
-		if (!pgtable)
-			return VM_FAULT_OOM;
-	}
-
-	ptl = pmd_lock(vmf->vma->vm_mm, vmf->pmd);
-	if (!pmd_none(*(vmf->pmd))) {
-		spin_unlock(ptl);
-		goto fallback;
+	if (unlikely(!zero_folio)) {
+		trace_dax_pmd_load_hole_fallback(inode, vmf, zero_folio, *entry);
+		return VM_FAULT_FALLBACK;
 	}
 
-	if (pgtable) {
-		pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, pgtable);
-		mm_inc_nr_ptes(vma->vm_mm);
-	}
-	pmd_entry = folio_mk_pmd(zero_folio, vmf->vma->vm_page_prot);
-	set_pmd_at(vmf->vma->vm_mm, pmd_addr, vmf->pmd, pmd_entry);
-	spin_unlock(ptl);
-	trace_dax_pmd_load_hole(inode, vmf, zero_folio, *entry);
-	return VM_FAULT_NOPAGE;
+	*entry = dax_insert_entry(xas, vmf, iter, *entry, folio_pfn(zero_folio),
+				  DAX_PMD | DAX_ZERO_PAGE);
 
-fallback:
-	if (pgtable)
-		pte_free(vma->vm_mm, pgtable);
-	trace_dax_pmd_load_hole_fallback(inode, vmf, zero_folio, *entry);
-	return VM_FAULT_FALLBACK;
+	ret = vmf_insert_folio_pmd(vmf, zero_folio, false);
+	if (ret == VM_FAULT_NOPAGE)
+		trace_dax_pmd_load_hole(inode, vmf, zero_folio, *entry);
+	return ret;
 }
 #else
 static vm_fault_t dax_pmd_load_hole(struct xa_state *xas, struct vm_fault *vmf,
-- 
2.50.1


