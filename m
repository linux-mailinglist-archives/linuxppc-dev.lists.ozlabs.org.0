Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F621D5BA1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 23:32:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49P1pP3M2vzDr9S
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 07:32:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=wenxiong@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49P1mW3HKJzDqZC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 07:30:50 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04FL16aS006430
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 17:30:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3101kre049-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 17:30:46 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04FLK4sx060906
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 17:30:46 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3101kre042-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 May 2020 17:30:46 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04FLPFcQ009142;
 Fri, 15 May 2020 21:30:46 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 3100ubt5tn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 May 2020 21:30:46 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04FLUj9w53412214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 May 2020 21:30:45 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 757E2AE062;
 Fri, 15 May 2020 21:30:45 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20FD9AE05C;
 Fri, 15 May 2020 21:30:45 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.40.195.89])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 15 May 2020 21:30:45 +0000 (GMT)
From: wenxiong@linux.vnet.ibm.com
To: linuxppc-dev@lists.ozlabs.org
Subject: powerpc/pci: [PATCH 1/1 V2] PCIE PHB reset
Date: Fri, 15 May 2020 15:04:57 -0500
Message-Id: <1589573097-12892-1-git-send-email-wenxiong@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.6.0.2
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-15_07:2020-05-15,
 2020-05-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 cotscore=-2147483648 mlxlogscore=999 adultscore=0 clxscore=1015
 suspectscore=1 spamscore=0 phishscore=0 priorityscore=1501 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005150171
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
 arch/powerpc/platforms/pseries/pci.c | 152 +++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platforms/pseries/pci.c
index 911534b89c85..cb7e4276cf04 100644
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
@@ -354,3 +356,153 @@ int pseries_root_bridge_prepare(struct pci_host_bridge *bridge)
 
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
+		 * associated with the device. If option is 1, it
+		 * queries if config address is supported in a PE or not.
+		 * If option is 0, it returns PE config address or config
+		 * address for the PE primary bus.
+		 */
+		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
+			config_addr, BUID_HI(pdn->phb->buid),
+			BUID_LO(pdn->phb->buid), 1);
+		if (ret || (rets[0] == 0)) {
+			pr_warn("%s: Failed to get address for PHB#%x-PE# option=%d config_addr=%x\n",
+				__func__, pdn->phb->global_number, 1, rets[0]);
+			return -1;
+		}
+
+		/* Retrieve the associated PE config address */
+		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
+			config_addr, BUID_HI(pdn->phb->buid),
+			BUID_LO(pdn->phb->buid), 0);
+		if (ret) {
+			pr_warn("%s: Failed to get address for PHB#%x-PE# option=%d config_addr=%x\n",
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
+			pr_warn("%s: Failed to get address for PHB#%x-PE# config_addr=%x\n",
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
+				pr_err("%s: PHB#%x-PE# failed with rtas_call activate reset=%d\n",
+					__func__, phb->global_number, ret);
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
+				pr_err("%s: PHB#%x-PE# failed with rtas_call deactive reset=%d\n",
+					__func__, phb->global_number, ret);
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
+				pr_err("%s: PHB#%x-PE# failed with rtas_call configure_pe =%d\n",
+					__func__, phb->global_number, ret);
+				continue;
+			}
+		}
+	}
+
+	return 0;
+}
+machine_postcore_initcall(pseries, pseries_phb_reset);
+
-- 
2.18.1

