Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5172905AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 18:22:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4697rp5R2XzDqMX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 02:22:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="IKl5PBMr"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4697js0cxGzDr7K
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 02:16:32 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 855BD412D6;
 Fri, 16 Aug 2019 16:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1565972188; x=1567786589; bh=q9y/is367hhmuQrvw9j6dqZA1E0BKbSm+CR
 wPiGBtfU=; b=IKl5PBMrMkSP6UCbb1QYnZ7F3Tc8OienJt5jLA42aFnjzpBHGsq
 mQefPjPTvWAV278KVbsvTKbvUPmYgOJyq9uSiGfyNhqcrXARyLC9jH64uvB0uitl
 DaP/AObwBE/kOzDyGpydunQuz87romRueoV5/CGGpyMPkBGPnhYAYm+M=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u8AYgTWV7zpU; Fri, 16 Aug 2019 19:16:28 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8EB6541200;
 Fri, 16 Aug 2019 19:16:27 +0300 (MSK)
Received: from NB-148.yadro.com (172.17.15.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 16
 Aug 2019 19:16:26 +0300
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v6 2/5] powerpc/powernv/pci: Suppress an EEH error when
 reading an empty slot
Date: Fri, 16 Aug 2019 19:16:11 +0300
Message-ID: <20190816161614.32344-3-s.miroshnichenko@yadro.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190816161614.32344-1-s.miroshnichenko@yadro.com>
References: <20190816161614.32344-1-s.miroshnichenko@yadro.com>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Sergey Miroshnichenko <s.miroshnichenko@yadro.com>,
 Oliver O'Halloran <oohall@gmail.com>, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reading an empty slot returns all ones, which triggers a false
EEH error event on PowerNV. This patch unfreezes the bus where
it has happened.

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
---
 arch/powerpc/include/asm/ppc-pci.h   |  1 +
 arch/powerpc/kernel/pci_dn.c         |  2 +-
 arch/powerpc/platforms/powernv/pci.c | 31 +++++++++++++++++++++++++---
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-pci.h b/arch/powerpc/include/asm/ppc-pci.h
index cec2d6409515..8b51c8577b94 100644
--- a/arch/powerpc/include/asm/ppc-pci.h
+++ b/arch/powerpc/include/asm/ppc-pci.h
@@ -36,6 +36,7 @@ void *traverse_pci_dn(struct pci_dn *root,
 		      void *(*fn)(struct pci_dn *, void *),
 		      void *data);
 extern void pci_devs_phb_init_dynamic(struct pci_controller *phb);
+struct pci_dn *pci_bus_to_pdn(struct pci_bus *bus);
 
 /* From rtas_pci.h */
 extern void init_pci_config_tokens (void);
diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
index c4c8c237a106..e1a0ab2caafe 100644
--- a/arch/powerpc/kernel/pci_dn.c
+++ b/arch/powerpc/kernel/pci_dn.c
@@ -27,7 +27,7 @@
  * one of PF's bridge. For other devices, their firmware
  * data is linked to that of their bridge.
  */
-static struct pci_dn *pci_bus_to_pdn(struct pci_bus *bus)
+struct pci_dn *pci_bus_to_pdn(struct pci_bus *bus)
 {
 	struct pci_bus *pbus;
 	struct device_node *dn;
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 8d6c094f074e..a5b04410c8b4 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -756,6 +756,21 @@ static inline pnv_pci_cfg_check(struct pci_dn *pdn)
 }
 #endif /* CONFIG_EEH */
 
+static int get_bus_pe_number(struct pci_bus *bus)
+{
+	struct pci_dn *pdn = pci_bus_to_pdn(bus);
+	struct pci_dn *child;
+
+	if (!pdn)
+		return IODA_INVALID_PE;
+
+	list_for_each_entry(child, &pdn->child_list, list)
+		if (child->pe_number != IODA_INVALID_PE)
+			return child->pe_number;
+
+	return IODA_INVALID_PE;
+}
+
 static int pnv_pci_read_config(struct pci_bus *bus,
 			       unsigned int devfn,
 			       int where, int size, u32 *val)
@@ -767,9 +782,19 @@ static int pnv_pci_read_config(struct pci_bus *bus,
 
 	*val = 0xFFFFFFFF;
 	pdn = pci_get_pdn_by_devfn(bus, devfn);
-	if (!pdn)
-		return pnv_pci_cfg_read_raw(phb->opal_id, bus->number, devfn,
-					    where, size, val);
+	if (!pdn) {
+		int pe_number = get_bus_pe_number(bus);
+
+		ret = pnv_pci_cfg_read_raw(phb->opal_id, bus->number, devfn,
+					   where, size, val);
+
+		if (!ret && (*val == EEH_IO_ERROR_VALUE(size)) && phb->unfreeze_pe)
+			phb->unfreeze_pe(phb, (pe_number == IODA_INVALID_PE) ?
+					 phb->ioda.reserved_pe_idx : pe_number,
+					 OPAL_EEH_ACTION_CLEAR_FREEZE_ALL);
+
+		return ret;
+	}
 
 	if (!pnv_pci_cfg_check(pdn))
 		return PCIBIOS_DEVICE_NOT_FOUND;
-- 
2.21.0

