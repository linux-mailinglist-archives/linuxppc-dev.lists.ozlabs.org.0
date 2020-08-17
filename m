Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 087D5247B5A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 02:01:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVrfR6NhJzDqYX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 10:01:03 +1000 (AEST)
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
 header.s=20161025 header.b=IiQth7+0; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVrCn0DLszDqVx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 09:41:25 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id j187so16656015qke.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 16:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y7/RxrEgFbiJeIJ6odgzjv0QMFDSvXInIkcTRZMw0eA=;
 b=IiQth7+0e0kRkPXTuZa3ekMLeZ9wkT9s3Y+ETQFOXeUnYOuhb72kf9D0pkNi/MxoLv
 y0fF0bfFWEckv1n1Sw1dBF2Vo5kwVhU8rMuQ01UAMhYYLzt+NzzqSB5QEu4/hwayw9Av
 zB5PCYtduyvUIau6q2mGsAyIAboxD2LdWU2C9KCxddPBcQtiYo0Z+G/cJSqIEmR+YmkT
 /dDMr61Bpazjzj29QTR+S0sTPiH/U+Cg1J2USuYEeF3KFJ0xXvB1wnLK+vsX0wioIF7j
 mhhuxf5PPc6D5sk+e/E36iKhKOEYANPapwK2KXySAGcN7UZfSxl+dDuxC62sje3dLaLZ
 Eulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y7/RxrEgFbiJeIJ6odgzjv0QMFDSvXInIkcTRZMw0eA=;
 b=kosPmL4gbLjlckTxXVnYhnSUDQWXnXPjwI+4nZUGYWZiv5UJXIlXoM9hv6oDTpbi0v
 PvpaJpXMwCAMr+3cXR1iBBtqYKp/oXF7slkBrXCRoL8Z99nWRXwMN+RL3XF6aIv0CHST
 w2o+AW8IxPNdV4YbIPEyeVLEATKDp8m0P5p0sl0H/rFKTVFIZNaA1FJlLXJC3SP2BkCw
 u2EUpx8tYI7vBqeo5h+Of4EKMeXSROdv5nzKRsxX1y4eypfefhxqwNQrhbNS3wmtkrGw
 JU+iwyGcAMnna3N4d5jzMay6Kquuvrpa8iAkwHhMUT45TE21b6rwDbUf+HoHIZjsPh/q
 a9Pw==
X-Gm-Message-State: AOAM533YRnY3g4q2n0Rn1zOUew2L6qCfHfPdD1Xix95t4XUU+vwR4nKg
 zMyOWQ82uKArqTjhdTj+p3A=
X-Google-Smtp-Source: ABdhPJw1kObRxpNNPRo2Qby2q/D7S9MPv9OG18YyKtca1zlLVXdtJqtPEqBmEvx+aezgJrJhNuF5zA==
X-Received: by 2002:a37:a293:: with SMTP id
 l141mr15380301qke.222.1597707682020; 
 Mon, 17 Aug 2020 16:41:22 -0700 (PDT)
Received: from LeoBras.ibmuc.com ([177.35.193.93])
 by smtp.gmail.com with ESMTPSA id w58sm22342868qth.95.2020.08.17.16.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 16:41:21 -0700 (PDT)
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
Subject: [PATCH v1 07/10] powerpc/pseries/iommu: Allow DDW windows starting at
 0x00
Date: Mon, 17 Aug 2020 20:40:30 -0300
Message-Id: <20200817234033.442511-8-leobras.c@gmail.com>
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

enable_ddw() currently returns the address of the DMA window, which is
considered invalid if has the value 0x00.

Also, it only considers valid an address returned from find_existing_ddw
if it's not 0x00.

Changing this behavior makes sense, given the users of enable_ddw() only
need to know if direct mapping is possible. It can also allow a DMA window
starting at 0x00 to be used.

This will be helpful for using a DDW with indirect mapping, as the window
address will be different than 0x00, but it will not map the whole
partition.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 30 ++++++++++++--------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index fcdefcc0f365..4031127c9537 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -852,24 +852,25 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
 			np, ret);
 }
 
-static u64 find_existing_ddw(struct device_node *pdn)
+static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
 {
 	struct direct_window *window;
 	const struct dynamic_dma_window_prop *direct64;
-	u64 dma_addr = 0;
+	bool found = false;
 
 	spin_lock(&direct_window_list_lock);
 	/* check if we already created a window and dupe that config if so */
 	list_for_each_entry(window, &direct_window_list, list) {
 		if (window->device == pdn) {
 			direct64 = window->prop;
-			dma_addr = be64_to_cpu(direct64->dma_base);
+			*dma_addr = be64_to_cpu(direct64->dma_base);
+			found = true;
 			break;
 		}
 	}
 	spin_unlock(&direct_window_list_lock);
 
-	return dma_addr;
+	return found;
 }
 
 static struct direct_window *ddw_list_add(struct device_node *pdn,
@@ -1131,15 +1132,15 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
  * pdn: the parent pe node with the ibm,dma_window property
  * Future: also check if we can remap the base window for our base page size
  *
- * returns the dma offset for use by the direct mapped DMA code.
+ * returns true if can map all pages (direct mapping), false otherwise..
  */
-static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
+static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 {
 	int len, ret;
 	struct ddw_query_response query;
 	struct ddw_create_response create;
 	int page_shift;
-	u64 dma_addr, max_addr;
+	u64 max_addr;
 	struct device_node *dn;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
 	struct direct_window *window;
@@ -1150,8 +1151,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 	mutex_lock(&direct_window_init_mutex);
 
-	dma_addr = find_existing_ddw(pdn);
-	if (dma_addr != 0)
+	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset))
 		goto out_unlock;
 
 	/*
@@ -1292,7 +1292,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		goto out_free_window;
 	}
 
-	dma_addr = be64_to_cpu(ddwprop->dma_base);
+	dev->dev.archdata.dma_offset = be64_to_cpu(ddwprop->dma_base);
 	goto out_unlock;
 
 out_free_window:
@@ -1309,6 +1309,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	kfree(win64->name);
 	kfree(win64->value);
 	kfree(win64);
+	win64 = NULL;
 
 out_failed:
 	if (default_win_removed)
@@ -1322,7 +1323,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 out_unlock:
 	mutex_unlock(&direct_window_init_mutex);
-	return dma_addr;
+	return win64;
 }
 
 static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
@@ -1401,11 +1402,8 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
 			break;
 	}
 
-	if (pdn && PCI_DN(pdn)) {
-		pdev->dev.archdata.dma_offset = enable_ddw(pdev, pdn);
-		if (pdev->dev.archdata.dma_offset)
-			return true;
-	}
+	if (pdn && PCI_DN(pdn))
+		return enable_ddw(pdev, pdn);
 
 	return false;
 }
-- 
2.25.4

