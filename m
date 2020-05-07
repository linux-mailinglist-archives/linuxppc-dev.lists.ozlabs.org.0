Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 261441C92BD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 16:57:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HxQ30l1XzDqV3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 00:57:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=wenxiong@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Hwxx0Qv4zDqY1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 00:36:14 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 047E6mlH061493
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 7 May 2020 10:36:11 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30ux6f0b5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 10:36:10 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 047E7cAQ065379
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 7 May 2020 10:36:10 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30ux6f0b5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 10:36:10 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 047EUR3d009881;
 Thu, 7 May 2020 14:36:09 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 30s0g7d1vk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 May 2020 14:36:09 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 047Ea8Ls53936572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 May 2020 14:36:09 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC8E7112062;
 Thu,  7 May 2020 14:36:08 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78559112061;
 Thu,  7 May 2020 14:36:08 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.40.195.89])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  7 May 2020 14:36:08 +0000 (GMT)
From: wenxiong@linux.vnet.ibm.com
To: linuxppc-dev@lists.ozlabs.org
Subject: powerpc/pci: [PATCH 1/1]: PCIE PHB reset
Date: Thu,  7 May 2020 08:10:37 -0500
Message-Id: <1588857037-25950-1-git-send-email-wenxiong@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.6.0.2
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-07_09:2020-05-07,
 2020-05-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 suspectscore=1 phishscore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005070114
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
Cc: brking@linux.vnet.ibm.com, Wen Xiong <wenxiong@linux.vnet.ibm.com>,
 oohall@gmail.com, wenxiong@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Wen Xiong <wenxiong@linux.vnet.ibm.com>

Several device drivers hit EEH(Extended Error handling) when triggering
kdump on Pseries PowerVM. This patch implemented a reset of the PHBs
in pci general code. PHB reset stop all PCI transactions from previous
kernel. We have tested the patch in several enviroments:
- direct slot adapters
- adapters under the switch
- a VF adapter in PowerVM
- a VF adapter/adapter in KVM guest.

Signed-off-by: Wen Xiong <wenxiong@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/pseries/pci.c | 153 +++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platforms/pseries/pci.c
index 911534b89c85..aac7f00696d2 100644
--- a/arch/powerpc/platforms/pseries/pci.c
+++ b/arch/powerpc/platforms/pseries/pci.c
@@ -11,6 +11,8 @@
 #include <linux/kernel.h>
 #include <linux/pci.h>
 #include <linux/string.h>
+#include <linux/crash_dump.h>
+#include <linux/delay.h>
 
 #include <asm/eeh.h>
 #include <asm/pci-bridge.h>
@@ -354,3 +356,154 @@ int pseries_root_bridge_prepare(struct pci_host_bridge *bridge)
 
 	return 0;
 }
+
+/**
+ * pseries_get_pdn_addr - Retrieve PHB address
+ * @pe: EEH PE
+ *
+ * Retrieve the assocated PHB address. Actually, there're 2 RTAS
+ * function calls dedicated for the purpose. We need implement
+ * it through the new function and then the old one. Besides,
+ * you should make sure the config address is figured out from
+ * FDT node before calling the function.
+ *
+ */
+static int pseries_get_pdn_addr(struct pci_controller *phb)
+{
+	int ret = -1;
+	int rets[3];
+	int ibm_get_config_addr_info;
+	int ibm_get_config_addr_info2;
+	int config_addr = 0;
+	struct pci_dn *root_pdn, *pdn;
+
+	ibm_get_config_addr_info2   = rtas_token("ibm,get-config-addr-info2");
+	ibm_get_config_addr_info    = rtas_token("ibm,get-config-addr-info");
+
+	root_pdn = PCI_DN(phb->dn);
+	pdn = list_first_entry(&root_pdn->child_list, struct pci_dn, list);
+	config_addr = (pdn->busno << 16) | (pdn->devfn << 8);
+
+	if (ibm_get_config_addr_info2 != RTAS_UNKNOWN_SERVICE) {
+		/*
+		 * First of all, we need to make sure there has one PE
+		 * associated with the device. Otherwise, PE address is
+		 * meaningless.
+		 */
+		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
+			config_addr, BUID_HI(pdn->phb->buid),
+			BUID_LO(pdn->phb->buid), 1);
+		if (ret || (rets[0] == 0)) {
+			pr_warn("%s: Failed to get address for PHB#%x-PE# "
+				"option=%d config_addr=%x\n",
+				__func__, pdn->phb->global_number, 1, rets[0]);
+			return -1;
+		}
+
+		/* Retrieve the associated PE config address */
+		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
+			config_addr, BUID_HI(pdn->phb->buid),
+			BUID_LO(pdn->phb->buid), 0);
+		if (ret) {
+			pr_warn("%s: Failed to get address for PHB#%x-PE# "
+				"option=%d config_addr=%x\n",
+				__func__, pdn->phb->global_number, 0, rets[0]);
+			return -1;
+		}
+		return rets[0];
+	}
+
+	if (ibm_get_config_addr_info != RTAS_UNKNOWN_SERVICE) {
+		ret = rtas_call(ibm_get_config_addr_info, 4, 2, rets,
+			config_addr, BUID_HI(pdn->phb->buid),
+			BUID_LO(pdn->phb->buid), 0);
+		if (ret || rets[0]) {
+			pr_warn("%s: Failed to get address for PHB#%x-PE# "
+				"config_addr=%x\n",
+				__func__, pdn->phb->global_number, rets[0]);
+			return -1;
+		}
+		return rets[0];
+	}
+
+	return ret;
+}
+
+static int __init pseries_phb_reset(void)
+{
+	struct pci_controller *phb;
+	int config_addr;
+	int ibm_set_slot_reset;
+	int ibm_configure_pe;
+	int ret;
+
+	if (is_kdump_kernel() || reset_devices) {
+		pr_info("Issue PHB reset ...\n");
+		ibm_set_slot_reset = rtas_token("ibm,set-slot-reset");
+		ibm_configure_pe = rtas_token("ibm,configure-pe");
+
+		if (ibm_set_slot_reset == RTAS_UNKNOWN_SERVICE ||
+				ibm_configure_pe == RTAS_UNKNOWN_SERVICE) {
+			pr_info("%s: EEH functionality not supported\n",
+				__func__);
+		}
+
+		list_for_each_entry(phb, &hose_list, list_node) {
+			config_addr = pseries_get_pdn_addr(phb);
+			if (config_addr == -1)
+				continue;
+
+			ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
+				config_addr, BUID_HI(phb->buid),
+				BUID_LO(phb->buid), EEH_RESET_FUNDAMENTAL);
+
+			/* If fundamental-reset not supported, try hot-reset */
+			if (ret == -8)
+				ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
+					config_addr, BUID_HI(phb->buid),
+					BUID_LO(phb->buid), EEH_RESET_HOT);
+
+			if (ret) {
+				pr_err("%s: fail with rtas_call fundamental reset=%d\n",
+					__func__, ret);
+				continue;
+			}
+		}
+		msleep(EEH_PE_RST_SETTLE_TIME);
+
+		list_for_each_entry(phb, &hose_list, list_node) {
+			config_addr = pseries_get_pdn_addr(phb);
+			if (config_addr == -1)
+				continue;
+
+			ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
+				config_addr, BUID_HI(phb->buid),
+				BUID_LO(phb->buid), EEH_RESET_DEACTIVATE);
+			if (ret) {
+				pr_err("%s: fail with rtas_call deactive=%d\n",
+					__func__, ret);
+				continue;
+			}
+		}
+		msleep(EEH_PE_RST_SETTLE_TIME);
+
+		list_for_each_entry(phb, &hose_list, list_node) {
+			config_addr = pseries_get_pdn_addr(phb);
+			if (config_addr == -1)
+				continue;
+
+			ret = rtas_call(ibm_configure_pe, 3, 1, NULL,
+				config_addr, BUID_HI(phb->buid),
+				BUID_LO(phb->buid));
+			if (ret) {
+				pr_err("%s: fail with rtas_call configure_pe =%d\n",
+					__func__, ret);
+				continue;
+			}
+		}
+	}
+
+	return 0;
+}
+postcore_initcall(pseries_phb_reset);
+
-- 
2.18.1

