Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AD730E8DB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 01:48:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWKfj5dLlzDwp2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 11:48:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=Znfo8mm+; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWKcV65cRzDwmj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 11:46:34 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F2B564E0F;
 Thu,  4 Feb 2021 00:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1612399591;
 bh=kk2SY71wQnk+tZMbceKdNvyX71uxBiSYmaBP0zFObxU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Znfo8mm+bA7CbzZMWp7y4jagkqgtum6GzXCuMWyB4pQlg4P8lvhCsyEAMAO+EOxue
 yTvI9h1kw2TiAh6eNGGKdKJmijF7vS9+Y2iaMJqez0KImdqlAZHGep9DvpLeu+MpEi
 IXR9tTYaSnutVlWXYYdF6kThEd6bUmxMzFjlwznM=
Date: Wed, 3 Feb 2021 16:46:30 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] mm/memory.c: Remove pte_sw_mkyoung()
Message-Id: <20210203164630.ada46d0c84e0e9f0a474b283@linux-foundation.org>
In-Reply-To: <f302ef92c48d1f08a0459aaee1c568ca11213814.1612345700.git.christophe.leroy@csgroup.eu>
References: <f302ef92c48d1f08a0459aaee1c568ca11213814.1612345700.git.christophe.leroy@csgroup.eu>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jia He <justin.he@arm.com>, linux-kernel@vger.kernel.org,
 Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed,  3 Feb 2021 10:19:44 +0000 (UTC) Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Commit 83d116c53058 ("mm: fix double page fault on arm64 if PTE_AF
> is cleared") introduced arch_faults_on_old_pte() helper to identify
> platforms that don't set page access bit in HW and require a page
> fault to set it.
> 
> Commit 44bf431b47b4 ("mm/memory.c: Add memory read privilege on page
> fault handling") added pte_sw_mkyoung() which is yet another way to
> manage platforms that don't set page access bit in HW and require a
> page fault to set it.
> 
> Remove that pte_sw_mkyoung() helper and use the already existing
> arch_faults_on_old_pte() helper together with pte_mkyoung() instead.

This conflicts with mm/memory.c changes in linux-next.  In
do_set_pte().  Please check my efforts:

--- a/arch/mips/include/asm/pgtable.h~mm-memoryc-remove-pte_sw_mkyoung
+++ a/arch/mips/include/asm/pgtable.h
@@ -406,8 +406,6 @@ static inline pte_t pte_mkyoung(pte_t pt
 	return pte;
 }
 
-#define pte_sw_mkyoung	pte_mkyoung
-
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 static inline int pte_huge(pte_t pte)	{ return pte_val(pte) & _PAGE_HUGE; }
 
--- a/include/linux/pgtable.h~mm-memoryc-remove-pte_sw_mkyoung
+++ a/include/linux/pgtable.h
@@ -424,22 +424,6 @@ static inline void ptep_set_wrprotect(st
 }
 #endif
 
-/*
- * On some architectures hardware does not set page access bit when accessing
- * memory page, it is responsibilty of software setting this bit. It brings
- * out extra page fault penalty to track page access bit. For optimization page
- * access bit can be set during all page fault flow on these arches.
- * To be differentiate with macro pte_mkyoung, this macro is used on platforms
- * where software maintains page access bit.
- */
-#ifndef pte_sw_mkyoung
-static inline pte_t pte_sw_mkyoung(pte_t pte)
-{
-	return pte;
-}
-#define pte_sw_mkyoung	pte_sw_mkyoung
-#endif
-
 #ifndef pte_savedwrite
 #define pte_savedwrite pte_write
 #endif
--- a/mm/memory.c~mm-memoryc-remove-pte_sw_mkyoung
+++ a/mm/memory.c
@@ -2902,7 +2902,8 @@ static vm_fault_t wp_page_copy(struct vm
 		}
 		flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
 		entry = mk_pte(new_page, vma->vm_page_prot);
-		entry = pte_sw_mkyoung(entry);
+		if (arch_faults_on_old_pte())
+			entry = pte_mkyoung(entry);
 		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
 
 		/*
@@ -3560,7 +3561,8 @@ static vm_fault_t do_anonymous_page(stru
 	__SetPageUptodate(page);
 
 	entry = mk_pte(page, vma->vm_page_prot);
-	entry = pte_sw_mkyoung(entry);
+	if (arch_faults_on_old_pte())
+		entry = pte_mkyoung(entry);
 	if (vma->vm_flags & VM_WRITE)
 		entry = pte_mkwrite(pte_mkdirty(entry));
 
@@ -3745,8 +3747,8 @@ void do_set_pte(struct vm_fault *vmf, st
 
 	if (prefault && arch_wants_old_prefaulted_pte())
 		entry = pte_mkold(entry);
-	else
-		entry = pte_sw_mkyoung(entry);
+	else if (arch_faults_on_old_pte())
+		entry = pte_mkyoung(entry);
 
 	if (write)
 		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
_

