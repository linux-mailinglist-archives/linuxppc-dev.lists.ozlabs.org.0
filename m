Return-Path: <linuxppc-dev+bounces-2495-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8049ABDCC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 07:32:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYHjY65K8z2yTy;
	Wed, 23 Oct 2024 16:32:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729661521;
	cv=none; b=HV54NUhixMuK7sT28r1ORhXwFLzr9JlzGRMVc8zS7OtcnICzje3eOuCe5Yilo+Q9F+R9HmRTNpzYRWtevNuN2/KNzcw8C51+xQIRU63/ZNfM9feaLK9HyOe08v4AVeq9yGYLV+ZsBoPeirbEI9UJC1Am/LuTVfNuYAZi8jVW87q+KkOiOPCeKTXapunpa61mk0nnHAp0HcKo5OUjeq3mwQSGFXbCiUyOwCLoDdcsloMLKzxcuUuUKSEQWsfNna/tmUdf2ybq3RmtZG0j7STN//mO4sKAPVYQNJ5cTBA6zwH7Fnpn0BMckIfyg0xLsoabT2cenEuVN6V/V8O7lbBTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729661521; c=relaxed/relaxed;
	bh=S0D2q0CRtr7nsIrC2QE+pdlycYvNfEIhHHD+EVRR84A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J8irrrwDb0+sdhznyxDhYCxhBc67lrbEu6bJmw28htyw44Jxu1i9vdfrrBJpun+yRk9sP40CNvsgeWy75OXrO3OFhBUE8w5+SfIolJ4zbEbno/zVVdcsuVmsyqoppyer59AFwehwF37em3RvQBRLzFuqQZVxI0eSlH5tl5q4pwbqSRtbHCBBpl+3qoIVWgPKdl+wMid2dRdSrGz35briq5lq0tcmQAH1eD/RFRlVXVBpkBM7ySrveag3AFLoXLrl2Ww5qqcZyrl47jhrTAdrHOwMJkVj0VQlECU0qbKn5qihxprA0WEtkwIXs3uFqxAgBWyGW3sZ99maKds4s370hQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yOGSNltG; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+16051c3a8dabb1c72812+7731+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yOGSNltG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+16051c3a8dabb1c72812+7731+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYHjS42qcz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 16:31:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=S0D2q0CRtr7nsIrC2QE+pdlycYvNfEIhHHD+EVRR84A=; b=yOGSNltGTKa74bm7s79mWGUqmT
	CxNszCYC+HUVJlDaOEtZZnaL5ejzGLnmmH3ATV30sglJgJz0ywg0uB+P+XM8lW3GKHGodpQr1GNWn
	PUJ1JuLvA6VWnEqZ7iacFWhoRFmQ92MGkjMyUD1t55zF/HMovaDyn7fACtYWCdjuwxRlrMSHy4ZAK
	LjjvW4uR2/ZGqgdPzDGWCvokPaIs4EycHOaAWkrtHJ7nngTB+aZyM+l5oZYZoa9DyjngyX6X2W4VJ
	lgq/WXgc76Q6SDusemcJW5TwpDXHK4t61tCQxTjflMGErwo5RcBXRltuQh7MUL1kfM52UDIKe0T35
	jNdj8agg==;
Received: from 2a02-8389-2341-5b80-8c6c-e123-fc47-94a5.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:8c6c:e123:fc47:94a5] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t3TyH-0000000D3O3-0Jzw;
	Wed, 23 Oct 2024 05:31:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux.dev
Cc: m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] dma-mapping.h: drop unneeded includes
Date: Wed, 23 Oct 2024 07:31:38 +0200
Message-ID: <20241023053146.310113-1-hch@lst.de>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Back in the day a lot of logic was implemented inline in dma-mapping.h and
needed various includes.  Move of this has long been moved out of line,
so we can drop various includes to improve kernel rebuild times.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/platforms/pseries/svm.c | 1 +
 include/linux/dma-mapping.h          | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 3b4045d508ec..384c9dc1899a 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -8,6 +8,7 @@
 
 #include <linux/mm.h>
 #include <linux/memblock.h>
+#include <linux/mem_encrypt.h>
 #include <linux/cc_platform.h>
 #include <asm/machdep.h>
 #include <asm/svm.h>
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 1524da363734..b79925b1c433 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -2,15 +2,11 @@
 #ifndef _LINUX_DMA_MAPPING_H
 #define _LINUX_DMA_MAPPING_H
 
-#include <linux/cache.h>
-#include <linux/sizes.h>
-#include <linux/string.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/dma-direction.h>
 #include <linux/scatterlist.h>
 #include <linux/bug.h>
-#include <linux/mem_encrypt.h>
 
 /**
  * List of possible attributes associated with a DMA mapping. The semantics
-- 
2.45.2


