Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB957231872
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 06:18:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGgJp3LDyzDqtv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 14:18:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGgH70ywtzDqst
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 14:17:06 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06T42Xav007157; Wed, 29 Jul 2020 00:17:02 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jj2juk71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 00:17:01 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06T4BmoZ013315;
 Wed, 29 Jul 2020 04:16:59 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 32jgvprt8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 04:16:59 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06T4Gvkm30277902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 04:16:57 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1EBD4C046;
 Wed, 29 Jul 2020 04:16:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E65E14C040;
 Wed, 29 Jul 2020 04:16:55 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.79.210.172])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jul 2020 04:16:55 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc: Fix MMCRA_BHRB_DISABLE define to work with binutils
 version < 2.28
Date: Wed, 29 Jul 2020 00:16:54 -0400
Message-Id: <1595996214-5833-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_01:2020-07-28,
 2020-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0
 clxscore=1015 mlxlogscore=724 suspectscore=1 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007290025
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit 9908c826d5ed ("powerpc/perf: Add Power10 PMU feature to
DT CPU features") defines MMCRA_BHRB_DISABLE as `0x2000000000UL`.
Binutils version less than 2.28 doesn't support UL suffix.

linux-ppc/arch/powerpc/kernel/cpu_setup_power.S: Assembler messages:
linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: found 'L', expected: ')'
linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: junk at end of line, first unrecognized character is `L'
linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: found 'L', expected: ')'
linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: found 'L', expected: ')'
linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: junk at end of line, first unrecognized character is `L'
linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: found 'L', expected: ')'
linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: found 'L', expected: ')'
linux-ppc/arch/powerpc/kernel/cpu_setup_power.S:250: Error: operand out of range (0x0000002000000000 is not between 0xffffffffffff8000 and 0x000000000000ffff)

Fix this by wrapping it around `_UL` macro.

Fixes: 9908c826d5ed ("Add Power10 PMU feature to DT CPU features")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/reg.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index ae71027..41419f1 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -12,6 +12,7 @@
 #ifdef __KERNEL__
 
 #include <linux/stringify.h>
+#include <linux/const.h>
 #include <asm/cputable.h>
 #include <asm/asm-const.h>
 #include <asm/feature-fixups.h>
@@ -888,7 +889,7 @@
 #define   MMCRA_SLOT	0x07000000UL /* SLOT bits (37-39) */
 #define   MMCRA_SLOT_SHIFT	24
 #define   MMCRA_SAMPLE_ENABLE 0x00000001UL /* enable sampling */
-#define   MMCRA_BHRB_DISABLE  0x2000000000UL // BHRB disable bit for ISA v3.1
+#define   MMCRA_BHRB_DISABLE  _UL(0x2000000000) // BHRB disable bit for ISA v3.1
 #define   POWER6_MMCRA_SDSYNC 0x0000080000000000ULL	/* SDAR/SIAR synced */
 #define   POWER6_MMCRA_SIHV   0x0000040000000000ULL
 #define   POWER6_MMCRA_SIPR   0x0000020000000000ULL
-- 
1.8.3.1

