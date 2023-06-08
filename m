Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4030772881B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 21:19:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcYtY0BW0z3ffZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 05:19:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=HEwZycAE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=HEwZycAE;
	dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcYsd0W2lz3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 05:18:43 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-ba81deea9c2so1060674276.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 12:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686251920; x=1688843920;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WLKDOkdQ4oq0ww1Vlfy/KRTEhctwBXtXyzZrgpalkvM=;
        b=HEwZycAEZshzMQG1RY6xWzkEzRNEN/UEaemUkYXNmWskdkmVKrA8S+97io6IqWp9/V
         /Ki/r1s4TSfiiefdOd1an7zeCiAQCXani7OPWb0Yu0dH1JXoMBV7ddckrsj8wmhXsvpX
         lxVVQwwTUjyQXS/CCeF4VIDT1g2/zM6/NDtUcqQOoZLozwlnlFrDor/PrqoADqkak2qo
         deaYgmKHf6xqfmf4KVoYNd/vj1wQpn8eoXEC4WQqeZC4WPbGo41LYWdy4IN4tXqheqG/
         6B0lxLrh+XpboJCYpvDK5+1gNhnxK8xFzRPNdKypeMnMcoGI/ayoAWXa0T/S7aKkyUXg
         eIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686251920; x=1688843920;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WLKDOkdQ4oq0ww1Vlfy/KRTEhctwBXtXyzZrgpalkvM=;
        b=P8OcOZ1wqJmaQAGlAL/nG//VjA+TK21F+MDVsfj06AEtsVwIAxvqoJeZ++duYOs5OX
         4bHCwwmsYXXDGZL/8c3fjzevhJLrAtZ8c+VDi3WOwN8swti1n4Wwcx8+8dFz93yDe1lE
         6zNj/VvtviavbrWQ1BL4tp1mQLuazYWYoga6vhdyhj7KuoGvRc0eieoyRITXXEYP2g4e
         RdX/HqXRAATH5inuDGyh+Soj2HcovVePRUxddFnMGhgwT9Cur3dKolLvR3BU7bJ3tFZy
         4rlojS6UeszntSfRset8vzVV/pD7x1yrQ6Y4E9T5IR3AqLWafSeKV3yP3hxmdso0sSTo
         rTfQ==
X-Gm-Message-State: AC+VfDzGzpm2gn+M0cNPsnKz5LOcpa49cNjH412dSGrhdQTLXRYcTZd3
	XqTCWSich83T+h8UGAInzrdaQw==
X-Google-Smtp-Source: ACHHUZ78uQ3KAa2UlmiLkPkJ1ItAoVICWyvDzVcoJt54uwUIKvQ1XvbxMYD2Oe7/oQdSR2X0isfU0g==
X-Received: by 2002:a25:e307:0:b0:ba8:7f98:4afa with SMTP id z7-20020a25e307000000b00ba87f984afamr579046ybd.26.1686251920409;
        Thu, 08 Jun 2023 12:18:40 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 22-20020a250316000000b00bb2f5dda19bsm432908ybd.47.2023.06.08.12.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:18:39 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:18:35 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 08/23] parisc: add pte_unmap() to balance get_ptep()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <653369-95ef-acd2-d6ea-e95f5a997493@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, C
 hris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To keep balance in future, remember to pte_unmap() after a successful
get_ptep().  And act as if flush_cache_pages() really needs a map there,
to read the pfn before "unmapping", to be sure page table is not removed.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/parisc/kernel/cache.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/kernel/cache.c b/arch/parisc/kernel/cache.c
index ca4a302d4365..501160250bb7 100644
--- a/arch/parisc/kernel/cache.c
+++ b/arch/parisc/kernel/cache.c
@@ -426,10 +426,15 @@ void flush_dcache_page(struct page *page)
 		offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
 		addr = mpnt->vm_start + offset;
 		if (parisc_requires_coherency()) {
+			bool needs_flush = false;
 			pte_t *ptep;
 
 			ptep = get_ptep(mpnt->vm_mm, addr);
-			if (ptep && pte_needs_flush(*ptep))
+			if (ptep) {
+				needs_flush = pte_needs_flush(*ptep);
+				pte_unmap(ptep);
+			}
+			if (needs_flush)
 				flush_user_cache_page(mpnt, addr);
 		} else {
 			/*
@@ -561,14 +566,20 @@ EXPORT_SYMBOL(flush_kernel_dcache_page_addr);
 static void flush_cache_page_if_present(struct vm_area_struct *vma,
 	unsigned long vmaddr, unsigned long pfn)
 {
-	pte_t *ptep = get_ptep(vma->vm_mm, vmaddr);
+	bool needs_flush = false;
+	pte_t *ptep;
 
 	/*
 	 * The pte check is racy and sometimes the flush will trigger
 	 * a non-access TLB miss. Hopefully, the page has already been
 	 * flushed.
 	 */
-	if (ptep && pte_needs_flush(*ptep))
+	ptep = get_ptep(vma->vm_mm, vmaddr);
+	if (ptep) {
+		needs_flush = pte_needs_flush(*ptep);
+		pte_unmap(ptep);
+	}
+	if (needs_flush)
 		flush_cache_page(vma, vmaddr, pfn);
 }
 
@@ -635,17 +646,22 @@ static void flush_cache_pages(struct vm_area_struct *vma, unsigned long start, u
 	pte_t *ptep;
 
 	for (addr = start; addr < end; addr += PAGE_SIZE) {
+		bool needs_flush = false;
 		/*
 		 * The vma can contain pages that aren't present. Although
 		 * the pte search is expensive, we need the pte to find the
 		 * page pfn and to check whether the page should be flushed.
 		 */
 		ptep = get_ptep(vma->vm_mm, addr);
-		if (ptep && pte_needs_flush(*ptep)) {
+		if (ptep) {
+			needs_flush = pte_needs_flush(*ptep);
+			pfn = pte_pfn(*ptep);
+			pte_unmap(ptep);
+		}
+		if (needs_flush) {
 			if (parisc_requires_coherency()) {
 				flush_user_cache_page(vma, addr);
 			} else {
-				pfn = pte_pfn(*ptep);
 				if (WARN_ON(!pfn_valid(pfn)))
 					return;
 				__flush_cache_page(vma, addr, PFN_PHYS(pfn));
-- 
2.35.3

