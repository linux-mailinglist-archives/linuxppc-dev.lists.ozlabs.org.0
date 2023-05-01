Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A586F3836
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 21:38:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9D5y2DwJz3fyt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 05:38:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lB3Z6fcb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lB3Z6fcb;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9Ctq3P4Fz3c8r
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 05:28:51 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1aaf706768cso10981745ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 12:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969329; x=1685561329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTcYn70jypAxoGiZWNhXW/f3wJ7PRfT+UBBqvcdtR7Y=;
        b=lB3Z6fcbmN3PCDkgSSAUdLyGGv/N+aWg88Xq/3YBAOLHjjeKvsEOyPJ7qOvQJsTwm/
         r41UWIzlQ/5Ax+ha7xRNy8kdIkTNxjA3q1QX8n9bXAh3z/8wB6GEn84UnvlT4jKe1qmu
         sQyc9OGXZjTePH+r4Y6e6ozh0UMlJ+VYjsnu2YRncxwQaVJ+Cf7Nqth6cXAsabwTRyMX
         v6eeeBBdHDjqYX6OiT4X4zQkg5l42dCb/DNQDsMWC1atimcSE8JSmejQfjKp+N8Ip6uu
         zd2ZsR9jcfUX1/JB5xCLWPO6fdSMIACYocvg6A/MPAxkpU5nLiRN3WCB2A8Uz52//cN+
         kz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969329; x=1685561329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTcYn70jypAxoGiZWNhXW/f3wJ7PRfT+UBBqvcdtR7Y=;
        b=eP1BmGL0t9s1fpDhqrvG6pL+pXDhHHEPNuJgLOzmYDlGwMscyTbk+uP/QyD6BoX9yq
         sQxES8lqxN8CicAg5y1XwjoG/RqO04fmZ9kO2b77/7jTHFe0g5s/PxmWHpkoUcIv640J
         X52OQEV2FrzrBCBvH6g4hL5iHg4Vg4yI1dd+CheJ0C+NM1cW7uzFZ6AwDYE2K7P9ZU8T
         zSOygCNyIWIRilcOEWrZxYLOFREOwRyTbKGCWD3IjrpZ4TdfpomQ5i7/KFW15B9k4o8j
         MQeQW5zP8SSaLgHkpU7TLY0HdqWQAOfb2U/9p0gkQSgvGiwmn/J3XpR+7VjUvMEV88rh
         gnAg==
X-Gm-Message-State: AC+VfDy1hGjsBnvCGQ9Oplk6YB8QoQk93e/Hrk5VW1m++kdrinMyTDRq
	iHdwpYShWFRJiOxugQQmCsw=
X-Google-Smtp-Source: ACHHUZ6RkKtjORSVVTbvqSb/nEXqQaQ9JTIasvSEW6m9mcivHjmudekwdvS8zsaYUeAaqoCEzf8v6w==
X-Received: by 2002:a17:903:24c:b0:1a6:4a64:4d27 with SMTP id j12-20020a170903024c00b001a64a644d27mr17386318plh.40.1682969329458;
        Mon, 01 May 2023 12:28:49 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:28:49 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2 11/34] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Mon,  1 May 2023 12:28:06 -0700
Message-Id: <20230501192829.17086-12-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
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
index bbd44f43e375..a2a1bca84ada 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2911,12 +2911,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
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
@@ -2929,7 +2929,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -2953,7 +2953,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.39.2

