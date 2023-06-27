Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1114573F296
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 05:24:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Lg2sjw4F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qqqnv6vMZz3bpC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 13:24:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Lg2sjw4F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqqbS2s0Hz30PW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 13:15:32 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-57028539aadso44554267b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 20:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835729; x=1690427729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSwuU7fg/k+TT5PagWIdYLap7GxOydHG9fnVI01D6B4=;
        b=Lg2sjw4Fq7Jsh/1bPb8/Bz5bb4WbWygT3r2OYZVXGMBEwfozbqxm0/F6bIElAKjdHD
         k9tw765etUmPaJavNHOgRAh4TrN9WtYkyFJDXO4e8zB0CLQ7CKYG2S6Z4giPdak3TlLV
         dBQDIQS2mzx3Rkho31FJSGH9B3yVhFoSm33zMOn6yvA7Um5yH03kqWlR3ymYgVkxmZrE
         IJEFqdSDC0V+0/+0zxMFLR8Zuzl0eiDJ5KrxbBEu73g+J0vEbUyjW5NugtcJ2jWIZ/MO
         3IUWIpYlYW1hiX8BTPI8estSfzK1mYASEDhKfgKz4greHIhYdQhx0bK/LpN/7ezGhpY+
         FpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835729; x=1690427729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSwuU7fg/k+TT5PagWIdYLap7GxOydHG9fnVI01D6B4=;
        b=MgCDy05JAeB7Mn4XIFacjLMdaXGrk758do7zbc5BBAyuC2Va0iT06dZZFNaiSSKptP
         2oXDPBllM/WtY//Onf7eWG0jDP+6fCneOMtOK8DW6m5euic6z8CIRUYoN5R27o8vaonH
         Tf+1L2HwVwdSWkmy2jTrvy4WdR+9oSOmjgzskm2+0qS9ngvzaeId+b6uX2Gad94xLivh
         5YA2O6isGx3rEKYFv3W042rmz2qTPBVk57tR36lvMiHzCAxrSuTohdPeNyvVDLvg/i7V
         XmPwbaSzK6dKlzrmH0+kf/sA+H7aDncQ9tJ+W8guZTW/5DQwM58XJzjL8mBdQ58ypMej
         jPZw==
X-Gm-Message-State: AC+VfDxgXP3UaRIC1z63G9gnlFjIiiTM7MFM59QvEnaaZepbLI4RUYwC
	jASP3g/uajjZC8d0F7HnTng=
X-Google-Smtp-Source: ACHHUZ46AY3BqwTWqQUYpGbmhIWT6fwcR58AoQIOUKYPJMkYvs0jOnx1fxcN7fC61p35DP7uAiDexw==
X-Received: by 2002:a81:6887:0:b0:565:cf47:7331 with SMTP id d129-20020a816887000000b00565cf477331mr37299896ywc.2.1687835728818;
        Mon, 26 Jun 2023 20:15:28 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:15:28 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v6 10/33] mm: Convert pmd_ptlock_free() to use ptdescs
Date: Mon, 26 Jun 2023 20:14:08 -0700
Message-Id: <20230627031431.29653-11-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
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
index 4af424e4015a..0221675e4dc5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2934,12 +2934,12 @@ static inline bool pmd_ptlock_init(struct ptdesc *ptdesc)
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
@@ -2952,7 +2952,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
 }
 
 static inline bool pmd_ptlock_init(struct ptdesc *ptdesc) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
+static inline void pmd_ptlock_free(struct ptdesc *ptdesc) {}
 
 #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
 
@@ -2976,7 +2976,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
 
 static inline void pgtable_pmd_page_dtor(struct page *page)
 {
-	pmd_ptlock_free(page);
+	pmd_ptlock_free(page_ptdesc(page));
 	__ClearPageTable(page);
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
-- 
2.40.1

