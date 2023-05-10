Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 796F36FD589
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 06:56:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGN5k1vwpz3fLQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 14:56:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=x62YCY0V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=x62YCY0V;
	dkim-atps=neutral
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGN4t6Jybz30Kr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 14:55:26 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-55aa1da9d4aso120954057b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 May 2023 21:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683694524; x=1686286524;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=alKFmwAdxdkIViw1WjkjX/OCKeQtR2IpGs2zcY6rd0M=;
        b=x62YCY0VbtXBlAlTlrXst8L8I4Klp5jHuIkAXWeopDmvUXAbp7vfKzA00bYNToXaoh
         jicsfIaPz1O7U+TdGvn8r6E/DcCNuMjdSP+L+rcocZxL69l/kttcZnaGKZv3QHFP73NA
         pwziDs2dpT8TywS3eBGCmWf5OZTvKDvRn5iqAcCmFi7ZDxOpEnJaXZsg4chuls0Conw6
         1BHyDKqM9ymKdiyVbkRMd5EkORJUOPu5k/Dt9X7/wDI/4JSqAZEDqusgNEXsSQSkAunQ
         L5ABejKB++Tm9XQd6rM3WeiGICDJg3QSoGYLUowekQIKv98a1U+1e3RQQ2gzWsEHyeuU
         f9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683694524; x=1686286524;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alKFmwAdxdkIViw1WjkjX/OCKeQtR2IpGs2zcY6rd0M=;
        b=fzsEeJXkhTz5YjPiPgpW+tBVJz576kt7REDhUZT4sTJ0Z7+tZHeMiHyk45ir+70Eww
         1WkhsNYLhq0A/jqX/xk1y+p05hdeqvvHToiKJLSOTbgEnNuMXetG1tiCLzYTa9GOKZtC
         BpGt5qin/Sf3v8FP6cKxu2nYM/Hv6vxBoUivL+RvvAmFKeUgFu1rLLnPjL9Y9SYRulxp
         6Xu3MkJ7B8ZrNgw+K34u2elr4PlSwws9xdjKGQ0owAb5iNsgVwRTpnRqzYC82OGGI65w
         kd65b8RMrEQwCmIf55/uLI7+LWMHZbXIrOblAjg65x0zIJ2rgXpVzl8lf4w6HLOKXCJM
         jyOg==
X-Gm-Message-State: AC+VfDwimgV8xGSGx1A8P7R7r/CkFY5K1MNMx0nPoql2oduWZaEpDPU8
	xcLBzAY3LpMgavajOnsKgvbUkw==
X-Google-Smtp-Source: ACHHUZ64xP5yCWBSXd1pkCU9S6oVULY9BGDq0OyW51W97Dv6Ixjw6iQVWcUZjR+Rvr+uTi8eh8kq2A==
X-Received: by 2002:a0d:f545:0:b0:55a:ab98:a2ef with SMTP id e66-20020a0df545000000b0055aab98a2efmr17944134ywf.40.1683694524456;
        Tue, 09 May 2023 21:55:24 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id c1-20020a81df01000000b0055a29ec6504sm3793706ywn.81.2023.05.09.21.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:55:24 -0700 (PDT)
Date: Tue, 9 May 2023 21:55:20 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 10/23] parisc/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <8552705d-e0c1-a3a6-c26b-b887d4f61288@google.com>
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
 arch/parisc/mm/hugetlbpage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/mm/hugetlbpage.c b/arch/parisc/mm/hugetlbpage.c
index d1d3990b83f6..a8a1a7c1e16e 100644
--- a/arch/parisc/mm/hugetlbpage.c
+++ b/arch/parisc/mm/hugetlbpage.c
@@ -66,7 +66,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 	if (pud) {
 		pmd = pmd_alloc(mm, pud, addr);
 		if (pmd)
-			pte = pte_alloc_map(mm, pmd, addr);
+			pte = pte_alloc_huge(mm, pmd, addr);
 	}
 	return pte;
 }
@@ -90,7 +90,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 			if (!pud_none(*pud)) {
 				pmd = pmd_offset(pud, addr);
 				if (!pmd_none(*pmd))
-					pte = pte_offset_map(pmd, addr);
+					pte = pte_offset_huge(pmd, addr);
 			}
 		}
 	}
-- 
2.35.3

