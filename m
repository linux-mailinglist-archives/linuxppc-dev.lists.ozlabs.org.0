Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BD56FD5D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 07:05:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGNJf4ktKz3fcq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 15:05:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=QuBkLiQN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=QuBkLiQN;
	dkim-atps=neutral
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGNHm6FJWz3bfk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 15:04:52 +1000 (AEST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-55a010774a5so104213437b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 May 2023 22:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683695090; x=1686287090;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LRrENG7fj4nSEA3qiqmp7KZ6RwcG7U0j5SldGyBNlNI=;
        b=QuBkLiQNgKJXlZ/XtUu/Zcc1TO/yNvtmxeCEZWPuo0Ut+/Dr2uj7N/fYaVeLSLWaoT
         dm0LsrTZl+fdsuIU70XZlX8Jdat219pOrdD5tmXxlOJq6I9xvJ8OBX2I3sC2/GzC7pIG
         XUtWl6K8CddosokWCD5JWnq8C0Qt/Y0GNquPBcUW8sOkTJGqV76KRSYlIi1jOPSqgjjT
         xhQu7yGeLyA8b6NgZMivw3GAn6e1+z3lgr3LgyDkQncSxt5H12sTmgDyT6BBdhQ0rxwG
         mDoCtTBYmNMU6XzQs1MJn/66oGLzS3WRb3BIObV6fJVnQHGlEpGSXCP7I8vkrI+sg4mt
         TgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683695090; x=1686287090;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRrENG7fj4nSEA3qiqmp7KZ6RwcG7U0j5SldGyBNlNI=;
        b=ZerpQR82zE3UJfSdobKtYuOMXVUkDuotq1tFKJaabIi4NYou8kIgn9p6WjfCEV4+4C
         4Wmut/myjONKIBj58bahxCyX8YBzw+v20njnDpmC++2Lxp1tLaY9RpEtfRbDxpIa2tLj
         3WfuaGT2tk/EA4QBZSzA8x8omcuPZ7v6Wve6x+EnyocoVuYpC/nxKc7h6lPRVGnHXA7I
         1V4d2666Tr89NtTeyFek7uOQWqkAdapOYBKE9tPqlAt5FUPTe2ocWUG3YSMItdzujM8c
         ibVjctrbcrmi8f/sDrVvNfiJ0CFjKsw/N2+aKuoYfPd5+hgn0zGvwWwTgzw7T4SugcqJ
         jBxQ==
X-Gm-Message-State: AC+VfDz2x7MCVQK8JVBxhUusPjYeAPWTYpf8S2rwBRbGg8K+EdQDmkCC
	1rgOUXXcgK/elZaiIU/dBhsD0A==
X-Google-Smtp-Source: ACHHUZ53GGioj5bo+FVmOpbhwfbbVyWZfbgJBuIz6ozNT3hKZWLtYauVGFRQKbnj4naBNbfMS7YmUw==
X-Received: by 2002:a81:488c:0:b0:55a:6769:1197 with SMTP id v134-20020a81488c000000b0055a67691197mr18307004ywa.41.1683695090358;
        Tue, 09 May 2023 22:04:50 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id z184-20020a8189c1000000b00560beb1c97bsm948270ywf.97.2023.05.09.22.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 22:04:50 -0700 (PDT)
Date: Tue, 9 May 2023 22:04:46 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 18/23] sparc/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <da29d71e-111-65d5-eb7f-5ad97e406e70@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <mons
 tr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pte_alloc_map() expects to be followed by pte_unmap(), but hugetlb omits
that: to keep balance in future, use the recently added pte_alloc_huge()
instead; with pte_offset_huge() a better name for pte_offset_kernel().

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/sparc/mm/hugetlbpage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/mm/hugetlbpage.c b/arch/sparc/mm/hugetlbpage.c
index d8e0e3c7038d..d7018823206c 100644
--- a/arch/sparc/mm/hugetlbpage.c
+++ b/arch/sparc/mm/hugetlbpage.c
@@ -298,7 +298,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 		return NULL;
 	if (sz >= PMD_SIZE)
 		return (pte_t *)pmd;
-	return pte_alloc_map(mm, pmd, addr);
+	return pte_alloc_huge(mm, pmd, addr);
 }
 
 pte_t *huge_pte_offset(struct mm_struct *mm,
@@ -325,7 +325,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 		return NULL;
 	if (is_hugetlb_pmd(*pmd))
 		return (pte_t *)pmd;
-	return pte_offset_map(pmd, addr);
+	return pte_offset_huge(pmd, addr);
 }
 
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
-- 
2.35.3

