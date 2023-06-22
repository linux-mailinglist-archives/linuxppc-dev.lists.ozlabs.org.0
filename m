Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C69AB73AB8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 23:26:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JIPmtJWZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnD344tPDz3cbh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 07:26:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JIPmtJWZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2b; helo=mail-vk1-xa2b.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnCQx2TqLz3btq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 06:59:05 +1000 (AEST)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-460eb67244eso2862387e0c.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 13:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467543; x=1690059543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=JIPmtJWZzsFuYAbPd3iclg33SdIOk6GD+7bRoJGsXkLCA1qQrwoboYccPvVKSwty8z
         /qB14KJSfGNtyZY8gC2KXxRSZzLDqLeIztRDYfuoehM6XT+tgKnz6817MlJhyGs2y+Ff
         nzC5sPDHJyAHEqzN9xTnBixLp+PW75W3jhf77P4PsuZDMkZ6OcWV4Xi+Rqew178LHkOZ
         sutRPAF9NDYk2/4a4fGlPwKxe3Z/pKSq61jE0ZBiyKHaHi8RSPhHJpH4MRgs4uLl46tG
         QM0pvqokM6W0xltWNxHmZb4kL6K9Vi53nErkSfWOsX8epBIiO3LuoRLa0NZXa1LOWk1D
         I+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467543; x=1690059543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRfRtQSkmDpdaHgWU+x8J8rVDSFtmuGYMRjnXDV0vQY=;
        b=dG8hFy+Z0FoBLR2R/C3pYXVVntePTuf8BBpJVHtFICV7JnU8sE+90j1OrZxGCVll/T
         H4HURAv7ezR+vH65CVh7OILd1I38HI5z3fXsI1jcHxhdW+Fgae+nvqcVlKHyEPgiF/9L
         iVHFKmptn+YppqzZLfNM5XsFplNEnX0KWUqCJ1NPDFMGQMlVL2+xlrtge4ikersApWYI
         j6fKYeb4Df0Itnbd+ayYIwiGodpyFBgzeS2LD94+fKH3sbhHRkul24JJyKFydcHIMl4m
         SFcU3ljIY0Vfuc2JKumix0aiDKWEeX8x5IERHx9s8n8DGIBJmKMbkhmjYZZ96rMZOh56
         yBSw==
X-Gm-Message-State: AC+VfDxQN8UHKMXACBwAicgmA9ROYTYSy+W5zWtuskdbaR3RBYMbpVjW
	/XbKW6J7+cmhX0q++X0cygU=
X-Google-Smtp-Source: ACHHUZ4B8dweYtEIi2rY8Mw0qtzsz5NxOVUlUIQPQfiDh4wzrLYoG70uIa1HADP+PMU/T07FaShgdg==
X-Received: by 2002:a67:d087:0:b0:438:d4bd:f1f2 with SMTP id s7-20020a67d087000000b00438d4bdf1f2mr9462119vsi.22.1687467543144;
        Thu, 22 Jun 2023 13:59:03 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:59:02 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v5 32/33] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:44 -0700
Message-Id: <20230622205745.79707-33-vishal.moola@gmail.com>
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

