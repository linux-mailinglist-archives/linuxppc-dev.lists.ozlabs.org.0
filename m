Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74E164DAAE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 12:54:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXrHv5Tx1z3cHG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 22:54:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WPnD+sOi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WPnD+sOi;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXrGw5b0Jz3bNw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 22:53:43 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BFBhqT1027378;
	Thu, 15 Dec 2022 11:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=KMsyXNo4wrG3JGbanD30ONjK9LdvZThpq8x1OMRG4uU=;
 b=WPnD+sOi0KDK17JKV18Fqo6Z6CzLukIQ5bCrxwE2mNTKgurFZNkY8qzCBGckxBTM5e9W
 oBzpe6otvDpb1zxabQuI6Rbuy2qTl0b1yIHlG/grEYEEJim1r+/vtE2lsJJhmz+veylJ
 +8J09sEJnnSRRExr8lVSD7fd5hEaw+Ac3BOGctfWIISmus51Vh0EcLPNFtmfR9RVI+Eg
 y7pnF8ecx2ELa1W4xJj8TLsZImxf7k9w7qAOXnVW1DbsSwUIyfV3OXWTZ8zSwOsUmSql
 5W7OKLDOztTSeeCMbwGjogpD9T86bxh95q2bYiS7BJeSwgNPbA+Oc48bnMLiz40gUYYa 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg2ydg5kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Dec 2022 11:53:10 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BFBr9iF019169;
	Thu, 15 Dec 2022 11:53:10 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mg2ydg5jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Dec 2022 11:53:09 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BF3WsuK004709;
	Thu, 15 Dec 2022 11:53:07 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3meyqy26gd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Dec 2022 11:53:07 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BFBr4Df32899430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Dec 2022 11:53:05 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D53A320040;
	Thu, 15 Dec 2022 11:53:04 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75F3320049;
	Thu, 15 Dec 2022 11:53:01 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.in.ibm.com (unknown [9.109.198.229])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Dec 2022 11:53:01 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/32: Curb objtool unannotated intra-function call warning
Date: Thu, 15 Dec 2022 17:22:58 +0530
Message-Id: <20221215115258.80810-1-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gl-UhVaEhy6ypk6gAQVSYI9QrfNV9cqq
X-Proofpoint-GUID: VrzvWT3dZ9Izk71RqyGQGcFCZXugUM3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_05,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 mlxlogscore=923 impostorscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212150086
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
Cc: sfr@canb.auug.org.au, peterz@infradead.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, npiggin@gmail.com, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

objtool throws the following warning:
arch/powerpc/kexec/relocate_32.o: warning: objtool: .text+0x2bc: unannotated intra-function call

Fix this warning by annotating intra-function call, using
ANNOTATE_INTRA_FUNCTION_CALL macro, to indicate that the branch target
is valid.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 arch/powerpc/kexec/relocate_32.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kexec/relocate_32.S b/arch/powerpc/kexec/relocate_32.S
index d9f0dd9b34ff..104c9911f406 100644
--- a/arch/powerpc/kexec/relocate_32.S
+++ b/arch/powerpc/kexec/relocate_32.S
@@ -8,6 +8,7 @@
  * 		Author: Suzuki Poulose <suzuki@in.ibm.com>
  */
 
+#include <linux/objtool.h>
 #include <asm/reg.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
@@ -349,6 +350,7 @@ write_utlb:
 	cmpwi	r10, PPC47x_TLB0_4K
 	bne	0f
 	li	r10, 0x1000			/* r10 = 4k */
+	ANNOTATE_INTRA_FUNCTION_CALL
 	bl	1f
 
 0:
-- 
2.31.1

