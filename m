Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3407F72D35A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 23:32:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HZjqN37h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg4dq0lBcz3cHT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 07:32:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HZjqN37h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg43K64NGz30dv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 07:05:49 +1000 (AEST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-565aa2cc428so40619937b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 14:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603949; x=1689195949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6EpXhLB/ZnHGYzIKEyphwqiyS9zUDTms38NuP0TFmY=;
        b=HZjqN37hCOK48cvGmZP3MyXHPsSWerODKITkESa+8okEvm66QeHMRWeJrMA+h9zAy/
         b08e3G4t5lsUUKbLUtaHE2GPHfm2Y6f2xgW3YiErhjVlP8jaPnDQQDBBPDgWToXRn7mW
         PpzBiVyA5JSxI70xxYGR2PwmojuW4ejIHH6298KzStJQkqMFOYKQH99Y1J/uWKo9ZDSM
         eRMw42CLQFJ3ndhOIFwgLE2rhtWcbpTrYEwDV/LXUoaY8xrQBL0kpr9KnDHMQo57XMNA
         dJaliHJT5dELYDcW6j8kH/iUc98Tn/GD3Nr/eiXjSdRocwfmdaU0ArfMHM4wLvGwtdMu
         leiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603949; x=1689195949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6EpXhLB/ZnHGYzIKEyphwqiyS9zUDTms38NuP0TFmY=;
        b=YFL+7mtHPxt2M22SVeP2AV+kxxsNioartEDnPa9XVXNrdQlLL25iFOEmLTUj/8+y7h
         5jIIuPHdDGejdBJkK7vx+tIpxTICKWtnlyFemaD2fwmJENkBHqXqve7JsctzPG969y31
         9i6WMP9VSV0lxCZgF4oqQO7uMoIGewuavYQ9pBIcIkA3U5yARM+ZLcn5X4fh33zjJ1jk
         9FZdvjvllNAddWyhFNj3wQomM739yH6Qj96gkYFidwTuRGNHbQxhMIzLBdynJFM6G8FF
         IteNkZ7w/0LexKxRtnpixWie4dv9XDWmNqCXKnLIhrda8yrxNM3CF8qK5nZI7ym97oTE
         6kmQ==
X-Gm-Message-State: AC+VfDzWEx/r4PCnBfEBrS4edfG8ZKDOxdq+sbQhWEafpIS3TqsnhBoU
	EKkYN8TTFddOcCUWOjr9U2I=
X-Google-Smtp-Source: ACHHUZ45RyLy6yl6Drr+w1zJryROJeWNSP67xpIchmrzxG/I82VOblMbJJSkZ2edvv8Qj+2hZ+73Vw==
X-Received: by 2002:a81:7bd6:0:b0:565:d517:e714 with SMTP id w205-20020a817bd6000000b00565d517e714mr7606123ywc.25.1686603949233;
        Mon, 12 Jun 2023 14:05:49 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:05:48 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v4 31/34] sparc64: Convert various functions to use ptdescs
Date: Mon, 12 Jun 2023 14:04:20 -0700
Message-Id: <20230612210423.18611-32-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sparc/mm/init_64.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 04f9db0c3111..105915cd2eee 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2893,14 +2893,15 @@ pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 
 pgtable_t pte_alloc_one(struct mm_struct *mm)
 {
-	struct page *page = alloc_page(GFP_KERNEL | __GFP_ZERO);
-	if (!page)
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL | __GFP_ZERO, 0);
+
+	if (!ptdesc)
 		return NULL;
-	if (!pgtable_pte_page_ctor(page)) {
-		__free_page(page);
+	if (!pagetable_pte_ctor(ptdesc)) {
+		pagetable_free(ptdesc);
 		return NULL;
 	}
-	return (pte_t *) page_address(page);
+	return ptdesc_address(ptdesc);
 }
 
 void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
@@ -2910,10 +2911,10 @@ void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
 
 static void __pte_free(pgtable_t pte)
 {
-	struct page *page = virt_to_page(pte);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pte);
 
-	pgtable_pte_page_dtor(page);
-	__free_page(page);
+	pagetable_pte_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 void pte_free(struct mm_struct *mm, pgtable_t pte)
-- 
2.40.1

