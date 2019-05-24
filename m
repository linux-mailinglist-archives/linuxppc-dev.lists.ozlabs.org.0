Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7897329049
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 07:11:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459Dx76qwXzDqch
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 15:11:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459Dvl3ZsnzDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 15:10:10 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4O575jW011940
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 01:10:06 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sp79hpj2p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 01:10:05 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Fri, 24 May 2019 06:10:05 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 24 May 2019 06:10:03 +0100
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4O5A1xQ22282570
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 05:10:02 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D7A3136071
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 05:10:01 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55D9D136069
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 05:10:01 +0000 (GMT)
Received: from birb.localdomain (unknown [9.185.142.81])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 05:10:01 +0000 (GMT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id A28364EC63D; Fri, 24 May 2019 15:09:57 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv: Update firmware archaeology around
 OPAL_HANDLE_HMI
Date: Fri, 24 May 2019 15:09:56 +1000
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19052405-0036-0000-0000-00000AC22640
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011152; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01207761; UDB=6.00634315; IPR=6.00988749; 
 MB=3.00027027; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-24 05:10:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052405-0037-0000-0000-00004BEC1503
Message-Id: <20190524050956.14114-1-stewart@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-24_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=800 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905240034
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
Cc: Stewart Smith <stewart@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The first machines to ship with OPAL firmware all got firmware updates
that have the new call, but just in case someone is foolish enough to
believe the first 4 months of firmware is the best, we keep this code
around.

Comment is updated to not refer to late 2014 as recent or the future.

Signed-off-by: Stewart Smith <stewart@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/opal.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index f2b063b027f0..89b6ddc3ed38 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -206,16 +206,18 @@ static int __init opal_register_exception_handlers(void)
 	glue = 0x7000;
 
 	/*
-	 * Check if we are running on newer firmware that exports
-	 * OPAL_HANDLE_HMI token. If yes, then don't ask OPAL to patch
-	 * the HMI interrupt and we catch it directly in Linux.
+	 * Only ancient OPAL firmware requires this.
+	 * Specifically, firmware from FW810.00 (released June 2014)
+	 * through FW810.20 (Released October 2014).
 	 *
-	 * For older firmware (i.e currently released POWER8 System Firmware
-	 * as of today <= SV810_087), we fallback to old behavior and let OPAL
-	 * patch the HMI vector and handle it inside OPAL firmware.
+	 * Check if we are running on newer (post Oct 2014) firmware that
+	 * exports the OPAL_HANDLE_HMI token. If yes, then don't ask OPAL to
+	 * patch the HMI interrupt and we catch it directly in Linux.
 	 *
-	 * For newer firmware (in development/yet to be released) we will
-	 * start catching/handling HMI directly in Linux.
+	 * For older firmware (i.e < FW810.20), we fallback to old behavior and
+	 * let OPAL patch the HMI vector and handle it inside OPAL firmware.
+	 *
+	 * For newer firmware we catch/handle the HMI directly in Linux.
 	 */
 	if (!opal_check_token(OPAL_HANDLE_HMI)) {
 		pr_info("Old firmware detected, OPAL handles HMIs.\n");
@@ -225,6 +227,11 @@ static int __init opal_register_exception_handlers(void)
 		glue += 128;
 	}
 
+	/*
+	 * Only applicable to ancient firmware, all modern
+	 * (post March 2015/skiboot 5.0) firmware will just return
+	 * OPAL_UNSUPPORTED.
+	 */
 	opal_register_exception_handler(OPAL_SOFTPATCH_HANDLER, 0, glue);
 #endif
 
-- 
2.21.0

