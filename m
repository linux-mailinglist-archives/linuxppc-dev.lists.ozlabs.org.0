Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C9753BDA5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 19:56:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDYbW2Fg1z3bmC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 03:56:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dy6FQ9I7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dy6FQ9I7;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDYYn259mz3bqR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 03:54:36 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 252HSB3c018203;
	Thu, 2 Jun 2022 17:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8pXOPnm5EtZozYCtnUSYm9dERXpW8IZXENIKEKeZyts=;
 b=dy6FQ9I7az7Grcjn6lyKJ4Nl9ftvcJqviKLe6xVdEJlRdnVHW3vgYG7kfB/obxi+gafU
 drGJtQf/DFue9FByOkiYSYTzCDQp6YDv3oAKndbJJjeEl0ZSztr77da3bHidQhAecxRy
 W9cpkyRPMkwy38dHPtQOdC7Ila+ZMnuyVPfdc644ggpmqpFab41lDTZlgcyON2YwpXo2
 wHCfQqZw2gREBrrAHw372QUhnebgfB08HZhmvpWTGhijJHZnuYASHYrJu0Ksny9SGAby
 ZoaUmWRF05ywlxVYJ8s3OytlPcr/eHZwI1wFIMRHo6nJRj56+08Jn57CQ3wjvqOcpo/X ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gewxgd6b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jun 2022 17:54:28 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 252HbhJx009312;
	Thu, 2 Jun 2022 17:54:27 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gewxgd6b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jun 2022 17:54:27 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 252HoIbo031825;
	Thu, 2 Jun 2022 17:54:26 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma01wdc.us.ibm.com with ESMTP id 3gbcbjc1qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jun 2022 17:54:26 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 252HsOQb22282502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jun 2022 17:54:24 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA000B2065;
	Thu,  2 Jun 2022 17:54:24 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B21DB2064;
	Thu,  2 Jun 2022 17:54:24 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
	by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu,  2 Jun 2022 17:54:24 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linux-watchdog@vger.kernel.org
Subject: [PATCH v2 2/4] powerpc/pseries: add FW_FEATURE_WATCHDOG flag
Date: Thu,  2 Jun 2022 12:53:51 -0500
Message-Id: <20220602175353.68942-3-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220602175353.68942-1-cheloha@linux.ibm.com>
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RACwT0rNzHtjEmskcAvq6mrZ0-fCv8Us
X-Proofpoint-ORIG-GUID: HRnnyLtffzNUu0rvicmIeE79jTbdpwhL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_05,2022-06-02_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206020073
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, aik@ozlabs.ru, Scott Cheloha <cheloha@linux.ibm.com>, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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

