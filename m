Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7309B247B55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 01:58:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVrbs1K77zDqYX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 09:58:49 +1000 (AEST)
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
 header.s=20161025 header.b=ip5e87uT; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVrCj4qmczDqVp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 09:41:21 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id x12so13873728qtp.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 16:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bt5dSumf7fQqfy+NC/7uAZCPhM5E07Z6kjHuc5sIsVM=;
 b=ip5e87uTCRBONfOGHdHJtLQ4xjOlyN0lrHW1cGtFqHdIZUQW/Fl3+AHcHqlpqsBqgg
 Vc7pmOXKlkYbDxbblBhqmMk8qFXDv1c/uOrwlTK114uijA+T+K9RnFe7/lZnB+kDziSL
 4NMRSHzhYMQA2Z5f0aUaDtZkVXQcdWUPa7dVtmEC80wk1J3YFeLBLAPmPPqYvtaNbsr4
 hYxnDD8avYh+Uu/foj5JecanBFWC9CvOERDc1CbFaYKt13by3/7iFjUxNjE9M5OI9HVq
 2jhDMnnDwms3cWsrJafiAvhfz3TVE9Kf9bqvB7AgHj6W4DzvkjwgF0yC6A0EyfRfTnz5
 1GuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bt5dSumf7fQqfy+NC/7uAZCPhM5E07Z6kjHuc5sIsVM=;
 b=eCPplzmEOSNUq1+wSGbl3PI6hn7KPWofbWwtYnFh+kiNneT2x9wWJBeVrNo3Caewfm
 j32E4JEnCqagI5DSBO0mg5ospjgUP0MJAlWflzxxZvhmdk89iLGVDtB7ClMeXY1CtpDb
 EVxOY9vi2Drjq38jaPeiqjKleOD1rzMaEYTIj1YIyWKnZRHpN8AMxHPx1UyZS+r/BSCq
 fI3e1FSWn46IjMt7yBollMpHkfKyjYIpm2FLAMNp+s5idSnYOro2oymMNxNnrtQks3Y9
 2ILf1m3Lg1k8iP+suQbpjlOkhTLYaogyZeA3vg5jpL6mMuXMa6y7qHaaT+TeYf0kD+34
 VpnA==
X-Gm-Message-State: AOAM532N9wWmNOVqkmNbkbRqG3ZebYtX3KvA2LOcf5DcAZ2BpkLxJWXs
 KqhqTtoMuWPNQDeb4TKt3sc=
X-Google-Smtp-Source: ABdhPJyd4qd5FkMrNMA213v9PdS2NirSn8aLvUjDAn2RrBNdJZtZSITLsm0p33/sSCZ9Y+3mArw5Hg==
X-Received: by 2002:ac8:478e:: with SMTP id k14mr15701534qtq.21.1597707677040; 
 Mon, 17 Aug 2020 16:41:17 -0700 (PDT)
Received: from LeoBras.ibmuc.com ([177.35.193.93])
 by smtp.gmail.com with ESMTPSA id w58sm22342868qth.95.2020.08.17.16.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 16:41:16 -0700 (PDT)
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
Subject: [PATCH v1 06/10] powerpc/pseries/iommu: Add ddw_list_add() helper
Date: Mon, 17 Aug 2020 20:40:29 -0300
Message-Id: <20200817234033.442511-7-leobras.c@gmail.com>
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

There are two functions adding DDW to the direct_window_list in a
similar way, so create a ddw_list_add() to avoid duplicity and
simplify those functions.

Also, on enable_ddw(), add list_del() on out_free_window to allow
removing the window from list if any error occurs.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 42 ++++++++++++++++----------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 39617ce0ec83..fcdefcc0f365 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -872,6 +872,24 @@ static u64 find_existing_ddw(struct device_node *pdn)
 	return dma_addr;
 }
 
+static struct direct_window *ddw_list_add(struct device_node *pdn,
+					  const struct dynamic_dma_window_prop *dma64)
+{
+	struct direct_window *window;
+
+	window = kzalloc(sizeof(*window), GFP_KERNEL);
+	if (!window)
+		return NULL;
+
+	window->device = pdn;
+	window->prop = dma64;
+	spin_lock(&direct_window_list_lock);
+	list_add(&window->list, &direct_window_list);
+	spin_unlock(&direct_window_list_lock);
+
+	return window;
+}
+
 static int find_existing_ddw_windows(void)
 {
 	int len;
@@ -887,18 +905,11 @@ static int find_existing_ddw_windows(void)
 		if (!direct64)
 			continue;
 
-		window = kzalloc(sizeof(*window), GFP_KERNEL);
-		if (!window || len < sizeof(struct dynamic_dma_window_prop)) {
+		window = ddw_list_add(pdn, direct64);
+		if (!window || len < sizeof(*direct64)) {
 			kfree(window);
 			remove_ddw(pdn, true);
-			continue;
 		}
-
-		window->device = pdn;
-		window->prop = direct64;
-		spin_lock(&direct_window_list_lock);
-		list_add(&window->list, &direct_window_list);
-		spin_unlock(&direct_window_list_lock);
 	}
 
 	return 0;
@@ -1261,7 +1272,8 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	dev_dbg(&dev->dev, "created tce table LIOBN 0x%x for %pOF\n",
 		  create.liobn, dn);
 
-	window = kzalloc(sizeof(*window), GFP_KERNEL);
+	/* Add new window to existing DDW list */
+	window = ddw_list_add(pdn, ddwprop);
 	if (!window)
 		goto out_clear_window;
 
@@ -1280,16 +1292,14 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		goto out_free_window;
 	}
 
-	window->device = pdn;
-	window->prop = ddwprop;
-	spin_lock(&direct_window_list_lock);
-	list_add(&window->list, &direct_window_list);
-	spin_unlock(&direct_window_list_lock);
-
 	dma_addr = be64_to_cpu(ddwprop->dma_base);
 	goto out_unlock;
 
 out_free_window:
+	spin_lock(&direct_window_list_lock);
+	list_del(&window->list);
+	spin_unlock(&direct_window_list_lock);
+
 	kfree(window);
 
 out_clear_window:
-- 
2.25.4

