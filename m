Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D43E3A5D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 19:48:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zZVS4LvTzDqYC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 04:48:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="TZavucHX"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zYj246nDzDqW6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 04:12:54 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A116743A25;
 Thu, 24 Oct 2019 17:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1571937169; x=1573751570; bh=W92cqvp1KNDy4z38kjLHnZ9tQ96YMOeOsD5
 kxxU2nkc=; b=TZavucHXLFabBJ740YyKwlkVKq/xL7ufdjUAwx5bl9kTrvz2qDd
 fmJ4mQ89nhLOGn82fOpqB5q/GLM5iSZdWAb8w4F6l1tneWEgHA8Qt2YlpAoDg/4c
 mxxidwytcDvjsH+ClWNFxlNsBxqPhoGfXYdvK0iPlfuUxIYTmqLtzrLE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nG12gWa35O-g; Thu, 24 Oct 2019 20:12:49 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8235643C73;
 Thu, 24 Oct 2019 20:12:42 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.136) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 24
 Oct 2019 20:12:42 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v6 17/30] PCI: hotplug: movable BARs: Don't reserve IO/mem bus
 space
Date: Thu, 24 Oct 2019 20:12:15 +0300
Message-ID: <20191024171228.877974-18-s.miroshnichenko@yadro.com>
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

A hotplugged bridge with many hotplug-capable ports may request
reserving more IO space than the machine has. This could be overridden
with the "hpiosize=" kernel argument though.

But when BARs are movable, there are no need to reserve space anymore:
new BARs are allocated not from reserved gaps, but via rearranging the
existing BARs. Requesting a precise amount of space for bridge windows
increases the chances of adding the new bridge successfully.

Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 drivers/pci/setup-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index 675a612236d7..a68ec726010e 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1285,7 +1285,7 @@ void __pci_bus_size_bridges(struct pci_bus *bus, struct list_head *realloc_head)
 
 	case PCI_HEADER_TYPE_BRIDGE:
 		pci_bridge_check_ranges(bus);
-		if (bus->self->is_hotplug_bridge) {
+		if (bus->self->is_hotplug_bridge && !pci_can_move_bars) {
 			additional_io_size  = pci_hotplug_io_size;
 			additional_mem_size = pci_hotplug_mem_size;
 		}
-- 
2.23.0

