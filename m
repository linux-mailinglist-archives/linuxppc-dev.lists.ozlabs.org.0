Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AAC358ED4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 22:56:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGYT654JLz3bTs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 06:56:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hPD3m+Hb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hPD3m+Hb; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGYSg5XFYz30BJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 06:55:46 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id g20so3769224qkk.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Apr 2021 13:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjjrWLOd+wnSFUUoajua48yZLA0y5VjsGqmoCyZiy74=;
 b=hPD3m+HbuA0TauWY/jX9or6vW8OZOVympwKhzk3nUDa1u0oIewLQWCBEGMDcR179cW
 ndmO2Wdf2C59DDCO7bnQ0FQswNsRDJwABlH/jcMTsKDeOJFPX/ZFqXbqcuwGq0pWEoXZ
 x+7+zOLW3MTJrB8d/uz2wSFhNjknWNG+dhBLV+eqVR/qmGVmi35Bwe/s+KELU0bjLMko
 TbVgOdcUpbVyHUZ5duWaCohZPHy36oqfzD7yLdYk3fkSNRKMrt4YDEsv/4C3hNpGtI5k
 mvAfTwJJYcpIenCFLLE5ttnLEPYcvRB0F4yKeOG5/aLvX6iUFrdayfqyEXMo9mQhgZT4
 Lr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjjrWLOd+wnSFUUoajua48yZLA0y5VjsGqmoCyZiy74=;
 b=nNLyhgxAWAhq1mYvui7Z8kbbpx5LtsiqJyUIxlmK1frlQ3sCKFWVEPTfn2JBjDFmxK
 1oT7pBtjOr7tQpm67uDeEBKBYZvFaJmiEeJ4/8o+7zCAM//eMFhTauDgAm/apXq7TBZk
 XvxVrnvsxRuJ2tu5bDzmCY0LGO3zcsY9H737OYApUvzZZQs37ooha1SgVnFyohS/pWPv
 zMS8KSEk0JZWkubzvHbriKYTn0kZsWhv284FdRKL91OR/ZPBMcFdWWacn3oSZcmBXcTJ
 ElW+patSjrB+2KBHvPhmAML29Bq/F1ne3cB+8/KbAgRhkZDMbEfvZrXMBJVK9v1PQ3qx
 t9Mw==
X-Gm-Message-State: AOAM530TYwILKNwbRi+QmsGcMuXq/2n1AxJKl/fF5AI1IeMtL1xnvk3x
 3w/ZnHSVxGEjMvu+8X+V/oQ=
X-Google-Smtp-Source: ABdhPJxAGP4IcaK5aUHzAHHeaoBzXHgNUkKtebsPetrYDiGHYUv0dHLLo+wnithZ/HunWvcgBsWwnQ==
X-Received: by 2002:a37:9e50:: with SMTP id h77mr10562580qke.138.1617915342082; 
 Thu, 08 Apr 2021 13:55:42 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 ([2804:14c:482:7b04::1000])
 by smtp.gmail.com with ESMTPSA id g2sm517604qtu.0.2021.04.08.13.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 13:55:41 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, brking@linux.vnet.ibm.com
Subject: [PATCH v3 1/1] powerpc/iommu: Enable remaining IOMMU Pagesizes
 present in LoPAR
Date: Thu,  8 Apr 2021 17:19:16 -0300
Message-Id: <20210408201915.174217-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

According to LoPAR, ibm,query-pe-dma-window output named "IO Page Sizes"
will let the OS know all possible pagesizes that can be used for creating a
new DDW.

Currently Linux will only try using 3 of the 8 available options:
4K, 64K and 16M. According to LoPAR, Hypervisor may also offer 32M, 64M,
128M, 256M and 16G.

Enabling bigger pages would be interesting for direct mapping systems
with a lot of RAM, while using less TCE entries.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
Changes since v2:
 - Restore 'int array & shift' strategy
 - Remove defines for RTAS "IO Page Size" output of ibm,query-pe-dma-window
 - Added/Improved comments
Link: http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210407195613.131140-1-leobras.c@gmail.com/
Changes since v1:
- Remove page shift defines, replace by __builtin_ctzll(SZ_XXX)
- Add bit field defines for RTAS "IO Page Shift" output of ibm,query-pe-dma-window
- Use struct array instead of int array to be more explicit on pagesizes
Link: http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210322190943.715368-1-leobras.c@gmail.com/ 

 arch/powerpc/platforms/pseries/iommu.c | 37 +++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 9fc5217f0c8e..67c9953a6503 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1099,6 +1099,33 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
 			 ret);
 }
 
+/* Return largest page shift based on "IO Page Sizes" output of ibm,query-pe-dma-window. */
+static int iommu_get_page_shift(u32 query_page_size)
+{
+	/* Supported IO page-sizes according to LoPAR */
+	const int shift[] = {
+		__builtin_ctzll(SZ_4K),   __builtin_ctzll(SZ_64K), __builtin_ctzll(SZ_16M),
+		__builtin_ctzll(SZ_32M),  __builtin_ctzll(SZ_64M), __builtin_ctzll(SZ_128M),
+		__builtin_ctzll(SZ_256M), __builtin_ctzll(SZ_16G)
+	};
+
+	int i = ARRAY_SIZE(shift) - 1;
+
+	/*
+	 * On LoPAR, ibm,query-pe-dma-window outputs "IO Page Sizes" using a bit field:
+	 * - bit 31 means 4k pages are supported,
+	 * - bit 30 means 64k pages are supported, and so on.
+	 * Larger pagesizes map more memory with the same amount of TCEs, so start probing them.
+	 */
+	for (; i >= 0 ; i--) {
+		if (query_page_size & (1 << i))
+			return shift[i];
+	}
+
+	/* No valid page size found. */
+	return 0;
+}
+
 /*
  * If the PE supports dynamic dma windows, and there is space for a table
  * that can map all pages in a linear offset, then setup such a table,
@@ -1206,13 +1233,9 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 			goto out_failed;
 		}
 	}
-	if (query.page_size & 4) {
-		page_shift = 24; /* 16MB */
-	} else if (query.page_size & 2) {
-		page_shift = 16; /* 64kB */
-	} else if (query.page_size & 1) {
-		page_shift = 12; /* 4kB */
-	} else {
+
+	page_shift = iommu_get_page_shift(query.page_size);
+	if (!page_shift) {
 		dev_dbg(&dev->dev, "no supported direct page size in mask %x",
 			  query.page_size);
 		goto out_failed;
-- 
2.30.2

