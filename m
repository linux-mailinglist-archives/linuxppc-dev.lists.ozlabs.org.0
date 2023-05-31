Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F90718DA0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 23:56:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWjls00D2z3flB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 07:56:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hVqCB7aF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hVqCB7aF;
	dkim-atps=neutral
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWjCG69Mgz3fWl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 07:32:10 +1000 (AEST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-565ba53f434so709197b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 14:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568729; x=1688160729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viYddHqy4Zdgp0J9O3iaWpIktRFOpc+3TNsEHN2SX9A=;
        b=hVqCB7aFrL5Nthi8pAlbjPvcInjFZt1qHkddABmx8gtVThNjktDfpfcNDFDlw5CG2+
         3xRmURAs/k2Nz9kNjLGLhiem3PMoX9/E6HDghH1XQlgENBdym8j3RSqFBZDSSy/b34yh
         AE2QmRwS6oPUlHWjPpeT/6u7AJu6WV2M048WkEp+vu4WP+h6zxRkbzSalddZaQ9VOuvn
         LGPsCzdTJ+5x5K0wsh8kq5o2Vj7pKu44k/mXiACQfaNUMTBzpYonaoHUeQuALtzvZCNz
         9M8tSd6AM43Q88HJNwRerrYrxc+HBnHCgqChwQ1i4KI3ds/XwizMZlg5u8MI061tV0gV
         yEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568729; x=1688160729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=viYddHqy4Zdgp0J9O3iaWpIktRFOpc+3TNsEHN2SX9A=;
        b=ETT+sioH5cVTnOXy8ff1V55qgU5YhF5hw/MwpqxhjUNqhKyyPHXyL4wvmGtYgLS/Rq
         sD636m95tPqE10dsod/dg7ahXybZ0ur99kEaqNsj5zmOCar/CgK1kUjNKLpXONjlpxNW
         fbHuvleTC628FleD7ILgkFedhsDTBt7gJvdMc544bMPqHjnBzULyUQUGFJ2rgkN8cJxb
         IpebxNWmwAvfkntHWsfxmjwgNxnPHVDJNJvnhv+rllGu6WAz+WbWpwxWxa6EFFWQLkjp
         tsC0CXIyAjcp60bFogCdpzGs7oxzeopmOeS2HhmP2DU1bUd/vsWu7TsxLOhtjopYp9BE
         lJUw==
X-Gm-Message-State: AC+VfDwbmVHFFmu7zAqQsuVlukOIZ9u+EBF9cUR8AaI5T256C14YQJUl
	mt6bRQWgLHtoMc7e6dGTe/k=
X-Google-Smtp-Source: ACHHUZ7dIRO2Itz1UIyUgFPRBSeGYhHu2aqfX+t+ZClzgP9Es2W2C4cR0F0LltUImCNhGQXKVAT26w==
X-Received: by 2002:a81:48ce:0:b0:565:62eb:db6 with SMTP id v197-20020a8148ce000000b0056562eb0db6mr28101ywa.42.1685568728711;
        Wed, 31 May 2023 14:32:08 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:32:08 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 30/34] sh: Convert pte_free_tlb() to use ptdescs
Date: Wed, 31 May 2023 14:30:28 -0700
Message-Id: <20230531213032.25338-31-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sh/include/asm/pgalloc.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index a9e98233c4d4..5d8577ab1591 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -2,6 +2,7 @@
 #ifndef __ASM_SH_PGALLOC_H
 #define __ASM_SH_PGALLOC_H
 
+#include <linux/mm.h>
 #include <asm/page.h>
 
 #define __HAVE_ARCH_PMD_ALLOC_ONE
@@ -31,10 +32,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
 }
 
-#define __pte_free_tlb(tlb,pte,addr)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif /* __ASM_SH_PGALLOC_H */
-- 
2.40.1

