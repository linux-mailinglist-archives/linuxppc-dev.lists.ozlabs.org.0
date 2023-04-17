Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E3E6E787A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:21:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1df60dlxz3g9j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:21:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Sg9gXChN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Sg9gXChN;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0fQs037cz3cjW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 06:53:24 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id i8so18359967plt.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 13:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764803; x=1684356803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2PCFvKq9JWcIC4Exd9oDYO0v0PQOHyXRap+yEgbOb4=;
        b=Sg9gXChNrNLShRRgfwOKl/OTTCvmKSrllpuIiui1MavGQQvyi4/hV9+QaVJ3t9hABY
         7LNyY9zC8MZPe/8uyGF6BwZFFCebqKsRkCF7WD2/MczVElNAeTdXAZoU8m9zjTh6P7Zy
         0Ui6eydpR2I1tZyrhRUO19d2JsU/fHL/oyFe81PNxO86Jxw/ya4bgHlBy023YgAYk0Ea
         ro6AAOx594UY8fA/m7D7bEpjpZMo/caINuRe5NJsUpyuSeut+/oOBeuT5hXbXmkAYI67
         Pav/++zqcV0Pbp5FUcdmVoTNUO7tgK9EwNCc3eK51W0dnm+P+Og2+jgMY/+82hRUmWz8
         imHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764803; x=1684356803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2PCFvKq9JWcIC4Exd9oDYO0v0PQOHyXRap+yEgbOb4=;
        b=MuI9MZUavKXS3fBfl2ppxwSAHkZ4/NTU4yRAGjSZ7OwsDnRJMfc089n/srVtiA5YNU
         oto6ArrF5XqC7T4bG3bypyjCWWgpWRhGa6/FTOC08Cl0Q5ls6wUhSoBDYv944mfUdItb
         XAZwOHtSzFWSSuHq83En09yiquHG/tqGLN0yotUj/O/lq9teLJfJSPdk4MwUFFOYh2JS
         sBxNGXqnSRR9ogaIFFqVCWEuimy06fHiRObiYu0z3epRYKV66CygyOnEEWT4jMREx52I
         t4g1jKW1E+I8wOSu2J0q/NOWqsPkxtX1F24dZXmaxBrSl29ebJ6VcIY00P1tJtHnIY5s
         4pqw==
X-Gm-Message-State: AAQBX9cwxe93WvWD+JzehbLB90VHo+p1Dge21jJIFbpCEBRE5j+L+pbj
	ehEsnCGAN/Ha9TuEvKs1pcY=
X-Google-Smtp-Source: AKy350ZH2s2lfJdxSYj+T2S9Ef0UoYzkgLYY3eeGq1S7Q2hAbd0lFGX52BFTYQkOd2khPVGSck6LXA==
X-Received: by 2002:a17:90a:e28f:b0:247:4200:7432 with SMTP id d15-20020a17090ae28f00b0024742007432mr11696070pjz.40.1681764802858;
        Mon, 17 Apr 2023 13:53:22 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
        by smtp.googlemail.com with ESMTPSA id h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:53:22 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH 27/33] openrisc: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:42 -0700
Message-Id: <20230417205048.15870-28-vishal.moola@gmail.com>
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

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/openrisc/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/openrisc/include/asm/pgalloc.h b/arch/openrisc/include/asm/pgalloc.h
index b7b2b8d16fad..14e641686281 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -66,10 +66,10 @@ extern inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)	\
-do {					\
-	pgtable_pte_page_dtor(pte);	\
-	tlb_remove_page((tlb), (pte));	\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	ptdesc_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.39.2

