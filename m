Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F2E358614
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 16:09:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGNRh25JSz3ckg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 00:09:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ai7SB1uV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ai7SB1uV; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGNNw0kyZz3bpW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 00:06:55 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 138E5iBA074982; Thu, 8 Apr 2021 10:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XyfhTtEBBByhQAB19+G5bs8pgIkIEAAbFu0BXh8yFmU=;
 b=Ai7SB1uVYNAikj3TOHw5uBGIc6nvHBW9USdkxOp3ENU35AsDOdSrCK5uVetZ/7xOle1Z
 vok26xg+z6NBRHQXWUd0ZmbHLuwqs8vGOTI9HrXlYrKemImFwFA2Y+hOQOqhib1qaC6J
 hv1zbZmgK20/leMdPdJH1qrXMh7WO+pe1Lz97c2wpaKtulKj5gKMQzLFVen2jzu7qR7n
 AwOa4FjGrX4yR8rVw1K4NoZJpmh9O8UKYaVhUPyKmMI/zHl4kh+GEKmg+YKz7ow03UsU
 wQJOctt5FT8pN5DNOg+WLsmWt0U4gCtLycwkAcAS5TU6ti97ALJOjEMiehc4moc7/qu5 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvphb77t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 10:06:49 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 138E62JR076082;
 Thu, 8 Apr 2021 10:06:41 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvphb744-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 10:06:41 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 138E1jNf025681;
 Thu, 8 Apr 2021 14:06:34 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02wdc.us.ibm.com with ESMTP id 37ryqcc9pn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 14:06:34 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 138E6Xhp26804670
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Apr 2021 14:06:33 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17F65C6065;
 Thu,  8 Apr 2021 14:06:33 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F30C4C605D;
 Thu,  8 Apr 2021 14:06:32 +0000 (GMT)
Received: from localhost (unknown [9.211.35.170])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  8 Apr 2021 14:06:32 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/5] powerpc/rtas: remove ibm_suspend_me_token
Date: Thu,  8 Apr 2021 09:06:28 -0500
Message-Id: <20210408140630.205502-4-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408140630.205502-1-nathanl@linux.ibm.com>
References: <20210408140630.205502-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hbhTjwm9zOcuzveRoLPPVGcveN7QZa7V
X-Proofpoint-GUID: ZdIpSjX3Japc-4-2do0RGV4lTzzAJtU4
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_03:2021-04-08,
 2021-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104080099
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
 aneesh.kumar@linux.ibm.com, npiggin@gmail.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's not a compelling reason to cache the value of the token for
the ibm,suspend-me function. Just look it up when needed in the RTAS
syscall's special case for it.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
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
2.30.2

