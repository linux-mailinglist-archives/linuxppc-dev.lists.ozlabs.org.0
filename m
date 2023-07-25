Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B36DA7608DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 06:47:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dIpSbxhi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R94Jc4TYxz3dy5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 14:47:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dIpSbxhi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R93lT0Nmqz3c1l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 14:22:13 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-ca4a6e11f55so4308173276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 21:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258931; x=1690863731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=dIpSbxhiHoEZRybZXN/MVeO3g9uu5Wr3kckw/68K6KR19uhvm31rhYObpAHJDDboRN
         fN++WCiGx69nFrN6B8d/NLOzRwfLSelYXtCG2axa3nxyX1nLiBBRswcz9UUR+gYqr6j2
         ancXFsSIRjlVC+siGAlQPxsDtqvlS6d02kp43kWDLSl5AqbfL3SxRXE8QCvzAnUbAKUU
         YasskwMDZ8VrwnmHFnrCJmWDVf5znjGB85g4q/nAwV8W9HMi2mBDPg8zNmEW2Wmz/ahG
         Gd3GY4JptXSFLWhWmWPz4PD8TWa0sGWxRtah1a9utFkbDSvAH1sC4A2J8wMHczxZTgoj
         5RbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258931; x=1690863731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=i4kNASYQDNE7yAi5iuK+52cMa25ZMAcYsN32oCwtLfxRfOb+Dr7CpRVqzG5BsuQgPa
         0z2X5xinzWTxUeqgmVFeATkgbr3HCJNQ3H+C1fvcXluSZjmKoLUTSleMbI5xHi0O+3pg
         Y1FC4jBhCQxIxLcFcV/n+adnFwsbfnGMZsymWKLsLNqzQ4fip7hKHlDPKyjVUlJmS3ne
         fZP1TWm6D0zanJWR3Vm0oH3NNvZEzFf4jxyL8BPTkwzyMP9fsGoURlrQy2KAkEAA80ZJ
         tePLsP5eDSon0QUGqs5MkGJxZMd2f5EVMP27M+xUTwdiYlr1AEDiTmuZeHtEdniJSCgz
         RmDw==
X-Gm-Message-State: ABy/qLayhcXU1S0SmOdl2AlZxOU6gKi5cqdy6R4eZ3L/SGNAhMUMcB0k
	4NZXMbz/gbtKuxxQBWcLrJQ=
X-Google-Smtp-Source: APBJJlFFrRXSNeam/kWey2sQFPpJrG6DmS1yW3xEJWnQmkKSGkoB3AAvrxYF3pVhZLtkZcpr8uNrnQ==
X-Received: by 2002:a25:2517:0:b0:d0a:86fc:6110 with SMTP id l23-20020a252517000000b00d0a86fc6110mr5159740ybl.28.1690258930893;
        Mon, 24 Jul 2023 21:22:10 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 21:22:10 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v7 30/31] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:50 -0700
Message-Id: <20230725042051.36691-31-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, Richard Weinberger <richard@nod.at>, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/um/include/asm/pgalloc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index 8ec7cd46dd96..de5e31c64793 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -25,19 +25,19 @@
  */
 extern pgd_t *pgd_alloc(struct mm_struct *);
 
-#define __pte_free_tlb(tlb,pte, address)		\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb),(pte));			\
+#define __pte_free_tlb(tlb, pte, address)			\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #ifdef CONFIG_3_LEVEL_PGTABLES
 
-#define __pmd_free_tlb(tlb, pmd, address)		\
-do {							\
-	pgtable_pmd_page_dtor(virt_to_page(pmd));	\
-	tlb_remove_page((tlb),virt_to_page(pmd));	\
-} while (0)						\
+#define __pmd_free_tlb(tlb, pmd, address)			\
+do {								\
+	pagetable_pmd_dtor(virt_to_ptdesc(pmd));			\
+	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+} while (0)
 
 #endif
 
-- 
2.40.1

