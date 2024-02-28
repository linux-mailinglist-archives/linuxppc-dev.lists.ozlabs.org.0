Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCF586AA87
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 09:56:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ep3i+90u;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dPA4JCP9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tl7W52wvSz3vdV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 19:56:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ep3i+90u;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dPA4JCP9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tl7Ss3Mpvz3d2N
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 19:54:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709110458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnT5L9L6w21lKd8yQkJVObKwVcge77cGSeo5m2W2yic=;
	b=ep3i+90unqc/7AtoyoOidPjS4nJwjOh7644vwWKD8e3ooWgsIW0NHGZgFBWsBWzjrAQI1W
	QAlL+3lUp6q9lZZ4VEu8YtJCaRGknebV7ef+l//U7i4scYulmiDfpSMvtLjk0a/6gK/7+Q
	wC3oI6gViroWpSGl4yrYVBT3mRptzyY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709110459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jnT5L9L6w21lKd8yQkJVObKwVcge77cGSeo5m2W2yic=;
	b=dPA4JCP9jf6c/0zgrG55r1v4rzrZw+0lRob0+aR3y0AcSkuMkD3NfRUcRVUaRiXAR+PT4I
	yWswxbb9nTjtsv1d2lmxr/LHC19ehpdamd0okfK9AvMu2KP01VkzKZbryHbEWcYWSsd5v3
	acw9LHwg85B0QNaj4v7UJgywWimORiA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-224-Fv_6LmWZM7-vrv7YNUZ9hA-1; Wed,
 28 Feb 2024 03:54:15 -0500
X-MC-Unique: Fv_6LmWZM7-vrv7YNUZ9hA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FC341C0CCB9;
	Wed, 28 Feb 2024 08:54:14 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7920D200A382;
	Wed, 28 Feb 2024 08:54:07 +0000 (UTC)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 2/5] mm/x86: Replace p4d_large() with p4d_leaf()
Date: Wed, 28 Feb 2024 16:53:47 +0800
Message-ID: <20240228085350.520953-3-peterx@redhat.com>
In-Reply-To: <20240228085350.520953-1-peterx@redhat.com>
References: <20240228085350.520953-1-peterx@redhat.com>
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

