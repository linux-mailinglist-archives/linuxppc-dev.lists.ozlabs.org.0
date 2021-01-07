Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E8D2EC87C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jan 2021 04:01:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DB9xc4kH3zDqkC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jan 2021 14:01:56 +1100 (AEDT)
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
 header.s=pp1 header.b=GSxwk4le; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DB9tP2L04zDqRt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jan 2021 13:59:05 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1072pqKc186762
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 6 Jan 2021 21:59:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=2u/e3mM0ZGDgpMNOuNC03YTdtyAyilsG0fXlQaYKvl0=;
 b=GSxwk4lehlvCVkqhr15uGBXbCoRteCNVVIjx7iidyhYNw1vFqWgtNdeD9xMBBB3lw/Ak
 G1aazD+P4riD/5o+iH02Cr6kQAqHGleFXRm4ZMKkKC3nk+whPZFgXpn3Iri2jGSfurXx
 h7IO7fnZXAUs3lKO+ykawqjR0CSw8pKo+GZmJOUHbYIqeG+RlJqG2EmOSuzRBtPLosEN
 yUXN8j4TObRGg81zKO9dYcPMyybLF9pEyF0zUXvl1u0O8NQuOSK70i9Zzi/7rBcxZPao
 hGNOZbirmAMQh94D4AbPaKIYC/eHTdwoMmW/JLdsSeu4IpRvzhtlqj3vUDtIlFRb6h1/ jA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35wsvur3b4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Jan 2021 21:59:02 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1072vigw003396
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 7 Jan 2021 02:59:02 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 35tgf9sxk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Jan 2021 02:59:02 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1072x1bW25624968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Jan 2021 02:59:01 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19873B205F;
 Thu,  7 Jan 2021 02:59:01 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB058B2064;
 Thu,  7 Jan 2021 02:59:00 +0000 (GMT)
Received: from localhost (unknown [9.211.155.168])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  7 Jan 2021 02:59:00 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries/dlpar: handle ibm,
 configure-connector delay status
Date: Wed,  6 Jan 2021 20:59:00 -0600
Message-Id: <20210107025900.410369-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-06_12:2021-01-06,
 2021-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101070009
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dlpar_configure_connector() has two problems in its handling of
ibm,configure-connector's return status:

1. When the status is -2 (busy, call again), we call
   ibm,configure-connector again immediately without checking whether
   to schedule, which can result in monopolizing the CPU.
2. Extended delay status (9900..9905) goes completely unhandled,
   causing the configuration to unnecessarily terminate.

Fix both of these issues by using rtas_busy_delay().

Fixes: ab519a011caa ("powerpc/pseries: Kernel DLPAR Infrastructure")
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/dlpar.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 16e86ba8aa20..f6b7749d6ada 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -127,7 +127,6 @@ void dlpar_free_cc_nodes(struct device_node *dn)
 #define NEXT_PROPERTY   3
 #define PREV_PARENT     4
 #define MORE_MEMORY     5
-#define CALL_AGAIN	-2
 #define ERR_CFG_USE     -9003
 
 struct device_node *dlpar_configure_connector(__be32 drc_index,
@@ -168,6 +167,9 @@ struct device_node *dlpar_configure_connector(__be32 drc_index,
 
 		spin_unlock(&rtas_data_buf_lock);
 
+		if (rtas_busy_delay(rc))
+			continue;
+
 		switch (rc) {
 		case COMPLETE:
 			break;
@@ -216,9 +218,6 @@ struct device_node *dlpar_configure_connector(__be32 drc_index,
 			last_dn = last_dn->parent;
 			break;
 
-		case CALL_AGAIN:
-			break;
-
 		case MORE_MEMORY:
 		case ERR_CFG_USE:
 		default:
-- 
2.29.2

