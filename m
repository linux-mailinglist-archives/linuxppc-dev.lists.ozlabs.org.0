Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A0B8C5F37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 04:46:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ixrl5ttU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfHfR1m96z3cT9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 12:46:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ixrl5ttU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfHdg0bmtz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 12:45:26 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44F2V09R030481;
	Wed, 15 May 2024 02:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=kiyYcCbnaRvjsRevX0eMvjXRqsIOctBeDU7l+t5f848=;
 b=Ixrl5ttUCN+0JbLD7o/BTtTO/FF5nXBBl5rjwX+ptbvpjNbJ5k1LxgS5M5roZ3ynGOKJ
 gNAYkb5e1Zo6GIZLBVc/2wDSWr/oG7bAPotJuCfrYInWzcBuO+atMoZra8UV+OnJfG9i
 4gV0IXETynotPwd4swaBf2332pCdiI01SirJCljrwoIr/6ChSahAibil0rLpMalv+P4G
 LUYlppv9Dg6CS7bebvxWcwJ6c3BwZCwL1rWlPbxbtgGUOvL9zfXJygTYgZu+dEL+BFru
 e0ygiLQKS5zInSXSk4+vGrpfkELFLn/+3Wv5hHzQNnIeTkhWBEP2sqoQzWc1zUEA+VAp 2A== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y4kaw84cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 02:45:16 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44F0hW2m018844;
	Wed, 15 May 2024 02:45:15 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2k0th8p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 02:45:15 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44F2jB0d32834234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 May 2024 02:45:13 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B92692004F;
	Wed, 15 May 2024 02:45:11 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50BEC20043;
	Wed, 15 May 2024 02:45:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 May 2024 02:45:11 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2CB84610AD;
	Wed, 15 May 2024 12:45:08 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 3/5] powerpc/64: Convert patch_instruction() to patch_u32()
Date: Wed, 15 May 2024 12:44:43 +1000
Message-ID: <20240515024445.236364-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240515024445.236364-1-bgray@linux.ibm.com>
References: <20240515024445.236364-1-bgray@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3wQgvErNzpJ8kONxIIur_nz5vOWw6OtR
X-Proofpoint-ORIG-GUID: 3wQgvErNzpJ8kONxIIur_nz5vOWw6OtR
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_16,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1011
 mlxscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=796
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405150017
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
Cc: Naveen N Rao <naveen@kernel.org>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This use of patch_instruction() is working on 32 bit data, and can fail
if the data looks like a prefixed instruction and the extra write
crosses a page boundary. Use patch_u32() to fix the write size.

Fixes: 8734b41b3efe ("powerpc/module_64: Fix livepatching for RO modules")
Link: https://lore.kernel.org/all/20230203004649.1f59dbd4@yea/
Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v2: * Added the fixes tag, it seems appropriate even if the subject does
      mention a more robust solution being required.

patch_u64() should be more efficient, but judging from the bug report
it doesn't seem like the data is doubleword aligned.
---
 arch/powerpc/kernel/module_64.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 7112adc597a8..e9bab599d0c2 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -651,12 +651,11 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 	// func_desc_t is 8 bytes if ABIv2, else 16 bytes
 	desc = func_desc(addr);
 	for (i = 0; i < sizeof(func_desc_t) / sizeof(u32); i++) {
-		if (patch_instruction(((u32 *)&entry->funcdata) + i,
-				      ppc_inst(((u32 *)(&desc))[i])))
+		if (patch_u32(((u32 *)&entry->funcdata) + i, ((u32 *)&desc)[i]))
 			return 0;
 	}
 
-	if (patch_instruction(&entry->magic, ppc_inst(STUB_MAGIC)))
+	if (patch_u32(&entry->magic, STUB_MAGIC))
 		return 0;
 
 	return 1;
-- 
2.45.0

