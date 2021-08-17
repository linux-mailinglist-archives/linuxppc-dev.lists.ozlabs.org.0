Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD163EE6D6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 08:46:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GphPm6Vzvz3ddK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 16:46:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=S4FVU46l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b;
 helo=mail-qv1-xf2b.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=S4FVU46l; dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GphHW0wnYz30FX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 16:40:39 +1000 (AEST)
Received: by mail-qv1-xf2b.google.com with SMTP id g11so1866354qvd.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 23:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nohRkEmBhJ456vza0SGQFpwvp2m1XhmvKD+E3e6gpIc=;
 b=S4FVU46lNzjBm03WNWtewVwQV4cjt+148/xWic1zmTpF7MIfY5aVMbp0Nau1eUGq2K
 GGoHxejBXNeNNVZK8hF+qFLpPbaoHHD0OVC4moNtZFhiUwFPj15Jeu+UoYwwUW6s0Fih
 8y7leivTl+gxUCi6g2yD7o38GN9nQn1wwvp0lPHUKLadkAsU/nvLkLxX8W1YmZXOEIkz
 Wg8fQnOPNGRY/OkeJOyrp9JZZvljbz3RTrc6hJjxb/KcfSWTWU+pbtePyFoxH8dtk09g
 sYiD9RvFqASr/b5kkP8p08SVXV4WKcIfYK8hoesqmaVNsmv639s/BJ44t0rQqcjbESWz
 CcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nohRkEmBhJ456vza0SGQFpwvp2m1XhmvKD+E3e6gpIc=;
 b=Dx7NeUe5Q0fSmGtEwdXlrUu/P/+FLCADZXNMJwuEShQZikimosGFu926QV7jxo0uZ6
 58YbFJnk7DcIqECeM/mYA5rYWKW5+vVvbO4R3lYChA2EiKVmref8gxJcZ1Scz2BCrJUM
 qKIrs1xAG6plfKbdi+Mpc/9Hk3LtMma+YMXlWYl1iP6F0jek4iuRmY3B+xKObvPGMe/Z
 WiunV5AkjdK7ACx19iK53s2YYseh+5xLTm9wMV3fQg3dxvkAGp055yHW8sxOV5j8hVzT
 a7kCCndXEipB56q/AjAF7X3zZPIUcVpTcGh9EqcUKs0B8QsNwdqGLDnxzFhsbinbKiWB
 f3sA==
X-Gm-Message-State: AOAM530LqjoISEmf/LYWAs47Njq+QJAwDxNRaD5ZGoACXtg4KCCaP45S
 CZbIAQshL2+qJSHveR/+970=
X-Google-Smtp-Source: ABdhPJwBDp1+3Xcd8pmbo7T1m0zjICSc6lURMHxvAjssSi2yxwvlSp2mnG+uZPLN5ecmsc1hzmXgxw==
X-Received: by 2002:a05:6214:285:: with SMTP id
 l5mr1821244qvv.24.1629182436549; 
 Mon, 16 Aug 2021 23:40:36 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:30b2:5c9e:50:88f3:269a])
 by smtp.gmail.com with ESMTPSA id c11sm526938qth.29.2021.08.16.23.40.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 23:40:36 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Nicolin Chen <nicoleotsuka@gmail.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH v6 08/11] powerpc/pseries/iommu: Update remove_dma_window() to
 accept property name
Date: Tue, 17 Aug 2021 03:39:26 -0300
Message-Id: <20210817063929.38701-9-leobras.c@gmail.com>
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

Update remove_dma_window() so it can be used to remove DDW with a given
property name.

This enables the creation of new property names for DDW, so we can
have different usage for it, like indirect mapping.

Also, add return values to it so we can check if the property was found
while removing the active DDW. This allows skipping the remaining property
names while reducing the impact of multiple property names.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/platforms/pseries/iommu.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index a47f59a8f107..901f290999d0 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -844,31 +844,33 @@ static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
 	__remove_dma_window(np, ddw_avail, liobn);
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
+		return 0;
 
-	win = of_find_property(np, DIRECT64_PROPNAME, NULL);
-	if (!win)
-		return;
 
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
@@ -921,7 +923,7 @@ static int find_existing_ddw_windows(void)
 	for_each_node_with_property(pdn, DIRECT64_PROPNAME) {
 		direct64 = of_get_property(pdn, DIRECT64_PROPNAME, &len);
 		if (!direct64 || len < sizeof(*direct64)) {
-			remove_ddw(pdn, true);
+			remove_ddw(pdn, true, DIRECT64_PROPNAME);
 			continue;
 		}
 
@@ -1565,7 +1567,7 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
 		 * we have to remove the property when releasing
 		 * the device node.
 		 */
-		remove_ddw(np, false);
+		remove_ddw(np, false, DIRECT64_PROPNAME);
 		if (pci && pci->table_group)
 			iommu_pseries_free_group(pci->table_group,
 					np->full_name);
-- 
2.32.0

