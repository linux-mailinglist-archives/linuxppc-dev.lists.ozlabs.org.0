Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB0A18C8F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 09:24:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kGyZ16DSzDrdF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 19:24:06 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kGvB10VZzDrWW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 19:21:09 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02K82kqG088696
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:21:08 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu8af9vnm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:21:07 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Fri, 20 Mar 2020 08:21:04 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 20 Mar 2020 08:21:01 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02K8L0V053411924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 08:21:00 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2500911C05C;
 Fri, 20 Mar 2020 08:21:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5294011C04C;
 Fri, 20 Mar 2020 08:20:53 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.87.168])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Mar 2020 08:20:52 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [RFC PATCH 1/4] powerpc ppc-opcode: introduce PPC_ENCODE_* macros for
 base instruction encoding
Date: Fri, 20 Mar 2020 13:48:34 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200320081837.1016820-1-bala24@linux.ibm.com>
References: <20200320081837.1016820-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20032008-0016-0000-0000-000002F458D1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032008-0017-0000-0000-00003357E687
Message-Id: <20200320081837.1016820-2-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-20_01:2020-03-19,
 2020-03-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0 mlxlogscore=470
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003200035
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

Introduce PPC_ENCODE* macros to have all the bare encoding of ppc
instructions and use it wrapped with stringify_in_c() for raw
encoding in ppc-opcode.h.

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h | 330 +++++++++++++++++---------
 1 file changed, 220 insertions(+), 110 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index c1df75edde44..ea5e0f864b20 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -429,105 +429,105 @@
 #endif
 
 /* Deal with instructions that older assemblers aren't aware of */
-#define	PPC_CP_ABORT		stringify_in_c(.long PPC_INST_CP_ABORT)
-#define	PPC_COPY(a, b)		stringify_in_c(.long PPC_INST_COPY | \
-					___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_DARN(t, l)		stringify_in_c(.long PPC_INST_DARN |  \
-						___PPC_RT(t)	   |  \
-						(((l) & 0x3) << 16))
-#define	PPC_DCBAL(a, b)		stringify_in_c(.long PPC_INST_DCBAL | \
-					__PPC_RA(a) | __PPC_RB(b))
-#define	PPC_DCBZL(a, b)		stringify_in_c(.long PPC_INST_DCBZL | \
-					__PPC_RA(a) | __PPC_RB(b))
-#define PPC_LQARX(t, a, b, eh)	stringify_in_c(.long PPC_INST_LQARX | \
-					___PPC_RT(t) | ___PPC_RA(a) | \
+#define	PPC_ENCODE_CP_ABORT		(PPC_INST_CP_ABORT)
+#define	PPC_ENCODE_COPY(a, b)		(PPC_INST_COPY | ___PPC_RA(a) | \
+					___PPC_RB(b))
+#define PPC_ENCODE_DARN(t, l)		(PPC_INST_DARN | ___PPC_RT(t) |	\
+					(((l) & 0x3) << 16))
+#define	PPC_ENCODE_DCBAL(a, b)		(PPC_INST_DCBAL | __PPC_RA(a) | \
+					__PPC_RB(b))
+#define	PPC_ENCODE_DCBZL(a, b)		(PPC_INST_DCBZL | __PPC_RA(a) | \
+					__PPC_RB(b))
+#define PPC_ENCODE_LQARX(t, a, b, eh)	(PPC_INST_LQARX | ___PPC_RT(t) | \
+					___PPC_RA(a) | \
 					___PPC_RB(b) | __PPC_EH(eh))
-#define PPC_LDARX(t, a, b, eh)	stringify_in_c(.long PPC_INST_LDARX | \
-					___PPC_RT(t) | ___PPC_RA(a) | \
+#define PPC_ENCODE_LDARX(t, a, b, eh)	(PPC_INST_LDARX | ___PPC_RT(t) | \
+					___PPC_RA(a) | \
 					___PPC_RB(b) | __PPC_EH(eh))
-#define PPC_LWARX(t, a, b, eh)	stringify_in_c(.long PPC_INST_LWARX | \
+#define PPC_ENCODE_LWARX(t, a, b, eh)	(PPC_INST_LWARX | \
 					___PPC_RT(t) | ___PPC_RA(a) | \
 					___PPC_RB(b) | __PPC_EH(eh))
-#define PPC_STQCX(t, a, b)	stringify_in_c(.long PPC_INST_STQCX | \
+#define PPC_ENCODE_STQCX(t, a, b)	(PPC_INST_STQCX | \
 					___PPC_RT(t) | ___PPC_RA(a) | \
 					___PPC_RB(b))
-#define PPC_MADDHD(t, a, b, c)	stringify_in_c(.long PPC_INST_MADDHD | \
+#define PPC_ENCODE_MADDHD(t, a, b, c)	(PPC_INST_MADDHD | \
 					___PPC_RT(t) | ___PPC_RA(a)  | \
 					___PPC_RB(b) | ___PPC_RC(c))
-#define PPC_MADDHDU(t, a, b, c)	stringify_in_c(.long PPC_INST_MADDHDU | \
+#define PPC_ENCODE_MADDHDU(t, a, b, c)	(PPC_INST_MADDHDU | \
 					___PPC_RT(t) | ___PPC_RA(a)   | \
 					___PPC_RB(b) | ___PPC_RC(c))
-#define PPC_MADDLD(t, a, b, c)	stringify_in_c(.long PPC_INST_MADDLD | \
+#define PPC_ENCODE_MADDLD(t, a, b, c)	(PPC_INST_MADDLD | \
 					___PPC_RT(t) | ___PPC_RA(a)  | \
 					___PPC_RB(b) | ___PPC_RC(c))
-#define PPC_MSGSND(b)		stringify_in_c(.long PPC_INST_MSGSND | \
-					___PPC_RB(b))
-#define PPC_MSGSYNC		stringify_in_c(.long PPC_INST_MSGSYNC)
-#define PPC_MSGCLR(b)		stringify_in_c(.long PPC_INST_MSGCLR | \
-					___PPC_RB(b))
-#define PPC_MSGSNDP(b)		stringify_in_c(.long PPC_INST_MSGSNDP | \
-					___PPC_RB(b))
-#define PPC_MSGCLRP(b)		stringify_in_c(.long PPC_INST_MSGCLRP | \
+#define PPC_ENCODE_MSGSND(b)		(PPC_INST_MSGSND | ___PPC_RB(b))
+#define PPC_ENCODE_MSGSYNC		(PPC_INST_MSGSYNC)
+#define PPC_ENCODE_MSGCLR(b)		(PPC_INST_MSGCLR | ___PPC_RB(b))
+#define PPC_ENCODE_MSGSNDP(b)		(PPC_INST_MSGSNDP | ___PPC_RB(b))
+#define PPC_ENCODE_MSGCLRP(b)		(PPC_INST_MSGCLRP | ___PPC_RB(b))
+#define PPC_ENCODE_PASTE(a, b)		(PPC_INST_PASTE | ___PPC_RA(a) | \
 					___PPC_RB(b))
-#define PPC_PASTE(a, b)		stringify_in_c(.long PPC_INST_PASTE | \
-					___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_POPCNTB(a, s)	stringify_in_c(.long PPC_INST_POPCNTB | \
-					__PPC_RA(a) | __PPC_RS(s))
-#define PPC_POPCNTD(a, s)	stringify_in_c(.long PPC_INST_POPCNTD | \
-					__PPC_RA(a) | __PPC_RS(s))
-#define PPC_POPCNTW(a, s)	stringify_in_c(.long PPC_INST_POPCNTW | \
-					__PPC_RA(a) | __PPC_RS(s))
-#define PPC_RFCI		stringify_in_c(.long PPC_INST_RFCI)
-#define PPC_RFDI		stringify_in_c(.long PPC_INST_RFDI)
-#define PPC_RFMCI		stringify_in_c(.long PPC_INST_RFMCI)
-#define PPC_TLBILX(t, a, b)	stringify_in_c(.long PPC_INST_TLBILX | \
-					__PPC_T_TLB(t) | __PPC_RA0(a) | __PPC_RB(b))
-#define PPC_TLBILX_ALL(a, b)	PPC_TLBILX(0, a, b)
-#define PPC_TLBILX_PID(a, b)	PPC_TLBILX(1, a, b)
-#define PPC_TLBILX_VA(a, b)	PPC_TLBILX(3, a, b)
-#define PPC_WAIT(w)		stringify_in_c(.long PPC_INST_WAIT | \
-					__PPC_WC(w))
-#define PPC_TLBIE(lp,a) 	stringify_in_c(.long PPC_INST_TLBIE | \
-					       ___PPC_RB(a) | ___PPC_RS(lp))
-#define	PPC_TLBIE_5(rb,rs,ric,prs,r) \
-				stringify_in_c(.long PPC_INST_TLBIE | \
+#define PPC_ENCODE_POPCNTB(a, s)	(PPC_INST_POPCNTB | __PPC_RA(a) | \
+					__PPC_RS(s))
+#define PPC_ENCODE_POPCNTD(a, s)	(PPC_INST_POPCNTD | __PPC_RA(a) | \
+					__PPC_RS(s))
+#define PPC_ENCODE_POPCNTW(a, s)	(PPC_INST_POPCNTW | __PPC_RA(a) | \
+					__PPC_RS(s))
+#define PPC_ENCODE_RFCI			(PPC_INST_RFCI)
+#define PPC_ENCODE_RFDI			(PPC_INST_RFDI)
+#define PPC_ENCODE_RFMCI		(PPC_INST_RFMCI)
+#define PPC_ENCODE_TLBILX(t, a, b)	(PPC_INST_TLBILX | \
+					__PPC_T_TLB(t) | __PPC_RA0(a) | \
+					__PPC_RB(b))
+#define PPC_ENCODE_WAIT(w)		(PPC_INST_WAIT | __PPC_WC(w))
+#define PPC_ENCODE_TLBIE(lp, a)		(PPC_INST_TLBIE | ___PPC_RB(a) | \
+					___PPC_RS(lp))
+#define	PPC_ENCODE_TLBIE_5(rb, rs, ric, prs, r) \
+					(PPC_INST_TLBIE | \
 					___PPC_RB(rb) | ___PPC_RS(rs) | \
 					___PPC_RIC(ric) | ___PPC_PRS(prs) | \
 					___PPC_R(r))
-#define	PPC_TLBIEL(rb,rs,ric,prs,r) \
-				stringify_in_c(.long PPC_INST_TLBIEL | \
+#define	PPC_ENCODE_TLBIEL(rb, rs, ric, prs, r) \
+					(PPC_INST_TLBIEL | \
 					___PPC_RB(rb) | ___PPC_RS(rs) | \
 					___PPC_RIC(ric) | ___PPC_PRS(prs) | \
 					___PPC_R(r))
-#define PPC_TLBSRX_DOT(a,b)	stringify_in_c(.long PPC_INST_TLBSRX_DOT | \
+#define PPC_ENCODE_TLBSRX_DOT(a, b)	(PPC_INST_TLBSRX_DOT | \
 					__PPC_RA0(a) | __PPC_RB(b))
-#define PPC_TLBIVAX(a,b)	stringify_in_c(.long PPC_INST_TLBIVAX | \
+#define PPC_ENCODE_TLBIVAX(a, b)	(PPC_INST_TLBIVAX | \
 					__PPC_RA0(a) | __PPC_RB(b))
 
-#define PPC_ERATWE(s, a, w)	stringify_in_c(.long PPC_INST_ERATWE | \
-					__PPC_RS(s) | __PPC_RA(a) | __PPC_WS(w))
-#define PPC_ERATRE(s, a, w)	stringify_in_c(.long PPC_INST_ERATRE | \
-					__PPC_RS(s) | __PPC_RA(a) | __PPC_WS(w))
-#define PPC_ERATILX(t, a, b)	stringify_in_c(.long PPC_INST_ERATILX | \
+#define PPC_ENCODE_ERATWE(s, a, w)	(PPC_INST_ERATWE | \
+					__PPC_RS(s) | __PPC_RA(a) | \
+					__PPC_WS(w))
+#define PPC_ENCODE_ERATRE(s, a, w)	(PPC_INST_ERATRE | \
+					__PPC_RS(s) | __PPC_RA(a) | \
+					__PPC_WS(w))
+#define PPC_ENCODE_ERATILX(t, a, b)	(PPC_INST_ERATILX | \
 					__PPC_T_TLB(t) | __PPC_RA0(a) | \
 					__PPC_RB(b))
-#define PPC_ERATIVAX(s, a, b)	stringify_in_c(.long PPC_INST_ERATIVAX | \
-					__PPC_RS(s) | __PPC_RA0(a) | __PPC_RB(b))
-#define PPC_ERATSX(t, a, w)	stringify_in_c(.long PPC_INST_ERATSX | \
-					__PPC_RS(t) | __PPC_RA0(a) | __PPC_RB(b))
-#define PPC_ERATSX_DOT(t, a, w)	stringify_in_c(.long PPC_INST_ERATSX_DOT | \
-					__PPC_RS(t) | __PPC_RA0(a) | __PPC_RB(b))
-#define PPC_SLBFEE_DOT(t, b)	stringify_in_c(.long PPC_INST_SLBFEE | \
+#define PPC_ENCODE_ERATIVAX(s, a, b)	(PPC_INST_ERATIVAX | \
+					__PPC_RS(s) | __PPC_RA0(a) | \
+					__PPC_RB(b))
+#define PPC_ENCODE_ERATSX(t, a, w)	(PPC_INST_ERATSX | \
+					__PPC_RS(t) | __PPC_RA0(a) | \
+					__PPC_RB(b))
+#define PPC_ENCODE_ERATSX_DOT(t, a, w)	(PPC_INST_ERATSX_DOT | \
+					__PPC_RS(t) | __PPC_RA0(a) | \
+					__PPC_RB(b))
+#define PPC_ENCODE_SLBFEE_DOT(t, b)	(PPC_INST_SLBFEE | \
 					__PPC_RT(t) | __PPC_RB(b))
-#define __PPC_SLBFEE_DOT(t, b)	stringify_in_c(.long PPC_INST_SLBFEE |	\
-					       ___PPC_RT(t) | ___PPC_RB(b))
-#define PPC_ICBT(c,a,b)		stringify_in_c(.long PPC_INST_ICBT | \
-				       __PPC_CT(c) | __PPC_RA0(a) | __PPC_RB(b))
+#define __PPC_ENCODE_SLBFEE_DOT(t, b)	(PPC_INST_SLBFEE |	\
+					___PPC_RT(t) | ___PPC_RB(b))
+#define PPC_ENCODE_ICBT(c, a, b)	(PPC_INST_ICBT | \
+				       __PPC_CT(c) | __PPC_RA0(a) | \
+				       __PPC_RB(b))
 /* PASemi instructions */
-#define LBZCIX(t,a,b)		stringify_in_c(.long PPC_INST_LBZCIX | \
-				       __PPC_RT(t) | __PPC_RA(a) | __PPC_RB(b))
-#define STBCIX(s,a,b)		stringify_in_c(.long PPC_INST_STBCIX | \
-				       __PPC_RS(s) | __PPC_RA(a) | __PPC_RB(b))
+#define PPC_ENCODE_LBZCIX(t, a, b)	(PPC_INST_LBZCIX | \
+				       __PPC_RT(t) | __PPC_RA(a) | \
+				       __PPC_RB(b))
+#define PPC_ENCODE_STBCIX(s, a, b)	(PPC_INST_STBCIX | \
+				       __PPC_RS(s) | __PPC_RA(a) | \
+				       __PPC_RB(b))
 
 /*
  * Define what the VSX XX1 form instructions will look like, then add
@@ -535,68 +535,68 @@
  */
 #define VSX_XX1(s, a, b)	(__PPC_XS(s) | __PPC_RA(a) | __PPC_RB(b))
 #define VSX_XX3(t, a, b)	(__PPC_XT(t) | __PPC_XA(a) | __PPC_XB(b))
-#define STXVD2X(s, a, b)	stringify_in_c(.long PPC_INST_STXVD2X | \
+#define PPC_ENCODE_STXVD2X(s, a, b)	(PPC_INST_STXVD2X | \
 					       VSX_XX1((s), a, b))
-#define LXVD2X(s, a, b)		stringify_in_c(.long PPC_INST_LXVD2X | \
+#define PPC_ENCODE_LXVD2X(s, a, b)	(PPC_INST_LXVD2X | \
 					       VSX_XX1((s), a, b))
-#define MFVRD(a, t)		stringify_in_c(.long PPC_INST_MFVSRD | \
+#define PPC_ENCODE_MFVRD(a, t)		(PPC_INST_MFVSRD | \
 					       VSX_XX1((t)+32, a, R0))
-#define MTVRD(t, a)		stringify_in_c(.long PPC_INST_MTVSRD | \
+#define PPC_ENCODE_MTVRD(t, a)		(PPC_INST_MTVSRD | \
 					       VSX_XX1((t)+32, a, R0))
-#define VPMSUMW(t, a, b)	stringify_in_c(.long PPC_INST_VPMSUMW | \
+#define PPC_ENCODE_VPMSUMW(t, a, b)	(PPC_INST_VPMSUMW | \
 					       VSX_XX3((t), a, b))
-#define VPMSUMD(t, a, b)	stringify_in_c(.long PPC_INST_VPMSUMD | \
+#define PPC_ENCODE_VPMSUMD(t, a, b)	(PPC_INST_VPMSUMD | \
 					       VSX_XX3((t), a, b))
-#define XXLOR(t, a, b)		stringify_in_c(.long PPC_INST_XXLOR | \
+#define PPC_ENCODE_XXLOR(t, a, b)	(PPC_INST_XXLOR | \
 					       VSX_XX3((t), a, b))
-#define XXSWAPD(t, a)		stringify_in_c(.long PPC_INST_XXSWAPD | \
+#define PPC_ENCODE_XXSWAPD(t, a)	(PPC_INST_XXSWAPD | \
 					       VSX_XX3((t), a, a))
-#define XVCPSGNDP(t, a, b)	stringify_in_c(.long (PPC_INST_XVCPSGNDP | \
+#define PPC_ENCODE_XVCPSGNDP(t, a, b)	((PPC_INST_XVCPSGNDP | \
 					       VSX_XX3((t), (a), (b))))
 
-#define VPERMXOR(vrt, vra, vrb, vrc)				\
-	stringify_in_c(.long (PPC_INST_VPERMXOR |		\
-			      ___PPC_RT(vrt) | ___PPC_RA(vra) | \
-			      ___PPC_RB(vrb) | (((vrc) & 0x1f) << 6)))
+#define PPC_ENCODE_VPERMXOR(vrt, vra, vrb, vrc)				\
+					((PPC_INST_VPERMXOR |		\
+					___PPC_RT(vrt) | ___PPC_RA(vra) | \
+					___PPC_RB(vrb) | (((vrc) & 0x1f) << 6)))
 
-#define PPC_NAP			stringify_in_c(.long PPC_INST_NAP)
-#define PPC_SLEEP		stringify_in_c(.long PPC_INST_SLEEP)
-#define PPC_WINKLE		stringify_in_c(.long PPC_INST_WINKLE)
+#define PPC_ENCODE_NAP			(PPC_INST_NAP)
+#define PPC_ENCODE_SLEEP		(PPC_INST_SLEEP)
+#define PPC_ENCODE_WINKLE		(PPC_INST_WINKLE)
 
-#define PPC_STOP		stringify_in_c(.long PPC_INST_STOP)
+#define PPC_ENCODE_STOP			(PPC_INST_STOP)
 
 /* BHRB instructions */
-#define PPC_CLRBHRB		stringify_in_c(.long PPC_INST_CLRBHRB)
-#define PPC_MFBHRBE(r, n)	stringify_in_c(.long PPC_INST_BHRBE | \
+#define PPC_ENCODE_CLRBHRB		(PPC_INST_CLRBHRB)
+#define PPC_ENCODE_MFBHRBE(r, n)	(PPC_INST_BHRBE | \
 						__PPC_RT(r) | \
 							(((n) & 0x3ff) << 11))
 
 /* Transactional memory instructions */
-#define TRECHKPT		stringify_in_c(.long PPC_INST_TRECHKPT)
-#define TRECLAIM(r)		stringify_in_c(.long PPC_INST_TRECLAIM \
+#define PPC_ENCODE_TRECHKPT		(PPC_INST_TRECHKPT)
+#define PPC_ENCODE_TRECLAIM(r)		(PPC_INST_TRECLAIM \
 					       | __PPC_RA(r))
-#define TABORT(r)		stringify_in_c(.long PPC_INST_TABORT \
+#define PPC_ENCODE_TABORT(r)		(PPC_INST_TABORT \
 					       | __PPC_RA(r))
 
 /* book3e thread control instructions */
 #define TMRN(x)			((((x) & 0x1f) << 16) | (((x) & 0x3e0) << 6))
-#define MTTMR(tmr, r)		stringify_in_c(.long PPC_INST_MTTMR | \
+#define PPC_ENCODE_MTTMR(tmr, r)	(PPC_INST_MTTMR | \
 					       TMRN(tmr) | ___PPC_RS(r))
-#define MFTMR(tmr, r)		stringify_in_c(.long PPC_INST_MFTMR | \
+#define PPC_ENCODE_MFTMR(tmr, r)	(PPC_INST_MFTMR | \
 					       TMRN(tmr) | ___PPC_RT(r))
 
 /* Coprocessor instructions */
-#define PPC_ICSWX(s, a, b)	stringify_in_c(.long PPC_INST_ICSWX |	\
+#define PPC_ENCODE_ICSWX(s, a, b)	(PPC_INST_ICSWX |	\
 					       ___PPC_RS(s) |		\
 					       ___PPC_RA(a) |		\
 					       ___PPC_RB(b))
-#define PPC_ICSWEPX(s, a, b)	stringify_in_c(.long PPC_INST_ICSWEPX | \
+#define PPC_ENCODE_ICSWEPX(s, a, b)	(PPC_INST_ICSWEPX | \
 					       ___PPC_RS(s) |		\
 					       ___PPC_RA(a) |		\
 					       ___PPC_RB(b))
 
-#define PPC_SLBIA(IH)	stringify_in_c(.long PPC_INST_SLBIA | \
-				       ((IH & 0x7) << 21))
+#define PPC_ENCODE_SLBIA(IH)	(PPC_INST_SLBIA | \
+				       (((IH) & 0x7) << 21))
 
 /*
  * These may only be used on ISA v3.0 or later (aka. CPU_FTR_ARCH_300, radix
@@ -604,16 +604,126 @@
  * mode (on HPT these would also invalidate various SLBEs which may not be
  * desired).
  */
-#define PPC_ISA_3_0_INVALIDATE_ERAT	PPC_SLBIA(7)
-#define PPC_RADIX_INVALIDATE_ERAT_USER	PPC_SLBIA(3)
-#define PPC_RADIX_INVALIDATE_ERAT_GUEST	PPC_SLBIA(6)
+#define PPC_ENCODE_VCMPEQUD_RC(vrt, vra, vrb)	(PPC_INST_VCMPEQUD | \
+						___PPC_RT(vrt) | \
+						___PPC_RA(vra) | \
+						___PPC_RB(vrb) | __PPC_RC21)
+
+#define PPC_ENCODE_VCMPEQUB_RC(vrt, vra, vrb)	(PPC_INST_VCMPEQUB | \
+						___PPC_RT(vrt) | \
+						___PPC_RA(vra) | \
+						___PPC_RB(vrb) | __PPC_RC21)
+
+#define PPC_CP_ABORT        stringify_in_c(.long PPC_ENCODE_CP_ABORT)
+#define PPC_COPY(a, b)      stringify_in_c(.long PPC_ENCODE_COPY(a, b))
+#define PPC_DARN(t, l)      stringify_in_c(.long PPC_ENCODE_DARN(t, l))
+#define PPC_DCBAL(a, b)     stringify_in_c(.long PPC_ENCODE_DCBAL(a, b))
+#define PPC_DCBZL(a, b)     stringify_in_c(.long PPC_ENCODE_DCBZL(a, b))
+#define PPC_LQARX(t, a, b, eh) \
+			stringify_in_c(.long PPC_ENCODE_LQARX(t, a, b, eh))
+#define PPC_LDARX(t, a, b, eh) \
+			stringify_in_c(.long PPC_ENCODE_LDARX(t, a, b, eh))
+#define PPC_LWARX(t, a, b, eh) \
+			stringify_in_c(.long PPC_ENCODE_LWARX(t, a, b, eh))
+#define PPC_STQCX(t, a, b)  stringify_in_c(.long PPC_ENCODE_STQCX(t, a, b))
+#define PPC_MADDHD(t, a, b, c) \
+			stringify_in_c(.long PPC_ENCODE_MADDHD(t, a, b, c))
+#define PPC_MADDHDU(t, a, b, c) \
+			stringify_in_c(.long PPC_ENCODE_MADDHDU(t, a, b, c))
+#define PPC_MADDLD(t, a, b, c) \
+			stringify_in_c(.long PPC_ENCODE_MADDLD(t, a, b, c))
+#define PPC_MSGSND(b)       stringify_in_c(.long PPC_ENCODE_MSGSND(b))
+#define PPC_MSGSYNC         stringify_in_c(.long PPC_ENCODE_MSGSYNC)
+#define PPC_MSGCLR(b)       stringify_in_c(.long PPC_ENCODE_MSGCLR(b))
+#define PPC_MSGSNDP(b)      stringify_in_c(.long PPC_ENCODE_MSGSNDP(b))
+#define PPC_MSGCLRP(b)      stringify_in_c(.long PPC_ENCODE_MSGCLRP(b))
+#define PPC_PASTE(a, b)     stringify_in_c(.long PPC_ENCODE_PASTE(a, b))
+#define PPC_POPCNTB(a, s)   stringify_in_c(.long PPC_ENCODE_POPCNTB(a, s))
+#define PPC_POPCNTD(a, s)   stringify_in_c(.long PPC_ENCODE_POPCNTD(a, s))
+#define PPC_POPCNTW(a, s)   stringify_in_c(.long PPC_ENCODE_POPCNTW(a, s))
+#define PPC_RFCI            stringify_in_c(.long PPC_ENCODE_RFCI)
+#define PPC_RFDI            stringify_in_c(.long PPC_ENCODE_RFDI)
+#define PPC_RFMCI           stringify_in_c(.long PPC_ENCODE_RFMCI)
+#define PPC_TLBILX(t, a, b) stringify_in_c(.long PPC_ENCODE_TLBILX(t, a, b))
+#define PPC_TLBILX_ALL(a, b)	PPC_TLBILX(0, a, b)
+#define PPC_TLBILX_PID(a, b)	PPC_TLBILX(1, a, b)
+#define PPC_TLBILX_VA(a, b)	PPC_TLBILX(3, a, b)
+#define PPC_WAIT(w)         stringify_in_c(.long PPC_ENCODE_WAIT(w))
+#define PPC_TLBIE(lp, a)    stringify_in_c(.long PPC_ENCODE_TLBIE(lp, a))
+#define PPC_TLBIE_5(rb, rs, ric, prs, r) \
+			stringify_in_c(.long PPC_ENCODE_TLBIE_5(rb, \
+					rs, ric, prs, r))
+#define PPC_TLBIEL(rb, rs, ric, prs, r) \
+			stringify_in_c(.long PPC_ENCODE_TLBIEL(rb, rs, \
+					ric, prs, r))
+#define PPC_TLBSRX_DOT(a, b)stringify_in_c(.long PPC_ENCODE_TLBSRX_DOT(a, b))
+#define PPC_TLBIVAX(a, b)   stringify_in_c(.long PPC_ENCODE_TLBIVAX(a, b))
+
+#define PPC_ERATWE(s, a, w) stringify_in_c(.long PPC_ENCODE_ERATWE(s, a, w))
+#define PPC_ERATRE(s, a, w) stringify_in_c(.long PPC_ENCODE_ERATRE(s, a, w))
+#define PPC_ERATILX(t, a, b)stringify_in_c(.long PPC_ENCODE_ERATILX(t, a, b))
+#define PPC_ERATIVAX(s, a, b) \
+			stringify_in_c(.long PPC_ENCODE_ERATIVAX(s, a, b))
+#define PPC_ERATSX(t, a, w) stringify_in_c(.long PPC_ENCODE_ERATSX(t, a, w))
+#define PPC_ERATSX_DOT(t, a, w) \
+			stringify_in_c(.long PPC_ENCODE_ERATSX_DOT(t, a, w))
+#define PPC_SLBFEE_DOT(t, b)stringify_in_c(.long PPC_ENCODE_SLBFEE_DOT(t, b))
+#define __PPC_SLBFEE_DOT(t, b) \
+			stringify_in_c(.long __PPC_ENCODE_SLBFEE_DOT(t, b))
+#define PPC_ICBT(c, a, b)   stringify_in_c(.long PPC_ENCODE_ICBT(c, a, b))
+#define LBZCIX(t, a, b) stringify_in_c(.long PPC_ENCODE_LBZCIX(t, a, b))
+#define STBCIX(s, a, b) stringify_in_c(.long PPC_ENCODE_STBCIX(s, a, b))
+
+#define STXVD2X(s, a, b)stringify_in_c(.long PPC_ENCODE_STXVD2X(s, a, b))
+#define LXVD2X(s, a, b) stringify_in_c(.long PPC_ENCODE_LXVD2X(s, a, b))
+#define MFVRD(a, t)     stringify_in_c(.long PPC_ENCODE_MFVRD(a, t))
+#define MTVRD(t, a)     stringify_in_c(.long PPC_ENCODE_MTVRD(t, a))
+#define VPMSUMW(t, a, b)stringify_in_c(.long PPC_ENCODE_VPMSUMW(t, a, b))
+#define VPMSUMD(t, a, b)stringify_in_c(.long PPC_ENCODE_VPMSUMD(t, a, b))
+#define XXLOR(t, a, b)  stringify_in_c(.long PPC_ENCODE_XXLOR(t, a, b))
+#define XXSWAPD(t, a)   stringify_in_c(.long PPC_ENCODE_XXSWAPD(t, a))
+#define XVCPSGNDP(t, a, b) \
+			stringify_in_c(.long PPC_ENCODE_XVCPSGNDP(t, a, b))
+
+#define VPERMXOR(vrt, vra, vrb, vrc) \
+			stringify_in_c(.long PPC_ENCODE_VPERMXOR(vrt, vra, \
+					vrb, vrc))
+
+#define PPC_NAP             stringify_in_c(.long PPC_ENCODE_NAP)
+#define PPC_SLEEP           stringify_in_c(.long PPC_ENCODE_SLEEP)
+#define PPC_WINKLE          stringify_in_c(.long PPC_ENCODE_WINKLE)
+
+#define PPC_STOP            stringify_in_c(.long PPC_ENCODE_STOP)
+
+/* BHRB instructions */
+#define PPC_CLRBHRB         stringify_in_c(.long PPC_ENCODE_CLRBHRB)
+#define PPC_MFBHRBE(r, n)   stringify_in_c(.long PPC_ENCODE_MFBHRBE(r, n))
+
+/* Transactional memory instructions */
+#define TRECHKPT        stringify_in_c(.long PPC_ENCODE_TRECHKPT)
+#define TRECLAIM(r)     stringify_in_c(.long PPC_ENCODE_TRECLAIM(r))
+#define TABORT(r)       stringify_in_c(.long PPC_ENCODE_TABORT(r))
+
+/* book3e thread control instructions */
+#define MTTMR(tmr, r)   stringify_in_c(.long PPC_ENCODE_MTTMR(tmr, r))
+#define MFTMR(tmr, r)   stringify_in_c(.long PPC_ENCODE_MFTMR(tmr, r))
+
+/* Coprocessor instructions */
+#define PPC_ICSWX(s, a, b)  stringify_in_c(.long PPC_ENCODE_ICSWX(s, a, b))
+#define PPC_ICSWEPX(s, a, b)stringify_in_c(.long PPC_ENCODE_ICSWEPX(s, a, b))
+
+#define PPC_SLBIA(IH)       stringify_in_c(.long PPC_ENCODE_SLBIA(IH))
+
+#define PPC_ISA_3_0_INVALIDATE_ERAT     PPC_SLBIA(7)
+#define PPC_RADIX_INVALIDATE_ERAT_USER  PPC_SLBIA(3)
+#define PPC_RADIX_INVALIDATE_ERAT_GUEST PPC_SLBIA(6)
 
-#define VCMPEQUD_RC(vrt, vra, vrb)	stringify_in_c(.long PPC_INST_VCMPEQUD | \
-			      ___PPC_RT(vrt) | ___PPC_RA(vra) | \
-			      ___PPC_RB(vrb) | __PPC_RC21)
+#define VCMPEQUD_RC(vrt, vra, vrb) \
+			stringify_in_c(.long PPC_ENCODE_VCMPEQUD_RC(vrt, \
+					vra, vrb))
 
-#define VCMPEQUB_RC(vrt, vra, vrb)	stringify_in_c(.long PPC_INST_VCMPEQUB | \
-			      ___PPC_RT(vrt) | ___PPC_RA(vra) | \
-			      ___PPC_RB(vrb) | __PPC_RC21)
+#define VCMPEQUB_RC(vrt, vra, vrb) \
+			stringify_in_c(.long PPC_ENCODE_VCMPEQUB_RC(vrt, \
+					vra, vrb))
 
 #endif /* _ASM_POWERPC_PPC_OPCODE_H */
-- 
2.24.1

