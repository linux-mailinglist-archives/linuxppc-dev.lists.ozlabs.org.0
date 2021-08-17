Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 698623EE6BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 08:41:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GphJQ2J5Xz3cTj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 16:41:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jjEQRbVV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jjEQRbVV; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GphH63kGlz2yNZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 16:40:18 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id x5so7809373qtq.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 23:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=11QfhZZXT8JfVDYl1/SoG66DLWNqpspPq55877vwnTs=;
 b=jjEQRbVVJ3aqaNmEeivYcMEmnyn8axdwbQ86NAzkkwVPTL/mJbcQ4sNy4EvCuqFpnY
 83SIx5Tenj+W7szY/z0Hb7SkimPGRlFp+7Q6ctUtswEzweYpgQ6+aExOE6JpTg4HBJrh
 rx9ZqrJtRwcUw5UphBHS8zqoF5htDkuLwIMlEaS3xgUG4vuloccnTUQ8+xvwQ/ow270+
 PKsWG52EjIoX84DNKnsiZV3mINLiXVn0fk2xw+j5SZx1vTTax37SnfwyEdKvYaisTUUi
 xEKxLgOSEl7NIuqkrKGw2AE/k4De4zP9iO6Hmvik0pj873bVafFTRA0HR/Ox9mnOaOMV
 kpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=11QfhZZXT8JfVDYl1/SoG66DLWNqpspPq55877vwnTs=;
 b=JFEAD3yhl5LaJZtFR2IQcyJke/r4YVqphgqDD93fr0DFbP6jRM9azM4dQiupZ6QuTX
 IIWj0Wh8mPPcoSfbukpSmwHybDkPofAPCUj08MwFkv8Jp+EIA7gKHuqNBqIolsnMtuM2
 NJds6DPiYlttnSoqi3lJ89i/J8L8xzI5+O4LHjkr6Zes3+HCeXH9o5X/sbeSBGA7Zll4
 JQ81JfFLHppZOGV9ejToWE+jmnXk6hqybPOBiSp7qCPBuUm2OXNX9ivRAOWIRjjXMSzR
 WsyoqJQMmN53x7P0QgD5sfa5LYKEFaMdDvJHn0gvKA45HjqvSOs6Ng3JXSzctcdoSC58
 2UVg==
X-Gm-Message-State: AOAM5323A0wdU6RbySwJ6YRX1hZ/VJub0B3Inn0zvIn5J/r/Yl06qCAc
 XN9tOzlIdnOyPsQ49enKGKs=
X-Google-Smtp-Source: ABdhPJzYU2Hsoq7YeTJwFwen5ddxBZyE6s8yZQzRgOqFTu4o52ase3mWHCtOH4z/FUAafLxz1bRksw==
X-Received: by 2002:ac8:5d8d:: with SMTP id d13mr1636500qtx.386.1629182416048; 
 Mon, 16 Aug 2021 23:40:16 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:30b2:5c9e:50:88f3:269a])
 by smtp.gmail.com with ESMTPSA id c11sm526938qth.29.2021.08.16.23.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 23:40:15 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Nicolin Chen <nicoleotsuka@gmail.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH v6 01/11] powerpc/pseries/iommu: Replace hard-coded page shift
Date: Tue, 17 Aug 2021 03:39:19 -0300
Message-Id: <20210817063929.38701-2-leobras.c@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817063929.38701-1-leobras.c@gmail.com>
References: <20210817063929.38701-1-leobras.c@gmail.com>
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
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
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
index 0c55b991f665..b1b8d12bab39 100644
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
2.32.0

