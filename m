Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0D32F6DA6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 23:05:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGyzw6mc1zDsVd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 09:05:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=smXvD7XG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGysn5lzZzDsPv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 09:00:13 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10ELXPKO125020; Thu, 14 Jan 2021 17:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=J3779XVJaHyEJ5+QieYohJuqgUv/8VK9pKPjwFAdhBU=;
 b=smXvD7XGHutLzLDS1468VUcKT/hjbgtWaMMWCFThyVq+9gCJ9ZBzJUh9Xc6uAGO4REUM
 ZRPfBSqY5tIJJyUNgck/f3WuPPvyrPlh3+tBNbm0R4PmRLzvWt7nxTF+0KqciJEwfhe8
 eV/wXiY07x5UumlUyxj+Y/4ve/UpW258+xwD5/MDLnXKMp2mpQbm/wAjqk+bIMY1jkDX
 nKPkJTminZklL0NWp+b4rRlaHxlusqxoPhKQyFH3g6A5Cd+Aztd/5XQskwufIh0uEVbl
 /raj2vWepWMiryqj9dOJ2k8A04ZHGqgJuVISPremy+PkKcRrkbosmRLxG/CsomsOm+kz Bg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 362wygghtk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 17:00:08 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10ELwQma011171;
 Thu, 14 Jan 2021 22:00:08 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 35y449t7xn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 22:00:08 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10EM06Hn19792156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 22:00:06 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54A8178087;
 Thu, 14 Jan 2021 22:00:06 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E3C878066;
 Thu, 14 Jan 2021 22:00:06 +0000 (GMT)
Received: from localhost (unknown [9.163.36.68])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jan 2021 22:00:06 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/6] powerpc/rtas: remove ibm_suspend_me_token
Date: Thu, 14 Jan 2021 16:00:01 -0600
Message-Id: <20210114220004.1138993-4-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114220004.1138993-1-nathanl@linux.ibm.com>
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_08:2021-01-14,
 2021-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101140124
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, aik@ozlabs.ru,
 aneesh.kumar@linux.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's not a compelling reason to cache the value of the token for
the ibm,suspend-me function. Just look it up when needed in the RTAS
syscall's special case for it.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index d126d71ea5bd..60fcf7f7b0b8 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -828,7 +828,6 @@ void rtas_activate_firmware(void)
 		pr_err("ibm,activate-firmware failed (%i)\n", fwrc);
 }
 
-static int ibm_suspend_me_token = RTAS_UNKNOWN_SERVICE;
 #ifdef CONFIG_PPC_PSERIES
 /**
  * rtas_call_reentrant() - Used for reentrant rtas calls
@@ -1103,7 +1102,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 		return -EINVAL;
 
 	/* Need to handle ibm,suspend_me call specially */
-	if (token == ibm_suspend_me_token) {
+	if (token == rtas_token("ibm,suspend-me")) {
 
 		/*
 		 * rtas_ibm_suspend_me assumes the streamid handle is in cpu
@@ -1191,10 +1190,8 @@ void __init rtas_initialize(void)
 	 * the stop-self token if any
 	 */
 #ifdef CONFIG_PPC64
-	if (firmware_has_feature(FW_FEATURE_LPAR)) {
+	if (firmware_has_feature(FW_FEATURE_LPAR))
 		rtas_region = min(ppc64_rma_size, RTAS_INSTANTIATE_MAX);
-		ibm_suspend_me_token = rtas_token("ibm,suspend-me");
-	}
 #endif
 	rtas_rmo_buf = memblock_phys_alloc_range(RTAS_RMOBUF_MAX, PAGE_SIZE,
 						 0, rtas_region);
-- 
2.29.2

