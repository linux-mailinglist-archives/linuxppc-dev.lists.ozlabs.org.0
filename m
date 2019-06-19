Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D532B4BA91
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 15:53:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TRHv3STRzDqjZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 23:53:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TQlD2wRpzDqpf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 23:28:56 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JDHTDk064111
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 09:28:52 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t7natjkq0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 09:28:51 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Wed, 19 Jun 2019 14:28:48 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Jun 2019 14:28:46 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5JDSjdX38863266
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 13:28:45 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12AB9A4053;
 Wed, 19 Jun 2019 13:28:45 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA4B4A4051;
 Wed, 19 Jun 2019 13:28:44 +0000 (GMT)
Received: from pic2.home (unknown [9.145.171.67])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Jun 2019 13:28:44 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, andrew.donnellan@au1.ibm.com,
 clombard@linux.ibm.com
Subject: [RFC 10/11] pci/hotplug/pnv-php: Wrap warnings in macro
Date: Wed, 19 Jun 2019 15:28:39 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619132840.27634-1-fbarrat@linux.ibm.com>
References: <20190619132840.27634-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061913-0012-0000-0000-0000032A81F5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061913-0013-0000-0000-00002163A334
Message-Id: <20190619132840.27634-11-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906190109
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
Cc: aik@ozlabs.ru, arbab@linux.ibm.com, oohall@gmail.com, groug@kaod.org,
 alastair@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

An opencapi slot doesn't have an associated bridge device. It's not
needed for operation, but any warning is displayed through pci_warn()
which uses the pci_dev struct of the assocated bridge device. So wrap
those warning so that a different trace mechanism can be used if it's
an opencapi slot.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 drivers/pci/hotplug/pnv_php.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index 74b62a8e11e7..08ac8f0df06c 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -18,6 +18,9 @@
 #define DRIVER_AUTHOR	"Gavin Shan, IBM Corporation"
 #define DRIVER_DESC	"PowerPC PowerNV PCI Hotplug Driver"
 
+#define SLOT_WARN(slot, x...) \
+	(slot->pdev ? pci_warn(slot->pdev, x) : dev_warn(&slot->bus->dev, x))
+
 struct pnv_php_event {
 	bool			added;
 	struct pnv_php_slot	*php_slot;
@@ -265,7 +268,7 @@ static int pnv_php_add_devtree(struct pnv_php_slot *php_slot)
 
 	ret = pnv_pci_get_device_tree(php_slot->dn->phandle, fdt1, 0x10000);
 	if (ret) {
-		pci_warn(php_slot->pdev, "Error %d getting FDT blob\n", ret);
+		SLOT_WARN(php_slot, "Error %d getting FDT blob\n", ret);
 		goto free_fdt1;
 	}
 
@@ -279,7 +282,7 @@ static int pnv_php_add_devtree(struct pnv_php_slot *php_slot)
 	dt = of_fdt_unflatten_tree(fdt, php_slot->dn, NULL);
 	if (!dt) {
 		ret = -EINVAL;
-		pci_warn(php_slot->pdev, "Cannot unflatten FDT\n");
+		SLOT_WARN(php_slot, "Cannot unflatten FDT\n");
 		goto free_fdt;
 	}
 
@@ -289,7 +292,7 @@ static int pnv_php_add_devtree(struct pnv_php_slot *php_slot)
 	ret = pnv_php_populate_changeset(&php_slot->ocs, php_slot->dn);
 	if (ret) {
 		pnv_php_reverse_nodes(php_slot->dn);
-		pci_warn(php_slot->pdev, "Error %d populating changeset\n",
+		SLOT_WARN(php_slot, "Error %d populating changeset\n",
 			 ret);
 		goto free_dt;
 	}
@@ -297,7 +300,7 @@ static int pnv_php_add_devtree(struct pnv_php_slot *php_slot)
 	php_slot->dn->child = NULL;
 	ret = of_changeset_apply(&php_slot->ocs);
 	if (ret) {
-		pci_warn(php_slot->pdev, "Error %d applying changeset\n", ret);
+		SLOT_WARN(php_slot, "Error %d applying changeset\n", ret);
 		goto destroy_changeset;
 	}
 
@@ -337,7 +340,7 @@ int pnv_php_set_slot_power_state(struct hotplug_slot *slot,
 	if (ret > 0) {
 		if (be64_to_cpu(msg.params[1]) != php_slot->dn->phandle	||
 		    be64_to_cpu(msg.params[2]) != state) {
-			pci_warn(php_slot->pdev, "Wrong msg (%lld, %lld, %lld)\n",
+			SLOT_WARN(php_slot, "Wrong msg (%lld, %lld, %lld)\n",
 				 be64_to_cpu(msg.params[1]),
 				 be64_to_cpu(msg.params[2]),
 				 be64_to_cpu(msg.params[3]));
@@ -359,7 +362,7 @@ int pnv_php_set_slot_power_state(struct hotplug_slot *slot,
 	return ret;
 
 error:
-	pci_warn(php_slot->pdev, "Error %d powering %s\n",
+	SLOT_WARN(php_slot, "Error %d powering %s\n",
 		ret, (state == OPAL_PCI_SLOT_POWER_ON) ? "on" : "off");
 	return ret;
 }
@@ -378,7 +381,7 @@ static int pnv_php_get_power_state(struct hotplug_slot *slot, u8 *state)
 	 */
 	ret = pnv_pci_get_power_state(php_slot->id, &power_state);
 	if (ret) {
-		pci_warn(php_slot->pdev, "Error %d getting power status\n",
+		SLOT_WARN(php_slot, "Error %d getting power status\n",
 			 ret);
 	} else {
 		*state = power_state;
@@ -402,7 +405,7 @@ static int pnv_php_get_adapter_state(struct hotplug_slot *slot, u8 *state)
 		*state = presence;
 		ret = 0;
 	} else {
-		pci_warn(php_slot->pdev, "Error %d getting presence\n", ret);
+		SLOT_WARN(php_slot, "Error %d getting presence\n", ret);
 	}
 
 	return ret;
@@ -637,7 +640,7 @@ static int pnv_php_register_slot(struct pnv_php_slot *php_slot)
 	ret = pci_hp_register(&php_slot->slot, php_slot->bus,
 			      php_slot->slot_no, php_slot->name);
 	if (ret) {
-		pci_warn(php_slot->pdev, "Error %d registering slot\n", ret);
+		SLOT_WARN(php_slot, "Error %d registering slot\n", ret);
 		return ret;
 	}
 
@@ -690,7 +693,7 @@ static int pnv_php_enable_msix(struct pnv_php_slot *php_slot)
 	/* Enable MSIx */
 	ret = pci_enable_msix_exact(pdev, &entry, 1);
 	if (ret) {
-		pci_warn(pdev, "Error %d enabling MSIx\n", ret);
+		SLOT_WARN(php_slot, "Error %d enabling MSIx\n", ret);
 		return ret;
 	}
 
@@ -734,7 +737,7 @@ static irqreturn_t pnv_php_interrupt(int irq, void *data)
 		   (sts & PCI_EXP_SLTSTA_PDC)) {
 		ret = pnv_pci_get_presence_state(php_slot->id, &presence);
 		if (ret) {
-			pci_warn(pdev, "PCI slot [%s] error %d getting presence (0x%04x), to retry the operation.\n",
+			SLOT_WARN(php_slot, "PCI slot [%s] error %d getting presence (0x%04x), to retry the operation.\n",
 				 php_slot->name, ret, sts);
 			return IRQ_HANDLED;
 		}
@@ -764,7 +767,7 @@ static irqreturn_t pnv_php_interrupt(int irq, void *data)
 	 */
 	event = kzalloc(sizeof(*event), GFP_ATOMIC);
 	if (!event) {
-		pci_warn(pdev, "PCI slot [%s] missed hotplug event 0x%04x\n",
+		SLOT_WARN(php_slot, "PCI slot [%s] missed hotplug event 0x%04x\n",
 			 php_slot->name, sts);
 		return IRQ_HANDLED;
 	}
@@ -789,7 +792,7 @@ static void pnv_php_init_irq(struct pnv_php_slot *php_slot, int irq)
 	/* Allocate workqueue */
 	php_slot->wq = alloc_workqueue("pciehp-%s", 0, 0, php_slot->name);
 	if (!php_slot->wq) {
-		pci_warn(pdev, "Cannot alloc workqueue\n");
+		SLOT_WARN(php_slot, "Cannot alloc workqueue\n");
 		pnv_php_disable_irq(php_slot, true);
 		return;
 	}
@@ -813,7 +816,7 @@ static void pnv_php_init_irq(struct pnv_php_slot *php_slot, int irq)
 			  php_slot->name, php_slot);
 	if (ret) {
 		pnv_php_disable_irq(php_slot, true);
-		pci_warn(pdev, "Error %d enabling IRQ %d\n", ret, irq);
+		SLOT_WARN(php_slot, "Error %d enabling IRQ %d\n", ret, irq);
 		return;
 	}
 
@@ -849,7 +852,7 @@ static void pnv_php_enable_irq(struct pnv_php_slot *php_slot)
 
 	ret = pci_enable_device(pdev);
 	if (ret) {
-		pci_warn(pdev, "Error %d enabling device\n", ret);
+		SLOT_WARN(php_slot, "Error %d enabling device\n", ret);
 		return;
 	}
 
-- 
2.21.0

