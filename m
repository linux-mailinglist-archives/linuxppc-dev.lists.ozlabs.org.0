Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A949715883
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 06:31:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yms5168czDqNH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 14:31:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ymqY4Bn1zDqK5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 14:30:16 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x474MGhR039010
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 May 2019 00:30:13 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2saypgxmsu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2019 00:30:13 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 7 May 2019 05:30:11 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 May 2019 05:30:09 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x474U8oa52691168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 May 2019 04:30:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72D7711C054;
 Tue,  7 May 2019 04:30:08 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CDED11C064;
 Tue,  7 May 2019 04:30:08 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 May 2019 04:30:08 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B8A7AA023A;
 Tue,  7 May 2019 14:30:06 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/6] powerpc/64: Adjust order in pcibios_init()
Date: Tue,  7 May 2019 14:30:01 +1000
X-Mailer: git-send-email 2.19.0.2.gcad72f5712
In-Reply-To: <cover.1557203383.git.sbobroff@linux.ibm.com>
References: <cover.1557203383.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19050704-0016-0000-0000-000002790935
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050704-0017-0000-0000-000032D5B098
Message-Id: <e95e2d3412aeb4225ec7f59bce24cf1d1c25e8dc.1557203383.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-07_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=29 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905070028
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
index ff4b7539cbdf..3146eb73e3b3 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -1383,10 +1383,6 @@ void __init pcibios_resource_survey(void)
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
index 0417fda13636..7078122e9cea 100644
--- a/arch/powerpc/kernel/pci_32.c
+++ b/arch/powerpc/kernel/pci_32.c
@@ -262,6 +262,10 @@ static int __init pcibios_init(void)
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
index 9d8c10d55407..6f16f30031d7 100644
--- a/arch/powerpc/kernel/pci_64.c
+++ b/arch/powerpc/kernel/pci_64.c
@@ -58,14 +58,20 @@ static int __init pcibios_init(void)
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
2.19.0.2.gcad72f5712

