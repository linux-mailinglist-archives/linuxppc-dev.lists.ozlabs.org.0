Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0EA57B83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 07:33:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z7qC4BjgzDqW4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 15:33:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z7lw6mqRzDqf4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 15:30:52 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5R5SldW042245
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 01:30:49 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tcnc6vvqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 01:30:48 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5R5TNTY023600
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:30:47 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 2t9by74avb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:30:47 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5R5Ul9S49152406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:30:47 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECA1B12405A
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:30:46 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8A3A124053
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:30:46 +0000 (GMT)
Received: from localhost (unknown [9.80.233.188])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:30:46 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/pseries/mobility: add pr_debug for device tree
 changes
Date: Thu, 27 Jun 2019 00:30:44 -0500
Message-Id: <20190627053044.9238-3-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190627053044.9238-1-nathanl@linux.ibm.com>
References: <20190627053044.9238-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906270060
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

When investigating issues with partition migration or resource
reassignments it is helpful to have a log of which nodes and
properties in the device tree have changed. Use pr_debug() so it's
easy to enable these at runtime with the dynamic debug facility.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index f9a1287925a8..5270ac00279b 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -69,6 +69,8 @@ static int delete_dt_node(__be32 phandle)
 	if (!dn)
 		return -ENOENT;
 
+	pr_debug("removing node %pOFfp\n", dn);
+
 	dlpar_detach_node(dn);
 	of_node_put(dn);
 	return 0;
@@ -127,6 +129,7 @@ static int update_dt_property(struct device_node *dn, struct property **prop,
 	}
 
 	if (!more) {
+		pr_debug("updating node %pOF property %s\n", dn, name);
 		of_update_property(dn, new_prop);
 		*prop = NULL;
 	}
@@ -241,6 +244,8 @@ static int add_dt_node(__be32 parent_phandle, __be32 drc_index)
 	if (rc)
 		dlpar_free_cc_nodes(dn);
 
+	pr_debug("added node %pOFfp\n", dn);
+
 	of_node_put(parent_dn);
 	return rc;
 }
@@ -256,6 +261,7 @@ static void prrn_update_node(__be32 phandle)
 	 */
 	dn = of_find_node_by_phandle(be32_to_cpu(phandle));
 	if (dn) {
+		pr_debug("ignoring PRRN for %pOFfp\n", dn);
 		of_node_put(dn);
 		return;
 	}
@@ -265,6 +271,8 @@ static void prrn_update_node(__be32 phandle)
 	hp_elog.id_type = PSERIES_HP_ELOG_ID_DRC_INDEX;
 	hp_elog._drc_u.drc_index = phandle;
 
+	pr_debug("handling PRRN for LMB DRC index 0x%x\n", be32_to_cpu(phandle));
+
 	handle_dlpar_errorlog(&hp_elog);
 }
 
-- 
2.20.1

