Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E8B334554
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 18:45:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwfcM0XQYz3ckK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 04:45:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QD4WZM3V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QD4WZM3V; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwfbv0GnRz3bcs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 04:44:58 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12AHhOmt054518; Wed, 10 Mar 2021 12:44:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Mn8sY8sJqOTDe7oikzYLEpWDu7TaX1hz5Zzib5aMyfk=;
 b=QD4WZM3VtiTUeDP23sZI8koJqNWM6a/altyzvE+4dOTo14GMyYE9GzRAmKqfyF3np3mT
 KCz3Iy9hxGaG9ME5xND+nvGF3GC1MOW8IKRECzDEc9atEeflNNKYWFX6do2XpyPDeMcs
 Rt0OBlVsk5RFBrhb9nNPIAdf346lQubOKhYxeDy+sguzuD0FXt7uKABOe2wjHOWdoDpv
 dOh/28SejY1uX+vEXREosOwH4vaf1JLUkclMLmxURGKhGyZ9BsIqeQSOUsKCFtNJ8Bmu
 Dl6/Pm8kSAS4hreA83PMfthYxHt3nNaGsADYTDoq5+MN3FCzLyD7Ggq0WL9jlGnJsGuT gQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3772ru03k5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 12:44:52 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12AHevDr002545;
 Wed, 10 Mar 2021 17:44:10 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3768mprmsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 17:44:09 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12AHi7xn42205572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Mar 2021 17:44:07 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDE7311C04C;
 Wed, 10 Mar 2021 17:44:06 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CBFE11C04A;
 Wed, 10 Mar 2021 17:44:06 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.162.110])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 10 Mar 2021 17:44:06 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: fbarrat@linux.ibm.com, ajd@linux.ibm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org
Subject: [PATCH] cxl: don't manipulate the mm.mm_users field directly
Date: Wed, 10 Mar 2021 18:44:05 +0100
Message-Id: <20210310174405.51044-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-10_10:2021-03-10,
 2021-03-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 mlxlogscore=745 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103100084
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
Cc: clombard@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is better to rely on the API provided by the MM layer instead of
directly manipulating the mm_users field.

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 drivers/misc/cxl/fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/cxl/fault.c b/drivers/misc/cxl/fault.c
index 01153b74334a..60c829113299 100644
--- a/drivers/misc/cxl/fault.c
+++ b/drivers/misc/cxl/fault.c
@@ -200,7 +200,7 @@ static struct mm_struct *get_mem_context(struct cxl_context *ctx)
 	if (ctx->mm == NULL)
 		return NULL;
 
-	if (!atomic_inc_not_zero(&ctx->mm->mm_users))
+	if (!mmget_not_zero(ctx->mm))
 		return NULL;
 
 	return ctx->mm;
-- 
2.30.1

