Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB51861E60A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Nov 2022 22:01:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N56HB5c2Nz3dvY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 08:01:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SlZ4/xBO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SlZ4/xBO;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N56DB56nrz2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 07:59:06 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A6J7Ad4024188;
	Sun, 6 Nov 2022 20:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=o0fBXagf2KSTQIDehzJHSipkYKGYkRT9z0LLdzwog3Q=;
 b=SlZ4/xBOKCMMBWjRgJbFBpGv3MQk1pNyjlFlCKrBApEBiKdk5Cs4EeIcm0qwtu6apMR5
 aacP3BrAfGiKrnVVU5SSnNtoeNB1G3Nyc5FtKxlfw6IS5rmigSGA1bo0gKi8O7RVou2W
 unn8oVadEOst+WvG3FAsfaDMgMvhMFFOxGCcTCyxsGV+gSN/gh3BW2HuNxW8BU8/sD8V
 IecRfH+8Oc5mf2uS2680m5H5pT0q7dhD+q2/5USx7Wc2sg2SES3sMXeHov+i0wuB9GTn
 eegTrVaJ6n/fBBgFlJeOBGseeZ24IT0sbet+VF6/Gutx0phNxC2thQx6ETbzpBApj/X0 oA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1f64w5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 20:58:58 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A6KwwcX002492;
	Sun, 6 Nov 2022 20:58:58 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp1f64w54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 20:58:58 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A6KoM1H006061;
	Sun, 6 Nov 2022 20:58:56 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3kngnc9put-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 20:58:56 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A6KrDfc49348912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 6 Nov 2022 20:53:13 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97B9A42041;
	Sun,  6 Nov 2022 20:58:52 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 708364203F;
	Sun,  6 Nov 2022 20:58:50 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com.com (unknown [9.211.78.124])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sun,  6 Nov 2022 20:58:50 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] powerpc/pseries: Fix the H_CALL error code in PLPKS driver
Date: Sun,  6 Nov 2022 15:58:35 -0500
Message-Id: <20221106205839.600442-3-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221106205839.600442-1-nayna@linux.ibm.com>
References: <20221106205839.600442-1-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZkAKIMQ0IZXX7RPVFq8gCTSdCJ8Pf-YI
X-Proofpoint-GUID: wYMhkzFYaMjJwfWxvKzYy6h7fpPN5wVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-06_14,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211060184
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, gjoyce@linux.vnet.ibm.com, Nayna Jain <nayna@linux.ibm.com>, npiggin@gmail.com, George Wilson <gcwilson@linux.ibm.com>, bjking1@us.ibmcom
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PAPR Spec defines H_P1 actually as H_PARAMETER and maps H_ABORTED to
a different numerical value.

Fix the error codes as per PAPR Specification.

Fixes: 2454a7af0f2a ("powerpc/pseries: define driver for Platform KeyStore")
Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h      | 3 +--
 arch/powerpc/platforms/pseries/plpks.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 8abae463f6c1..95fd7f9485d5 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -79,7 +79,7 @@
 #define H_NOT_ENOUGH_RESOURCES -44
 #define H_R_STATE       -45
 #define H_RESCINDED     -46
-#define H_P1		-54
+#define H_ABORTED	-54
 #define H_P2		-55
 #define H_P3		-56
 #define H_P4		-57
@@ -100,7 +100,6 @@
 #define H_COP_HW	-74
 #define H_STATE		-75
 #define H_IN_USE	-77
-#define H_ABORTED	-78
 #define H_UNSUPPORTED_FLAG_START	-256
 #define H_UNSUPPORTED_FLAG_END		-511
 #define H_MULTI_THREADS_ACTIVE	-9005
diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index f4b5b5a64db3..32ce4d780d8f 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -75,7 +75,7 @@ static int pseries_status_to_err(int rc)
 	case H_FUNCTION:
 		err = -ENXIO;
 		break;
-	case H_P1:
+	case H_PARAMETER:
 	case H_P2:
 	case H_P3:
 	case H_P4:
-- 
2.31.1

