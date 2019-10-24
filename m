Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EB2E3A67
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 19:52:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zZb50RJhzDqXv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 04:52:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="loKE7TRM"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zYj25m6kzDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:12:54 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id D805C43B4E;
 Thu, 24 Oct 2019 17:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1571937170; x=1573751571; bh=s0nvaOPonFwNp+PkAekMHzoECVHtPLrWKHG
 g079gQ1c=; b=loKE7TRMwq6xvQTef6FsEMihuPxcKdB0wgT//YmWyv19Z50aUai
 01L0XKTLpBkjnqVdB2rp1c+BWYXeWkpCyTyaEP5w08AuprHmk4OAD16Eqjr7hLQL
 /Q8vm1bi7clvN5n6RW28GXRQldddTdOoW7T3o0UrE+whLa6Ls/VCH9KA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WMely41yv-iE; Thu, 24 Oct 2019 20:12:50 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2BD8F43597;
 Thu, 24 Oct 2019 20:12:43 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.136) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Oct 2019 20:12:42 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v6 19/30] PCI: hotplug: movable BARs: Ignore the MEM BAR
 offsets from bootloader
Date: Thu, 24 Oct 2019 20:12:17 +0300
Message-ID: <20191024171228.877974-20-s.miroshnichenko@yadro.com>
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
Cc: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

BAR allocation by BIOS/UEFI/bootloader/firmware may be non-optimal and
it may even clash with the kernel's BAR assignment algorithm.

For example, if no space was reserved for SR-IOV BARs, and this bridge
window is packed between immovable BARs (so it is unable to extend),
and if this window can't be moved, the next PCI rescan will fail, as
the kernel tries to find a space for all the BARs, including SR-IOV.

With this patch the kernel will use its own methods of BAR allocating
when possible, increasing the chances of successful hotplug.

Also add a workaround for implicitly used video BARs on x86.

Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 drivers/pci/probe.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 94bbdf9b9dc1..73452aa81417 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -305,6 +305,16 @@ int __pci_read_base(struct pci_dev *dev, enum pci_bar_type type,
 			 pos, (unsigned long long)region.start);
 	}
 
+	if (pci_can_move_bars &&
+	    !(res->flags & IORESOURCE_IO) &&
+	    (dev->class >> 8) != PCI_CLASS_DISPLAY_VGA) {
+		pci_warn(dev, "ignore the current offset of BAR %llx-%llx\n",
+			 l64, l64 + sz64 - 1);
+		res->start = 0;
+		res->end = sz64 - 1;
+		res->flags |= IORESOURCE_SIZEALIGN;
+	}
+
 	goto out;
 
 
-- 
2.23.0

