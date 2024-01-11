Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 832A682A78C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 07:26:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VFNfpAJ6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9ZSF0WrRz3cVx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 17:26:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VFNfpAJ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9ZRL4Jwwz30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jan 2024 17:25:33 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40B6MAFj031343;
	Thu, 11 Jan 2024 06:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=GuH07E21zwN8UfRKsnDZjM1ob84FXYxQC9wdHta/jRs=;
 b=VFNfpAJ6IoHKWarQgRqiRY+cKtKAT0eDt6WWc7+V4la6L49eLnGOxKK6qvAtNgeJBnEY
 KcTZ1HzmbfqOprGcRSvDgO33s5TfPglyZerevyAjLGeKt0r/s9NuhGWCx1yikxiD/7Hq
 i44DOYOrdZT4XwPaO/RZAlBctnlObaGDcTKs0SDwVN5LsOtGjhoFmCQUTL6Y/SfAzg5u
 H3WQpz9Ft3qTA8ZW1qOjZXFWPcrTbwjYgOsh0SQOssehV3Ij5AvGPPOKetWDdr0Ju/iP
 11bQEQ6hsC9l8VBUJqfb66jU2OEGIGSytsYDFIdOXrp/laPM7bdZHX24ypzhzaQEcsMF NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vjb0gr3rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 06:25:18 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40B6NHIS008415;
	Thu, 11 Jan 2024 06:25:18 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vjb0gr3r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 06:25:18 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40B3CJ84027421;
	Thu, 11 Jan 2024 06:25:17 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vfkw29dnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 06:25:17 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40B6PFaV1180182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jan 2024 06:25:15 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4485558058;
	Thu, 11 Jan 2024 06:25:15 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85F0B5805D;
	Thu, 11 Jan 2024 06:25:13 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.67.67.153])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 Jan 2024 06:25:13 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5] powerpc/pseries/vas: Use usleep_range() to support HCALL delay
Date: Wed, 10 Jan 2024 22:25:10 -0800
Message-Id: <20240111062510.1889752-1-haren@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8Vk8VxhHsozlnoifzwTfB1bWf0CfD1Tr
X-Proofpoint-ORIG-GUID: VPl-SX8ZDN1SzOniI4yACjVSmVLDg_Dz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-11_02,2024-01-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401110049
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
Cc: nathanl@linux.ibm.com, haren@linux.ibm.com, npiggin@gmail.com, aneesh.kumar@kernel.org
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
simultaneously, especially might affect the performance in the
case of repeat open/close APIs for each compression request.
On the large machine configuration which allows more simultaneous
open/close windows (Ex: 240 cores provides 4800 VAS credits), the
user can observe hung task traces in dmesg due to mutex contention
around open/close HCAlls.

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
v3 -> v4:
- More description in the commit log with the visible impact for
  the current code as suggested by Aneesh
v4 -> v5:
- Use USEC_PER_MSEC macro in usleep_range as suggested by Aneesh
---
 arch/powerpc/platforms/pseries/vas.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 71d52a670d95..79ffe8868c04 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -38,7 +38,27 @@ static long hcall_return_busy_check(long rc)
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
+		 */
+		usleep_range(ms * 100, ms * USEC_PER_MSEC);
 		rc = H_BUSY;
 	} else if (rc == H_BUSY) {
 		cond_resched();
-- 
2.26.3

