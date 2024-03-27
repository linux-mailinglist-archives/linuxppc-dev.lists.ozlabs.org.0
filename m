Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 636AB88E8FF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:27:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AVsJQ3ox;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AVsJQ3ox;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4Vt3196Rz3vvd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:27:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AVsJQ3ox;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AVsJQ3ox;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4VnN3Czdz3fQH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:23:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VkfUQlJiw2YmDi669w4oXgCkjfbnGDZMVpc2LJneNK4=;
	b=AVsJQ3oxZori/0jbiU/hEUHGTPyOIfF2KtXrxRs+X9qPY6bpKKg3pU3mS80iG+/rUMPxLq
	aQKTRNxV677HRcYDhyG05TlV3K7yqcgzl97J0robQAfWSrJEq7Qlz53NpFNy5DqVt8zadu
	G+7oNcVo6BMi+6axzYrp57Fo5oxz+yY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VkfUQlJiw2YmDi669w4oXgCkjfbnGDZMVpc2LJneNK4=;
	b=AVsJQ3oxZori/0jbiU/hEUHGTPyOIfF2KtXrxRs+X9qPY6bpKKg3pU3mS80iG+/rUMPxLq
	aQKTRNxV677HRcYDhyG05TlV3K7yqcgzl97J0robQAfWSrJEq7Qlz53NpFNy5DqVt8zadu
	G+7oNcVo6BMi+6axzYrp57Fo5oxz+yY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-Hd2Zgh6ZNTKbLnjXj4ljTQ-1; Wed, 27 Mar 2024 11:23:47 -0400
X-MC-Unique: Hd2Zgh6ZNTKbLnjXj4ljTQ-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-69627b26a51so3093426d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 08:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553027; x=1712157827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkfUQlJiw2YmDi669w4oXgCkjfbnGDZMVpc2LJneNK4=;
        b=LssyutQivpE4gWiE5EcssPkX66ZyjzlCIkSctuOycsl1v64+2nz4YYra+/OWEShzeS
         bsF4Cvyo+1CAAU6pNG4LCmvAQANu5euaT9vqbnsPrEmTpwIv9KoztBEJOt2hBbuXRu8u
         +ACcNB5SdfOGKQcd6Wo6uH+TQ/EHg3pemq7crHOXVlxnJjy9VD/lEE3Sklds8mEVdxst
         nefd1nZwR0EDbBuDx1p8BnmwuOPRCnBvVrLbGu4iA0liGaSwuhCEFwBkIyFGIbOra7SU
         ZMAPAdJhK27bns/sUEiIP57yjlDxZqBdPbwKih8fPLTnvWs2R4N4SFfRiHfsYsoXwT+M
         nL9w==
X-Forwarded-Encrypted: i=1; AJvYcCWGNsqEjoGSJLZdFPI3TdMRQlMcj3xsvEGCT4Fi8FpwF2JS0/HhM+gdPOCMTvZzXTanm1ySw7sp5a2rvQLUc2JeRbiqR9iFlB3Iz88Tsw==
X-Gm-Message-State: AOJu0YyjhUVbfLlGNGaxJ3YG6yiMrsjSzoevUKAo/65CF9mRJtdaWbgK
	VkK/pL214JmKJKrW5w0wBFeZmg7E//dC1nYctuaAqfVyQ0QluZHtcWsuYPD0m8lVzpRGpJ6uiht
	duisXGtEc8FBh4F6zIEyIIRF9L8h0ahOkXwb/K0jAZ4o4uo3bu9/G4R3mx7aUCJE=
X-Received: by 2002:a05:6214:3105:b0:696:6f59:4d19 with SMTP id ks5-20020a056214310500b006966f594d19mr14917320qvb.1.1711553026973;
        Wed, 27 Mar 2024 08:23:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/cvaZbNzejgmgOgxRck5pBSr/g3hsLSZETHWpBhBPVR+VZkVf7lYhXdSr9+e3t1xSA2Wfog==
X-Received: by 2002:a05:6214:3105:b0:696:6f59:4d19 with SMTP id ks5-20020a056214310500b006966f594d19mr14917279qvb.1.1711553026413;
        Wed, 27 Mar 2024 08:23:46 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:23:45 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Date: Wed, 27 Mar 2024 11:23:24 -0400
Message-ID: <20240327152332.950956-6-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327152332.950956-1-peterx@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

The comment in the code explains the reasons.  We took a different approach
comparing to pmd_pfn() by providing a fallback function.

Another option is to provide some lower level config options (compare to
HUGETLB_PAGE or THP) to identify which layer an arch can support for such
huge mappings.  However that can be an overkill.

Cc: Mike Rapoport (IBM) <rppt@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/riscv/include/asm/pgtable.h    |  1 +
 arch/s390/include/asm/pgtable.h     |  1 +
 arch/sparc/include/asm/pgtable_64.h |  1 +
 arch/x86/include/asm/pgtable.h      |  1 +
 include/linux/pgtable.h             | 10 ++++++++++
 5 files changed, 14 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 20242402fc11..0ca28cc8e3fa 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -646,6 +646,7 @@ static inline unsigned long pmd_pfn(pmd_t pmd)
 
 #define __pud_to_phys(pud)  (__page_val_to_pfn(pud_val(pud)) << PAGE_SHIFT)
 
+#define pud_pfn pud_pfn
 static inline unsigned long pud_pfn(pud_t pud)
 {
 	return ((__pud_to_phys(pud) & PUD_MASK) >> PAGE_SHIFT);
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 1a71cb19c089..6cbbe473f680 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1414,6 +1414,7 @@ static inline unsigned long pud_deref(pud_t pud)
 	return (unsigned long)__va(pud_val(pud) & origin_mask);
 }
 
+#define pud_pfn pud_pfn
 static inline unsigned long pud_pfn(pud_t pud)
 {
 	return __pa(pud_deref(pud)) >> PAGE_SHIFT;
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 4d1bafaba942..26efc9bb644a 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -875,6 +875,7 @@ static inline bool pud_leaf(pud_t pud)
 	return pte_val(pte) & _PAGE_PMD_HUGE;
 }
 
+#define pud_pfn pud_pfn
 static inline unsigned long pud_pfn(pud_t pud)
 {
 	pte_t pte = __pte(pud_val(pud));
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index cefc7a84f7a4..273f7557218c 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -234,6 +234,7 @@ static inline unsigned long pmd_pfn(pmd_t pmd)
 	return (pfn & pmd_pfn_mask(pmd)) >> PAGE_SHIFT;
 }
 
+#define pud_pfn pud_pfn
 static inline unsigned long pud_pfn(pud_t pud)
 {
 	phys_addr_t pfn = pud_val(pud);
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 600e17d03659..75fe309a4e10 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1817,6 +1817,16 @@ typedef unsigned int pgtbl_mod_mask;
 #define pte_leaf_size(x) PAGE_SIZE
 #endif
 
+/*
+ * We always define pmd_pfn for all archs as it's used in lots of generic
+ * code.  Now it happens too for pud_pfn (and can happen for larger
+ * mappings too in the future; we're not there yet).  Instead of defining
+ * it for all archs (like pmd_pfn), provide a fallback.
+ */
+#ifndef pud_pfn
+#define pud_pfn(x) ({ BUILD_BUG(); 0; })
+#endif
+
 /*
  * Some architectures have MMUs that are configurable or selectable at boot
  * time. These lead to variable PTRS_PER_x. For statically allocated arrays it
-- 
2.44.0

