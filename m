Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EB28C880F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 16:27:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bph42rcm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vgq6V6qXmz3cCt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2024 00:27:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bph42rcm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vgq5B4lmJz30fM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2024 00:26:06 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44HEBTfp009575;
	Fri, 17 May 2024 14:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=J1lYX9to5uE5ouAsEU8SPl9o1h0IUiEjVF9NL1+DPkQ=;
 b=Bph42rcmNl9RnYFqT62W0CPwerJocOTZm7QfR6s1p5fDhN37BKNcxzpamyeoUC6/1f3Z
 NSTA8OqD7/e/zgwVGvVP9XBmDQ19yllNHhUivwkZBkUYYfzeofI7eb534CvzvBDuQOra
 pIsgT/hK0aA8fuXZCqX6TG38m39169LZGKTxIhyRC5Apa93B0OChjezhlwBGwBJXE7Sf
 LUZZlK/sipGPdTB5mu0cwlXhPF9VkN5DL9XJ6oBbFZW75L3oTcbYsKdcHh6lFpqjjvhd
 xwrLDHjUMiGKrp18FgfUChDTmPKrlbEZfh03o5FV/ejj2AwU3scWOIinML4/MKQyAyWH dA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y67uqr65u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 14:26:00 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44HEIV0B023098;
	Fri, 17 May 2024 14:25:59 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y67uqr65s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 14:25:59 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44HCoK1s005721;
	Fri, 17 May 2024 14:25:59 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2nq384mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 14:25:59 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44HEProD52953516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 14:25:55 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BFB120049;
	Fri, 17 May 2024 14:25:53 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F04320040;
	Fri, 17 May 2024 14:25:51 +0000 (GMT)
Received: from li-c9696b4c-3419-11b2-a85c-f9edc3bf8a84.in.ibm.com (unknown [9.109.198.160])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 17 May 2024 14:25:51 +0000 (GMT)
From: Nilay Shroff <nilay@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen.n.rao@linux.ibm.com
Subject: [PATCH v2 1/1] powerpc/numa: Online a node if PHB is attached.
Date: Fri, 17 May 2024 19:55:23 +0530
Message-ID: <20240517142531.3273464-3-nilay@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240517142531.3273464-1-nilay@linux.ibm.com>
References: <20240517142531.3273464-1-nilay@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: l0pM-rAs9vciPdlqaOFCEchRi2lgtPqn
X-Proofpoint-ORIG-GUID: EwshrbWNb3LA8NPsDfmI40kLhrgsHcvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_05,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405170114
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
Cc: gjoyce@linux.ibm.com, srikar@linux.ibm.com, Nilay Shroff <nilay@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, sshegde@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the current design, a numa-node is made online only if
that node is attached to cpu/memory. With this design, if
any PCI/IO device is found to be attached to a numa-node
which is not online then the numa-node id of the corresponding
PCI/IO device is set to NUMA_NO_NODE(-1). This design may
negatively impact the performance of PCIe device if the
numa-node assigned to PCIe device is -1 because in such case
we may not be able to accurately calculate the distance
between two nodes.
The multi-controller NVMe PCIe disk has an issue with
calculating the node distance if the PCIe NVMe controller
is attached to a PCI host bridge which has numa-node id
value set to NUMA_NO_NODE. This patch helps fix this ensuring
that a cpu/memory less numa node is made online if it's
attached to PCI host bridge.

Signed-off-by: Nilay Shroff <nilay@linux.ibm.com>
---
 arch/powerpc/mm/numa.c                     | 14 +++++++++++++-
 arch/powerpc/platforms/pseries/pci_dlpar.c | 14 ++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index a490724e84ad..aa89899f0c1a 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -896,7 +896,7 @@ static int __init numa_setup_drmem_lmb(struct drmem_lmb *lmb,
 
 static int __init parse_numa_properties(void)
 {
-	struct device_node *memory;
+	struct device_node *memory, *pci;
 	int default_nid = 0;
 	unsigned long i;
 	const __be32 *associativity;
@@ -1010,6 +1010,18 @@ static int __init parse_numa_properties(void)
 			goto new_range;
 	}
 
+	for_each_node_by_name(pci, "pci") {
+		int nid = NUMA_NO_NODE;
+
+		associativity = of_get_associativity(pci);
+		if (associativity) {
+			nid = associativity_to_nid(associativity);
+			initialize_form1_numa_distance(associativity);
+		}
+		if (likely(nid >= 0) && !node_online(nid))
+			node_set_online(nid);
+	}
+
 	/*
 	 * Now do the same thing for each MEMBLOCK listed in the
 	 * ibm,dynamic-memory property in the
diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/platforms/pseries/pci_dlpar.c
index 4448386268d9..52e2623a741d 100644
--- a/arch/powerpc/platforms/pseries/pci_dlpar.c
+++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
@@ -11,6 +11,7 @@
 
 #include <linux/pci.h>
 #include <linux/export.h>
+#include <linux/node.h>
 #include <asm/pci-bridge.h>
 #include <asm/ppc-pci.h>
 #include <asm/firmware.h>
@@ -21,9 +22,22 @@
 struct pci_controller *init_phb_dynamic(struct device_node *dn)
 {
 	struct pci_controller *phb;
+	int nid;
 
 	pr_debug("PCI: Initializing new hotplug PHB %pOF\n", dn);
 
+	nid = of_node_to_nid(dn);
+	if (likely((nid) >= 0)) {
+		if (!node_online(nid)) {
+			if (__register_one_node(nid)) {
+				pr_err("PCI: Failed to register node %d\n", nid);
+			} else {
+				update_numa_distance(dn);
+				node_set_online(nid);
+			}
+		}
+	}
+
 	phb = pcibios_alloc_controller(dn);
 	if (!phb)
 		return NULL;
-- 
2.44.0

