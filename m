Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 414386FD53D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 06:46:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGMtz4Fc4z3fYX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 14:46:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=X3r36dHH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=X3r36dHH;
	dkim-atps=neutral
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGMt53Z8Vz3bTJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 14:46:04 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-55a5a830238so62370297b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 May 2023 21:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683693961; x=1686285961;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Y3cIigX+Nl9tLTZ0FqCTIXHUTdUKJPmRsHmBn2kODQ=;
        b=X3r36dHHiJLgvp7jU0d4K3JzjfQ3mFZ409XlDfQRUNXPcZqJbsAuZzM3s3dqfqjzC7
         8KZfl7/K1d5O90p8GZrKYknrba26nw1LDXST+K7c2aBIUL4D4zJxqgAKfbG2qxu2Yo5u
         /0/dJOnRitUjxODeANtGQgBQxAoaXYK9cmTYbd/KEH4Bma0mqugbvo9G65UfkX3CZvm4
         /qVdLnQuXbtkydB1O0CAPyBH6Uxg3CoJyNGPZLXWNXdI0kdPUkxDZks6+sU3ASKIjHEF
         kaGykgOemp+4zkq4W/ysBBuFcBH4LTuAgjoNUoWbJlUwxz7uYcWBFSnWP85ZFQDgSIRR
         fYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683693961; x=1686285961;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Y3cIigX+Nl9tLTZ0FqCTIXHUTdUKJPmRsHmBn2kODQ=;
        b=X+IXFZfpm4iinxZ7RtUFbRVYALG5WJyRCakzKJ8738d0pUR1F+k2uBNiVBWfoNHLOu
         7XvKXaeOtbaNHvp9G0wizsdk/3GOw3Z9XHiWCvtuTezI6gkf3AfylE36yrg9f3k2ifJ5
         uVbxEBpGPSU7ybCT2A6pzyEQD2nGIK0xZsaVr+aoBP2kFPdlw7MIcpRWbHJdzeaTsiXI
         5Ccx/xts7Eje0HGAPIHM2nWaEtjCcZjmvn/eg3LKacSryV3S/8cYNE+LzlTKs0vLkyvx
         nksljNQcyEZQmlVatDogk1HXd+GNjBft0+qnXSB/SNPcdtXm1TAbRsFbHU8frtWUVBWe
         44JA==
X-Gm-Message-State: AC+VfDw2WFT6oOF545j6kMPrNutph2VtiIYr7ituULuuYRAsbetDkY0y
	bjNcYaMfPuARAI/ZXabyRYosYw==
X-Google-Smtp-Source: ACHHUZ7XGWNGIkPY+5hFXQ4Kt5/NxLbXPMIaWsRvM1j0AuAelIXLbwAPwZwsOjvzazAJBFrFLzpKOA==
X-Received: by 2002:a0d:e242:0:b0:52e:f109:ba7a with SMTP id l63-20020a0de242000000b0052ef109ba7amr17438159ywe.51.1683693961209;
        Tue, 09 May 2023 21:46:01 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id s126-20020a815e84000000b0054c0c9e4043sm3833116ywb.95.2023.05.09.21.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:46:00 -0700 (PDT)
Date: Tue, 9 May 2023 21:45:57 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 03/23] arm64/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <dda2885-929b-c278-14e-5f447e9eec52@google.com>
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
 arch/arm64/mm/hugetlbpage.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 95364e8bdc19..21716c940682 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -307,14 +307,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 			return NULL;
 
 		WARN_ON(addr & (sz - 1));
-		/*
-		 * Note that if this code were ever ported to the
-		 * 32-bit arm platform then it will cause trouble in
-		 * the case where CONFIG_HIGHPTE is set, since there
-		 * will be no pte_unmap() to correspond with this
-		 * pte_alloc_map().
-		 */
-		ptep = pte_alloc_map(mm, pmdp, addr);
+		ptep = pte_alloc_huge(mm, pmdp, addr);
 	} else if (sz == PMD_SIZE) {
 		if (want_pmd_share(vma, addr) && pud_none(READ_ONCE(*pudp)))
 			ptep = huge_pmd_share(mm, vma, addr, pudp);
@@ -366,7 +359,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 		return (pte_t *)pmdp;
 
 	if (sz == CONT_PTE_SIZE)
-		return pte_offset_kernel(pmdp, (addr & CONT_PTE_MASK));
+		return pte_offset_huge(pmdp, (addr & CONT_PTE_MASK));
 
 	return NULL;
 }
-- 
2.35.3

