Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CEA26661C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 19:21:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp2c35VJKzDqtv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 03:21:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lFwSMGCN; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp2P42WFYzDqsH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 03:12:08 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id t20so8409514qtr.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 10:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aw85+UqyidAe2hKfEz2eXEJZcZy1gx6vda5mlAxA9S0=;
 b=lFwSMGCN2VCqQmfLH6jQeDobt0/S/hR4KVokdNiJHshio2Yq3Jcw12I6C/zHiCs3ls
 7snZBJnHuEiayWMHN/YylBcpaP3n/z3RXuNHQVscithZNxSskrWCHB7NrVuwSZeBy++2
 GsQvi9sTtOGVV/0Vkp+Z6U4R6GvpgmI6xz0mTkziUL4yAMCirYcn+OinA0gaO0u+nI4/
 idXvhMnBR5HkBlZTnd8t9X44iIRBzKrbV8PupE51klfxTExmcZeXsvEyCkNzpO6qrTTU
 Qo4IeTFv/saeyu9XFV3WK0hALEZt3I0rmqaOT7HoF6NmgRxY0P5x49xZmgqF9WLMuRbx
 oFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aw85+UqyidAe2hKfEz2eXEJZcZy1gx6vda5mlAxA9S0=;
 b=emE+gZL/f+pEZzRn46wiu3RhRlh0fSGgJoqgPzp+MHjlypSbFE2YSMHviVeXnh3PWO
 ETq30v+3DglKsoxKF79Mk5vXiJJPk4fnESwg2WJ4H3XckrtdTNBnHVkOyPmONTL7r2oF
 spqxgGAfmS16KjWbUMoVt3qMzCrrPez+RLfmRRla2Vu2Qyj2p7em2CHcqO7+9cJooLXF
 iGvzRqekNon3RrsuTgIn/nWZKEZQWdNsVpuiEjmndrG741Gc6RvP7GohUzlg5X2ozWeo
 ANa37YVA1aLvbTYI6dVIxqlbG05L8egIpUFL5YJxUuUjffHbZrhCFsMjfzO7UgbwI9vz
 1dnQ==
X-Gm-Message-State: AOAM5327nbx8I2KUwoOm+p2+OeyRFkqNsBeCjuCqnOT0W9mt0B0Pq8aS
 yW8ZE8d2K/6Rr3B95Jakeww=
X-Google-Smtp-Source: ABdhPJx9d9kknUVZ+uuFnEdKRRu1iglcSMg/ziDo70E1eTpHpvzdlGDzsTwKvPDNHBtZiNHNR1nNRw==
X-Received: by 2002:ac8:705d:: with SMTP id y29mr2847720qtm.231.1599844325478; 
 Fri, 11 Sep 2020 10:12:05 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-254-96.dynamic.desktop.com.br.
 [179.125.254.96])
 by smtp.gmail.com with ESMTPSA id l5sm3533330qtc.28.2020.09.11.10.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 10:12:04 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Subject: [PATCH v2 03/14] powerpc/kernel/iommu: Align size for
 IOMMU_PAGE_SIZE() to save TCEs
Date: Fri, 11 Sep 2020 14:07:28 -0300
Message-Id: <20200911170738.82818-4-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200911170738.82818-1-leobras.c@gmail.com>
References: <20200911170738.82818-1-leobras.c@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 

Currently both iommu_alloc_coherent() and iommu_free_coherent() align the
desired allocation size to PAGE_SIZE, and gets system pages and IOMMU
mappings (TCEs) for that value.

When IOMMU_PAGE_SIZE < PAGE_SIZE, this behavior may cause unnecessary
TCEs to be created for mapping the whole system page.

Example:
- PAGE_SIZE = 64k, IOMMU_PAGE_SIZE() = 4k
- iommu_alloc_coherent() is called for 128 bytes
- 1 system page (64k) is allocated
- 16 IOMMU pages (16 x 4k) are allocated (16 TCEs used)

It would be enough to use a single TCE for this, so 15 TCEs are
wasted in the process.

Update iommu_*_coherent() to make sure the size alignment happens only
for IOMMU_PAGE_SIZE() before calling iommu_alloc() and iommu_free().

Also, on iommu_range_alloc(), replace ALIGN(n, 1 << tbl->it_page_shift)
with IOMMU_PAGE_ALIGN(n, tbl), which is easier to read and does the
same.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/kernel/iommu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 9704f3f76e63..7961645a6980 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -237,10 +237,9 @@ static unsigned long iommu_range_alloc(struct device *dev,
 	}
 
 	if (dev)
-		boundary_size = ALIGN(dma_get_seg_boundary(dev) + 1,
-				      1 << tbl->it_page_shift);
+		boundary_size = IOMMU_PAGE_ALIGN(dma_get_seg_boundary(dev) + 1, tbl);
 	else
-		boundary_size = ALIGN(1UL << 32, 1 << tbl->it_page_shift);
+		boundary_size = IOMMU_PAGE_ALIGN(1UL << 32, tbl);
 	/* 4GB boundary for iseries_hv_alloc and iseries_hv_map */
 
 	n = iommu_area_alloc(tbl->it_map, limit, start, npages, tbl->it_offset,
@@ -858,6 +857,7 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
 	unsigned int order;
 	unsigned int nio_pages, io_order;
 	struct page *page;
+	size_t size_io = size;
 
 	size = PAGE_ALIGN(size);
 	order = get_order(size);
@@ -884,8 +884,9 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
 	memset(ret, 0, size);
 
 	/* Set up tces to cover the allocated range */
-	nio_pages = size >> tbl->it_page_shift;
-	io_order = get_iommu_order(size, tbl);
+	size_io = IOMMU_PAGE_ALIGN(size_io, tbl);
+	nio_pages = size_io >> tbl->it_page_shift;
+	io_order = get_iommu_order(size_io, tbl);
 	mapping = iommu_alloc(dev, tbl, ret, nio_pages, DMA_BIDIRECTIONAL,
 			      mask >> tbl->it_page_shift, io_order, 0);
 	if (mapping == DMA_MAPPING_ERROR) {
@@ -900,10 +901,9 @@ void iommu_free_coherent(struct iommu_table *tbl, size_t size,
 			 void *vaddr, dma_addr_t dma_handle)
 {
 	if (tbl) {
-		unsigned int nio_pages;
+		size_t size_io = IOMMU_PAGE_ALIGN(size, tbl);
+		unsigned int nio_pages = size_io >> tbl->it_page_shift;
 
-		size = PAGE_ALIGN(size);
-		nio_pages = size >> tbl->it_page_shift;
 		iommu_free(tbl, dma_handle, nio_pages);
 		size = PAGE_ALIGN(size);
 		free_pages((unsigned long)vaddr, get_order(size));
-- 
2.25.4

