Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D2F37248F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 04:54:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ4DS2MLqz30H3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 12:54:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d/+O35Uo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=d/+O35Uo; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ4Cz1WLCz2xZF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 12:53:33 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1442YOcN120187
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 3 May 2021 22:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=pcQV6mMTsCdryEf9L/+3snt/rcHwXlzvs9jbVQA65Fw=;
 b=d/+O35UoQ/KSGFQ3++jpNDZic0qhT7wu9lr5crfdAkkzKq2CMkrURqb0+4GK1N982Lk0
 MVYBUrNuHgGIKZ30prSOT+ZdxGXxIPztNyafMI14ItOrZHgJ/yLGdy9235lU5YEP7N5f
 Ti7w5zLDGbf0CjzhvyiSLPlYY7SSYB6F6ezEj+bU0f3oSvJqUgyrPTViEp023xmLwDbs
 ftyVf2ZdC9+JqzvSlLo3InAqgpaHVyIlOYdq5bBdTTKtA14usxdsIqtdttPSPKxFUUFJ
 LBnKPahH9r+rcKE3vCEKeLWwQwytUkJu0gdC/E7uGwmmE0yJZiXLAMSSQfpgac4J5V5z Fg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38awcg0fs9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 22:53:31 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1442l72k001409
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 4 May 2021 02:53:31 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 388xm92g2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 02:53:31 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1442rTY341746842
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 02:53:30 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D67866E050;
 Tue,  4 May 2021 02:53:29 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC88D6E053;
 Tue,  4 May 2021 02:53:29 +0000 (GMT)
Received: from localhost (unknown [9.211.126.236])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  4 May 2021 02:53:29 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries/dlpar: use rtas_get_sensor()
Date: Mon,  3 May 2021 21:53:29 -0500
Message-Id: <20210504025329.1713878-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: P2DKhTiycfPRfP3TdESgvkJ-W41kI7J7
X-Proofpoint-ORIG-GUID: P2DKhTiycfPRfP3TdESgvkJ-W41kI7J7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_01:2021-05-03,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=948 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2105040018
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
Cc: tyreld@linux.ibm.com, ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of making bare calls to get-sensor-state, use
rtas_get_sensor(), which correctly handles busy and extended delay
statuses.

Fixes: ab519a011caa ("powerpc/pseries: Kernel DLPAR Infrastructure")
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/dlpar.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 3ac70790ec7a..b1f01ac0c29e 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -289,8 +289,7 @@ int dlpar_acquire_drc(u32 drc_index)
 {
 	int dr_status, rc;
 
-	rc = rtas_call(rtas_token("get-sensor-state"), 2, 2, &dr_status,
-		       DR_ENTITY_SENSE, drc_index);
+	rc = rtas_get_sensor(DR_ENTITY_SENSE, drc_index, &dr_status);
 	if (rc || dr_status != DR_ENTITY_UNUSABLE)
 		return -1;
 
@@ -311,8 +310,7 @@ int dlpar_release_drc(u32 drc_index)
 {
 	int dr_status, rc;
 
-	rc = rtas_call(rtas_token("get-sensor-state"), 2, 2, &dr_status,
-		       DR_ENTITY_SENSE, drc_index);
+	rc = rtas_get_sensor(DR_ENTITY_SENSE, drc_index, &dr_status);
 	if (rc || dr_status != DR_ENTITY_PRESENT)
 		return -1;
 
@@ -333,8 +331,7 @@ int dlpar_unisolate_drc(u32 drc_index)
 {
 	int dr_status, rc;
 
-	rc = rtas_call(rtas_token("get-sensor-state"), 2, 2, &dr_status,
-				DR_ENTITY_SENSE, drc_index);
+	rc = rtas_get_sensor(DR_ENTITY_SENSE, drc_index, &dr_status);
 	if (rc || dr_status != DR_ENTITY_PRESENT)
 		return -1;
 
-- 
2.30.2

