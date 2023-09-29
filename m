Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0A87B3890
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 19:24:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D6oTKkYZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rxy0127Gxz3ckn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Sep 2023 03:24:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D6oTKkYZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rxxz440S2z3cMH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Sep 2023 03:23:59 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38TH6oo3011615;
	Fri, 29 Sep 2023 17:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Mb4kmc7EVYbPBjhuTHuXPbo8ckLWRALejMOraCIvCFI=;
 b=D6oTKkYZasYt47QUWeLyWuvGlyKu4MUTDoYLCOBlu1/co//RFp5uqopfeM2/+UoTLv3k
 9/Rlx7iCTKVJCMocQsztMxG7b13QmMPzUCjRZUR2G+ZSZ+3FxfMQN5Cl6E1hd1KU8JeA
 kK3I1IEwYW7qob3fUqY6/U7sfNND36+rIAQtNs+BlQHMd2nteGjizHubXNiZjmgI7qh1
 j1ho6F3ERQeX/bwv5XQCsj+THaJXnkOJjZTP8idvoE/w3rO7YMtaOyI6UNARGtuJxMav
 tzC9AM5Ca/oEbWFrWpOZveKDfkg54jzh0/nCCVuDkwPxqy4Aojd3lv15PY+Vy7DbQe89 Kw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3te2fkgpb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Sep 2023 17:23:50 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38TGmr7I008185;
	Fri, 29 Sep 2023 17:23:49 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3taar06juq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Sep 2023 17:23:49 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38THNk9f29819160
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Sep 2023 17:23:46 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64C082004E;
	Fri, 29 Sep 2023 17:23:46 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B85CF20040;
	Fri, 29 Sep 2023 17:23:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.101.140])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Sep 2023 17:23:44 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/2] powerpc/platforms/pseries: Remove unused r0 in the hcall tracing code
Date: Fri, 29 Sep 2023 22:53:37 +0530
Message-Id: <20230929172337.7906-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230929172337.7906-1-atrajeev@linux.vnet.ibm.com>
References: <20230929172337.7906-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0gF0xL9wTBNEyeJaTSJxCa2-y91H627G
X-Proofpoint-ORIG-GUID: 0gF0xL9wTBNEyeJaTSJxCa2-y91H627G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-29_15,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 mlxlogscore=846
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309290147
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, kjain@linux.ibm.com, Naveen N Rao <naveen@kernel.org>, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the plpar_hcall trace code, currently we use r0
to store the ORed result of r4. But this value is not
used subsequently in the code. Hence remove this unused
save to r0 in plpar_hcall and plpar_hcall9

Suggested-by: Naveen N Rao <naveen@kernel.org>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/pseries/hvCall.S | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hvCall.S b/arch/powerpc/platforms/pseries/hvCall.S
index 2addf2ea03f0..2b0cac6fb61f 100644
--- a/arch/powerpc/platforms/pseries/hvCall.S
+++ b/arch/powerpc/platforms/pseries/hvCall.S
@@ -184,8 +184,6 @@ _GLOBAL_TOC(plpar_hcall)
 plpar_hcall_trace:
 	HCALL_INST_PRECALL(R5)
 
-	mr	r0,r4
-
 	mr	r4,r5
 	mr	r5,r6
 	mr	r6,r7
@@ -295,8 +293,6 @@ _GLOBAL_TOC(plpar_hcall9)
 plpar_hcall9_trace:
 	HCALL_INST_PRECALL(R5)
 
-	mr	r0,r4
-
 	mr	r4,r5
 	mr	r5,r6
 	mr	r6,r7
-- 
2.39.3

