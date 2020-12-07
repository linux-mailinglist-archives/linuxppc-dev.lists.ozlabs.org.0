Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0980F2D1DAE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Dec 2020 23:48:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cqdky1kfszDqZx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 09:48:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Jr7Dn+4u; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqcVJ6r7qzDqVc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 08:52:24 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B7LSTMk032191
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 16:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=g7ak4hyb+aPKWtsG3+h3793MKBvfBPSiGBRPQbSGTKk=;
 b=Jr7Dn+4uVsn34Narkzvd2MV5Usa6lbnorwzS+OrbMFUKWbeC3dg1xvWRHRWi+HZWIYST
 KAmIy4WH+7sP8eUlEJOC2HbFMoEOkmHsDoB20oLvxEuQPdSgd4sSHKOxws+7zR3H8Eya
 sI9loL83iLQlTcansevU5N0uXyWyrvt7V2xvTS1k9lNTwTsuBLsE4WrBUOE4rduDunq5
 XjYEnzUEkkWPysdN/IzR4OkcopkxApy7OZ1Q5seB8TPw/DknZ1qHjFHIaeUyVoS5CgJg
 GY2wgKPsKLzWQV9RBtKxNCtMpmL5RNwYkJEQZ455aiCXG5rUB8hSbGGggl0eo1Jl/Fd+ nA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 358r4vahkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:52:22 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B7LlPD2029291
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Dec 2020 21:52:21 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 3581u8x5q6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 21:52:21 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B7LqL2f3998240
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Dec 2020 21:52:21 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40A27AC059;
 Mon,  7 Dec 2020 21:52:21 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13695AC05B;
 Mon,  7 Dec 2020 21:52:21 +0000 (GMT)
Received: from localhost (unknown [9.160.57.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Dec 2020 21:52:20 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 28/28] powerpc/pseries/mobility: refactor node lookup
 during DT update
Date: Mon,  7 Dec 2020 15:52:00 -0600
Message-Id: <20201207215200.1785968-29-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201207215200.1785968-1-nathanl@linux.ibm.com>
References: <20201207215200.1785968-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_16:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1
 impostorscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070132
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In pseries_devicetree_update(), with each call to ibm,update-nodes the
partition firmware communicates the node to be deleted or updated by
placing its phandle in the work buffer. Each of delete_dt_node(),
update_dt_node(), and add_dt_node() have duplicate lookups using the
phandle value and corresponding refcount management.

Move the lookup and of_node_put() into pseries_devicetree_update(),
and emit a warning on any failed lookups.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c | 49 ++++++++---------------
 1 file changed, 17 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index e670180f311d..ea4d6a660e0d 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -61,18 +61,10 @@ static int mobility_rtas_call(int token, char *buf, s32 scope)
 	return rc;
 }
 
-static int delete_dt_node(__be32 phandle)
+static int delete_dt_node(struct device_node *dn)
 {
-	struct device_node *dn;
-
-	dn = of_find_node_by_phandle(be32_to_cpu(phandle));
-	if (!dn)
-		return -ENOENT;
-
 	pr_debug("removing node %pOFfp\n", dn);
-
 	dlpar_detach_node(dn);
-	of_node_put(dn);
 	return 0;
 }
 
@@ -137,10 +129,9 @@ static int update_dt_property(struct device_node *dn, struct property **prop,
 	return 0;
 }
 
-static int update_dt_node(__be32 phandle, s32 scope)
+static int update_dt_node(struct device_node *dn, s32 scope)
 {
 	struct update_props_workarea *upwa;
-	struct device_node *dn;
 	struct property *prop = NULL;
 	int i, rc, rtas_rc;
 	char *prop_data;
@@ -157,14 +148,8 @@ static int update_dt_node(__be32 phandle, s32 scope)
 	if (!rtas_buf)
 		return -ENOMEM;
 
-	dn = of_find_node_by_phandle(be32_to_cpu(phandle));
-	if (!dn) {
-		kfree(rtas_buf);
-		return -ENOENT;
-	}
-
 	upwa = (struct update_props_workarea *)&rtas_buf[0];
-	upwa->phandle = phandle;
+	upwa->phandle = cpu_to_be32(dn->phandle);
 
 	do {
 		rtas_rc = mobility_rtas_call(update_properties_token, rtas_buf,
@@ -224,26 +209,18 @@ static int update_dt_node(__be32 phandle, s32 scope)
 		cond_resched();
 	} while (rtas_rc == 1);
 
-	of_node_put(dn);
 	kfree(rtas_buf);
 	return 0;
 }
 
-static int add_dt_node(__be32 parent_phandle, __be32 drc_index)
+static int add_dt_node(struct device_node *parent_dn, __be32 drc_index)
 {
 	struct device_node *dn;
-	struct device_node *parent_dn;
 	int rc;
 
-	parent_dn = of_find_node_by_phandle(be32_to_cpu(parent_phandle));
-	if (!parent_dn)
-		return -ENOENT;
-
 	dn = dlpar_configure_connector(drc_index, parent_dn);
-	if (!dn) {
-		of_node_put(parent_dn);
+	if (!dn)
 		return -ENOENT;
-	}
 
 	rc = dlpar_attach_node(dn, parent_dn);
 	if (rc)
@@ -251,7 +228,6 @@ static int add_dt_node(__be32 parent_phandle, __be32 drc_index)
 
 	pr_debug("added node %pOFfp\n", dn);
 
-	of_node_put(parent_dn);
 	return rc;
 }
 
@@ -284,22 +260,31 @@ int pseries_devicetree_update(s32 scope)
 			data++;
 
 			for (i = 0; i < node_count; i++) {
+				struct device_node *np;
 				__be32 phandle = *data++;
 				__be32 drc_index;
 
+				np = of_find_node_by_phandle(be32_to_cpu(phandle));
+				if (!np) {
+					pr_warn("Failed lookup: phandle 0x%x for action 0x%x\n",
+						be32_to_cpu(phandle), action);
+					continue;
+				}
+
 				switch (action) {
 				case DELETE_DT_NODE:
-					delete_dt_node(phandle);
+					delete_dt_node(np);
 					break;
 				case UPDATE_DT_NODE:
-					update_dt_node(phandle, scope);
+					update_dt_node(np, scope);
 					break;
 				case ADD_DT_NODE:
 					drc_index = *data++;
-					add_dt_node(phandle, drc_index);
+					add_dt_node(np, drc_index);
 					break;
 				}
 
+				of_node_put(np);
 				cond_resched();
 			}
 		}
-- 
2.28.0

