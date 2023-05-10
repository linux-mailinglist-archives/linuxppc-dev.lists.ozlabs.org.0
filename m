Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AABE6FD5CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 07:04:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGNHL0RPQz3fc3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 15:04:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=f+IDJIOx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=f+IDJIOx;
	dkim-atps=neutral
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGNGV2Zzbz3bfk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 15:03:46 +1000 (AEST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-55a79671a4dso104271147b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 May 2023 22:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683695024; x=1686287024;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mCwP+3tlZqvvMSbN25I242CI8N2o4w3/6RVIlVlj13g=;
        b=f+IDJIOxeE7pBv/ncUF3Dg8yBdNeigyWPgONUVZVc2EQnlwiXg/VQTMZqIyi1FwbhF
         hB12dPYWMlW78XVP1iXq4ueyFowA50D/X9k7kSng633zgtc6Ft9O69KyiELqvbNIUVet
         ZV3CNBYMAMk1NaEigxnnVZgnTZDfN2Zgt7qDs5DqEMg/xKQN3cvE2DpHKAZxvYja2q57
         EzxbR8ATmL4FQRq126r5Vter9+9PB+pvzYqq8Q0Kq08+IAz0Ct1bpmRKsD6HzoQSgfyW
         CVzetCsMpC4GogX7r4Ise+/fDJ+qVHJTfa1OEDnQ873jx9nxbHKiO6uVblFCp5x/gnEx
         bWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683695024; x=1686287024;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mCwP+3tlZqvvMSbN25I242CI8N2o4w3/6RVIlVlj13g=;
        b=QyGA3eeN5YPWFfpWAs7gpV4POIvFDgwmi6tTpWPqOpRWh7OesFPswrYiMZ3EmHL62w
         t1tYOtTtpP3kEAbmeUxpwAfQNyWPX83DEbZRBbMboWNxdE3NjLhzOMa5Q196Ta2v7uLg
         /DL2Ejd2LO7JWbb2GBfpJ4bheK3WVnJ2jy9B5ZdSC9+iBR0q5/ai5tMPTe3znvygm78G
         s6+gWQMUxP1LO0Uc5uaxEwNTk7NsohsPE0N3chWnxSUCpwTF8OEPwTyAPhob3B96sBeL
         0c67Cu2kT1bJ317Iw0F8Q1q7CbumyvsZDcXOH2kEIbEaupMJl69kiNxFFiSDeYAhN2Nw
         Bj4w==
X-Gm-Message-State: AC+VfDyVhjK51/Sx+rZs2WFdnJJuNKZUFVNucJRwYNEi1joEv051av9o
	FLR2Rbym0uu++idFv43VvUsUdQ==
X-Google-Smtp-Source: ACHHUZ57BibEP8l5nJ6F5+RjmWOH1yRU/GU0ORzVTyycrrSkC73g/4H986WkI3WYpSdD5+TSi7jmbQ==
X-Received: by 2002:a81:6c42:0:b0:55a:1022:7814 with SMTP id h63-20020a816c42000000b0055a10227814mr19292393ywc.28.1683695023901;
        Tue, 09 May 2023 22:03:43 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id i189-20020a816dc6000000b005463239c01esm3871312ywc.51.2023.05.09.22.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 22:03:43 -0700 (PDT)
Date: Tue, 9 May 2023 22:03:39 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 17/23] sh/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <85eeffe5-95f2-2574-365e-c9af663c8672@google.com>
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
 arch/sh/mm/hugetlbpage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sh/mm/hugetlbpage.c b/arch/sh/mm/hugetlbpage.c
index 999ab5916e69..6cb0ad73dbb9 100644
--- a/arch/sh/mm/hugetlbpage.c
+++ b/arch/sh/mm/hugetlbpage.c
@@ -38,7 +38,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 			if (pud) {
 				pmd = pmd_alloc(mm, pud, addr);
 				if (pmd)
-					pte = pte_alloc_map(mm, pmd, addr);
+					pte = pte_alloc_huge(mm, pmd, addr);
 			}
 		}
 	}
@@ -63,7 +63,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 			if (pud) {
 				pmd = pmd_offset(pud, addr);
 				if (pmd)
-					pte = pte_offset_map(pmd, addr);
+					pte = pte_offset_huge(pmd, addr);
 			}
 		}
 	}
-- 
2.35.3

