Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A34F82D6E0B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 03:13:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsZ8X0hK0zDqnW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 13:13:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nDR0OY+p; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsZ6v6JNSzDqlV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 13:12:22 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BB29FVb020962
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 21:12:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=C2OhiRaTVNLukiJrct4E6RVIabQXU3H0rvwE+V/eIOM=;
 b=nDR0OY+pW+PPSTBBw2nJZmophCmlF/QX5nCeJF5RmfpbrZWz3CkHWErzqnjTR78NXeJv
 vZkHY6hpq2w1H+YGohsHeu3ASPDyHepemM9ZNl3FEoy0YUxmKpR6cM2genj4L6gM6gK9
 CzLjA7rcQ4INmslDx+/VwM2AJ8OH49f9FMtTYXiioocjHK/W61dUArRG8qyyGPyQRkHI
 WVieV/NjktBZtpr24zHCtlb886xoqGhGXab9iFWR3Y/NoJsH/ZhRrMyrHcKGPGBXJFA9
 z8uqyoJqlari5lhmbBn/NEmqP/UsIofkqTYWZbJQiHOkT3+klDvp0qvH7MF22fGTneNb 5A== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bxycgy3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 21:12:19 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BB2BVP9004398
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 02:12:17 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3581fhpfqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 02:12:16 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BB2CETG34079010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 02:12:14 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2DBA5204F
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 02:12:14 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5314052050
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 02:12:14 +0000 (GMT)
Received: from intelligence.ibm.com (unknown [9.102.43.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2B15F609FF;
 Fri, 11 Dec 2020 13:12:13 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv: Rate limit opal-elog read failure message
Date: Fri, 11 Dec 2020 13:11:41 +1100
Message-Id: <20201211021140.28402-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_11:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=759 malwarescore=0 mlxscore=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=1
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012110010
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
Cc: aneesh.kumar@linux.ibm.com, mahesh@linux.ibm.com, hegdevasant@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sometimes we can't read an error log from OPAL, and we print an error
message accordingly. But the OPAL userspace tools seem to like retrying a
lot, in which case we flood the kernel log with a lot of messages.

Change pr_err() to pr_err_ratelimited() to help with this.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-elog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
index 37b380eef41a..5821b0fa8614 100644
--- a/arch/powerpc/platforms/powernv/opal-elog.c
+++ b/arch/powerpc/platforms/powernv/opal-elog.c
@@ -171,8 +171,8 @@ static ssize_t raw_attr_read(struct file *filep, struct kobject *kobj,
 		opal_rc = opal_read_elog(__pa(elog->buffer),
 					 elog->size, elog->id);
 		if (opal_rc != OPAL_SUCCESS) {
-			pr_err("ELOG: log read failed for log-id=%llx\n",
-			       elog->id);
+			pr_err_ratelimited("ELOG: log read failed for log-id=%llx\n",
+					   elog->id);
 			kfree(elog->buffer);
 			elog->buffer = NULL;
 			return -EIO;
-- 
2.20.1

