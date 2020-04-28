Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9539C1BB4CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 05:48:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49B70z6DYGzDqqW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 13:48:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbobroff@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49B6wr6lQ6zDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 13:45:16 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03S3WorI035908
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 23:45:13 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30metvy5r0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 23:45:13 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03S3jDDs062033
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 23:45:13 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30metvy5qk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 23:45:13 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03S3ib9q008989;
 Tue, 28 Apr 2020 03:45:11 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 30mcu5n74w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 03:45:11 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03S3j9cr61866092
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 03:45:09 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3125911C05C;
 Tue, 28 Apr 2020 03:45:09 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D18E811C04A;
 Tue, 28 Apr 2020 03:45:08 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Apr 2020 03:45:08 +0000 (GMT)
Received: from osmium.ibmuc.com (unknown [9.206.152.45])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 056A6A0282;
 Tue, 28 Apr 2020 13:45:02 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 2/2] powerpc/eeh: Release EEH device state synchronously
Date: Tue, 28 Apr 2020 13:45:06 +1000
Message-Id: <0a1f5105d3a33b1c090bba31de63eb0cdd25de7b.1588045502.git.sbobroff@linux.ibm.com>
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1588045502.git.sbobroff@linux.ibm.com>
References: <cover.1588045502.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_17:2020-04-27,
 2020-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004280024
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

EEH device state is currently removed (by eeh_remove_device()) during
the device release handler, which is invoked as the device's reference
count drops to zero. This may take some time, or forever, as other
threads may hold references.

However, the PCI device state is released synchronously by
pci_stop_and_remove_bus_device(). This mismatch causes problems, for
example the device may be re-discovered as a new device before the
release handler has been called, leaving the PCI and EEH state
mismatched.

So instead, call eeh_remove_device() from the bus device removal
handlers, which are called synchronously in the removal path.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
 arch/powerpc/kernel/eeh.c         | 31 +++++++++++++++++++++++++++++++
 arch/powerpc/kernel/pci-hotplug.c |  2 --
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 17cb3e9b5697..64361311bc8e 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1106,6 +1106,37 @@ static int eeh_init(void)
 
 core_initcall_sync(eeh_init);
 
+static int eeh_device_notifier(struct notifier_block *nb,
+			       unsigned long action, void *data)
+{
+	struct device *dev = data;
+
+	switch (action) {
+	/*
+	 * Note: It's not possible to perform EEH device addition (i.e.
+	 * {pseries,pnv}_pcibios_bus_add_device()) here because it depends on
+	 * the device's resources, which have not yet been set up.
+	 */
+	case BUS_NOTIFY_DEL_DEVICE:
+		eeh_remove_device(to_pci_dev(dev));
+		break;
+	default:
+		break;
+	}
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block eeh_device_nb = {
+	.notifier_call = eeh_device_notifier,
+};
+
+static __init int eeh_set_bus_notifier(void)
+{
+	bus_register_notifier(&pci_bus_type, &eeh_device_nb);
+	return 0;
+}
+arch_initcall(eeh_set_bus_notifier);
+
 /**
  * eeh_add_device_early - Enable EEH for the indicated device node
  * @pdn: PCI device node for which to set up EEH
diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
index d6a67f814983..28e9aa274f64 100644
--- a/arch/powerpc/kernel/pci-hotplug.c
+++ b/arch/powerpc/kernel/pci-hotplug.c
@@ -57,8 +57,6 @@ void pcibios_release_device(struct pci_dev *dev)
 	struct pci_controller *phb = pci_bus_to_host(dev->bus);
 	struct pci_dn *pdn = pci_get_pdn(dev);
 
-	eeh_remove_device(dev);
-
 	if (phb->controller_ops.release_device)
 		phb->controller_ops.release_device(dev);
 
-- 
2.22.0.216.g00a2a96fc9

