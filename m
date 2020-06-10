Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 089B61F4E31
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 08:29:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hcXJ0ffDzDqWn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 16:29:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hcQS29QQzDqLY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 16:24:16 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05A6J3O6066294; Wed, 10 Jun 2020 02:24:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31jt5503dy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 02:24:07 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05A6Jeje071955;
 Wed, 10 Jun 2020 02:24:07 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31jt5503dm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 02:24:07 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05A6Kl5v020543;
 Wed, 10 Jun 2020 06:24:06 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 31jqyk9cuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 06:24:06 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05A6O5Jg43057492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jun 2020 06:24:05 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39B57AC064;
 Wed, 10 Jun 2020 06:24:05 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55206AC05B;
 Wed, 10 Jun 2020 06:24:02 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.58.158])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jun 2020 06:24:01 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 linux-nvdimm@lists.01.org, dan.j.williams@intel.com
Subject: [PATCH v5 02/10] powerpc/pmem: Add new instructions for persistent
 storage and sync
Date: Wed, 10 Jun 2020 11:53:35 +0530
Message-Id: <20200610062343.492293-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610062343.492293-1-aneesh.kumar@linux.ibm.com>
References: <20200610062343.492293-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-10_02:2020-06-10,
 2020-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 cotscore=-2147483648 mlxscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006100046
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
Cc: Jan Kara <jack@suse.cz>, Jeff Moyer <jmoyer@redhat.com>, msuchanek@suse.de,
 oohall@gmail.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

POWER10 introduces two new variants of dcbf instructions (dcbstps and dcbfps)
that can be used to write modified locations back to persistent storage.

Additionally, POWER10 also introduce phwsync and plwsync which can be used
to establish order of these writes to persistent storage.

This patch exposes these instructions to the rest of the kernel. The existing
dcbf and hwsync instructions in P8 and P9 are adequate to enable appropriate
synchronization with OpenCAPI-hosted persistent storage. Hence the new
instructions are added as a variant of the old ones that old hardware
won't differentiate.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 2a39c716c343..1ad014e4633e 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -219,6 +219,8 @@
 #define PPC_INST_STWCX			0x7c00012d
 #define PPC_INST_LWSYNC			0x7c2004ac
 #define PPC_INST_SYNC			0x7c0004ac
+#define PPC_INST_PHWSYNC		0x7c8004ac
+#define PPC_INST_PLWSYNC		0x7ca004ac
 #define PPC_INST_SYNC_MASK		0xfc0007fe
 #define PPC_INST_ISYNC			0x4c00012c
 #define PPC_INST_LXVD2X			0x7c000698
@@ -284,6 +286,8 @@
 #define PPC_INST_TABORT			0x7c00071d
 #define PPC_INST_TSR			0x7c0005dd
 
+#define PPC_INST_DCBF			0x7c0000ac
+
 #define PPC_INST_NAP			0x4c000364
 #define PPC_INST_SLEEP			0x4c0003a4
 #define PPC_INST_WINKLE			0x4c0003e4
@@ -532,6 +536,14 @@
 #define STBCIX(s,a,b)		stringify_in_c(.long PPC_INST_STBCIX | \
 				       __PPC_RS(s) | __PPC_RA(a) | __PPC_RB(b))
 
+#define	PPC_DCBFPS(a, b)	stringify_in_c(.long PPC_INST_DCBF |	\
+				       ___PPC_RA(a) | ___PPC_RB(b) | (4 << 21))
+#define	PPC_DCBSTPS(a, b)	stringify_in_c(.long PPC_INST_DCBF |	\
+				       ___PPC_RA(a) | ___PPC_RB(b) | (6 << 21))
+
+#define	PPC_PHWSYNC		stringify_in_c(.long PPC_INST_PHWSYNC)
+#define	PPC_PLWSYNC		stringify_in_c(.long PPC_INST_PLWSYNC)
+
 /*
  * Define what the VSX XX1 form instructions will look like, then add
  * the 128 bit load store instructions based on that.
-- 
2.26.2

