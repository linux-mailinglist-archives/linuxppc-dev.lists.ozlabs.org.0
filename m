Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 763C0200196
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 07:14:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49p6Rd2m0LzDqWw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 15:14:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XXHxk/1G; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49p6Ht30R3zDr63
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 15:07:38 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id j68so4526285qkb.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 22:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L4XvSLCXsG3KEJ31YG4hc0m/oIhqsd2EwdwB1kSl5Yo=;
 b=XXHxk/1GGLKtf9qg8q6h7tF7TiLwEHqMaphmitAiBQWxO8+CWRfXixxgxx8IqJbukb
 2mzbCY/tDkfsSdSwawvxWuTzS+Qn01CC2gcUh2ah/eYgo6bflvKen35Wuy/2TVT88UwJ
 sCdzQdM3iLo8Vnd/MZAOXL1v1PQMs3D346h2myQJQlyW0V44NxvujyJ/oGjCBRkoypX4
 zyuaSEvRbFSVdHlHaJWFE+wGGR4T9iHJQnqI9/4+DLJoIUZCtxSStGolrkQevKD20tTO
 aLRZH1F9Fg9Cy71g1CsTYHe/eevsA0GAkBjViksLxVQAukMMdciOKSibhwVXCLz5DdV0
 JKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L4XvSLCXsG3KEJ31YG4hc0m/oIhqsd2EwdwB1kSl5Yo=;
 b=lySu5/UrPrfSmX01GRSmMBH+2qLL61eeykU2d00mR4FJPAmHp8SAkk7g6BgO9OYayS
 SmQs8e+CB7GqjTp1yP6U9oxWkaEskn4EHogTQRndBX79z8KokriHJJfSdxz406cfvl7z
 BiS0b4eZkfn2UpdJ0QkNpoJR0OZdgMHUu41vtvrxgeiFSsPS1MqloKntqQcA22rk8dcx
 Pg18snI5LtdxrRDJDUeI53foQ9dcH0Brr/eUZSez+INauyquQzihUF6qfhdIg4dvy7oA
 Qn7tR8qFOz1crhwgJUdYJYHMPJzV1kx09DgTa1BBgI2hgA1rT+gT2q1LJ18ZjOxYrw+V
 Trog==
X-Gm-Message-State: AOAM530pzQItnS60Lb3XYtPbgopTOkxyQMZ9XK2k9K/4jLa/ITioZUMK
 PSb6NKhLYmKyxffgbWqfAuk=
X-Google-Smtp-Source: ABdhPJy/LZ/1+ZSPv6KSZiafpBMQw9OTc/8dwWFGA6ckWc4RWltAakdqfQ+qvGJvBbaHpLfeAuFF9Q==
X-Received: by 2002:a05:620a:4fa:: with SMTP id
 b26mr1868937qkh.63.1592543255204; 
 Thu, 18 Jun 2020 22:07:35 -0700 (PDT)
Received: from LeoBras.ibmuc.com (177-131-65-187.dynamic.desktop.com.br.
 [177.131.65.187])
 by smtp.gmail.com with ESMTPSA id o6sm5235503qtd.59.2020.06.18.22.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 22:07:34 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Leonardo Bras <leobras.c@gmail.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>
Subject: [PATCH 3/4] powerpc/pseries/iommu: Move window-removing part of
 remove_ddw into remove_dma_window
Date: Fri, 19 Jun 2020 02:06:19 -0300
Message-Id: <20200619050619.266888-4-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200619050619.266888-1-leobras.c@gmail.com>
References: <20200619050619.266888-1-leobras.c@gmail.com>
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

Move the window-removing part of remove_ddw into a new function
(remove_dma_window), so it can be used to remove other DMA windows.

It's useful for removing DMA windows that don't create DIRECT64_PROPNAME
property, like the default DMA window from the device, which uses
"ibm,dma-window".

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 53 +++++++++++++++-----------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 5e1fbc176a37..de633f6ae093 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -767,25 +767,14 @@ static int __init disable_ddw_setup(char *str)
 
 early_param("disable_ddw", disable_ddw_setup);
 
-static void remove_ddw(struct device_node *np, bool remove_prop)
+static void remove_dma_window(struct device_node *pdn, u32 *ddw_avail,
+			      struct property *win)
 {
 	struct dynamic_dma_window_prop *dwp;
-	struct property *win64;
-	u32 ddw_avail[3];
 	u64 liobn;
-	int ret = 0;
-
-	ret = of_property_read_u32_array(np, "ibm,ddw-applicable",
-					 &ddw_avail[0], 3);
-
-	win64 = of_find_property(np, DIRECT64_PROPNAME, NULL);
-	if (!win64)
-		return;
-
-	if (ret || win64->length < sizeof(*dwp))
-		goto delprop;
+	int ret;
 
-	dwp = win64->value;
+	dwp = win->value;
 	liobn = (u64)be32_to_cpu(dwp->liobn);
 
 	/* clear the whole window, note the arg is in kernel pages */
@@ -793,24 +782,44 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
 		1ULL << (be32_to_cpu(dwp->window_shift) - PAGE_SHIFT), dwp);
 	if (ret)
 		pr_warn("%pOF failed to clear tces in window.\n",
-			np);
+			pdn);
 	else
 		pr_debug("%pOF successfully cleared tces in window.\n",
-			 np);
+			 pdn);
 
 	ret = rtas_call(ddw_avail[2], 1, 1, NULL, liobn);
 	if (ret)
 		pr_warn("%pOF: failed to remove direct window: rtas returned "
 			"%d to ibm,remove-pe-dma-window(%x) %llx\n",
-			np, ret, ddw_avail[2], liobn);
+			pdn, ret, ddw_avail[2], liobn);
 	else
 		pr_debug("%pOF: successfully removed direct window: rtas returned "
 			"%d to ibm,remove-pe-dma-window(%x) %llx\n",
-			np, ret, ddw_avail[2], liobn);
+			pdn, ret, ddw_avail[2], liobn);
+}
+
+static void remove_ddw(struct device_node *np, bool remove_prop)
+{
+	struct property *win;
+	u32 ddw_avail[3];
+	int ret = 0;
+
+	ret = of_property_read_u32_array(np, "ibm,ddw-applicable",
+					 &ddw_avail[0], 3);
+	if (ret)
+		return;
+
+	win = of_find_property(np, DIRECT64_PROPNAME, NULL);
+	if (!win)
+		return;
+
+	if (win->length >= sizeof(struct dynamic_dma_window_prop))
+		remove_dma_window(np, ddw_avail, win);
+
+	if (!remove_prop)
+		return;
 
-delprop:
-	if (remove_prop)
-		ret = of_remove_property(np, win64);
+	ret = of_remove_property(np, win);
 	if (ret)
 		pr_warn("%pOF: failed to remove direct window property: %d\n",
 			np, ret);
-- 
2.25.4

