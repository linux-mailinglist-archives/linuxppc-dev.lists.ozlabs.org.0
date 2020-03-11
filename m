Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7DD1815BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 11:26:30 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cp5v2fJ1zDqNj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 21:26:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cp4f53h3zDqDX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 21:25:22 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02BAJwSC105942
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 06:25:16 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ypsx5vd19-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 06:25:13 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Wed, 11 Mar 2020 10:25:01 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Mar 2020 10:24:58 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02BAOu9Q57934034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 10:24:56 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD56952059;
 Wed, 11 Mar 2020 10:24:56 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.150])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3825D52054;
 Wed, 11 Mar 2020 10:24:55 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc test_emulate_step: fix DS operand in ld encoding
 to appropriate value
Date: Wed, 11 Mar 2020 15:54:05 +0530
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031110-0012-0000-0000-0000038F5656
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031110-0013-0000-0000-000021CC2469
Message-Id: <20200311102405.392263-1-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_02:2020-03-11,
 2020-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=399
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 phishscore=0 impostorscore=0 suspectscore=1 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003110066
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com,
 Balamuruhan S <bala24@linux.ibm.com>, paulus@samba.org, sandipan@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ld instruction should have 14 bit immediate field (DS) concatenated with
0b00 on the right, encode it accordingly. Introduce macro `IMM_DS()`
to encode DS form instructions with 14 bit immediate field.

Fixes: 4ceae137bdab ("powerpc: emulate_step() tests for load/store instructions")
Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/lib/test_emulate_step.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
---
changes in v2:
-------------
	* squash the commits as per Christophe's review comment

diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 42347067739c..007292a1ad01 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -13,19 +13,20 @@
 #include <asm/code-patching.h>
 
 #define IMM_L(i)		((uintptr_t)(i) & 0xffff)
+#define IMM_DS(i)		((uintptr_t)(i) & 0xfffc)
 
 /*
  * Defined with TEST_ prefix so it does not conflict with other
  * definitions.
  */
 #define TEST_LD(r, base, i)	(PPC_INST_LD | ___PPC_RT(r) |		\
-					___PPC_RA(base) | IMM_L(i))
+					___PPC_RA(base) | IMM_DS(i))
 #define TEST_LWZ(r, base, i)	(PPC_INST_LWZ | ___PPC_RT(r) |		\
 					___PPC_RA(base) | IMM_L(i))
 #define TEST_LWZX(t, a, b)	(PPC_INST_LWZX | ___PPC_RT(t) |		\
 					___PPC_RA(a) | ___PPC_RB(b))
 #define TEST_STD(r, base, i)	(PPC_INST_STD | ___PPC_RS(r) |		\
-					___PPC_RA(base) | ((i) & 0xfffc))
+					___PPC_RA(base) | IMM_DS(i))
 #define TEST_LDARX(t, a, b, eh)	(PPC_INST_LDARX | ___PPC_RT(t) |	\
 					___PPC_RA(a) | ___PPC_RB(b) |	\
 					__PPC_EH(eh))

base-commit: 5aa19adac1f3152a5fd3b865a1ab46bb845d3696
-- 
2.24.1

