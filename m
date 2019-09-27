Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C000CBFDC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 05:50:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fd9m1QnJzDqyw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 13:50:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=ljp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fd7r2ybWzDqsb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 13:48:52 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8R3gp6S025346; Thu, 26 Sep 2019 23:48:48 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v8w26j2b4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Sep 2019 23:48:48 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8R3eAfw030829;
 Fri, 27 Sep 2019 03:48:48 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 2v5bg7mw0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2019 03:48:48 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8R3mk0C52953584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2019 03:48:47 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC54E28059;
 Fri, 27 Sep 2019 03:48:46 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F57328058;
 Fri, 27 Sep 2019 03:48:46 +0000 (GMT)
Received: from pompom.ibm.com (unknown [9.160.104.35])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 27 Sep 2019 03:48:46 +0000 (GMT)
From: Lijun Pan <ljp@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC] powerpc/pseries/hcall: remove the save/restore of CR
Date: Thu, 26 Sep 2019 22:48:46 -0500
Message-Id: <20190927034846.73066-1-ljp@linux.ibm.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-27_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=904 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909270034
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
Cc: Lijun Pan <ljp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

According to the PAPR, hcalls should not modify the Condition
Register fields, hence save/restore the CR is not necessary.

Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/hvCall.S | 36 -------------------------
 1 file changed, 36 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hvCall.S b/arch/powerpc/platforms/pseries/hvCall.S
index 2136e42833af..b26a79331994 100644
--- a/arch/powerpc/platforms/pseries/hvCall.S
+++ b/arch/powerpc/platforms/pseries/hvCall.S
@@ -105,13 +105,9 @@ END_FTR_SECTION(0, 1);						\
 _GLOBAL_TOC(plpar_hcall_norets)
 	HMT_MEDIUM
 
-	mfcr	r0
-	stw	r0,8(r1)
 	HCALL_BRANCH(plpar_hcall_norets_trace)
 	HVSC				/* invoke the hypervisor */
 
-	lwz	r0,8(r1)
-	mtcrf	0xff,r0
 	blr				/* return r3 = status */
 
 #ifdef CONFIG_TRACEPOINTS
@@ -119,17 +115,12 @@ plpar_hcall_norets_trace:
 	HCALL_INST_PRECALL(R4)
 	HVSC
 	HCALL_INST_POSTCALL_NORETS
-	lwz	r0,8(r1)
-	mtcrf	0xff,r0
 	blr
 #endif
 
 _GLOBAL_TOC(plpar_hcall)
 	HMT_MEDIUM
 
-	mfcr	r0
-	stw	r0,8(r1)
-
 	HCALL_BRANCH(plpar_hcall_trace)
 
 	std     r4,STK_PARAM(R4)(r1)     /* Save ret buffer */
@@ -149,9 +140,6 @@ _GLOBAL_TOC(plpar_hcall)
 	std	r6, 16(r12)
 	std	r7, 24(r12)
 
-	lwz	r0,8(r1)
-	mtcrf	0xff,r0
-
 	blr				/* return r3 = status */
 
 #ifdef CONFIG_TRACEPOINTS
@@ -178,9 +166,6 @@ plpar_hcall_trace:
 
 	HCALL_INST_POSTCALL(r12)
 
-	lwz	r0,8(r1)
-	mtcrf	0xff,r0
-
 	blr
 #endif
 
@@ -193,9 +178,6 @@ plpar_hcall_trace:
 _GLOBAL(plpar_hcall_raw)
 	HMT_MEDIUM
 
-	mfcr	r0
-	stw	r0,8(r1)
-
 	std     r4,STK_PARAM(R4)(r1)     /* Save ret buffer */
 
 	mr	r4,r5
@@ -213,17 +195,11 @@ _GLOBAL(plpar_hcall_raw)
 	std	r6, 16(r12)
 	std	r7, 24(r12)
 
-	lwz	r0,8(r1)
-	mtcrf	0xff,r0
-
 	blr				/* return r3 = status */
 
 _GLOBAL_TOC(plpar_hcall9)
 	HMT_MEDIUM
 
-	mfcr	r0
-	stw	r0,8(r1)
-
 	HCALL_BRANCH(plpar_hcall9_trace)
 
 	std     r4,STK_PARAM(R4)(r1)     /* Save ret buffer */
@@ -252,9 +228,6 @@ _GLOBAL_TOC(plpar_hcall9)
 	std	r11,56(r12)
 	std	r0, 64(r12)
 
-	lwz	r0,8(r1)
-	mtcrf	0xff,r0
-
 	blr				/* return r3 = status */
 
 #ifdef CONFIG_TRACEPOINTS
@@ -290,9 +263,6 @@ plpar_hcall9_trace:
 
 	HCALL_INST_POSTCALL(r12)
 
-	lwz	r0,8(r1)
-	mtcrf	0xff,r0
-
 	blr
 #endif
 
@@ -300,9 +270,6 @@ plpar_hcall9_trace:
 _GLOBAL(plpar_hcall9_raw)
 	HMT_MEDIUM
 
-	mfcr	r0
-	stw	r0,8(r1)
-
 	std     r4,STK_PARAM(R4)(r1)     /* Save ret buffer */
 
 	mr	r4,r5
@@ -329,7 +296,4 @@ _GLOBAL(plpar_hcall9_raw)
 	std	r11,56(r12)
 	std	r0, 64(r12)
 
-	lwz	r0,8(r1)
-	mtcrf	0xff,r0
-
 	blr				/* return r3 = status */
-- 
2.22.0

