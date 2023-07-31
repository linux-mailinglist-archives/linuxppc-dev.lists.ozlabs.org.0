Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE1F769F7E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 19:28:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NsFqLoWt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RF4wB3sZpz3dXS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 03:28:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NsFqLoWt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RF4NP2ZQBz3bNn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 03:04:37 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d299ed34bacso3971471276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 10:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823075; x=1691427875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9EaWELDe99nUon5K3Z+iJo2yPeaFSzyCnD+eyoagSI=;
        b=NsFqLoWt3v/Ei4hrw5AsnvwdpZbLVDKyj7Tbvrs08XADPJ7gaOSxsw7sciWyK4ium/
         IicTt5pAnx/uEvhHlkhBbrdEgtE6/Y30DbetyPtuylWlm9M94rgMfdNkMfsGqtqBt9r5
         2L6Wjhryz46RjM7Eb4DDBBbwHfcSN7h5N/Jso4kYni+cF2Cm7JoIdTfshA0rAirRtgJq
         t1r00+5UN5MvK3JKDaigYuLE4bDBuDPbT6+YGl+hj7DsF2cKQbydBN3rr041uGf1vOTw
         rMTuYysQGj/R6E2nTgdgPgBnp/CeSE0cUWUK6rVcO8oVilzfT/uwMzlyU+7MnJSFTrKk
         qPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823075; x=1691427875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9EaWELDe99nUon5K3Z+iJo2yPeaFSzyCnD+eyoagSI=;
        b=S9rKYZ2BUc9xexUUVIs0Ia1fS9cE1uER7WplwIAKeYHnhAigeN2VRa9atiznoKS4vu
         QeNouAzqyIEl9q9R8WvQYytHmBmmfsG0BfYxJZ+6t0KwOqcrcfjNplOHs47fVyrnDUve
         H8zgGw8niWYA8c/UYJfq72D8MnZyo9Gk7H81zKrVek8QSo2jEV/Tfs1UVEXH1r8xqU5F
         DvUIHxyS1x1qSiKdkbSw8pMkSwgOGSxiSKu4gbOXe/u75UucKB8/JBh5Oj7w66ScsvcT
         XLnVYKOVgjmyPuMr7If3QPSqNzjCa2Cj1f5CfhL6qi6d/rINuBdCww4lF5AGtWc0w4CA
         OJFA==
X-Gm-Message-State: ABy/qLal4VTmwl4RzdGRPgStC8YdwdgLFvBbcYPLG0SGNDbGqmGGAuQY
	sJTGexygC80ra8Gl/TeckU0=
X-Google-Smtp-Source: APBJJlGLJI7wOi/cAC+4887p5NxC1O6Jx9Z8tS0dkQscAqT6FlNcjE8alBIW2Z/pk8K3FJGLN+6VNQ==
X-Received: by 2002:a25:ac99:0:b0:d35:ee7e:349 with SMTP id x25-20020a25ac99000000b00d35ee7e0349mr1328711ybi.1.1690823074854;
        Mon, 31 Jul 2023 10:04:34 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:04:34 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v8 28/31] sparc64: Convert various functions to use ptdescs
Date: Mon, 31 Jul 2023 10:03:29 -0700
Message-Id: <20230731170332.69404-29-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
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

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/sparc/mm/init_64.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 0d7fd793924c..9a63a3e08e40 100644
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

