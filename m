Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 739BE8734C7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 11:48:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LtQ9I2Jj;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LtQ9I2Jj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqTgC1pySz3dVS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 21:48:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LtQ9I2Jj;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LtQ9I2Jj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqTYH0BKBz3vhd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 21:43:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709721792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xZurg04juSYF/uW9HtnhgkfMM1C/gArxmrpoVNEgvCQ=;
	b=LtQ9I2Jjo//Xqs2w8072b6OnFBS9A3Hlx5U7biJi59Z1Wc9bIw9r7DYB7G6c0/ATIfaTMB
	jBL/sYhqrf3NMfq9adT2IP/7AMTttWOBBr5w/iaT9V0zetjl8NjxzAnIBBMxuMWwe8HYvz
	RZQ8cCHbcJAPAAR7IB6rJWhcZOPugh8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709721792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xZurg04juSYF/uW9HtnhgkfMM1C/gArxmrpoVNEgvCQ=;
	b=LtQ9I2Jjo//Xqs2w8072b6OnFBS9A3Hlx5U7biJi59Z1Wc9bIw9r7DYB7G6c0/ATIfaTMB
	jBL/sYhqrf3NMfq9adT2IP/7AMTttWOBBr5w/iaT9V0zetjl8NjxzAnIBBMxuMWwe8HYvz
	RZQ8cCHbcJAPAAR7IB6rJWhcZOPugh8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-392-yz4Oyb-YMiytY0-QZ4ib3A-1; Wed,
 06 Mar 2024 05:43:02 -0500
X-MC-Unique: yz4Oyb-YMiytY0-QZ4ib3A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79C4B3C0DF76;
	Wed,  6 Mar 2024 10:43:01 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 45DD5111DCFF;
	Wed,  6 Mar 2024 10:42:53 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 08/13] mm/arm64: Merge pXd_huge() and pXd_leaf() definitions
Date: Wed,  6 Mar 2024 18:41:42 +0800
Message-ID: <20240306104147.193052-9-peterx@redhat.com>
In-Reply-To: <20240306104147.193052-1-peterx@redhat.com>
References: <20240306104147.193052-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, peterx@redhat.com, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, Mark Salter <msalter@redhat.com>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Unlike most archs, aarch64 defines pXd_huge() and pXd_leaf() slightly
differently.  Redefine the pXd_huge() with pXd_leaf().

There used to be two traps for old aarch64 definitions over these APIs that
I found when reading the code around, they're:

 (1) 4797ec2dc83a ("arm64: fix pud_huge() for 2-level pagetables")
 (2) 23bc8f69f0ec ("arm64: mm: fix p?d_leaf()")

Define pXd_huge() with the current pXd_leaf() will make sure (2) isn't a
problem (on PROT_NONE checks). To make sure it also works for (1), we move
over the __PAGETABLE_PMD_FOLDED check to pud_leaf(), allowing it to
constantly returning "false" for 2-level pgtables, which looks even safer
to cover both now.

Cc: Muchun Song <muchun.song@linux.dev>
Cc: Mark Salter <msalter@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/arm64/include/asm/pgtable.h | 4 ++++
 arch/arm64/mm/hugetlbpage.c      | 8 ++------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 401087e8a43d..14d24c357c7a 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -704,7 +704,11 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 #define pud_none(pud)		(!pud_val(pud))
 #define pud_bad(pud)		(!pud_table(pud))
 #define pud_present(pud)	pte_present(pud_pte(pud))
+#ifndef __PAGETABLE_PMD_FOLDED
 #define pud_leaf(pud)		(pud_present(pud) && !pud_table(pud))
+#else
+#define pud_leaf(pud)		false
+#endif
 #define pud_valid(pud)		pte_valid(pud_pte(pud))
 #define pud_user(pud)		pte_user(pud_pte(pud))
 #define pud_user_exec(pud)	pte_user_exec(pud_pte(pud))
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 0f0e10bb0a95..1234bbaef5bf 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -81,16 +81,12 @@ bool arch_hugetlb_migration_supported(struct hstate *h)
 
 int pmd_huge(pmd_t pmd)
 {
-	return pmd_val(pmd) && !(pmd_val(pmd) & PMD_TABLE_BIT);
+	return pmd_leaf(pmd);
 }
 
 int pud_huge(pud_t pud)
 {
-#ifndef __PAGETABLE_PMD_FOLDED
-	return pud_val(pud) && !(pud_val(pud) & PUD_TABLE_BIT);
-#else
-	return 0;
-#endif
+	return pud_leaf(pud);
 }
 
 static int find_num_contig(struct mm_struct *mm, unsigned long addr,
-- 
2.44.0

