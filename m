Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6278F81ED5E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 09:35:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tc5KLHRm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0Q1h1bLTz3bsP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 19:35:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tc5KLHRm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0Q0q1KlDz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 19:34:18 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BR7J3ve007471;
	Wed, 27 Dec 2023 08:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=zrR711Y2opQPBWdC2okpMByx4G7S2yFFhmp0uMekf0I=;
 b=Tc5KLHRmfp6/aR/BASQWtfpwYmZO1KWNOQuH6/BfwmLdBqWIBGymL2ZTUkwYM3ZmAhQ7
 h5RbfvQySsYn0ISuGRn4yxoNBB6sXnQU1hjBZHFN7LciOGfRsNREj6STiHY+mdN+mM+u
 v4Gce1F1mo1hkN6Y7mOinPUfOWCnVeRxLEBgs3fnt/pwgsSh89Jrh+o64qVIjly5GOMY
 KRgSNbKeXND1xpXg7Lhx+qwTY07RnZ+kI/L1SoFT82AhWcRh6bpPb3AmIA44yRUMs/Fd
 +r6l4V0LmMV4mzNG5EdCjW9D296ZMhQGqllEh/6+MUfaNiQEGjLgAPla5SGzdPALnS+Q 5A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v8fe099ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Dec 2023 08:34:10 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BR8R6vr030286;
	Wed, 27 Dec 2023 08:34:09 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v8fe099nm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Dec 2023 08:34:09 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BR4jieK008292;
	Wed, 27 Dec 2023 08:34:08 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3v6ck1rph1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Dec 2023 08:34:08 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BR8Y6CY14025424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Dec 2023 08:34:06 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AB6858059;
	Wed, 27 Dec 2023 08:34:06 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C3515804B;
	Wed, 27 Dec 2023 08:34:05 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.67.171.31])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 27 Dec 2023 08:34:04 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4] powerpc/pseries/vas: Use usleep_range() to support HCALL delay
Date: Wed, 27 Dec 2023 00:34:01 -0800
Message-Id: <20231227083401.2307526-1-haren@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hLIjM_hV8-AXV37o1PpAMZLfMTZQUG7_
X-Proofpoint-GUID: 6H7D62gG8TRAjAC53HFsCAGtMvepiDzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-27_04,2023-12-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312270062
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
v4 -> v3:
- More description in the commit log with the visible impact for
  the current code as suggested by Aneesh
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

