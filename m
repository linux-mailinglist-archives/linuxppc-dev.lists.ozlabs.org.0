Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F06154C34
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 20:25:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48D7gh0qghzDqLv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 06:25:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=FnsFNy7q; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48D7bY1crzzDqYB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 06:21:59 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48D7bR5kC8z9txcP;
 Thu,  6 Feb 2020 20:21:55 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=FnsFNy7q; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id v0XWkAqMqL9I; Thu,  6 Feb 2020 20:21:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48D7bR48qpz9tx2C;
 Thu,  6 Feb 2020 20:21:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581016915; bh=fR04HRUXwg1sWVzHFRIjKuCirjdx7mzJ4CnZCEi2JNk=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=FnsFNy7q4MWwXztAQHY/4IMkqEyRuAKDe3GUpKRbiOorksqYkRlVMaIpMML8A1R8n
 fjpgH60RIvUBZ3UPisn1a266yvCz4TBtGgooqyZ0VghedxENrR7m6H/ze35mPqKBkV
 z8mcgzL/t+VS2hYD0sLqEoXiHTEhMx7YTMKqkW9Q=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C08488B8A5;
 Thu,  6 Feb 2020 20:21:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YCS103tFZWcr; Thu,  6 Feb 2020 20:21:55 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 765858B8A4;
 Thu,  6 Feb 2020 20:21:55 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 35929652B0; Thu,  6 Feb 2020 19:21:55 +0000 (UTC)
Message-Id: <53df932fadfab3ca442d503484cd999efeba1975.1581011735.git.christophe.leroy@c-s.fr>
In-Reply-To: <4ad03047ac61bfbdad3edb92542dedc807fc3cf4.1581011735.git.christophe.leroy@c-s.fr>
References: <4ad03047ac61bfbdad3edb92542dedc807fc3cf4.1581011735.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 2/2] powerpc/8xx: Make 8M hugepages also compatible with the
 512K pages slice
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 aneesh.kumar@linux.ibm.com
Date: Thu,  6 Feb 2020 19:21:55 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8xx, slices are used because hugepages (512k or 8M) and small
pages (4k or 16k) cannot share the same PGD entry. However, as 8M
entirely covers two PGD entries (One PGD entry covers 4M), there
will implicitely be no conflict between 8M pages and any other size.
So 8M is also compatible with the 512K page slices as well.

Handle 512K page slices as fallback compat mask for 8M pages.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/slice.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/mm/slice.c b/arch/powerpc/mm/slice.c
index dffe1a45b6ed..cb5b532d3d48 100644
--- a/arch/powerpc/mm/slice.c
+++ b/arch/powerpc/mm/slice.c
@@ -422,6 +422,8 @@ static inline void slice_andnot_mask(struct slice_mask *dst,
 
 #ifdef CONFIG_PPC_64K_PAGES
 #define MMU_PAGE_BASE	MMU_PAGE_64K
+#elif defined(CONFIG_PPC_16K_PAGES)
+#define MMU_PAGE_BASE	MMU_PAGE_16K
 #else
 #define MMU_PAGE_BASE	MMU_PAGE_4K
 #endif
@@ -514,9 +516,19 @@ unsigned long slice_get_unmapped_area(unsigned long addr, unsigned long len,
 	 * If we support combo pages, we can allow 64k pages in 4k slices
 	 * The mask copies could be avoided in most cases here if we had
 	 * a pointer to good mask for the next code to use.
+	 *
+	 * On 8xx, slices are used because hugepages (512k or 8M) and small
+	 * pages (4k or 16k) cannot share the same PGD entry. However, as 8M
+	 * entirely covers two PGD entries, there will implicitely be no
+	 * conflict between 8M pages and any other size. So 8M is compatible
+	 * with the 512k page slice as well.
 	 */
-	if (IS_ENABLED(CONFIG_PPC_64K_PAGES) && psize == MMU_PAGE_64K) {
-		compat_maskp = slice_mask_for_size(&mm->context, MMU_PAGE_4K);
+	if ((IS_ENABLED(CONFIG_PPC_64K_PAGES) && psize == MMU_PAGE_64K) ||
+	    (IS_ENABLED(CONFIG_PPC_8xx) && psize == MMU_PAGE_8M)) {
+		if (IS_ENABLED(CONFIG_PPC_8xx))
+			compat_maskp = slice_mask_for_size(&mm->context, MMU_PAGE_512K);
+		else
+			compat_maskp = slice_mask_for_size(&mm->context, MMU_PAGE_4K);
 		if (fixed)
 			slice_or_mask(&good_mask, maskp, compat_maskp);
 		else
@@ -593,9 +605,8 @@ unsigned long slice_get_unmapped_area(unsigned long addr, unsigned long len,
 	newaddr = slice_find_area(mm, len, &potential_mask,
 				  psize, topdown, high_limit);
 
-	if (IS_ENABLED(CONFIG_PPC_64K_PAGES) && newaddr == -ENOMEM &&
-	    psize == MMU_PAGE_64K) {
-		/* retry the search with 4k-page slices included */
+	if (compat_maskp && newaddr == -ENOMEM) {
+		/* retry the search with compatible slices included */
 		slice_or_mask(&potential_mask, &potential_mask, compat_maskp);
 		newaddr = slice_find_area(mm, len, &potential_mask,
 					  psize, topdown, high_limit);
@@ -767,12 +778,16 @@ int slice_is_hugepage_only_range(struct mm_struct *mm, unsigned long addr,
 
 	maskp = slice_mask_for_size(&mm->context, psize);
 
-	/* We need to account for 4k slices too */
-	if (IS_ENABLED(CONFIG_PPC_64K_PAGES) && psize == MMU_PAGE_64K) {
+	/* We need to account for compatible slices too */
+	if ((IS_ENABLED(CONFIG_PPC_64K_PAGES) && psize == MMU_PAGE_64K) ||
+	    (IS_ENABLED(CONFIG_PPC_8xx) && psize == MMU_PAGE_8M)) {
 		const struct slice_mask *compat_maskp;
 		struct slice_mask available;
 
-		compat_maskp = slice_mask_for_size(&mm->context, MMU_PAGE_4K);
+		if (IS_ENABLED(CONFIG_PPC_8xx))
+			compat_maskp = slice_mask_for_size(&mm->context, MMU_PAGE_512K);
+		else
+			compat_maskp = slice_mask_for_size(&mm->context, MMU_PAGE_4K);
 		slice_or_mask(&available, maskp, compat_maskp);
 		return !slice_check_range_fits(mm, &available, addr, len);
 	}
-- 
2.25.0

