Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D21F236FEB3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:36:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWyfw65hKz3cm9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 02:36:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TfnJKPEg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TfnJKPEg; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWyZr2BFbz30JG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 02:32:36 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id z5so13917998qts.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 09:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kQkRMEiXoQJQMt0E0Ob7yojj6AwxsAD6eCu+/Ai/15M=;
 b=TfnJKPEgix5OxYiA7R8Z8XefjWILZepG3WO2mkrfgF/qZEjOD8qptZyYNsr61swk0E
 xK+xtD6T73a9685pPhtVkgRNnSErvjRLXTRy48cVPwtlD0OHfqPebBqIbCrpKSb71qWd
 X21TGGmFNzj0W9nztC0QILn0eStvZmPZVam25EeWQ5uB9kP4E8E7bBEK0ejqljOB2RbM
 xnFH79MBma+dhWXdShcZo8TNo2LHTP2SPMhR/wsGOzPxP2TSkBuMvdfLXkIxs+Mn37M7
 GOzEHDvA/v0UmYvY+JjEnwOwFYQSchRRVdEuoKfCqOO6IKqnnxLA0n2H64QrCh+q30HQ
 P5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kQkRMEiXoQJQMt0E0Ob7yojj6AwxsAD6eCu+/Ai/15M=;
 b=nm5On8IDmCymftAUma21DkIBEznNwltRgfj5mJ/d3y14zU3AG4sq9+0RDYC8ejT5G7
 l2LNybUwoRgNN7muqtDReOUlXtoqQLB8SNNDfhM00IgY+Yd0833AVOhJYdSsT1+7ruzB
 KafmI4Nw2J4AE4LOwoQTUuVIz7iU/H0VEq9zI0WviANyBAuiyc79YAMfWFwjhnKtzf+j
 aeKk/+RDe4oZoblXk6W2U3510yR4nQRrG5PazJJmomYUPsdskY1pYAYp7f5twwQp7401
 O3gHcFRMuIs+mPo3J2r82Oux6Cfu0ZvAHLHDG/mVCigf/+twdu8fmvSL5JggtMJmXdFy
 fvQg==
X-Gm-Message-State: AOAM5313QJFxfYTfNvM0h4febuyTkkhPmFVK7YJPR1GyJ1L+CWWisJ6H
 ylw3lDXN3YY38z0eFqht60o=
X-Google-Smtp-Source: ABdhPJzGfg0X4b0k9MbUIGzs3UtEen9/o5yUludLt0Jhn9zF23fk13ygFMFzEZZEo7tAAYPzOehoog==
X-Received: by 2002:ac8:7344:: with SMTP id q4mr5045314qtp.278.1619800353580; 
 Fri, 30 Apr 2021 09:32:33 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 ([2804:14c:482:7b04::1001])
 by smtp.gmail.com with ESMTPSA id p1sm2624334qtu.89.2021.04.30.09.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 09:32:33 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v4 08/11] powerpc/pseries/iommu: Update remove_dma_window() to
 accept property name
Date: Fri, 30 Apr 2021 13:31:43 -0300
Message-Id: <20210430163145.146984-9-leobras.c@gmail.com>
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

Update remove_dma_window() so it can be used to remove DDW with a given
property name.

This enables the creation of new property names for DDW, so we can
have different usage for it, like indirect mapping.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 89cb6e9e9f31..f8922fcf34b6 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -823,31 +823,32 @@ static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
 			np, ret, ddw_avail[DDW_REMOVE_PE_DMA_WIN], liobn);
 }
 
-static void remove_ddw(struct device_node *np, bool remove_prop)
+static int remove_ddw(struct device_node *np, bool remove_prop, const char *win_name)
 {
 	struct property *win;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
 	int ret = 0;
 
+	win = of_find_property(np, win_name, NULL);
+	if (!win)
+		return -EINVAL;
+
 	ret = of_property_read_u32_array(np, "ibm,ddw-applicable",
 					 &ddw_avail[0], DDW_APPLICABLE_SIZE);
 	if (ret)
-		return;
-
-	win = of_find_property(np, DIRECT64_PROPNAME, NULL);
-	if (!win)
-		return;
+		return 0;
 
 	if (win->length >= sizeof(struct dynamic_dma_window_prop))
 		remove_dma_window(np, ddw_avail, win);
 
 	if (!remove_prop)
-		return;
+		return 0;
 
 	ret = of_remove_property(np, win);
 	if (ret)
 		pr_warn("%pOF: failed to remove direct window property: %d\n",
 			np, ret);
+	return 0;
 }
 
 static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, int *window_shift)
@@ -900,7 +901,7 @@ static int find_existing_ddw_windows(void)
 	for_each_node_with_property(pdn, DIRECT64_PROPNAME) {
 		direct64 = of_get_property(pdn, DIRECT64_PROPNAME, &len);
 		if (!direct64 || len < sizeof(*direct64)) {
-			remove_ddw(pdn, true);
+			remove_ddw(pdn, true, DIRECT64_PROPNAME);
 			continue;
 		}
 
@@ -1372,7 +1373,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	win64 = NULL;
 
 out_remove_win:
-	remove_ddw(pdn, true);
+	remove_ddw(pdn, true, DIRECT64_PROPNAME);
 
 out_failed:
 	if (default_win_removed)
@@ -1536,7 +1537,7 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
 		 * we have to remove the property when releasing
 		 * the device node.
 		 */
-		remove_ddw(np, false);
+		remove_ddw(np, false, DIRECT64_PROPNAME);
 		if (pci && pci->table_group)
 			iommu_pseries_free_group(pci->table_group,
 					np->full_name);
-- 
2.30.2

