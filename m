Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF028182C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 08:59:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fwOfAu7H;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OqTRLksj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvTc20g9qz3vcQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 18:59:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fwOfAu7H;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OqTRLksj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvTY31Fc0z3cSS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 18:56:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702972596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VdhTUt+FrTuSBSRKmaD9aOddOtS2xHAJn3bdMelwyoI=;
	b=fwOfAu7HDBbdQOnE8TO7LkgGYuq++nNSwNUtJTwec3guvFO5Ys7Sd35/FABNNGRoaviHVY
	Ln6hk0Duk25JLQflV4A1m0VzBcZMCjfF8K4TZWuwQ2A0OEIEvOT3EdxPstqmPf6QE9Y09v
	MQuqleHFSeWcYKwqLn1ogtcI2J0+WWI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702972597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VdhTUt+FrTuSBSRKmaD9aOddOtS2xHAJn3bdMelwyoI=;
	b=OqTRLksjAUob7bQePEZNHSZVc6rfMOmeNXCpKVUOp0eMLDX6yJReP+wuoremUVGdZyFcNo
	mF01mmxdbRbhXEEbQbml/knUuSPOqknJFq97wFZenQE/l5C6Gr9nEqTp2RRv1ooX9z7Z2K
	8IdK0ZHkzHOIUcMqRT6n5kWcFJHiBhk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-zvB374S3NdqDENm7NImiSg-1; Tue, 19 Dec 2023 02:56:29 -0500
X-MC-Unique: zvB374S3NdqDENm7NImiSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 298F1185A782;
	Tue, 19 Dec 2023 07:56:28 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B65A2026D6F;
	Tue, 19 Dec 2023 07:56:17 +0000 (UTC)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 03/13] mm: Provide generic pmd_thp_or_huge()
Date: Tue, 19 Dec 2023 15:55:28 +0800
Message-ID: <20231219075538.414708-4-peterx@redhat.com>
In-Reply-To: <20231219075538.414708-1-peterx@redhat.com>
References: <20231219075538.414708-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

ARM defines pmd_thp_or_huge(), detecting either a THP or a huge PMD.  It
can be a helpful helper if we want to merge more THP and hugetlb code
paths.  Make it a generic default implementation, only exist when
CONFIG_MMU.  Arch can overwrite it by defining its own version.

For example, ARM's pgtable-2level.h defines it to always return false.

Keep the macro declared with all config, it should be optimized to a false
anyway if !THP && !HUGETLB.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/pgtable.h | 4 ++++
 mm/gup.c                | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index af7639c3b0a3..6f2fa1977b8a 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1355,6 +1355,10 @@ static inline int pmd_write(pmd_t pmd)
 #endif /* pmd_write */
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+#ifndef pmd_thp_or_huge
+#define pmd_thp_or_huge(pmd)	(pmd_huge(pmd) || pmd_trans_huge(pmd))
+#endif
+
 #ifndef pud_write
 static inline int pud_write(pud_t pud)
 {
diff --git a/mm/gup.c b/mm/gup.c
index 0a5f0e91bfec..efc9847e58fb 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -3004,8 +3004,7 @@ static int gup_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr, unsigned lo
 		if (!pmd_present(pmd))
 			return 0;
 
-		if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
-			     pmd_devmap(pmd))) {
+		if (unlikely(pmd_thp_or_huge(pmd) || pmd_devmap(pmd))) {
 			/* See gup_pte_range() */
 			if (pmd_protnone(pmd))
 				return 0;
-- 
2.41.0

