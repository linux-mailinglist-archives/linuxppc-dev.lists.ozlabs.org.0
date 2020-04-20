Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C62901B0136
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 07:53:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495G7w3jdRzDqY1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 15:53:00 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 495G286rbnzDql8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 15:48:00 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03K5VTwf161860
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 01:47:58 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30h3183dtm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 01:47:58 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Mon, 20 Apr 2020 06:47:14 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Apr 2020 06:47:13 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03K5lshf42271146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 05:47:54 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55AC54C040;
 Mon, 20 Apr 2020 05:47:54 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DF024C052;
 Mon, 20 Apr 2020 05:47:54 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Apr 2020 05:47:54 +0000 (GMT)
Received: from osmium.ibmuc.com (unknown [9.163.65.234])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CF7E2A019C;
 Mon, 20 Apr 2020 15:47:46 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/eeh: Release EEH device state synchronously
Date: Mon, 20 Apr 2020 15:47:40 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1587361657.git.sbobroff@linux.ibm.com>
References: <cover.1587361657.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20042005-4275-0000-0000-000003C31123
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042005-4276-0000-0000-000038D891A6
Message-Id: <6097b6ce84be2f36023d24d6a3b0774617ccb656.1587361657.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_01:2020-04-17,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004200044
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
Cc: Oliver O'Halloran <oohall@gmail.com>
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
v2 - Added comment explaining why the add case can't be handled similarly to the remove case.

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

