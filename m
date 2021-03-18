Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A18A340C0E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 18:45:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1ZDk317jz3c1Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 04:45:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FeXkUZk/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FeXkUZk/; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1ZDJ6WKdz2yhv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 04:45:02 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id s2so4702087qtx.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 10:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/cC0KVk2XWbXM3Otj4QsoyPSVbzBYQOGnqzN6CjxIbE=;
 b=FeXkUZk/+jDkciewd2ndeEV3yUAZPtXfx1KYDp4l1woVuAd0/6XTG7mKJI2sKXW/Ix
 fLQvPaJaIYLZvRE3U8DS4bIWeV132hq3TBcWMF/PyfxbqjcANpCVVc+amyvqYMp43ONv
 I/xsmzk8GXlHC1vjq+FQfsWJpcYAkU71FxL2bXyFU7PQ6pXxcYQ83nfdGCO4Vm/Xl84Z
 VkZyKl8IUEPgKrE0/hsbVeirVo5i6VtmEox3I7aRFOn4FlR1g3ymDhIKOBMxQZrf/tdx
 OZaLvT1uw3fy05pZI8twJusIBMaEq0DUhFGV3Fkq/pf2jh4iFNsyC8khGrztvBUPaVGs
 bIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/cC0KVk2XWbXM3Otj4QsoyPSVbzBYQOGnqzN6CjxIbE=;
 b=k+xRmNkAmg7GhC15XowoRkRsh2n85mQGJ38DD6rPuKJGUlckSbMALw6VFXtEuMSNug
 Cmt9RJIntAEtH8iiScxyHbx3SjyZ/gjV3bbc/52WnTM82suqqdn99us8KZHR3I0MqDON
 hf0Q8sV/ERqeD/DYAexmsC5VIrjvCihsxsqNBdKyAZHG3En2IpL9mHk2OdjWehKr3RgN
 NoQpYVHYh8Ss/OsaU+i9Z5SddIH3LP0Y8vDYMLufRyVHPil0PoFjGDxeh15v65qFtztR
 aBhLqpzcKqzMyjtkNz3CFGc+PSeVq+y5m6lE0lCuM3IMBSEz+9azbT1dRdw9x/5TYOOP
 7J5A==
X-Gm-Message-State: AOAM530SRdjkrqm/GabHZcvXkAeEW1o5TXmPgi+55xJxn1tsABz44g/w
 UOwLt/0WFei1lMwOwDYeMz8=
X-Google-Smtp-Source: ABdhPJx31EWK5tF+LMBJ3oGxSWTZDfT1fmQiRJmKhZA0zRDBYCRb6cKfB1Sb7CHi9VbuDVEDPmwMDA==
X-Received: by 2002:ac8:7776:: with SMTP id h22mr4998624qtu.325.1616089500685; 
 Thu, 18 Mar 2021 10:45:00 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 (179-125-249-210.dynamic.desktop.com.br. [179.125.249.210])
 by smtp.gmail.com with ESMTPSA id p8sm1940785qtu.8.2021.03.18.10.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 10:45:00 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH 1/1] powerpc/kernel/iommu: Align size for IOMMU_PAGE_SIZE() to
 save TCEs
Date: Thu, 18 Mar 2021 14:44:14 -0300
Message-Id: <20210318174414.684630-1-leobras.c@gmail.com>
X-Mailer: git-send-email 2.29.2
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
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/iommu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 5b69a6a72a0e..3329ef045805 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -851,6 +851,7 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
 	unsigned int order;
 	unsigned int nio_pages, io_order;
 	struct page *page;
+	size_t size_io = size;
 
 	size = PAGE_ALIGN(size);
 	order = get_order(size);
@@ -877,8 +878,9 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
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
@@ -893,10 +895,9 @@ void iommu_free_coherent(struct iommu_table *tbl, size_t size,
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
2.29.2

