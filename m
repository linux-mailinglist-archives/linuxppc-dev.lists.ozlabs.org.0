Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8FE76955A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 13:57:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H8mWZCxZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RDxZ73L9Nz30K6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 21:57:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H8mWZCxZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RDxXH1fKXz2yhN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 21:55:59 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36VBhFIJ001980;
	Mon, 31 Jul 2023 11:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=zQ1/0KMwbLnu54LAm8+bcoThSNytblqQYNZkQmK5JDk=;
 b=H8mWZCxZLsH8LSUf5MnexAmPQKcsiqMNocYKXhT/Yn5+0u3MyrB9m/dRW3wUDfib03lt
 pdEtGhB/OalKsA6aRoign0BKnAs44UtS5/o7OCWwt7AIBeu/QOjCheXvkoo5hXaON6La
 8B+PBjSTiBDh/XqBH7MjPUyO0ybQzEG0XIzyYvdfrPM0jZ8lAjgL1y7wgYwVkY5FqVMo
 7sxxMgfJ2Z+WvJMin9Qu79vElMNdRs0wo6nxIeYnS5E6qDBuoFPQphxs5ZCKYN7IOTnK
 4Hc0B1xOY5B8E4NNQswqaLBVxUOKTKxARsUzMzytip3AYGlU/XO1V1rzSxbZscnzDGgE Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6cb18d5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 11:55:51 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36VBhPvg002599;
	Mon, 31 Jul 2023 11:55:50 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6cb18d56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 11:55:50 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36VBoB3v018679;
	Mon, 31 Jul 2023 11:55:50 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s5ekk2kt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 11:55:50 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36VBtmQO21955312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Jul 2023 11:55:48 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09BD020043;
	Mon, 31 Jul 2023 11:55:48 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D48E20040;
	Mon, 31 Jul 2023 11:55:46 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.in.ibm.com (unknown [9.204.206.66])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 31 Jul 2023 11:55:46 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: [PATCH v2] arch/powerpc: Remove unnecessary endian conversion code in XICS
Date: Mon, 31 Jul 2023 17:25:39 +0530
Message-ID: <20230731115543.36991-1-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KTxTaCkDIpl9Rb9k8ZzuTdjuo2vqloNs
X-Proofpoint-ORIG-GUID: g702b9IV5ZuSj7fWoZD3SUubaofH2OcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_05,2023-07-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307310104
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove an unnecessary piece of code that does an endianness conversion but
does not use the result. The following warning was reported by Clang's
static analyzer:

arch/powerpc/sysdev/xics/ics-opal.c:114:2: warning: Value stored to
'server' is never read [deadcode.DeadStores]
server = be16_to_cpu(oserver);

'server' was used as a parameter to opal_get_xive() in commit
5c7c1e9444d8 ("powerpc/powernv: Add OPAL ICS backend") when it was
introduced. 'server' was also used in an error message for the call to
opal_get_xive().

'server' was always later set by a call to ics_opal_mangle_server()
before being used.

Commit bf8e0f891a32 ("powerpc/powernv: Fix endian issues in OPAL ICS
backend") used a new variable 'oserver' as the parameter to
opal_get_xive() instead of 'server' for endian correctness. It also
removed 'server' from the error message for the call to opal_get_xive().

Fix the warning by removing the server variable assignment.

Fixes: bf8e0f891a32 ("powerpc/powernv: Fix endian issues in OPAL ICS backend")
Reviewed-by: Jordan Niethe <jniethe5@gmail.com>
Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
V1 -> V2:
1. Add context of the code provided by Jordan
2. Add fixes tag

 arch/powerpc/sysdev/xics/ics-opal.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/sysdev/xics/ics-opal.c b/arch/powerpc/sysdev/xics/ics-opal.c
index 6cfbb4fac7fb..5fe73dabab79 100644
--- a/arch/powerpc/sysdev/xics/ics-opal.c
+++ b/arch/powerpc/sysdev/xics/ics-opal.c
@@ -111,7 +111,6 @@ static int ics_opal_set_affinity(struct irq_data *d,
 		       __func__, d->irq, hw_irq, rc);
 		return -1;
 	}
-	server = be16_to_cpu(oserver);
 
 	wanted_server = xics_get_irq_server(d->irq, cpumask, 1);
 	if (wanted_server < 0) {
-- 
2.41.0

