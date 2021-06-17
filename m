Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A893ABD66
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 22:29:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5YZH1r5Kz3bx4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:29:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DTOBJeLo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DTOBJeLo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5YYq2Snkz2yxm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 06:29:18 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HKDWpf073982; Thu, 17 Jun 2021 16:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=yCWnr1/OA67OHJd0ZHN3WZrSDVbSg83rE0LmbwAlozw=;
 b=DTOBJeLomsa6yrdSxGNoqBM7mMCJIHqRACB8pSYtYrIafQEcWxx1kM2qaqXlvGcX3mXZ
 ehnUVlS79Sx996Hh9AH3ol5bgbyEbH13Dhcw7yqjHgumJ4Jvd7UttJd60IoUVeAewepz
 TguyTCrTqQwB0EL50jeIQnkoCIS8kSWzZ8LEHYCn/vMsO5trYtYHye3p5gyeALquUEwM
 o6Wu2jw3HKri4QT2Pq2CxoqQyNyc8VZPmE54IWlgob/DyvltKM7lNy54jUHCzGq66eTh
 k7t6AXTakDJQOzLD7BTIeUTqZTk/y9OEwV50Tnl3JOVmRx1+0BjWiHKopXbAauUgzSod ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398d850bdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:29:11 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HKIRjX092256;
 Thu, 17 Jun 2021 16:29:10 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398d850bdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:29:10 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HKHifX015330;
 Thu, 17 Jun 2021 20:29:10 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 394mj9uwhj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 20:29:10 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HKT9E313435616
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 20:29:09 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46509BE053;
 Thu, 17 Jun 2021 20:29:09 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2958BE051;
 Thu, 17 Jun 2021 20:29:07 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 20:29:07 +0000 (GMT)
Message-ID: <6020fc4d444864fe20f7dcdc5edfe53e67480a1c.camel@linux.ibm.com>
Subject: [PATCH v6 01/17] powerpc/powernv/vas: Release reference to tgid
 during window close
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Thu, 17 Jun 2021 13:29:05 -0700
In-Reply-To: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: V-t1qSyzdcLSQ60MHEjirwy7tj5hWDrw
X-Proofpoint-GUID: qOYFvFszJbAFypBv0FUxDHcYqX1moY61
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_16:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170122
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


The kernel handles the NX fault by updating CSB or sending
signal to process. In multithread applications, children can
open VAS windows and can exit without closing them. But the
parent can continue to send NX requests with these windows. To
prevent pid reuse, reference will be taken on pid and tgid
when the window is opened and release them during window close.

The current code is not releasing the tgid reference which can
cause pid leak and this patch fixes the issue.

Fixes: db1c08a740635 ("powerpc/vas: Take reference to PID and mm for user space windows")
Cc: stable@vger.kernel.org # 5.8+
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Reported-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/powernv/vas-window.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 5f5fe63a3d1c..7ba0840fc3b5 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1093,9 +1093,9 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
 		/*
 		 * Process closes window during exit. In the case of
 		 * multithread application, the child thread can open
-		 * window and can exit without closing it. Expects parent
-		 * thread to use and close the window. So do not need
-		 * to take pid reference for parent thread.
+		 * window and can exit without closing it. so takes tgid
+		 * reference until window closed to make sure tgid is not
+		 * reused.
 		 */
 		txwin->tgid = find_get_pid(task_tgid_vnr(current));
 		/*
@@ -1339,8 +1339,9 @@ int vas_win_close(struct vas_window *window)
 	/* if send window, drop reference to matching receive window */
 	if (window->tx_win) {
 		if (window->user_win) {
-			/* Drop references to pid and mm */
+			/* Drop references to pid. tgid and mm */
 			put_pid(window->pid);
+			put_pid(window->tgid);
 			if (window->mm) {
 				mm_context_remove_vas_window(window->mm);
 				mmdrop(window->mm);
-- 
2.18.2


