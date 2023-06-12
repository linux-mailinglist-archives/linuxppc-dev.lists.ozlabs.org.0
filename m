Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5DC72D23C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 23:10:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dEzJOtzx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg48G1m9Xz3bm2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 07:10:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dEzJOtzx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg42Q0V84z300R
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 07:05:01 +1000 (AEST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-56ce96063bcso37489267b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 14:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603898; x=1689195898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIxlKckYoNWIlWWgwnqqyBbBSaaTtt3uqS2t74G/Cdc=;
        b=dEzJOtzxLU2ZgnRZWUoqUgX1LkEqjEDlA4j+okrU2e6EDfoTOSvMm21aq2NnoI678R
         /LX1XChQ5Sb6AvjVNxtMPEQadtzbeWOF+8rQnJrR7+vmusoCvLySLO14WPjcNIRUT0dF
         2rQMLU3uAHVNRz0iVUR14QRbNE3w1MtZleas6+gopDWiSHJ7z9AcD/gIo2kO1Qn8dYbq
         016n5ev0Z4+orrxhRkS9jR7LRRnc2lkVCuuqKiR89ABW/c7EVFAaF7NtNMlO51k6MesR
         a4Umst3ZsGaDroxenZAsFOjCXCF1Egq8LClHBVmEapvlxmVVyTvGXFdEnpS3DAZrTLmY
         PBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603898; x=1689195898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIxlKckYoNWIlWWgwnqqyBbBSaaTtt3uqS2t74G/Cdc=;
        b=RKRqHovVff/YBvh/V6FDAfk55Ftc2vYQ5JF/wCR8dth99RYTWM5/4lUzx/xUkyntRy
         yFIoSUUS3lPpYCoFKHHrO7ngNs5IDqzUrUV5Dq4126YBY1qNJO3ml0Vho2gttQ05yPrS
         FznawIMYt86I9H2k+o+K7nomztNsTeIjgUimPyk6c7ShFursiiwgn2BsJqQDg3zE4vMh
         uuvzGVZCpHs820oxTetaCprUN4GLomsZNVG4W8K7t8pYSsvz+TBSy64xUAFxSgfB6uew
         X5vnlL6EAD37o7KcLcT5j7gD1GnQ5K3D3OPOPXwcbT9xfcFHfrzanWdFAfD+ej5UVdFL
         CnzQ==
X-Gm-Message-State: AC+VfDwTOhoGX71qXmoaRGAVd6LaW29pv1ZwGKBuLNnkXWNW2z3RX9T0
	Nh9sckbujkq7nMzz4G+PzR4=
X-Google-Smtp-Source: ACHHUZ6/Iw+ntCpwv4qU9urdFcPsYepvqoySZLtVMefOmpx6b7rcyARehfEWJ2myv62OL0MPJVk5RA==
X-Received: by 2002:a81:7287:0:b0:561:b246:77df with SMTP id n129-20020a817287000000b00561b24677dfmr12849071ywc.16.1686603898264;
        Mon, 12 Jun 2023 14:04:58 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:04:58 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v4 06/34] mm: Convert pmd_pgtable_page() to pmd_ptdesc()
Date: Mon, 12 Jun 2023 14:03:55 -0700
Message-Id: <20230612210423.18611-7-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Converts pmd_pgtable_page() to pmd_ptdesc() and all its callers. This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f184f1eba85d..088b7664f897 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2931,15 +2931,15 @@ static inline void pgtable_pte_page_dtor(struct page *page)
 
 #if USE_SPLIT_PMD_PTLOCKS
 
-static inline struct page *pmd_pgtable_page(pmd_t *pmd)
+static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
 {
 	unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
-	return virt_to_page((void *)((unsigned long) pmd & mask));
+	return virt_to_ptdesc((void *)((unsigned long) pmd & mask));
 }
 
 static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 {
-	return ptlock_ptr(pmd_pgtable_page(pmd));
+	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
 }
 
 static inline bool pmd_ptlock_init(struct page *page)
@@ -2958,7 +2958,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.40.1

