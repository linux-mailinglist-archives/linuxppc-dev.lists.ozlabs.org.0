Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2988D21C0EA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jul 2020 01:49:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B3VBH07s4zDrP5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jul 2020 09:49:11 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B3V8Q44XgzDrNd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jul 2020 09:47:34 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06AN3Xq2036117; Fri, 10 Jul 2020 19:47:25 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 326j843ay0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jul 2020 19:47:25 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06ANij9V024578;
 Fri, 10 Jul 2020 23:47:24 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04wdc.us.ibm.com with ESMTP id 326bcb08ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jul 2020 23:47:23 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06ANlMcL51118454
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jul 2020 23:47:22 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B47AA112066;
 Fri, 10 Jul 2020 23:47:22 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E0D2112062;
 Fri, 10 Jul 2020 23:47:21 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.134.102])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 10 Jul 2020 23:47:21 +0000 (GMT)
Message-ID: <019fd53e7538c6f8f332d175df74b1815ef5aa8c.camel@linux.ibm.com>
Subject: [PATCH V2 1/2] powerpc/vas: Report proper error code for address
 translation failure
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
Date: Fri, 10 Jul 2020 16:47:19 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-10_14:2020-07-10,
 2020-07-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=500 spamscore=0 impostorscore=0 suspectscore=1 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007100152
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


P9 DD2 NX workbook (Table 4-36) says DMA controller uses CC=5
internally for translation fault handling. NX reserves CC=250 for
OS to notify user space when NX encounters address translation
failure on the request buffer. Not an issue in earlier releases
as NX does not get faults on kernel addresses.

This patch defines CSB_CC_FAULT_ADDRESS(250) and updates CSB.CC with
this proper error code for user space.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>

Changes in V2:
- Use CSB_CC_FAULT_ADDRESS instead of CSB_CC_ADDRESS_TRANSLATION
  to distinguish from other error codes.
- Add NX workbook reference in the comment.

---
 Documentation/powerpc/vas-api.rst          | 2 +-
 arch/powerpc/include/asm/icswx.h           | 4 ++++
 arch/powerpc/platforms/powernv/vas-fault.c | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/powerpc/vas-api.rst b/Documentation/powerpc/vas-api.rst
index 1217c2f..788dc83 100644
--- a/Documentation/powerpc/vas-api.rst
+++ b/Documentation/powerpc/vas-api.rst
@@ -213,7 +213,7 @@ request buffers are not in memory. The operating system handles the fault by
 updating CSB with the following data:
 
 	csb.flags = CSB_V;
-	csb.cc = CSB_CC_TRANSLATION;
+	csb.cc = CSB_CC_FAULT_ADDRESS;
 	csb.ce = CSB_CE_TERMINATION;
 	csb.address = fault_address;
 
diff --git a/arch/powerpc/include/asm/icswx.h b/arch/powerpc/include/asm/icswx.h
index 965b1f3..9bc7c58 100644
--- a/arch/powerpc/include/asm/icswx.h
+++ b/arch/powerpc/include/asm/icswx.h
@@ -77,6 +77,10 @@ struct coprocessor_completion_block {
 #define CSB_CC_CHAIN		(37)
 #define CSB_CC_SEQUENCE		(38)
 #define CSB_CC_HW		(39)
+/*
+ * P9 DD NX Workbook 3.2 (Table 4-36): Address translation fault
+ */
+#define	CSB_CC_FAULT_ADDRESS	(250)
 
 #define CSB_SIZE		(0x10)
 #define CSB_ALIGN		CSB_SIZE
diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index 266a6ca..3d21fce 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -79,7 +79,7 @@ static void update_csb(struct vas_window *window,
 	csb_addr = (void __user *)be64_to_cpu(crb->csb_addr);
 
 	memset(&csb, 0, sizeof(csb));
-	csb.cc = CSB_CC_TRANSLATION;
+	csb.cc = CSB_CC_FAULT_ADDRESS;
 	csb.ce = CSB_CE_TERMINATION;
 	csb.cs = 0;
 	csb.count = 0;
-- 
1.8.3.1


