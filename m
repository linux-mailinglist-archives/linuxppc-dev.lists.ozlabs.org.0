Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A750676088B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 06:29:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=gPlpDfbg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R93vs45Jgz30gC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 14:29:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=gPlpDfbg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R93kc6zn7z3bWj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 14:21:28 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d05a63946e0so4083560276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 21:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258885; x=1690863685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZ7ozcISUSGoixC5UzzNE5tJz0+L18C1Imj6XmV/DYM=;
        b=gPlpDfbgQUaDh17nMUuxk8LJn1nYdgEAVfSMEcDpmwNJCwXKDaomTlh0BY+xZkFMKd
         tFRmLrBoE1Vp0IzzPSrF8bgPZVxB+9aP3VrUcSHjKLr+y7jNlD4PpyjtmGaGnI3Rciw5
         xPEUpzqKKaVrLEfBMw5DD9c3Ng9G9PKL+n4eQ6Zcvb2wmVEKnYUeBmB54WntK+cvg6UK
         QgMdLEB/drGqPOPjrgcd99xnUW0qMuGMWDmaVMRTFx92PXfEsSeKT6B4JdtVKY4BOuL7
         QKWH8kGjoeg6j0VlgnYB4AI/+z50XhZH+jdg01QIwrxx7GkpXjxyDTkcgrBZeXNJtHxg
         DmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258885; x=1690863685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZ7ozcISUSGoixC5UzzNE5tJz0+L18C1Imj6XmV/DYM=;
        b=QXFmph1KZ1UdzMJ6Q5QykOlbFDwHxNm6NxN6UyRSXe8Ezws0wy2PANobnaFw20FSqh
         G0Bpee7a0jBeUyS2g5Oz+Iv7VZIrubZZdQIKVris3JeEW6JNDCFcqEy46759DFj04WeM
         F2Qd155UyeQji1UwLxetHF2rNmXMpm1VaoU2QtWXlEriCDKp38g6VJZHpEy72R+HzOsZ
         fE9fuEQfKyyvSI/WHseSe2/ybymFFFEHa1JRIQSMNRbqpHlDkmd3OX367MbAx2df43Te
         E7pZEyE/O1lx2XamgNyTDuwzXMupSBLMTC+BpL1vwguF9kG4A1xU4KRz0/voKPMHJZVX
         0d9g==
X-Gm-Message-State: ABy/qLYpeW1HJ/nQLjQQhMxT1o1Jx/jfuLAg4WGcO9Z5bQQcimn3cfso
	eeNFENK0qDE/GwqGMu0y1fk=
X-Google-Smtp-Source: APBJJlEU2X68Ojav0w5cqMxtXa5ryZpYlhi5g+xNY8vonB7Weqi80FZO/gUhwzOoBC/kjqTB4Zo1Gw==
X-Received: by 2002:a25:f827:0:b0:d0e:794f:64ef with SMTP id u39-20020a25f827000000b00d0e794f64efmr4552557ybd.0.1690258885213;
        Mon, 24 Jul 2023 21:21:25 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:21:24 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v7 09/31] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:29 -0700
Message-Id: <20230725042051.36691-10-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 675972d3f7e4..774fe83c0c16 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2982,12 +2982,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 	return ptlock_init(ptdesc);
 }
 
-static inline void pmd_ptlock_free(struct page *page)
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
+	VM_BUG_ON_PAGE(ptdesc->pmd_huge_pte, ptdesc_page(ptdesc));
 #endif
-	ptlock_free(page);
+	ptlock_free(ptdesc_page(ptdesc));
 }
 
 #define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
@@ -3000,7 +3000,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -3024,7 +3024,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.40.1

