Return-Path: <linuxppc-dev+bounces-8647-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A5BABADEC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 06:41:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0Snq6vDxz2ydx;
	Sun, 18 May 2025 14:41:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747543295;
	cv=none; b=JS6ZVMS6EQSejvBpyVaG9QP2ng1c723rPUknQsWj9pUYiDop4fkuU70i4EMFh43Fh/A+GPqEr4p2T7KuQ395BgHGpbTV+39Njb3AVliXi8tUxvoPGfNKpBaibtpgOGPBvifrHNQNQ2cX9I0O+uGNYP31DN7O2JKD9HhVtyvM8KReu1DdiTl9W9bgRu2MbYtRss7Hk9ZUgkRLrq80ix1jbj90wNrxuIv8WrjJZTPTA5cUTXxkAqZ/y6T2UPJgtOexOFRkzoPJQ9K64Yu1GnMdM0eqTEREsMazii3kQmQaRWLSZYfIANZgvMRZTcL7Y2qUAIyaZZOw0hBMffHhuqlbLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747543295; c=relaxed/relaxed;
	bh=6cdeJ0KG5i+uPNaxjU8nqsGqPrNV/etGUENjgBrUOn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iU8/ucxp7njLgKKNKZyfJ5MG4YdLD0GAksgdfvLA8LmRI52C2FjOOkT6I7P/zO6naGM/iYOQV/R1Nm+4AJBZXXTn21VQET5erMxWY+6App/JopZHBUimhAlVAEPrloQnHsLxv0NGfbqLWTddzYwX9D4RtrBUCgaoZLyfFYU8u/VZZtMLq8gh28wqpNyRU6wSerKXOWOMa9ledgJE0LGWi1intgyM6IwfKQZr9o7tqsqh3FtyMg5Lkrt8SnOVDoYu7ivOlmaAQzYnCd9CFEaY411eUW7Z80ZM/FB7OKF9ZoI4F30uSwZKIgBIhdCFN2s1vuCUGuW+74UW7BMY5emTWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lZEV9cLT; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lZEV9cLT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0Snp62Kdz2xmZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 14:41:34 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HItY9V030176;
	Sun, 18 May 2025 04:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=6cdeJ0KG5i+uPNaxjU8nqsGqPrNV/etGUENjgBrUO
	n8=; b=lZEV9cLTk5jGNBfzAnw3Urja2jOvlcQQ3VEDg7ao2OiYwRCJZf8b32eHo
	MGyfLisukdZy6po3xXXO0nsuAqVMxofxQlR6Iib+LnW3kmNGzUrs5BSQXbWv3rtN
	Nlq4r/+6CwR8ULWQEJR0aihojz5WLnXMh8bzYyUrypc4pd2Ki7GKtOVcYRpEo2hX
	tKB6347G0FRNbcUdCvyyHaodXJH4R/lfOQWjbf0JUS6uFEQd3N1o51B6Knugd7mO
	5rFBI4hdGAiY+T9tbQYJzGH+PNE9NIsGwLGS9cKDb9RK3F4KFJ+15N1AM0d5hgwu
	6/bHBf1/5qnQCjZWu1CLjutjHY/mg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46q0569ayj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 04:41:20 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I4fK6l031222;
	Sun, 18 May 2025 04:41:20 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46q0569ayg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 04:41:20 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I1JRUa002449;
	Sun, 18 May 2025 04:41:19 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46q5snghhn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 04:41:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I4fGYu23134640
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 04:41:16 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4987C2006E;
	Sun, 18 May 2025 04:41:16 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C56F20040;
	Sun, 18 May 2025 04:41:12 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.51.82])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 04:41:12 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH v2 1/4] powerpc/kvm: Fix ifdef to remove build warning
Date: Sun, 18 May 2025 10:11:04 +0530
Message-ID: <20250518044107.39928-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzOSBTYWx0ZWRfX/qSw31tZjskX XhkyIUVL+Y6MXIlrjUAUYr95TbJP1Ie3wH+QCWzaMFXqT7K0hrz7TTIDCEY1G/5IJJlT37V0BdZ wUoto3mpH28HN/jcykoH9MY+2Fp6Fj0RbfKAJXOlA9GyEW1+IPkSixQZ33+6MAsJpQJ7GcDEY3i
 DJhNbblRyIlkG/IUZMpUJcPxPZ4XSP2A54fe226gqKhFO2u/fVlOufrcA4zphj+xxbA4iuXH/K0 LvyTQgen2I1S6comO0WbS1cRdNjwp9Qu5gnWjZDECcXN7pcvoP81J7Zua6vWWqWfAH55OBAruve NrJFSpNvKBCEm4PPk6z0qRA/XaNght/pRNMWZb+OlODQoarMOAtohFwPVqlizya7nWHg+lHD8ot
 ob/rn7sQ/hlcUiT3MSj4csuFsVfo/9D6LVcW+ZPtKKNKsDx5txSoQSfJBQS2QEwaCHNIw4JC
X-Authority-Analysis: v=2.4 cv=H5vbw/Yi c=1 sm=1 tr=0 ts=682964f0 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=EHKHNWoSpfGFrIUsRvMA:9
X-Proofpoint-GUID: _9fBLoHjySAn42oX5XHq1z3v1IXSn7nC
X-Proofpoint-ORIG-GUID: cJ9DYPLmP4sc-VNmfkxJGEYdNEPGSDtK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180039
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When compiling for pseries or powernv defconfig with "make C=1",
these warning were reported bu sparse tool in powerpc/kernel/kvm.c

arch/powerpc/kernel/kvm.c:635:9: warning: switch with no cases
arch/powerpc/kernel/kvm.c:646:9: warning: switch with no cases

Currently #ifdef were added after the switch case which are specific
for BOOKE and PPC_BOOK3S_32. These are not enabled in pseries/powernv
defconfig. Fix it by moving the #ifdef before switch(){}

Fixes: cbe487fac7fc0 ("KVM: PPC: Add mtsrin PV code")
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
- Changed the patch title
- Added tags

 arch/powerpc/kernel/kvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/kvm.c b/arch/powerpc/kernel/kvm.c
index 5b3c093611ba..7209d00a9c25 100644
--- a/arch/powerpc/kernel/kvm.c
+++ b/arch/powerpc/kernel/kvm.c
@@ -632,19 +632,19 @@ static void __init kvm_check_ins(u32 *inst, u32 features)
 #endif
 	}
 
-	switch (inst_no_rt & ~KVM_MASK_RB) {
 #ifdef CONFIG_PPC_BOOK3S_32
+	switch (inst_no_rt & ~KVM_MASK_RB) {
 	case KVM_INST_MTSRIN:
 		if (features & KVM_MAGIC_FEAT_SR) {
 			u32 inst_rb = _inst & KVM_MASK_RB;
 			kvm_patch_ins_mtsrin(inst, inst_rt, inst_rb);
 		}
 		break;
-#endif
 	}
+#endif
 
-	switch (_inst) {
 #ifdef CONFIG_BOOKE
+	switch (_inst) {
 	case KVM_INST_WRTEEI_0:
 		kvm_patch_ins_wrteei_0(inst);
 		break;
@@ -652,8 +652,8 @@ static void __init kvm_check_ins(u32 *inst, u32 features)
 	case KVM_INST_WRTEEI_1:
 		kvm_patch_ins_wrtee(inst, 0, 1);
 		break;
-#endif
 	}
+#endif
 }
 
 extern u32 kvm_template_start[];
-- 
2.49.0


