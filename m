Return-Path: <linuxppc-dev+bounces-10795-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BBDB2079A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 13:26:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0sm414xcz3cfR;
	Mon, 11 Aug 2025 21:26:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754911604;
	cv=none; b=UW9JayxHgmfk4d/Q8eAQdxRs2cCiOT7QXtW3o4flxOwQiqH938zbv60ZMvEaEAfjTTNHbfTZKlTbhelJrrnIY0+drohG3mrH/6eEgn26ZkE7HoDZHO/sFy4Z0NyjQw6m5sJFYMZTVhruJPmk+dLnVB9p+av8lDy44M04F6mSysnbnmB519a9xT3zN3Vpe/YKqR++XBkjILTuIr6C4D3IN8CjH6OAm2w3T+TQITV636EEWsk4VfW20IC0ekxGzHBVf8wMR+Y1IeQaSD4IASYubR+194h5mAbnC/BZrlHK6xbeLq12WIBzOI7A/JHNeO+OACPhM+zFXvsxdjG3d2AUGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754911604; c=relaxed/relaxed;
	bh=Htya8lk0ohNZGoVKNkWH4Tb4G28S+mHG9GYTekXNGbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=irGaeuRyNTu4d8P3ztPRQq3KMkqMeXLAL74I2qrzuQzQU65/klyAFWHCVNdLJ+cZDf+nX1CDhKoDYhNEecWPHk/pE6T46D+Wzh4l50lrv7yp0kGLQ3EOSlP7woAsD6nb9mGZqyPzX4SPXjmyqoSPc3D7seYzoHwSrQFMsWha6fkq2RgZ5KC0y+PWSwbDXZaOHgPmZ8vFHfQPUDbItoNt5GU1AX30S4OwYyMKWAX34AT4fvHqqxoOmJ5Cm3C7ecVgY4iGpXCxYe7lKo66BVtmu27oMR2DUzqH1nG3x5dpOJRhmbfyM8T3EgHPSkMPckNRx45AjMyaBw4ZIws/JHuEkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BSFR/Fi3; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BSFR/Fi3; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BSFR/Fi3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BSFR/Fi3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0sm30fytz3cfL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 21:26:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Htya8lk0ohNZGoVKNkWH4Tb4G28S+mHG9GYTekXNGbw=;
	b=BSFR/Fi34tP9TYXtSKf6EKayic9rWNswzONRojFnyHfcPvfZqbKbk1pYdoZv+k5ZXanlKC
	4pj2xi/Wk1jDEb46x/FoHBY6I0DYUxjAeV1N1okm3WVuall1fJ8kl28ToTSspr0DYwffuY
	xdWkElrZ4TN6nvSt5P+AYfKKi//FXn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Htya8lk0ohNZGoVKNkWH4Tb4G28S+mHG9GYTekXNGbw=;
	b=BSFR/Fi34tP9TYXtSKf6EKayic9rWNswzONRojFnyHfcPvfZqbKbk1pYdoZv+k5ZXanlKC
	4pj2xi/Wk1jDEb46x/FoHBY6I0DYUxjAeV1N1okm3WVuall1fJ8kl28ToTSspr0DYwffuY
	xdWkElrZ4TN6nvSt5P+AYfKKi//FXn0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-vZueq5U-M5i0SPKycQhHNQ-1; Mon, 11 Aug 2025 07:26:38 -0400
X-MC-Unique: vZueq5U-M5i0SPKycQhHNQ-1
X-Mimecast-MFC-AGG-ID: vZueq5U-M5i0SPKycQhHNQ_1754911598
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45526e19f43so14204975e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 04:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911597; x=1755516397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Htya8lk0ohNZGoVKNkWH4Tb4G28S+mHG9GYTekXNGbw=;
        b=Na06iTP1RSbAZmk4vyzgrSULk39sJO/S7E7xbtn5am5JBRXwymX9y/Ex0WJCFJ5UzP
         7BnmxdODoH8wmL7nsI5YyTjTHe1unAbbFyHEq4P4eA/wAG7oRqGZo3m4w3r9yC2KP1wP
         YPB6fkoPaKKeqJNotngEYigbpj0gwobZjZkap6l5OzmT4zIQwYNHJM5yk1bmFCtJCRak
         p74NbQMBYrzt0mXZ2z2VmVwGJF/J6bj/aF/syyij4nN29tztiao1xWhxm9WepjfBOwYg
         NllYoSih5JzH65ScSNgQlzdAfx5I9f47J+qOkTpb+dJgHslwYqa/hUlJ8poy0oDmJUwE
         40GA==
X-Forwarded-Encrypted: i=1; AJvYcCVfGnPxfP/Vog3dijannEe//3yOllXuGtUtGw32WYJUjLvvvfamsFTgwM91WRXFxPR9G8bZaJqpD4Bp5gM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx6w53bkg96faxRfya1sbrjp4jcXNI9/2nv7JHVEgGMY9O1A6t8
	YYs3KHg1IzbOQEPVRSQTXErgad2ZkFikCOiYiVbMqDW8uPZWaTZ731LKSMRj17/ywy/lqaAuUvF
	gTZlCl8Cfgv4kf9915N+LN9bDlj586heR2BpRaGdT/P1fMnT7ZjXE+ej+XezUozCis1I=
X-Gm-Gg: ASbGnctdGCJMQqqM78NMU02plccfBCzQ4jQcpq4vzTAKTqUo1H1Y7J7awAAYzGiHDga
	R7CCRneOtxfkoNCzRfT+KBTC0vctb5eQQTo5V614tJJefwSnBTbBLOExLRdAmUvnp85tT36tvrr
	8WuAjV+2lEbhh8kqzB8Eqlo0lDgY83lO3KfP1/TGbAiu1zKUZeSdk/OHzHuMPrUMmvJ0U7Q1G/N
	J66PiLCp+R+o0lnkXAcmCsFR/5kPNmj40llrXJxsOkjVHQz7qOnGXkU0LPYEdPuxdtrcf3zL0DO
	wg+s3KQmI8KJB/m+Wxoe8HiIQ+hGqcebHpmFf868z8I19vOhRWY8622hg95olIdwTzHb/9G0d1t
	SfaW/xs9cd/qPIo4UpeDsAV60
X-Received: by 2002:a05:600c:458b:b0:459:e3f8:92ec with SMTP id 5b1f17b1804b1-459f4eb4176mr127957845e9.10.1754911597508;
        Mon, 11 Aug 2025 04:26:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdNxb5gc4DwQKatpkXot61uX7cGVvKpORGwTw8/tHuwPs0r2lWbt+TytrRicLCoC+zeQmPIg==
X-Received: by 2002:a05:600c:458b:b0:459:e3f8:92ec with SMTP id 5b1f17b1804b1-459f4eb4176mr127957415e9.10.1754911596965;
        Mon, 11 Aug 2025 04:26:36 -0700 (PDT)
Received: from localhost (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de. [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3abf33sm40550137f8f.7.2025.08.11.04.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:26:36 -0700 (PDT)
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
Subject: [PATCH v3 01/11] mm/huge_memory: move more common code into insert_pmd()
Date: Mon, 11 Aug 2025 13:26:21 +0200
Message-ID: <20250811112631.759341-2-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: PRikxY5Pf6d-OE5jPPyuazAhFxLmMstfNUBIW9gm4BI_1754911598
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
 mm/huge_memory.c | 72 ++++++++++++++++--------------------------------
 1 file changed, 24 insertions(+), 48 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2b4ea5a2ce7d2..5314a89d676f1 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1379,15 +1379,25 @@ struct folio_or_pfn {
 	bool is_folio;
 };
 
-static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
+static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 		pmd_t *pmd, struct folio_or_pfn fop, pgprot_t prot,
-		bool write, pgtable_t pgtable)
+		bool write)
 {
 	struct mm_struct *mm = vma->vm_mm;
+	pgtable_t pgtable = NULL;
+	spinlock_t *ptl;
 	pmd_t entry;
 
-	lockdep_assert_held(pmd_lockptr(mm, pmd));
+	if (addr < vma->vm_start || addr >= vma->vm_end)
+		return VM_FAULT_SIGBUS;
 
+	if (arch_needs_pgtable_deposit()) {
+		pgtable = pte_alloc_one(vma->vm_mm);
+		if (!pgtable)
+			return VM_FAULT_OOM;
+	}
+
+	ptl = pmd_lock(mm, pmd);
 	if (!pmd_none(*pmd)) {
 		const unsigned long pfn = fop.is_folio ? folio_pfn(fop.folio) :
 					  fop.pfn;
@@ -1395,15 +1405,14 @@ static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 		if (write) {
 			if (pmd_pfn(*pmd) != pfn) {
 				WARN_ON_ONCE(!is_huge_zero_pmd(*pmd));
-				return -EEXIST;
+				goto out_unlock;
 			}
 			entry = pmd_mkyoung(*pmd);
 			entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
 			if (pmdp_set_access_flags(vma, addr, pmd, entry, 1))
 				update_mmu_cache_pmd(vma, addr, pmd);
 		}
-
-		return -EEXIST;
+		goto out_unlock;
 	}
 
 	if (fop.is_folio) {
@@ -1424,11 +1433,17 @@ static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 	if (pgtable) {
 		pgtable_trans_huge_deposit(mm, pmd, pgtable);
 		mm_inc_nr_ptes(mm);
+		pgtable = NULL;
 	}
 
 	set_pmd_at(mm, addr, pmd, entry);
 	update_mmu_cache_pmd(vma, addr, pmd);
-	return 0;
+
+out_unlock:
+	spin_unlock(ptl);
+	if (pgtable)
+		pte_free(mm, pgtable);
+	return VM_FAULT_NOPAGE;
 }
 
 /**
@@ -1450,9 +1465,6 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, unsigned long pfn,
 	struct folio_or_pfn fop = {
 		.pfn = pfn,
 	};
-	pgtable_t pgtable = NULL;
-	spinlock_t *ptl;
-	int error;
 
 	/*
 	 * If we had pmd_special, we could avoid all these restrictions,
@@ -1464,25 +1476,9 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, unsigned long pfn,
 						(VM_PFNMAP|VM_MIXEDMAP));
 	BUG_ON((vma->vm_flags & VM_PFNMAP) && is_cow_mapping(vma->vm_flags));
 
-	if (addr < vma->vm_start || addr >= vma->vm_end)
-		return VM_FAULT_SIGBUS;
-
-	if (arch_needs_pgtable_deposit()) {
-		pgtable = pte_alloc_one(vma->vm_mm);
-		if (!pgtable)
-			return VM_FAULT_OOM;
-	}
-
 	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
 
-	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
-	error = insert_pmd(vma, addr, vmf->pmd, fop, pgprot, write,
-			   pgtable);
-	spin_unlock(ptl);
-	if (error && pgtable)
-		pte_free(vma->vm_mm, pgtable);
-
-	return VM_FAULT_NOPAGE;
+	return insert_pmd(vma, addr, vmf->pmd, fop, pgprot, write);
 }
 EXPORT_SYMBOL_GPL(vmf_insert_pfn_pmd);
 
@@ -1491,35 +1487,15 @@ vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio,
 {
 	struct vm_area_struct *vma = vmf->vma;
 	unsigned long addr = vmf->address & PMD_MASK;
-	struct mm_struct *mm = vma->vm_mm;
 	struct folio_or_pfn fop = {
 		.folio = folio,
 		.is_folio = true,
 	};
-	spinlock_t *ptl;
-	pgtable_t pgtable = NULL;
-	int error;
-
-	if (addr < vma->vm_start || addr >= vma->vm_end)
-		return VM_FAULT_SIGBUS;
 
 	if (WARN_ON_ONCE(folio_order(folio) != PMD_ORDER))
 		return VM_FAULT_SIGBUS;
 
-	if (arch_needs_pgtable_deposit()) {
-		pgtable = pte_alloc_one(vma->vm_mm);
-		if (!pgtable)
-			return VM_FAULT_OOM;
-	}
-
-	ptl = pmd_lock(mm, vmf->pmd);
-	error = insert_pmd(vma, addr, vmf->pmd, fop, vma->vm_page_prot,
-			   write, pgtable);
-	spin_unlock(ptl);
-	if (error && pgtable)
-		pte_free(mm, pgtable);
-
-	return VM_FAULT_NOPAGE;
+	return insert_pmd(vma, addr, vmf->pmd, fop, vma->vm_page_prot, write);
 }
 EXPORT_SYMBOL_GPL(vmf_insert_folio_pmd);
 
-- 
2.50.1


