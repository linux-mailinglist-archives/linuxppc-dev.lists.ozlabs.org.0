Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3C2184BC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 07:12:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4501gh1wWvzDqMK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 15:12:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4501fT1m8hzDqLg
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 15:11:44 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x494vTl5062370
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 May 2019 01:11:42 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2scce2awam-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2019 01:11:41 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Thu, 9 May 2019 06:11:39 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 9 May 2019 06:11:38 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x495BbTD52756574
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 May 2019 05:11:37 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CDF34C050
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 05:11:37 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6ECB24C062
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 05:11:36 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 05:11:36 +0000 (GMT)
Received: from intelligence.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 48BEAA03C5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 15:11:32 +1000 (AEST)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/5] powerpc/powernv: Remove dead SCOM access code
Date: Thu,  9 May 2019 15:11:16 +1000
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509051119.7694-1-ajd@linux.ibm.com>
References: <20190509051119.7694-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19050905-0016-0000-0000-00000279CD6C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050905-0017-0000-0000-000032D67FA3
Message-Id: <20190509051119.7694-2-ajd@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=695 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905090032
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

Nothing is using scom_map_device() or scom_find_parent(). Remove them.

Also don't export scom_controller, there are no other users of it.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v1->v2:
- new patch
---
 arch/powerpc/platforms/powernv/scom.c | 67 ---------------------------
 arch/powerpc/platforms/powernv/scom.h | 27 -----------
 2 files changed, 94 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/scom.c b/arch/powerpc/platforms/powernv/scom.c
index 50c019d2ef45..288580e5fdfe 100644
--- a/arch/powerpc/platforms/powernv/scom.c
+++ b/arch/powerpc/platforms/powernv/scom.c
@@ -28,73 +28,6 @@
 #include "scom.h"
 
 const struct scom_controller *scom_controller;
-EXPORT_SYMBOL_GPL(scom_controller);
-
-struct device_node *scom_find_parent(struct device_node *node)
-{
-	struct device_node *par, *tmp;
-	const u32 *p;
-
-	for (par = of_node_get(node); par;) {
-		if (of_get_property(par, "scom-controller", NULL))
-			break;
-		p = of_get_property(par, "scom-parent", NULL);
-		tmp = par;
-		if (p == NULL)
-			par = of_get_parent(par);
-		else
-			par = of_find_node_by_phandle(*p);
-		of_node_put(tmp);
-	}
-	return par;
-}
-EXPORT_SYMBOL_GPL(scom_find_parent);
-
-scom_map_t scom_map_device(struct device_node *dev, int index)
-{
-	struct device_node *parent;
-	unsigned int cells, size;
-	const __be32 *prop, *sprop;
-	u64 reg, cnt;
-	scom_map_t ret;
-
-	parent = scom_find_parent(dev);
-
-	if (parent == NULL)
-		return NULL;
-
-	/*
-	 * We support "scom-reg" properties for adding scom registers
-	 * to a random device-tree node with an explicit scom-parent
-	 *
-	 * We also support the simple "reg" property if the device is
-	 * a direct child of a scom controller.
-	 *
-	 * In case both exist, "scom-reg" takes precedence.
-	 */
-	prop = of_get_property(dev, "scom-reg", &size);
-	sprop = of_get_property(parent, "#scom-cells", NULL);
-	if (!prop && parent == dev->parent) {
-		prop = of_get_property(dev, "reg", &size);
-		sprop = of_get_property(parent, "#address-cells", NULL);
-	}
-	if (!prop)
-		return NULL;
-	cells = sprop ? be32_to_cpup(sprop) : 1;
-	size >>= 2;
-
-	if (index >= (size / (2*cells)))
-		return NULL;
-
-	reg = of_read_number(&prop[index * cells * 2], cells);
-	cnt = of_read_number(&prop[index * cells * 2 + cells], cells);
-
-	ret = scom_map(parent, reg, cnt);
-	of_node_put(parent);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(scom_map_device);
 
 #ifdef CONFIG_SCOM_DEBUGFS
 struct scom_debug_entry {
diff --git a/arch/powerpc/platforms/powernv/scom.h b/arch/powerpc/platforms/powernv/scom.h
index b14fe0edf95b..2c72f7fc8726 100644
--- a/arch/powerpc/platforms/powernv/scom.h
+++ b/arch/powerpc/platforms/powernv/scom.h
@@ -88,33 +88,6 @@ static inline scom_map_t scom_map(struct device_node *ctrl_dev,
 	return scom_controller->map(ctrl_dev, reg, count);
 }
 
-/**
- * scom_find_parent - Find the SCOM controller for a device
- * @dev: OF node of the device
- *
- * This is not meant for general usage, but in combination with
- * scom_map() allows to map registers not represented by the
- * device own scom-reg property. Useful for applying HW workarounds
- * on things not properly represented in the device-tree for example.
- */
-struct device_node *scom_find_parent(struct device_node *dev);
-
-
-/**
- * scom_map_device - Map a device's block of SCOM registers
- * @dev: OF node of the device
- * @index: Register bank index (index in "scom-reg" property)
- *
- * This function will use the device-tree binding for SCOM which
- * is to follow "scom-parent" properties until it finds a node with
- * a "scom-controller" property to find the controller. It will then
- * use the "scom-reg" property which is made of reg/count pairs,
- * each of them having a size defined by the controller's #scom-cells
- * property
- */
-extern scom_map_t scom_map_device(struct device_node *dev, int index);
-
-
 /**
  * scom_unmap - Unmap a block of SCOM registers
  * @map: Result of scom_map is to be unmapped
-- 
2.20.1

