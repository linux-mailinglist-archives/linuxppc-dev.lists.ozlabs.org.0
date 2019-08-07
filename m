Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 701498430E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 05:54:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463Hgk6mDWzDrHm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 13:54:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463HSm34LNzDr1V
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 13:44:56 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x773fqZf115557
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 6 Aug 2019 23:44:53 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u7p209mcf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2019 23:44:52 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 7 Aug 2019 04:44:51 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 7 Aug 2019 04:44:48 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x773ilIo43385046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Aug 2019 03:44:47 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6127E4C050;
 Wed,  7 Aug 2019 03:44:47 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EA844C044;
 Wed,  7 Aug 2019 03:44:47 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  7 Aug 2019 03:44:47 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 08680A0332;
 Wed,  7 Aug 2019 13:44:43 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 1/9] powerpc/64: Adjust order in pcibios_init()
Date: Wed,  7 Aug 2019 13:44:34 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1565149456.git.sbobroff@linux.ibm.com>
References: <cover.1565149456.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19080703-0028-0000-0000-0000038C66A5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080703-0029-0000-0000-0000244CC9A9
Message-Id: <e1379598d3b3df2653ae3ab88ec7588ce609451a.1565149456.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-07_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=29 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908070036
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
Cc: aik@ozlabs.ru, oohall@gmail.com, tyreld@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pcibios_init() function for 64 bit PowerPC currently calls
pci_bus_add_devices() before pcibios_resource_survey(), which seems
incorrect because it adds devices and attempts to bind their drivers
before allocating their resources (although no problems seem to be
apparent).

So move the call to pci_bus_add_devices() to after
pcibios_resource_survey(), while extracting call to the
pcibios_fixup() hook so that it remains in the same location.

This will also allow the ppc_md.pcibios_bus_add_device() hooks to
perform actions that depend on PCI resources, both during rescanning
(where this is already the case) and at boot time, to support future
work.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kernel/pci-common.c |  4 ----
 arch/powerpc/kernel/pci_32.c     |  4 ++++
 arch/powerpc/kernel/pci_64.c     | 12 +++++++++---
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index f627e15bb43c..1c448cf25506 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -1379,10 +1379,6 @@ void __init pcibios_resource_survey(void)
 		pr_debug("PCI: Assigning unassigned resources...\n");
 		pci_assign_unassigned_resources();
 	}
-
-	/* Call machine dependent fixup */
-	if (ppc_md.pcibios_fixup)
-		ppc_md.pcibios_fixup();
 }
 
 /* This is used by the PCI hotplug driver to allocate resource
diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
index 50942a1d1a5f..b49e1060a3bf 100644
--- a/arch/powerpc/kernel/pci_32.c
+++ b/arch/powerpc/kernel/pci_32.c
@@ -263,6 +263,10 @@ static int __init pcibios_init(void)
 	/* Call common code to handle resource allocation */
 	pcibios_resource_survey();
 
+	/* Call machine dependent fixup */
+	if (ppc_md.pcibios_fixup)
+		ppc_md.pcibios_fixup();
+
 	/* Call machine dependent post-init code */
 	if (ppc_md.pcibios_after_init)
 		ppc_md.pcibios_after_init();
diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
index b7030b1189d0..f83d1f69b1dd 100644
--- a/arch/powerpc/kernel/pci_64.c
+++ b/arch/powerpc/kernel/pci_64.c
@@ -54,14 +54,20 @@ static int __init pcibios_init(void)
 	pci_add_flags(PCI_ENABLE_PROC_DOMAINS | PCI_COMPAT_DOMAIN_0);
 
 	/* Scan all of the recorded PCI controllers.  */
-	list_for_each_entry_safe(hose, tmp, &hose_list, list_node) {
+	list_for_each_entry_safe(hose, tmp, &hose_list, list_node)
 		pcibios_scan_phb(hose);
-		pci_bus_add_devices(hose->bus);
-	}
 
 	/* Call common code to handle resource allocation */
 	pcibios_resource_survey();
 
+	/* Add devices. */
+	list_for_each_entry_safe(hose, tmp, &hose_list, list_node)
+		pci_bus_add_devices(hose->bus);
+
+	/* Call machine dependent fixup */
+	if (ppc_md.pcibios_fixup)
+		ppc_md.pcibios_fixup();
+
 	printk(KERN_DEBUG "PCI: Probing PCI hardware done\n");
 
 	return 0;
-- 
2.22.0.216.g00a2a96fc9

