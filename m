Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B90530E7A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 12:55:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6Dkc0YwFz3cCF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 20:55:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OFaac5Xb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OFaac5Xb; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6DjM2MHWz3bl1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 May 2022 20:54:14 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24NAUGgI008464;
 Mon, 23 May 2022 10:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=mY7MbdfZnMO0jZIBsxFr0ajIRt73QFc6Zq+RlJrKlfE=;
 b=OFaac5XbZ1+5jj4jXHcniICHMFBF6DgI8K+AqrIJA5umRwf90Ip7r9MUp0qXu/2/iVpk
 fcpipKmR7w8g56v3ju204h//8Y5YwRl2TLyslBTVgYV+GS2GgKwtUEh0A98i0J4LuE9Z
 0+kqsYi5hIjJQyCLsuYRHtWYfmtINLGv+mhf9zInaXlUys+Dz6jC3Ih2KZTkDVHRSc8x
 4BgP3R5wa5YK1wiVoZhRV3o1TlDmaGlGwoNuYlXD+Lb+5SefUj+hn3zEqSvqhWDuuuLC
 2c5WNadIf+LFMWMx0yWoA5tdjSpWKGCiEY+YCSC9wAPLD15PAqY0JiToQDSjWjt+TnIR mw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g7a4qaa1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 10:54:09 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24NABwET028656;
 Mon, 23 May 2022 10:54:08 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 3g6qqab9jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 10:54:08 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24NAs67W34668950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 May 2022 10:54:07 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF53478064;
 Mon, 23 May 2022 10:54:06 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29E907805F;
 Mon, 23 May 2022 10:54:05 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.56.196])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 23 May 2022 10:54:04 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH] powerpc/numa: Return the first online node instead of 0
Date: Mon, 23 May 2022 16:23:59 +0530
Message-Id: <20220523105359.230277-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aCwjFXqK2D0qGrZxk4PrJJTaqZ9qxutp
X-Proofpoint-ORIG-GUID: aCwjFXqK2D0qGrZxk4PrJJTaqZ9qxutp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_04,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=726 adultscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205230057
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If early cpu to node mapping finds an invalid node id, return
the first online node instead of node 0. On ppc, we can find node 0
not present.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/topology.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 36fcafb1fd6d..3f07231d33b3 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -60,7 +60,7 @@ static inline int early_cpu_to_node(int cpu)
 	 * Fall back to node 0 if nid is unset (it should be, except bugs).
 	 * This allows callers to safely do NODE_DATA(early_cpu_to_node(cpu)).
 	 */
-	return (nid < 0) ? 0 : nid;
+	return (nid < 0) ? first_online_node : nid;
 }
 
 int of_drconf_to_nid_single(struct drmem_lmb *lmb);
-- 
2.36.1

