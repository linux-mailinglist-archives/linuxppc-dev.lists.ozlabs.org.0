Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7E91B6EE7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 09:24:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497lzN6XpyzDr9B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 17:24:16 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 497lfS0x4fzDqx5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 17:09:35 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03O73QpI033247; Fri, 24 Apr 2020 03:09:28 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30kk5t53nb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 03:09:28 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03O73StW033296;
 Fri, 24 Apr 2020 03:09:28 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30kk5t53mp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 03:09:27 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03O76xLX004077;
 Fri, 24 Apr 2020 07:09:26 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 30fs658u03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 07:09:26 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03O79NvA55443520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 07:09:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43B28A4059;
 Fri, 24 Apr 2020 07:09:23 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E2A4A404D;
 Fri, 24 Apr 2020 07:09:21 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.95.110])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Apr 2020 07:09:21 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [RFC PATCH v2 5/7] powerpc/ppc-opcode: reuse raw instruction macros
 to stringify
Date: Fri, 24 Apr 2020 12:38:51 +0530
Message-Id: <20200424070853.443969-6-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200424070853.443969-1-bala24@linux.ibm.com>
References: <20200424070853.443969-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_02:2020-04-23,
 2020-04-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=1 impostorscore=0 malwarescore=0
 mlxlogscore=858 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004240052
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

Wrap existing stringify macros to reuse raw instruction encoding macros that
are newly added.

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h | 220 +++++++++-----------------
 1 file changed, 71 insertions(+), 149 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 6b9a891884be..34584df0ebc4 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -778,166 +778,92 @@
 						___PPC_RA(a))
 
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
-					___PPC_RB(b) | __PPC_EH(eh))
-#define PPC_LDARX(t, a, b, eh)	stringify_in_c(.long PPC_INST_LDARX | \
-					___PPC_RT(t) | ___PPC_RA(a) | \
-					___PPC_RB(b) | __PPC_EH(eh))
-#define PPC_LWARX(t, a, b, eh)	stringify_in_c(.long PPC_INST_LWARX | \
-					___PPC_RT(t) | ___PPC_RA(a) | \
-					___PPC_RB(b) | __PPC_EH(eh))
-#define PPC_STQCX(t, a, b)	stringify_in_c(.long PPC_INST_STQCX | \
-					___PPC_RT(t) | ___PPC_RA(a) | \
-					___PPC_RB(b))
-#define PPC_MADDHD(t, a, b, c)	stringify_in_c(.long PPC_INST_MADDHD | \
-					___PPC_RT(t) | ___PPC_RA(a)  | \
-					___PPC_RB(b) | ___PPC_RC(c))
-#define PPC_MADDHDU(t, a, b, c)	stringify_in_c(.long PPC_INST_MADDHDU | \
-					___PPC_RT(t) | ___PPC_RA(a)   | \
-					___PPC_RB(b) | ___PPC_RC(c))
-#define PPC_MADDLD(t, a, b, c)	stringify_in_c(.long PPC_INST_MADDLD | \
-					___PPC_RT(t) | ___PPC_RA(a)  | \
-					___PPC_RB(b) | ___PPC_RC(c))
-#define PPC_MSGSND(b)		stringify_in_c(.long PPC_INST_MSGSND | \
-					___PPC_RB(b))
-#define PPC_MSGSYNC		stringify_in_c(.long PPC_INST_MSGSYNC)
-#define PPC_MSGCLR(b)		stringify_in_c(.long PPC_INST_MSGCLR | \
-					___PPC_RB(b))
-#define PPC_MSGSNDP(b)		stringify_in_c(.long PPC_INST_MSGSNDP | \
-					___PPC_RB(b))
-#define PPC_MSGCLRP(b)		stringify_in_c(.long PPC_INST_MSGCLRP | \
-					___PPC_RB(b))
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
+#define	PPC_CP_ABORT		stringify_in_c(.long PPC_RAW_CP_ABORT)
+#define	PPC_COPY(a, b)		stringify_in_c(.long PPC_RAW_COPY(a, b))
+#define PPC_DARN(t, l)		stringify_in_c(.long PPC_RAW_DARN(t, l))
+#define	PPC_DCBAL(a, b)		stringify_in_c(.long PPC_RAW_DCBAL(a, b))
+#define	PPC_DCBZL(a, b)		stringify_in_c(.long PPC_RAW_DCBZL(a, b))
+#define PPC_LQARX(t, a, b, eh)	stringify_in_c(.long PPC_RAW_LQARX(t, a, b, eh))
+#define PPC_LDARX(t, a, b, eh)	stringify_in_c(.long PPC_RAW_LDARX(t, a, b, eh))
+#define PPC_LWARX(t, a, b, eh)	stringify_in_c(.long PPC_RAW_LWARX(t, a, b, eh))
+#define PPC_STQCX(t, a, b)	stringify_in_c(.long PPC_RAW_STQCX(t, a, b))
+#define PPC_MADDHD(t, a, b, c)	stringify_in_c(.long PPC_RAW_MADDHD(t, a, b, c))
+#define PPC_MADDHDU(t, a, b, c)	stringify_in_c(.long PPC_RAW_MADDHDU(t, a, b, c))
+#define PPC_MADDLD(t, a, b, c)	stringify_in_c(.long PPC_RAW_MADDLD(t, a, b, c))
+#define PPC_MSGSND(b)		stringify_in_c(.long PPC_RAW_MSGSND(b))
+#define PPC_MSGSYNC		stringify_in_c(.long PPC_RAW_MSGSYNC)
+#define PPC_MSGCLR(b)		stringify_in_c(.long PPC_RAW_MSGCLR(b))
+#define PPC_MSGSNDP(b)		stringify_in_c(.long PPC_RAW_MSGSNDP(b))
+#define PPC_MSGCLRP(b)		stringify_in_c(.long PPC_RAW_MSGCLRP(b))
+#define PPC_PASTE(a, b)		stringify_in_c(.long PPC_RAW_PASTE(a, b))
+#define PPC_POPCNTB(a, s)	stringify_in_c(.long PPC_RAW_POPCNTB(a, s))
+#define PPC_POPCNTD(a, s)	stringify_in_c(.long PPC_RAW_POPCNTD(a, s))
+#define PPC_POPCNTW(a, s)	stringify_in_c(.long PPC_RAW_POPCNTW(a, s))
+#define PPC_RFCI		stringify_in_c(.long PPC_RAW_RFCI)
+#define PPC_RFDI		stringify_in_c(.long PPC_RAW_RFDI)
+#define PPC_RFMCI		stringify_in_c(.long PPC_RAW_RFMCI)
+#define PPC_TLBILX(t, a, b)	stringify_in_c(.long PPC_RAW_TLBILX(t, a, b))
 #define PPC_TLBILX_ALL(a, b)	PPC_TLBILX(0, a, b)
 #define PPC_TLBILX_PID(a, b)	PPC_TLBILX(1, a, b)
 #define PPC_TLBILX_VA(a, b)	PPC_TLBILX(3, a, b)
-#define PPC_WAIT(w)		stringify_in_c(.long PPC_INST_WAIT | \
-					__PPC_WC(w))
-#define PPC_TLBIE(lp,a) 	stringify_in_c(.long PPC_INST_TLBIE | \
-					       ___PPC_RB(a) | ___PPC_RS(lp))
-#define	PPC_TLBIE_5(rb,rs,ric,prs,r) \
-				stringify_in_c(.long PPC_INST_TLBIE | \
-					___PPC_RB(rb) | ___PPC_RS(rs) | \
-					___PPC_RIC(ric) | ___PPC_PRS(prs) | \
-					___PPC_R(r))
+#define PPC_WAIT(w)		stringify_in_c(.long PPC_RAW_WAIT(w))
+#define PPC_TLBIE(lp, a) 	stringify_in_c(.long PPC_RAW_TLBIE(lp, a))
+#define	PPC_TLBIE_5(rb, rs, ric, prs, r) \
+				stringify_in_c(.long PPC_RAW_TLBIE_5(rb, rs, ric, prs, r))
 #define	PPC_TLBIEL(rb,rs,ric,prs,r) \
-				stringify_in_c(.long PPC_INST_TLBIEL | \
-					___PPC_RB(rb) | ___PPC_RS(rs) | \
-					___PPC_RIC(ric) | ___PPC_PRS(prs) | \
-					___PPC_R(r))
-#define PPC_TLBSRX_DOT(a,b)	stringify_in_c(.long PPC_INST_TLBSRX_DOT | \
-					__PPC_RA0(a) | __PPC_RB(b))
-#define PPC_TLBIVAX(a,b)	stringify_in_c(.long PPC_INST_TLBIVAX | \
-					__PPC_RA0(a) | __PPC_RB(b))
-
-#define PPC_ERATWE(s, a, w)	stringify_in_c(.long PPC_INST_ERATWE | \
-					__PPC_RS(s) | __PPC_RA(a) | __PPC_WS(w))
-#define PPC_ERATRE(s, a, w)	stringify_in_c(.long PPC_INST_ERATRE | \
-					__PPC_RS(s) | __PPC_RA(a) | __PPC_WS(w))
-#define PPC_ERATILX(t, a, b)	stringify_in_c(.long PPC_INST_ERATILX | \
-					__PPC_T_TLB(t) | __PPC_RA0(a) | \
-					__PPC_RB(b))
-#define PPC_ERATIVAX(s, a, b)	stringify_in_c(.long PPC_INST_ERATIVAX | \
-					__PPC_RS(s) | __PPC_RA0(a) | __PPC_RB(b))
-#define PPC_ERATSX(t, a, w)	stringify_in_c(.long PPC_INST_ERATSX | \
-					__PPC_RS(t) | __PPC_RA0(a) | __PPC_RB(b))
-#define PPC_ERATSX_DOT(t, a, w)	stringify_in_c(.long PPC_INST_ERATSX_DOT | \
-					__PPC_RS(t) | __PPC_RA0(a) | __PPC_RB(b))
-#define PPC_SLBFEE_DOT(t, b)	stringify_in_c(.long PPC_INST_SLBFEE | \
-					__PPC_RT(t) | __PPC_RB(b))
-#define __PPC_SLBFEE_DOT(t, b)	stringify_in_c(.long PPC_INST_SLBFEE |	\
-					       ___PPC_RT(t) | ___PPC_RB(b))
-#define PPC_ICBT(c,a,b)		stringify_in_c(.long PPC_INST_ICBT | \
-				       __PPC_CT(c) | __PPC_RA0(a) | __PPC_RB(b))
+				stringify_in_c(.long PPC_RAW_TLBIEL(rb, rs, ric, prs, r))
+#define PPC_TLBSRX_DOT(a, b)	stringify_in_c(.long PPC_RAW_TLBSRX_DOT(a, b))
+#define PPC_TLBIVAX(a, b)	stringify_in_c(.long PPC_RAW_TLBIVAX(a, b))
+
+#define PPC_ERATWE(s, a, w)	stringify_in_c(.long PPC_RAW_ERATWE(s, a, w))
+#define PPC_ERATRE(s, a, w)	stringify_in_c(.long PPC_RAW_ERATRE(a, a, w))
+#define PPC_ERATILX(t, a, b)	stringify_in_c(.long PPC_RAW_ERATILX(t, a, b))
+#define PPC_ERATIVAX(s, a, b)	stringify_in_c(.long PPC_RAW_ERATIVAX(s, a, b))
+#define PPC_ERATSX(t, a, w)	stringify_in_c(.long PPC_RAW_ERATSX(t, a, w))
+#define PPC_ERATSX_DOT(t, a, w)	stringify_in_c(.long PPC_RAW_ERATSX_DOT(t, a, w))
+#define PPC_SLBFEE_DOT(t, b)	stringify_in_c(.long PPC_RAW_SLBFEE_DOT(t, b))
+#define __PPC_SLBFEE_DOT(t, b)	stringify_in_c(.long __PPC_RAW_SLBFEE_DOT(t, b))
+#define PPC_ICBT(c, a, b)	stringify_in_c(.long PPC_RAW_ICBT(c, a, b))
 /* PASemi instructions */
-#define LBZCIX(t,a,b)		stringify_in_c(.long PPC_INST_LBZCIX | \
-				       __PPC_RT(t) | __PPC_RA(a) | __PPC_RB(b))
-#define STBCIX(s,a,b)		stringify_in_c(.long PPC_INST_STBCIX | \
-				       __PPC_RS(s) | __PPC_RA(a) | __PPC_RB(b))
-#define STXVD2X(s, a, b)	stringify_in_c(.long PPC_INST_STXVD2X | \
-					       VSX_XX1((s), a, b))
-#define LXVD2X(s, a, b)		stringify_in_c(.long PPC_INST_LXVD2X | \
-					       VSX_XX1((s), a, b))
-#define MFVRD(a, t)		stringify_in_c(.long PPC_INST_MFVSRD | \
-					       VSX_XX1((t)+32, a, R0))
-#define MTVRD(t, a)		stringify_in_c(.long PPC_INST_MTVSRD | \
-					       VSX_XX1((t)+32, a, R0))
-#define VPMSUMW(t, a, b)	stringify_in_c(.long PPC_INST_VPMSUMW | \
-					       VSX_XX3((t), a, b))
-#define VPMSUMD(t, a, b)	stringify_in_c(.long PPC_INST_VPMSUMD | \
-					       VSX_XX3((t), a, b))
-#define XXLOR(t, a, b)		stringify_in_c(.long PPC_INST_XXLOR | \
-					       VSX_XX3((t), a, b))
-#define XXSWAPD(t, a)		stringify_in_c(.long PPC_INST_XXSWAPD | \
-					       VSX_XX3((t), a, a))
-#define XVCPSGNDP(t, a, b)	stringify_in_c(.long (PPC_INST_XVCPSGNDP | \
-					       VSX_XX3((t), (a), (b))))
+#define LBZCIX(t, a, b)		stringify_in_c(.long PPC_RAW_LBZCIX(t, a, b))
+#define STBCIX(s, a, b)		stringify_in_c(.long PPC_RAW_STBCIX(s, a, b))
+#define STXVD2X(s, a, b)	stringify_in_c(.long PPC_RAW_STXVD2X(s, a, b))
+#define LXVD2X(s, a, b)		stringify_in_c(.long PPC_RAW_LXVD2X(s, a, b))
+#define MFVRD(a, t)		stringify_in_c(.long PPC_RAW_MFVRD(a, t))
+#define MTVRD(t, a)		stringify_in_c(.long PPC_RAW_MTVRD(t, a))
+#define VPMSUMW(t, a, b)	stringify_in_c(.long PPC_RAW_VPMSUMW(t, a, b))
+#define VPMSUMD(t, a, b)	stringify_in_c(.long PPC_RAW_VPMSUMD(t, a, b))
+#define XXLOR(t, a, b)		stringify_in_c(.long PPC_RAW_XXLOR(t, a, b))
+#define XXSWAPD(t, a)		stringify_in_c(.long PPC_RAW_XXSWAPD(t, a))
+#define XVCPSGNDP(t, a, b)	stringify_in_c(.long (PPC_RAW_XVCPSGNDP(t, a, b)))
 
 #define VPERMXOR(vrt, vra, vrb, vrc)				\
-	stringify_in_c(.long (PPC_INST_VPERMXOR |		\
-			      ___PPC_RT(vrt) | ___PPC_RA(vra) | \
-			      ___PPC_RB(vrb) | (((vrc) & 0x1f) << 6)))
+	stringify_in_c(.long (PPC_RAW_VPERMXOR(vrt, vra, vrb, vrc)))
 
-#define PPC_NAP			stringify_in_c(.long PPC_INST_NAP)
-#define PPC_SLEEP		stringify_in_c(.long PPC_INST_SLEEP)
-#define PPC_WINKLE		stringify_in_c(.long PPC_INST_WINKLE)
+#define PPC_NAP			stringify_in_c(.long PPC_RAW_NAP)
+#define PPC_SLEEP		stringify_in_c(.long PPC_RAW_SLEEP)
+#define PPC_WINKLE		stringify_in_c(.long PPC_RAW_WINKLE)
 
-#define PPC_STOP		stringify_in_c(.long PPC_INST_STOP)
+#define PPC_STOP		stringify_in_c(.long PPC_RAW_STOP)
 
 /* BHRB instructions */
-#define PPC_CLRBHRB		stringify_in_c(.long PPC_INST_CLRBHRB)
-#define PPC_MFBHRBE(r, n)	stringify_in_c(.long PPC_INST_BHRBE | \
-						__PPC_RT(r) | \
-							(((n) & 0x3ff) << 11))
+#define PPC_CLRBHRB		stringify_in_c(.long PPC_RAW_CLRBHRB)
+#define PPC_MFBHRBE(r, n)	stringify_in_c(.long PPC_RAW_MFBHRBE(r, n))
 
 /* Transactional memory instructions */
-#define TRECHKPT		stringify_in_c(.long PPC_INST_TRECHKPT)
-#define TRECLAIM(r)		stringify_in_c(.long PPC_INST_TRECLAIM \
-					       | __PPC_RA(r))
-#define TABORT(r)		stringify_in_c(.long PPC_INST_TABORT \
-					       | __PPC_RA(r))
+#define TRECHKPT		stringify_in_c(.long PPC_RAW_TRECHKPT)
+#define TRECLAIM(r)		stringify_in_c(.long PPC_RAW_TRECLAIM(r))
+#define TABORT(r)		stringify_in_c(.long PPC_RAW_TABORT(r))
 
 /* book3e thread control instructions */
-#define MTTMR(tmr, r)		stringify_in_c(.long PPC_INST_MTTMR | \
-					       TMRN(tmr) | ___PPC_RS(r))
-#define MFTMR(tmr, r)		stringify_in_c(.long PPC_INST_MFTMR | \
-					       TMRN(tmr) | ___PPC_RT(r))
+#define MTTMR(tmr, r)		stringify_in_c(.long PPC_RAW_MTTMR(tmr, r))
+#define MFTMR(tmr, r)		stringify_in_c(.long PPC_RAW_MFTMR(tmr, r))
 
 /* Coprocessor instructions */
-#define PPC_ICSWX(s, a, b)	stringify_in_c(.long PPC_INST_ICSWX |	\
-					       ___PPC_RS(s) |		\
-					       ___PPC_RA(a) |		\
-					       ___PPC_RB(b))
-#define PPC_ICSWEPX(s, a, b)	stringify_in_c(.long PPC_INST_ICSWEPX | \
-					       ___PPC_RS(s) |		\
-					       ___PPC_RA(a) |		\
-					       ___PPC_RB(b))
-
-#define PPC_SLBIA(IH)	stringify_in_c(.long PPC_INST_SLBIA | \
-				       ((IH & 0x7) << 21))
+#define PPC_ICSWX(s, a, b)	stringify_in_c(.long PPC_RAW_ICSWX(s, a, b))
+#define PPC_ICSWEPX(s, a, b)	stringify_in_c(.long PPC_RAW_ICSWEPX(s, a, b))
+
+#define PPC_SLBIA(IH)	stringify_in_c(.long PPC_RAW_SLBIA(IH))
 
 /*
  * These may only be used on ISA v3.0 or later (aka. CPU_FTR_ARCH_300, radix
@@ -949,12 +875,8 @@
 #define PPC_RADIX_INVALIDATE_ERAT_USER	PPC_SLBIA(3)
 #define PPC_RADIX_INVALIDATE_ERAT_GUEST	PPC_SLBIA(6)
 
-#define VCMPEQUD_RC(vrt, vra, vrb)	stringify_in_c(.long PPC_INST_VCMPEQUD | \
-			      ___PPC_RT(vrt) | ___PPC_RA(vra) | \
-			      ___PPC_RB(vrb) | __PPC_RC21)
+#define VCMPEQUD_RC(vrt, vra, vrb)	stringify_in_c(.long PPC_RAW_VCMPEQUD_RC(vrt, vra, vrb))
 
-#define VCMPEQUB_RC(vrt, vra, vrb)	stringify_in_c(.long PPC_INST_VCMPEQUB | \
-			      ___PPC_RT(vrt) | ___PPC_RA(vra) | \
-			      ___PPC_RB(vrb) | __PPC_RC21)
+#define VCMPEQUB_RC(vrt, vra, vrb)	stringify_in_c(.long PPC_RAW_VCMPEQUB_RC(vrt, vra, vrb))
 
 #endif /* _ASM_POWERPC_PPC_OPCODE_H */
-- 
2.24.1

