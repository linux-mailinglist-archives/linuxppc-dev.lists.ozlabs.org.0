Return-Path: <linuxppc-dev+bounces-10806-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E57B207C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 13:28:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0smY5ygJz3d8Y;
	Mon, 11 Aug 2025 21:27:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754911629;
	cv=none; b=BpUhJ9kZ2auIUC32+OKilZdGb1FCm+Z4EcEIWplQ3OL+Nx/66hHnbyyB+95TZ/VxWCHIyS7+FOl0I+8AIanVlzmh1cf+1wfHGvG6iT06FaBeSZAJ2FzYx+COt7L2QohjCwKEsYl65sU9mx4bXVjXYh1A+jT1K3hK4RV5JCTUrDtXTA7CpR8HcjwHX4c3yHa26IJ70zkDUlY068qGpShOsNZ6PsL12y7+rGFgn5YtpjVRMppMFlw5x1fgMeicNp6khMHfudoWH69rxVS3nnc16tNihm/Rku+u0YWhDoGc3W+gnoG0lySriEYGKWAMqnOhKYsJiJFdMCtmeG3HVQxxYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754911629; c=relaxed/relaxed;
	bh=dH19/uKoiHEMTv0r8rJb8O7lP73Me8TJFFXM58SZ7zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=W10/LTvVaY2JyUqc5HrQ80wixvYBPYWjVDdPMTgSqDI2TP7LzHhqON5VpQbg/HYnmXh3aQJyh4jbEE+GL/VpBzDyVZbxcBmiidabHjcpLeKF12ElOt5/HCTo8psVl9Ix4P6Mi2NaTZ5W67fslcjPtS7AA93uA0Qg+hqDLD+8U4pTVTt1uLqwCcThNUDgKlSZ0UlTs/H0GU+NqqnzICi8Rpa1cwVIyIj96plusJToMh2fKCTJe70TMFVb0Q4X2uGAJVXUjM9hMuxLklJAyepzGCiuAje0j3j1EcFnFdavaQvyiZi9TD9xUDaEsk1HP8jAue5IbENumtK9ebNP3h2Log==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BYnqfPTN; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N6sguVbM; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BYnqfPTN;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N6sguVbM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhildenb@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0smY0WwBz3d2c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 21:27:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dH19/uKoiHEMTv0r8rJb8O7lP73Me8TJFFXM58SZ7zM=;
	b=BYnqfPTN51kj9BxlD5BWsa/T+EPe2W8VlztA4ZGzQrIC1t0265HzoVMdcbWNMHKmQGuTLO
	cZUMDYwLQvveti3peNZnAQSpeDxDkdZGvmXQWT02YmkPkQf/DjztInidBdqfkdpwPVZiPv
	NxNvf6ZirjRFaUdEWfQyg9jNVnBGx6Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dH19/uKoiHEMTv0r8rJb8O7lP73Me8TJFFXM58SZ7zM=;
	b=N6sguVbMsDGTWwDAV7fO8Iq2yCfnKyneZHai3FZUsjc0up9pFdZ83R445cSjjrPJ4+rQbX
	H2nCrlJTGEJrkuxGY4uV9H5euFF/rZdaQDW3KTPa1pVhzan2Ri6PEEXB/p/60MQsyuxsbd
	9zN4Gv92kodfY7QSUgtLbt/Mu1+yPFg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-_f6o4uB8OSWaaIEkBrglHg-1; Mon, 11 Aug 2025 07:27:04 -0400
X-MC-Unique: _f6o4uB8OSWaaIEkBrglHg-1
X-Mimecast-MFC-AGG-ID: _f6o4uB8OSWaaIEkBrglHg_1754911623
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b78329f180so2068387f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 04:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911623; x=1755516423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dH19/uKoiHEMTv0r8rJb8O7lP73Me8TJFFXM58SZ7zM=;
        b=Bh6iYUQOavqAEJmyb57yP1l1WsgR4z65IoxPGJmpblTT6z2NBrWIBdBs7ztOxYo3/h
         HefyylzQwKQNlu24uRwJfPa9TTl1/CK0O5b54ZMxYiP3Qf+OvQMwnBhg0x9azymbHyAH
         kpo6UEBjaDbNURwhNHtM1HauKXLzimdMazkHz+Dm0lY6+aL0bnrlKsr7IjYonQ+gAAxY
         hIfAIu8BUR45I/TY7+nsB09wnzQpKAfqQqQBwtrZjuA9CtRYYsMRtRNkMrmuo5SMt19c
         MMtT9aGsir0tpaiJz7lhIFUoz3QU7RSqjFr/jkEyAfh1fDkIiuDZKadlUmnygk990qYL
         z5kw==
X-Forwarded-Encrypted: i=1; AJvYcCUSv6GqDYOKGqSMsRVj4PASIw5kKoJRDQ8yr3mrh2+hp9u9ehuhjz1m1YvY1li4+1hG0qQEqXd/BHq+gp4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxL+8cnSd++oerjb6n+d1pcdSFxSw85MQyO8m42eeQE18kmekVm
	2JqHI32q3QvqG8DhUaksbzISrxiCcCxAgknVf6HA4bv9dzCaFWjZPr4FfdZE4D62iAyBnIhAGoa
	ZMKYahEIXgllz0769jmiwtRq8QT9jTzNVGiSupBsR58XqeZmu75Bm5tEEjha/Dg6EQRg=
X-Gm-Gg: ASbGncttt5xVLuD7lQtDErYuV0dgPfgdhnwfS8McUolS+TeDpEC5Az5yW431vIp1Mw7
	mYGzs6DhZ2IPTH6a1z1z+vjcaTq5V0TXprF+Z++wQoPlnHWXxttQySBycK5m8AvLzSmLxXMyiAL
	g3hbA+w30Nz0lkQVhqq4VOxnxt+5PyVzg1LkOX6dGyx0EIVRZiNv8YuJD6DWtxtJ9a2Ql2iKl6G
	fO8qUiPyK770sW60mKPIWxnSfSkANWq+g2a5F7UTjLZ/+h3KjGhAHMBh5/2CsVCYCnQ3ifSaB2h
	lOgLIr7WK7DCQVfAumXLS0CWvgoebYlOxCZdULaRyJ5lNjneXMM3a/FfXpFZHb9/rRQVp8ZeSGy
	bxgfw3HgH6Zc5AiYbUppg53EB
X-Received: by 2002:a5d:5d0a:0:b0:3a5:2653:7308 with SMTP id ffacd0b85a97d-3b900b5742bmr9602284f8f.57.1754911622728;
        Mon, 11 Aug 2025 04:27:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGXEgHnsOD9ZoHC3rozcCl2T1/SKhNFUvb83wEfWy/U4w8SmZE0De8ROcIUkzkJT6XleOZhA==
X-Received: by 2002:a5d:5d0a:0:b0:3a5:2653:7308 with SMTP id ffacd0b85a97d-3b900b5742bmr9602254f8f.57.1754911622182;
        Mon, 11 Aug 2025 04:27:02 -0700 (PDT)
Received: from localhost (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de. [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459e5862be7sm264659195e9.15.2025.08.11.04.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:27:01 -0700 (PDT)
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
	David Vrabel <david.vrabel@citrix.com>,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [PATCH v3 11/11] mm: rename vm_ops->find_special_page() to vm_ops->find_normal_page()
Date: Mon, 11 Aug 2025 13:26:31 +0200
Message-ID: <20250811112631.759341-12-david@redhat.com>
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
X-Mimecast-MFC-PROC-ID: mcpj657HBHmjgixPQ7xKq1zrHvxh8_8r4RHHWSA2bHE_1754911623
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

... and hide it behind a kconfig option. There is really no need for
any !xen code to perform this check.

The naming is a bit off: we want to find the "normal" page when a PTE
was marked "special". So it's really not "finding a special" page.

Improve the documentation, and add a comment in the code where XEN ends
up performing the pte_mkspecial() through a hypercall. More details can
be found in commit 923b2919e2c3 ("xen/gntdev: mark userspace PTEs as
special on x86 PV guests").

Cc: David Vrabel <david.vrabel@citrix.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/xen/Kconfig              |  1 +
 drivers/xen/gntdev.c             |  5 +++--
 include/linux/mm.h               | 18 +++++++++++++-----
 mm/Kconfig                       |  2 ++
 mm/memory.c                      | 12 ++++++++++--
 tools/testing/vma/vma_internal.h | 18 +++++++++++++-----
 6 files changed, 42 insertions(+), 14 deletions(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 24f485827e039..f9a35ed266ecf 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -138,6 +138,7 @@ config XEN_GNTDEV
 	depends on XEN
 	default m
 	select MMU_NOTIFIER
+	select FIND_NORMAL_PAGE
 	help
 	  Allows userspace processes to use grants.
 
diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 1f21607656182..26f13b37c78e6 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -321,6 +321,7 @@ static int find_grant_ptes(pte_t *pte, unsigned long addr, void *data)
 	BUG_ON(pgnr >= map->count);
 	pte_maddr = arbitrary_virt_to_machine(pte).maddr;
 
+	/* Note: this will perform a pte_mkspecial() through the hypercall. */
 	gnttab_set_map_op(&map->map_ops[pgnr], pte_maddr, flags,
 			  map->grants[pgnr].ref,
 			  map->grants[pgnr].domid);
@@ -528,7 +529,7 @@ static void gntdev_vma_close(struct vm_area_struct *vma)
 	gntdev_put_map(priv, map);
 }
 
-static struct page *gntdev_vma_find_special_page(struct vm_area_struct *vma,
+static struct page *gntdev_vma_find_normal_page(struct vm_area_struct *vma,
 						 unsigned long addr)
 {
 	struct gntdev_grant_map *map = vma->vm_private_data;
@@ -539,7 +540,7 @@ static struct page *gntdev_vma_find_special_page(struct vm_area_struct *vma,
 static const struct vm_operations_struct gntdev_vmops = {
 	.open = gntdev_vma_open,
 	.close = gntdev_vma_close,
-	.find_special_page = gntdev_vma_find_special_page,
+	.find_normal_page = gntdev_vma_find_normal_page,
 };
 
 /* ------------------------------------------------------------------ */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 8ca7d2fa71343..3868ca1a25f9c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -657,13 +657,21 @@ struct vm_operations_struct {
 	struct mempolicy *(*get_policy)(struct vm_area_struct *vma,
 					unsigned long addr, pgoff_t *ilx);
 #endif
+#ifdef CONFIG_FIND_NORMAL_PAGE
 	/*
-	 * Called by vm_normal_page() for special PTEs to find the
-	 * page for @addr.  This is useful if the default behavior
-	 * (using pte_page()) would not find the correct page.
+	 * Called by vm_normal_page() for special PTEs in @vma at @addr. This
+	 * allows for returning a "normal" page from vm_normal_page() even
+	 * though the PTE indicates that the "struct page" either does not exist
+	 * or should not be touched: "special".
+	 *
+	 * Do not add new users: this really only works when a "normal" page
+	 * was mapped, but then the PTE got changed to something weird (+
+	 * marked special) that would not make pte_pfn() identify the originally
+	 * inserted page.
 	 */
-	struct page *(*find_special_page)(struct vm_area_struct *vma,
-					  unsigned long addr);
+	struct page *(*find_normal_page)(struct vm_area_struct *vma,
+					 unsigned long addr);
+#endif /* CONFIG_FIND_NORMAL_PAGE */
 };
 
 #ifdef CONFIG_NUMA_BALANCING
diff --git a/mm/Kconfig b/mm/Kconfig
index e443fe8cd6cf2..59a04d0b2e272 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1381,6 +1381,8 @@ config PT_RECLAIM
 
 	  Note: now only empty user PTE page table pages will be reclaimed.
 
+config FIND_NORMAL_PAGE
+	def_bool n
 
 source "mm/damon/Kconfig"
 
diff --git a/mm/memory.c b/mm/memory.c
index 6f806bf3cc994..002c28795d8b7 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -639,6 +639,12 @@ static void print_bad_page_map(struct vm_area_struct *vma,
  * trivial. Secondly, an architecture may not have a spare page table
  * entry bit, which requires a more complicated scheme, described below.
  *
+ * With CONFIG_FIND_NORMAL_PAGE, we might have the "special" bit set on
+ * page table entries that actually map "normal" pages: however, that page
+ * cannot be looked up through the PFN stored in the page table entry, but
+ * instead will be looked up through vm_ops->find_normal_page(). So far, this
+ * only applies to PTEs.
+ *
  * A raw VM_PFNMAP mapping (ie. one that is not COWed) is always considered a
  * special mapping (even if there are underlying and valid "struct pages").
  * COWed pages of a VM_PFNMAP are always normal.
@@ -679,8 +685,10 @@ static inline struct page *__vm_normal_page(struct vm_area_struct *vma,
 {
 	if (IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL)) {
 		if (unlikely(special)) {
-			if (vma->vm_ops && vma->vm_ops->find_special_page)
-				return vma->vm_ops->find_special_page(vma, addr);
+#ifdef CONFIG_FIND_NORMAL_PAGE
+			if (vma->vm_ops && vma->vm_ops->find_normal_page)
+				return vma->vm_ops->find_normal_page(vma, addr);
+#endif /* CONFIG_FIND_NORMAL_PAGE */
 			if (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))
 				return NULL;
 			if (is_zero_pfn(pfn) || is_huge_zero_pfn(pfn))
diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index 3639aa8dd2b06..cb1c2a8afe265 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -467,13 +467,21 @@ struct vm_operations_struct {
 	struct mempolicy *(*get_policy)(struct vm_area_struct *vma,
 					unsigned long addr, pgoff_t *ilx);
 #endif
+#ifdef CONFIG_FIND_NORMAL_PAGE
 	/*
-	 * Called by vm_normal_page() for special PTEs to find the
-	 * page for @addr.  This is useful if the default behavior
-	 * (using pte_page()) would not find the correct page.
+	 * Called by vm_normal_page() for special PTEs in @vma at @addr. This
+	 * allows for returning a "normal" page from vm_normal_page() even
+	 * though the PTE indicates that the "struct page" either does not exist
+	 * or should not be touched: "special".
+	 *
+	 * Do not add new users: this really only works when a "normal" page
+	 * was mapped, but then the PTE got changed to something weird (+
+	 * marked special) that would not make pte_pfn() identify the originally
+	 * inserted page.
 	 */
-	struct page *(*find_special_page)(struct vm_area_struct *vma,
-					  unsigned long addr);
+	struct page *(*find_normal_page)(struct vm_area_struct *vma,
+					 unsigned long addr);
+#endif /* CONFIG_FIND_NORMAL_PAGE */
 };
 
 struct vm_unmapped_area_info {
-- 
2.50.1


