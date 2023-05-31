Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97096718D9A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 23:54:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWjhz1j5Dz3gbG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 07:54:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=P+sFLMki;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=P+sFLMki;
	dkim-atps=neutral
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWjC731gvz3fPt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 07:32:03 +1000 (AEST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5689335d2b6so718907b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 14:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568723; x=1688160723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSGr1AIBRcRb+Ur7L3hOWyc2qTqn+mhf5/YLNQmZcmA=;
        b=P+sFLMkiyDDyXlnEG12Vca4wXTlsNP1tjr5mpQ3xYowZkV29Gi4DHzR6qoKyncOySw
         jnRT0Uzpd7rJ5SnFzozOgbTxqzpBvgdV5deGMByJA1EX8U9bDlcdVF5nVlhFFf1pyZ0O
         KrWMXXKGFgo38kAOB8ncfn/SPFyRIIMw4Td8wl18EIsvccYdq2AsnvZ0dkbvnVIaV8oQ
         lw4pGC9Zhdztp77vkJB22l9Fos3IjWhzJKFNlsAyyHAnjGjJYghL1MXToen9jCOsOslF
         dBNcDAuc1Cy34XA+B9s+UNYDNSEGNOwzJVHJrEoMCND5EfDLqD8QbuDF0jEbofHqgPPQ
         P6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568723; x=1688160723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSGr1AIBRcRb+Ur7L3hOWyc2qTqn+mhf5/YLNQmZcmA=;
        b=PLOssKpbW3CLnBGqrzC1UxIGYZEwBft8VhiU+/0lKqOcT6jODLMw9ZOXRS4xywVkgK
         VEDcx6lKpL4HVs66SWNEJuLUE+wCt/Gs5MdkrpOSVE1jDB7chJtCUdUWOC3xCihPFE/5
         qz7YwrIb7J2QEwQfcDkkbCMv069i6eaeG9Olxe23WqjR0xQkzW0RH5afovWJ77YagpnA
         TpUskOjKyRxzoz9EagTyHLOV/fhfXnI+hyYYGyGfLg3XpBvVSB6LHIj7pEtNRzkd5qIC
         6ZKcTShz+vYDh3nKM5uYiBG9aeTQBFXxR8Ru7tknEIiwVuLndeJm6zu36fGXr+yLUnOa
         UJHA==
X-Gm-Message-State: AC+VfDzGzyc9CmDSvzjvL10J2oUqi0JPySj6EtcgLk0y3IuLMULOi1MU
	VeTbJeTXWS0VxfmZvNOyVHw=
X-Google-Smtp-Source: ACHHUZ6lpvw1UsG9eqv+xSZaIjITC9PhoF1JcriZ34z9zriWEJuaLEkcr/e1lknRm4p3R1WVQNwsxA==
X-Received: by 2002:a81:4ed2:0:b0:561:7ec:cf90 with SMTP id c201-20020a814ed2000000b0056107eccf90mr7025257ywb.42.1685568722698;
        Wed, 31 May 2023 14:32:02 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:32:02 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 27/34] nios2: Convert __pte_free_tlb() to use ptdescs
Date: Wed, 31 May 2023 14:30:25 -0700
Message-Id: <20230531213032.25338-28-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/nios2/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/nios2/include/asm/pgalloc.h b/arch/nios2/include/asm/pgalloc.h
index ecd1657bb2ce..ce6bb8e74271 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -28,10 +28,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 
 extern pgd_t *pgd_alloc(struct mm_struct *mm);
 
-#define __pte_free_tlb(tlb, pte, addr)				\
-	do {							\
-		pgtable_pte_page_dtor(pte);			\
-		tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)					\
+	do {								\
+		pagetable_pte_dtor(page_ptdesc(pte));			\
+		tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 	} while (0)
 
 #endif /* _ASM_NIOS2_PGALLOC_H */
-- 
2.40.1

