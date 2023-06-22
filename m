Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9869C73AB89
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 23:25:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YrTQVBS1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnD173bZ7z3ckS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 07:25:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YrTQVBS1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnCQt1mhjz3bsx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 06:59:02 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5702415be17so68935487b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 13:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467539; x=1690059539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2x+E7/HO6cxS1FKNHsH+YAjV99GeoJ7wX0XOkEEtc8g=;
        b=YrTQVBS1aaA3+7mVapNSFssjb2+AQ4IJNUOZvGKIi0FFDtk+PI4lWjji8UMW0kBniw
         NnyjjbhzJwR9iWxQ73lOHY6xUHgKO2FQSJubgoxvZQoc6uqJluiv8iO+GgjzyRPTTUNL
         H+9Lt9/vRpqFrdhngSNsPgL94g8nz/f64RVJUcVyBqSkPnGnipXpH3S7tTsIQsIL/Sfj
         /1Ey+dh+UNfiOBDZVuuR0MUQqWyu0BLKscPyo1/sCfwSnYduy/XWfVP10dsKPKfMX/jd
         CyoAvKAcNWnuFLqmsDX4R/ZAToeYgRboOEEoeu7mlCBRRzYoIoPibXR4stY18tIHtLmi
         9aNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467539; x=1690059539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2x+E7/HO6cxS1FKNHsH+YAjV99GeoJ7wX0XOkEEtc8g=;
        b=cYec02LD/bDWt/Dluw81aB/d4HCSH4I/5dXhpCDaFzr8Qm5T8sVnRvzma86etbwZu4
         RJTdEdDV2vki11b/+GI8HwJEiulKFypSw0V9kdSVtZDSstJe4Vs6zTGptdAxYfaajD0B
         /STBMe2IaiAl/8dnaxCRfTz5MqXkS+Z4cocXNiZ2rro6YOi2O/KbGsx+ONASKw5VHGWR
         YD2NdYYCqW7SowYQoS+2GOuXqCNziZFCX/m5lfWkEli5stIOGJrX1J4/4acIw9GweJxk
         9SI/OWykwT3fB8HVPqFZnrFIVWit2ZG5Xi/ukXZ9EU4A4gjSBQ9Kj/82LPmHaZZrQDHu
         lDhg==
X-Gm-Message-State: AC+VfDwAzHhpcqKpw3Gg310nu+cZJjvoRqYbdsATahnCg/ZqvTUkAtLm
	zKVez37KaWoYKd1awQGypZM=
X-Google-Smtp-Source: ACHHUZ7RSJK82blK0n8uMP8fjUDg81SPK6py6Hg2BA1/I5Xa80rVzDG2S/aTt1mnsQBJvwPYu3STMQ==
X-Received: by 2002:a25:2102:0:b0:bc8:914b:c83a with SMTP id h2-20020a252102000000b00bc8914bc83amr11442005ybh.22.1687467538676;
        Thu, 22 Jun 2023 13:58:58 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:58 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v5 30/33] sparc64: Convert various functions to use ptdescs
Date: Thu, 22 Jun 2023 13:57:42 -0700
Message-Id: <20230622205745.79707-31-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
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

