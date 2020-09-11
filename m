Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA2526664A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 19:24:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp2gc6QqLzDr7x
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 03:24:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZzHcKMJi; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp2PF1k3jzDqsG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 03:12:17 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id n133so10519352qkn.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 10:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xng8svM9Eh5Z3BaPcOszpffmw6LZiUDzRk3rGDgeXJQ=;
 b=ZzHcKMJi9pwr/Zy6BjV00f5Nod/y9TU303NdKciwIMZciPgjutelWMtKilQW3yuCe9
 XltW2t6P9EH70o4N323QlSSu40KrMYwqfSIHQ0T+HGlXDg7uvWDIKaC4+i6dPLbiK17A
 C7AHCKHaey+5flvVIkhPVO82CaJR11cfneZ69nrlr3EcdM1lqC551z2RhRV2NOmByxa8
 mguLB5mN/fZiQQGAvyNfFlkZWx2vNFYL9wVdlDuRkaYuGnSuW8NMWD/6Ame2ddk3g20+
 IXk2ZM/HNTu69XRZqnIci1dtclYRWHjFgD7tdAcNa2XHpSJVMcEUsSFQtkZbE1T/C0kS
 xAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xng8svM9Eh5Z3BaPcOszpffmw6LZiUDzRk3rGDgeXJQ=;
 b=A2mJmkcKl34ojH4kvwRu8ZoLPcqi0JUQtVnNDhub4+Gn31MpbuRioQoRcHdUdNcerH
 Mn3/l8K1VmUrfVRgRofw5SjO4DrB1QQHq0bkEw75BQmuUKHfz6fePMzSZJZGAl+OqTXg
 VQcNFrTQtRsx7Ge1Dl/RPPTE0hrBZi727RlWZQCcSi0jaVfm72IKjzvqeIe15AfQdOsD
 2YU1sdjTq3z3MQE5qnPDUra8VWz2c6nYaM57SkBidOLMb+1kyIulOlYQSKqlAqODFZaR
 kTH7PycHtAUM2kyDgX6sj2658Pru9ps2Q63R4hH1qRbOPU3O3W+GwVZSdSsbr1zOZu5c
 qVXg==
X-Gm-Message-State: AOAM530jvWTk2wwskOiPS7CJ7W8g7f6+TIJ1y284aIpZZ40zELCFKKcq
 liG/22M0o8al0dvCOW9bT40=
X-Google-Smtp-Source: ABdhPJwn6JC+Yw1MGV3lt6tuwN5FK34IBCXU+5paWWD73COztRmOeFU/JI7Ch/YOqUrH02homQiJ4Q==
X-Received: by 2002:a05:620a:1657:: with SMTP id
 c23mr2331070qko.382.1599844333415; 
 Fri, 11 Sep 2020 10:12:13 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-254-96.dynamic.desktop.com.br.
 [179.125.254.96])
 by smtp.gmail.com with ESMTPSA id l5sm3533330qtc.28.2020.09.11.10.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 10:12:12 -0700 (PDT)
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
Subject: [PATCH v2 05/14] powerpc/kernel/iommu: Add new iommu_table_in_use()
 helper
Date: Fri, 11 Sep 2020 14:07:30 -0300
Message-Id: <20200911170738.82818-6-leobras.c@gmail.com>
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
 arch/powerpc/kernel/iommu.c      | 61 +++++++++++++++-----------------
 2 files changed, 30 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 5032f1593299..2913e5c8b1f8 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -154,6 +154,7 @@ extern int iommu_tce_table_put(struct iommu_table *tbl);
  */
 extern struct iommu_table *iommu_init_table(struct iommu_table *tbl,
 		int nid, unsigned long res_start, unsigned long res_end);
+bool iommu_table_in_use(struct iommu_table *tbl);
 
 #define IOMMU_TABLE_GROUP_MAX_TABLES	2
 
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index ffb2637dc82b..c838da3d8f32 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -655,34 +655,21 @@ static void iommu_table_reserve_pages(struct iommu_table *tbl,
 	if (tbl->it_offset == 0)
 		set_bit(0, tbl->it_map);
 
+	/* Check if res_start..res_end is a valid range in the table */
+	if (res_start >= res_end || res_start < tbl->it_offset ||
+	    res_end > (tbl->it_offset + tbl->it_size)) {
+		tbl->it_reserved_start = tbl->it_offset;
+		tbl->it_reserved_end = tbl->it_offset;
+		return;
+	}
+
 	tbl->it_reserved_start = res_start;
 	tbl->it_reserved_end = res_end;
 
-	/* Check if res_start..res_end isn't empty and overlaps the table */
-	if (res_start && res_end &&
-			(tbl->it_offset + tbl->it_size < res_start ||
-			 res_end < tbl->it_offset))
-		return;
-
 	for (i = tbl->it_reserved_start; i < tbl->it_reserved_end; ++i)
 		set_bit(i - tbl->it_offset, tbl->it_map);
 }
 
-static void iommu_table_release_pages(struct iommu_table *tbl)
-{
-	int i;
-
-	/*
-	 * In case we have reserved the first bit, we should not emit
-	 * the warning below.
-	 */
-	if (tbl->it_offset == 0)
-		clear_bit(0, tbl->it_map);
-
-	for (i = tbl->it_reserved_start; i < tbl->it_reserved_end; ++i)
-		clear_bit(i - tbl->it_offset, tbl->it_map);
-}
-
 /*
  * Build a iommu_table structure.  This contains a bit map which
  * is used to manage allocation of the tce space.
@@ -743,6 +730,23 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
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
+
+}
+
 static void iommu_table_free(struct kref *kref)
 {
 	unsigned long bitmap_sz;
@@ -759,10 +763,8 @@ static void iommu_table_free(struct kref *kref)
 		return;
 	}
 
-	iommu_table_release_pages(tbl);
-
 	/* verify that table contains no entries */
-	if (!bitmap_empty(tbl->it_map, tbl->it_size))
+	if (iommu_table_in_use(tbl))
 		pr_warn("%s: Unexpected TCEs\n", __func__);
 
 	/* calculate bitmap size in bytes */
@@ -1068,18 +1070,13 @@ int iommu_take_ownership(struct iommu_table *tbl)
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
2.25.4

