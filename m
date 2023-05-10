Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DEF6FD581
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 06:54:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGN4C2HBYz30Kr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 14:54:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=nx2nVYMV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=nx2nVYMV;
	dkim-atps=neutral
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGN3M4v5Cz30Kr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 14:54:07 +1000 (AEST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-55a20a56a01so120889027b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 May 2023 21:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683694444; x=1686286444;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8E7TU+EpCMsIU6CqnZRd0vWJGC9oqEXRuUswowSWl1o=;
        b=nx2nVYMVrNHZwwSl8w3NSmhsRvWihgBOt84R2c16JqiYC4KBl38YHxIAdhEkbKIKU+
         3KinRet9UKewX1U+bJzN/HA2S7KOTkCF4X7wqaw/K7+S17drzHhQwyGVptzSW8CKp+rn
         7n/QckVxFQIds+kKrngIuvcYjerJY8U+pP0nKt9JbKkli09JNKT1dmegLnEsv/7gGsJF
         Qp1n5E/tb+Ovu77mxoxN3oLzT8n8iySQ8FxtBPgBcz8wTrqYdAKrqvMBlZ96CIsNIEnp
         6lPBYSKwbzZLj7KAL6W20hrNmnnmTZNvlsZaMnXbJsKFp6VCUGJP8Oy+j1QTC9dUJ6vO
         gsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683694444; x=1686286444;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8E7TU+EpCMsIU6CqnZRd0vWJGC9oqEXRuUswowSWl1o=;
        b=X1xJnxmhWPoj2kddJVVCT9ND15KGLZ8XDEcxesmLCJaUtRlqEpcFqnUwq8ifviy/Lv
         dqzrpW4ufwJmqLATCIClLT57sxUHiVYvZ8zYPSlPxXCCbn4bSphwbpCVlK9YJxMR6Kh8
         G+pBfxFEwX5OGuU0jy4o9LxXVRN2E4sZDXV/8YYeb/uKWss/RIxuREL7KCCv4MBc0fET
         ioV+lrSchEymQECfWYY5VU4nAgD2SDr7yN3IOyUDBtVJ449tjNI8O/gy46ITC+OenWda
         0JiRE3fIkHEgYCKdXZ1IPmbzrqrfcp94wEztmc+JrCQredLPx9wZPQ8CM9FdofkwOWdF
         IHpQ==
X-Gm-Message-State: AC+VfDxUCOreR18FvIQEyDjsGv6ZRbInD47TASorx35ix+zNMmT3kCBj
	JJvgI08/HhHSZj6nWT+XFQkoNQ==
X-Google-Smtp-Source: ACHHUZ57Dsib2dNeEkcs0nwSe68HvlbijE2Qa11Gh7g4OTrdhlBqOZhC7lvqfUbJMl49On6qtViJzQ==
X-Received: by 2002:a0d:d955:0:b0:55a:ad0a:766 with SMTP id b82-20020a0dd955000000b0055aad0a0766mr17847236ywe.10.1683694444181;
        Tue, 09 May 2023 21:54:04 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id l4-20020a81d544000000b0055b46dac76esm3814196ywj.116.2023.05.09.21.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:54:03 -0700 (PDT)
Date: Tue, 9 May 2023 21:54:00 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 09/23] parisc: unmap_uncached_pte() use pte_offset_kernel()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <12c4693d-8bb3-2852-8cf5-9777b427d770@google.com>
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

unmap_uncached_pte() is working from pgd_offset_k(vaddr), so it should
use pte_offset_kernel() instead of pte_offset_map(), to avoid the
question of whether a pte_unmap() will be needed to balance.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/parisc/kernel/pci-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index ba87f791323b..52d5f8a5cdd2 100644
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

