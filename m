Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3574EC630
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 16:09:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KT7b258Ttz3c4X
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 01:09:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cx4rDFSj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cx4rDFSj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KT7Yf5xSmz2xtJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 01:07:50 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UDiCBQ018228; 
 Wed, 30 Mar 2022 14:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fcK3Ud+Kz/qBEYcswjB5z3SJlF89CUPUsigWLXL3Avo=;
 b=cx4rDFSjmDyQS71BDm2lL4OufTfJY5DZSiZALVIy/8YJkNB+1OqRroCmF6MhJjQZ5FDJ
 +L29fNeLJEoNAJ4JtNnhm/JpmeuSMtUbkp1S6JPBWVtDpDJIOxuc1Yv8q1pYVprIMrlC
 7alb/2qFATpFjA9zRWfoXXgMnk3PrkaYztnduqFdPSWxA7U3YJHXBSJyMBwD/svEUvE/
 NCf65bFyRbvE9WgWN0r2exrVL5jJMlbql8aSTNdZNyRkWGkMe2kluy1xr/6ZWva/s9Tc
 AgH5M+d9kF+1Y1/SgITfqcrquYYNY18vk2Thqc5PaerVUrrXNynYl/YH2tokl99nxg9C Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f3y91qhhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 14:07:42 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22UDuVNU010144;
 Wed, 30 Mar 2022 14:07:42 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f3y91qhhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 14:07:42 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22UE2Q0h009300;
 Wed, 30 Mar 2022 14:07:40 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3f1tf8ye2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 14:07:40 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22UDtc5Z47579444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 13:55:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6A61A4053;
 Wed, 30 Mar 2022 14:07:37 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34EB2A4051;
 Wed, 30 Mar 2022 14:07:36 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.30.177])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 30 Mar 2022 14:07:35 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, mopsfelder@gmail.com
Subject: [PATCH v2 1/3] powerpc: Sort and de-dup primary opcodes in
 ppc-opcode.h
Date: Wed, 30 Mar 2022 19:37:17 +0530
Message-Id: <a05edf638a2638d708fc2db0272f6317837b5eab.1648648712.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1648648712.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1648648712.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DXMONNz7ThcjXu6TWLKCPk32G1RWW6bD
X-Proofpoint-GUID: -4MTiKY3HGMyXlf98p4jhuK-pMjZ77Li
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_04,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 mlxlogscore=892 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203300069
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some of the primary opcodes are duplicated. Remove those, and sort the
rest of the primary opcodes to make it easy to read.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h | 69 ++++++++++++---------------
 1 file changed, 31 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 82f1f0041c6f79..a5d89cd3e8d12d 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -127,8 +127,37 @@
 
 
 /* opcode and xopcode for instructions */
-#define OP_TRAP 3
-#define OP_TRAP_64 2
+#define OP_PREFIX	1
+#define OP_TRAP_64	2
+#define OP_TRAP		3
+#define OP_31		31
+#define OP_LWZ		32
+#define OP_LWZU		33
+#define OP_LBZ		34
+#define OP_LBZU		35
+#define OP_STW		36
+#define OP_STWU		37
+#define OP_STB		38
+#define OP_STBU		39
+#define OP_LHZ		40
+#define OP_LHZU		41
+#define OP_LHA		42
+#define OP_LHAU		43
+#define OP_STH		44
+#define OP_STHU		45
+#define OP_LMW		46
+#define OP_STMW		47
+#define OP_LFS		48
+#define OP_LFSU		49
+#define OP_LFD		50
+#define OP_LFDU		51
+#define OP_STFS		52
+#define OP_STFSU	53
+#define OP_STFD		54
+#define OP_STFDU	55
+#define OP_LQ		56
+#define OP_LD		58
+#define OP_STD		62
 
 #define OP_31_XOP_TRAP      4
 #define OP_31_XOP_LDX       21
@@ -208,42 +237,6 @@
 /* VMX Vector Store Instructions */
 #define OP_31_XOP_STVX          231
 
-/* Prefixed Instructions */
-#define OP_PREFIX		1
-
-#define OP_31   31
-#define OP_LWZ  32
-#define OP_STFS 52
-#define OP_STFSU 53
-#define OP_STFD 54
-#define OP_STFDU 55
-#define OP_LD   58
-#define OP_LWZU 33
-#define OP_LBZ  34
-#define OP_LBZU 35
-#define OP_STW  36
-#define OP_STWU 37
-#define OP_STD  62
-#define OP_STB  38
-#define OP_STBU 39
-#define OP_LHZ  40
-#define OP_LHZU 41
-#define OP_LHA  42
-#define OP_LHAU 43
-#define OP_STH  44
-#define OP_STHU 45
-#define OP_LMW  46
-#define OP_STMW 47
-#define OP_LFS  48
-#define OP_LFSU 49
-#define OP_LFD  50
-#define OP_LFDU 51
-#define OP_STFS 52
-#define OP_STFSU 53
-#define OP_STFD  54
-#define OP_STFDU 55
-#define OP_LQ    56
-
 /* sorted alphabetically */
 #define PPC_INST_BCCTR_FLUSH		0x4c400420
 #define PPC_INST_COPY			0x7c20060c
-- 
2.35.1

