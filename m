Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3730D221D58
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 09:26:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6m5X2vz4zDqWb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 17:26:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s9L7epBX; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6lvV149czDqvR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 17:17:42 +1000 (AEST)
Received: by mail-qv1-xf43.google.com with SMTP id t7so2265632qvl.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 00:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AXuvSewgZzGQToJSuOXn5GH8wcApBjTtF70wFJu0qAc=;
 b=s9L7epBXBgrkBLWpIAE/cIc8t1RltyXqeVLQK2A9ia9mP6/KfAcSEGPUdEmDsbFDpW
 nLnOgFXQtlT2YpulY5kGAoNSXmPdw6EgADWzHZmiyi53ezZQ1PtjUC1dZxcdDsBP+J3G
 YG+RJKoW6cc+ydRG+yJ2nZw7cladI3r7/UYdDCCdfblLCmh57xejQC5TAkN4YSYkOXCm
 NPtRpBrFq7b4lsM9Pz6/sKbVqZmFM6sP9vKLMI933HDqWbAtqzR8W1gcJ7j+Uj4mzt4F
 orr7QWrNuBjc+6SGushpYNzxRgXpTYz3ablrlv3QMnOla7dnol5BAqprdN+w93XxstZE
 75vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AXuvSewgZzGQToJSuOXn5GH8wcApBjTtF70wFJu0qAc=;
 b=mcQVzmisVCS0N80UNG6kCCPt8wWEJrhA2IeGSEXTI2ov8Wz6FIAsXm8moDz9Znd3It
 bDhvTiEq+99Wu0z0FEPXcaUjuHAAatDvVa78qJ9lwI4zaeQCVpOdr5uBzn34r8QP6lMu
 yD/WQXhJLmVzYXWCPLc5A1PWwwHRQzJjxLZMc0BGzm4X5sPpDummhfiDDS7UO7/EtJiT
 ncd4mbpiSFCmJtFJ2GmJDAWcAafcfPlzDKFmwicaFTKpOwq9sbNXebL0rZMBHExyqDtU
 va9G+Xe+2sHDJwPH+fx099h1HnuVG1pM9IFrvVl/9aABAzBmg0ZBj4S0llCMjcApFGoa
 7e+Q==
X-Gm-Message-State: AOAM533qwbm7lsFaV6AcNgkizMyzrL58JO30zOER3JGBlIruXR12JzMU
 O7UnxEPeriTAew7QBN1sqq4=
X-Google-Smtp-Source: ABdhPJx5IGskEc5ppJCCMg2lYvbHisguYnN2mflqOyIzdfjc1to8zbIF3cvTBzlursAU1sa/N23aRg==
X-Received: by 2002:ad4:5748:: with SMTP id q8mr3022544qvx.1.1594883859450;
 Thu, 16 Jul 2020 00:17:39 -0700 (PDT)
Received: from LeoBras.ibmuc.com (200-236-239-31.dynamic.desktop.com.br.
 [200.236.239.31])
 by smtp.gmail.com with ESMTPSA id a5sm6637989qtd.84.2020.07.16.00.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 00:17:38 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>
Subject: [PATCH v4 3/7] powerpc/pseries/iommu: Move window-removing part of
 remove_ddw into remove_dma_window
Date: Thu, 16 Jul 2020 04:16:55 -0300
Message-Id: <20200716071658.467820-4-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200716071658.467820-1-leobras.c@gmail.com>
References: <20200716071658.467820-1-leobras.c@gmail.com>
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
 arch/powerpc/platforms/pseries/iommu.c | 45 +++++++++++++++-----------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 1a933c4e8bba..4e33147825cc 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -781,25 +781,14 @@ static int __init disable_ddw_setup(char *str)
 
 early_param("disable_ddw", disable_ddw_setup);
 
-static void remove_ddw(struct device_node *np, bool remove_prop)
+static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
+			      struct property *win)
 {
 	struct dynamic_dma_window_prop *dwp;
-	struct property *win64;
-	u32 ddw_avail[DDW_APPLICABLE_SIZE];
 	u64 liobn;
-	int ret = 0;
-
-	ret = of_property_read_u32_array(np, "ibm,ddw-applicable",
-					 &ddw_avail[0], DDW_APPLICABLE_SIZE);
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
@@ -821,10 +810,30 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
 		pr_debug("%pOF: successfully removed direct window: rtas returned "
 			"%d to ibm,remove-pe-dma-window(%x) %llx\n",
 			np, ret, ddw_avail[DDW_REMOVE_PE_DMA_WIN], liobn);
+}
+
+static void remove_ddw(struct device_node *np, bool remove_prop)
+{
+	struct property *win;
+	u32 ddw_avail[DDW_APPLICABLE_SIZE];
+	int ret = 0;
+
+	ret = of_property_read_u32_array(np, "ibm,ddw-applicable",
+					 &ddw_avail[0], DDW_APPLICABLE_SIZE);
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

