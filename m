Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C1C286F8D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 09:34:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6NJQ2V3xzDqSS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 18:34:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rNdEJTty; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6N8R6CYLzDqRN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 18:27:51 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09872CGu123137; Thu, 8 Oct 2020 03:27:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DwrYbMBt/qoWWSCHYPoNp3MwUxQB/zrzTs3JDBbfN2w=;
 b=rNdEJTtyjLRr7liIayxoguTq24jw8DIZ4O9432Cs6vNu2gkqB9UMmJ3pSiLmIEC9mu/w
 QX5f95lBvynDVHjdw11/Z2uVQgVj+e446S1yitmjPqUdIfb8mpsIDMAKgYwgzRkYsOuO
 E/GuattLMykbpoaHs2nxH1u7KAwORGHY65cUxtzrgKrV/qKFyiCgKuyj0DtLibDH7aAU
 O82snJToaYR1wcxu/ziWfYCcnwWUTXiz3u1PTmG16rPsUwQ0LNzwf6SZjWHHoabVLVF8
 7mdXIfgRiYYMzm3vke+9EvAEM+nUxaQbqYHszNh/KTyZXeq2wkdqzsJXiPTWR74xaJl6 9A== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341wwr8xp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 03:27:46 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0987OkTO012301;
 Thu, 8 Oct 2020 07:27:45 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 33xgjhamh3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 07:27:44 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0987Rf5T17760680
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Oct 2020 07:27:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7D154C05C;
 Thu,  8 Oct 2020 07:27:41 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6D3B4C04A;
 Thu,  8 Oct 2020 07:27:39 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.37.242])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  8 Oct 2020 07:27:39 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4 3/4] powerpc/ppc-opcode: Add encoding macros for VSX vector
 paired instructions
Date: Thu,  8 Oct 2020 12:57:25 +0530
Message-Id: <20201008072726.233086-4-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201008072726.233086-1-ravi.bangoria@linux.ibm.com>
References: <20201008072726.233086-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-08_03:2020-10-08,
 2020-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=604 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=1 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010080050
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
Cc: ravi.bangoria@linux.ibm.com, bala24@linux.ibm.com, paulus@samba.org,
 sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Balamuruhan S <bala24@linux.ibm.com>

Add instruction encodings, DQ, D0, D1 immediate, XTP, XSP operands as
macros for new VSX vector paired instructions,
  * Load VSX Vector Paired (lxvp)
  * Load VSX Vector Paired Indexed (lxvpx)
  * Prefixed Load VSX Vector Paired (plxvp)
  * Store VSX Vector Paired (stxvp)
  * Store VSX Vector Paired Indexed (stxvpx)
  * Prefixed Store VSX Vector Paired (pstxvp)

Suggested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index a6e3700c4566..5e7918ca4fb7 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -78,6 +78,9 @@
 
 #define IMM_L(i)               ((uintptr_t)(i) & 0xffff)
 #define IMM_DS(i)              ((uintptr_t)(i) & 0xfffc)
+#define IMM_DQ(i)              ((uintptr_t)(i) & 0xfff0)
+#define IMM_D0(i)              (((uintptr_t)(i) >> 16) & 0x3ffff)
+#define IMM_D1(i)              IMM_L(i)
 
 /*
  * 16-bit immediate helper macros: HA() is for use with sign-extending instrs
@@ -295,6 +298,8 @@
 #define __PPC_XB(b)	((((b) & 0x1f) << 11) | (((b) & 0x20) >> 4))
 #define __PPC_XS(s)	((((s) & 0x1f) << 21) | (((s) & 0x20) >> 5))
 #define __PPC_XT(s)	__PPC_XS(s)
+#define __PPC_XSP(s)	((((s) & 0x1e) | (((s) >> 5) & 0x1)) << 21)
+#define __PPC_XTP(s)	__PPC_XSP(s)
 #define __PPC_T_TLB(t)	(((t) & 0x3) << 21)
 #define __PPC_WC(w)	(((w) & 0x3) << 21)
 #define __PPC_WS(w)	(((w) & 0x1f) << 11)
@@ -395,6 +400,14 @@
 #define PPC_RAW_XVCPSGNDP(t, a, b)	((0xf0000780 | VSX_XX3((t), (a), (b))))
 #define PPC_RAW_VPERMXOR(vrt, vra, vrb, vrc) \
 	((0x1000002d | ___PPC_RT(vrt) | ___PPC_RA(vra) | ___PPC_RB(vrb) | (((vrc) & 0x1f) << 6)))
+#define PPC_RAW_LXVP(xtp, a, i)		(0x18000000 | __PPC_XTP(xtp) | ___PPC_RA(a) | IMM_DQ(i))
+#define PPC_RAW_STXVP(xsp, a, i)	(0x18000001 | __PPC_XSP(xsp) | ___PPC_RA(a) | IMM_DQ(i))
+#define PPC_RAW_LXVPX(xtp, a, b)	(0x7c00029a | __PPC_XTP(xtp) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_STXVPX(xsp, a, b)	(0x7c00039a | __PPC_XSP(xsp) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_PLXVP(xtp, i, a, pr) \
+	((PPC_PREFIX_8LS | __PPC_PRFX_R(pr) | IMM_D0(i)) << 32 | (0xe8000000 | __PPC_XTP(xtp) | ___PPC_RA(a) | IMM_D1(i)))
+#define PPC_RAW_PSTXVP(xsp, i, a, pr) \
+	((PPC_PREFIX_8LS | __PPC_PRFX_R(pr) | IMM_D0(i)) << 32 | (0xf8000000 | __PPC_XSP(xsp) | ___PPC_RA(a) | IMM_D1(i)))
 #define PPC_RAW_NAP			(0x4c000364)
 #define PPC_RAW_SLEEP			(0x4c0003a4)
 #define PPC_RAW_WINKLE			(0x4c0003e4)
-- 
2.26.2

