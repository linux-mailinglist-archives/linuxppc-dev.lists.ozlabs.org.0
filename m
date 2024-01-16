Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C233F82E953
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 07:00:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SZO0mq8j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDddp4g26z3bTf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 17:00:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SZO0mq8j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDdcy2vryz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 16:59:29 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40G5Ogqi014334;
	Tue, 16 Jan 2024 05:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=CkRzBSnSlq2cSIZgPX3ORkWzotDVQCad1hVcxBW3e5A=;
 b=SZO0mq8j5j5wugI8TxrURl+TP/pXCXDIpqrn7zrLzT6ETvQ72dY7KC+iMckG/xh7Mo8U
 DLCT318d7tlP9lB5u5SsOQZeTFoaH4hDwYdF2xL6SilgqXyNgADqDg8clr/hti3JX6kH
 1JTHkZOJf01EHcWUt6tZllqfGVnvcUV9Btiy/jz6wiX/ObvgGDa0bBU7K6VAtjbjgdns
 qjJTS0T9LLuB2Y825ZvWKFQEyjXqFMmGJ7vqb7ZDxfJmq2Of5PnHQxluY3rKXuvZ810l
 cXcc4kSb1HVO18HbhUJNJ/QCgwZajpQwTBlyaFPal8xeF2eyLoCGbkGEHCWIfzqhmdgs Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vnkmfrr7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 05:59:19 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40G5RO4s023975;
	Tue, 16 Jan 2024 05:59:18 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vnkmfrr79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 05:59:18 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40G43Dtx008657;
	Tue, 16 Jan 2024 05:59:18 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vm6bkcnka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 05:59:18 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40G5xEam26214962
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jan 2024 05:59:15 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B15315805C;
	Tue, 16 Jan 2024 05:59:14 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B9D45805A;
	Tue, 16 Jan 2024 05:59:13 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.67.73.23])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 16 Jan 2024 05:59:12 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6] powerpc/pseries/vas: Use usleep_range() to support HCALL delay
Date: Mon, 15 Jan 2024 21:59:10 -0800
Message-Id: <20240116055910.421605-1-haren@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: h_T6UoxV-YKblL-QkfBO6DzOR80mMGEi
X-Proofpoint-GUID: 6SHlzS3TZzpNW_jsa6JuyEcdSLuYl-G9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-16_02,2024-01-15_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401160044
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

Multiple tasks can open / close VAS windows at the same time
which depends on the available VAS credits. For example, 240
cores system provides 4800 VAS credits. It means 4800 tasks can
execute open VAS windows HCALLs with the mutex. Since each
msleep() will often sleep more than 20 msecs, some tasks are
waiting more than 120 secs to acquire mutex. It can cause hung
traces for these tasks in dmesg due to mutex contention around
open/close HCALLs.

Instead of msleep(), use usleep_range() to ensure sleep with
the expected value before issuing HCALL again. So since each
task sleep 10 msecs maximum, this patch allow more tasks can
issue open/close VAS calls without any hung traces in the
dmesg.

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
v5 -> v6:
- Use USEC_PER_MSEC macro to calculate all ranges in usleep_range()
  and more description in the commit log.
---
 arch/powerpc/platforms/pseries/vas.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 71d52a670d95..8e8934564557 100644
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
+		usleep_range(ms * (USEC_PER_MSEC / 10), ms * USEC_PER_MSEC);
 		rc = H_BUSY;
 	} else if (rc == H_BUSY) {
 		cond_resched();
-- 
2.26.3

