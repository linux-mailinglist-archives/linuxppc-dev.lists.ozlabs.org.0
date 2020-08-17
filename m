Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57752247B3E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 01:48:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVrMz3DNBzDqWj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 09:48:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UxWjW/D7; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVrCK4zxLzDqWF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 09:41:01 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id w9so13839660qts.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 16:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RjgwGRxdBS3CJp5E+JEkyraM8vOppBs1YDLxTK5wbyg=;
 b=UxWjW/D7rIwoPmW420O/n0NNF2zEDTI34NFG87JTiOdOvC5B3kQxYtmdI62uwMRemR
 koDJdeZn0jAMWHHk5IzB2JfCsnZZ9uJ/TWwEDbLBbMcjdGqk3ad3IJeN4VQMJ49rZhMh
 mY5L/jyj1WGawxCrVwsH1n+zzg5h3HPonmKBwJSYbj2nW9YtC7l0dwV8yvnZy2+PT/yf
 fEKOCKbyR8PbwIlwm0t3YxZyRgL/u1Sn1TE9aCCtXnnm3bgQu5Ir9Qehma05SMTIM/YV
 O6QAvmh+g/gmVldFeNusreKYPq3c1FlFQU62KLjYpNmtdGnlLVKq+h+UkkQA0ZVk+aPa
 O1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RjgwGRxdBS3CJp5E+JEkyraM8vOppBs1YDLxTK5wbyg=;
 b=YnKG26QVJZpf7umRbX/Ovne7+4A1jT2kduI4MxlpjrFfN9etgxlB+DXgh1LDIlMMZe
 xQIuWBlf5gfeAwzhNz7IfPIrrLjaNmdRz8sGl52EUEp9DyPOnTZkFp0uElrB661fkIS2
 ZbppvMnuV/NtC9QUr1OAQpYI7EXaV4yGEoUKn8xpoySqYxjogch6FGKPflJgA64ADtAD
 QM7qlj+ITRzJd5wDHE221/LHke2XS+/wTRyeD9RsFVea94KBz6LG9QnhkQMzbV5a/8Hx
 PaEse6WP00ymN7IlKqc5oWeXuXLjDayOZAhXmfXchTmx8c48aFilGWLv7ZByGKDyx5Rp
 2kRQ==
X-Gm-Message-State: AOAM530WGKl6E2sOv1o0ZwlSEGekmKDWRKOBZOKvBog9QGGxOdXIAZM/
 SRHE7xlo7urk01FTmkFD5KA=
X-Google-Smtp-Source: ABdhPJwdtEVA+ecpCjAMtBhx9QjPLpaTD1ltjRMZO2bzmBNbk9dq2e7IckM4wM1jw6K8XvzXc1OexQ==
X-Received: by 2002:aed:36c8:: with SMTP id f66mr15680464qtb.6.1597707658747; 
 Mon, 17 Aug 2020 16:40:58 -0700 (PDT)
Received: from LeoBras.ibmuc.com ([177.35.193.93])
 by smtp.gmail.com with ESMTPSA id w58sm22342868qth.95.2020.08.17.16.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 16:40:58 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Subject: [PATCH v1 02/10] powerpc/kernel/iommu: Align size for IOMMU_PAGE_SIZE
 on iommu_*_coherent()
Date: Mon, 17 Aug 2020 20:40:25 -0300
Message-Id: <20200817234033.442511-3-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200817234033.442511-1-leobras.c@gmail.com>
References: <20200817234033.442511-1-leobras.c@gmail.com>
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

Both iommu_alloc_coherent() and iommu_free_coherent() assume that once
size is aligned to PAGE_SIZE it will be aligned to IOMMU_PAGE_SIZE.

Update those functions to guarantee alignment with requested size
using IOMMU_PAGE_ALIGN() before doing iommu_alloc() / iommu_free().

Also, on iommu_range_alloc(), replace ALIGN(n, 1 << tbl->it_page_shift)
with IOMMU_PAGE_ALIGN(n, tbl), which seems easier to read.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/kernel/iommu.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 9704f3f76e63..d7086087830f 100644
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
@@ -900,11 +901,11 @@ void iommu_free_coherent(struct iommu_table *tbl, size_t size,
 			 void *vaddr, dma_addr_t dma_handle)
 {
 	if (tbl) {
-		unsigned int nio_pages;
+		size_t size_io = IOMMU_PAGE_ALIGN(size, tbl);
+		unsigned int nio_pages = size_io >> tbl->it_page_shift;
 
-		size = PAGE_ALIGN(size);
-		nio_pages = size >> tbl->it_page_shift;
 		iommu_free(tbl, dma_handle, nio_pages);
+
 		size = PAGE_ALIGN(size);
 		free_pages((unsigned long)vaddr, get_order(size));
 	}
-- 
2.25.4

