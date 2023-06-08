Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CBF7287ED
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 21:15:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcYng12rBz3f0s
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 05:15:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=2n/XtD7A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=2n/XtD7A;
	dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcYmp078cz3dy9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 05:14:33 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-bacfb7acdb7so1065652276.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 12:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686251670; x=1688843670;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hqbvyW6crf6toTfKG311uSxHzLZVjYgM3m9zpPIhyDA=;
        b=2n/XtD7AqYzwMObmNTcTXdhdmtrivr6xS0a6hxh2028Gq3sNV9XO29gB5O2y3L9l/t
         L2rqH6x4Pz17FgKoR1Y4rQPo+pjlVHFvq4Uxf6V5Z1hVLY+dk3dbsKixOg2g0+O6MH3o
         wHR7UhzFBUpyNSTJP8nVTqWIyYA0el7GHtc3GU+0DrUYPDVBZCtJf3wyrCUqLLZR09lv
         VqBAJ8/LNlL6ViTV2apFi54AS+jw7a1Zjo/eBl1kmHqeluHIV3N/nqy10dITHeklJsgD
         IGKWlS4umLi9ypWs+T7OEHIYU3YkWJ3FbGyXJ6NMN9TADYksX23kqJlAINxQPvIJDTtX
         gwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686251670; x=1688843670;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hqbvyW6crf6toTfKG311uSxHzLZVjYgM3m9zpPIhyDA=;
        b=U7WuhUuehfJEQ7tNxCLwUbN7s1+ommtKQycfpfSWjdkcmgTtnZVcnBSbYHY8OuDeDZ
         XP+eVg8rAmA21K4acczNUnSv6VJ2A2TRQr3Pbx2fSCSIEz0J4TH2+f4exeg/k2Vx3Lp4
         BoHMs3yQMogKR0QuNv6xqWc3taljagEhZmL3SkTIOu2iyNfkfyeMIcQy2BgmWSUx/eQ2
         E8RlxzB+NtLHtx6eDv31fYauCOZ72nqYn5WP7ePQsr/a5MB4HDX+0/Bj3iOWZf9BpY9h
         yJqH0IPKkFNz6JR00Vsd1O4QEgmsMda5gWTjCFLhkOCvNMprs9KwSU6T3dkVtVBL2Klh
         UMGA==
X-Gm-Message-State: AC+VfDy43MhdXFKzEoGn3gV66FlDWRg5MzpGK6gV4jFOsE38M8GuI8w8
	fo0805TkaTsZQlqZ2zAnc3FPrg==
X-Google-Smtp-Source: ACHHUZ7aUiIh5IKg+O5kgdrTnFDUinQat6T8kg6GewL/1W4sBHj9jDkDghROqTlVL3SjDvy6zEmR9Q==
X-Received: by 2002:a25:e302:0:b0:bb1:5a06:70ed with SMTP id z2-20020a25e302000000b00bb15a0670edmr543635ybd.19.1686251670430;
        Thu, 08 Jun 2023 12:14:30 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id e10-20020a25874a000000b00b9e5b28dbd8sm429689ybn.17.2023.06.08.12.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:14:29 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:14:26 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 04/23] ia64/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <1c2c7837-bfea-9640-a74-985379fcc5a@google.com>
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

pte_alloc_map() expects to be followed by pte_unmap(), but hugetlb omits
that: to keep balance in future, use the recently added pte_alloc_huge()
instead; with pte_offset_huge() a better name for pte_offset_kernel().

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/ia64/mm/hugetlbpage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/ia64/mm/hugetlbpage.c b/arch/ia64/mm/hugetlbpage.c
index 78a02e026164..adc49f2d22e8 100644
--- a/arch/ia64/mm/hugetlbpage.c
+++ b/arch/ia64/mm/hugetlbpage.c
@@ -41,7 +41,7 @@ huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 	if (pud) {
 		pmd = pmd_alloc(mm, pud, taddr);
 		if (pmd)
-			pte = pte_alloc_map(mm, pmd, taddr);
+			pte = pte_alloc_huge(mm, pmd, taddr);
 	}
 	return pte;
 }
@@ -64,7 +64,7 @@ huge_pte_offset (struct mm_struct *mm, unsigned long addr, unsigned long sz)
 			if (pud_present(*pud)) {
 				pmd = pmd_offset(pud, taddr);
 				if (pmd_present(*pmd))
-					pte = pte_offset_map(pmd, taddr);
+					pte = pte_offset_huge(pmd, taddr);
 			}
 		}
 	}
-- 
2.35.3

