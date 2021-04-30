Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC10B36FE9B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:34:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWycm6HC9z2yxN
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 02:34:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dFmKF6iX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dFmKF6iX; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWyZX5dR6z2yyQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 02:32:20 +1000 (AEST)
Received: by mail-qk1-x733.google.com with SMTP id o27so2405593qkj.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 09:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ijXkh5bc5eEQEAPTsHyC4GzIBhozaiyqx/uWR9aUj2Q=;
 b=dFmKF6iXF2mQCRnP54zm7GWbK0lGHM/hmMC7TC5NfCtp21mDffveeqjWcD+DSarBRo
 wdFbDwRcVptoaa4QWgI4KrbrPykHMd/9hILqAMKfpBffJjG5b4ADyEwrHR6HNS1l6CVs
 CYi53eO8rzy+MH0X2496H1DtenKtuFZYppmNmfkn+HtzQCAhS+Mg0gBAM0zDsHRniQxS
 mAGvHaapfa8dMldGTdqU1SNJ6Dc8U4j7vKh1sx6bvBkLs8cO2hJ0ndMZWHequb1VVSfz
 GVBff90c3LXegAbNsh8HFaugM5FLh4ky+1760qRtY1DSi+7GW210Bo7b6TWErD3KWkxo
 cFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ijXkh5bc5eEQEAPTsHyC4GzIBhozaiyqx/uWR9aUj2Q=;
 b=Xg1MpJYFBtTn/+gxgWuhFUiJ16p5tEwNb6MOrZaQckxed8prrbjwxdk8wD/lCUJ0lH
 DBnyJgjfDSChDzIE7jzVJovg+7nudTpWp+ABm+S2sTRQmPAH3FySW05RHZdp8tb+/Uo7
 zevUCewHPpmJj1NhHv2q5hzs8HoElU5Iznt+tzM0h2L9FgBAlUrLEKJAtMEE43xi+Mwy
 K6wXVdHxUhb/7scHH0VUpQIC6HWoS/5TXblUTsK7VdZhat+Avw+e7LhUunRxYfRGFDLl
 urTwYMf3B7P7SRYdbA7sU1fiV4wGrqftB3KGUDWDWFjPLS5XdhIkCEcBlOZZQWzWeBGp
 e3Hw==
X-Gm-Message-State: AOAM532hudVevqc0egxRl1hxgSXr4wPRZHhJ6wFysU4Ddm/n/Gp4tdXW
 KykgyG6dFy8m1aUs769lgE4=
X-Google-Smtp-Source: ABdhPJw5Fbbo3fuvtWQf3OFXpYz4hzla9uMTjySibkagOWTkZqfGZvjSOXq++HYtsK5lhgjgVn6erQ==
X-Received: by 2002:a37:e50e:: with SMTP id e14mr6122866qkg.117.1619800338210; 
 Fri, 30 Apr 2021 09:32:18 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 ([2804:14c:482:7b04::1001])
 by smtp.gmail.com with ESMTPSA id p1sm2624334qtu.89.2021.04.30.09.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 09:32:17 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v4 04/11] powerpc/pseries/iommu: Add ddw_list_new_entry()
 helper
Date: Fri, 30 Apr 2021 13:31:39 -0300
Message-Id: <20210430163145.146984-5-leobras.c@gmail.com>
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

There are two functions creating direct_window_list entries in a
similar way, so create a ddw_list_new_entry() to avoid duplicity and
simplify those functions.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/platforms/pseries/iommu.c | 32 +++++++++++++++++---------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index d02359ca1f9f..6f14894d2d04 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -870,6 +870,21 @@ static u64 find_existing_ddw(struct device_node *pdn, int *window_shift)
 	return dma_addr;
 }
 
+static struct direct_window *ddw_list_new_entry(struct device_node *pdn,
+						const struct dynamic_dma_window_prop *dma64)
+{
+	struct direct_window *window;
+
+	window = kzalloc(sizeof(*window), GFP_KERNEL);
+	if (!window)
+		return NULL;
+
+	window->device = pdn;
+	window->prop = dma64;
+
+	return window;
+}
+
 static int find_existing_ddw_windows(void)
 {
 	int len;
@@ -882,18 +897,15 @@ static int find_existing_ddw_windows(void)
 
 	for_each_node_with_property(pdn, DIRECT64_PROPNAME) {
 		direct64 = of_get_property(pdn, DIRECT64_PROPNAME, &len);
-		if (!direct64)
-			continue;
-
-		window = kzalloc(sizeof(*window), GFP_KERNEL);
-		if (!window || len < sizeof(struct dynamic_dma_window_prop)) {
-			kfree(window);
+		if (!direct64 || len < sizeof(*direct64)) {
 			remove_ddw(pdn, true);
 			continue;
 		}
 
-		window->device = pdn;
-		window->prop = direct64;
+		window = ddw_list_new_entry(pdn, direct64);
+		if (!window)
+			break;
+
 		spin_lock(&direct_window_list_lock);
 		list_add(&window->list, &direct_window_list);
 		spin_unlock(&direct_window_list_lock);
@@ -1303,7 +1315,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	dev_dbg(&dev->dev, "created tce table LIOBN 0x%x for %pOF\n",
 		  create.liobn, dn);
 
-	window = kzalloc(sizeof(*window), GFP_KERNEL);
+	window = ddw_list_new_entry(pdn, ddwprop);
 	if (!window)
 		goto out_clear_window;
 
@@ -1322,8 +1334,6 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		goto out_free_window;
 	}
 
-	window->device = pdn;
-	window->prop = ddwprop;
 	spin_lock(&direct_window_list_lock);
 	list_add(&window->list, &direct_window_list);
 	spin_unlock(&direct_window_list_lock);
-- 
2.30.2

