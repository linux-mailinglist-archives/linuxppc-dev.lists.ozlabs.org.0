Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9EB62F917
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 16:16:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDL3l2hFjz3f6J
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 02:16:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oqzxoBzN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oqzxoBzN;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDKsb3Xn6z3cMj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 02:08:03 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIE81FH027598
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jQdTjsD+SMfSsYGDW6zR277mc2vKNTqQGqfpXQclDtE=;
 b=oqzxoBzNvlsy0jooFAR/JqniJ2+BxJuVutcupK8irUlI80msmsyMaQUFInSSbYMJHqFg
 EtUQ8q4cmBCauI90qzv5KaYhZuIts48omggXu7tNMGX9Wuu5KYDlCd987QR/k32G8Z5v
 bq3qfd93KG2mHae10A7jLVgyApyP+AwFAJnTJiBwQvSnZn9dYWtr8c1qks9qys+xwzeC
 vX2aKSR/ValuYhOHF0Zd+tZKDrgH1Eafvw1UcsU53ZFWaMKCYkY1NQg++n3L6w9/SN0E
 tAyCLh3fPT9A1P7roj0vBlvqPevyO8TynnyfOx88CtkZYYQOlSqNdh+T2ydwnWMRou6r 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx8w0wwf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:56 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AIEdeaj018629
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:56 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx8w0wwev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:56 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AIF6wuJ008817;
	Fri, 18 Nov 2022 15:07:55 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma01wdc.us.ibm.com with ESMTP id 3kt34a096y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:55 +0000
Received: from smtpav01.dal12v.mail.ibm.com ([9.208.128.133])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AIF7uUN16450234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 15:07:56 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E92958058;
	Fri, 18 Nov 2022 15:07:54 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 101E158057;
	Fri, 18 Nov 2022 15:07:54 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 15:07:53 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/13] powerpc/pseries/eeh: use correct API for error log size
Date: Fri, 18 Nov 2022 09:07:43 -0600
Message-Id: <20221118150751.469393-6-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221118150751.469393-1-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: N-VizItzzLjoJIKAORi8VNZWFVsPcq6l
X-Proofpoint-GUID: Bk4Qn05_p9M4e8KC5Z86rJ9P4klYbjtc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211180084
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

rtas-error-log-max is not the name of an RTAS function, so
rtas_token() is not the appropriate API for retrieving its value. We
already have rtas_get_error_log_max() which returns a sensible value
if the property is absent for any reason, so use that instead.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: 8d633291b4fc ("powerpc/eeh: pseries platform EEH error log retrieval")
---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 8e40ccac0f44..e5e4f4aa5afd 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -848,7 +848,7 @@ static int __init eeh_pseries_init(void)
 	}
 
 	/* Initialize error log size */
-	eeh_error_buf_size = rtas_token("rtas-error-log-max");
+	eeh_error_buf_size = rtas_get_error_log_max();
 	if (eeh_error_buf_size == RTAS_UNKNOWN_SERVICE) {
 		pr_info("%s: unknown EEH error log size\n",
 			__func__);
-- 
2.37.1

