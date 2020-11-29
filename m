Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 329C72C7BF7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 00:17:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ckkmc2DW4zDrf6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 10:17:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.67; helo=mail-wr1-f67.google.com;
 envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkkY85ZFQzDrN1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 10:07:56 +1100 (AEDT)
Received: by mail-wr1-f67.google.com with SMTP id m6so13058212wrg.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 15:07:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uPxJqe/4fqAvPeHEi4PXiRImG9ouLArz1SvUbqNRaMU=;
 b=ryVqPfZJHcZ3wOyfF/6QTRGaDtVF+7dTi44unPNXARdoOMNgdvY5bqZyVjUfEdgAGl
 MzT1/1j/LHkd4Zjg6Ktzlc37UmJuMBnV8PvjjRDFxMN4p4Dysp73wpA5Pz6JoLj4L1Ay
 TxiZ7pp+PG19WOkzYiYDi7xjyuSqtKV3JAv+qVTYjLhewbT6f+J++UlF7lBb7Kbp4nu+
 g4NbjoHc1qKZ5RdJ6L68GnM1whN5NH4wNR0S4xsoPq2yl8dnwNWj7HJNDuDKJJw8UdaR
 DsB7/wcwfDdQ0FZPvL4YGn8zd0ljjQ3zkww6L2Lxuq3E6fhJlQ/Ab9oiI6y9oQgxgFAp
 vCRg==
X-Gm-Message-State: AOAM530Ir9yPgZ8szOnpYccTtxVdDS730LB6TWFYc4Kp69WXuRIPstTd
 GfhFX/KsD5G46fpnnJ6C+4o=
X-Google-Smtp-Source: ABdhPJxBybijJQjc+K6GS3b05hGcfYGidU+rzn/2+1RrcEs/rkLFlqp5WDEDRPkMUSgp4rfySiTCfA==
X-Received: by 2002:adf:e912:: with SMTP id f18mr24033599wrm.79.1606691274071; 
 Sun, 29 Nov 2020 15:07:54 -0800 (PST)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id d2sm24831005wrn.43.2020.11.29.15.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 15:07:53 -0800 (PST)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v6 5/5] PCI: xgene: Removed unused ".bus_shift" initialisers
 from pci-xgene.c
Date: Sun, 29 Nov 2020 23:07:43 +0000
Message-Id: <20201129230743.3006978-6-kw@linux.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129230743.3006978-1-kw@linux.com>
References: <20201129230743.3006978-1-kw@linux.com>
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
Cc: Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>,
 Paul Mackerras <paulus@samba.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Toan Le <toan@os.amperecomputing.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Jonathan Derrick <jonathan.derrick@intel.com>, linux-pci@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-rpi-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, Robert Richter <rrichter@marvell.com>,
 linuxppc-dev@lists.ozlabs.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Removed unused ".bus_shift" initialisers from pci-xgene.c as
xgene_pcie_map_bus() did not use these.

Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
---
 drivers/pci/controller/pci-xgene.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pci/controller/pci-xgene.c b/drivers/pci/controller/pci-xgene.c
index 8e0db84f089d..85e7c98265e8 100644
--- a/drivers/pci/controller/pci-xgene.c
+++ b/drivers/pci/controller/pci-xgene.c
@@ -257,7 +257,6 @@ static int xgene_v1_pcie_ecam_init(struct pci_config_window *cfg)
 }
 
 const struct pci_ecam_ops xgene_v1_pcie_ecam_ops = {
-	.bus_shift	= 16,
 	.init		= xgene_v1_pcie_ecam_init,
 	.pci_ops	= {
 		.map_bus	= xgene_pcie_map_bus,
@@ -272,7 +271,6 @@ static int xgene_v2_pcie_ecam_init(struct pci_config_window *cfg)
 }
 
 const struct pci_ecam_ops xgene_v2_pcie_ecam_ops = {
-	.bus_shift	= 16,
 	.init		= xgene_v2_pcie_ecam_init,
 	.pci_ops	= {
 		.map_bus	= xgene_pcie_map_bus,
-- 
2.29.2

