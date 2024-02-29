Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7780886C402
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 09:45:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A5hUWNJT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A5hUWNJT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TllDf0kx9z3vjt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 19:45:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A5hUWNJT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A5hUWNJT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TllB12Cn0z3vXV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 19:43:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709196214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnT5L9L6w21lKd8yQkJVObKwVcge77cGSeo5m2W2yic=;
	b=A5hUWNJTLtSAnqGur5kZXWT0SRKBTqbkbmcQuPGwf9q8I37NeJPzEwEZvLabVe0m721Hlo
	HKeyY0ncR1arv5NlJlgo1fej+7asdennqhGY4r3twmBq71qHG5jTzxgsRzh/VZbSfNaMck
	ou9Fz5W4rJpFGKJ5hM8Hv8lybWPyWEw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709196214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnT5L9L6w21lKd8yQkJVObKwVcge77cGSeo5m2W2yic=;
	b=A5hUWNJTLtSAnqGur5kZXWT0SRKBTqbkbmcQuPGwf9q8I37NeJPzEwEZvLabVe0m721Hlo
	HKeyY0ncR1arv5NlJlgo1fej+7asdennqhGY4r3twmBq71qHG5jTzxgsRzh/VZbSfNaMck
	ou9Fz5W4rJpFGKJ5hM8Hv8lybWPyWEw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-XVRBeMQtPOS0aNn2-IbSjA-1; Thu, 29 Feb 2024 03:43:30 -0500
X-MC-Unique: XVRBeMQtPOS0aNn2-IbSjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FD4485A58A;
	Thu, 29 Feb 2024 08:43:29 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D063428D;
	Thu, 29 Feb 2024 08:43:22 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] mm/x86: Replace p4d_large() with p4d_leaf()
Date: Thu, 29 Feb 2024 16:42:54 +0800
Message-ID: <20240229084258.599774-4-peterx@redhat.com>
In-Reply-To: <20240229084258.599774-1-peterx@redhat.com>
References: <20240229084258.599774-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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
Cc: x86@kernel.org, Yang Shi <shy828301@gmail.com>, Muchun Song <muchun.song@linux.dev>, peterx@redhat.com, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Jason Gunthorpe <jgg@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

p4d_large() is always defined as p4d_leaf().  Merge their usages.  Chose
p4d_leaf() because p4d_leaf() is a global API, while p4d_large() is not.

Only x86 has p4d_leaf() defined as of now.  So it also means after this
patch we removed all p4d_large() usages.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/x86/mm/fault.c          | 4 ++--
 arch/x86/mm/init_64.c        | 2 +-
 arch/x86/mm/pat/set_memory.c | 4 ++--
 arch/x86/mm/pti.c            | 2 +-
 arch/x86/power/hibernate.c   | 2 +-
 arch/x86/xen/mmu_pv.c        | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 679b09cfe241..8b69ce3f4115 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -368,7 +368,7 @@ static void dump_pagetable(unsigned long address)
 		goto bad;
 
 	pr_cont("P4D %lx ", p4d_val(*p4d));
-	if (!p4d_present(*p4d) || p4d_large(*p4d))
+	if (!p4d_present(*p4d) || p4d_leaf(*p4d))
 		goto out;
 
 	pud = pud_offset(p4d, address);
@@ -1039,7 +1039,7 @@ spurious_kernel_fault(unsigned long error_code, unsigned long address)
 	if (!p4d_present(*p4d))
 		return 0;
 
-	if (p4d_large(*p4d))
+	if (p4d_leaf(*p4d))
 		return spurious_kernel_fault_check(error_code, (pte_t *) p4d);
 
 	pud = pud_offset(p4d, address);
diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index ebdbcae48011..d691e7992a9a 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1197,7 +1197,7 @@ remove_p4d_table(p4d_t *p4d_start, unsigned long addr, unsigned long end,
 		if (!p4d_present(*p4d))
 			continue;
 
-		BUILD_BUG_ON(p4d_large(*p4d));
+		BUILD_BUG_ON(p4d_leaf(*p4d));
 
 		pud_base = pud_offset(p4d, 0);
 		remove_pud_table(pud_base, addr, next, altmap, direct);
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index e9b448d1b1b7..5359a9c88099 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -676,7 +676,7 @@ pte_t *lookup_address_in_pgd(pgd_t *pgd, unsigned long address,
 		return NULL;
 
 	*level = PG_LEVEL_512G;
-	if (p4d_large(*p4d) || !p4d_present(*p4d))
+	if (p4d_leaf(*p4d) || !p4d_present(*p4d))
 		return (pte_t *)p4d;
 
 	pud = pud_offset(p4d, address);
@@ -739,7 +739,7 @@ pmd_t *lookup_pmd_address(unsigned long address)
 		return NULL;
 
 	p4d = p4d_offset(pgd, address);
-	if (p4d_none(*p4d) || p4d_large(*p4d) || !p4d_present(*p4d))
+	if (p4d_none(*p4d) || p4d_leaf(*p4d) || !p4d_present(*p4d))
 		return NULL;
 
 	pud = pud_offset(p4d, address);
diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
index 669ba1c345b3..dc0a81f5f60e 100644
--- a/arch/x86/mm/pti.c
+++ b/arch/x86/mm/pti.c
@@ -206,7 +206,7 @@ static pmd_t *pti_user_pagetable_walk_pmd(unsigned long address)
 	if (!p4d)
 		return NULL;
 
-	BUILD_BUG_ON(p4d_large(*p4d) != 0);
+	BUILD_BUG_ON(p4d_leaf(*p4d) != 0);
 	if (p4d_none(*p4d)) {
 		unsigned long new_pud_page = __get_free_page(gfp);
 		if (WARN_ON_ONCE(!new_pud_page))
diff --git a/arch/x86/power/hibernate.c b/arch/x86/power/hibernate.c
index 6f955eb1e163..28153789f873 100644
--- a/arch/x86/power/hibernate.c
+++ b/arch/x86/power/hibernate.c
@@ -165,7 +165,7 @@ int relocate_restore_code(void)
 	pgd = (pgd_t *)__va(read_cr3_pa()) +
 		pgd_index(relocated_restore_code);
 	p4d = p4d_offset(pgd, relocated_restore_code);
-	if (p4d_large(*p4d)) {
+	if (p4d_leaf(*p4d)) {
 		set_p4d(p4d, __p4d(p4d_val(*p4d) & ~_PAGE_NX));
 		goto out;
 	}
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index e21974f2cf2d..12a43a4abebf 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -1104,7 +1104,7 @@ static void __init xen_cleanmfnmap_p4d(p4d_t *p4d, bool unpin)
 	pud_t *pud_tbl;
 	int i;
 
-	if (p4d_large(*p4d)) {
+	if (p4d_leaf(*p4d)) {
 		pa = p4d_val(*p4d) & PHYSICAL_PAGE_MASK;
 		xen_free_ro_pages(pa, P4D_SIZE);
 		return;
-- 
2.43.0

