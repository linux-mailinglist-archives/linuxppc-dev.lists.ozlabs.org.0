Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 452FF7288D0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 21:39:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcZKh0NZXz3g4q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 05:39:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=7iZl7qFo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=7iZl7qFo;
	dkim-atps=neutral
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcZGB0Sm8z3fg9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 05:36:32 +1000 (AEST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-565c3aa9e82so9448357b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 12:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686252991; x=1688844991;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UmemeLuI+WpEQXgz9TQT0mwehV8FTU9BDTa5EhoH+Rw=;
        b=7iZl7qFoE643/vqqfaylOOM4UugSzxQOXfGxIkvhFgrLBJMpREbmLbhzK1Dfpeq7sW
         vLxMNbMxtYruESXi/vLA/FRPFy86oy/Rlv/K+QRhWyPjxrgHE6clF71I8HICL+Wbu4D8
         52TIPF5OsTmaSTlVcpOmlJ2hXgN4iVitvobit3uBB1+XryThJwAiK1B3ovBLWTXnWBEi
         ML7bTpBpfErXrO5jZn41yk5x35HzdiBPWQx9RrfkGfIWSKYY13HndzOzcbi8dz53N7Pe
         Ykc3xEYKN/aDtb36dEI3aYN9owd5brP5GXTjP0NKjFTbVVbOSNnZMLMGudJLdaSlcXEi
         8u1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686252991; x=1688844991;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmemeLuI+WpEQXgz9TQT0mwehV8FTU9BDTa5EhoH+Rw=;
        b=hnHuDjBHXUyB8TpUOvhslB5m//BUvfRLJNTEKPDl7KR3eqUaPEmsHZpiClBo67Mkvk
         /wqV6DbYZWXhH8WbUqgbo1h3YzuKowqMI7gXz+qPOqTBl9NJgs6mQNthBWOXCSyCL/TQ
         AHzK/BjUvIBWEz/KeSaprrz1ZNPiAftqPjqbsjPi6lx7uLP9O56/DMbQ4phLoQTfrwyd
         2zDGvuFiOesw3PyS05CyxjZNb8sJFHTpEeqpJdL/TC56DbN6499MPyHy9x5qsy8F6MM/
         ZODtKvw2YwiiG/3d1N/9uCd8V2VItsBsSTh6Cq7nAD+JwX5PyvCFj9ylTmr9dnfvrDNH
         tUZA==
X-Gm-Message-State: AC+VfDypxXS03Yzg6R9NEW7uJjzJ1b+64vX5gPMlBkk8TxVDg2wo1zAJ
	iMOl6PRPktc3UULKdP3+kd68yQ==
X-Google-Smtp-Source: ACHHUZ5QdxKuy9jo3MUvUBLJWa7hkCRN4WqLqFRikF/N35P5/sjJc9i1Jxr6DqBjKGQqjHCt1+UtTA==
X-Received: by 2002:a0d:ef01:0:b0:568:d586:77bb with SMTP id y1-20020a0def01000000b00568d58677bbmr743298ywe.14.1686252990588;
        Thu, 08 Jun 2023 12:36:30 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id a11-20020a81bb4b000000b00545dc7c4a9esm108298ywl.111.2023.06.08.12.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:36:30 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:36:26 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 22/23] x86: sme_populate_pgd() use pte_offset_kernel()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <497d7777-736e-85f2-c37-aa6bcf155e4@google.com>
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

sme_populate_pgd() is an __init function for sme_encrypt_kernel():
it should use pte_offset_kernel() instead of pte_offset_map(), to avoid
the question of whether a pte_unmap() will be needed to balance.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/x86/mm/mem_encrypt_identity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/mem_encrypt_identity.c b/arch/x86/mm/mem_encrypt_identity.c
index c6efcf559d88..a1ab542bdfd6 100644
--- a/arch/x86/mm/mem_encrypt_identity.c
+++ b/arch/x86/mm/mem_encrypt_identity.c
@@ -188,7 +188,7 @@ static void __init sme_populate_pgd(struct sme_populate_pgd_data *ppd)
 	if (pmd_large(*pmd))
 		return;
 
-	pte = pte_offset_map(pmd, ppd->vaddr);
+	pte = pte_offset_kernel(pmd, ppd->vaddr);
 	if (pte_none(*pte))
 		set_pte(pte, __pte(ppd->paddr | ppd->pte_flags));
 }
-- 
2.35.3

