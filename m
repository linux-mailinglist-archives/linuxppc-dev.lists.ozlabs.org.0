Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DF87322F8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 01:03:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=MJTZvP19;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhyX63KqGz3bt2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 09:03:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=MJTZvP19;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhyW85kcVz30fx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 09:02:59 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-bb3a77abd7bso44153276.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 16:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686870174; x=1689462174;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rocsqxxn2Z+cT1JHYvXfzCdKlHTpr3EP6mTFGVcBZg0=;
        b=MJTZvP19w7L3mwEdMeExhSCW1AUDkDcDZIGA09b4Lsgr6AlQ/Jre5s3pQVCVJJ7rQb
         5+EQMNtJaTaY+aRJKrCSqlImib7KZddKIew66TbvLd683FL9AyfE66fgz1T7BtZHDMm8
         2jNBCticE3VbvZxgnHDLhllKeMXxMDja6NYMekmWJVMnL0qXYLEhZcbBya6ztZKzets8
         eOxxHJ/YfIwfRnvaqFcbsGZUKRVZaOyJdqvanJIQ7D74NV/Gvoq+dfmVK1oXzh1JvH5P
         0RtdON+E/jvZHQ2QI/6IDa9W4KDnatFP6KwfH05hk8Ymf0ujYFguYsacUpxAce6WF76M
         r8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686870174; x=1689462174;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rocsqxxn2Z+cT1JHYvXfzCdKlHTpr3EP6mTFGVcBZg0=;
        b=ghM9gyFLcBDsNBFyHCTWmg7hTNzE9EDlEWztHQkhnjP6VZdODIjR8XLhRbZegGgu78
         4oynO2LCpKvUny1sJL1zSXG6I8GNEYXUO/K/JyHb97cSMYSXik4PqRSqSL1zeVMgBn2d
         n3Q5ujXjFjmsp0OwrNN6KOF1WLhc5f924X6TUc34IaSJ282q5sE0k9HI4HAFiaUeNerm
         idYQWxIHH0fqCJaOovt2tXdJ45XQJG7aFJuncknyqb7K8xiiCHdv5gMZCGbMZqiGjaiA
         faxCSUtenydJl31iTfF6+R78ihlw8UpvpqWTmzaGgZpsNZxqbFKC7Na6P2fB0nkW6+jy
         RrOA==
X-Gm-Message-State: AC+VfDwgfO6OfuNrJDPeCxnV3t0dsPRm33ZGYJmUeRTZwi4m4RBocJA4
	lNPH80c1w3pDAa7u0gjI0uA1bg==
X-Google-Smtp-Source: ACHHUZ4yNZeWVfFpqfOHWwVeKQ0LO1X5XLl6oMWM14BiamATBX7pt4vwNxCwa9vlqY3LDt6NBppgPg==
X-Received: by 2002:a81:7bd5:0:b0:56d:2dd6:c5b3 with SMTP id w204-20020a817bd5000000b0056d2dd6c5b3mr138534ywc.31.1686870174477;
        Thu, 15 Jun 2023 16:02:54 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id w6-20020a0ded06000000b0056d2a19ad91sm2857020ywe.103.2023.06.15.16.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 16:02:54 -0700 (PDT)
Date: Thu, 15 Jun 2023 16:02:43 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 07/23 replacement] mips: add pte_unmap() to balance
 pte_offset_map()
In-Reply-To: <76b41825-30fa-b9e8-d043-2affcba24317@google.com>
Message-ID: <addfcb3-b5f4-976e-e050-a2508e589cfe@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com> <178970b0-1539-8aac-76fd-972c6c46ec17@google.com> <20230614231758.GA1503611@dev-arch.thelio-3990X> <f5526f17-9d78-f7ea-427a-7e76bfeb6b8@google.com> <344a4da-3890-45fd-607e-b5f85ca6ad48@google.com>
 <20230615155059.GB3665766@dev-arch.thelio-3990X> <76b41825-30fa-b9e8-d043-2affcba24317@google.com>
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To keep balance in future, __update_tlb() remember to pte_unmap() after
pte_offset_map().  This is an odd case, since the caller has already done
pte_offset_map_lock(), then mips forgets the address and recalculates it;
but my two naive attempts to clean that up did more harm than good.

Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Hugh Dickins <hughd@google.com>
---
Andrew, please replace my mips patch, and its build warning fix patch,
in mm-unstable by this less ambitious but working replacement - thanks.

 arch/mips/mm/tlb-r4k.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/mips/mm/tlb-r4k.c b/arch/mips/mm/tlb-r4k.c
index 1b939abbe4ca..93c2d695588a 100644
--- a/arch/mips/mm/tlb-r4k.c
+++ b/arch/mips/mm/tlb-r4k.c
@@ -297,7 +297,7 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 	p4d_t *p4dp;
 	pud_t *pudp;
 	pmd_t *pmdp;
-	pte_t *ptep;
+	pte_t *ptep, *ptemap = NULL;
 	int idx, pid;
 
 	/*
@@ -344,7 +344,12 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 	} else
 #endif
 	{
-		ptep = pte_offset_map(pmdp, address);
+		ptemap = ptep = pte_offset_map(pmdp, address);
+		/*
+		 * update_mmu_cache() is called between pte_offset_map_lock()
+		 * and pte_unmap_unlock(), so we can assume that ptep is not
+		 * NULL here: and what should be done below if it were NULL?
+		 */
 
 #if defined(CONFIG_PHYS_ADDR_T_64BIT) && defined(CONFIG_CPU_MIPS32)
 #ifdef CONFIG_XPA
@@ -373,6 +378,9 @@ void __update_tlb(struct vm_area_struct * vma, unsigned long address, pte_t pte)
 	tlbw_use_hazard();
 	htw_start();
 	flush_micro_tlb_vm(vma);
+
+	if (ptemap)
+		pte_unmap(ptemap);
 	local_irq_restore(flags);
 }
 
-- 
2.35.3

