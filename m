Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9C640194A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 11:52:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H33bR4ZtXz2yPP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 19:52:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HPWetATN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HPWetATN; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H33XK6Qcsz2xb1
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Sep 2021 19:49:37 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1869YLaT173576; Mon, 6 Sep 2021 05:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aV0DpjxY4KIjR8H4ZzCiCpmwtlBifvWcQRETX12XuIo=;
 b=HPWetATNQlRUStc7fk5Sy6QUovv9eGsRf5YN/BUq+qoYq8X+JUZIccxj5GPqwnKzyaft
 MGz+BAS0RQ/jnuDW5d5d5GPff3WzqVEnbK1CFOGuZz1iT8lQIapL0PdaFzAOuiM96Ne6
 qXOlsGXdawoBgRxDD7My3FYzrQImVG3xviZLGuMizNRH6VE9bixeEu/bLQWVsGuyRrh8
 3MraMhxIUL3PCLTm8s68DxA9Io/K59JjDiuYojEyChR8SlXBoK4JXa7zEJWPf7iOKUcX
 YanwR6FKiYVkqQgfUt1rmS/5HmYAy01Jj818ZxkjG8UwWrS7BlYgrhdQO4LRn1qd/o8c qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3awfhbsnuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 05:49:35 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1869ZaGZ180618;
 Mon, 6 Sep 2021 05:49:34 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3awfhbsnu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 05:49:34 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1869lNAn022344;
 Mon, 6 Sep 2021 09:49:33 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3av0e91w80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 09:49:32 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1869nTrQ26083762
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Sep 2021 09:49:29 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E32542057;
 Mon,  6 Sep 2021 09:49:29 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17FEB4204C;
 Mon,  6 Sep 2021 09:49:29 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Sep 2021 09:49:29 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 3/5] PCI: Move pci_dev_is/assign_added() to pci.h
Date: Mon,  6 Sep 2021 11:49:25 +0200
Message-Id: <20210906094927.524106-4-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210906094927.524106-1-schnelle@linux.ibm.com>
References: <20210906094927.524106-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nasEqpBhqga_TV6B5j2tDuXorT8aJv24
X-Proofpoint-GUID: ThaxjnUnArSqEIM3lfP7wL2Fm1rxUupT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_05:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109060060
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
Cc: linux-s390@vger.kernel.org, Pierre Morel <pmorel@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, Linas Vepstas <linasvepstas@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The helper function pci_dev_is_added() from drivers/pci/pci.h is used in
PCI arch code of both s390 and powerpc leading to awkward relative
includes. Move it to the global include/linux/pci.h and get rid of these
includes just for that one function.

Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/pci-sriov.c |  3 ---
 arch/powerpc/platforms/pseries/setup.c     |  1 -
 arch/s390/pci/pci_sysfs.c                  |  2 --
 drivers/pci/hotplug/acpiphp_glue.c         |  1 -
 drivers/pci/pci.h                          | 15 ---------------
 include/linux/pci.h                        | 15 +++++++++++++++
 6 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index 28aac933a439..2e0ca5451e85 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -9,9 +9,6 @@
 
 #include "pci.h"
 
-/* for pci_dev_is_added() */
-#include "../../../../drivers/pci/pci.h"
-
 /*
  * The majority of the complexity in supporting SR-IOV on PowerNV comes from
  * the need to put the MMIO space for each VF into a separate PE. Internally
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 0dfaa6ab44cc..08e846ae1853 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -74,7 +74,6 @@
 #include <asm/hvconsole.h>
 
 #include "pseries.h"
-#include "../../../../drivers/pci/pci.h"
 
 DEFINE_STATIC_KEY_FALSE(shared_processor);
 EXPORT_SYMBOL(shared_processor);
diff --git a/arch/s390/pci/pci_sysfs.c b/arch/s390/pci/pci_sysfs.c
index 335c281811c7..40733b93a086 100644
--- a/arch/s390/pci/pci_sysfs.c
+++ b/arch/s390/pci/pci_sysfs.c
@@ -13,8 +13,6 @@
 #include <linux/stat.h>
 #include <linux/pci.h>
 
-#include "../../../drivers/pci/pci.h"
-
 #include <asm/sclp.h>
 
 #define zpci_attr(name, fmt, member)					\
diff --git a/drivers/pci/hotplug/acpiphp_glue.c b/drivers/pci/hotplug/acpiphp_glue.c
index f031302ad401..4cb963f88183 100644
--- a/drivers/pci/hotplug/acpiphp_glue.c
+++ b/drivers/pci/hotplug/acpiphp_glue.c
@@ -38,7 +38,6 @@
 #include <linux/slab.h>
 #include <linux/acpi.h>
 
-#include "../pci.h"
 #include "acpiphp.h"
 
 static LIST_HEAD(bridge_list);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 93dcdd431072..a159cd0f6f05 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -383,21 +383,6 @@ static inline bool pci_dev_is_disconnected(const struct pci_dev *dev)
 	return dev->error_state == pci_channel_io_perm_failure;
 }
 
-/* pci_dev priv_flags */
-#define PCI_DEV_ADDED 0
-#define PCI_DPC_RECOVERED 1
-#define PCI_DPC_RECOVERING 2
-
-static inline void pci_dev_assign_added(struct pci_dev *dev, bool added)
-{
-	assign_bit(PCI_DEV_ADDED, &dev->priv_flags, added);
-}
-
-static inline bool pci_dev_is_added(const struct pci_dev *dev)
-{
-	return test_bit(PCI_DEV_ADDED, &dev->priv_flags);
-}
-
 #ifdef CONFIG_PCIEAER
 #include <linux/aer.h>
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 540b377ca8f6..ea0e23dbc8ec 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -507,6 +507,21 @@ struct pci_dev {
 	unsigned long	priv_flags;	/* Private flags for the PCI driver */
 };
 
+/* pci_dev priv_flags */
+#define PCI_DEV_ADDED 0
+#define PCI_DPC_RECOVERED 1
+#define PCI_DPC_RECOVERING 2
+
+static inline void pci_dev_assign_added(struct pci_dev *dev, bool added)
+{
+	assign_bit(PCI_DEV_ADDED, &dev->priv_flags, added);
+}
+
+static inline bool pci_dev_is_added(const struct pci_dev *dev)
+{
+	return test_bit(PCI_DEV_ADDED, &dev->priv_flags);
+}
+
 static inline struct pci_dev *pci_physfn(struct pci_dev *dev)
 {
 #ifdef CONFIG_PCI_IOV
-- 
2.25.1

