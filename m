Return-Path: <linuxppc-dev+bounces-7901-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC9EA96C26
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 15:11:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhjLL34Bgz3bx5;
	Tue, 22 Apr 2025 23:11:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745327498;
	cv=none; b=niiQP2dOgE4Bvcq8A2wf6EoVEvQG47jgtZoXXHTGPCV/GEfOsWplQ2p3YfsfcixI+13wTsqcj4T3QBJFDkDMfTBWQXzv072w6DXS1YhBA2yjASap48WR8qWw1NdMiEWCSos8432/coHJUAqLph8BI6YLs+vvM8o2Ld4nUeA0eh2cuF+MSq7T0QjDgYpvQeh3n3kGFfp4F9fzFBqiIKxIW23zuWwLEitN1TT9uqvx7ytQ6ndhoGJ5sdeoDhUTMzF35aNXB4LM6JxX+cmryNNBc5HXL4G7NAr3z2QbwW2KII48jNR+BQgHkM6mR+YDL3+4g0B3axxFUCbkCgZxjUwx6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745327498; c=relaxed/relaxed;
	bh=DZZ9hZEIHnIbwCRBOuoyvD1VFXNWmRzKcg/N3dnTCG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQg12Lb7mNukp6UqtJnwJF8CJdte09yayivoTP9+jUg3R5IiUfgdLskSpyWsUkeZSE+HRsF3QFHJ5yhgvmP1xuXEJAadBfb0oMmdFcVqYwkhWU3s38hAmeryBVKI6OU3Ee/zAEK8fJ4Ez5tLO2Wt7Ow01xo3SQaC9MF89Hfugb1OPsybu2NGwWL/BiiaFf66KRu0TrV6XYHS0TWEgXYqCCPNcQf7O0mJ5rLJ6FhezqiOrg/oNtblYpgXhA7LtlcMEzcnRt65m2ZE/fwsCQa+TXip8zk5gh49RA4H9R7f7OAxnv6MdtifXNDG0f3bd530y287kkeEcPh8oVWElCvSxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jW7xB48E; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jW7xB48E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhjLK4WTXz304l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 23:11:37 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCauFe005831;
	Tue, 22 Apr 2025 13:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=DZZ9hZEIHnIbwCRBO
	uoyvD1VFXNWmRzKcg/N3dnTCG8=; b=jW7xB48E4ry33zgxLdzF3t7L5DTTz3BIm
	CEFGNqNf0StOroo5X88guZWQGDMk6RMt+qh/URdSZJ9ia7U5Ms3+NaidUkfpdkzk
	UFxnhJhprj3WTPp+aBKnBZp7Z6XsDBSyqFoVcxV05L0HYrebJeI9unEAbZgHoszv
	PTbogW71ZZ3VMAIkkqtW3Sq7WLJootUPTQ9NUtJi19DdDB+tq+UW60Q2ZBQf5MzB
	khwCf8AkOhrnNv2a6eYOa85DLLsjLYkPmrMGs8MGcyVfuw2Cb5j9lejS7cWKA+R3
	FDiVXeqsNq0YTzYI7te3BUKR434Q49g9nYT/ywm//ZOMMqichWsbQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 466b97g5df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:11:24 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53MD1SBk003298;
	Tue, 22 Apr 2025 13:11:23 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 466b97g5dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:11:23 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53MAcj5Q012501;
	Tue, 22 Apr 2025 13:11:22 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 464p5t361b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:11:22 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53MDBLMO37814742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 13:11:21 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1496220067;
	Tue, 22 Apr 2025 13:11:21 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C2842005A;
	Tue, 22 Apr 2025 13:11:10 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.58.77])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Apr 2025 13:11:09 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, christophe.leroy@csgroup.eu
Cc: npiggin@gmail.com, naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH 1/6] powerpc/kvm: Fix sparse warning
Date: Tue, 22 Apr 2025 18:40:35 +0530
Message-ID: <20250422131040.374427-2-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422131040.374427-1-maddy@linux.ibm.com>
References: <20250422131040.374427-1-maddy@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G8eNbRtl40zmscJaA4FjOjr80NRpHbYl
X-Proofpoint-ORIG-GUID: kj7YC4vI9Vo_xzxSIHRm8sDlsMmQHMN2
X-Authority-Analysis: v=2.4 cv=FIgbx/os c=1 sm=1 tr=0 ts=6807957c cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=vsNPJdNJzHsXnjP1ScgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220098
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

When compiling for pseries or powernv defconfig with "make C=1",
these warning were reported by sparse tool in powerpc/kernel/kvm.c

arch/powerpc/kernel/kvm.c:635:9: warning: switch with no cases
arch/powerpc/kernel/kvm.c:646:9: warning: switch with no cases

Currently #ifdef were added after the switch case which are specific
for BOOKE and PPC_BOOK3S_32. These are not enabled in pseries/powernv
defconfig. Fix it by moving the #ifdef before switch(){}

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
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


