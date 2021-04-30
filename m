Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB32936FE96
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:33:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWybj5QkCz3bvK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 02:33:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qFwcpe5Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qFwcpe5Y; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWyZN1LBZz2yyt
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 02:32:12 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id 1so52042961qtb.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 09:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I4QRVxLCAXlMYXP/RCpevP+dV/qRZSoD5enD89iFcqY=;
 b=qFwcpe5Y1475O5k50BkxZMR3qD6vW1DIUbs/kEgfV2D/ey0ZHC/pAsm+YjWIt5ZDOP
 WEBRGN153hcoXmytAxffhYArAR64OAXc5FQ8ECuWOe8qId/iPafv/gPqsLcvRfi0+976
 qISwZj95vFcTD9fIkmg/2e7CzHGP5GmeRhJwCeJnBkCt2bgT01byzTqcpxvBTDz6myIk
 5Vt2urRTB5Q4J4CB4fJ7HNRfsMdDOF5BEKRGKKckNjo7XtQDsfp9Bq0fH0rgyoczNM92
 krqzdUdpSjc6lQaqT2LVBCLrbKKn9AoMliyEIRdbtHIbCNcernzL9n60sK7o8kaoSlGP
 9jNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I4QRVxLCAXlMYXP/RCpevP+dV/qRZSoD5enD89iFcqY=;
 b=rEIf6S/9dPnz7pLXcRyc2LhhSqNVFuoYEIu9RfWifNfNY9qfyoxnIoNQbUU0fM1eX9
 bMP9kmsNmMS1VQ1c+eSvn2JWfJafzerTE8aCEyrA8bQTRr/a9zhpkw9QxZaajcJZHMzZ
 z5OTRgCkX24Te1Q5mLsRVOEvI1WVbWTOWsoN2ZRaZoJMEYsp6pbYk2AFDmYlcCPujB3J
 4afzabS2nhj82yYk4IvkHKPe4EDMxHSZzlNOPIfk+nbjPTwjqk1z0l6Uim+Etl+NJUdk
 2E2MS4dJolY9xEWh/kc0kiAJp1v0MTboyfQIvKpi5m6UGXuY+MmQx2WpAAB0ZAJo4Moe
 NYaQ==
X-Gm-Message-State: AOAM533LtLQwdXBCoV4NnjzwyC/IWUQ0M+1u6GoLmrlsxn0ggwdSLLzk
 eLI9+bkX8jZguvxPTbN4Bno=
X-Google-Smtp-Source: ABdhPJxZlx+8siUQANjeDJF/jHb9HeHjTomfkZdKXEvvYqrclxqfxiI3uaQ/QfSmmepXY8+igcSNVQ==
X-Received: by 2002:ac8:e09:: with SMTP id a9mr5307013qti.238.1619800329681;
 Fri, 30 Apr 2021 09:32:09 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 ([2804:14c:482:7b04::1001])
 by smtp.gmail.com with ESMTPSA id p1sm2624334qtu.89.2021.04.30.09.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 09:32:09 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v4 02/11] powerpc/kernel/iommu: Add new iommu_table_in_use()
 helper
Date: Fri, 30 Apr 2021 13:31:37 -0300
Message-Id: <20210430163145.146984-3-leobras.c@gmail.com>
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

Having a function to check if the iommu table has any allocation helps
deciding if a tbl can be reset for using a new DMA window.

It should be enough to replace all instances of !bitmap_empty(tbl...).

iommu_table_in_use() skips reserved memory, so we don't need to worry about
releasing it before testing. This causes iommu_table_release_pages() to
become unnecessary, given it is only used to remove reserved memory for
testing.

Also, only allow storing reserved memory values in tbl if they are valid
in the table, so there is no need to check it in the new helper.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/include/asm/iommu.h |  1 +
 arch/powerpc/kernel/iommu.c      | 65 ++++++++++++++++----------------
 2 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index deef7c94d7b6..bf3b84128525 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -154,6 +154,7 @@ extern int iommu_tce_table_put(struct iommu_table *tbl);
  */
 extern struct iommu_table *iommu_init_table(struct iommu_table *tbl,
 		int nid, unsigned long res_start, unsigned long res_end);
+bool iommu_table_in_use(struct iommu_table *tbl);
 
 #define IOMMU_TABLE_GROUP_MAX_TABLES	2
 
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index ad82dda81640..5e168bd91401 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -691,32 +691,24 @@ static void iommu_table_reserve_pages(struct iommu_table *tbl,
 	if (tbl->it_offset == 0)
 		set_bit(0, tbl->it_map);
 
-	tbl->it_reserved_start = res_start;
-	tbl->it_reserved_end = res_end;
-
-	/* Check if res_start..res_end isn't empty and overlaps the table */
-	if (res_start && res_end &&
-			(tbl->it_offset + tbl->it_size < res_start ||
-			 res_end < tbl->it_offset))
-		return;
+	if (res_start < tbl->it_offset)
+		res_start = tbl->it_offset;
 
-	for (i = tbl->it_reserved_start; i < tbl->it_reserved_end; ++i)
-		set_bit(i - tbl->it_offset, tbl->it_map);
-}
+	if (res_end > (tbl->it_offset + tbl->it_size))
+		res_end = tbl->it_offset + tbl->it_size;
 
-static void iommu_table_release_pages(struct iommu_table *tbl)
-{
-	int i;
+	/* Check if res_start..res_end is a valid range in the table */
+	if (res_start >= res_end) {
+		tbl->it_reserved_start = tbl->it_offset;
+		tbl->it_reserved_end = tbl->it_offset;
+		return;
+	}
 
-	/*
-	 * In case we have reserved the first bit, we should not emit
-	 * the warning below.
-	 */
-	if (tbl->it_offset == 0)
-		clear_bit(0, tbl->it_map);
+	tbl->it_reserved_start = res_start;
+	tbl->it_reserved_end = res_end;
 
 	for (i = tbl->it_reserved_start; i < tbl->it_reserved_end; ++i)
-		clear_bit(i - tbl->it_offset, tbl->it_map);
+		set_bit(i - tbl->it_offset, tbl->it_map);
 }
 
 /*
@@ -781,6 +773,22 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
 	return tbl;
 }
 
+bool iommu_table_in_use(struct iommu_table *tbl)
+{
+	unsigned long start = 0, end;
+
+	/* ignore reserved bit0 */
+	if (tbl->it_offset == 0)
+		start = 1;
+	end = tbl->it_reserved_start - tbl->it_offset;
+	if (find_next_bit(tbl->it_map, end, start) != end)
+		return true;
+
+	start = tbl->it_reserved_end - tbl->it_offset;
+	end = tbl->it_size;
+	return find_next_bit(tbl->it_map, end, start) != end;
+}
+
 static void iommu_table_free(struct kref *kref)
 {
 	unsigned long bitmap_sz;
@@ -799,10 +807,8 @@ static void iommu_table_free(struct kref *kref)
 
 	iommu_debugfs_del(tbl);
 
-	iommu_table_release_pages(tbl);
-
 	/* verify that table contains no entries */
-	if (!bitmap_empty(tbl->it_map, tbl->it_size))
+	if (iommu_table_in_use(tbl))
 		pr_warn("%s: Unexpected TCEs\n", __func__);
 
 	/* calculate bitmap size in bytes */
@@ -1108,18 +1114,13 @@ int iommu_take_ownership(struct iommu_table *tbl)
 	for (i = 0; i < tbl->nr_pools; i++)
 		spin_lock(&tbl->pools[i].lock);
 
-	iommu_table_release_pages(tbl);
-
-	if (!bitmap_empty(tbl->it_map, tbl->it_size)) {
+	if (iommu_table_in_use(tbl)) {
 		pr_err("iommu_tce: it_map is not empty");
 		ret = -EBUSY;
-		/* Undo iommu_table_release_pages, i.e. restore bit#0, etc */
-		iommu_table_reserve_pages(tbl, tbl->it_reserved_start,
-				tbl->it_reserved_end);
-	} else {
-		memset(tbl->it_map, 0xff, sz);
 	}
 
+	memset(tbl->it_map, 0xff, sz);
+
 	for (i = 0; i < tbl->nr_pools; i++)
 		spin_unlock(&tbl->pools[i].lock);
 	spin_unlock_irqrestore(&tbl->large_pool.lock, flags);
-- 
2.30.2

