Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5649C37249C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 05:07:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ4WY285Nz3bms
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 13:07:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jvFJy0bQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jvFJy0bQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ4S95yFcz2yhr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 13:04:09 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14432jcb152096; Mon, 3 May 2021 23:04:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FLq1+HG6AmU/h7mVQWGbmM4H5dFnKCm9MwUAN5w9ufg=;
 b=jvFJy0bQqwwdgx6Pa+uaKp2FPW1boayRTiVGFU3lHnwErlZtTxox0jRXmZKsiBfcD87M
 C5JidlZ8/BITodFeHqxCqfPTxIVh9WMy5TnsT8rSAugMovWTV0LZzMk6e44vm6sMZRa2
 4W1uQ+qBDKoHOD+j82MkaMa5QOUKFYB9vBE5GkYzyQi896z2MA4yJltMzGa1Dx3bI6Ni
 3cx34KInz6Oeq/ZtGhig0+7AicGfP/0Cv1uROGjB0iuxa3iGRBl0oDGwi5HlJgQGNTKk
 Z3+VWWHl1LfY5opAllPwEwwgW+3qNLfnrxY1y3+4rWXZ6t8KSBz9B2Pc7w/cNGwZMTA3 Dg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38awgv8gne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 23:04:05 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1442vnvB008616;
 Tue, 4 May 2021 03:04:04 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 38a9xfpsfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 03:04:04 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 144343VA28705084
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 03:04:03 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56829AC066;
 Tue,  4 May 2021 03:04:03 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 250C6AC060;
 Tue,  4 May 2021 03:04:03 +0000 (GMT)
Received: from localhost (unknown [9.211.126.236])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 May 2021 03:04:03 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC 05/10] powerpc/pseries/fadump: convert to rtas_sched_if_busy()
Date: Mon,  3 May 2021 22:03:53 -0500
Message-Id: <20210504030358.1715034-6-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210504030358.1715034-1-nathanl@linux.ibm.com>
References: <20210504030358.1715034-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ySsR_gdHS-bwoy0tF64fFs9LcFE3I5t1
X-Proofpoint-ORIG-GUID: ySsR_gdHS-bwoy0tF64fFs9LcFE3I5t1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_01:2021-05-03,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105040023
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
Cc: aik@ozlabs.ru, ajd@linux.ibm.com, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

None of these call sites need to use mdelay(); convert them to
rtas_sched_if_busy().

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/rtas-fadump.c | 22 +++-----------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index f8f73b47b107..9a200d3bf5e0 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -129,7 +129,6 @@ static u64 rtas_fadump_get_bootmem_min(void)
 
 static int rtas_fadump_register(struct fw_dump *fadump_conf)
 {
-	unsigned int wait_time;
 	int rc, err = -EIO;
 
 	/* TODO: Add upper time limit for the delay */
@@ -137,12 +136,7 @@ static int rtas_fadump_register(struct fw_dump *fadump_conf)
 		rc =  rtas_call(fadump_conf->ibm_configure_kernel_dump, 3, 1,
 				NULL, FADUMP_REGISTER, &fdm,
 				sizeof(struct rtas_fadump_mem_struct));
-
-		wait_time = rtas_busy_delay_time(rc);
-		if (wait_time)
-			mdelay(wait_time);
-
-	} while (wait_time);
+	} while (rtas_sched_if_busy(rc));
 
 	switch (rc) {
 	case 0:
@@ -177,7 +171,6 @@ static int rtas_fadump_register(struct fw_dump *fadump_conf)
 
 static int rtas_fadump_unregister(struct fw_dump *fadump_conf)
 {
-	unsigned int wait_time;
 	int rc;
 
 	/* TODO: Add upper time limit for the delay */
@@ -185,11 +178,7 @@ static int rtas_fadump_unregister(struct fw_dump *fadump_conf)
 		rc =  rtas_call(fadump_conf->ibm_configure_kernel_dump, 3, 1,
 				NULL, FADUMP_UNREGISTER, &fdm,
 				sizeof(struct rtas_fadump_mem_struct));
-
-		wait_time = rtas_busy_delay_time(rc);
-		if (wait_time)
-			mdelay(wait_time);
-	} while (wait_time);
+	} while (rtas_sched_if_busy(rc));
 
 	if (rc) {
 		pr_err("Failed to un-register - unexpected error(%d).\n", rc);
@@ -202,7 +191,6 @@ static int rtas_fadump_unregister(struct fw_dump *fadump_conf)
 
 static int rtas_fadump_invalidate(struct fw_dump *fadump_conf)
 {
-	unsigned int wait_time;
 	int rc;
 
 	/* TODO: Add upper time limit for the delay */
@@ -210,11 +198,7 @@ static int rtas_fadump_invalidate(struct fw_dump *fadump_conf)
 		rc =  rtas_call(fadump_conf->ibm_configure_kernel_dump, 3, 1,
 				NULL, FADUMP_INVALIDATE, fdm_active,
 				sizeof(struct rtas_fadump_mem_struct));
-
-		wait_time = rtas_busy_delay_time(rc);
-		if (wait_time)
-			mdelay(wait_time);
-	} while (wait_time);
+	} while (rtas_sched_if_busy(rc));
 
 	if (rc) {
 		pr_err("Failed to invalidate - unexpected error (%d).\n", rc);
-- 
2.30.2

