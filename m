Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C333923DA91
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 15:09:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMpj768R6zDqGN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 23:08:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YQY0l0AF; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMpKn4R4qzDqq3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 22:52:13 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 076Cm71Y145164; Thu, 6 Aug 2020 08:52:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4aXvgqpbvfLzjvtOthbjxkw1MiUTtlbEc32tsxJE2AU=;
 b=YQY0l0AFiS4Bwz+9qwAg+FunwB6LH74+c28hBrUNZYYSicAkTj5ixYhmFFzXGVXd440G
 5/ORu6C/IyNg3yQcGe2x8eRmgw0GwpCrCoakCCI6SOchJrxME9/KoyKoLdIwHgptrdSt
 3Dp6Ga69yKdnAPYDKXOJAfXLDZ84Tk4TxxJqJsoMwseix06TuBptWUXXn0pBzjz+yaNd
 txcPNGzh4xNydhuqhrAbeVnVna6RCxEokq7WzPX3eox1DzXaRBjgack48eXyBZQWhP6/
 eiqqC22H1q0ytpDd+GV/OTVTQHrs5djRYl2gKrKD3JCYHiX6ibDnlN9IcUISl4Zyeqt6 gw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32repgpcgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 08:52:06 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 076Ck467031709;
 Thu, 6 Aug 2020 12:52:06 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 32n019hejy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Aug 2020 12:52:06 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 076Cq57c47055282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Aug 2020 12:52:05 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E5D328058;
 Thu,  6 Aug 2020 12:52:05 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 785BA2805A;
 Thu,  6 Aug 2020 12:52:03 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.71.228])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 Aug 2020 12:52:03 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH] powerpc/drmem: use global variable instead of fetching
 again
Date: Thu,  6 Aug 2020 18:22:00 +0530
Message-Id: <20200806125200.252403-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200806123604.248361-1-aneesh.kumar@linux.ibm.com>
References: <20200806123604.248361-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-06_06:2020-08-06,
 2020-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008060088
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

use mem_addr_cells/mem_size_cells instead of fetching the values
again from device tree.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/drmem.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
index b2eeea39684c..f533a7b04ab9 100644
--- a/arch/powerpc/mm/drmem.c
+++ b/arch/powerpc/mm/drmem.c
@@ -14,8 +14,6 @@
 #include <asm/prom.h>
 #include <asm/drmem.h>
 
-static int n_root_addr_cells, n_root_size_cells;
-
 static struct drmem_lmb_info __drmem_info;
 struct drmem_lmb_info *drmem_info = &__drmem_info;
 
@@ -196,8 +194,8 @@ static void read_drconf_v1_cell(struct drmem_lmb *lmb,
 {
 	const __be32 *p = *prop;
 
-	lmb->base_addr = of_read_number(p, n_root_addr_cells);
-	p += n_root_addr_cells;
+	lmb->base_addr = of_read_number(p, mem_addr_cells);
+	p += mem_addr_cells;
 	lmb->drc_index = of_read_number(p++, 1);
 
 	p++; /* skip reserved field */
@@ -233,8 +231,8 @@ static void read_drconf_v2_cell(struct of_drconf_cell_v2 *dr_cell,
 	const __be32 *p = *prop;
 
 	dr_cell->seq_lmbs = of_read_number(p++, 1);
-	dr_cell->base_addr = of_read_number(p, n_root_addr_cells);
-	p += n_root_addr_cells;
+	dr_cell->base_addr = of_read_number(p, mem_addr_cells);
+	p += mem_addr_cells;
 	dr_cell->drc_index = of_read_number(p++, 1);
 	dr_cell->aa_index = of_read_number(p++, 1);
 	dr_cell->flags = of_read_number(p++, 1);
@@ -285,10 +283,6 @@ int __init walk_drmem_lmbs_early(unsigned long node, void *data,
 	if (!prop || len < dt_root_size_cells * sizeof(__be32))
 		return ret;
 
-	/* Get the address & size cells */
-	n_root_addr_cells = dt_root_addr_cells;
-	n_root_size_cells = dt_root_size_cells;
-
 	drmem_info->lmb_size = dt_mem_next_cell(dt_root_size_cells, &prop);
 
 	usm = of_get_flat_dt_prop(node, "linux,drconf-usable-memory", &len);
@@ -318,12 +312,12 @@ static int init_drmem_lmb_size(struct device_node *dn)
 		return 0;
 
 	prop = of_get_property(dn, "ibm,lmb-size", &len);
-	if (!prop || len < n_root_size_cells * sizeof(__be32)) {
+	if (!prop || len < mem_size_cells * sizeof(__be32)) {
 		pr_info("Could not determine LMB size\n");
 		return -1;
 	}
 
-	drmem_info->lmb_size = of_read_number(prop, n_root_size_cells);
+	drmem_info->lmb_size = of_read_number(prop, mem_size_cells);
 	return 0;
 }
 
@@ -353,12 +347,6 @@ int walk_drmem_lmbs(struct device_node *dn, void *data,
 	if (!of_root)
 		return ret;
 
-	/* Get the address & size cells */
-	of_node_get(of_root);
-	n_root_addr_cells = of_n_addr_cells(of_root);
-	n_root_size_cells = of_n_size_cells(of_root);
-	of_node_put(of_root);
-
 	if (init_drmem_lmb_size(dn))
 		return ret;
 
-- 
2.26.2

