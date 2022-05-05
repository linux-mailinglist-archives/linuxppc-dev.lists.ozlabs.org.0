Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B232F51BD0E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 12:19:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv8nj48nBz3brx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 20:19:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VzBYkvNB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv8mz1jyHz3bmV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 20:18:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VzBYkvNB; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Kv8ms4LD2z4x7Y
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 20:18:53 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4Kv8ms4H0Yz4xTX; Thu,  5 May 2022 20:18:53 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VzBYkvNB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Kv8ms22Nfz4x7Y
 for <linuxppc-dev@ozlabs.org>; Thu,  5 May 2022 20:18:52 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2459LZeD022475
 for <linuxppc-dev@ozlabs.org>; Thu, 5 May 2022 10:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=c8eWsYEsaT9PLl4vm3XUA+HrfPqyzJvWVsuxFeiNmjY=;
 b=VzBYkvNBw0F+vB3fN/R5FjmLXwFgJ8XPbcWUlPR84JO2+PEK2g+Kkdn3Kd5KHZMBDt8A
 GGGL6U68+upxdoQ2KtyKSTbW1f3zDYRY2F8MrWJBvYYQRCN2SDN8lItnGliV0hEjlrFH
 uCt2nAUu8av2MWHy+NPOULjd9SkZq5ENajemQKBfJPH+RjeqAk3awqZNPuNSiZyLSGUT
 wJBVXcaJ98pegwpANbwDeKaSG/mEUGBHhRNXOLg59seT0oXVAHFsbBaJhf47gF74MlHR
 51cBMMht2Iu9ghxflkmgnNM5kodPyNGp/XNRBobRucYdKh9GBABZjEXzr3Y/zDeuyz8T mA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvbvq8x0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 05 May 2022 10:18:50 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 245AIoRc006762
 for <linuxppc-dev@ozlabs.org>; Thu, 5 May 2022 10:18:50 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvbvq8x00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 10:18:50 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 245ACQYW009761;
 Thu, 5 May 2022 10:18:47 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3fscdk51ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 10:18:47 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 245A5NQg43450778
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 May 2022 10:05:23 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 438FE11C050;
 Thu,  5 May 2022 10:18:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8ED6E11C04A;
 Thu,  5 May 2022 10:18:43 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.97.174])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 May 2022 10:18:43 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, crash-utility@redhat.com
Subject: [PATCH] ppc64: update the NR_CPUS to 8192
Date: Thu,  5 May 2022 15:48:42 +0530
Message-Id: <20220505101842.49149-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QuMCzVyhjPTuxYFNf7eJFPDaikmR5P87
X-Proofpoint-GUID: z5eSF_3fd04ZiHqoqlTveq5rtnDSf3rN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_04,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 spamscore=0 mlxlogscore=924 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050071
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
Cc: mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The NR_CPUS on Linux kernel ranges from 1-8192. So let's match
NR_CPUS with max NR_CPUS count on Linux kernel.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defs.h b/defs.h
index 1e8360d..a6735d0 100644
--- a/defs.h
+++ b/defs.h
@@ -136,7 +136,7 @@
 #define NR_CPUS  (4096)
 #endif
 #ifdef PPC64
-#define NR_CPUS  (2048)
+#define NR_CPUS  (8192)
 #endif
 #ifdef S390
 #define NR_CPUS  (512)
-- 
2.35.1

