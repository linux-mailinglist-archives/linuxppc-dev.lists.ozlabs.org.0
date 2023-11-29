Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE5A7FD028
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 08:55:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LpjwnEYp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgBT24Pnbz3cmg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 18:55:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LpjwnEYp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgBS52zqTz3bPM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 18:54:44 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT7ekYC010735;
	Wed, 29 Nov 2023 07:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=HkQYPhSY+RkifVIDMjF8u6aVyPbm4tjqjaSbHdZFFH4=;
 b=LpjwnEYp1joUcmZl99Vk1JZXfWAqOa/JRwAmgmy58whCz+eVsbG4oMS27Xov+EShIkbc
 IzUpVUUDVVblMWhwJgPBH4vOIN3BzT46dJSPLIWwvPIvSpNYhvik8C5RbWYFQJ+FlTuo
 w57hTztnz/9oCD5fKOOc+BRcE6NyqK7ZOjhHDFyAiHRkBGuipjwSmsHyhdyUdNp2WmvZ
 bU4NWpAjCRkv9uPXMNNXdK7231AMYk96JwLzWXcplOMGVbO81POAnuigDBoAlC6x4B1Y
 583aIfU5fwOhw26qZg6QiUnKqhRodLjYqM7mmJHr0D1HOMzFLKza/D0iQkppOBgmc8h8 IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3up1470bh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 07:54:33 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AT7l5nX029839;
	Wed, 29 Nov 2023 07:54:33 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3up1470bh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 07:54:33 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT50ig6004955;
	Wed, 29 Nov 2023 07:54:32 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ukwfk5g5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 07:54:32 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AT7sT9K9896452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Nov 2023 07:54:29 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1621C58058;
	Wed, 29 Nov 2023 07:54:29 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E95158059;
	Wed, 29 Nov 2023 07:54:27 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.67.85.162])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 29 Nov 2023 07:54:27 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/pseries/vas: Use usleep_range() to support HCALL delay
Date: Tue, 28 Nov 2023 23:54:24 -0800
Message-Id: <20231129075424.240653-1-haren@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cq_noAvu7cYe5gnwgKSl-ePGg1WvsBIE
X-Proofpoint-GUID: Ydu7Dtnga_CxtokRFYGbeig81kgOk2SX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_05,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=982
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311290057
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

So instead of msleep(), use usleep_range() to ensure sleep with
the expected value before issuing HCALL again.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Suggested-by: Nathan Lynch <nathanl@linux.ibm.com>

---
v1 -> v2:
- Use usleep_range instead of using RTAS sleep routine as
  suggested by Nathan
---
 arch/powerpc/platforms/pseries/vas.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 71d52a670d95..bade4402741f 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -36,9 +36,31 @@ static bool migration_in_progress;
 
 static long hcall_return_busy_check(long rc)
 {
+	unsigned int ms;
+
 	/* Check if we are stalled for some time */
 	if (H_IS_LONG_BUSY(rc)) {
-		msleep(get_longbusy_msecs(rc));
+		ms = get_longbusy_msecs(rc);
+		/*
+		 * Allocate, Modify and Deallocate HCALLs returns
+		 * H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC
+		 * for the long delay. So the delay should always be 1
+		 * or 10msecs, but sleeps 1msec in case if the long
+		 * delay is > H_LONG_BUSY_ORDER_10_MSEC.
+		 */
+		if (ms > 10)
+			ms = 1;
+
+		/*
+		 * msleep() will often sleep at least 20 msecs even
+		 * though the hypervisor expects to reissue these
+		 * HCALLs after 1 or 10msecs. So use usleep_range()
+		 * to sleep with the expected value.
+		 *
+		 * See Documentation/timers/timers-howto.rst on using
+		 * the value range in usleep_range().
+		 */
+		usleep_range(ms * 100, ms * 1000);
 		rc = H_BUSY;
 	} else if (rc == H_BUSY) {
 		cond_resched();
-- 
2.26.3

