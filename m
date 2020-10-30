Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA6729FB08
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 03:06:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMlyt202yzDr9C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 13:05:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sxEelC9Q; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMkwG3CC4zDql5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 12:18:38 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U11GGN015706
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cjiEy4QixRCGH7b+TKlFG/Brz9w97HKfavm57556RIE=;
 b=sxEelC9QFfb4m8lJWMPjyLSA2I6Grg2eF8mHQDE1bV1Yyajjc3bgANft756UEmZ6JNU3
 ZPHyzM+5vwxfRn8M1FP1IY4fwGagLnVQH87O1HZ/zVHI97qh6/6DK0wcT2mhsAjOS9Yo
 8J+U5SK7I2zgDEiV/3okMYurGc37ILkYWITFI95AqEHdpACqCiDy6YIq8MYMk5yohZ9K
 YodRKym2w5YCS7FaJHrxA/nChcWFoJmTRUClH0QsX+fkNM2E34QaEAVwVcx2htFOLRJX
 rocwz9VypaX/2UINK13y/nVYRif2GnTJFORiF8P/XXnkGP/yg7/p4rLjYNJzFrLtCbHY XQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34fvjjsf0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 21:18:34 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09U1GhCe016229
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:34 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 34ernqup0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 01:18:33 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09U1IXlq14615356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:18:33 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C76AB2067;
 Fri, 30 Oct 2020 01:18:33 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 235DBB205F;
 Fri, 30 Oct 2020 01:18:33 +0000 (GMT)
Received: from localhost (unknown [9.65.225.148])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 30 Oct 2020 01:18:33 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 29/29] powerpc/pseries/mobility: refactor node lookup during
 DT update
Date: Thu, 29 Oct 2020 20:18:05 -0500
Message-Id: <20201030011805.1224603-30-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201030011805.1224603-1-nathanl@linux.ibm.com>
References: <20201030011805.1224603-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 suspectscore=1
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010300001
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
 arch/powerpc/platforms/pseries/mobility.c | 45 ++++++++---------------
 1 file changed, 16 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index d6417c9db201..5521b63898aa 100644
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
@@ -224,21 +209,15 @@ static int update_dt_node(__be32 phandle, s32 scope)
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
 	if (!dn) {
 		of_node_put(parent_dn);
@@ -251,7 +230,6 @@ static int add_dt_node(__be32 parent_phandle, __be32 drc_index)
 
 	pr_debug("added node %pOFfp\n", dn);
 
-	of_node_put(parent_dn);
 	return rc;
 }
 
@@ -284,22 +262,31 @@ int pseries_devicetree_update(s32 scope)
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
2.25.4

