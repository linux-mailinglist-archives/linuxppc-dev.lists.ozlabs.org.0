Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2529B90685
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 19:13:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4699000P4kzDqcJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 03:13:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="gah3lltG"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4698Ty5pWrzDq6J
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 02:51:18 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id EFF9C42EF5;
 Fri, 16 Aug 2019 16:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1565974275; x=1567788676; bh=a/KVS6F95f4wnugwa0rxD+nie5EQCGw1iAw
 tHzLpoOg=; b=gah3lltGGI1J6eXGT3PqwJFT9pj4rqmlD0H00d7LOqbynExRcmu
 VJ/EcQhbRR+5CZPWitpdpN6a5H2BksmYQ7xLz3TFo1zU/AauT3wWPMsSHUX+NH9B
 qokaR/+iNJVui8C5VEwaedoiKm5W7J/JWoUi0pEEs6bcA1V3tehU+Cws=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J0U8zbx7AfAP; Fri, 16 Aug 2019 19:51:15 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id EC8E042ED3;
 Fri, 16 Aug 2019 19:51:10 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 16
 Aug 2019 19:51:10 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v5 10/23] PCI: hotplug: movable BARs: Try to assign unassigned
 resources only once
Date: Fri, 16 Aug 2019 19:50:48 +0300
Message-ID: <20190816165101.911-11-s.miroshnichenko@yadro.com>
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

With enabled BAR movement, BARs and bridge windows can only be assigned to
their direct parents, so there can be only one variant of resource tree,
thus every retry within the pci_assign_unassigned_root_bus_resources() will
result in the same tree, and it is enough to try just once.

In case of failures the pci_reassign_root_bus_resources() disables BARs for
one of the hotplugged devices and tries the assignment again.

Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 drivers/pci/setup-bus.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pci/setup-bus.c b/drivers/pci/setup-bus.c
index aee330047121..33f709095675 100644
--- a/drivers/pci/setup-bus.c
+++ b/drivers/pci/setup-bus.c
@@ -1819,6 +1819,13 @@ void pci_assign_unassigned_root_bus_resources(struct pci_bus *bus)
 	int pci_try_num = 1;
 	enum enable_type enable_local;
 
+	if (pci_movable_bars_enabled()) {
+		__pci_bus_size_bridges(bus, NULL);
+		__pci_bus_assign_resources(bus, NULL, NULL);
+
+		goto dump;
+	}
+
 	/* Don't realloc if asked to do so */
 	enable_local = pci_realloc_detect(bus, pci_realloc_enable);
 	if (pci_realloc_enabled(enable_local)) {
-- 
2.21.0

