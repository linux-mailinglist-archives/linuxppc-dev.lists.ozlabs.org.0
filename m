Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BE2207231
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 13:35:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sLfq1XYrzDqfq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 21:35:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sLZJ1MjSzDql0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 21:31:19 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05OB4CLi180667; Wed, 24 Jun 2020 07:31:14 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31uwymmcr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 07:31:13 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05OBUffX021773;
 Wed, 24 Jun 2020 11:31:10 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 31uus70jn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 11:31:10 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05OBV7Db63373510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jun 2020 11:31:07 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3B2C4C062;
 Wed, 24 Jun 2020 11:31:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59BBD4C04E;
 Wed, 24 Jun 2020 11:31:03 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.43.241])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Jun 2020 11:31:03 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 1/6] powerpc/ppc-opcode: introduce PPC_RAW_* macros for
 base instruction encoding
Date: Wed, 24 Jun 2020 17:00:33 +0530
Message-Id: <20200624113038.908074-2-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200624113038.908074-1-bala24@linux.ibm.com>
References: <20200624113038.908074-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_06:2020-06-24,
 2020-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=522
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0
 cotscore=-2147483648 mlxscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=1 phishscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006240081
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
Cc: ravi.bangoria@linux.ibm.com, Balamuruhan S <bala24@linux.ibm.com>,
 paulus@samba.org, sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce PPC_RAW_* macros to have all the bare encoding of ppc
instructions. Move `VSX_XX*()` and `TMRN()` macros up to reuse it.

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h | 90 ++++++++++++++++++++++++---
 1 file changed, 82 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 2a39c716c343..360dc7d03a9b 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -431,6 +431,88 @@
 #define __PPC_EH(eh)	0
 #endif
 
+/* Base instruction encoding */
+#define PPC_RAW_CP_ABORT		(PPC_INST_CP_ABORT)
+#define PPC_RAW_COPY(a, b)		(PPC_INST_COPY | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_DARN(t, l)		(PPC_INST_DARN | ___PPC_RT(t) | (((l) & 0x3) << 16))
+#define PPC_RAW_DCBAL(a, b)		(PPC_INST_DCBAL | __PPC_RA(a) | __PPC_RB(b))
+#define PPC_RAW_DCBZL(a, b)		(PPC_INST_DCBZL | __PPC_RA(a) | __PPC_RB(b))
+#define PPC_RAW_LQARX(t, a, b, eh)	(PPC_INST_LQARX | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | __PPC_EH(eh))
+#define PPC_RAW_LDARX(t, a, b, eh)	(PPC_INST_LDARX | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | __PPC_EH(eh))
+#define PPC_RAW_LWARX(t, a, b, eh)	(PPC_INST_LWARX | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | __PPC_EH(eh))
+#define PPC_RAW_STQCX(t, a, b)		(PPC_INST_STQCX | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_MADDHD(t, a, b, c)	(PPC_INST_MADDHD | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | ___PPC_RC(c))
+#define PPC_RAW_MADDHDU(t, a, b, c)	(PPC_INST_MADDHDU | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | ___PPC_RC(c))
+#define PPC_RAW_MADDLD(t, a, b, c)	(PPC_INST_MADDLD | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | ___PPC_RC(c))
+#define PPC_RAW_MSGSND(b)		(PPC_INST_MSGSND | ___PPC_RB(b))
+#define PPC_RAW_MSGSYNC			(PPC_INST_MSGSYNC)
+#define PPC_RAW_MSGCLR(b)		(PPC_INST_MSGCLR | ___PPC_RB(b))
+#define PPC_RAW_MSGSNDP(b)		(PPC_INST_MSGSNDP | ___PPC_RB(b))
+#define PPC_RAW_MSGCLRP(b)		(PPC_INST_MSGCLRP | ___PPC_RB(b))
+#define PPC_RAW_PASTE(a, b)		(PPC_INST_PASTE | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_POPCNTB(a, s)		(PPC_INST_POPCNTB | __PPC_RA(a) | __PPC_RS(s))
+#define PPC_RAW_POPCNTD(a, s)		(PPC_INST_POPCNTD | __PPC_RA(a) | __PPC_RS(s))
+#define PPC_RAW_POPCNTW(a, s)		(PPC_INST_POPCNTW | __PPC_RA(a) | __PPC_RS(s))
+#define PPC_RAW_RFCI			(PPC_INST_RFCI)
+#define PPC_RAW_RFDI			(PPC_INST_RFDI)
+#define PPC_RAW_RFMCI			(PPC_INST_RFMCI)
+#define PPC_RAW_TLBILX(t, a, b)		(PPC_INST_TLBILX | __PPC_T_TLB(t) | __PPC_RA0(a) | __PPC_RB(b))
+#define PPC_RAW_WAIT(w)			(PPC_INST_WAIT | __PPC_WC(w))
+#define PPC_RAW_TLBIE(lp, a)		(PPC_INST_TLBIE | ___PPC_RB(a) | ___PPC_RS(lp))
+#define PPC_RAW_TLBIE_5(rb, rs, ric, prs, r) \
+	(PPC_INST_TLBIE | ___PPC_RB(rb) | ___PPC_RS(rs) | ___PPC_RIC(ric) | ___PPC_PRS(prs) | ___PPC_R(r))
+#define PPC_RAW_TLBIEL(rb, rs, ric, prs, r) \
+	(PPC_INST_TLBIEL | ___PPC_RB(rb) | ___PPC_RS(rs) | ___PPC_RIC(ric) | ___PPC_PRS(prs) | ___PPC_R(r))
+#define PPC_RAW_TLBSRX_DOT(a, b)	(PPC_INST_TLBSRX_DOT | __PPC_RA0(a) | __PPC_RB(b))
+#define PPC_RAW_TLBIVAX(a, b)		(PPC_INST_TLBIVAX | __PPC_RA0(a) | __PPC_RB(b))
+#define PPC_RAW_ERATWE(s, a, w)		(PPC_INST_ERATWE | __PPC_RS(s) | __PPC_RA(a) | __PPC_WS(w))
+#define PPC_RAW_ERATRE(s, a, w)		(PPC_INST_ERATRE | __PPC_RS(s) | __PPC_RA(a) | __PPC_WS(w))
+#define PPC_RAW_ERATILX(t, a, b)	(PPC_INST_ERATILX | __PPC_T_TLB(t) | __PPC_RA0(a) | __PPC_RB(b))
+#define PPC_RAW_ERATIVAX(s, a, b)	(PPC_INST_ERATIVAX | __PPC_RS(s) | __PPC_RA0(a) | __PPC_RB(b))
+#define PPC_RAW_ERATSX(t, a, w)		(PPC_INST_ERATSX | __PPC_RS(t) | __PPC_RA0(a) | __PPC_RB(b))
+#define PPC_RAW_ERATSX_DOT(t, a, w)	(PPC_INST_ERATSX_DOT | __PPC_RS(t) | __PPC_RA0(a) | __PPC_RB(b))
+#define PPC_RAW_SLBFEE_DOT(t, b)	(PPC_INST_SLBFEE | __PPC_RT(t) | __PPC_RB(b))
+#define __PPC_RAW_SLBFEE_DOT(t, b)	(PPC_INST_SLBFEE | ___PPC_RT(t) | ___PPC_RB(b))
+#define PPC_RAW_ICBT(c, a, b)		(PPC_INST_ICBT | __PPC_CT(c) | __PPC_RA0(a) | __PPC_RB(b))
+#define PPC_RAW_LBZCIX(t, a, b)		(PPC_INST_LBZCIX | __PPC_RT(t) | __PPC_RA(a) | __PPC_RB(b))
+#define PPC_RAW_STBCIX(s, a, b)		(PPC_INST_STBCIX | __PPC_RS(s) | __PPC_RA(a) | __PPC_RB(b))
+/*
+ * Define what the VSX XX1 form instructions will look like, then add
+ * the 128 bit load store instructions based on that.
+ */
+#define VSX_XX1(s, a, b)		(__PPC_XS(s) | __PPC_RA(a) | __PPC_RB(b))
+#define VSX_XX3(t, a, b)		(__PPC_XT(t) | __PPC_XA(a) | __PPC_XB(b))
+#define PPC_RAW_STXVD2X(s, a, b)	(PPC_INST_STXVD2X | VSX_XX1((s), a, b))
+#define PPC_RAW_LXVD2X(s, a, b)		(PPC_INST_LXVD2X | VSX_XX1((s), a, b))
+#define PPC_RAW_MFVRD(a, t)		(PPC_INST_MFVSRD | VSX_XX1((t) + 32, a, R0))
+#define PPC_RAW_MTVRD(t, a)		(PPC_INST_MTVSRD | VSX_XX1((t) + 32, a, R0))
+#define PPC_RAW_VPMSUMW(t, a, b)	(PPC_INST_VPMSUMW | VSX_XX3((t), a, b))
+#define PPC_RAW_VPMSUMD(t, a, b)	(PPC_INST_VPMSUMD | VSX_XX3((t), a, b))
+#define PPC_RAW_XXLOR(t, a, b)		(PPC_INST_XXLOR | VSX_XX3((t), a, b))
+#define PPC_RAW_XXSWAPD(t, a)		(PPC_INST_XXSWAPD | VSX_XX3((t), a, a))
+#define PPC_RAW_XVCPSGNDP(t, a, b)	((PPC_INST_XVCPSGNDP | VSX_XX3((t), (a), (b))))
+#define PPC_RAW_VPERMXOR(vrt, vra, vrb, vrc) \
+	((PPC_INST_VPERMXOR | ___PPC_RT(vrt) | ___PPC_RA(vra) | ___PPC_RB(vrb) | (((vrc) & 0x1f) << 6)))
+#define PPC_RAW_NAP			(PPC_INST_NAP)
+#define PPC_RAW_SLEEP			(PPC_INST_SLEEP)
+#define PPC_RAW_WINKLE			(PPC_INST_WINKLE)
+#define PPC_RAW_STOP			(PPC_INST_STOP)
+#define PPC_RAW_CLRBHRB			(PPC_INST_CLRBHRB)
+#define PPC_RAW_MFBHRBE(r, n)		(PPC_INST_BHRBE | __PPC_RT(r) | (((n) & 0x3ff) << 11))
+#define PPC_RAW_TRECHKPT		(PPC_INST_TRECHKPT)
+#define PPC_RAW_TRECLAIM(r)		(PPC_INST_TRECLAIM | __PPC_RA(r))
+#define PPC_RAW_TABORT(r)		(PPC_INST_TABORT | __PPC_RA(r))
+#define TMRN(x)				((((x) & 0x1f) << 16) | (((x) & 0x3e0) << 6))
+#define PPC_RAW_MTTMR(tmr, r)		(PPC_INST_MTTMR | TMRN(tmr) | ___PPC_RS(r))
+#define PPC_RAW_MFTMR(tmr, r)		(PPC_INST_MFTMR | TMRN(tmr) | ___PPC_RT(r))
+#define PPC_RAW_ICSWX(s, a, b)		(PPC_INST_ICSWX | ___PPC_RS(s) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_ICSWEPX(s, a, b)	(PPC_INST_ICSWEPX | ___PPC_RS(s) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_SLBIA(IH)		(PPC_INST_SLBIA | (((IH) & 0x7) << 21))
+#define PPC_RAW_VCMPEQUD_RC(vrt, vra, vrb) \
+	(PPC_INST_VCMPEQUD | ___PPC_RT(vrt) | ___PPC_RA(vra) | ___PPC_RB(vrb) | __PPC_RC21)
+#define PPC_RAW_VCMPEQUB_RC(vrt, vra, vrb) \
+	(PPC_INST_VCMPEQUB | ___PPC_RT(vrt) | ___PPC_RA(vra) | ___PPC_RB(vrb) | __PPC_RC21)
+
 /* Deal with instructions that older assemblers aren't aware of */
 #define	PPC_CP_ABORT		stringify_in_c(.long PPC_INST_CP_ABORT)
 #define	PPC_COPY(a, b)		stringify_in_c(.long PPC_INST_COPY | \
@@ -531,13 +613,6 @@
 				       __PPC_RT(t) | __PPC_RA(a) | __PPC_RB(b))
 #define STBCIX(s,a,b)		stringify_in_c(.long PPC_INST_STBCIX | \
 				       __PPC_RS(s) | __PPC_RA(a) | __PPC_RB(b))
-
-/*
- * Define what the VSX XX1 form instructions will look like, then add
- * the 128 bit load store instructions based on that.
- */
-#define VSX_XX1(s, a, b)	(__PPC_XS(s) | __PPC_RA(a) | __PPC_RB(b))
-#define VSX_XX3(t, a, b)	(__PPC_XT(t) | __PPC_XA(a) | __PPC_XB(b))
 #define STXVD2X(s, a, b)	stringify_in_c(.long PPC_INST_STXVD2X | \
 					       VSX_XX1((s), a, b))
 #define LXVD2X(s, a, b)		stringify_in_c(.long PPC_INST_LXVD2X | \
@@ -582,7 +657,6 @@
 					       | __PPC_RA(r))
 
 /* book3e thread control instructions */
-#define TMRN(x)			((((x) & 0x1f) << 16) | (((x) & 0x3e0) << 6))
 #define MTTMR(tmr, r)		stringify_in_c(.long PPC_INST_MTTMR | \
 					       TMRN(tmr) | ___PPC_RS(r))
 #define MFTMR(tmr, r)		stringify_in_c(.long PPC_INST_MFTMR | \
-- 
2.24.1

