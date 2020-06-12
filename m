Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C3D1F739B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 07:49:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jqYY3HNlzDr2P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 15:49:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jpmT2bNTzDqhD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 15:14:01 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05C53Dxk051763; Fri, 12 Jun 2020 01:13:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31kx98f02w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:13:56 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05C55I5f058137;
 Fri, 12 Jun 2020 01:13:55 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31kx98f02n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:13:55 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05C59KRA022133;
 Fri, 12 Jun 2020 05:13:55 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 31hyh06ahq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 05:13:55 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05C5Csn649742086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jun 2020 05:12:54 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F1E1B205F;
 Fri, 12 Jun 2020 05:12:54 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 116D5B2065;
 Fri, 12 Jun 2020 05:12:54 +0000 (GMT)
Received: from localhost (unknown [9.65.252.60])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 12 Jun 2020 05:12:53 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 16/18] powerpc/pseries: remove memory "re-add" implementation
Date: Fri, 12 Jun 2020 00:12:36 -0500
Message-Id: <20200612051238.1007764-17-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200612051238.1007764-1-nathanl@linux.ibm.com>
References: <20200612051238.1007764-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_23:2020-06-11,
 2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 impostorscore=0 suspectscore=1 priorityscore=1501
 mlxlogscore=999 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006110174
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
Cc: tyreld@linux.ibm.com, srikar@linux.vnet.ibm.com, ego@linux.vnet.ibm.com,
 npiggin@gmail.com, svaidy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dlpar_memory() no longer has any callers which pass
PSERIES_HP_ELOG_ACTION_READD. Remove this case and the corresponding
unreachable code.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h               |  1 -
 .../platforms/pseries/hotplug-memory.c        | 42 -------------------
 2 files changed, 43 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 0107d724e9da..55f9a154c95d 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -215,7 +215,6 @@ inline uint16_t pseries_errorlog_length(struct pseries_errorlog *sect)
 
 #define PSERIES_HP_ELOG_ACTION_ADD	1
 #define PSERIES_HP_ELOG_ACTION_REMOVE	2
-#define PSERIES_HP_ELOG_ACTION_READD	3
 
 #define PSERIES_HP_ELOG_ID_DRC_NAME	1
 #define PSERIES_HP_ELOG_ID_DRC_INDEX	2
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 5ace2f9a277e..67ece3ac9ac2 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -487,40 +487,6 @@ static int dlpar_memory_remove_by_index(u32 drc_index)
 	return rc;
 }
 
-static int dlpar_memory_readd_by_index(u32 drc_index)
-{
-	struct drmem_lmb *lmb;
-	int lmb_found;
-	int rc;
-
-	pr_info("Attempting to update LMB, drc index %x\n", drc_index);
-
-	lmb_found = 0;
-	for_each_drmem_lmb(lmb) {
-		if (lmb->drc_index == drc_index) {
-			lmb_found = 1;
-			rc = dlpar_remove_lmb(lmb);
-			if (!rc) {
-				rc = dlpar_add_lmb(lmb);
-				if (rc)
-					dlpar_release_drc(lmb->drc_index);
-			}
-			break;
-		}
-	}
-
-	if (!lmb_found)
-		rc = -EINVAL;
-
-	if (rc)
-		pr_info("Failed to update memory at %llx\n",
-			lmb->base_addr);
-	else
-		pr_info("Memory at %llx was updated\n", lmb->base_addr);
-
-	return rc;
-}
-
 static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 {
 	struct drmem_lmb *lmb, *start_lmb, *end_lmb;
@@ -617,10 +583,6 @@ static int dlpar_memory_remove_by_index(u32 drc_index)
 {
 	return -EOPNOTSUPP;
 }
-static int dlpar_memory_readd_by_index(u32 drc_index)
-{
-	return -EOPNOTSUPP;
-}
 
 static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 {
@@ -902,10 +864,6 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_elog)
 			break;
 		}
 
-		break;
-	case PSERIES_HP_ELOG_ACTION_READD:
-		drc_index = hp_elog->_drc_u.drc_index;
-		rc = dlpar_memory_readd_by_index(drc_index);
 		break;
 	default:
 		pr_err("Invalid action (%d) specified\n", hp_elog->action);
-- 
2.25.4

