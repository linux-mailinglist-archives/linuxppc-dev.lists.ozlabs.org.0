Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E2221DB4C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 18:10:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B57t44t6RzDqBr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 02:10:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=wenxiong@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B57p96NqHzDqLn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 02:07:26 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06DG2CNa008987; Mon, 13 Jul 2020 12:07:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3279k39fxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 12:07:21 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06DG2JMX009881;
 Mon, 13 Jul 2020 12:07:21 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3279k39fwv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 12:07:21 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06DG1Iuu023157;
 Mon, 13 Jul 2020 16:07:20 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 327528wgxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 16:07:20 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06DG7JXu42991990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jul 2020 16:07:19 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B5F0112064;
 Mon, 13 Jul 2020 16:07:19 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92B9B112061;
 Mon, 13 Jul 2020 16:07:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.40.195.89])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jul 2020 16:07:18 +0000 (GMT)
From: wenxiong@linux.vnet.ibm.com
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/1 V4]  : PCIE PHB reset
Date: Mon, 13 Jul 2020 09:39:33 -0500
Message-Id: <1594651173-32166-1-git-send-email-wenxiong@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.6.0.2
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_15:2020-07-13,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=1 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007130115
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
Cc: Wen Xiong <wenxiong@linux.vnet.ibm.com>, oohall@gmail.com,
 bobroff@linux.ibm.com, brking@linux.vnet.ibm.com, wenxiong@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Wen Xiong <wenxiong@linux.vnet.ibm.com>

Several device drivers hit EEH(Extended Error handling) when triggering
kdump on Pseries PowerVM. This patch implemented a reset of the PHBs
in pci general code when triggering kdump. PHB reset stop all PCI
transactions from normal kernel. We have tested the patch in several
enviroments:
- direct slot adapters
- adapters under the switch
- a VF adapter in PowerVM
- a VF adapter/adapter in KVM guest.

Change History:

V4:
- Merge the code from pseries/pci.c to pseries/eeh_pseries.c
- Add 3 helper functions which are shared by eeh code and this path.
  Reviewed by Michael Ellerman.

V3:
- Change the comments(Reviewed by Gustavo Romero) 

V2:
- change to machine_postcore_initall(Reviewed by Oliver Halloran)
- change the error pathes(Reviewed by Sam Bobroff)

V1:
- initial version

Signed-off-by: Wen Xiong<wenxiong@linux.vnet.ibm.com>

---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 234 ++++++++++++++-----
 1 file changed, 170 insertions(+), 64 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index ace117f99d94..a3ae8d206a86 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -24,6 +24,7 @@
 #include <linux/sched.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
+#include <linux/crash_dump.h>
 
 #include <asm/eeh.h>
 #include <asm/eeh_event.h>
@@ -80,6 +81,152 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 	eeh_probe_device(pdev);
 }
 
+
+/**
+ * pseries_eeh_get_config_addr - Retrieve config address
+ *
+ * Retrieve the assocated config address. Actually, there're 2 RTAS
+ * function calls dedicated for the purpose. We need implement
+ * it through the new function and then the old one. Besides,
+ * you should make sure the config address is figured out from
+ * FDT node before calling the function.
+ *
+ * It's notable that zero'ed return value means invalid PE config
+ * address.
+ */
+static int pseries_eeh_get_config_addr(struct pci_controller *phb, int config_addr)
+{
+	int ret = 0;
+	int rets[3];
+
+	if (ibm_get_config_addr_info2 != RTAS_UNKNOWN_SERVICE) {
+		/*
+		 * First of all, we need to make sure there has one PE
+		 * associated with the device. Otherwise, PE address is
+		 * meaningless.
+		 */
+		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
+				config_addr, BUID_HI(phb->buid),
+				BUID_LO(phb->buid), 1);
+		if (ret || (rets[0] == 0))
+			return 0;
+
+		/* Retrieve the associated PE config address */
+		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
+				config_addr, BUID_HI(phb->buid),
+				BUID_LO(phb->buid), 0);
+		if (ret) {
+			pr_warn("%s: Failed to get address for PHB#%x-PE#%x\n",
+				__func__, phb->global_number, config_addr);
+			return 0;
+		}
+
+		return rets[0];
+	}
+
+	if (ibm_get_config_addr_info != RTAS_UNKNOWN_SERVICE) {
+		ret = rtas_call(ibm_get_config_addr_info, 4, 2, rets,
+				config_addr, BUID_HI(phb->buid),
+				BUID_LO(phb->buid), 0);
+		if (ret) {
+			pr_warn("%s: Failed to get address for PHB#%x-PE#%x\n",
+				__func__, phb->global_number, config_addr);
+			return 0;
+		}
+
+		return rets[0];
+	}
+
+	return ret;
+}
+
+/**
+ * pseries_eeh_phb_reset - Reset the specified PHB
+ * @phb: PCI controller
+ * @config_adddr: the associated config address
+ * @option: reset option
+ *
+ * Reset the specified PHB/PE
+ */
+static int pseries_eeh_phb_reset(struct pci_controller *phb, int config_addr, int option)
+{
+	int ret;
+
+	/* Reset PE through RTAS call */
+	ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
+			config_addr, BUID_HI(phb->buid),
+			BUID_LO(phb->buid), option);
+
+	/* If fundamental-reset not supported, try hot-reset */
+	if (option == EEH_RESET_FUNDAMENTAL &&
+	    ret == -8) {
+		option = EEH_RESET_HOT;
+		ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
+				config_addr, BUID_HI(phb->buid),
+				BUID_LO(phb->buid), option);
+	}
+
+	/* We need reset hold or settlement delay */
+	if (option == EEH_RESET_FUNDAMENTAL ||
+	    option == EEH_RESET_HOT)
+		msleep(EEH_PE_RST_HOLD_TIME);
+	else
+		msleep(EEH_PE_RST_SETTLE_TIME);
+
+	return ret;
+}
+
+/**
+ * pseries_eeh_phb_configure_bridge - Configure PCI bridges in the indicated PE
+ * @phb: PCI controller
+ * @config_adddr: the associated config address
+ *
+ * The function will be called to reconfigure the bridges included
+ * in the specified PE so that the mulfunctional PE would be recovered
+ * again.
+ */
+static int pseries_eeh_phb_configure_bridge(struct pci_controller *phb, int config_addr)
+{
+	int ret;
+	/* Waiting 0.2s maximum before skipping configuration */
+	int max_wait = 200;
+
+	while (max_wait > 0) {
+		ret = rtas_call(ibm_configure_pe, 3, 1, NULL,
+				config_addr, BUID_HI(phb->buid),
+				BUID_LO(phb->buid));
+
+		if (!ret)
+			return ret;
+		if (ret < 0)
+			break;
+
+		/*
+		 * If RTAS returns a delay value that's above 100ms, cut it
+		 * down to 100ms in case firmware made a mistake.  For more
+		 * on how these delay values work see rtas_busy_delay_time
+		 */
+		if (ret > RTAS_EXTENDED_DELAY_MIN+2 &&
+		    ret <= RTAS_EXTENDED_DELAY_MAX)
+			ret = RTAS_EXTENDED_DELAY_MIN+2;
+
+		max_wait -= rtas_busy_delay_time(ret);
+
+		if (max_wait < 0)
+			break;
+
+		rtas_busy_delay(ret);
+	}
+
+	pr_warn("%s: Unable to configure bridge PHB#%x-PE#%x (%d)\n",
+		__func__, phb->global_number, config_addr, ret);
+	/* PAPR defines -3 as "Parameter Error" for this function: */
+	if (ret == -3)
+		return -EINVAL;
+	else
+		return -EIO;
+}
+
 /*
  * Buffer for reporting slot-error-detail rtas calls. Its here
  * in BSS, and not dynamically alloced, so that it ends up in
@@ -96,6 +243,10 @@ static int eeh_error_buf_size;
  */
 static int pseries_eeh_init(void)
 {
+    struct pci_controller *phb;
+    struct pci_dn *pdn;
+    int addr, config_addr;
+
 	/* figure out EEH RTAS function call tokens */
 	ibm_set_eeh_option		= rtas_token("ibm,set-eeh-option");
 	ibm_set_slot_reset		= rtas_token("ibm,set-slot-reset");
@@ -148,6 +299,22 @@ static int pseries_eeh_init(void)
 	/* Set EEH machine dependent code */
 	ppc_md.pcibios_bus_add_device = pseries_pcibios_bus_add_device;
 
+    if (is_kdump_kernel() || reset_devices) {
+        pr_info("Issue PHB reset ...\n");
+        list_for_each_entry(phb, &hose_list, list_node) {
+            pdn = list_first_entry(&PCI_DN(phb->dn)->child_list, struct pci_dn, list);
+            addr = (pdn->busno << 16) | (pdn->devfn << 8);
+            config_addr = pseries_eeh_get_config_addr(phb, addr);
+            /* invalid PE config addr */
+            if (config_addr == 0)
+                continue;
+
+            pseries_eeh_phb_reset(phb, config_addr, EEH_RESET_FUNDAMENTAL);
+            pseries_eeh_phb_reset(phb, config_addr, EEH_RESET_DEACTIVATE);
+            pseries_eeh_phb_configure_bridge(phb, config_addr);
+        }
+    }
+
 	return 0;
 }
 
@@ -569,35 +736,13 @@ static int pseries_eeh_get_state(struct eeh_pe *pe, int *delay)
 static int pseries_eeh_reset(struct eeh_pe *pe, int option)
 {
 	int config_addr;
-	int ret;
 
 	/* Figure out PE address */
 	config_addr = pe->config_addr;
 	if (pe->addr)
 		config_addr = pe->addr;
-
-	/* Reset PE through RTAS call */
-	ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
-			config_addr, BUID_HI(pe->phb->buid),
-			BUID_LO(pe->phb->buid), option);
-
-	/* If fundamental-reset not supported, try hot-reset */
-	if (option == EEH_RESET_FUNDAMENTAL &&
-	    ret == -8) {
-		option = EEH_RESET_HOT;
-		ret = rtas_call(ibm_set_slot_reset, 4, 1, NULL,
-				config_addr, BUID_HI(pe->phb->buid),
-				BUID_LO(pe->phb->buid), option);
-	}
-
-	/* We need reset hold or settlement delay */
-	if (option == EEH_RESET_FUNDAMENTAL ||
-	    option == EEH_RESET_HOT)
-		msleep(EEH_PE_RST_HOLD_TIME);
-	else
-		msleep(EEH_PE_RST_SETTLE_TIME);
-
-	return ret;
+    
+    return pseries_eeh_phb_reset(pe->phb, config_addr, option);
 }
 
 /**
@@ -641,56 +786,17 @@ static int pseries_eeh_get_log(struct eeh_pe *pe, int severity, char *drv_log, u
  * pseries_eeh_configure_bridge - Configure PCI bridges in the indicated PE
  * @pe: EEH PE
  *
- * The function will be called to reconfigure the bridges included
- * in the specified PE so that the mulfunctional PE would be recovered
- * again.
  */
 static int pseries_eeh_configure_bridge(struct eeh_pe *pe)
 {
 	int config_addr;
-	int ret;
-	/* Waiting 0.2s maximum before skipping configuration */
-	int max_wait = 200;
 
 	/* Figure out the PE address */
 	config_addr = pe->config_addr;
 	if (pe->addr)
 		config_addr = pe->addr;
 
-	while (max_wait > 0) {
-		ret = rtas_call(ibm_configure_pe, 3, 1, NULL,
-				config_addr, BUID_HI(pe->phb->buid),
-				BUID_LO(pe->phb->buid));
-
-		if (!ret)
-			return ret;
-		if (ret < 0)
-			break;
-
-		/*
-		 * If RTAS returns a delay value that's above 100ms, cut it
-		 * down to 100ms in case firmware made a mistake.  For more
-		 * on how these delay values work see rtas_busy_delay_time
-		 */
-		if (ret > RTAS_EXTENDED_DELAY_MIN+2 &&
-		    ret <= RTAS_EXTENDED_DELAY_MAX)
-			ret = RTAS_EXTENDED_DELAY_MIN+2;
-
-		max_wait -= rtas_busy_delay_time(ret);
-
-		if (max_wait < 0)
-			break;
-
-		rtas_busy_delay(ret);
-	}
-
-	pr_warn("%s: Unable to configure bridge PHB#%x-PE#%x (%d)\n",
-		__func__, pe->phb->global_number, pe->addr, ret);
-	/* PAPR defines -3 as "Parameter Error" for this function: */
-	if (ret == -3)
-		return -EINVAL;
-	else
-		return -EIO;
+    return pseries_eeh_phb_configure_bridge(pe->phb, config_addr);
 }
 
 /**
-- 
2.18.1

