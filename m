Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 183776E788C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:24:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1djp0Zxxz3gcj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:24:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Bs6MBnbj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Bs6MBnbj;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0fQy4nPJz3f6H
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 06:53:30 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id p17so16172378pla.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 13:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764808; x=1684356808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSVYEUhM0zGHlDR1yqa5KIpwwPynV1rh1Z3AvIT239o=;
        b=Bs6MBnbjQkX1GScZCbLklar3CQYsHMcNQJhdEJMSRoz85XciXhpnQ0YtDU9kdG/nWk
         TxMCtPr19eviQJI5aQ6Z23KjvD0/UYdwUUF801SK8Z3tk/XuPH8n6ufK4lU6OPOoTkEa
         tcxsOYaiL60cLVhSI6wekl2Ojt4T3pVi0l4/Kpd6dmP8a2GTqJPhoPlibhYfl7AzaVkC
         8dHP626PMZuKBlHUuWDeE5Ws0Xf5nvhx1+eNXqdjJYxnU1JpJLYxfuGpVyKb6jdKhgqK
         l+AozFzFnnh8JDe5VzEpQS6lDqTnIa40opwHXXYLbmcB20BMSqSIISIYF0OD142rh4KG
         4Sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764808; x=1684356808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSVYEUhM0zGHlDR1yqa5KIpwwPynV1rh1Z3AvIT239o=;
        b=W/g+ZtqZH2uYVOXk/kGx32eMSS500o9PfXCBU77Au5kF+O5BHFv4XPfMPWsKs32Am1
         2DHTmVFk5OO/AInzuL7WKZVol1rM2yCByYuM/EvnbiH1ai9ahQnjQqVl9wY7HxzHKPBC
         X6pHb3NEdY6sFzGk4XSa2lN7oBtv/ytWhVB9FzS1CJwd7gBxvFNpkpWHSkDNzdcXXcIi
         L5L/pHHIA4582ZEmPUTrsryK/+3knLoibcX8koCDXd/AyewIrxK4G8CiZfVaS/D6BNwI
         XLwkNs/10DYSIbfTIA5otixrekvFXuliY4eax4RQRLkLLJjoMsQrZjLFM9y4UdcDYmhT
         umlA==
X-Gm-Message-State: AAQBX9egaE00qVSEsfs2ImTeCyQBrhyjpF/cVW8I1jfv3knx6L82Lx59
	auCowmAIiDR5XodeJqiUBZs=
X-Google-Smtp-Source: AKy350a2GcdGbRUVrvD14pA7yb7zjU30cICJUnhJQSgTB8CRLuH7Cup5yhi/f0UjvURoMBG/RaZdVQ==
X-Received: by 2002:a17:903:1206:b0:19f:1871:3dcd with SMTP id l6-20020a170903120600b0019f18713dcdmr272381plh.5.1681764808447;
        Mon, 17 Apr 2023 13:53:28 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:53:28 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH 31/33] sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
Date: Mon, 17 Apr 2023 13:50:46 -0700
Message-Id: <20230417205048.15870-32-vishal.moola@gmail.com>
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

Part of the conversions to replace pgtable pte constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sparc/mm/srmmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 13f027afc875..964938aa7b88 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -355,7 +355,8 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
 		return NULL;
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
-	if (page_ref_inc_return(page) == 2 && !pgtable_pte_page_ctor(page)) {
+	if (page_ref_inc_return(page) == 2 &&
+			!ptdesc_pte_ctor(page_ptdesc(page))) {
 		page_ref_dec(page);
 		ptep = NULL;
 	}
@@ -371,7 +372,7 @@ void pte_free(struct mm_struct *mm, pgtable_t ptep)
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
 	if (page_ref_dec_return(page) == 1)
-		pgtable_pte_page_dtor(page);
+		ptdesc_pte_dtor(page_ptdesc(page));
 	spin_unlock(&mm->page_table_lock);
 
 	srmmu_free_nocache(ptep, SRMMU_PTE_TABLE_SIZE);
-- 
2.39.2

