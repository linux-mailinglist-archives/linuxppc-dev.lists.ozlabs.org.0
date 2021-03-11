Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADC9336ACF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 04:38:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwvmN2y7fz3d3t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 14:38:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.177;
 helo=mail-qk1-f177.google.com; envelope-from=kswilczynski@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwvm215kFz3cH1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 14:37:53 +1100 (AEDT)
Received: by mail-qk1-f177.google.com with SMTP id l132so19322681qke.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 19:37:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HoIkSwuB9kFb/7o0k8S78I/HpiyIT43O0+mWxnUnfJI=;
 b=AVVotz6QcDJt8/bWVuYTruhoWny7aKM2ZtbIBC8Xz7guTZ1lq8R3D/q+W6BvohKWov
 JhUw5Z+eKDDsYErzH47MR5cunyXsRFYUOKWxuZ34xdgezEDXEPVaDb3pDoS0EDakXE6e
 v1sYYy+E4En4pI3pN075c1UVacNJK7KZKTwhgcX9PBNt7xfjMSzWPWTJU25IPEvuIRMI
 CHP6/MhrC7GM4c4xj018VNJlfl8JGPjo/BqN50vd5X2vTpL4GWpP8VY2hCL2vGcqmM1C
 bmJRD/JA6mV2O1DIFuz8gGnf7/BOimsErJEPVVE0/mJ4OmmzISikWJWk9QLs2gYBFTAP
 lPTA==
X-Gm-Message-State: AOAM531wRMY1hwCKtxPFEpbEg6K6oGlrL/hkjod8Qit9Wd282mgAMvKn
 bYwOFWPY39laCSYUnHWFPtA=
X-Google-Smtp-Source: ABdhPJyKZhUdOe1LCVxqhW5iBVJS/b2WAnNvPcpQJ7B6+4Fnw8aEHmu32vFpUVzeLUQfGiIHqbOtQQ==
X-Received: by 2002:a37:94b:: with SMTP id 72mr4823437qkj.94.1615433870050;
 Wed, 10 Mar 2021 19:37:50 -0800 (PST)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id j1sm949876qti.55.2021.03.10.19.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 19:37:49 -0800 (PST)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH] PCI: layerscape: Correct syntax by changing comma to semicolon
Date: Thu, 11 Mar 2021 03:37:45 +0000
Message-Id: <20210311033745.1547044-1-kw@linux.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Roy Zang <roy.zang@nxp.com>,
 Minghuan Lian <minghuan.Lian@nxp.com>, linux-pci@vger.kernel.org,
 Zheng Yongjun <zhengyongjun3@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace command with a semicolon to correct syntax and to prevent
potential unspecified behaviour and/or unintended side effects.

Related:
  https://lore.kernel.org/linux-pci/20201216131944.14990-1-zhengyongjun3@huawei.com/

Co-authored-by: Zheng Yongjun <zhengyongjun3@huawei.com>
Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
---
 drivers/pci/controller/dwc/pci-layerscape-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 39fe2ed5a6a2..39f4664bd84c 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -154,7 +154,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	pci->dev = dev;
 	pci->ops = pcie->drvdata->dw_pcie_ops;
 
-	ls_epc->bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4),
+	ls_epc->bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4);
 
 	pcie->pci = pci;
 	pcie->ls_epc = ls_epc;
-- 
2.30.1

