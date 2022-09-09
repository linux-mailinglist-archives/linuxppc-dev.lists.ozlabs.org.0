Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DED5B3E15
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 19:41:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPNb04xFhz3c6N
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 03:41:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DDc/Z4ey;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DDc/Z4ey;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPNZK335kz3bWm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 03:40:56 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289HL7p2031674;
	Fri, 9 Sep 2022 17:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=TPcuhxnks6PYWHdEmLKwIjk95a9bKSNng35UZE4RwpE=;
 b=DDc/Z4eyJb3OtYWeTezPt3k5a7YhDHgvhyErdz+HwQFUU1MDsNXPW5HQtBEHgB7gy0HZ
 HHRzpUB/eM3KhuiwUASfUNc9zcEnjA+qBbWCRJ70IgQyVPJoaQSGdI/MdIFWqQ6dME/Z
 gbhFA5bkFgnPTDqbn5+gT1VTleSRBKL9+NfdbAL8xYrncKvj0CbU6D2pd47pnNQWkJ0D
 gEnfvnneP4VdXsZYWiMflXqVhnwmUE0YMJEgEx/vrvdM93EB5IPogxmV1XUiApJhyL2A
 dXVJ0LiKMHByz4Iu1sPmID/QIXxXeG28vt3Xg1sfKx7getqEHhenkxNJNpRFYryoJIHS Iw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg9t7gf7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 17:40:49 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 289HJZPl011747;
	Fri, 9 Sep 2022 17:40:47 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03fra.de.ibm.com with ESMTP id 3jbxj8x542-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 17:40:47 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 289HeiFl43450744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Sep 2022 17:40:44 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85E435204F;
	Fri,  9 Sep 2022 17:40:44 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.65.105.173])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2530A5204E;
	Fri,  9 Sep 2022 17:40:41 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] ppc64/kdump: Limit kdump base to 512MB
Date: Fri,  9 Sep 2022 23:10:34 +0530
Message-Id: <20220909174034.34086-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Aqzs-O4C7LLv4_Kf0XGAgzmeRXPCHGLG
X-Proofpoint-ORIG-GUID: Aqzs-O4C7LLv4_Kf0XGAgzmeRXPCHGLG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_08,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 suspectscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209090061
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit e641eb03ab2b0 ("powerpc: Fix up the kdump base cap to
128M") memory for kdump kernel has been reserved at an offset of
128MB. This held up well for a long time before running into boot
failure on LPARs having a lot of cores. Commit 7c5ed82b800d8
("powerpc: Set crashkernel offset to mid of RMA region") fixed this
boot failure by moving the offset to mid of RMA region. Limit this
offset to 512MB to avoid running into boot failures, during kdump
kernel boot, due RTAS or other allocation restrictions.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kexec/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index cf84bfe9e27e..c2cbfcf81cea 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -136,7 +136,7 @@ void __init reserve_crashkernel(void)
 #ifdef CONFIG_PPC64
 		/*
 		 * On the LPAR platform place the crash kernel to mid of
-		 * RMA size (512MB or more) to ensure the crash kernel
+		 * RMA size (max. of 512MB) to ensure the crash kernel
 		 * gets enough space to place itself and some stack to be
 		 * in the first segment. At the same time normal kernel
 		 * also get enough space to allocate memory for essential
@@ -144,7 +144,7 @@ void __init reserve_crashkernel(void)
 		 * kernel starts at 128MB offset on other platforms.
 		 */
 		if (firmware_has_feature(FW_FEATURE_LPAR))
-			crashk_res.start = ppc64_rma_size / 2;
+			crashk_res.start = min(0x20000000ULL, (ppc64_rma_size / 2));
 		else
 			crashk_res.start = min(0x8000000ULL, (ppc64_rma_size / 2));
 #else
-- 
2.37.3

