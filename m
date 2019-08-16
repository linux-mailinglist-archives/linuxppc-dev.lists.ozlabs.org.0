Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB7C90712
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 19:38:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4699XS2PYxzDqG9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 03:38:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="ojDz65dj"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4698V40rJHzDqxM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 02:51:23 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2C49F42EEA;
 Fri, 16 Aug 2019 16:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1565974280; x=1567788681; bh=VTRm7nHJv8AF5BKbIOmvCTB0nIvM/7ZSDko
 5kPpBymk=; b=ojDz65djYSmRHc6RhKPhPNBx/+X4sgoTL+0AGdmGhmwLp6d7bB4
 oX1MPPfVRl8wCvcHCZtrzzGyeY57LMmmKgZiPFF1iW1qNAAcPPF0wfmBSusVg40h
 BoeF2rmBZSLTlZQx5rk5EdWPJ2VMqa8YcCikkNXjcD0V4w1FYjNpKepE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cPn10qYAlOtF; Fri, 16 Aug 2019 19:51:20 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5D1C242EEB;
 Fri, 16 Aug 2019 19:51:13 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 16
 Aug 2019 19:51:12 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v5 20/23] PCI: hotplug: movable BARs: Enable the feature by
 default
Date: Fri, 16 Aug 2019 19:50:58 +0300
Message-ID: <20190816165101.911-21-s.miroshnichenko@yadro.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190816165101.911-1-s.miroshnichenko@yadro.com>
References: <20190816165101.911-1-s.miroshnichenko@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.15.60]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the last patch in the series which implements the essentials of the
Movable BARs feature, so it is turned by default now. Tested on:

 - x86_64 with "pci=realloc,assign-busses,use_crs,pcie_bus_peer2peer"
   command line argument;
 - POWER8 PowerNV+PHB3 ppc64le with "pci=realloc,pcie_bus_peer2peer".

In case of problems it is still can be overridden by the following command
line option:

    pcie_movable_bars=off

Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 drivers/pci/pci-driver.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index d11909e79263..a8124e47bf6e 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -1688,8 +1688,6 @@ static int __init pci_driver_init(void)
 {
 	int ret;
 
-	pci_add_flags(PCI_IMMOVABLE_BARS);
-
 	ret = bus_register(&pci_bus_type);
 	if (ret)
 		return ret;
-- 
2.21.0

