Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2F84BA65
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 15:45:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TR6n6kDYzDqs8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 23:45:53 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TQlB1Gc4zDqpf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 23:28:53 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5JDH04t064343
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 09:28:50 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t7mr5cke9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 09:28:49 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Wed, 19 Jun 2019 14:28:47 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Jun 2019 14:28:44 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5JDShsj57606190
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 13:28:43 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20EC1A404D;
 Wed, 19 Jun 2019 13:28:43 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C82CEA4057;
 Wed, 19 Jun 2019 13:28:42 +0000 (GMT)
Received: from pic2.home (unknown [9.145.171.67])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Jun 2019 13:28:42 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, andrew.donnellan@au1.ibm.com,
 clombard@linux.ibm.com
Subject: [RFC 05/11] powerpc/powernv/ioda: Find opencapi slot for a device node
Date: Wed, 19 Jun 2019 15:28:34 +0200
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619132840.27634-1-fbarrat@linux.ibm.com>
References: <20190619132840.27634-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061913-0016-0000-0000-0000028A7856
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061913-0017-0000-0000-000032E7CF75
Message-Id: <20190619132840.27634-6-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=710 adultscore=0 classifier=spam adjust=0 reason=mlx
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

Unlike real PCI slots, opencapi slots are directly associated to
the (virtual) opencapi PHB, there's no intermediate bridge. So when
looking for a slot ID, we must start the search from the device node
itself and not its parent.

Also, the slot ID is not attached to a specific bdfn, so let's build
it from the PHB ID, like skiboot.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 arch/powerpc/include/asm/pnv-pci.h   |  1 +
 arch/powerpc/platforms/powernv/pci.c | 10 +++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/pnv-pci.h b/arch/powerpc/include/asm/pnv-pci.h
index b5a85f1bb305..4b4dfa6bfdd3 100644
--- a/arch/powerpc/include/asm/pnv-pci.h
+++ b/arch/powerpc/include/asm/pnv-pci.h
@@ -15,6 +15,7 @@
 #define PCI_SLOT_ID_PREFIX	(1UL << 63)
 #define PCI_SLOT_ID(phb_id, bdfn)	\
 	(PCI_SLOT_ID_PREFIX | ((uint64_t)(bdfn) << 16) | (phb_id))
+#define PCI_PHB_SLOT_ID(phb_id)		(phb_id)
 
 extern int pnv_pci_get_slot_id(struct device_node *np, uint64_t *id);
 extern int pnv_pci_get_device_tree(uint32_t phandle, void *buf, uint64_t len);
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index ff1a33fee8e6..3e4e75a883e1 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -49,13 +49,14 @@ int pnv_pci_get_slot_id(struct device_node *np, uint64_t *id)
 		return -ENXIO;
 
 	bdfn = ((bdfn & 0x00ffff00) >> 8);
-	while ((parent = of_get_parent(parent))) {
+	for (parent = np; parent; parent = of_get_parent(parent)) {
 		if (!PCI_DN(parent)) {
 			of_node_put(parent);
 			break;
 		}
 
-		if (!of_device_is_compatible(parent, "ibm,ioda2-phb")) {
+		if (!of_device_is_compatible(parent, "ibm,ioda2-phb") &&
+		    !of_device_is_compatible(parent, "ibm,ioda2-npu2-opencapi-phb")) {
 			of_node_put(parent);
 			continue;
 		}
@@ -66,7 +67,10 @@ int pnv_pci_get_slot_id(struct device_node *np, uint64_t *id)
 			return -ENXIO;
 		}
 
-		*id = PCI_SLOT_ID(phbid, bdfn);
+		if (of_device_is_compatible(parent, "ibm,ioda2-npu2-opencapi-phb"))
+			*id = PCI_PHB_SLOT_ID(phbid);
+		else
+			*id = PCI_SLOT_ID(phbid, bdfn);
 		return 0;
 	}
 
-- 
2.21.0

