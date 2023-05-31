Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10690718D63
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 23:41:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWjPn4pNPz3fql
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 07:41:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sRB3lx4k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sRB3lx4k;
	dkim-atps=neutral
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWjBY5CYhz3fGc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 07:31:33 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-568900c331aso736357b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 14:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568691; x=1688160691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1jEnioq7k9B+WnYjAw3S6OIwBriiVkAgPsVN7nSKAQ=;
        b=sRB3lx4kAmnM8+wptcE+ajVYWk3XjheLnACKkDukTCUf9xFbPcDCYhPah6bex/BYdh
         giGFY1Br6w10nUQCd9DWblMM8GH+uaGuqnqROXiLO3UcERmYA2lDrQkgyUuZp7Z8kkqA
         nuRpQ/9G4vNwfZmkO1bs5HdxOej2dcQ5VFdd4ryduclGMMN3123XdTOk5+I53fDJyOM9
         XY0ZeZ9oP8N1MEbhuB5it+QgLHnwrzlk6MNwsUUfvNiqVb/KKB+BbxPk/D/IjrOXLBJg
         QnLP5YOwWWUD0KCage2oW1q2o8nxOiUGc6Utker8eoaHUzZhr+sfeHDiQePcAYy+fUoc
         EHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568691; x=1688160691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1jEnioq7k9B+WnYjAw3S6OIwBriiVkAgPsVN7nSKAQ=;
        b=QfeLbBOgIWy64j5w1sg/srY4P3PzAU7hqM9K2HsJYVoaeh0olEwIXsDdYhZ4+Tk7dn
         EncScFXWsUCDRdAIQvHMkUU3qntHCktR3UVfBUSMWpCjlRokVyoMOvlRnJS70horP0ve
         7KF2sF2i9+UVbxxEsOlZqypgMaP+cWHPKN/vlyx6So6fSdw2VzB/KfEAGg55pexwLufe
         NbEjrgYZZ08LqawH57MhhJgWnwKGXus8d4kcJWW4GdxvszHeZpZQ7wZU4zdH1J7+T3C+
         qpjFStvCg0jtwqbcEUhH8/kAI08thEUKtCLUOlXSC3vd54rPPBsvFrvR4CWYl7M8YOKv
         HT0w==
X-Gm-Message-State: AC+VfDyECBfnN4cekxn0RbHYEgfsCmEOsj6rm1xsjU8C1ek//0R0poeB
	X+FyKiFP2MY/LpMFOeLYQrs=
X-Google-Smtp-Source: ACHHUZ5VBnMU9jyAiESUYWnGmIowgKT6gU4T3B/pZNfl2GNdmiRLLxEPQJ4tr+ESELmCnMZcerU5cA==
X-Received: by 2002:a81:49cf:0:b0:561:c5d4:ee31 with SMTP id w198-20020a8149cf000000b00561c5d4ee31mr7393100ywa.38.1685568690985;
        Wed, 31 May 2023 14:31:30 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:30 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 11/34] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Wed, 31 May 2023 14:30:09 -0700
Message-Id: <20230531213032.25338-12-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bc2f139de4e7..ffc82355fea6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2931,12 +2931,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
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
@@ -2949,7 +2949,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -2973,7 +2973,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.40.1

