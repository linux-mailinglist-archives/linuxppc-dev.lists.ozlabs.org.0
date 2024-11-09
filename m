Return-Path: <linuxppc-dev+bounces-3068-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 013E69C2AA7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2024 07:33:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlmGn3p2dz305n;
	Sat,  9 Nov 2024 17:33:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731134017;
	cv=none; b=OeKCVZ4MZ3zSJTI6W+nj6++aEAclrcjUTCITfMYhKh1LYq8CazULKEDpjZzl7kgs7SxflegIW+7PRAPPjNnCEkddkWHlRPlly+yBJsRiKekilrd96F3aNW3jFKn3bNVungpvnb41ATkjhnCQKIm3IUqRAW0Mh2phEyPHd1v6OaQ5m8WLhAp4fQ4ZkDt5w5ATWuivntdcB4+boq2tTnG0GU5bc9AObEcASIn2mpPLdSMOJvTHah5yt0uzTJoWssiX0PDLyft2k1Rb13nKonjhvcOMDLR/xZY6LxjWbpsXikPLjP/VQQ+v2Tx4dUDtAUFcfs677w5ivOJW9tjm7bGGNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731134017; c=relaxed/relaxed;
	bh=tZPX1N8QudpayLdFbxxGg89zZpw3fldD1pd09WNFmZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKM4XA6TMVEUIZiEucTdA+FGTlJZCLhGx09C63O4qXvnKXedm/KykNX2SJuYASa+d9sYdqdfkciike7MZsY07wGFC+UJ3paNETJjlW4uyAO5K688oiZWkSqBzGlHJWEUmbuqHbe/ppxODtSXEX1Wh4J/QgHThqsbxvLnO4jsTJoXTKBIEAxm/p7rjiLVCpfweahCDFACvtNaAzU47xCy5zIOiqbAH/45jz5Lkus9AIW4yHitApVWhdIHJ4MPxPEiBkaMnVDflLQCQ0XNpGQoAw7zMjEIhPZWSEpkylnaubfwtycvhRPhkAre1NQbz9RWxyO/L8IBqenPpyVCBW/tlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TVtC7ZBX; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TVtC7ZBX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlmGm5cFPz2yDj
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2024 17:33:36 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A96AEmA014431;
	Sat, 9 Nov 2024 06:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=tZPX1N8QudpayLdFb
	xxGg89zZpw3fldD1pd09WNFmZs=; b=TVtC7ZBXHA4rriCgia1RdBWtKnm28Q4t5
	/WdRsxi3GeolsXQfDQSFCSHiNrY5n1gwfrh7mw9PxEiFSFrCwKWaMWbnGNp37/+x
	vtLrR8y4F47206vfpvwdemR3l5J5inGsKipELA2LKEYc4P6E/1LNaPM9nS2qAjk7
	kzBSkTv31vT2Nsca12Ah5c3z6K/k6eq1pLoy7SiK5ENaUEofeBiwq0+bdn3Lf4I6
	Nofine1Dmk9Bkxt8UeyzoaxCc/2BKXP+6meYVFsHFYo2pBf4i+yDPoQjrPDUpjJQ
	CQpSrZ8I3fbPr1cHgrO/89ZoLQEHNfrrWVD42XETtHIgNcH8GtRPA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42t27q82mj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Nov 2024 06:33:24 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A96XOZ0025283;
	Sat, 9 Nov 2024 06:33:24 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42t27q82me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Nov 2024 06:33:24 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8J6ImE031474;
	Sat, 9 Nov 2024 06:33:23 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42nydmum9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Nov 2024 06:33:22 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A96XJv052953592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 9 Nov 2024 06:33:19 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37E5020043;
	Sat,  9 Nov 2024 06:33:19 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F2B220040;
	Sat,  9 Nov 2024 06:33:16 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com.com (unknown [9.124.214.93])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  9 Nov 2024 06:33:15 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, maddy@linux.ibm.com, vaibhav@linux.ibm.com
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] Revert "KVM: PPC: Book3S HV Nested: Stop forwarding all HFUs to L1"
Date: Sat,  9 Nov 2024 12:02:55 +0530
Message-ID: <20241109063301.105289-2-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241109063301.105289-1-gautam@linux.ibm.com>
References: <20241109063301.105289-1-gautam@linux.ibm.com>
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
X-Proofpoint-GUID: nqh2LgZWOmgYcKf7JpuwP8dgmnPaeeBT
X-Proofpoint-ORIG-GUID: dmBmyCaQWZWbbmRF5G6NxR5hHZPo_Eei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=616
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411090049
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This reverts commit 7c3ded5735141ff4d049747c9f76672a8b737c49.

On PowerNV, when a nested guest tries to use a feature prohibited by
HFSCR, the nested hypervisor (L1) should get a H_FAC_UNAVAILABLE trap
so that L1 can emulate the feature. But with the change introduced by
commit 7c3ded573514 ("KVM: PPC: Book3S HV Nested: Stop forwarding all HFUs
to L1") the L1 ends up getting a H_EMUL_ASSIST because of which, the L1
ends up injecting a SIGILL when L2 (nested guest) tries to use doorbells.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv.c | 31 ++-----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index ad8dc4ccdaab..0a8f143e0a75 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2060,36 +2060,9 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 		fallthrough; /* go to facility unavailable handler */
 #endif
 
-	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL: {
-		u64 cause = vcpu->arch.hfscr >> 56;
-
-		/*
-		 * Only pass HFU interrupts to the L1 if the facility is
-		 * permitted but disabled by the L1's HFSCR, otherwise
-		 * the interrupt does not make sense to the L1 so turn
-		 * it into a HEAI.
-		 */
-		if (!(vcpu->arch.hfscr_permitted & (1UL << cause)) ||
-				(vcpu->arch.nested_hfscr & (1UL << cause))) {
-			ppc_inst_t pinst;
-			vcpu->arch.trap = BOOK3S_INTERRUPT_H_EMUL_ASSIST;
-
-			/*
-			 * If the fetch failed, return to guest and
-			 * try executing it again.
-			 */
-			r = kvmppc_get_last_inst(vcpu, INST_GENERIC, &pinst);
-			vcpu->arch.emul_inst = ppc_inst_val(pinst);
-			if (r != EMULATE_DONE)
-				r = RESUME_GUEST;
-			else
-				r = RESUME_HOST;
-		} else {
-			r = RESUME_HOST;
-		}
-
+	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL:
+		r = RESUME_HOST;
 		break;
-	}
 
 	case BOOK3S_INTERRUPT_HV_RM_HARD:
 		vcpu->arch.trap = 0;
-- 
2.45.2


