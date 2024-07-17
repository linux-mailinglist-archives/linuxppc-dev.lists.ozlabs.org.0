Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BF893448A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 00:04:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JyyrznhH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JyyrznhH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPVMz52v3z3dRH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 08:04:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JyyrznhH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JyyrznhH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPVKh5Jg8z3bVG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 08:02:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6jtsZY5Ha1GOE7eeXCKiwGrLCKWt0M5FAlFhM8vgy8I=;
	b=JyyrznhH7PKYjfMHJ3adtMwE/px0QtCPV2ihma2ICUkzJDdpoeQTDhKXwJuyWm2iVlFHcC
	Io8iG29tmdBzjIlVoY8UGZqJBv1YPqtSRfh1JVHt6oiCZWHp8b31b4R9owwaRpSgPD/0Ov
	uPLaxCdhEup8snzIfGC0negn50hJDwU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6jtsZY5Ha1GOE7eeXCKiwGrLCKWt0M5FAlFhM8vgy8I=;
	b=JyyrznhH7PKYjfMHJ3adtMwE/px0QtCPV2ihma2ICUkzJDdpoeQTDhKXwJuyWm2iVlFHcC
	Io8iG29tmdBzjIlVoY8UGZqJBv1YPqtSRfh1JVHt6oiCZWHp8b31b4R9owwaRpSgPD/0Ov
	uPLaxCdhEup8snzIfGC0negn50hJDwU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-O0PR6WryNnaanfa7REFY5w-1; Wed, 17 Jul 2024 18:02:25 -0400
X-MC-Unique: O0PR6WryNnaanfa7REFY5w-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-44aeacbf2baso259151cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2024 15:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721253745; x=1721858545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jtsZY5Ha1GOE7eeXCKiwGrLCKWt0M5FAlFhM8vgy8I=;
        b=aqWfXOu3Tr4uxoeBM5YB6dUzt09zgt4RDKIilTA9UUak3D9+8wtvBi2WOENJgmVvFL
         yFxMUsCy2dN4FQopDngEDeZX6I+02J3CERqaE1NB0Q7Xis9/7QHDFNYTBbN80bRmX7Dz
         5nYsQZX9emB2h2Q/89EBDzk+HIpanlkSw2jH0eZ87AFX46O9f/TVOWRKMRV1KcoB7SnZ
         CnC9owY+vxM6eSHf/uJd5naDsi+iM5rjJsivOmi8n55/bsXLEctfHTB19mthK5dLj9Iu
         3mNNiHloYggTNYHVXkLpUROW2DfIrr3UOxXKgLG1AHJ4sMd0xuaa7UlGJODb+T1C15qQ
         dufQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC1IVa1HYFu9gtX6YX3Csnkx5Q4aMiqN9oUFA72jcg9hyPtqiP2sizr5bpVWeXuOJpl/RpU2y8lRKuuedmAITnfCfUINsOKyjw6htqpg==
X-Gm-Message-State: AOJu0YwM2XEkP6FRoGOiFDgwOmXO1w5DsKC/tuebdrcgJKupK+dkX8nl
	kYsZ2s+t9vlJPyTWL39I+48XP+uvEHbUgAxletg2a3EyU7omUkmWQmXPhF3lMcvCvcLIohiQbPc
	cIC38XF8vZZk224QHYTDoY409M4qxKuwbGeUTgnhlcZ8BhNxhhKLXs0D4KKgik6s=
X-Received: by 2002:a05:622a:19a8:b0:446:5a29:c501 with SMTP id d75a77b69052e-44f864afa6cmr22369391cf.1.1721253744671;
        Wed, 17 Jul 2024 15:02:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUvRqkcMnpaLn941R1BXuIssxTrm35f8/3mo50id9Lq3VPmnZD9wDrl4u3hs2U9BoucnNtpA==
X-Received: by 2002:a05:622a:19a8:b0:446:5a29:c501 with SMTP id d75a77b69052e-44f864afa6cmr22369171cf.1.1721253744329;
        Wed, 17 Jul 2024 15:02:24 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f5b83f632sm53071651cf.85.2024.07.17.15.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 15:02:23 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RFC 1/6] mm/treewide: Remove pgd_devmap()
Date: Wed, 17 Jul 2024 18:02:14 -0400
Message-ID: <20240717220219.3743374-2-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240717220219.3743374-1-peterx@redhat.com>
References: <20240717220219.3743374-1-peterx@redhat.com>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, Alistair Popple <apopple@nvidia.com>, Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand <david@redhat.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, peterx@redhat.com, Michal Hocko <mhocko@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, linux-riscv@lists.infradead.org, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's always 0 for all archs, and there's no sign to even support p4d entry
in the near future.  Remove it until it's needed for real.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/arm64/include/asm/pgtable.h             | 5 -----
 arch/powerpc/include/asm/book3s/64/pgtable.h | 5 -----
 arch/x86/include/asm/pgtable.h               | 5 -----
 include/linux/pgtable.h                      | 4 ----
 mm/gup.c                                     | 2 --
 5 files changed, 21 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index f8efbc128446..5d5d1b18b837 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1119,11 +1119,6 @@ static inline int pud_devmap(pud_t pud)
 {
 	return 0;
 }
-
-static inline int pgd_devmap(pgd_t pgd)
-{
-	return 0;
-}
 #endif
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 5da92ba68a45..051b1b6d729c 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1431,11 +1431,6 @@ static inline int pud_devmap(pud_t pud)
 {
 	return pte_devmap(pud_pte(pud));
 }
-
-static inline int pgd_devmap(pgd_t pgd)
-{
-	return 0;
-}
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 #define __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 701593c53f3b..0d234f48ceeb 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -311,11 +311,6 @@ static inline int pud_devmap(pud_t pud)
 	return 0;
 }
 #endif
-
-static inline int pgd_devmap(pgd_t pgd)
-{
-	return 0;
-}
 #endif
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 2289e9f7aa1b..0a904300ac90 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1626,10 +1626,6 @@ static inline int pud_devmap(pud_t pud)
 {
 	return 0;
 }
-static inline int pgd_devmap(pgd_t pgd)
-{
-	return 0;
-}
 #endif
 
 #if !defined(CONFIG_TRANSPARENT_HUGEPAGE) || \
diff --git a/mm/gup.c b/mm/gup.c
index 54d0dc3831fb..b023bcd38235 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3149,8 +3149,6 @@ static int gup_fast_pgd_leaf(pgd_t orig, pgd_t *pgdp, unsigned long addr,
 	if (!pgd_access_permitted(orig, flags & FOLL_WRITE))
 		return 0;
 
-	BUILD_BUG_ON(pgd_devmap(orig));
-
 	page = pgd_page(orig);
 	refs = record_subpages(page, PGDIR_SIZE, addr, end, pages + *nr);
 
-- 
2.45.0

