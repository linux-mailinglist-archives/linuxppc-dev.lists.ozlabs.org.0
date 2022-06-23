Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F43E557BF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 14:55:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTKx93YQYz3cdj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 22:55:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T2yanPzh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T2yanPzh;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTKwQ0T1Vz3bpw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 22:55:01 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NCj3gw027663;
	Thu, 23 Jun 2022 12:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=yumdV+Hou3q2yrQdBnClCO7pY1Bcf5gIzRCXdcJhBhA=;
 b=T2yanPzhfBDr6GYlkjq528svQGFfq28G4Wurz1ZINK9f9zkwSHEZntq9zAGa+9zR/eed
 33xT0N2qp2Br9KAQtCVFnXeuc7TAIVYCtqgmmh+EL+nzfeoFWcz4OlyxJoUN06c5lY9Z
 gqlbOpvSqaPsdgmLRnBkEmXODBx/mMYu269ALLB6ud8VBIKXCNJTG9jPRnmAJUK/fTAC
 jZdimRewzIe+AUyW9uCPn849QQwA4U78YPYPDkMuPsrRKQd+JAnk1c32s8W9bUzhhVaK
 e9G3Zx+WMUtMjcV49W51HLfk+lA8eGdd9qmyvymdvdLrN9jVgpTs83RjjAoFLi3fsQo5 vA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gvpu83ccb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jun 2022 12:54:54 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25NCpj07021693;
	Thu, 23 Jun 2022 12:54:54 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
	by ppma03dal.us.ibm.com with ESMTP id 3gs6ba522a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jun 2022 12:54:54 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
	by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25NCsrwF7274998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jun 2022 12:54:53 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BF6D6A054;
	Thu, 23 Jun 2022 12:54:53 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 112886A047;
	Thu, 23 Jun 2022 12:54:51 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.18.68])
	by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jun 2022 12:54:50 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 1/2] powerpc/numa: Return the first online node instead of 0
Date: Thu, 23 Jun 2022 18:24:41 +0530
Message-Id: <20220623125442.645240-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xIP8AaqiLz3KBdzpr1uCG07nROTk_vxP
X-Proofpoint-ORIG-GUID: xIP8AaqiLz3KBdzpr1uCG07nROTk_vxP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-23_05,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=952
 phishscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206230050
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If early cpu to node mapping finds an invalid node id, return
the first online node instead of node 0.

With commit e75130f20b1f ("powerpc/numa: Offline memoryless cpuless node 0")
the kernel marks node 0 offline in certain scenarios.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/topology.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 8a4d4f4d9749..704088b1d53c 100644
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

