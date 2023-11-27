Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC917F9C18
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 09:49:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hF5W+B5w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SdzmV3W6nz3cbN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 19:49:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hF5W+B5w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sdzkq4gV8z3cRc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 19:48:19 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AR8VDOM006414;
	Mon, 27 Nov 2023 08:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PfZxBf6wR2R4ADxozYp7GNjCmy9ZjASv4l7LlxFZ15E=;
 b=hF5W+B5wwlCmSy30nPx26jIZyFJ+CJlMVW5Axoz2f9LVfE/hrfCzmAyHhZ5Zv+CcxaFe
 5mj1YtzAsH/VaWbvsBNTrNkI8uYyW46CFjwRhg09oUdzJ5HBoU5FcLSBARRF+ZgE3uZr
 u2KaRB9LxrZ07Cr/4fp9Fx8bAB1c2EmvvKn+Irhu+CcYPbERahqSHmQ3me4sXJkhyUzj
 2HUZ+nXQrD1x9Ns22wp4wofHBYoh6ocr/nsXgFkXbiJ41XM2jolg1k1zjujyIunJVmGK
 LW8R6ttKCCN4qAaPAeVblMaGTmmMyuIylPgoIgbjkPY4NDyYegnPw/HgwH3g3ZIw5DIa XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ukrje69sx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 08:48:12 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AR8V9Ks005889;
	Mon, 27 Nov 2023 08:48:11 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ukrje69sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 08:48:11 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AR8JKw9010948;
	Mon, 27 Nov 2023 08:48:10 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ukwy1ewav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 08:48:10 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AR8m72N18088490
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Nov 2023 08:48:07 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CAB458067;
	Mon, 27 Nov 2023 08:48:07 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4E0B58068;
	Mon, 27 Nov 2023 08:48:05 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.67.85.162])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Nov 2023 08:48:05 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/pseries/vas: Call rtas_busy_sleep() to support HCALL delay
Date: Mon, 27 Nov 2023 00:47:53 -0800
Message-Id: <20231127084753.3827119-2-haren@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231127084753.3827119-1-haren@linux.ibm.com>
References: <20231127084753.3827119-1-haren@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J79H1_C6t6pT_yRFNC6eKXujayb17n9z
X-Proofpoint-ORIG-GUID: QvP6McD7xkCfibYflL7T_aBvEtEZJjpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_07,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=934 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311270061
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
Cc: nathanl@linux.ibm.com, Haren Myneni <haren@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

VAS allocate, modify and deallocate HCALLs returns
H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC for busy
delay and expects OS to reissue HCALL after that delay. But using
msleep() will often sleep at least 20 msecs even though the
hypervisor expects to reissue these HCALLs after 1 or 10msecs.
It might cause these HCALLs takes longer when multiple threads
issue open or close VAS windows simultaneously.

So instead of using msleep(), call rtas_busy_sleep() which uses
usleep_range() if the delay is <= 20msecs.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Suggested-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 71d52a670d95..c0ffdfc51f96 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -18,6 +18,7 @@
 #include <asm/plpar_wrappers.h>
 #include <asm/firmware.h>
 #include <asm/vphn.h>
+#include <asm/rtas.h>
 #include <asm/vas.h>
 #include "vas.h"
 
@@ -38,7 +39,13 @@ static long hcall_return_busy_check(long rc)
 {
 	/* Check if we are stalled for some time */
 	if (H_IS_LONG_BUSY(rc)) {
-		msleep(get_longbusy_msecs(rc));
+		/*
+		 * Allocate, Modify and Deallocate HCALLs can return
+		 * H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC
+		 * and expects OS to reissue HCALL after 1msec or
+		 * 10msecs.
+		 */
+		rtas_busy_sleep(rc);
 		rc = H_BUSY;
 	} else if (rc == H_BUSY) {
 		cond_resched();
-- 
2.26.3

