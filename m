Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF2420019C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 07:16:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49p6Th60wMzDrPB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 15:16:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N8EWbXE3; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49p6Hy2dHzzDrBk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 15:07:42 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id n11so7889731qkn.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 22:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LxhuxQycNieQ16w87JkTA9DQfwrE4fTWZ8DvCETKWbk=;
 b=N8EWbXE33GuLRhB4nF/r7qebEqLn6wGSnJRbNKKhK5CKbMgeUNWwwLSOVtNoB2MWTg
 6hYDMpCLOhswyz5LBmFFbLVrj7SZh7DbmtJx748+o7XwX5IyztICXLe/F4R14xuUallm
 5KXaGE4CirCMYqEmvdSQTY0uv4F0fEWNLYct/ITrZ8o90JDMR6W95hNCxaZxchQtn6HY
 s1IYQOUgZ2gVSXnQpK23D9Nd2Gol2iys92eXiZ2xOdqeC0ibK0SgRYhFF4BA3o1wVvSI
 iduaOHHbGnwNjSWUl4r4pfnlQxnCCbPSEJOxi6O2zxekqyp5fl6h1HQUhssB4yVP4Zx5
 m7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LxhuxQycNieQ16w87JkTA9DQfwrE4fTWZ8DvCETKWbk=;
 b=WfJ/07VeGl+zk+P0fk4K5HyPYDt3ZQywGlAxXtdc6b1ULeCVnqs/M1BCoHVUBCrbqN
 8ie7U9VwbH25mWqvFQmhw9hfIKsIJW+GfWsaoqhL6QuViQv3t3wFRD9sA2Rnwy7Xk58t
 c1Lo17l/J4fNNKoBVPWyqtMznxX/AMxECtgdVHxuWHAvcCwPF2+73h3iiz8TqZWwmvej
 azgRga0n+tKPKbHFM8f7JOafiXkVJo2AN01dch9wzW755Noj9ECd7USvZPffgGQWYdHR
 KGTsbgrOR0G7jgFCiyBPgvDpYE5B5GVWK2HRAaftiHNSdv7RZqhZBKrBv8XoD/u0eo+P
 hq2Q==
X-Gm-Message-State: AOAM5311GpiqlY8p3iIGG8jmQHcamzTZwrQ0i2q6kxM/ssbvspCWT0eA
 q4pMKRBzO2Hqv0RPqfSgwbGG/i9L
X-Google-Smtp-Source: ABdhPJypgjgeE05JPijQXMPTOnCQ0LI/Ef1IGd5HGvb7euUV2UZ7GmUd/GQ+FbWq/bF5/CQuSKn4MQ==
X-Received: by 2002:a37:4b17:: with SMTP id y23mr1809929qka.73.1592543259489; 
 Thu, 18 Jun 2020 22:07:39 -0700 (PDT)
Received: from LeoBras.ibmuc.com (177-131-65-187.dynamic.desktop.com.br.
 [177.131.65.187])
 by smtp.gmail.com with ESMTPSA id o6sm5235503qtd.59.2020.06.18.22.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 22:07:38 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Leonardo Bras <leobras.c@gmail.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>
Subject: [PATCH 4/4] powerpc/pseries/iommu: Remove default DMA window before
 creating DDW
Date: Fri, 19 Jun 2020 02:06:20 -0300
Message-Id: <20200619050619.266888-5-leobras.c@gmail.com>
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

On LoPAR "DMA Window Manipulation Calls", it's recommended to remove the
default DMA window for the device, before attempting to configure a DDW,
in order to make the maximum resources available for the next DDW to be
created.

This is a requirement for some devices to use DDW, given they only
allow one DMA window.

If setting up a new DDW fails anywhere after the removal of this
default DMA window, restore it using reset_dma_window.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index de633f6ae093..68d1ea957ac7 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1074,8 +1074,9 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	u64 dma_addr, max_addr;
 	struct device_node *dn;
 	u32 ddw_avail[3];
+
 	struct direct_window *window;
-	struct property *win64;
+	struct property *win64, *dfl_win;
 	struct dynamic_dma_window_prop *ddwprop;
 	struct failed_ddw_pdn *fpdn;
 
@@ -1110,8 +1111,19 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	if (ret)
 		goto out_failed;
 
-       /*
-	 * Query if there is a second window of size to map the
+	/*
+	 * First step of setting up DDW is removing the default DMA window,
+	 * if it's present. It will make all the resources available to the
+	 * new DDW window.
+	 * If anything fails after this, we need to restore it.
+	 */
+
+	dfl_win = of_find_property(pdn, "ibm,dma-window", NULL);
+	if (dfl_win)
+		remove_dma_window(pdn, ddw_avail, dfl_win);
+
+	/*
+	 * Query if there is a window of size to map the
 	 * whole partition.  Query returns number of windows, largest
 	 * block assigned to PE (partition endpoint), and two bitmasks
 	 * of page sizes: supported and supported for migrate-dma.
@@ -1219,6 +1231,8 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	kfree(win64);
 
 out_failed:
+	if (dfl_win)
+		reset_dma_window(dev, pdn);
 
 	fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
 	if (!fpdn)
-- 
2.25.4

