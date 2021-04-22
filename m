Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BD0367AB2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 09:12:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQpX25Djjz3dCM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 17:12:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ixK1+5Os;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ixK1+5Os; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQpRn6N07z3bs0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 17:08:37 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id o21so5002121qtp.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 00:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwfujHgMzglyScI7GeNIjisX5iaQuzItH19PwGeIyKg=;
 b=ixK1+5OsOEfr3ODi4U4LSVLsfZziSk425usmtInlQr0YST+1LOp2KG7WG6Cy/n82T7
 +XPhIEgLy/UQ2Ye8vZ4XY9OveQ4lsAD+gaDs9/ZepJ4RSFGKOZl+AvnqrY0LzJ0Kya3Y
 gQ/f8otHE/BWGO2fnRrNmTmGpHRZU0cCA5EdvDoNW867Luwp/MbamWvQV0KF9OyQJOK5
 6it1iopcWXT2MH/6GWt7Zd+jIcgjw+gZqLQRk3BZoPDOwjoA8JxTSyyB0M0rhNkzz7y4
 FrWdxYB1k7TMMeGOT80ufA4gvmGl5eEd4CeJsyP0lA/7x1Me7s10tX9++8o9TDL4AeSe
 Xf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwfujHgMzglyScI7GeNIjisX5iaQuzItH19PwGeIyKg=;
 b=XASLf4TgrNanU/vcZAji3ZS03K55emq8m+11Yqdkg6nChYf7drq7sS6XoyQSlRslIa
 Mnm6MY3dAad/HGnnDNxHeayLEtwqGYeSyeSjMvNUpZPKUThCnxtIEdkTN7IMO9Md6fpg
 +u8vkWz/B8t5ULXylOBp8YpDorBXpraIs9OguEnQ5fiGqIEKcgU9zd6s0q1O5gB5EWBe
 XWEGhv6FMo0XmZwMnycdQYSGwbsKvP/9jV8ascTPa3zHwTkk//TJKWbohQckHwxTZrmx
 jDN+FFSBqKjRVYpx5VEShB7vxkNAsziKeEro7Oafq9xjNe0n4BMTBfbN3MbvgJaBRJFi
 7i5A==
X-Gm-Message-State: AOAM533Wtja0DfN2gGKdb52T8D0WbO68RRg7KCIUoifeISJA2Brii4HQ
 IYfcMyPpXvxXs/jUTBstF4k=
X-Google-Smtp-Source: ABdhPJxs0qlDrXwGljG+SQ56jMGScgAac9VXw1yt2VA6N5FBTeNHpwY9oBS683R6fFUpHZDqoQiCog==
X-Received: by 2002:ac8:7596:: with SMTP id s22mr1639546qtq.11.1619075316014; 
 Thu, 22 Apr 2021 00:08:36 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 ([177.35.200.187])
 by smtp.gmail.com with ESMTPSA id w67sm1658329qkc.79.2021.04.22.00.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 00:08:35 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v3 08/11] powerpc/pseries/iommu: Update remove_dma_window() to
 accept property name
Date: Thu, 22 Apr 2021 04:07:20 -0300
Message-Id: <20210422070721.463912-9-leobras.c@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210422070721.463912-1-leobras.c@gmail.com>
References: <20210422070721.463912-1-leobras.c@gmail.com>
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
index 0147ccaf0be4..075c6e08f012 100644
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
 
 out_del_win:
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

