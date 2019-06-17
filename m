Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF49049450
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 23:37:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SPhJ68QLzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 07:37:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gromero@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SPRG1hdKzDqRm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 07:26:30 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5HLC1Ok146140
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 17:26:26 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t6f9r7r32-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 17:26:26 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <gromero@linux.vnet.ibm.com>;
 Mon, 17 Jun 2019 22:26:25 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 17 Jun 2019 22:26:08 +0100
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5HLQ7H431129944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jun 2019 21:26:07 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23EB5AE05C;
 Mon, 17 Jun 2019 21:26:07 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3ABCAE05F;
 Mon, 17 Jun 2019 21:26:04 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.140.184])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jun 2019 21:26:04 +0000 (GMT)
From: Gustavo Romero <gromero@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: Fix earlyclobber in tm-vmxcopy
Date: Mon, 17 Jun 2019 17:24:58 -0400
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 19061721-0052-0000-0000-000003D221BA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011281; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01219432; UDB=6.00641413; IPR=6.01000573; 
 MB=3.00027350; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-17 21:26:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061721-0053-0000-0000-0000615C472E
Message-Id: <1560806698-26651-1-git-send-email-gromero@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=969 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906170186
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
Cc: mikey@neuling.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In some cases, compiler can allocate the same register for operand 'res'
and 'vecoutptr', resulting in segfault at 'stxvd2x 40,0,%[vecoutptr]'
because base register will contain 1, yielding a false-positive.

This is because output 'res' must be marked as an earlyclobber operand so
it may not overlap an input operand ('vecoutptr').

Signed-off-by: Gustavo Romero <gromero@linux.vnet.ibm.com>
---
 tools/testing/selftests/powerpc/tm/tm-vmxcopy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm-vmxcopy.c b/tools/testing/selftests/powerpc/tm/tm-vmxcopy.c
index 147c6dc..c1e788a 100644
--- a/tools/testing/selftests/powerpc/tm/tm-vmxcopy.c
+++ b/tools/testing/selftests/powerpc/tm/tm-vmxcopy.c
@@ -79,7 +79,7 @@ int test_vmxcopy()
 
 		"5:;"
 		"stxvd2x 40,0,%[vecoutptr];"
-		: [res]"=r"(aborted)
+		: [res]"=&r"(aborted)
 		: [vecinptr]"r"(&vecin),
 		  [vecoutptr]"r"(&vecout),
 		  [map]"r"(a)
-- 
2.7.4

