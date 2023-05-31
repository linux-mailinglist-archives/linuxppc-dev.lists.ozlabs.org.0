Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BABCC718D60
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 23:39:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWjMr27Mzz3flw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 07:39:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=F74YoiyA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=F74YoiyA;
	dkim-atps=neutral
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWjBT3CvVz3fJG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 07:31:29 +1000 (AEST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-565aa2cc428so858697b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 14:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568687; x=1688160687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8eY/8E6JF8s/V5NNW8TZkaDOnTKuaiqrBMcG8UrW5A=;
        b=F74YoiyArmyQwVgOOUW2kfK/7YQSeytT5Qdq4W7jztqrHFW+OxsR62y2z0sZiEV/Pj
         CHUjkMgQ+tHkrFh4S6EPBTtuP0+8wu5BQZyij+e15SnoNrkShPqGZvWdjF5BKJMv2Qv9
         d//2kHJUZF8y/wk4PqE5bOyyg7AT91rLlQi2SzidEtRHvmTf0yi6wamtogBgC9EY9N9P
         uw5EAPHRhzcCUSce1FYm7EE8CHhgk2SNgdWG+thFtb+Fd9K9ZtkE1HL6Lqu8zbrIjBxa
         OBo4gwjzqO/AwYTPpiaC4MdC5Mq0f0RkoLNLDnNUh3I4ll9vsxHX0eJNI6QQ67EeV90U
         TdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568687; x=1688160687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8eY/8E6JF8s/V5NNW8TZkaDOnTKuaiqrBMcG8UrW5A=;
        b=TA+0/DQMSvxoIAwvQdao/96X479rYRz6xXZzNxg1sdaikG72+tXXlBC975N7yCRXLD
         SUURCkSpktUP5kE+0DIDTvD48O3DR7tkWhS+F56FYWDQHEf9oCjfuaQI4a9f80vWMvjc
         qPghaVc7tiJYSeWtNKktkscK7GCefyhu0i9YtwZ5MhVIlgZ1AefwhX8DmLmM0aC4MCMU
         E7B0hAbY7ZwjvWwGTfONDl/vZHVhtAhnt8QJpnIqZ9hKtODs3h8hY7uvVrx8wOs5d0o5
         bTaunVwP6nsK+bUz5rQSeqYjp5QwDHon1iASFVrQy3FN0CWu5Bu2e2T2bKIamgQbJXZu
         92FQ==
X-Gm-Message-State: AC+VfDy/DBW0DHqRIH72zyAJra66K20gWQkRmdO5kq3b4JQflxZgQX9I
	N7i89QVyoHPKsIscL+5+nqs=
X-Google-Smtp-Source: ACHHUZ7+UFYbIzpavTgJ7f/w4fvGAPRL0PNa3hATkUDplqTdJkdO52BS/n5X3DMJ5Uv/pNitevHZ/Q==
X-Received: by 2002:a0d:dd92:0:b0:568:be91:c2c0 with SMTP id g140-20020a0ddd92000000b00568be91c2c0mr6597562ywe.6.1685568687247;
        Wed, 31 May 2023 14:31:27 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:26 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 09/34] mm: Convert pmd_ptlock_init() to use ptdescs
Date: Wed, 31 May 2023 14:30:07 -0700
Message-Id: <20230531213032.25338-10-vishal.moola@gmail.com>
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
index 6f7263fcd821..8e63e60c399c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2923,12 +2923,12 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
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
@@ -2948,7 +2948,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 	return &mm->page_table_lock;
 }
 
-static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
 static inline void pmd_ptlock_free(struct page *page) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
@@ -2964,7 +2964,7 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
 
 static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
-	if (!pmd_ptlock_init(page))
+	if (!pmd_ptlock_init(page_ptdesc(page)))
 		return false;
 	__SetPageTable(page);
 	inc_lruvec_page_state(page, NR_PAGETABLE);
-- 
2.40.1

