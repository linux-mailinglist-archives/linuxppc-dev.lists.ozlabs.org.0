Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 656326FD547
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 06:48:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGMwL5JSwz3fZj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 14:48:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=o+pw/Fxe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=o+pw/Fxe;
	dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGMvW4PMJz3c4w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 14:47:19 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-b9246a5f3feso10156290276.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 May 2023 21:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683694036; x=1686286036;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hqbvyW6crf6toTfKG311uSxHzLZVjYgM3m9zpPIhyDA=;
        b=o+pw/FxefUIAOoasXSGcewgZKtzCiK6gey4asLS52yE6RcSKCLcg/5+Oke4t4tL5mt
         WY+uEeh7LusBVdVQVoeJLXBzhVEJAgg/+wrnr5YnLWD3Y+xgGcCb1JLs6JvP8/f0rR6I
         tOIJAEnPqeFziCHRIMxBgLXFbcRpC1yoUKiEwz+VxRsKMOaCzI+eqG6JH5jyJ802ZkSp
         N+BiAknrKD5ka0lvzxWcjKQzAZAWQASg3Zoa2F4mVxsPlzCTR7qCguvvguU/AtX+AHcL
         WDe1lJ7cP45MCFknO9sG2YoZVBoQ/kny4LfOudEYqHVSkK2nfJ78GhDEjEHbvmzj6Rt9
         PQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683694036; x=1686286036;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hqbvyW6crf6toTfKG311uSxHzLZVjYgM3m9zpPIhyDA=;
        b=BXzaRqrfYrLukgsPIUiuM/UJ7MLi40DHPqF80Sjy/Kzi7xXG1xLs8J2msJDlZRrdvp
         zNZgq1snNhpkbiLjKUAm/qSDRczUehxBngfHgtB9Khn08QGOkJ8nDHTJH5nv9mncvX9U
         K4IKKvFohKB9zRE9no8PqKo2nqdjzU5mCjX2D8ax3ncAmOE+/Fq4B+rCAlU+L4qY4tSu
         R2PIWShWpvPAa9iEv13Zs2XFDmk0SacwxdAQoTE90z2qR33tjlEG0c0jLuCl+5zy5udT
         1P4SuJwMAfXErsmNEVZlTD2N9tqRBs/0qqXp/TS2HDXLUkxMv0yEWa95iakX99N5qO5I
         tWNA==
X-Gm-Message-State: AC+VfDzyBUgMKmublQSx3dtHCEjcP4ePLQ8OQXWh9ZblIkL/22jywKBL
	ZhQIMmYMMFRLAuNK5VHrslmR6Q==
X-Google-Smtp-Source: ACHHUZ7chwpqHYv2bkU0Ao/t6DWECrNjxiYg/IB0spMttiifVb5o/XZ8DrM/lCVX0msD4U/PtCIM9g==
X-Received: by 2002:a05:6902:1883:b0:b9d:58d9:8c with SMTP id cj3-20020a056902188300b00b9d58d9008cmr22251628ybb.11.1683694035986;
        Tue, 09 May 2023 21:47:15 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 185-20020a2506c2000000b00b9dc4620f95sm3505720ybg.6.2023.05.09.21.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:47:15 -0700 (PDT)
Date: Tue, 9 May 2023 21:47:11 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 04/23] ia64/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <baef2acf-7368-79a-a27-a87c2f2dfcb@google.com>
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

