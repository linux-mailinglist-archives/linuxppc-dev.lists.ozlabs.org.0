Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF5D718DA5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 23:59:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWjpc49bCz3ghk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 07:59:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Gco7uaZ8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Gco7uaZ8;
	dkim-atps=neutral
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWjCP7055z3fWl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 07:32:17 +1000 (AEST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-568ba7abc11so714677b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 14:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568734; x=1688160734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQ/uV998f7GBK3U8fEwXlOSI96PW+5wzkUNMHiphdSU=;
        b=Gco7uaZ8T0f7tmyth6uZeLtIanv6GpulpDiuQwIsnzqnPkjzJkIu0h1PZGQ4iQfI5A
         Wsvmi3eI4+D34lVcMDUsWRCETH5qcZJ6o4mHbMVq/3LTC/HNm7eQ6q2KfFVCA86f3d3I
         LxBFjI2qJ2MPH41lEvrCJnwlKDxe1mBh52b4jr4phbiXUV/rBKhdQfCzS+0QvKIx+CwJ
         I9nD3g0MgWbwsz1cldEhhb6oFNl81Iu/IWeIlG3kHhqR9NOaQpioUXIEm19YojgZVH7b
         YKNDEnmfXzRXtSrjS8AB8ePFyFPpDGIfkcu+Z1fbAVxcvdW9nHAWNVZ44Hj2Se7PAnUx
         U49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568734; x=1688160734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQ/uV998f7GBK3U8fEwXlOSI96PW+5wzkUNMHiphdSU=;
        b=do1asJMe6TB7k0QIXStj31N+zbT22QtmNCXFUsVGiElITrzTFNp0JFrTv3955EsDF4
         7cReAjQb+1mpUXUc4cZOyctBv8ckYS14ZXueH741cbR51zlHNBKEpJeFkl1LIt54mIg+
         DWrep4kzPf/tGDZRVDYpTYfkRVM7H9AF0T4GrKwx18ljA2m83cl2YuZ3a/jJK8eZJDD/
         gL3O6J8j9rpmOSJaFUSwrVIQS3jFJucvq90W52jmvyblFHWztY4NGZOeIPVvA41Vq1UM
         MUkw15XSQFWYsPA/+f4j+h/VlfEXufePq+cRbulX3UeGWWthHQPrJBQXjngJ+JNT+nT/
         84NQ==
X-Gm-Message-State: AC+VfDzqpb5JBu3OPUd75hwnTW90GyhG1m5NG0BeBTjEtEn8yDQyRfng
	tmTdXEgiPQOhwcbO7tEnd6o=
X-Google-Smtp-Source: ACHHUZ5gIOI1fuO3+omWI3ZFi04M+ls0ECM5yJW/hGOTfIhuUEs0QHIWlyyE93+ta0AMRd/Bn9r+fw==
X-Received: by 2002:a0d:db15:0:b0:562:6c0:c4d3 with SMTP id d21-20020a0ddb15000000b0056206c0c4d3mr7636270ywe.13.1685568734582;
        Wed, 31 May 2023 14:32:14 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:32:14 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 33/34] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date: Wed, 31 May 2023 14:30:31 -0700
Message-Id: <20230531213032.25338-34-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, Richard Weinberger <richard@nod.at>, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
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

