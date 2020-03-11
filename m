Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5068B181092
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 07:22:20 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48chh83MHWzDqN9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 17:22:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48chfm5YHxzDqDS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 17:21:04 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02B65dc0048853
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 02:14:46 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yps39c02q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 02:14:46 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Wed, 11 Mar 2020 06:14:44 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Mar 2020 06:14:40 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02B6EdtT56819858
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 06:14:39 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B45942052;
 Wed, 11 Mar 2020 06:14:39 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9351A4204C;
 Wed, 11 Mar 2020 06:14:37 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.150])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Mar 2020 06:14:37 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/2] powerpc test_emulate_step: add macro for 14 bit immediate
 field
Date: Wed, 11 Mar 2020 11:44:17 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200311061417.384629-1-bala24@linux.ibm.com>
References: <20200311061417.384629-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031106-0028-0000-0000-000003E2F7DE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031106-0029-0000-0000-000024A83B0A
Message-Id: <20200311061417.384629-2-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_01:2020-03-10,
 2020-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=367 adultscore=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=1 impostorscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003110038
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

introduce macro `IMM_DS()` to encode DS form instructions with
14 bit immediate field.

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/lib/test_emulate_step.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 51c254fd15b5..007292a1ad01 100644
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
-					___PPC_RA(base) | ((i) & 0xfffc))
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
-- 
2.24.1

