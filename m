Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEA644AA3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 20:28:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PsgL6n22zDrJB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 04:28:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PsdG2gSCzDrC9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 04:26:26 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5DIHFP6118168; Thu, 13 Jun 2019 14:26:16 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t3ufr0pha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jun 2019 14:26:16 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5DI9IQD019216;
 Thu, 13 Jun 2019 18:10:09 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 2t1x6t00yc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jun 2019 18:10:09 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5DIQEjo7733510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jun 2019 18:26:14 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E0CF112065;
 Thu, 13 Jun 2019 18:26:14 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4164B112061;
 Thu, 13 Jun 2019 18:26:13 +0000 (GMT)
Received: from LeoBras.aus.stglabs.ibm.com (unknown [9.18.235.170])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 13 Jun 2019 18:26:13 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [RFC PATCH] Replaces long number representation by BIT() macro
Date: Thu, 13 Jun 2019 15:02:27 -0300
Message-Id: <20190613180227.29558-1-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-13_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906130134
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
Cc: Leonardo Bras <leonardo@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The main reason of this change is to make these bitmasks more readable.

The macro ASM_CONST() just appends an UL to it's parameter, so it can be
easily replaced by BIT_MASK, that already uses a UL representation.

ASM_CONST() in this file may behave different if __ASSEMBLY__ is defined,
as it is used on .S files, just leaving the parameter as is.

However, I have noticed no difference in the generated binary after this
change.

Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
---
 arch/powerpc/include/asm/firmware.h | 75 ++++++++++++++---------------
 1 file changed, 37 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index 00bc42d95679..7a5b0cc0bc85 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -14,46 +14,45 @@
 
 #ifdef __KERNEL__
 
-#include <asm/asm-const.h>
-
+#include <linux/bits.h>
 /* firmware feature bitmask values */
 
-#define FW_FEATURE_PFT		ASM_CONST(0x0000000000000001)
-#define FW_FEATURE_TCE		ASM_CONST(0x0000000000000002)
-#define FW_FEATURE_SPRG0	ASM_CONST(0x0000000000000004)
-#define FW_FEATURE_DABR		ASM_CONST(0x0000000000000008)
-#define FW_FEATURE_COPY		ASM_CONST(0x0000000000000010)
-#define FW_FEATURE_ASR		ASM_CONST(0x0000000000000020)
-#define FW_FEATURE_DEBUG	ASM_CONST(0x0000000000000040)
-#define FW_FEATURE_TERM		ASM_CONST(0x0000000000000080)
-#define FW_FEATURE_PERF		ASM_CONST(0x0000000000000100)
-#define FW_FEATURE_DUMP		ASM_CONST(0x0000000000000200)
-#define FW_FEATURE_INTERRUPT	ASM_CONST(0x0000000000000400)
-#define FW_FEATURE_MIGRATE	ASM_CONST(0x0000000000000800)
-#define FW_FEATURE_PERFMON	ASM_CONST(0x0000000000001000)
-#define FW_FEATURE_CRQ		ASM_CONST(0x0000000000002000)
-#define FW_FEATURE_VIO		ASM_CONST(0x0000000000004000)
-#define FW_FEATURE_RDMA		ASM_CONST(0x0000000000008000)
-#define FW_FEATURE_LLAN		ASM_CONST(0x0000000000010000)
-#define FW_FEATURE_BULK_REMOVE	ASM_CONST(0x0000000000020000)
-#define FW_FEATURE_XDABR	ASM_CONST(0x0000000000040000)
-#define FW_FEATURE_MULTITCE	ASM_CONST(0x0000000000080000)
-#define FW_FEATURE_SPLPAR	ASM_CONST(0x0000000000100000)
-#define FW_FEATURE_LPAR		ASM_CONST(0x0000000000400000)
-#define FW_FEATURE_PS3_LV1	ASM_CONST(0x0000000000800000)
-#define FW_FEATURE_HPT_RESIZE	ASM_CONST(0x0000000001000000)
-#define FW_FEATURE_CMO		ASM_CONST(0x0000000002000000)
-#define FW_FEATURE_VPHN		ASM_CONST(0x0000000004000000)
-#define FW_FEATURE_XCMO		ASM_CONST(0x0000000008000000)
-#define FW_FEATURE_OPAL		ASM_CONST(0x0000000010000000)
-#define FW_FEATURE_SET_MODE	ASM_CONST(0x0000000040000000)
-#define FW_FEATURE_BEST_ENERGY	ASM_CONST(0x0000000080000000)
-#define FW_FEATURE_TYPE1_AFFINITY ASM_CONST(0x0000000100000000)
-#define FW_FEATURE_PRRN		ASM_CONST(0x0000000200000000)
-#define FW_FEATURE_DRMEM_V2	ASM_CONST(0x0000000400000000)
-#define FW_FEATURE_DRC_INFO	ASM_CONST(0x0000000800000000)
-#define FW_FEATURE_BLOCK_REMOVE ASM_CONST(0x0000001000000000)
-#define FW_FEATURE_PAPR_SCM 	ASM_CONST(0x0000002000000000)
+#define FW_FEATURE_PFT		BIT(0)
+#define FW_FEATURE_TCE		BIT(1)
+#define FW_FEATURE_SPRG0		BIT(2)
+#define FW_FEATURE_DABR		BIT(3)
+#define FW_FEATURE_COPY		BIT(4)
+#define FW_FEATURE_ASR		BIT(5)
+#define FW_FEATURE_DEBUG		BIT(6)
+#define FW_FEATURE_TERM		BIT(7)
+#define FW_FEATURE_PERF		BIT(8)
+#define FW_FEATURE_DUMP		BIT(9)
+#define FW_FEATURE_INTERRUPT	BIT(10)
+#define FW_FEATURE_MIGRATE	BIT(11)
+#define FW_FEATURE_PERFMON	BIT(12)
+#define FW_FEATURE_CRQ		BIT(13)
+#define FW_FEATURE_VIO		BIT(14)
+#define FW_FEATURE_RDMA		BIT(15)
+#define FW_FEATURE_LLAN		BIT(16)
+#define FW_FEATURE_BULK_REMOVE	BIT(17)
+#define FW_FEATURE_XDABR		BIT(18)
+#define FW_FEATURE_MULTITCE	BIT(19)
+#define FW_FEATURE_SPLPAR	BIT(20)
+#define FW_FEATURE_LPAR		BIT(22)
+#define FW_FEATURE_PS3_LV1	BIT(23)
+#define FW_FEATURE_HPT_RESIZE	BIT(24)
+#define FW_FEATURE_CMO		BIT(25)
+#define FW_FEATURE_VPHN		BIT(26)
+#define FW_FEATURE_XCMO		BIT(27)
+#define FW_FEATURE_OPAL		BIT(28)
+#define FW_FEATURE_SET_MODE	BIT(30)
+#define FW_FEATURE_BEST_ENERGY	BIT(31)
+#define FW_FEATURE_TYPE1_AFFINITY BIT(32)
+#define FW_FEATURE_PRRN		BIT(33)
+#define FW_FEATURE_DRMEM_V2	BIT(34)
+#define FW_FEATURE_DRC_INFO	BIT(35)
+#define FW_FEATURE_BLOCK_REMOVE	BIT(36)
+#define FW_FEATURE_PAPR_SCM	BIT(37)
 
 #ifndef __ASSEMBLY__
 
-- 
2.17.1

