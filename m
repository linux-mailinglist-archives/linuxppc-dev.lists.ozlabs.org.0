Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCC91B6ED7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 09:22:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497lx13HwpzDqMT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 17:22:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 497lfS1j55zDrBl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 17:09:35 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03O71q3V122605
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 03:09:33 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30k3xvbg44-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 03:09:32 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Fri, 24 Apr 2020 08:08:43 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 24 Apr 2020 08:08:39 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03O79QX355967846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 07:09:26 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EE90A4051;
 Fri, 24 Apr 2020 07:09:26 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D9E2A4040;
 Fri, 24 Apr 2020 07:09:24 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.95.110])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Apr 2020 07:09:24 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [RFC PATCH v2 6/7] powerpc/ppc-opcode: fold PPC_INST_* macros into
 PPC_RAW_* macros
Date: Fri, 24 Apr 2020 12:38:52 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200424070853.443969-1-bala24@linux.ibm.com>
References: <20200424070853.443969-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20042407-4275-0000-0000-000003C5A211
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042407-4276-0000-0000-000038DB2EEF
Message-Id: <20200424070853.443969-7-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_02:2020-04-23,
 2020-04-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=633 lowpriorityscore=0 suspectscore=1
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240048
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

Lot of PPC_INST_* macros are used only ever in PPC_* macros, fold those
PPC_INST_* into PPC_RAW_* to avoid using PPC_INST_* accidentally.

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h | 381 +++++++++-----------------
 1 file changed, 125 insertions(+), 256 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 34584df0ebc4..1ffdd0e69e77 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -205,56 +205,27 @@
 #define OP_LQ    56
 
 /* sorted alphabetically */
-#define PPC_INST_BHRBE			0x7c00025c
-#define PPC_INST_CLRBHRB		0x7c00035c
 #define PPC_INST_COPY			0x7c20060c
-#define PPC_INST_CP_ABORT		0x7c00068c
-#define PPC_INST_DARN			0x7c0005e6
 #define PPC_INST_DCBA			0x7c0005ec
 #define PPC_INST_DCBA_MASK		0xfc0007fe
-#define PPC_INST_DCBAL			0x7c2005ec
-#define PPC_INST_DCBZL			0x7c2007ec
-#define PPC_INST_ICBT			0x7c00002c
-#define PPC_INST_ICSWX			0x7c00032d
-#define PPC_INST_ICSWEPX		0x7c00076d
 #define PPC_INST_ISEL			0x7c00001e
 #define PPC_INST_ISEL_MASK		0xfc00003e
-#define PPC_INST_LDARX			0x7c0000a8
-#define PPC_INST_STDCX			0x7c0001ad
-#define PPC_INST_LQARX			0x7c000228
-#define PPC_INST_STQCX			0x7c00016d
 #define PPC_INST_LSWI			0x7c0004aa
 #define PPC_INST_LSWX			0x7c00042a
-#define PPC_INST_LWARX			0x7c000028
-#define PPC_INST_STWCX			0x7c00012d
 #define PPC_INST_LWSYNC			0x7c2004ac
 #define PPC_INST_SYNC			0x7c0004ac
 #define PPC_INST_SYNC_MASK		0xfc0007fe
 #define PPC_INST_ISYNC			0x4c00012c
-#define PPC_INST_LXVD2X			0x7c000698
 #define PPC_INST_MCRXR			0x7c000400
 #define PPC_INST_MCRXR_MASK		0xfc0007fe
 #define PPC_INST_MFSPR_PVR		0x7c1f42a6
 #define PPC_INST_MFSPR_PVR_MASK		0xfc1ffffe
-#define PPC_INST_MFTMR			0x7c0002dc
-#define PPC_INST_MSGSND			0x7c00019c
-#define PPC_INST_MSGCLR			0x7c0001dc
-#define PPC_INST_MSGSYNC		0x7c0006ec
-#define PPC_INST_MSGSNDP		0x7c00011c
-#define PPC_INST_MSGCLRP		0x7c00015c
 #define PPC_INST_MTMSRD			0x7c000164
-#define PPC_INST_MTTMR			0x7c0003dc
 #define PPC_INST_NOP			0x60000000
-#define PPC_INST_PASTE			0x7c20070d
 #define PPC_INST_POPCNTB		0x7c0000f4
 #define PPC_INST_POPCNTB_MASK		0xfc0007fe
-#define PPC_INST_POPCNTD		0x7c0003f4
-#define PPC_INST_POPCNTW		0x7c0002f4
 #define PPC_INST_RFEBB			0x4c000124
-#define PPC_INST_RFCI			0x4c000066
-#define PPC_INST_RFDI			0x4c00004e
 #define PPC_INST_RFID			0x4c000024
-#define PPC_INST_RFMCI			0x4c00004c
 #define PPC_INST_MFSPR			0x7c0002a6
 #define PPC_INST_MFSPR_DSCR		0x7c1102a6
 #define PPC_INST_MFSPR_DSCR_MASK	0xfc1ffffe
@@ -264,131 +235,30 @@
 #define PPC_INST_MFSPR_DSCR_USER_MASK	0xfc1ffffe
 #define PPC_INST_MTSPR_DSCR_USER	0x7c0303a6
 #define PPC_INST_MTSPR_DSCR_USER_MASK	0xfc1ffffe
-#define PPC_INST_MFVSRD			0x7c000066
-#define PPC_INST_MTVSRD			0x7c000166
 #define PPC_INST_SC			0x44000002
-#define PPC_INST_SLBFEE			0x7c0007a7
-#define PPC_INST_SLBIA			0x7c0003e4
-
 #define PPC_INST_STRING			0x7c00042a
 #define PPC_INST_STRING_MASK		0xfc0007fe
 #define PPC_INST_STRING_GEN_MASK	0xfc00067e
-
 #define PPC_INST_STSWI			0x7c0005aa
 #define PPC_INST_STSWX			0x7c00052a
-#define PPC_INST_STXVD2X		0x7c000798
-#define PPC_INST_TLBIE			0x7c000264
-#define PPC_INST_TLBIEL			0x7c000224
-#define PPC_INST_TLBILX			0x7c000024
-#define PPC_INST_WAIT			0x7c00007c
-#define PPC_INST_TLBIVAX		0x7c000624
-#define PPC_INST_TLBSRX_DOT		0x7c0006a5
-#define PPC_INST_VPMSUMW		0x10000488
-#define PPC_INST_VPMSUMD		0x100004c8
-#define PPC_INST_VPERMXOR		0x1000002d
-#define PPC_INST_XXLOR			0xf0000490
-#define PPC_INST_XXSWAPD		0xf0000250
-#define PPC_INST_XVCPSGNDP		0xf0000780
 #define PPC_INST_TRECHKPT		0x7c0007dd
 #define PPC_INST_TRECLAIM		0x7c00075d
-#define PPC_INST_TABORT			0x7c00071d
 #define PPC_INST_TSR			0x7c0005dd
-
-#define PPC_INST_NAP			0x4c000364
-#define PPC_INST_SLEEP			0x4c0003a4
-#define PPC_INST_WINKLE			0x4c0003e4
-
-#define PPC_INST_STOP			0x4c0002e4
-
-/* A2 specific instructions */
-#define PPC_INST_ERATWE			0x7c0001a6
-#define PPC_INST_ERATRE			0x7c000166
-#define PPC_INST_ERATILX		0x7c000066
-#define PPC_INST_ERATIVAX		0x7c000666
-#define PPC_INST_ERATSX			0x7c000126
-#define PPC_INST_ERATSX_DOT		0x7c000127
-
-/* Misc instructions for BPF compiler */
-#define PPC_INST_LBZ			0x88000000
 #define PPC_INST_LD			0xe8000000
-#define PPC_INST_LDX			0x7c00002a
-#define PPC_INST_LHZ			0xa0000000
-#define PPC_INST_LWZ			0x80000000
-#define PPC_INST_LHBRX			0x7c00062c
-#define PPC_INST_LDBRX			0x7c000428
-#define PPC_INST_STB			0x98000000
-#define PPC_INST_STH			0xb0000000
 #define PPC_INST_STD			0xf8000000
-#define PPC_INST_STDX			0x7c00012a
-#define PPC_INST_STDU			0xf8000001
-#define PPC_INST_STW			0x90000000
-#define PPC_INST_STWU			0x94000000
 #define PPC_INST_MFLR			0x7c0802a6
-#define PPC_INST_MTLR			0x7c0803a6
 #define PPC_INST_MTCTR			0x7c0903a6
-#define PPC_INST_CMPWI			0x2c000000
-#define PPC_INST_CMPDI			0x2c200000
-#define PPC_INST_CMPW			0x7c000000
-#define PPC_INST_CMPD			0x7c200000
-#define PPC_INST_CMPLW			0x7c000040
-#define PPC_INST_CMPLD			0x7c200040
-#define PPC_INST_CMPLWI			0x28000000
-#define PPC_INST_CMPLDI			0x28200000
 #define PPC_INST_ADDI			0x38000000
 #define PPC_INST_ADDIS			0x3c000000
 #define PPC_INST_ADD			0x7c000214
-#define PPC_INST_ADDC			0x7c000014
-#define PPC_INST_SUB			0x7c000050
 #define PPC_INST_BLR			0x4e800020
-#define PPC_INST_BLRL			0x4e800021
 #define PPC_INST_BCTR			0x4e800420
-#define PPC_INST_MULLD			0x7c0001d2
-#define PPC_INST_MULLW			0x7c0001d6
-#define PPC_INST_MULHWU			0x7c000016
-#define PPC_INST_MULLI			0x1c000000
-#define PPC_INST_MADDHD			0x10000030
-#define PPC_INST_MADDHDU		0x10000031
-#define PPC_INST_MADDLD			0x10000033
-#define PPC_INST_DIVWU			0x7c000396
 #define PPC_INST_DIVD			0x7c0003d2
-#define PPC_INST_DIVDU			0x7c000392
-#define PPC_INST_RLWINM			0x54000000
-#define PPC_INST_RLWINM_DOT		0x54000001
-#define PPC_INST_RLWIMI			0x50000000
-#define PPC_INST_RLDICL			0x78000000
 #define PPC_INST_RLDICR			0x78000004
-#define PPC_INST_SLW			0x7c000030
-#define PPC_INST_SLD			0x7c000036
-#define PPC_INST_SRW			0x7c000430
-#define PPC_INST_SRAW			0x7c000630
-#define PPC_INST_SRAWI			0x7c000670
-#define PPC_INST_SRD			0x7c000436
-#define PPC_INST_SRAD			0x7c000634
-#define PPC_INST_SRADI			0x7c000674
-#define PPC_INST_AND			0x7c000038
-#define PPC_INST_ANDDOT			0x7c000039
-#define PPC_INST_OR			0x7c000378
-#define PPC_INST_XOR			0x7c000278
-#define PPC_INST_ANDI			0x70000000
 #define PPC_INST_ORI			0x60000000
 #define PPC_INST_ORIS			0x64000000
-#define PPC_INST_XORI			0x68000000
-#define PPC_INST_XORIS			0x6c000000
-#define PPC_INST_NEG			0x7c0000d0
-#define PPC_INST_EXTSW			0x7c0007b4
 #define PPC_INST_BRANCH			0x48000000
 #define PPC_INST_BRANCH_COND		0x40800000
-#define PPC_INST_LBZCIX			0x7c0006aa
-#define PPC_INST_STBCIX			0x7c0007aa
-#define PPC_INST_LWZX			0x7c00002e
-#define PPC_INST_LFSX			0x7c00042e
-#define PPC_INST_STFSX			0x7c00052e
-#define PPC_INST_LFDX			0x7c0004ae
-#define PPC_INST_STFDX			0x7c0005ae
-#define PPC_INST_LVX			0x7c0000ce
-#define PPC_INST_STVX			0x7c0001ce
-#define PPC_INST_VCMPEQUD		0x100000c7
-#define PPC_INST_VCMPEQUB		0x10000006
 
 /* macros to insert fields into opcodes */
 #define ___PPC_RA(a)	(((a) & 0x1f) << 16)
@@ -442,107 +312,107 @@
 #endif
 
 /* Base instruction encoding */
-#define PPC_RAW_CP_ABORT		(PPC_INST_CP_ABORT)
+#define PPC_RAW_CP_ABORT		(0x7c00068c)
 #define PPC_RAW_COPY(a, b)		(PPC_INST_COPY | ___PPC_RA(a) | \
 						___PPC_RB(b))
-#define PPC_RAW_DARN(t, l)		(PPC_INST_DARN | ___PPC_RT(t) | \
+#define PPC_RAW_DARN(t, l)		(0x7c0005e6 | ___PPC_RT(t) | \
 						(((l) & 0x3) << 16))
-#define PPC_RAW_DCBAL(a, b)		(PPC_INST_DCBAL | __PPC_RA(a) | \
+#define PPC_RAW_DCBAL(a, b)		(0x7c2005ec | __PPC_RA(a) | \
 						__PPC_RB(b))
-#define PPC_RAW_DCBZL(a, b)		(PPC_INST_DCBZL | __PPC_RA(a) | \
+#define PPC_RAW_DCBZL(a, b)		(0x7c2007ec | __PPC_RA(a) | \
 						__PPC_RB(b))
-#define PPC_RAW_LQARX(t, a, b, eh)	(PPC_INST_LQARX | ___PPC_RT(t) | \
+#define PPC_RAW_LQARX(t, a, b, eh)	(0x7c000228 | ___PPC_RT(t) | \
 						___PPC_RA(a) | \
 						___PPC_RB(b) | __PPC_EH(eh))
-#define PPC_RAW_LDARX(t, a, b, eh)	(PPC_INST_LDARX | ___PPC_RT(t) | \
+#define PPC_RAW_LDARX(t, a, b, eh)	(0x7c0000a8 | ___PPC_RT(t) | \
 						___PPC_RA(a) | \
 						___PPC_RB(b) | __PPC_EH(eh))
-#define PPC_RAW_LWARX(t, a, b, eh)	(PPC_INST_LWARX | \
+#define PPC_RAW_LWARX(t, a, b, eh)	(0x7c000028 | \
 						___PPC_RT(t) | ___PPC_RA(a) | \
 						___PPC_RB(b) | __PPC_EH(eh))
-#define PPC_RAW_STQCX(t, a, b)		(PPC_INST_STQCX | \
+#define PPC_RAW_STQCX(t, a, b)		(0x7c00016d | \
 						___PPC_RT(t) | ___PPC_RA(a) | \
 						___PPC_RB(b))
-#define PPC_RAW_MADDHD(t, a, b, c)	(PPC_INST_MADDHD | \
+#define PPC_RAW_MADDHD(t, a, b, c)	(0x10000030 | \
 						___PPC_RT(t) | ___PPC_RA(a) | \
 						___PPC_RB(b) | ___PPC_RC(c))
-#define PPC_RAW_MADDHDU(t, a, b, c)	(PPC_INST_MADDHDU | \
+#define PPC_RAW_MADDHDU(t, a, b, c)	(0x10000031 | \
 						___PPC_RT(t) | ___PPC_RA(a) | \
 						___PPC_RB(b) | ___PPC_RC(c))
-#define PPC_RAW_MADDLD(t, a, b, c)	(PPC_INST_MADDLD | \
+#define PPC_RAW_MADDLD(t, a, b, c)	(0x10000033 | \
 						___PPC_RT(t) | ___PPC_RA(a) | \
 						___PPC_RB(b) | ___PPC_RC(c))
-#define PPC_RAW_MSGSND(b)		(PPC_INST_MSGSND | ___PPC_RB(b))
-#define PPC_RAW_MSGSYNC			(PPC_INST_MSGSYNC)
-#define PPC_RAW_MSGCLR(b)		(PPC_INST_MSGCLR | ___PPC_RB(b))
-#define PPC_RAW_MSGSNDP(b)		(PPC_INST_MSGSNDP | ___PPC_RB(b))
-#define PPC_RAW_MSGCLRP(b)		(PPC_INST_MSGCLRP | ___PPC_RB(b))
-#define PPC_RAW_PASTE(a, b)		(PPC_INST_PASTE | ___PPC_RA(a) | \
+#define PPC_RAW_MSGSND(b)		(0x7c00019c | ___PPC_RB(b))
+#define PPC_RAW_MSGSYNC			(0x7c0006ec)
+#define PPC_RAW_MSGCLR(b)		(0x7c0001dc | ___PPC_RB(b))
+#define PPC_RAW_MSGSNDP(b)		(0x7c00011c | ___PPC_RB(b))
+#define PPC_RAW_MSGCLRP(b)		(0x7c00015c | ___PPC_RB(b))
+#define PPC_RAW_PASTE(a, b)		(0x7c20070d | ___PPC_RA(a) | \
 						___PPC_RB(b))
 #define PPC_RAW_POPCNTB(a, s)		(PPC_INST_POPCNTB | __PPC_RA(a) | \
 						__PPC_RS(s))
-#define PPC_RAW_POPCNTD(a, s)		(PPC_INST_POPCNTD | __PPC_RA(a) | \
+#define PPC_RAW_POPCNTD(a, s)		(0x7c0003f4 | __PPC_RA(a) | \
 						__PPC_RS(s))
-#define PPC_RAW_POPCNTW(a, s)		(PPC_INST_POPCNTW | __PPC_RA(a) | \
+#define PPC_RAW_POPCNTW(a, s)		(0x7c0002f4 | __PPC_RA(a) | \
 						__PPC_RS(s))
-#define PPC_RAW_RFCI			(PPC_INST_RFCI)
-#define PPC_RAW_RFDI			(PPC_INST_RFDI)
-#define PPC_RAW_RFMCI			(PPC_INST_RFMCI)
-#define PPC_RAW_TLBILX(t, a, b)		(PPC_INST_TLBILX | \
+#define PPC_RAW_RFCI			(0x4c000066)
+#define PPC_RAW_RFDI			(0x4c00004e)
+#define PPC_RAW_RFMCI			(0x4c00004c)
+#define PPC_RAW_TLBILX(t, a, b)		(0x7c000024 | \
 						__PPC_T_TLB(t) | \
 						__PPC_RA0(a) | \
 						__PPC_RB(b))
-#define PPC_RAW_WAIT(w)			(PPC_INST_WAIT | __PPC_WC(w))
-#define PPC_RAW_TLBIE(lp, a)		(PPC_INST_TLBIE | ___PPC_RB(a) | \
+#define PPC_RAW_WAIT(w)			(0x7c00007c | __PPC_WC(w))
+#define PPC_RAW_TLBIE(lp, a)		(0x7c000264 | ___PPC_RB(a) | \
 						___PPC_RS(lp))
 #define PPC_RAW_TLBIE_5(rb, rs, ric, prs, r) \
-					(PPC_INST_TLBIE | \
+					(0x7c000264 | \
 						___PPC_RB(rb) | \
 						___PPC_RS(rs) | \
 						___PPC_RIC(ric) | \
 						___PPC_PRS(prs) | \
 						___PPC_R(r))
 #define PPC_RAW_TLBIEL(rb, rs, ric, prs, r) \
-					(PPC_INST_TLBIEL | \
+					(0x7c000224 | \
 						___PPC_RB(rb) | \
 						___PPC_RS(rs) | \
 						___PPC_RIC(ric) | \
 						___PPC_PRS(prs) | \
 						___PPC_R(r))
-#define PPC_RAW_TLBSRX_DOT(a, b)	(PPC_INST_TLBSRX_DOT | \
+#define PPC_RAW_TLBSRX_DOT(a, b)	(0x7c0006a5 | \
 						__PPC_RA0(a) | __PPC_RB(b))
-#define PPC_RAW_TLBIVAX(a, b)		(PPC_INST_TLBIVAX | \
+#define PPC_RAW_TLBIVAX(a, b)		(0x7c000624 | \
 						__PPC_RA0(a) | __PPC_RB(b))
-#define PPC_RAW_ERATWE(s, a, w)		(PPC_INST_ERATWE | \
+#define PPC_RAW_ERATWE(s, a, w)		(0x7c0001a6 | \
 						__PPC_RS(s) | __PPC_RA(a) | \
 						__PPC_WS(w))
-#define PPC_RAW_ERATRE(s, a, w)		(PPC_INST_ERATRE | \
+#define PPC_RAW_ERATRE(s, a, w)		(0x7c000166 | \
 						__PPC_RS(s) | __PPC_RA(a) | \
 						__PPC_WS(w))
-#define PPC_RAW_ERATILX(t, a, b)	(PPC_INST_ERATILX | \
+#define PPC_RAW_ERATILX(t, a, b)	(0x7c000066 | \
 						__PPC_T_TLB(t) | \
 						__PPC_RA0(a) | \
 						__PPC_RB(b))
-#define PPC_RAW_ERATIVAX(s, a, b)	(PPC_INST_ERATIVAX | \
+#define PPC_RAW_ERATIVAX(s, a, b)	(0x7c000666 | \
 						__PPC_RS(s) | __PPC_RA0(a) | \
 						__PPC_RB(b))
-#define PPC_RAW_ERATSX(t, a, w)		(PPC_INST_ERATSX | \
+#define PPC_RAW_ERATSX(t, a, w)		(0x7c000126 | \
 						__PPC_RS(t) | __PPC_RA0(a) | \
 						__PPC_RB(b))
-#define PPC_RAW_ERATSX_DOT(t, a, w)	(PPC_INST_ERATSX_DOT | \
+#define PPC_RAW_ERATSX_DOT(t, a, w)	(0x7c000127 | \
 						__PPC_RS(t) | __PPC_RA0(a) | \
 						__PPC_RB(b))
-#define PPC_RAW_SLBFEE_DOT(t, b)	(PPC_INST_SLBFEE | \
+#define PPC_RAW_SLBFEE_DOT(t, b)	(0x7c0007a7 | \
 						__PPC_RT(t) | __PPC_RB(b))
-#define __PPC_RAW_SLBFEE_DOT(t, b)	(PPC_INST_SLBFEE |      \
+#define __PPC_RAW_SLBFEE_DOT(t, b)	(0x7c0007a7 |      \
 						___PPC_RT(t) | ___PPC_RB(b))
-#define PPC_RAW_ICBT(c, a, b)		(PPC_INST_ICBT | \
+#define PPC_RAW_ICBT(c, a, b)		(0x7c00002c | \
 						__PPC_CT(c) | __PPC_RA0(a) | \
 						__PPC_RB(b))
-#define PPC_RAW_LBZCIX(t, a, b)		(PPC_INST_LBZCIX | \
+#define PPC_RAW_LBZCIX(t, a, b)		(0x7c0006aa | \
 						__PPC_RT(t) | __PPC_RA(a) | \
 						__PPC_RB(b))
-#define PPC_RAW_STBCIX(s, a, b)		(PPC_INST_STBCIX | \
+#define PPC_RAW_STBCIX(s, a, b)		(0x7c0007aa | \
 						__PPC_RS(s) | __PPC_RA(a) | \
 						__PPC_RB(b))
 /*
@@ -553,104 +423,103 @@
 						__PPC_RB(b))
 #define VSX_XX3(t, a, b)		(__PPC_XT(t) | __PPC_XA(a) | \
 						__PPC_XB(b))
-#define PPC_RAW_STXVD2X(s, a, b)	(PPC_INST_STXVD2X | \
+#define PPC_RAW_STXVD2X(s, a, b)	(0x7c000798 | \
 						VSX_XX1((s), a, b))
-#define PPC_RAW_LXVD2X(s, a, b)		(PPC_INST_LXVD2X | \
+#define PPC_RAW_LXVD2X(s, a, b)		(0x7c000698 | \
 						VSX_XX1((s), a, b))
-#define PPC_RAW_MFVRD(a, t)		(PPC_INST_MFVSRD | \
+#define PPC_RAW_MFVRD(a, t)		(0x7c000066 | \
 						VSX_XX1((t) + 32, a, R0))
-#define PPC_RAW_MTVRD(t, a)		(PPC_INST_MTVSRD | \
+#define PPC_RAW_MTVRD(t, a)		(0x7c000166 | \
 						VSX_XX1((t) + 32, a, R0))
-#define PPC_RAW_VPMSUMW(t, a, b)	(PPC_INST_VPMSUMW | \
+#define PPC_RAW_VPMSUMW(t, a, b)	(0x10000488 | \
 						VSX_XX3((t), a, b))
-#define PPC_RAW_VPMSUMD(t, a, b)	(PPC_INST_VPMSUMD | \
+#define PPC_RAW_VPMSUMD(t, a, b)	(0x100004c8 | \
 						VSX_XX3((t), a, b))
-#define PPC_RAW_XXLOR(t, a, b)		(PPC_INST_XXLOR | \
+#define PPC_RAW_XXLOR(t, a, b)		(0xf0000490 | \
 						VSX_XX3((t), a, b))
-#define PPC_RAW_XXSWAPD(t, a)		(PPC_INST_XXSWAPD | \
+#define PPC_RAW_XXSWAPD(t, a)		(0xf0000250 | \
 						VSX_XX3((t), a, a))
-#define PPC_RAW_XVCPSGNDP(t, a, b)	((PPC_INST_XVCPSGNDP | \
+#define PPC_RAW_XVCPSGNDP(t, a, b)	((0xf0000780 | \
 						VSX_XX3((t), (a), (b))))
 #define PPC_RAW_VPERMXOR(vrt, vra, vrb, vrc) \
-					((PPC_INST_VPERMXOR | \
+					((0x1000002d | \
 						___PPC_RT(vrt) | \
 						___PPC_RA(vra) | \
 						___PPC_RB(vrb) | \
 						(((vrc) & 0x1f) << 6)))
-#define PPC_RAW_NAP			(PPC_INST_NAP)
-#define PPC_RAW_SLEEP			(PPC_INST_SLEEP)
-#define PPC_RAW_WINKLE			(PPC_INST_WINKLE)
-#define PPC_RAW_STOP			(PPC_INST_STOP)
-#define PPC_RAW_CLRBHRB			(PPC_INST_CLRBHRB)
-#define PPC_RAW_MFBHRBE(r, n)		(PPC_INST_BHRBE | \
-						__PPC_RT(r) | \
+#define PPC_RAW_NAP			(0x4c000364)
+#define PPC_RAW_SLEEP			(0x4c0003a4)
+#define PPC_RAW_WINKLE			(0x4c0003e4)
+#define PPC_RAW_STOP			(0x4c0002e4)
+#define PPC_RAW_CLRBHRB			(0x7c00035c)
+#define PPC_RAW_MFBHRBE(r, n)		(0x7c00025c | __PPC_RT(r) | \
 						(((n) & 0x3ff) << 11))
 #define PPC_RAW_TRECHKPT		(PPC_INST_TRECHKPT)
 #define PPC_RAW_TRECLAIM(r)		(PPC_INST_TRECLAIM \
 						| __PPC_RA(r))
-#define PPC_RAW_TABORT(r)		(PPC_INST_TABORT \
+#define PPC_RAW_TABORT(r)		(0x7c00071d \
 						| __PPC_RA(r))
 #define TMRN(x)			((((x) & 0x1f) << 16) | (((x) & 0x3e0) << 6))
-#define PPC_RAW_MTTMR(tmr, r)		(PPC_INST_MTTMR | \
+#define PPC_RAW_MTTMR(tmr, r)		(0x7c0003dc | \
 						TMRN(tmr) | ___PPC_RS(r))
-#define PPC_RAW_MFTMR(tmr, r)		(PPC_INST_MFTMR | \
+#define PPC_RAW_MFTMR(tmr, r)		(0x7c0002dc | \
 						TMRN(tmr) | ___PPC_RT(r))
-#define PPC_RAW_ICSWX(s, a, b)		(PPC_INST_ICSWX | \
+#define PPC_RAW_ICSWX(s, a, b)		(0x7c00032d | \
 						___PPC_RS(s) | \
 						___PPC_RA(a) | \
 						___PPC_RB(b))
-#define PPC_RAW_ICSWEPX(s, a, b)	(PPC_INST_ICSWEPX | \
+#define PPC_RAW_ICSWEPX(s, a, b)	(0x7c00076d | \
 						___PPC_RS(s) | \
 						___PPC_RA(a) | \
 						___PPC_RB(b))
-#define PPC_RAW_SLBIA(IH)		(PPC_INST_SLBIA | \
+#define PPC_RAW_SLBIA(IH)		(0x7c0003e4 | \
 						(((IH) & 0x7) << 21))
 #define PPC_RAW_VCMPEQUD_RC(vrt, vra, vrb) \
-					(PPC_INST_VCMPEQUD | \
+					(0x100000c7 | \
 						___PPC_RT(vrt) | \
 						___PPC_RA(vra) | \
 						___PPC_RB(vrb) | __PPC_RC21)
 #define PPC_RAW_VCMPEQUB_RC(vrt, vra, vrb) \
-					(PPC_INST_VCMPEQUB | \
+					(0x10000006 | \
 						___PPC_RT(vrt) | \
 						___PPC_RA(vra) | \
 						___PPC_RB(vrb) | __PPC_RC21)
 #define PPC_RAW_LD(r, base, i)		(PPC_INST_LD | ___PPC_RT(r) | \
 						___PPC_RA(base) | IMM_DS(i))
-#define PPC_RAW_LWZ(r, base, i)		(PPC_INST_LWZ | ___PPC_RT(r) | \
+#define PPC_RAW_LWZ(r, base, i)		(0x80000000 | ___PPC_RT(r) | \
 						___PPC_RA(base) | IMM_L(i))
-#define PPC_RAW_LWZX(t, a, b)		(PPC_INST_LWZX | ___PPC_RT(t) | \
+#define PPC_RAW_LWZX(t, a, b)		(0x7c00002e | ___PPC_RT(t) | \
 						___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_STD(r, base, i)		(PPC_INST_STD | ___PPC_RS(r) | \
 						___PPC_RA(base) | IMM_DS(i))
-#define PPC_RAW_STDCX(s, a, b)		(PPC_INST_STDCX | ___PPC_RS(s) | \
+#define PPC_RAW_STDCX(s, a, b)		(0x7c0001ad | ___PPC_RS(s) | \
 						___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_RAW_LFSX(t, a, b)		(PPC_INST_LFSX | ___PPC_RT(t) | \
+#define PPC_RAW_LFSX(t, a, b)		(0x7c00042e | ___PPC_RT(t) | \
 						___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_RAW_STFSX(s, a, b)		(PPC_INST_STFSX | ___PPC_RS(s) | \
+#define PPC_RAW_STFSX(s, a, b)		(0x7c00052e | ___PPC_RS(s) | \
 						___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_RAW_LFDX(t, a, b)		(PPC_INST_LFDX | ___PPC_RT(t) | \
+#define PPC_RAW_LFDX(t, a, b)		(0x7c0004ae | ___PPC_RT(t) | \
 						___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_RAW_STFDX(s, a, b)		(PPC_INST_STFDX | ___PPC_RS(s) | \
+#define PPC_RAW_STFDX(s, a, b)		(0x7c0005ae | ___PPC_RS(s) | \
 						___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_RAW_LVX(t, a, b)		(PPC_INST_LVX | ___PPC_RT(t) | \
+#define PPC_RAW_LVX(t, a, b)		(0x7c0000ce | ___PPC_RT(t) | \
 						___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_RAW_STVX(s, a, b)		(PPC_INST_STVX | ___PPC_RS(s) | \
+#define PPC_RAW_STVX(s, a, b)		(0x7c0001ce | ___PPC_RS(s) | \
 						___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_ADD(t, a, b)		(PPC_INST_ADD | ___PPC_RT(t) | \
 						___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_ADD_DOT(t, a, b)	(PPC_INST_ADD | ___PPC_RT(t) | \
 						___PPC_RA(a) | ___PPC_RB(b) | \
 						0x1)
-#define PPC_RAW_ADDC(t, a, b)		(PPC_INST_ADDC | ___PPC_RT(t) | \
+#define PPC_RAW_ADDC(t, a, b)		(0x7c000014 | ___PPC_RT(t) | \
 						___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_RAW_ADDC_DOT(t, a, b)	(PPC_INST_ADDC | ___PPC_RT(t) | \
+#define PPC_RAW_ADDC_DOT(t, a, b)	(0x7c000014 | ___PPC_RT(t) | \
 						___PPC_RA(a) | ___PPC_RB(b) | \
 						0x1)
 #define PPC_RAW_NOP()			(PPC_INST_NOP)
 #define PPC_RAW_BLR()			(PPC_INST_BLR)
-#define PPC_RAW_BLRL()			(PPC_INST_BLRL)
-#define PPC_RAW_MTLR(r)			(PPC_INST_MTLR | ___PPC_RT(r))
+#define PPC_RAW_BLRL()			(0x4e800021)
+#define PPC_RAW_MTLR(r)			(0x7c0803a6 | ___PPC_RT(r))
 #define PPC_RAW_BCTR()			(PPC_INST_BCTR)
 #define PPC_RAW_MTCTR(r)		(PPC_INST_MTCTR | ___PPC_RT(r))
 #define PPC_RAW_ADDI(d, a, i)		(PPC_INST_ADDI | ___PPC_RT(d) | \
@@ -660,105 +529,105 @@
 						___PPC_RT(d) | ___PPC_RA(a) | \
 						IMM_L(i))
 #define PPC_RAW_LIS(r, i)		PPC_RAW_ADDIS(r, 0, i)
-#define PPC_RAW_STDX(r, base, b)	(PPC_INST_STDX | ___PPC_RS(r) | \
+#define PPC_RAW_STDX(r, base, b)	(0x7c00012a | ___PPC_RS(r) | \
 						___PPC_RA(base) | ___PPC_RB(b))
-#define PPC_RAW_STDU(r, base, i)	(PPC_INST_STDU | ___PPC_RS(r) | \
+#define PPC_RAW_STDU(r, base, i)	(0xf8000001 | ___PPC_RS(r) | \
 						___PPC_RA(base) | \
 						((i) & 0xfffc))
-#define PPC_RAW_STW(r, base, i)		(PPC_INST_STW | ___PPC_RS(r) | \
+#define PPC_RAW_STW(r, base, i)		(0x90000000 | ___PPC_RS(r) | \
 						___PPC_RA(base) | IMM_L(i))
-#define PPC_RAW_STWU(r, base, i)	(PPC_INST_STWU | ___PPC_RS(r) | \
+#define PPC_RAW_STWU(r, base, i)	(0x94000000 | ___PPC_RS(r) | \
 						___PPC_RA(base) | IMM_L(i))
-#define PPC_RAW_STH(r, base, i)		(PPC_INST_STH | ___PPC_RS(r) | \
+#define PPC_RAW_STH(r, base, i)		(0xb0000000 | ___PPC_RS(r) | \
 						___PPC_RA(base) | IMM_L(i))
-#define PPC_RAW_STB(r, base, i)		(PPC_INST_STB | ___PPC_RS(r) | \
+#define PPC_RAW_STB(r, base, i)		(0x98000000 | ___PPC_RS(r) | \
 						___PPC_RA(base) | IMM_L(i))
-#define PPC_RAW_LBZ(r, base, i)		(PPC_INST_LBZ | ___PPC_RT(r) | \
+#define PPC_RAW_LBZ(r, base, i)		(0x88000000 | ___PPC_RT(r) | \
 						___PPC_RA(base) | IMM_L(i))
-#define PPC_RAW_LDX(r, base, b)		(PPC_INST_LDX | ___PPC_RT(r) | \
+#define PPC_RAW_LDX(r, base, b)		(0x7c00002a | ___PPC_RT(r) | \
 						___PPC_RA(base) | ___PPC_RB(b))
-#define PPC_RAW_LHZ(r, base, i)		(PPC_INST_LHZ | ___PPC_RT(r) | \
+#define PPC_RAW_LHZ(r, base, i)		(0xa0000000 | ___PPC_RT(r) | \
 						___PPC_RA(base) | IMM_L(i))
-#define PPC_RAW_LHBRX(r, base, b)	(PPC_INST_LHBRX | ___PPC_RT(r) | \
+#define PPC_RAW_LHBRX(r, base, b)	(0x7c00062c | ___PPC_RT(r) | \
 						___PPC_RA(base) | ___PPC_RB(b))
-#define PPC_RAW_LDBRX(r, base, b)	(PPC_INST_LDBRX | ___PPC_RT(r) | \
+#define PPC_RAW_LDBRX(r, base, b)	(0x7c000428 | ___PPC_RT(r) | \
 						___PPC_RA(base) | ___PPC_RB(b))
-#define PPC_RAW_STWCX(s, a, b)		(PPC_INST_STWCX | ___PPC_RS(s) | \
+#define PPC_RAW_STWCX(s, a, b)		(0x7c00012d | ___PPC_RS(s) | \
 						___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_RAW_CMPWI(a, i)		(PPC_INST_CMPWI | ___PPC_RA(a) | IMM_L(i))
-#define PPC_RAW_CMPDI(a, i)		(PPC_INST_CMPDI | ___PPC_RA(a) | IMM_L(i))
-#define PPC_RAW_CMPW(a, b)		(PPC_INST_CMPW | ___PPC_RA(a) | \
+#define PPC_RAW_CMPWI(a, i)		(0x2c000000 | ___PPC_RA(a) | IMM_L(i))
+#define PPC_RAW_CMPDI(a, i)		(0x2c200000 | ___PPC_RA(a) | IMM_L(i))
+#define PPC_RAW_CMPW(a, b)		(0x7c000000 | ___PPC_RA(a) | \
 		                                ___PPC_RB(b))
-#define PPC_RAW_CMPD(a, b)		(PPC_INST_CMPD | ___PPC_RA(a) | \
+#define PPC_RAW_CMPD(a, b)		(0x7c200000 | ___PPC_RA(a) | \
 						___PPC_RB(b))
-#define PPC_RAW_CMPLWI(a, i)		(PPC_INST_CMPLWI | ___PPC_RA(a) | IMM_L(i))
-#define PPC_RAW_CMPLDI(a, i)		(PPC_INST_CMPLDI | ___PPC_RA(a) | IMM_L(i))
-#define PPC_RAW_CMPLW(a, b)		(PPC_INST_CMPLW | ___PPC_RA(a) | \
+#define PPC_RAW_CMPLWI(a, i)		(0x28000000 | ___PPC_RA(a) | IMM_L(i))
+#define PPC_RAW_CMPLDI(a, i)		(0x28200000 | ___PPC_RA(a) | IMM_L(i))
+#define PPC_RAW_CMPLW(a, b)		(0x7c000040 | ___PPC_RA(a) | \
 		                                ___PPC_RB(b))
-#define PPC_RAW_CMPLD(a, b)		(PPC_INST_CMPLD | ___PPC_RA(a) | \
+#define PPC_RAW_CMPLD(a, b)		(0x7c200040 | ___PPC_RA(a) | \
 						___PPC_RB(b))
-#define PPC_RAW_SUB(d, a, b)		(PPC_INST_SUB | ___PPC_RT(d) | \
+#define PPC_RAW_SUB(d, a, b)		(0x7c000050 | ___PPC_RT(d) | \
 		                                ___PPC_RB(a) | ___PPC_RA(b))
-#define PPC_RAW_MULD(d, a, b)		(PPC_INST_MULLD | ___PPC_RT(d) | \
+#define PPC_RAW_MULD(d, a, b)		(0x7c0001d2 | ___PPC_RT(d) | \
 						___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_RAW_MULW(d, a, b)		(PPC_INST_MULLW | ___PPC_RT(d) | \
+#define PPC_RAW_MULW(d, a, b)		(0x7c0001d6 | ___PPC_RT(d) | \
 		                                ___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_RAW_MULHWU(d, a, b)		(PPC_INST_MULHWU | ___PPC_RT(d) | \
+#define PPC_RAW_MULHWU(d, a, b)		(0x7c000016 | ___PPC_RT(d) | \
 		                                ___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_RAW_MULI(d, a, i)		(PPC_INST_MULLI | ___PPC_RT(d) | \
+#define PPC_RAW_MULI(d, a, i)		(0x1c000000 | ___PPC_RT(d) | \
 						___PPC_RA(a) | IMM_L(i))
-#define PPC_RAW_DIVWU(d, a, b)		(PPC_INST_DIVWU | ___PPC_RT(d) | \
+#define PPC_RAW_DIVWU(d, a, b)		(0x7c000396 | ___PPC_RT(d) | \
 		                                ___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_RAW_DIVDU(d, a, b)		(PPC_INST_DIVDU | ___PPC_RT(d) | \
+#define PPC_RAW_DIVDU(d, a, b)		(0x7c000392 | ___PPC_RT(d) | \
 		                                ___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_RAW_AND(d, a, b)		(PPC_INST_AND | ___PPC_RA(d) | \
+#define PPC_RAW_AND(d, a, b)		(0x7c000038 | ___PPC_RA(d) | \
 		                                ___PPC_RS(a) | ___PPC_RB(b))
-#define PPC_RAW_ANDI(d, a, i)		(PPC_INST_ANDI | ___PPC_RA(d) | \
+#define PPC_RAW_ANDI(d, a, i)		(0x70000000 | ___PPC_RA(d) | \
 						___PPC_RS(a) | IMM_L(i))
-#define PPC_RAW_AND_DOT(d, a, b)	(PPC_INST_ANDDOT | ___PPC_RA(d) | \
+#define PPC_RAW_AND_DOT(d, a, b)	(0x7c000039 | ___PPC_RA(d) | \
 		                                ___PPC_RS(a) | ___PPC_RB(b))
-#define PPC_RAW_OR(d, a, b)		(PPC_INST_OR | ___PPC_RA(d) | \
+#define PPC_RAW_OR(d, a, b)		(0x7c000378 | ___PPC_RA(d) | \
 		                                ___PPC_RS(a) | ___PPC_RB(b))
 #define PPC_RAW_MR(d, a)		PPC_RAW_OR(d, a, a)
 #define PPC_RAW_ORI(d, a, i)		(PPC_INST_ORI | ___PPC_RA(d) | \
 		                                ___PPC_RS(a) | IMM_L(i))
 #define PPC_RAW_ORIS(d, a, i)		(PPC_INST_ORIS | ___PPC_RA(d) | \
 		                                ___PPC_RS(a) | IMM_L(i))
-#define PPC_RAW_XOR(d, a, b)		(PPC_INST_XOR | ___PPC_RA(d) | \
+#define PPC_RAW_XOR(d, a, b)		(0x7c000278 | ___PPC_RA(d) | \
 						___PPC_RS(a) | ___PPC_RB(b))
-#define PPC_RAW_XORI(d, a, i)		(PPC_INST_XORI | ___PPC_RA(d) | \
+#define PPC_RAW_XORI(d, a, i)		(0x68000000 | ___PPC_RA(d) | \
 		                                ___PPC_RS(a) | IMM_L(i))
-#define PPC_RAW_XORIS(d, a, i)		(PPC_INST_XORIS | ___PPC_RA(d) | \
+#define PPC_RAW_XORIS(d, a, i)		(0x6c000000 | ___PPC_RA(d) | \
 						___PPC_RS(a) | IMM_L(i))
-#define PPC_RAW_EXTSW(d, a)		(PPC_INST_EXTSW | ___PPC_RA(d) | \
+#define PPC_RAW_EXTSW(d, a)		(0x7c0007b4 | ___PPC_RA(d) | \
 						___PPC_RS(a))
-#define PPC_RAW_SLW(d, a, s)		(PPC_INST_SLW | ___PPC_RA(d) | \
+#define PPC_RAW_SLW(d, a, s)		(0x7c000030 | ___PPC_RA(d) | \
 						___PPC_RS(a) | ___PPC_RB(s))
-#define PPC_RAW_SLD(d, a, s)		(PPC_INST_SLD | ___PPC_RA(d) | \
+#define PPC_RAW_SLD(d, a, s)		(0x7c000036 | ___PPC_RA(d) | \
 						___PPC_RS(a) | ___PPC_RB(s))
-#define PPC_RAW_SRW(d, a, s)		(PPC_INST_SRW | ___PPC_RA(d) | \
+#define PPC_RAW_SRW(d, a, s)		(0x7c000430 | ___PPC_RA(d) | \
 						___PPC_RS(a) | ___PPC_RB(s))
-#define PPC_RAW_SRAW(d, a, s)		(PPC_INST_SRAW | ___PPC_RA(d) | \
+#define PPC_RAW_SRAW(d, a, s)		(0x7c000630 | ___PPC_RA(d) | \
 						___PPC_RS(a) | ___PPC_RB(s))
-#define PPC_RAW_SRAWI(d, a, i)		(PPC_INST_SRAWI | ___PPC_RA(d) | \
+#define PPC_RAW_SRAWI(d, a, i)		(0x7c000670 | ___PPC_RA(d) | \
 						___PPC_RS(a) | __PPC_SH(i))
-#define PPC_RAW_SRD(d, a, s)		(PPC_INST_SRD | ___PPC_RA(d) | \
+#define PPC_RAW_SRD(d, a, s)		(0x7c000436 | ___PPC_RA(d) | \
 						___PPC_RS(a) | ___PPC_RB(s))
-#define PPC_RAW_SRAD(d, a, s)		(PPC_INST_SRAD | ___PPC_RA(d) | \
+#define PPC_RAW_SRAD(d, a, s)		(0x7c000634 | ___PPC_RA(d) | \
 						___PPC_RS(a) | ___PPC_RB(s))
-#define PPC_RAW_SRADI(d, a, i)		(PPC_INST_SRADI | ___PPC_RA(d) | \
+#define PPC_RAW_SRADI(d, a, i)		(0x7c000674 | ___PPC_RA(d) | \
 						___PPC_RS(a) | __PPC_SH64(i))
-#define PPC_RAW_RLWINM(d, a, i, mb, me)	(PPC_INST_RLWINM | ___PPC_RA(d) | \
+#define PPC_RAW_RLWINM(d, a, i, mb, me)	(0x54000000 | ___PPC_RA(d) | \
 						___PPC_RS(a) | __PPC_SH(i) | \
 						__PPC_MB(mb) | __PPC_ME(me))
 #define PPC_RAW_RLWINM_DOT(d, a, i, mb, me) \
-					(PPC_INST_RLWINM_DOT | ___PPC_RA(d) | \
+					(0x54000001 | ___PPC_RA(d) | \
 						___PPC_RS(a) | __PPC_SH(i) | \
 						__PPC_MB(mb) | __PPC_ME(me))
-#define PPC_RAW_RLWIMI(d, a, i, mb, me) (PPC_INST_RLWIMI | ___PPC_RA(d) | \
+#define PPC_RAW_RLWIMI(d, a, i, mb, me) (0x50000000 | ___PPC_RA(d) | \
 						___PPC_RS(a) | __PPC_SH(i) | \
 						__PPC_MB(mb) | __PPC_ME(me))
-#define PPC_RAW_RLDICL(d, a, i, mb)     (PPC_INST_RLDICL | ___PPC_RA(d) | \
+#define PPC_RAW_RLDICL(d, a, i, mb)     (0x78000000 | ___PPC_RA(d) | \
 						___PPC_RS(a) | __PPC_SH64(i) | \
 						__PPC_MB64(mb))
 #define PPC_RAW_RLDICR(d, a, i, me)     (PPC_INST_RLDICR | ___PPC_RA(d) | \
@@ -774,7 +643,7 @@
 /* sldi = rldicl Rx, Ry, 64-n, n */
 #define PPC_RAW_SRDI(d, a, i)		PPC_RAW_RLDICL(d, a, 64-(i), i)
 
-#define PPC_RAW_NEG(d, a)		(PPC_INST_NEG | ___PPC_RT(d) | \
+#define PPC_RAW_NEG(d, a)		(0x7c0000d0 | ___PPC_RT(d) | \
 						___PPC_RA(a))
 
 /* Deal with instructions that older assemblers aren't aware of */
-- 
2.24.1

