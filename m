Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF2373AB73
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 23:18:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=mxSRrVts;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnCs05my3z3dWx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 07:18:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=mxSRrVts;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnCQY0YRyz3bnm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 06:58:44 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7651c01c753so127857485a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 13:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467521; x=1690059521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUnc1suNAj/KzreaB6s7vAsOWiJZx3FNBLzDbQjj/SU=;
        b=mxSRrVtskejfc/X16Q74dptO75kex0U1BDLuwz97pVRe94MsJ1tXF/mDBi2+KIRPRR
         7frc0Ipdbv1qDfHMpCRO5VQbJ/DKNN2DmrrOctIElaXq4X1eS2wG1MgKx+EEIDm5IE/n
         dhPljY31cmgrHKk6DhfJfpvGe6V9T4MqXnsXF7ZHxbxJIsBPM+C004kDxiRMae/4a+6A
         l/JL+zpf4vx2gyi8iDyTm65oAYm1ZOIjSFK4K+nSdgPKFtV6K4nHQ1K38iP6GDgp4k/p
         RVulC8Jyfz61VS4MiwEinectlQ9R+QOPA/9MgDEtR4kVqNBk2wlMydoonlFLN2E5gAjW
         A4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467521; x=1690059521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUnc1suNAj/KzreaB6s7vAsOWiJZx3FNBLzDbQjj/SU=;
        b=DRACPrlR1F9I2rx/F83AzwwUlLrCRnX7KDEeyxenVlE4hsLfU5hz35c2d4OUQG6dSb
         Q26vp8vXz2+R/nMpTlJu4/YMc5mUSp3cpVFUvB8FAAMLBZkDC7xSJ0G9vWTxeAY0iGqu
         HqAnV0iDWJZrbxExPqKHcv1uWmAZ3cCAeE3nW5xWnpzncAUlq70yQJBGCdxhK4O0f24d
         J5xZe8QRpUOqhqKb0qHBb/6Gq6Dh4ptK1KzteujmyHvwTblPeRd7y/OBpDoOPTnJaJsv
         jDPSFQtWDLj6y8klYSVKTCTAcvFkZAYpyRP0us1dc6n8UIQweZkuUKy00QhJNsUcU7ey
         9N4Q==
X-Gm-Message-State: AC+VfDx1X+H0MOEDmAI4rUA9d1uHkaUM5SgKjrPRjOc0mPmrYiA/P5j/
	SaOi49pxiZNRrSwjJj39W2W9jbUolehmyQ==
X-Google-Smtp-Source: ACHHUZ6uwsaC+f+4ISzpiwzmvKryO8fCbzH23CcTApoIn0lsQ518YuGTPwW7f524cMEve6g2SlrGNw==
X-Received: by 2002:a05:620a:c82:b0:75e:6837:19f8 with SMTP id q2-20020a05620a0c8200b0075e683719f8mr19290818qki.54.1687467521509;
        Thu, 22 Jun 2023 13:58:41 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:41 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v5 22/33] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:34 -0700
Message-Id: <20230622205745.79707-23-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/hexagon/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index f0c47e6a7427..55988625e6fb 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -87,10 +87,10 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 		max_kernel_seg = pmdindex;
 }
 
-#define __pte_free_tlb(tlb, pte, addr)		\
-do {						\
-	pgtable_pte_page_dtor((pte));		\
-	tlb_remove_page((tlb), (pte));		\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor((page_ptdesc(pte)));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.40.1

