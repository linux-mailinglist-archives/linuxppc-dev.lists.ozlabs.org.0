Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5446F6E77F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:03:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1dDm0fnYz3fXQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:03:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IRDdSASc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IRDdSASc;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0fQG4Bzsz3bT5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 06:52:54 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id g6so10325285pjx.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 13:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764772; x=1684356772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPCTGsUKFtNZ0E2E3gxAeEJL+3qovRd//xVc9xUETqc=;
        b=IRDdSAScs3TBGztRzu6QZgH4fMR7/UKueaVS3DDhFsZMLZlJQUDaWkKiPXvov39z8Z
         bssT73UYUy1LP7uOeEalBEo3irDXhaxWlDKHCjJjWa82XbzBt1YrruOwks0GGaa/KE2/
         kcH9ajFlIINgfw2e+eWdEuaQpWFwhb8tF79JjCU2EAC5A/73X/TUfQV/8mop72+F/v41
         nZHSSM2ss9/OewEDYIYb1Iz4F1hF7m8KXVNPHD0iWKxsJnaQ4CmjrVdNW0xNgbwEICJR
         VACO7VFEKZxOIvTtIDcu6wtwdqmMEpSRB4owcroJF6TbGx9VSAN4uiN81drhHklILqhb
         p9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764772; x=1684356772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPCTGsUKFtNZ0E2E3gxAeEJL+3qovRd//xVc9xUETqc=;
        b=cyh232QhJ5GFlmNgrqeDZPqMqPmAzQC0J3hQPJ0k9kkiq2uxdiopAAXoVJNxN1BYn1
         MXFwPuyEURwp5xONvM945LObcturtt6JaHEzy7xsd2BwbGircbazvdrh/C36tvm6jD99
         9MM3HQ5ZkVThsdVYiVunbNARsc5Oh2w6YiXg8ekbLbbJEgJxcdsEueWdWEH1kLDKHX8+
         fVPI1zM1SjSTmCbl3XGQGTzIvDKetdLQliirXbQ0rBXT5EdD8kJLblENHV/ev2FO90dn
         2sjpW8FfLZsF///ETvpux5Eex4idNDLuXaivEmgwFNxDuPFZlhSRu03UmqLWUSc7cZ/n
         lwDw==
X-Gm-Message-State: AAQBX9fI/brHCxTjghVRjs4V5ZA3IjvDonMZHegJF6dwoi10Lxl6Gzp/
	ylatv63x/EfXND4pOCsAo/I=
X-Google-Smtp-Source: AKy350bms9aSjWgOwaAnzsnpGuFvcEqsOo1myEWAVSaCBXxzFAqV0lCr0DmPVe9wT5EHiIOY8l5jIQ==
X-Received: by 2002:a17:90b:f84:b0:246:fc58:d77b with SMTP id ft4-20020a17090b0f8400b00246fc58d77bmr15834371pjb.44.1681764772342;
        Mon, 17 Apr 2023 13:52:52 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:52:51 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH 05/33] mm: Convert pmd_pgtable_page() to pmd_ptdesc()
Date: Mon, 17 Apr 2023 13:50:20 -0700
Message-Id: <20230417205048.15870-6-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Apr 2023 20:57:19 +1000
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

Converts pmd_pgtable_page() to pmd_ptdesc() and all its callers. This
removes some direct accesses to struct page, working towards splitting
out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/mm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ec3cbe2fa665..069187e84e35 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2892,15 +2892,15 @@ static inline void pgtable_pte_page_dtor(struct page *page)
 
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
@@ -2919,7 +2919,7 @@ static inline void pmd_ptlock_free(struct page *page)
 	ptlock_free(page);
 }
 
-#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
+#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
 
 #else
 
-- 
2.39.2

