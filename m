Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CE7105437
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 15:17:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JhTB5hpgzDqyh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 01:17:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Jgt20vh7zDr6W
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 00:50:01 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xALDlq59022152
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 08:49:56 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wdhwrkm75-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 08:49:56 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Thu, 21 Nov 2019 13:49:55 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 21 Nov 2019 13:49:53 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xALDnpxv51708154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Nov 2019 13:49:51 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C56525204F;
 Thu, 21 Nov 2019 13:49:51 +0000 (GMT)
Received: from bali.tlslab.ibm.com (unknown [9.101.4.17])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7CC1F52050;
 Thu, 21 Nov 2019 13:49:51 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, andrew.donnellan@au1.ibm.com,
 clombard@linux.ibm.com
Subject: [PATCH v2 05/11] powerpc/powernv/ioda: Find opencapi slot for a
 device node
Date: Thu, 21 Nov 2019 14:49:12 +0100
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191121134918.7155-1-fbarrat@linux.ibm.com>
References: <20191121134918.7155-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19112113-0008-0000-0000-00000335B4FD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112113-0009-0000-0000-00004A54DE3B
Message-Id: <20191121134918.7155-6-fbarrat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_03:2019-11-21,2019-11-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=925 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911210125
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, groug@kaod.org,
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
Changelog:
v2:
 - rename variable used when looping (Andrew)


 arch/powerpc/include/asm/pnv-pci.h   |  1 +
 arch/powerpc/platforms/powernv/pci.c | 24 ++++++++++++++----------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/pnv-pci.h b/arch/powerpc/include/asm/pnv-pci.h
index edcb1fc50aeb..d0ee0ede5767 100644
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
index 2825d004dece..44c973bfaa97 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -38,7 +38,7 @@ static DEFINE_MUTEX(tunnel_mutex);
 
 int pnv_pci_get_slot_id(struct device_node *np, uint64_t *id)
 {
-	struct device_node *parent = np;
+	struct device_node *node = np;
 	u32 bdfn;
 	u64 phbid;
 	int ret;
@@ -48,25 +48,29 @@ int pnv_pci_get_slot_id(struct device_node *np, uint64_t *id)
 		return -ENXIO;
 
 	bdfn = ((bdfn & 0x00ffff00) >> 8);
-	while ((parent = of_get_parent(parent))) {
-		if (!PCI_DN(parent)) {
-			of_node_put(parent);
+	for (node = np; node; node = of_get_parent(node)) {
+		if (!PCI_DN(node)) {
+			of_node_put(node);
 			break;
 		}
 
-		if (!of_device_is_compatible(parent, "ibm,ioda2-phb") &&
-		    !of_device_is_compatible(parent, "ibm,ioda3-phb")) {
-			of_node_put(parent);
+		if (!of_device_is_compatible(node, "ibm,ioda2-phb") &&
+		    !of_device_is_compatible(node, "ibm,ioda3-phb") &&
+		    !of_device_is_compatible(node, "ibm,ioda2-npu2-opencapi-phb")) {
+			of_node_put(node);
 			continue;
 		}
 
-		ret = of_property_read_u64(parent, "ibm,opal-phbid", &phbid);
+		ret = of_property_read_u64(node, "ibm,opal-phbid", &phbid);
 		if (ret) {
-			of_node_put(parent);
+			of_node_put(node);
 			return -ENXIO;
 		}
 
-		*id = PCI_SLOT_ID(phbid, bdfn);
+		if (of_device_is_compatible(node, "ibm,ioda2-npu2-opencapi-phb"))
+			*id = PCI_PHB_SLOT_ID(phbid);
+		else
+			*id = PCI_SLOT_ID(phbid, bdfn);
 		return 0;
 	}
 
-- 
2.21.0

