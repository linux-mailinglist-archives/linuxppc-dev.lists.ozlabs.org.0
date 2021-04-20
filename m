Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4EB3651A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 06:54:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPWZH4ZrPz30Bm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 14:54:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bq2Fqkoq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bq2Fqkoq; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPWYs23z1z2xb7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 14:54:22 +1000 (AEST)
Received: by mail-qk1-x733.google.com with SMTP id t17so9750762qkg.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 21:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=knEsnqVVpHBAjh8i95W10HK2zNEcEEQ59QU8Kyx/Vek=;
 b=bq2FqkoqFeOqQJDjYkFKExA6zH8OpGUykxjhtJTGayymtQoErLUJeDmJs6EZ/rNSs0
 ndAnArkadebgcSDRHxAknJxszrFhVcvkzaXQfDMxbYGSNXNCXouNBUJ3a/XMvXgSpK0M
 W2lEIcAGeetVj2JZkpxgGTxUQqiTJFqwG1Otde4GWCKdvcp2LbN3DcmQMUyC8pszxcfo
 WwSA46Cy3r9KdLqPaCkwthNlajAATRD0lDadB92WDtRFZY0zkotr+LBRqIm6ZS+UL+wW
 Ea8ZRsd5tZchDCYfRRrWT9ojV9J2CmO8S1op2ysGbDZegRIhYpmhVNdqc6HXK9+cofjr
 K7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=knEsnqVVpHBAjh8i95W10HK2zNEcEEQ59QU8Kyx/Vek=;
 b=SwIhO2NvYRXqa+zcsF4MESkXIAizaeOSP0u6Omqz2inG0hNl9RsIEhWSmi7YO+d4lg
 QHzlD3DUYO5Lox2WO+TI9kHhYX4l4iH2sdlOs4cv1NLKVQ1wDvDRNtMBXHtddMZK82rI
 Lra47JccqVjIHzeYBEQxrjASBxghIeP8RQu5pFwZeGxNVGEHI37RsLWrINhmSIhM4xbQ
 aKqcuCUVsK/mQDnZAco6d9u6U5JJfDIVszp9uW0+q1yyHxjgyb1SeT3Bl0ILOFAW+4ZV
 eTUJmM7u8Y7RBa07OCBhC+oyzWZxLpRVh1C5Qq4vYydEKg8FxjYQIx1diY4JbcJUGxR9
 /jCA==
X-Gm-Message-State: AOAM530vZgyhCLjMCOK+WXFQ4Q2gqrgqkRxLc6CYO0F6QetstARzHyGs
 GCpBAO+nssjR43cXTPxL1Xk=
X-Google-Smtp-Source: ABdhPJyoJY8zIXqIQ542ji0NV7LsWtIE3/ZDBBL5Hhcs46ZrQzz7kOr/MoUgzDkXTMF4fQVLUhNWFA==
X-Received: by 2002:ae9:e912:: with SMTP id x18mr15662415qkf.315.1618894459007; 
 Mon, 19 Apr 2021 21:54:19 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([177.35.200.187])
 by smtp.gmail.com with ESMTPSA id y29sm10930176qtm.13.2021.04.19.21.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 21:54:18 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH 1/1] powerpc/pseries/iommu: Fix window size for direct mapping
 with pmem
Date: Tue, 20 Apr 2021 01:54:04 -0300
Message-Id: <20210420045404.438735-1-leobras.c@gmail.com>
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

As of today, if the DDW is big enough to fit (1 << MAX_PHYSMEM_BITS) it's
possible to use direct DMA mapping even with pmem region.

But, if that happens, the window size (len) is set to
(MAX_PHYSMEM_BITS - page_shift) instead of MAX_PHYSMEM_BITS, causing a
pagesize times smaller DDW to be created, being insufficient for correct
usage.

Fix this so the correct window size is used in this case.

Fixes: bf6e2d562bbc4("powerpc/dma: Fallback to dma_ops when persistent memory present")
Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 9fc5217f0c8e..836cbbe0ecc5 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1229,7 +1229,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	if (pmem_present) {
 		if (query.largest_available_block >=
 		    (1ULL << (MAX_PHYSMEM_BITS - page_shift)))
-			len = MAX_PHYSMEM_BITS - page_shift;
+			len = MAX_PHYSMEM_BITS;
 		else
 			dev_info(&dev->dev, "Skipping ibm,pmemory");
 	}
-- 
2.30.2

