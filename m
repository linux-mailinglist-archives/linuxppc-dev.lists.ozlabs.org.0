Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 176E2802053
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Dec 2023 03:02:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f8M2uvbu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SjVRb45Shz3clf
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Dec 2023 13:02:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f8M2uvbu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SjVQk0fKJz3c48
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Dec 2023 13:01:33 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B31CA5X026117;
	Sun, 3 Dec 2023 02:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=UJh0JXfkFIRdVP4AUtkp0D0eC0tpwnfj064iPA1Wt/g=;
 b=f8M2uvbuQ8fOvAN2olP7YfFDD48x3JtvLlEIKD9Fnbe4rf5mgJwxM71rCKrQ8msS3/E+
 52IOoeBysyFmjwevkVX+HyWEvFGAPnW7f5nd8lufcFsRZnCh3+WycyNR5ULMxVBQpyo1
 oNezt6+0Lhf8d5sZotyQqegZTwZh3rsR8jQytW72sW7uuFb4Dvkq/wF+57TtwaUkSB+I
 wlEKnXI448m4LPOZxMVBWthMxy0tX7c7mTGvESsUcu9WyMeWyKA1L4PX6BJYBhMwy1Kq
 SeF/7zfUJ8B+S+HrhkzdZ0I8e/XoTQHeWsMwuSOTRSq8+bK4kXnj+TOI5yWjzK1MkZHa NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3urft38nvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Dec 2023 02:01:24 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B31lAlA004730;
	Sun, 3 Dec 2023 02:01:23 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3urft38nv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Dec 2023 02:01:23 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B30bOa6013582;
	Sun, 3 Dec 2023 02:01:22 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3urf9yga5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Dec 2023 02:01:22 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B321J7s23003694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 3 Dec 2023 02:01:19 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 663A458056;
	Sun,  3 Dec 2023 02:01:19 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43AB15803F;
	Sun,  3 Dec 2023 02:01:18 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.67.87.193])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  3 Dec 2023 02:01:18 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] powerpc/pseries/vas: Use usleep_range() to support HCALL delay
Date: Sat,  2 Dec 2023 18:01:15 -0800
Message-Id: <20231203020115.860099-1-haren@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ttMvCDkk5mqpfrRQEXP_9a1yO5YIRuRl
X-Proofpoint-ORIG-GUID: 97Zw3zOiT8PUgW9Tip-pTkVbpOHWJMx3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-02_24,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312030014
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
hypervisor suggests OS reissue these HCALLs after 1 or 10msecs.
The open and close VAS window functions hold mutex and then issue
these HCALLs. So these operations can take longer than the
necessary when multiple threads issue open or close window APIs
simultaneously.

So instead of msleep(), use usleep_range() to ensure sleep with
the expected value before issuing HCALL again.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Suggested-by: Nathan Lynch <nathanl@linux.ibm.com>

---
v1 -> v2:
- Use usleep_range instead of using RTAS sleep routine as
  suggested by Nathan
v2 -> v3:
- Sleep 10MSecs even for HCALL delay > 10MSecs and the other
  commit / comemnt changes as suggested by Nathan and Ellerman.
---
 arch/powerpc/platforms/pseries/vas.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 71d52a670d95..5cf81c564d4b 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -38,7 +38,30 @@ static long hcall_return_busy_check(long rc)
 {
 	/* Check if we are stalled for some time */
 	if (H_IS_LONG_BUSY(rc)) {
-		msleep(get_longbusy_msecs(rc));
+		unsigned int ms;
+		/*
+		 * Allocate, Modify and Deallocate HCALLs returns
+		 * H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC
+		 * for the long delay. So the sleep time should always
+		 * be either 1 or 10msecs, but in case if the HCALL
+		 * returns the long delay > 10 msecs, clamp the sleep
+		 * time to 10msecs.
+		 */
+		ms = clamp(get_longbusy_msecs(rc), 1, 10);
+
+		/*
+		 * msleep() will often sleep at least 20 msecs even
+		 * though the hypervisor suggests that the OS reissue
+		 * HCALLs after 1 or 10msecs. Also the delay hint from
+		 * the HCALL is just a suggestion. So OK to pause for
+		 * less time than the hinted delay. Use usleep_range()
+		 * to ensure we don't sleep much longer than actually
+		 * needed.
+		 *
+		 * See Documentation/timers/timers-howto.rst for
+		 * explanation of the range used here.
+		 */
+		usleep_range(ms * 100, ms * 1000);
 		rc = H_BUSY;
 	} else if (rc == H_BUSY) {
 		cond_resched();
-- 
2.26.3

