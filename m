Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADED772D2FC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 23:15:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cJPixJ7f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg4G73c4bz3cPk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 07:15:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cJPixJ7f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg42b6YLfz30Nr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 07:05:11 +1000 (AEST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-56d0dbbfc61so20178397b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 14:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603908; x=1689195908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/NReaJdz90gZ2NQIlUYsxuwjuA5PoSk9HvAIR22dRg=;
        b=cJPixJ7fvL8lj4msWoT6T4UdDliAegelx3fhfZFkllamFJSmCzzBfgBkJHvHf5VBH4
         +bFQaX0c9HvMpz3cMr64OoUwpvHF+4NrriYC39tboK0Z4VjLF9J6MmzkevSDnSF+eJ9S
         vsFP6THd62TglAym5r/waWV4KiQYY/X7Hysf9ft4FBrKTw7bicGfQMMhWM2I4CuvKtOv
         cwDTHbNBV8LRmkAEvkAc0kAr+XDxv+lhnXg68dTw4NnjCIip7ummoW4kmN1lP3wtz1t1
         rgvGb1IbL+Qt1u/Y4z+ep/GLJI6yTMWmeJDiLjESMtlIxdtrVlVrtQkxPe5yKm5XHK1M
         0mYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603908; x=1689195908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/NReaJdz90gZ2NQIlUYsxuwjuA5PoSk9HvAIR22dRg=;
        b=hP32TRfwkyej0USILaV+UwEz+6gBzsdwJnTKlrSUiFGcpjYj4VdUf2s8bdofiU5G9i
         RJ6z07IDoYY1aye1f5dtNYBZmztbXE+Fs//MBCN6HtidCl4bB6GBW5nTMNwpFDxwroS3
         +lwNWURIf/0NYzjE9INFOYm3lLmc8CDZk1m12kBR/lJ/lD7Jr/5t/nRecMhBkAfkxV8U
         BtpjHLM4BerWVMB0Snj1DskcJUT2LdgE+q2Vh5slrZSH+37j9EtuRVL3fzLQ32RYiDvE
         wHFbi+rf5OSugG4K1P3gg+GHgE4kDVC3aEAhzR6BfXjDVuqb40qNyjJk6gTC8MvhqUdi
         fstg==
X-Gm-Message-State: AC+VfDyROJFgjsjLDOPfFYjq3rSIdZBjvuLNCSq9/PQhNMRlXy2biUoc
	Thm3PuzwxL21pq2G3kRi5/Y=
X-Google-Smtp-Source: ACHHUZ5kijcVYXBTbbFcK1VnPllJL1iB2ONZxmZAAAXhO7jcUSS10Gkxlzbwqmp6U6Z9PG+yvX9PWw==
X-Received: by 2002:a81:9288:0:b0:56c:f916:905 with SMTP id j130-20020a819288000000b0056cf9160905mr7254032ywg.32.1686603908266;
        Mon, 12 Jun 2023 14:05:08 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:08 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v4 11/34] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Mon, 12 Jun 2023 14:04:00 -0700
Message-Id: <20230612210423.18611-12-vishal.moola@gmail.com>
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

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f48e626d9c98..3b54bb4c9753 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2950,12 +2950,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
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
@@ -2968,7 +2968,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -2992,7 +2992,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.40.1

