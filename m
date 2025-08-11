Return-Path: <linuxppc-dev+bounces-10797-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B242B207A2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 13:27:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0sm70qBcz3cmK;
	Mon, 11 Aug 2025 21:26:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754911607;
	cv=none; b=EWigzIbHtQ2AMBq/BIq1K5ZO4qoy1NMuMvY1MkQ6ExNQuri5HwftQ4MjkBoUUjv0Cu70aU9VFfaJ6Vut/dFvSzAQCM5vtsTXvx/L3SQLaNUpMz/5HF3+hjyithTDUQLLaEJNm+wojF8SLibi0K/kkj6Okiixj4VNQH3XqzfiCs788KtRdKP6t+PRArCr270PLi7NzF9v4TEpQsf0LFW+tQ9AAnhKgugJ4rrfQ8ZXd97qPConOHR/7f9v43hrhaszwghVVuMkY2PuVC17SzwoMrODyLmsTG0vNWcZ9BkG/BD75cb6ERWy4Qf5IOZz+keJU+VMp4CESJsl+YAzmFefdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754911607; c=relaxed/relaxed;
	bh=1yyyzSa9KFCInkfs6rUjYFvQXjYygLyaHB4l27+lC7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Q1ZVKqS6rlTMWoBfZ+GkcX0/m64dOnPiYw+ikM/18pqgc7VEU3RRiWGTGRwo2HirPTOeisY+NEYYZnWRDu1zWL1OCQ5+cya7Wwg1IRXkX7P+xsxbdSvdj0p8CmluXd+9s18GUYWWvNLzt2a7udECT5mv8316ShqtQJPYgQiksAxD5xOlRN9+WK1x6ycTJi0mH5PBJWSccQK21VCa58FgynKWg7q7qeYlFuaSEUiJpVjbbuleX3EoaO9RnU+xJPwAZmAHbjDOVVOrFspwehICLmWBVutNcx5hJS24kJumy6HE1d/VlmTHzBKavQ+x7f5avhaIKTlu6p9wxVl+yeCArA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=auck456m; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZWKae8Gt; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=auck456m;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZWKae8Gt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0sm62KNnz3ccf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 21:26:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1yyyzSa9KFCInkfs6rUjYFvQXjYygLyaHB4l27+lC7g=;
	b=auck456mTdU7YHdrANxIHldIkTQsFdlVSdzEmQr7AP5S3leBdk18h5JkTPz5naqoBAi1uk
	8C250HfjHjsPBmTUhdp4TsYt2lEkbX+NWh+f7Oqn3l4n4XOzPfg5fZ+osqWk4NOZIlKOuE
	xjC1Gpix8ZNZFhYBlaPrChGdlErFk4Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1yyyzSa9KFCInkfs6rUjYFvQXjYygLyaHB4l27+lC7g=;
	b=ZWKae8GttO0++7m9AVe3VI3TuXgQ1isfm8S3KM6ZG4QOOG6JYRVjjPypZK6Hcoksve2qWY
	Hx7ALpIHZm1VswUci4FzMI+2ExC6jh6Ua56AMEJc4fXYbEuT7GISFPtYrs51lKUvKnK8mj
	FHrVs26ZKevWAxjDrYKn8B436vWfdAU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-Y2HCBLYWMCO2mZuxf6mECQ-1; Mon, 11 Aug 2025 07:26:41 -0400
X-MC-Unique: Y2HCBLYWMCO2mZuxf6mECQ-1
X-Mimecast-MFC-AGG-ID: Y2HCBLYWMCO2mZuxf6mECQ_1754911600
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451d30992bcso40947575e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 04:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911600; x=1755516400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yyyzSa9KFCInkfs6rUjYFvQXjYygLyaHB4l27+lC7g=;
        b=nsBuIsn7ZSQJ/VUR8WvoLipq7CShawnoxJs8MBf0mlTUieaDkf6ivHzNPioBiXjkwh
         6yKkLwSlaT4w/IzePHxHQH2woqfCrnNtcX4mWuv90rP/HCjfrNFlrV7Vha4mDBHrAiQq
         OdIWAxrwTLuiohl/iaGnuZfJ1zTR6qv9TqQlV1ou2sI5QCOhoGOAXTJoyG/rlGNEJ33Z
         J09fh/QTBMsPfiPgchPY8DgnNt0KvaX3LyrJbgPwSa7fv9CXRnP4rzrT6hq8MC9Z93B8
         Hd7KlpYRzrtAQ2M60loaVBQG5AQKpC9VPfOxxR+LFDKfx6rw65FWz1pDl7ugWCAmXIqu
         HCtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/MEqnW5FUyE7bIoeoRboxQwuV3PIxRKbx/0kqhgy3uBfSQ5oQ1CyLnvov6d9yaLup5fT0xkKGxfdnYG8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxQ1prv87k9P9DP/5dvhyuy+ZnMD3FoY9WT3HyytJLXogRcgLox
	Uv087r8CdvisPKbqBuInrPL45MU3e3F5odSbL/GPdQH61sxukWHmANk7y04Bcrqqzslp8s7LZxd
	Hh2nbZlAwvyxCsWoP0d0GVAXKfApWK5PJD+TUJ24ACHFWTdoxCzeKViBSLE5TE+5zJ08=
X-Gm-Gg: ASbGnctErHVC/qnyOfhibIMOkz67VT0z2YcmdrpGc3RGASTsnuESucqICURVHV/Y6sS
	ny1TeHOdV3kHg5cWLFHNcWLW9ViGpA/yZVXQD/uPIRYCqBbysDjsmiRKbJVW9CuaJrG2DLh4M+L
	scVm2kTW0+CwIba3oAn5oc6h8nNR3UWqVvDJWQ7XviJCxVO2mGdxbIfl4C6a8YJjEj4vXnQJj0S
	6JE0HoqkUsCxElnXQHGTpOA3ZL8K5vntJTAX0wlWtPmvj8rYxn+aRFoDuGcAYpMQId/XTLP7eXM
	ZZNlS8jW5L3XQRWhN9qO82tipk5XH0nU2dAkpcvFb6GMPv7Ex/x+iAFo0QSOVPMNgiSHNEw0947
	KhYQe7FOkigU4FaXb6pkJwWEf
X-Received: by 2002:a05:6000:420f:b0:3b7:8c98:2f4c with SMTP id ffacd0b85a97d-3b900b750bfmr10920298f8f.33.1754911599890;
        Mon, 11 Aug 2025 04:26:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6Mu1XA5qq3G00OwHlXO/yqxgcBzsacx06Jz+W5A1O+vqwNvOeLKy9GaCA2AZU3zaKT01H6g==
X-Received: by 2002:a05:6000:420f:b0:3b7:8c98:2f4c with SMTP id ffacd0b85a97d-3b900b750bfmr10920251f8f.33.1754911599405;
        Mon, 11 Aug 2025 04:26:39 -0700 (PDT)
Received: from localhost (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de. [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3ac158sm41049329f8f.4.2025.08.11.04.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:26:38 -0700 (PDT)
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
	Alistair Popple <apopple@nvidia.com>,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [PATCH v3 02/11] mm/huge_memory: move more common code into insert_pud()
Date: Mon, 11 Aug 2025 13:26:22 +0200
Message-ID: <20250811112631.759341-3-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: dN-xtrkhvWFIUnxctNF8_Z2LR2zFQTld6hOij_qea7s_1754911600
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Let's clean it all further up.

No functional change intended.

Reviewed-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 5314a89d676f1..7933791b75f4d 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1507,25 +1507,30 @@ static pud_t maybe_pud_mkwrite(pud_t pud, struct vm_area_struct *vma)
 	return pud;
 }
 
-static void insert_pud(struct vm_area_struct *vma, unsigned long addr,
+static vm_fault_t insert_pud(struct vm_area_struct *vma, unsigned long addr,
 		pud_t *pud, struct folio_or_pfn fop, pgprot_t prot, bool write)
 {
 	struct mm_struct *mm = vma->vm_mm;
+	spinlock_t *ptl;
 	pud_t entry;
 
+	if (addr < vma->vm_start || addr >= vma->vm_end)
+		return VM_FAULT_SIGBUS;
+
+	ptl = pud_lock(mm, pud);
 	if (!pud_none(*pud)) {
 		const unsigned long pfn = fop.is_folio ? folio_pfn(fop.folio) :
 					  fop.pfn;
 
 		if (write) {
 			if (WARN_ON_ONCE(pud_pfn(*pud) != pfn))
-				return;
+				goto out_unlock;
 			entry = pud_mkyoung(*pud);
 			entry = maybe_pud_mkwrite(pud_mkdirty(entry), vma);
 			if (pudp_set_access_flags(vma, addr, pud, entry, 1))
 				update_mmu_cache_pud(vma, addr, pud);
 		}
-		return;
+		goto out_unlock;
 	}
 
 	if (fop.is_folio) {
@@ -1544,6 +1549,9 @@ static void insert_pud(struct vm_area_struct *vma, unsigned long addr,
 	}
 	set_pud_at(mm, addr, pud, entry);
 	update_mmu_cache_pud(vma, addr, pud);
+out_unlock:
+	spin_unlock(ptl);
+	return VM_FAULT_NOPAGE;
 }
 
 /**
@@ -1565,7 +1573,6 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, unsigned long pfn,
 	struct folio_or_pfn fop = {
 		.pfn = pfn,
 	};
-	spinlock_t *ptl;
 
 	/*
 	 * If we had pud_special, we could avoid all these restrictions,
@@ -1577,16 +1584,9 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, unsigned long pfn,
 						(VM_PFNMAP|VM_MIXEDMAP));
 	BUG_ON((vma->vm_flags & VM_PFNMAP) && is_cow_mapping(vma->vm_flags));
 
-	if (addr < vma->vm_start || addr >= vma->vm_end)
-		return VM_FAULT_SIGBUS;
-
 	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
 
-	ptl = pud_lock(vma->vm_mm, vmf->pud);
-	insert_pud(vma, addr, vmf->pud, fop, pgprot, write);
-	spin_unlock(ptl);
-
-	return VM_FAULT_NOPAGE;
+	return insert_pud(vma, addr, vmf->pud, fop, pgprot, write);
 }
 EXPORT_SYMBOL_GPL(vmf_insert_pfn_pud);
 
@@ -1603,25 +1603,15 @@ vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio,
 {
 	struct vm_area_struct *vma = vmf->vma;
 	unsigned long addr = vmf->address & PUD_MASK;
-	pud_t *pud = vmf->pud;
-	struct mm_struct *mm = vma->vm_mm;
 	struct folio_or_pfn fop = {
 		.folio = folio,
 		.is_folio = true,
 	};
-	spinlock_t *ptl;
-
-	if (addr < vma->vm_start || addr >= vma->vm_end)
-		return VM_FAULT_SIGBUS;
 
 	if (WARN_ON_ONCE(folio_order(folio) != PUD_ORDER))
 		return VM_FAULT_SIGBUS;
 
-	ptl = pud_lock(mm, pud);
-	insert_pud(vma, addr, vmf->pud, fop, vma->vm_page_prot, write);
-	spin_unlock(ptl);
-
-	return VM_FAULT_NOPAGE;
+	return insert_pud(vma, addr, vmf->pud, fop, vma->vm_page_prot, write);
 }
 EXPORT_SYMBOL_GPL(vmf_insert_folio_pud);
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
-- 
2.50.1


