Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58661E3A9A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 20:05:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zZsv590KzDqXT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 05:05:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="Viyk7VPa"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zYj56kMzzDqW5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:12:57 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 1E2CB438CE;
 Thu, 24 Oct 2019 17:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1571937174; x=1573751575; bh=2IGyeDgGJ6qusS98yQ3CmH65HU7DzXb7ja0
 tqKXs9LI=; b=Viyk7VPaJtIdDmECs2lmFodI7riWdZrmew8Q8a5QFvpMyeYKLhz
 NHpeYOqkGPtYEc1bSzmPzRD+jakQGVA+Ep4pWq7Q84TBPTghPumPI3jhMY4A6uMe
 OgHKYjXk9lACcX+ZZKABuum6dlgdBv3ltjem5bbtWY1sWa806cru+kq0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FXMhiCyE9oV; Thu, 24 Oct 2019 20:12:54 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2F965437F3;
 Thu, 24 Oct 2019 20:12:44 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.136) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Oct 2019 20:12:43 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v6 24/30] powerpc/powernv/pci: Suppress an EEH error when
 reading an empty slot
Date: Thu, 24 Oct 2019 20:12:22 +0300
Message-ID: <20191024171228.877974-25-s.miroshnichenko@yadro.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024171228.877974-1-s.miroshnichenko@yadro.com>
References: <20191024171228.877974-1-s.miroshnichenko@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.15.136]
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Sergey Miroshnichenko <s.miroshnichenko@yadro.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reading an empty slot returns all ones, which triggers a false EEH
error event on PowerNV. A rescan is performed after all the PEs have
been unmapped, so the reserved PE index is used for unfreezing.

CC: Oliver O'Halloran <oohall@gmail.com>
CC: Sam Bobroff <sbobroff@linux.ibm.com>
Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 arch/powerpc/platforms/powernv/pci.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index ffd546cf9204..e1b45dc96474 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -768,9 +768,16 @@ static int pnv_pci_read_config(struct pci_bus *bus,
 
 	*val = 0xFFFFFFFF;
 	pdn = pci_get_pdn_by_devfn(bus, devfn);
-	if (!pdn)
-		return pnv_pci_cfg_read_raw(phb->opal_id, bus->number, devfn,
-					    where, size, val);
+	if (!pdn) {
+		ret = pnv_pci_cfg_read_raw(phb->opal_id, bus->number, devfn,
+					   where, size, val);
+
+		if (!ret && (*val == EEH_IO_ERROR_VALUE(size)) && phb->unfreeze_pe)
+			phb->unfreeze_pe(phb, phb->ioda.reserved_pe_idx,
+					 OPAL_EEH_ACTION_CLEAR_FREEZE_ALL);
+
+		return ret;
+	}
 
 	if (!pnv_pci_cfg_check(pdn))
 		return PCIBIOS_DEVICE_NOT_FOUND;
-- 
2.23.0

