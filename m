Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D121D72D2F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 23:13:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=LGp0peHn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg4D95Gnhz3bbZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 07:13:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=LGp0peHn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg42X0ZQ9z309t
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 07:05:07 +1000 (AEST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-56d5492850dso1959217b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 14:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603904; x=1689195904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVa9cggtOHSUJO/ogR1wMW2sjtZWNjmDdrC369SVqz0=;
        b=LGp0peHnuaxYbTi1TrslUjQMitjh+h/buXXjte+rmzMq8EerSk6fzj/9MIVxfmxSpM
         Omqu6nYebae8kl4QHV1G7ATHJ83nT9wNtbqIHtA4KnlPAvi/4+5X0WEOsthQhJoYwmhG
         x7qZZcT6GxEhvCZo0gV9yDh1XejrVy2crvGhXSgjUWCF1D9y073Dss7gKb2gKwKJeIqg
         gITOZuL6QQ3v0Ru0LyolXLQ7MXgbRP8zVbSmn+AuXiGssqL0cYBREi8V1ugxeRNuLvvw
         6oKvVZRZlVRzitWHyvf0O6G2XA5TATPVxsClJqIqIlKCoZg9JlGxlBuUR1XF5sExgOF1
         +mLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603904; x=1689195904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVa9cggtOHSUJO/ogR1wMW2sjtZWNjmDdrC369SVqz0=;
        b=h4dagG9amuAnXPhgawpqgGrL1yRcjBD8ACZ175N7h74mMZRiV6u0/EX/UR9Fvixam1
         e9/VGnZWLrv7fNzxQgRp0hUKRg89jYkOIlMnXeOHhhDWTfv2x5WHurFKDuU7PIjXYgOH
         MwbrroAnF+UvDSZtDlwoJT1SzxSyErpta2JeWazDrdTxxeGF1eqBtPxSRMEwVbwHZtOh
         Ad/dWwPuCNbqO9/H0o7QBqnVT9Af5OIFnT3F03F08dU2ruq0Zv9dRDbBW6g+O1DehIPy
         jPDkqgkS5kQuC3FmviX/G8XTxEZcvGXPmpK7YhekN4iQrIuXtFDeHAxnW3bfoRMQDarB
         T6Eg==
X-Gm-Message-State: AC+VfDwmkbkQh8ilB8J4mstlcqrNpK/yz2ZTvFH+2W6cY/cGfC04JMjP
	x2y+/JdTC18FK+pLGSr9y5Q=
X-Google-Smtp-Source: ACHHUZ4LesFNmga2zNafYd025bzkWSSIKRSwmwCXoFtNtSsfVvER7X6NaAl79hSVn0sQ3cUacFJw5w==
X-Received: by 2002:a0d:eb83:0:b0:56d:7c4:8be8 with SMTP id u125-20020a0deb83000000b0056d07c48be8mr6827241ywe.16.1686603904409;
        Mon, 12 Jun 2023 14:05:04 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:04 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v4 09/34] mm: Convert pmd_ptlock_init() to use ptdescs
Date: Mon, 12 Jun 2023 14:03:58 -0700
Message-Id: <20230612210423.18611-10-vishal.moola@gmail.com>
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
index bb934d51390f..daecf1db6cf1 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2942,12 +2942,12 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return ptlock_ptr(pmd_ptdesc(pmd));
 }
 
-static inline bool pmd_ptlock_init(struct page *page)
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	page->pmd_huge_pte = NULL;
+	ptdesc->pmd_huge_pte = NULL;
 #endif
-	return ptlock_init(page);
+	return ptlock_init(ptdesc_page(ptdesc));
 }
 
 static inline void pmd_ptlock_free(struct page *page)
@@ -2967,7 +2967,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
@@ -2983,7 +2983,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
-	if (!pmd_ptlock_init(page))
+	if (!pmd_ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
-- 
2.40.1

