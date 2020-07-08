Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B51021943A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 01:21:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2Ffv5JS3zDqmh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 09:21:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2Fd24zrwzDqWg
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 09:19:31 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 068N3WZq109040; Wed, 8 Jul 2020 19:19:26 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325m405gfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 19:19:25 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 068N0fIP009759;
 Wed, 8 Jul 2020 23:19:24 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 325k27hqad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 23:19:24 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 068NJMB557278926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 23:19:22 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06F5B6E050;
 Wed,  8 Jul 2020 23:19:22 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 959156E04E;
 Wed,  8 Jul 2020 23:19:21 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.134.102])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Jul 2020 23:19:21 +0000 (GMT)
Message-ID: <f8af60fd4167c9c04ee5ab47147b9e95bcb3b9ff.camel@linux.ibm.com>
Subject: [PATCH 1/2] powerpc/vas: Report proper error for address
 translation failure
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
Date: Wed, 08 Jul 2020 16:19:19 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_18:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 clxscore=1011 suspectscore=1 mlxlogscore=632 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007080138
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
Cc: tulioqm@br.ibm.com, abali@us.ibm.com, linuxppc-dev@lists.ozlabs.org,
 rzinsly@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


DMA controller uses CC=5 internally for translation fault handling. So
OS should be using CC=250 and should report this error to the user space
when NX encounters address translation failure on the request buffer.
Not an issue in earlier releases as NX does not get faults on
kernel addresses.

This patch defines CSB_CC_ADDRESS_TRANSLATION(250) and updates
CSB.CC with this proper error code for user space.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 Documentation/powerpc/vas-api.rst          | 2 +-
 arch/powerpc/include/asm/icswx.h           | 2 ++
 arch/powerpc/platforms/powernv/vas-fault.c | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/powerpc/vas-api.rst b/Documentation/powerpc/vas-api.rst
index 1217c2f..78627cc 100644
--- a/Documentation/powerpc/vas-api.rst
+++ b/Documentation/powerpc/vas-api.rst
@@ -213,7 +213,7 @@ request buffers are not in memory. The operating system handles the fault by
 updating CSB with the following data:
 
 	csb.flags = CSB_V;
-	csb.cc = CSB_CC_TRANSLATION;
+	csb.cc = CSB_CC_ADDRESS_TRANSLATION;
 	csb.ce = CSB_CE_TERMINATION;
 	csb.address = fault_address;
 
diff --git a/arch/powerpc/include/asm/icswx.h b/arch/powerpc/include/asm/icswx.h
index 965b1f3..b1c9a57 100644
--- a/arch/powerpc/include/asm/icswx.h
+++ b/arch/powerpc/include/asm/icswx.h
@@ -77,6 +77,8 @@ struct coprocessor_completion_block {
 #define CSB_CC_CHAIN		(37)
 #define CSB_CC_SEQUENCE		(38)
 #define CSB_CC_HW		(39)
+/* User space address traslation failure */
+#define	CSB_CC_ADDRESS_TRANSLATION	(250)
 
 #define CSB_SIZE		(0x10)
 #define CSB_ALIGN		CSB_SIZE
diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index 266a6ca..33e89d4 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -79,7 +79,7 @@ static void update_csb(struct vas_window *window,
 	csb_addr = (void __user *)be64_to_cpu(crb->csb_addr);
 
 	memset(&csb, 0, sizeof(csb));
-	csb.cc = CSB_CC_TRANSLATION;
+	csb.cc = CSB_CC_ADDRESS_TRANSLATION;
 	csb.ce = CSB_CE_TERMINATION;
 	csb.cs = 0;
 	csb.count = 0;
-- 
1.8.3.1


