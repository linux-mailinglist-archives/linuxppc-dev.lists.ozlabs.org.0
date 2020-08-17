Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95661247B45
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 01:53:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVrTc4nCkzDq9R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 09:53:24 +1000 (AEST)
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
 header.s=20161025 header.b=W1v5j2gn; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVrCW2424zDqWn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 09:41:11 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id o22so13822460qtt.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 16:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eVaYHFRI702g+PpeDiE14lNtHXbt/nk9EKPLvek4Gbw=;
 b=W1v5j2gnvAlKMUl6vKptoEwp++CvS0bRnOGudC7Ya2LHS8REv0xltPDKyQwlHa+QiT
 cXmuCbm9RIPl1uUGgHdzcbWR2km0d00bbWqe0/0W/bTuz76/HQj+ImLqV79zqV+n6Zby
 MUA20PxqKSL20oFZXqWVGZdNLUuoRCMUyi9HkAjfZgdD2nJt/4/MjfJ+uI6XAlyQvhWT
 MEdGa7YWgUXB2OUrLDlvrmmqKxk570A/GGcYlbe+0O0gKTR/jXWSNdn1YhH2ozeQvYUE
 7rZbnOVftANTY1KjCYEU9tvIKcG/dK6awjksARaE7CF6/3Yn7I61UqNy3uADRqnNe5gP
 UIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eVaYHFRI702g+PpeDiE14lNtHXbt/nk9EKPLvek4Gbw=;
 b=rUhMQj5S5LZp967X9PDeV3xNvj7l+88WEvvX3IvKfpk64RyO9JknTfYwVfK+Vk1Wm5
 3rqOzQZ965M/40PUhE2xGvOrGdAULbuq4kRmIiagXBstLL/8+BAh2D3Vq4nTYvqgdlKf
 ayTk4qGdSXT3ROMrOnZtteaGoMXW7O7ogBOtIpvypzQxRnzE+RW2+8NXYhOIN9HSjqeV
 iDGug/G371SjG7mcBJRoq0fWwpohlAcVzlaPjudDcf15UsZFvXZDnfmaLq+hnoZt0dO6
 JEu/x9OQBx6ZQyKZV1XbLbgjrdo16arg3dl86adk9lTux6QKszymybQedXJ1pOS/DCXX
 J/DQ==
X-Gm-Message-State: AOAM532aRT3SKWsR/xnp7WIn09Uhm+S9ljbFS56DesJxq75PXXtduyYn
 7DH5RbmrcvaBgvrghFoPXG4=
X-Google-Smtp-Source: ABdhPJx27I6j1cReqhbM6pEfPoe8qcLP1jdaT//m2t2ZBcvwbaAHehb70hIRD5y5unIEqbAHPqAHjw==
X-Received: by 2002:aed:3b7a:: with SMTP id q55mr15805183qte.78.1597707667743; 
 Mon, 17 Aug 2020 16:41:07 -0700 (PDT)
Received: from LeoBras.ibmuc.com ([177.35.193.93])
 by smtp.gmail.com with ESMTPSA id w58sm22342868qth.95.2020.08.17.16.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 16:41:07 -0700 (PDT)
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
Subject: [PATCH v1 04/10] powerpc/kernel/iommu: Add new iommu_table_in_use()
 helper
Date: Mon, 17 Aug 2020 20:40:27 -0300
Message-Id: <20200817234033.442511-5-leobras.c@gmail.com>
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

Having a function to check if the iommu table has any allocation helps
deciding if a tbl can be reset for using a new DMA window.

It should be enough to replace all instances of !bitmap_empty(tbl...).

iommu_table_in_use() skips reserved memory, so we don't need to worry about
releasing it before testing. This causes iommu_table_release_pages() to
become unnecessary, given it is only used to remove reserved memory for
testing.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/include/asm/iommu.h |  1 +
 arch/powerpc/kernel/iommu.c      | 62 ++++++++++++++++++--------------
 2 files changed, 37 insertions(+), 26 deletions(-)

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
index 7f603d4e62d4..c5d5d36ab65e 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -668,21 +668,6 @@ static void iommu_table_reserve_pages(struct iommu_table *tbl,
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
@@ -743,6 +728,38 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
 	return tbl;
 }
 
+bool iommu_table_in_use(struct iommu_table *tbl)
+{
+	bool in_use;
+	unsigned long p1_start = 0, p1_end, p2_start, p2_end;
+
+	/*ignore reserved bit0*/
+	if (tbl->it_offset == 0)
+		p1_start = 1;
+
+	/* Check if reserved memory is valid*/
+	if (tbl->it_reserved_start >= tbl->it_offset &&
+	    tbl->it_reserved_start <= (tbl->it_offset + tbl->it_size) &&
+	    tbl->it_reserved_end   >= tbl->it_offset &&
+	    tbl->it_reserved_end   <= (tbl->it_offset + tbl->it_size)) {
+		p1_end = tbl->it_reserved_start - tbl->it_offset;
+		p2_start = tbl->it_reserved_end - tbl->it_offset + 1;
+		p2_end = tbl->it_size;
+	} else {
+		p1_end = tbl->it_size;
+		p2_start = 0;
+		p2_end = 0;
+	}
+
+	in_use = (find_next_bit(tbl->it_map, p1_end, p1_start) != p1_end);
+	if (in_use || p2_start == 0)
+		return in_use;
+
+	in_use = (find_next_bit(tbl->it_map, p2_end, p2_start) != p2_end);
+
+	return in_use;
+}
+
 static void iommu_table_free(struct kref *kref)
 {
 	unsigned long bitmap_sz;
@@ -759,10 +776,8 @@ static void iommu_table_free(struct kref *kref)
 		return;
 	}
 
-	iommu_table_release_pages(tbl);
-
 	/* verify that table contains no entries */
-	if (!bitmap_empty(tbl->it_map, tbl->it_size))
+	if (iommu_table_in_use(tbl))
 		pr_warn("%s: Unexpected TCEs\n", __func__);
 
 	/* calculate bitmap size in bytes */
@@ -1069,18 +1084,13 @@ int iommu_take_ownership(struct iommu_table *tbl)
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

