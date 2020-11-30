Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBFD2C87FD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 16:31:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cl8N05gzJzDqlg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 02:31:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=eYXUHnA8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl8LF38YgzDqWs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 02:29:56 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AUF5F9b125273
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 10:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=L7dsS0pQqTFuMC/e4WftXw/kCRYq98UYhZQ2eOrpZZQ=;
 b=eYXUHnA82LpHGsMICyJnV2v3CbU9LUe8YcrTGnh179UROS6lVz9xCkRlnq/jT8RnNj0r
 Z6OYBY/EI+dkGq/uMKkw84YjPLgQT0C+0pplvAg5iHcHz4DvHmHHy8h/fbqHJvbRvUqd
 ZyPHctLB0AH6ZRN3plxf987NgygjQlgc4fwdw2xntwc4/vXzBkpy0HqSP3pAupnGs334
 fXZPmumk8y0MeUELeJPp1a528wYlF+WUCMLhtY6BKIjCJWKNmg1leN7d+qrm0sP9+wsV
 0jDfXe+ECfwhJYaIsOsY7RY4pV+j90k7RSud1LrSeMAb60vdsaE1oBhdn9zUNKMSORVP DA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 355263jx4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 10:29:53 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AUFRhCk006695
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 15:29:52 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 353e6825qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 15:29:51 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AUFTnaO39584060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 15:29:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFAD9A405B
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 15:29:49 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABDE6A4059
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 15:29:49 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.145.147.204])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 15:29:49 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: Define PCI bus speed for Gen4 and Gen5
Date: Mon, 30 Nov 2020 16:29:49 +0100
Message-Id: <20201130152949.26467-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-30_05:2020-11-30,
 2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 suspectscore=1 phishscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011300098
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update bus speed definition for PCI Gen4 and 5.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/pci.c | 51 ++++++++++++----------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platforms/pseries/pci.c
index 911534b89c85..72a4d4167849 100644
--- a/arch/powerpc/platforms/pseries/pci.c
+++ b/arch/powerpc/platforms/pseries/pci.c
@@ -290,6 +290,25 @@ static void fixup_winbond_82c105(struct pci_dev* dev)
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_WINBOND, PCI_DEVICE_ID_WINBOND_82C105,
 			 fixup_winbond_82c105);
 
+static enum pci_bus_speed prop_to_pci_speed(u32 prop)
+{
+	switch (prop) {
+	case 0x01:
+		return PCIE_SPEED_2_5GT;
+	case 0x02:
+		return PCIE_SPEED_5_0GT;
+	case 0x04:
+		return PCIE_SPEED_8_0GT;
+	case 0x08:
+		return PCIE_SPEED_16_0GT;
+	case 0x10:
+		return PCIE_SPEED_32_0GT;
+	default:
+		pr_debug("Unexpected PCI link speed property value\n");
+		return PCI_SPEED_UNKNOWN;
+	}
+}
+
 int pseries_root_bridge_prepare(struct pci_host_bridge *bridge)
 {
 	struct device_node *dn, *pdn;
@@ -322,35 +341,7 @@ int pseries_root_bridge_prepare(struct pci_host_bridge *bridge)
 		return 0;
 	}
 
-	switch (pcie_link_speed_stats[0]) {
-	case 0x01:
-		bus->max_bus_speed = PCIE_SPEED_2_5GT;
-		break;
-	case 0x02:
-		bus->max_bus_speed = PCIE_SPEED_5_0GT;
-		break;
-	case 0x04:
-		bus->max_bus_speed = PCIE_SPEED_8_0GT;
-		break;
-	default:
-		bus->max_bus_speed = PCI_SPEED_UNKNOWN;
-		break;
-	}
-
-	switch (pcie_link_speed_stats[1]) {
-	case 0x01:
-		bus->cur_bus_speed = PCIE_SPEED_2_5GT;
-		break;
-	case 0x02:
-		bus->cur_bus_speed = PCIE_SPEED_5_0GT;
-		break;
-	case 0x04:
-		bus->cur_bus_speed = PCIE_SPEED_8_0GT;
-		break;
-	default:
-		bus->cur_bus_speed = PCI_SPEED_UNKNOWN;
-		break;
-	}
-
+	bus->max_bus_speed = prop_to_pci_speed(pcie_link_speed_stats[0]);
+	bus->cur_bus_speed = prop_to_pci_speed(pcie_link_speed_stats[1]);
 	return 0;
 }
-- 
2.26.2

