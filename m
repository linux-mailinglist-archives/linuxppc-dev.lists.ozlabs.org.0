Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFEE3CB433
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 10:29:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GR4Cf1484z3bxt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 18:29:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=C6gJtDPi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C6gJtDPi; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GR4BC1qPXz2yyP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 18:28:03 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id g8so6581831qtj.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 01:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0uhyjd06rye2Lt4itGL2yWFEWzknsfkWKzMVknqoxjo=;
 b=C6gJtDPi+QgGe0I/KAHMbCxzK8Ql4CGthKaGsRL3mpXJNJgSpkPnNbX1iX9WaLSx7v
 tsyOUEcLkMuv1Hjc/vm5veyPLShvl1askpHZjzC5STyv5zYJMZA6ReUi5Hn9V2hnzkKJ
 g7Ow4pzMLJAmcYKAeWIIgI+6yaV6VK/ZhgQfcI1oOQw2uI0MaZKNRDPUjyYd66RHZ1VH
 uozwxGY8mvnFxabW4EjbBwuqUAVEfNY79HsCFuPMJM8vijXSxtRXKWcRFs3hXtwbQ4re
 e5rX2do7cIiye+l4ogGMFOqMQVeEm2Ub+slzlJpgdKXGM2jL2gIW5lGjJqNjgc7HjrmX
 TKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0uhyjd06rye2Lt4itGL2yWFEWzknsfkWKzMVknqoxjo=;
 b=qB3uBkigvNWEQpWl4MEblEAoDnZBTlqD4HQ6StzHjeFheUZwL0PiygYUEZ/HCPMTqC
 Y9hIyqvMvWuT70K30ycI7SLNsqpfeVdnz2ikxnf0tcAysQnzRQcGqwiXjg9mQjKN+vX7
 tPWNh7s7cVbOmVuUBSO8grNycTFXUnh8wTdk4hLfHR+LlXo2KOvtguRAlEJU7KvCYvq+
 NXpQCMO58lp4cSLrwgnZ56LIkwmnFkgHA6LjtcjyO6ddjRKn8DMvxprmYc/gmuxv6zum
 EC5PAUDnY7X5X2y3x5wc5FMNYw+QPDa6DtGlFKA3Q3jRu4pjxwxS5VrZPZr+bKhFxChL
 LyrA==
X-Gm-Message-State: AOAM530RKIIG/+KMUwEGz2ao7Q2swVcDkD29PjXZqQZCyQHQrhTnXe/+
 RU7mQSh6/IVeU9dmes9EY3o=
X-Google-Smtp-Source: ABdhPJxsnceLRCp9Soj8SJY4Lj3vpWs99j2D8GPEcK3bP8ORPfbRdGn86qVdxwAXpCC6W+ojvIkapA==
X-Received: by 2002:a05:622a:138d:: with SMTP id
 o13mr7943854qtk.134.1626424080614; 
 Fri, 16 Jul 2021 01:28:00 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:14c:482:92eb:ffdf:6b35:b94d:258])
 by smtp.gmail.com with ESMTPSA id q199sm3603540qka.112.2021.07.16.01.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 01:28:00 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 kernel test robot <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PATCH v5 02/11] powerpc/kernel/iommu: Add new iommu_table_in_use()
 helper
Date: Fri, 16 Jul 2021 05:27:47 -0300
Message-Id: <20210716082755.428187-3-leobras.c@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716082755.428187-1-leobras.c@gmail.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
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
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
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
index 2af89a5e379f..b10bf58ae467 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -690,32 +690,24 @@ static void iommu_table_reserve_pages(struct iommu_table *tbl,
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
@@ -779,6 +771,22 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
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
 	struct iommu_table *tbl;
@@ -795,10 +803,8 @@ static void iommu_table_free(struct kref *kref)
 
 	iommu_debugfs_del(tbl);
 
-	iommu_table_release_pages(tbl);
-
 	/* verify that table contains no entries */
-	if (!bitmap_empty(tbl->it_map, tbl->it_size))
+	if (iommu_table_in_use(tbl))
 		pr_warn("%s: Unexpected TCEs\n", __func__);
 
 	/* free bitmap */
@@ -1099,18 +1105,13 @@ int iommu_take_ownership(struct iommu_table *tbl)
 	for (i = 0; i < tbl->nr_pools; i++)
 		spin_lock_nest_lock(&tbl->pools[i].lock, &tbl->large_pool.lock);
 
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
2.32.0

