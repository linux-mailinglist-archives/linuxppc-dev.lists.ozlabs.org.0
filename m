Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B56EA200193
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 07:12:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49p6Pg6NmbzDrPl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 15:12:39 +1000 (AEST)
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
 header.s=20161025 header.b=m3CfCBJp; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49p6Hn3rV3zDqmj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 15:07:33 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id b27so7886564qka.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 22:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZWHywc52cviZOQW6ek0RtSh6QP+MlDxWWlDIcWpXS0=;
 b=m3CfCBJp02nLZBDTRsA/5HYP8t2gdeC/WNGp1nYgNuA1eP5A9Vzj0JMCEdZdcdD9dW
 qVbwUWrjTugynkvqr3rBx9HbMjLy2NxJzl9ndaj2AHkn9fPZF7xaeF1fAlniP03nWZT4
 xIwQpa+X5CoZcf3Uv8URzgvT02fX4hsgU1sBWFCtuhFyQej6HqUfAM8pUiba4oElKDW4
 WEVkmIBcwgPh6OB9rqLXkZMuTU3lAKg4+GXaiDLqICfx3Lf6NWtA1dDGAuQg83aOAsIh
 R5+Pea4XRYhaBG+d6TUmKfXJrtCdeWOgUo5nLYExFP6nWg75ibsVsf9hW9utwswQfBdh
 Y+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZWHywc52cviZOQW6ek0RtSh6QP+MlDxWWlDIcWpXS0=;
 b=kK9xrjWcmzOMTKfjmfZ5feQvU1HlwnQkSew2ggWlu7AsLQms4cOVFP4MwCTeaKynis
 xNvrO7O94Hc/xexg0wuhts5RwbAGOQgJKl9Q+YZwbjGrgT7Oy9G/8YsNh5AU0Pap5Ha3
 dUhAywk3UtWjdIoHo99FXur+NNEjt5BWpjR8mk7Pr75pHO2caJs7uMq908n7NnNcysYV
 V/5SDjK1RTmymw0Exh7ypn09wsdfiXSuKYWOhw2n2qfVHvcRoDqaGtgjHKCSKz+Zdi6q
 A3wwNK6Jgww7ke/hWA/tx551M99fVPEoKgnbagVYUYVcqm64P4Azlr42JPweivvDqiMk
 LjEA==
X-Gm-Message-State: AOAM532fRzQDe5QhdUafavOgEzV6V5Wcd9DF5jtJOe9erXSOF2blq1BZ
 czl8AgPgpkUMiICO2QmPZF0=
X-Google-Smtp-Source: ABdhPJxDgz6Dn9Cou/Too189l+3G7fnOB9PvggY/UzExeYsNdqY2JbNlgA13FI2VibV8+nzgsAEx8w==
X-Received: by 2002:a37:f505:: with SMTP id l5mr1819705qkk.118.1592543251507; 
 Thu, 18 Jun 2020 22:07:31 -0700 (PDT)
Received: from LeoBras.ibmuc.com (177-131-65-187.dynamic.desktop.com.br.
 [177.131.65.187])
 by smtp.gmail.com with ESMTPSA id o6sm5235503qtd.59.2020.06.18.22.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 22:07:30 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Leonardo Bras <leobras.c@gmail.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>
Subject: [PATCH 2/4] powerpc/pseries/iommu: Implement ibm,
 reset-pe-dma-windows rtas call
Date: Fri, 19 Jun 2020 02:06:18 -0300
Message-Id: <20200619050619.266888-3-leobras.c@gmail.com>
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

Platforms supporting the DDW option starting with LoPAR level 2.7 implement
ibm,ddw-extensions. The first extension available (index 2) carries the
token for ibm,reset-pe-dma-windows rtas call, which is used to restore
the default DMA window for a device, if it has been deleted.

It does so by resetting the TCE table allocation for the PE to it's
boot time value, available in "ibm,dma-window" device tree node.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index e5a617738c8b..5e1fbc176a37 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1012,6 +1012,39 @@ static phys_addr_t ddw_memory_hotplug_max(void)
 	return max_addr;
 }
 
+/*
+ * Platforms supporting the DDW option starting with LoPAR level 2.7 implement
+ * ibm,ddw-extensions, which carries the rtas token for
+ * ibm,reset-pe-dma-windows.
+ * That rtas-call can be used to restore the default DMA window for the device.
+ */
+static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
+{
+	int ret;
+	u32 cfg_addr, ddw_ext[3];
+	u64 buid;
+	struct device_node *dn;
+	struct pci_dn *pdn;
+
+	ret = of_property_read_u32_array(par_dn, "ibm,ddw-extensions",
+					 &ddw_ext[0], 3);
+	if (ret)
+		return;
+
+	dn = pci_device_to_OF_node(dev);
+	pdn = PCI_DN(dn);
+	buid = pdn->phb->buid;
+	cfg_addr = ((pdn->busno << 16) | (pdn->devfn << 8));
+
+	ret = rtas_call(ddw_ext[1], 3, 1, NULL, cfg_addr,
+			BUID_HI(buid), BUID_LO(buid));
+	if (ret)
+		dev_info(&dev->dev,
+			 "ibm,reset-pe-dma-windows(%x) %x %x %x returned %d ",
+			 ddw_ext[1], cfg_addr, BUID_HI(buid), BUID_LO(buid),
+			 ret);
+}
+
 /*
  * If the PE supports dynamic dma windows, and there is space for a table
  * that can map all pages in a linear offset, then setup such a table,
-- 
2.25.4

