Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB4152F17D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 19:22:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4YSt2GNcz3blN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 03:22:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jafhxl7v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jafhxl7v; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4YRX5JtJz3bgC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 03:21:28 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KEm5R8005203;
 Fri, 20 May 2022 17:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8pXOPnm5EtZozYCtnUSYm9dERXpW8IZXENIKEKeZyts=;
 b=jafhxl7vchB7QDtDQPwD1Xljldv3aqRu9YmFWaBbXPkUmKKgSyvWv0L5BjOYZxFpduV5
 H0GDpQyFo0SyCYAnqKd6gQfo9HS5k6QdAk+AgiIQtaISoPere+/EKenVPG7ClWbIobSA
 +J3FVQCIJamP3jWKQ2S5Ol/aMkb71fF33P/PymcTcNRhK1ObGoWlGD0CeKd/swPZDd5T
 oxRps8wQrnTDjRw6NTVd8d6KqF2hLhMs/yLiOhgMvEz9c+0IxIPCWi98PR6v+dpxXfxX
 FUv3SNvGMQhTziQ1vYn6lyAJ11wME6ADRXYKXVasm/BlPyCv3tqd2BxnvwU2Q03tb43Q 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g6awne9f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 17:21:21 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24KH0gqs031764;
 Fri, 20 May 2022 17:21:21 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g6awne9f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 17:21:21 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24KHCYZJ025323;
 Fri, 20 May 2022 17:21:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3g3r2fn1mn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 17:21:20 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24KHLH8o31392100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 17:21:17 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B9B5C605F;
 Fri, 20 May 2022 17:21:17 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40FFBC6057;
 Fri, 20 May 2022 17:21:17 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 17:21:17 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linux-watchdog@vger.kernel.org
Subject: [PATCH v1 2/4] powerpc/pseries: add FW_FEATURE_WATCHDOG flag
Date: Fri, 20 May 2022 12:20:53 -0500
Message-Id: <20220520172055.32220-2-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220520172055.32220-1-cheloha@linux.ibm.com>
References: <20220520172055.32220-1-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jv7SCo-WJJ9D3kJO2mGLfpRHMbraFuXa
X-Proofpoint-ORIG-GUID: SKtcz54fFoc_0eIoqNdWcu5C_xkmpF-o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_05,2022-05-20_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205200111
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, aik@ozlabs.ru,
 Scott Cheloha <cheloha@linux.ibm.com>, vaishnavi@linux.ibm.com,
 npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PAPR v2.12 specifies a new optional function set, "hcall-watchdog",
for the /rtas/ibm,hypertas-functions property.  The presence of this
function set indicates support for the H_WATCHDOG hypercall.

Check for this function set and, if present, set the new
FW_FEATURE_WATCHDOG flag.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
---
 arch/powerpc/include/asm/firmware.h       | 3 ++-
 arch/powerpc/platforms/pseries/firmware.c | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index 8dddd34b8ecf..398e0b5e485f 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -55,6 +55,7 @@
 #define FW_FEATURE_RPT_INVALIDATE ASM_CONST(0x0000010000000000)
 #define FW_FEATURE_FORM2_AFFINITY ASM_CONST(0x0000020000000000)
 #define FW_FEATURE_ENERGY_SCALE_INFO ASM_CONST(0x0000040000000000)
+#define FW_FEATURE_WATCHDOG	ASM_CONST(0x0000080000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -76,7 +77,7 @@ enum {
 		FW_FEATURE_DRC_INFO | FW_FEATURE_BLOCK_REMOVE |
 		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR |
 		FW_FEATURE_RPT_INVALIDATE | FW_FEATURE_FORM2_AFFINITY |
-		FW_FEATURE_ENERGY_SCALE_INFO,
+		FW_FEATURE_ENERGY_SCALE_INFO | FW_FEATURE_WATCHDOG,
 	FW_FEATURE_PSERIES_ALWAYS = 0,
 	FW_FEATURE_POWERNV_POSSIBLE = FW_FEATURE_OPAL | FW_FEATURE_ULTRAVISOR,
 	FW_FEATURE_POWERNV_ALWAYS = 0,
diff --git a/arch/powerpc/platforms/pseries/firmware.c b/arch/powerpc/platforms/pseries/firmware.c
index 09c119b2f623..080108d129ed 100644
--- a/arch/powerpc/platforms/pseries/firmware.c
+++ b/arch/powerpc/platforms/pseries/firmware.c
@@ -67,6 +67,7 @@ hypertas_fw_features_table[] = {
 	{FW_FEATURE_PAPR_SCM,		"hcall-scm"},
 	{FW_FEATURE_RPT_INVALIDATE,	"hcall-rpt-invalidate"},
 	{FW_FEATURE_ENERGY_SCALE_INFO,	"hcall-energy-scale-info"},
+	{FW_FEATURE_WATCHDOG,		"hcall-watchdog"},
 };
 
 /* Build up the firmware features bitmask using the contents of
-- 
2.27.0

