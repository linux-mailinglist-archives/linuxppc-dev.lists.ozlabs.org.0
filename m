Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A8B36FE94
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:32:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWybD29wzz3bn4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 02:32:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=AvHtKkVe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AvHtKkVe; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWyZK1Hzgz2xxv
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 02:32:08 +1000 (AEST)
Received: by mail-qk1-x72f.google.com with SMTP id t17so42798288qkg.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 09:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xWQWoz1GIqfeB3sOPAAV8NNTSBRFI82N4HdMiBQEXUs=;
 b=AvHtKkVewNfLnEEOr5louxEQR4hqWA4gRIBMwwHDMpMu8LEOuqeR6pToI0N5EiYa76
 yuRkH5yWVtEalZYehkRdd+df5gNxPuv8rNKZhcyTXnc9Iv5smDRQY0SXKVLFD5ODtaah
 jnJUvolcRo+W8zGGBJ34SPnkCcP2o6yNwezJwaEGccaulMjrHBZBK3bl1cWdQFLcPB3j
 zvHpsQjz0EAGmLCbo716OnOI4cFAeBsjGc6xFGvVdrWM5dhKs5R+Jt4g6bVxxQ4zF1Jn
 rn7T1XYEDXVWP6QJfN6KUJwRpUrS9odmTVvb3cQLvaTzZPQFdJiIh9Kha6P6m84BQg9i
 zpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xWQWoz1GIqfeB3sOPAAV8NNTSBRFI82N4HdMiBQEXUs=;
 b=JJd9d2lq3GDK8bx2TiiAmMf0VkUNm1GjqTtKATxsc0lpJ/Cz1mgqyK+FM7AJjhtoUj
 +7cbA4yW55bvkkHOh8P3v+CbgrnKf3w65TWdnsb3bwFfoO1Wjkn8lS2Bqvq/Duevcho+
 fYSggyu4X8CjSPpi8KRvKwncRdqnzZRWHGT5CU+pdu7Z+V3FUJwIFbNJEo9VPQeUeMF+
 JEL58dPrnRfyat45gNDj+3K45gwlQ0dOgmjmTyVD0OMXOASF2bCBxbtj1IIfmCqeWYjl
 IN/XEdsFewzNZzqn+imFOHhYwnRDw8tEyHDor4QUbq4WSDV4zH0tzSLrshSlWttQBGYp
 JIpw==
X-Gm-Message-State: AOAM531v1ScYSKi/dRJJq68ZFndPkLFvj2MT/J8X6G+3D2ejLChwvEO2
 y7DRChmVvi4DdEiuo0OqwB4=
X-Google-Smtp-Source: ABdhPJyvhdPo9ZKz0t5BbyWcsx6eqQ/0YE6NRlZogbXDBEm5UEnHdGfq0J+PQa22b9YPWvmBgTshZg==
X-Received: by 2002:a05:620a:1233:: with SMTP id
 v19mr6203307qkj.418.1619800326135; 
 Fri, 30 Apr 2021 09:32:06 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 ([2804:14c:482:7b04::1001])
 by smtp.gmail.com with ESMTPSA id p1sm2624334qtu.89.2021.04.30.09.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 09:32:05 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v4 01/11] powerpc/pseries/iommu: Replace hard-coded page shift
Date: Fri, 30 Apr 2021 13:31:36 -0300
Message-Id: <20210430163145.146984-2-leobras.c@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210430163145.146984-1-leobras.c@gmail.com>
References: <20210430163145.146984-1-leobras.c@gmail.com>
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

Some functions assume IOMMU page size can only be 4K (pageshift == 12).
Update them to accept any page size passed, so we can use 64K pages.

In the process, some defines like TCE_SHIFT were made obsolete, and then
removed.

IODA3 Revision 3.0_prd1 (OpenPowerFoundation), Figures 3.4 and 3.5 show
a RPN of 52-bit, and considers a 12-bit pageshift, so there should be
no need of using TCE_RPN_MASK, which masks out any bit after 40 in rpn.
It's usage removed from tce_build_pSeries(), tce_build_pSeriesLP(), and
tce_buildmulti_pSeriesLP().

Most places had a tbl struct, so using tbl->it_page_shift was simple.
tce_free_pSeriesLP() was a special case, since callers not always have a
tbl struct, so adding a tceshift parameter seems the right thing to do.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/include/asm/tce.h         |  8 ------
 arch/powerpc/platforms/pseries/iommu.c | 39 +++++++++++++++-----------
 2 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/tce.h b/arch/powerpc/include/asm/tce.h
index db5fc2f2262d..0c34d2756d92 100644
--- a/arch/powerpc/include/asm/tce.h
+++ b/arch/powerpc/include/asm/tce.h
@@ -19,15 +19,7 @@
 #define TCE_VB			0
 #define TCE_PCI			1
 
-/* TCE page size is 4096 bytes (1 << 12) */
-
-#define TCE_SHIFT	12
-#define TCE_PAGE_SIZE	(1 << TCE_SHIFT)
-
 #define TCE_ENTRY_SIZE		8		/* each TCE is 64 bits */
-
-#define TCE_RPN_MASK		0xfffffffffful  /* 40-bit RPN (4K pages) */
-#define TCE_RPN_SHIFT		12
 #define TCE_VALID		0x800		/* TCE valid */
 #define TCE_ALLIO		0x400		/* TCE valid for all lpars */
 #define TCE_PCI_WRITE		0x2		/* write from PCI allowed */
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 67c9953a6503..796ab356341c 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -107,6 +107,8 @@ static int tce_build_pSeries(struct iommu_table *tbl, long index,
 	u64 proto_tce;
 	__be64 *tcep;
 	u64 rpn;
+	const unsigned long tceshift = tbl->it_page_shift;
+	const unsigned long pagesize = IOMMU_PAGE_SIZE(tbl);
 
 	proto_tce = TCE_PCI_READ; // Read allowed
 
@@ -117,10 +119,10 @@ static int tce_build_pSeries(struct iommu_table *tbl, long index,
 
 	while (npages--) {
 		/* can't move this out since we might cross MEMBLOCK boundary */
-		rpn = __pa(uaddr) >> TCE_SHIFT;
-		*tcep = cpu_to_be64(proto_tce | (rpn & TCE_RPN_MASK) << TCE_RPN_SHIFT);
+		rpn = __pa(uaddr) >> tceshift;
+		*tcep = cpu_to_be64(proto_tce | rpn << tceshift);
 
-		uaddr += TCE_PAGE_SIZE;
+		uaddr += pagesize;
 		tcep++;
 	}
 	return 0;
@@ -146,7 +148,7 @@ static unsigned long tce_get_pseries(struct iommu_table *tbl, long index)
 	return be64_to_cpu(*tcep);
 }
 
-static void tce_free_pSeriesLP(unsigned long liobn, long, long);
+static void tce_free_pSeriesLP(unsigned long liobn, long, long, long);
 static void tce_freemulti_pSeriesLP(struct iommu_table*, long, long);
 
 static int tce_build_pSeriesLP(unsigned long liobn, long tcenum, long tceshift,
@@ -166,12 +168,12 @@ static int tce_build_pSeriesLP(unsigned long liobn, long tcenum, long tceshift,
 		proto_tce |= TCE_PCI_WRITE;
 
 	while (npages--) {
-		tce = proto_tce | (rpn & TCE_RPN_MASK) << tceshift;
+		tce = proto_tce | rpn << tceshift;
 		rc = plpar_tce_put((u64)liobn, (u64)tcenum << tceshift, tce);
 
 		if (unlikely(rc == H_NOT_ENOUGH_RESOURCES)) {
 			ret = (int)rc;
-			tce_free_pSeriesLP(liobn, tcenum_start,
+			tce_free_pSeriesLP(liobn, tcenum_start, tceshift,
 			                   (npages_start - (npages + 1)));
 			break;
 		}
@@ -205,10 +207,11 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
 	long tcenum_start = tcenum, npages_start = npages;
 	int ret = 0;
 	unsigned long flags;
+	const unsigned long tceshift = tbl->it_page_shift;
 
 	if ((npages == 1) || !firmware_has_feature(FW_FEATURE_PUT_TCE_IND)) {
 		return tce_build_pSeriesLP(tbl->it_index, tcenum,
-					   tbl->it_page_shift, npages, uaddr,
+					   tceshift, npages, uaddr,
 		                           direction, attrs);
 	}
 
@@ -225,13 +228,13 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
 		if (!tcep) {
 			local_irq_restore(flags);
 			return tce_build_pSeriesLP(tbl->it_index, tcenum,
-					tbl->it_page_shift,
+					tceshift,
 					npages, uaddr, direction, attrs);
 		}
 		__this_cpu_write(tce_page, tcep);
 	}
 
-	rpn = __pa(uaddr) >> TCE_SHIFT;
+	rpn = __pa(uaddr) >> tceshift;
 	proto_tce = TCE_PCI_READ;
 	if (direction != DMA_TO_DEVICE)
 		proto_tce |= TCE_PCI_WRITE;
@@ -245,12 +248,12 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
 		limit = min_t(long, npages, 4096/TCE_ENTRY_SIZE);
 
 		for (l = 0; l < limit; l++) {
-			tcep[l] = cpu_to_be64(proto_tce | (rpn & TCE_RPN_MASK) << TCE_RPN_SHIFT);
+			tcep[l] = cpu_to_be64(proto_tce | rpn << tceshift);
 			rpn++;
 		}
 
 		rc = plpar_tce_put_indirect((u64)tbl->it_index,
-					    (u64)tcenum << 12,
+					    (u64)tcenum << tceshift,
 					    (u64)__pa(tcep),
 					    limit);
 
@@ -277,12 +280,13 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
 	return ret;
 }
 
-static void tce_free_pSeriesLP(unsigned long liobn, long tcenum, long npages)
+static void tce_free_pSeriesLP(unsigned long liobn, long tcenum, long tceshift,
+			       long npages)
 {
 	u64 rc;
 
 	while (npages--) {
-		rc = plpar_tce_put((u64)liobn, (u64)tcenum << 12, 0);
+		rc = plpar_tce_put((u64)liobn, (u64)tcenum << tceshift, 0);
 
 		if (rc && printk_ratelimit()) {
 			printk("tce_free_pSeriesLP: plpar_tce_put failed. rc=%lld\n", rc);
@@ -301,9 +305,11 @@ static void tce_freemulti_pSeriesLP(struct iommu_table *tbl, long tcenum, long n
 	u64 rc;
 
 	if (!firmware_has_feature(FW_FEATURE_STUFF_TCE))
-		return tce_free_pSeriesLP(tbl->it_index, tcenum, npages);
+		return tce_free_pSeriesLP(tbl->it_index, tcenum,
+					  tbl->it_page_shift, npages);
 
-	rc = plpar_tce_stuff((u64)tbl->it_index, (u64)tcenum << 12, 0, npages);
+	rc = plpar_tce_stuff((u64)tbl->it_index,
+			     (u64)tcenum << tbl->it_page_shift, 0, npages);
 
 	if (rc && printk_ratelimit()) {
 		printk("tce_freemulti_pSeriesLP: plpar_tce_stuff failed\n");
@@ -319,7 +325,8 @@ static unsigned long tce_get_pSeriesLP(struct iommu_table *tbl, long tcenum)
 	u64 rc;
 	unsigned long tce_ret;
 
-	rc = plpar_tce_get((u64)tbl->it_index, (u64)tcenum << 12, &tce_ret);
+	rc = plpar_tce_get((u64)tbl->it_index,
+			   (u64)tcenum << tbl->it_page_shift, &tce_ret);
 
 	if (rc && printk_ratelimit()) {
 		printk("tce_get_pSeriesLP: plpar_tce_get failed. rc=%lld\n", rc);
-- 
2.30.2

