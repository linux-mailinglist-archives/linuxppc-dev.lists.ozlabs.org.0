Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6282473F2EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 05:42:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=PChVo0lf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqrB425rGz3f0W
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 13:42:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=PChVo0lf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqqcF3D6Dz30jT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 13:16:13 +1000 (AEST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-57026f4bccaso42392327b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 20:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835771; x=1690427771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2x+E7/HO6cxS1FKNHsH+YAjV99GeoJ7wX0XOkEEtc8g=;
        b=PChVo0lfe7Am1Juwq3iG7RGGrP0XqVtToprVlSbVPrmyTboyAd49pm1+evSB9B2tFw
         kXjlu6Q/E8ApcKDqDyfQ8SExeWZmFlXQXipKcu1XJWfNM69YhOWXhf3ISbUTXIBhFgb0
         96QCzhEZra+XSmonTSpvrhyWNfhcBtgM1hIeMstisaUf5aqytakahkQIURxFAuMmzadV
         6ZXbtsztDtfR61NxP+OmIDHBWYbrG0Ze8ny7+vi6zis0kg+kLkgyVN6ua8e4P9XYJM+O
         StKP4NZwkZwEtlTvPnxWtxrHSt+7T/pJDNCTHMVfEfjXHYKpAk/tbkRioOk7ft8zrct2
         Kzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835771; x=1690427771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2x+E7/HO6cxS1FKNHsH+YAjV99GeoJ7wX0XOkEEtc8g=;
        b=LlNJo1eGs0OVV1/QNAFXRYS1vq5DaFSNgo5dqLzGZDaaXPXUZgz3TPrZjQCO/xO+qC
         T6Sq5o5RBnKcsY7QqkuWRhgENy6gtKsExn9RJgQHzzq7DmeoY5sLhf798/OEKe9RvwAv
         pas/FK/CFQ8Rb8w2GGxnRhD6HgIFhG+Iyma9MYwij99C5AebTITxULRjl2PbO2/hZCqV
         gV68ckZ58T8evetvq8AsJ0pl2pSbBjSPuUREYOQ/NHQI9Ppc+2Bcy87odhBS11ML/w5+
         AxMHX6wnX3c6jJbFzRe5uzaTcrPC4DkswTG2yMNlPzw57lx2ZJwp2MjnlJ11DJqj6KT4
         /kmg==
X-Gm-Message-State: AC+VfDxXE2zJz3/a0uxVMg78Z6y5gQ79e/52YO3Ujxfvxk83DG8/PlOR
	vXY33t60kudphP5qU8MgokA=
X-Google-Smtp-Source: ACHHUZ6W45+nYYtPli9FO9SD+YRunw+Uuhdk8hdZzeF/68wsjhLAFg0GoFHHxkB57Ykeq0XvBZGu+Q==
X-Received: by 2002:a0d:e293:0:b0:561:d25b:672a with SMTP id l141-20020a0de293000000b00561d25b672amr31395214ywe.21.1687835771352;
        Mon, 26 Jun 2023 20:16:11 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:16:10 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v6 30/33] sparc64: Convert various functions to use ptdescs
Date: Mon, 26 Jun 2023 20:14:28 -0700
Message-Id: <20230627031431.29653-31-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
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

