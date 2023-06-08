Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E15728829
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 21:20:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcYw44L79z3fdt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 05:20:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=mXQ7UC6c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=mXQ7UC6c;
	dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcYvF23jcz3cBL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 05:20:09 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-bb167972cffso1091000276.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 12:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686252005; x=1688844005;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E/dR8Qg9bFHe49vUjKvOi0Rl/4IhXWfwv6MExDzA+GE=;
        b=mXQ7UC6cKQLLZIQ28oFk9gQ5KxeKVwwY9rk3e7MKP3JMMgFBUS0Y4Ow9xYO3QBbWBp
         OG1o7JhalsKeTrmK+H6URVPXbxrefFexNILlJOVSmAp7Qw//UVTcssC14O2AbNOpA95o
         3fphns61QjibpjRegZHBgnDNFY4BaX8z0yU2Yg9FB0o8UxxLFxwBrXonk679QJW2NVtL
         a5CA3hBH6G8j2p1GNpc9/KN99Dv4NvapDgXnvT++Pvq7LeadMsdSuwcoq6yEHgW25m/P
         tlZmPB8WvPaouvvNC3jzVDH6WgeuI0e6ggHbT3c4Xpt7le2+MhNk3DZW5USJxtb/KL2r
         qm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686252005; x=1688844005;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/dR8Qg9bFHe49vUjKvOi0Rl/4IhXWfwv6MExDzA+GE=;
        b=RWk/oI2XTBEwIspdzN4vSDYS+nQl1AdgWlDMkQs6qsfXlOAMLms9UqeuRkAhtMN9Sg
         ZgLH83uTkLSsJYE9eCJYSd3+QIs+CApGYfN7w/E0QMtQ+/9j6dar4YBYbhmPxnsD4O8j
         vqdU8nGsd+7e6FZC9AS4VyA6PYvKXl/SySBk3axkxoQr/+40DU3igfLeSP+jI46avAzJ
         OEKdfqGeuztF/wRhSKRmwdSpvyg2+BZL8OvrYvlUBbxHd+5WkNO8QBN1Pa7FtW+MXJDH
         Gmj8NYWZXZG7yCU7q/9aZNtCMgd/wLeFQEIhafQKCs8co72M7Hz8aiFvq0wXEgm2Rw5W
         Fuag==
X-Gm-Message-State: AC+VfDzEuLI2JgQhjskMGwG+TWAXlK9/nxYPu439aYULIrn+tzrJ5L80
	0p8asGPNKmCuFjGfzFKN802vLw==
X-Google-Smtp-Source: ACHHUZ4wGfYoiszAK487KBc/kae1dH0iFiJPU4oIJDoWEvbSOVI5OJwBbX6lcOBaT8/42nfo55JclQ==
X-Received: by 2002:a25:ce90:0:b0:ba8:16df:e3f5 with SMTP id x138-20020a25ce90000000b00ba816dfe3f5mr700600ybe.0.1686252005314;
        Thu, 08 Jun 2023 12:20:05 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 2-20020a251802000000b00b9dfcc7a1fasm446566yby.7.2023.06.08.12.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:20:04 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:20:00 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 09/23] parisc: unmap_uncached_pte() use
 pte_offset_kernel()
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <358dfe21-a47f-9d3-bf21-9c454735944@google.com>
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

unmap_uncached_pte() is working from pgd_offset_k(vaddr), so it should
use pte_offset_kernel() instead of pte_offset_map(), to avoid the
question of whether a pte_unmap() will be needed to balance.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/parisc/kernel/pci-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index 71ed5391f29d..415f12d5bab3 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -164,7 +164,7 @@ static inline void unmap_uncached_pte(pmd_t * pmd, unsigned long vaddr,
 		pmd_clear(pmd);
 		return;
 	}
-	pte = pte_offset_map(pmd, vaddr);
+	pte = pte_offset_kernel(pmd, vaddr);
 	vaddr &= ~PMD_MASK;
 	end = vaddr + size;
 	if (end > PMD_SIZE)
-- 
2.35.3

