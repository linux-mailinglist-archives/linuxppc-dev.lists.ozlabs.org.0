Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 538DF6FD5B4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 07:00:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGNC51fhVz3fMF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 15:00:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=v/0fedI9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=v/0fedI9;
	dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGNBF0XpCz30hh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 15:00:04 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-ba1911d60f5so10147468276.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 May 2023 22:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683694801; x=1686286801;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMaWjOOzBzTq25y2V3ItGl/gYmS8RRtg1cvEbj+mQng=;
        b=v/0fedI97pPSEeG4JjmhWFM2zERS146SPiMJXKFktyRt8gcu3XnU9flpdOBzk+uwM5
         s0LxqY4B95aIsZsh2mJFZGGaGczJQ5vlt2ZTVgohuP0YCEpkq6BqvaluTpoYqvCHZPxl
         zKN6HOjwjx0yrNqF5dlqaMyYDGE2Vrd5Uv3cHsjFUAt+EAmeWDDRNYI0YlpbNo86b8bG
         Aipz8AqM9zEa9JBFP7+dKHJaNOyMjOSxB2cpapkuH6PjkheDE/u4eOtK4ivf5fV5d230
         xxAVZ1lBfR2A1vI9J151/+XOuCwLBzeq8s5a10eXtHtu5Hbfr7aLXi+072D/bPReNYVX
         IS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683694801; x=1686286801;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMaWjOOzBzTq25y2V3ItGl/gYmS8RRtg1cvEbj+mQng=;
        b=YQJKrSVryc5JIi30dsnwEv9yo/PAzBSxNWgiLgAM4suAxrjdQFfkc/3PnCwFfi8Cca
         j3iKVrG7cMlaPT/KFgszHBfpdtqfQoXuL2uv6sDXiZve2sdAfjpxgPH9iQUcVGhfGxCk
         2S3dAEv0qiGn4EMJrkeVXLIGkOJSs3U9dPVPngJYjaEafskCz5Y9QzED/+y5mH3JmR0r
         h/5L0QpitXrf7jBSFgGp3Tx2+urIOfZKCgUXspU0rPj794Sw0g+kzQ1/xjyXoL2CTJf9
         EJL/Dyl6ESEO3bkf+o7uTc5UjrC/Qmm4RGxGx9Fdy0EjogzNuzdMir4SKvlXNtUCciEX
         W5Mw==
X-Gm-Message-State: AC+VfDzYk3F9RCitCRUebSeZazXG/kxnJJNwEyV3QmPcUrLeUfgBJNhf
	rOe3op+2avYBFg2d45bG910jvQ==
X-Google-Smtp-Source: ACHHUZ52JqpHXNjwopV1qONCz4ZhxlIYDhhrgvgpvQjGO/cy7NhTIg/35E50jddhJVH/CVSemNKwJA==
X-Received: by 2002:a25:a1c8:0:b0:b9d:9500:9d29 with SMTP id a66-20020a25a1c8000000b00b9d95009d29mr17308461ybi.45.1683694801383;
        Tue, 09 May 2023 22:00:01 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id b4-20020a256704000000b00ba2da98431fsm1603597ybc.56.2023.05.09.21.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 22:00:01 -0700 (PDT)
Date: Tue, 9 May 2023 21:59:57 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 14/23] riscv/hugetlb: pte_alloc_huge() pte_offset_huge()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <d1e54510-9ea2-edf-3851-fa7635ce1e5e@google.com>
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
 arch/riscv/mm/hugetlbpage.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index a163a3e0f0d4..80926946759f 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -43,7 +43,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm,
 
 	for_each_napot_order(order) {
 		if (napot_cont_size(order) == sz) {
-			pte = pte_alloc_map(mm, pmd, addr & napot_cont_mask(order));
+			pte = pte_alloc_huge(mm, pmd, addr & napot_cont_mask(order));
 			break;
 		}
 	}
@@ -90,7 +90,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 
 	for_each_napot_order(order) {
 		if (napot_cont_size(order) == sz) {
-			pte = pte_offset_kernel(pmd, addr & napot_cont_mask(order));
+			pte = pte_offset_huge(pmd, addr & napot_cont_mask(order));
 			break;
 		}
 	}
-- 
2.35.3

