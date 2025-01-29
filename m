Return-Path: <linuxppc-dev+bounces-5674-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 451AAA21A16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 10:41:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yjcc70Yr2z30RK;
	Wed, 29 Jan 2025 20:41:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738143687;
	cv=none; b=LxPofzQUJdUUabtEj0cLWB3FAnuNND/gh0FxZbizROhzbgY4qVjHQLbj28PVr4wFBsZ/Ubu93ZMoUG6ErOpVeBkVCxmnDaoIMDbD+Cs8wBAVEmTnBuFyB7PRa3Gc/HiN9T8qjl+k+nH36NlMob8E/GACqKnoTH/3Obfsk5O9sCy8JtkG96ETdgvVHNWWTfEyoBmP2j6FHQt4+QJJqjYUgvq+4+tEpy60mC8+DfzJzrCMHUyW1T4oQPwKPSjKXImFrwC1D+Dm2/9SbFR7z9niQL/KEY6X2xMo3F/G7eD2DCAb+GbCqkWY9RL+DtDfkkiw3TskkbCEv6Z5ut2ZZlWWNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738143687; c=relaxed/relaxed;
	bh=oNZkm1uX7U/WwtMtAAdmr5FSLoJzcomJRfKSuLi+Yy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mn4dAQLWCZxI2eaUN7t+03FKXi5ZU06z1CQiy0LhgYd/7WELe9z/DIhBsFYXk8JvyycP9MZSpy2pLs9YYTqCj3BGt+ionL/5ZB5M5jEOWtUF4MBzFCF6+Cb8+b2vXWK+VXUatv+6CoeWRg8lghKNnOThNucolvpu+Np8+HHNk5nxZAVkv6nU3tEuU6vZBBnPN5RxlyhH83K4snmqA4kKZqI0OA2k9kl5dIwZIgDHtCWWa1PkliFsggqmPftGEwJ2y8EKUIatDhn+fl8oS/kblLBMXyiJKrbDRY1Slwkcw0C/WM8AUypCLFT8eyYkoeU6Y2F5bIoKFvl0kEGCDOuJpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OQEX4LS4; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OQEX4LS4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yjcc60DSTz30Q3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 20:41:24 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T20YvY028471;
	Wed, 29 Jan 2025 09:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=oNZkm1uX7U/WwtMtAAdmr5FSLoJzcomJRfKSuLi+Y
	y0=; b=OQEX4LS4kn4Xy37Yh8WrCQsHr35kGTxrrelBLOPH60eapDFgvEqzmIc6t
	Eifbfhmr22jYNUwxJ+ZBe/jghVpLDraMjfJpLOxrnVJq2i6WZiX/WNwbgPwXyF4Q
	7PxqGkLvYsYYhBUpB9yWshiZ7LcuytgPtnQbGMpyHhinBkRnIxklnzSfov0WV7lH
	/N+YGpf2eji921olBWSB3sJwf9Qeb/FDeSglAzbPYplROKw50QL4Vfl8LGXPls3I
	TUqqm8tg0qsLV40eVkag/7oGuSfTlfoyjz4T685tDM1deW0w4Ww45O03FNX1WB5U
	JzRA6N5+A1XQSAVT2nH44z4/F7saQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44fb609g2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 09:41:09 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50T9aY8E006602;
	Wed, 29 Jan 2025 09:41:09 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44fb609g2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 09:41:09 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50T8lO2u012336;
	Wed, 29 Jan 2025 09:41:08 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44dany83k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 09:41:08 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50T9f4rb20250894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2025 09:41:04 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1EA520040;
	Wed, 29 Jan 2025 09:41:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E859920073;
	Wed, 29 Jan 2025 09:41:01 +0000 (GMT)
Received: from li-e7e2bd4c-2dae-11b2-a85c-bfd29497117c.in.ibm.com (unknown [9.109.198.84])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 29 Jan 2025 09:41:01 +0000 (GMT)
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        Shivaprasad G Bhat <sbhat@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v2] KVM: PPC: Enable CAP_SPAPR_TCE_VFIO on pSeries KVM guests
Date: Wed, 29 Jan 2025 15:10:33 +0530
Message-ID: <20250129094033.2265211-1-amachhiw@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
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
X-Proofpoint-GUID: TWdhonsq_87KGcTRAxAYs1iT1N1D-B3f
X-Proofpoint-ORIG-GUID: -jAVV3X5Wcjma1oMS2g6sROUOl1lkTg4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxlogscore=793
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290077
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Currently on book3s-hv, the capability KVM_CAP_SPAPR_TCE_VFIO is only
available for KVM Guests running on PowerNV and not for the KVM guests
running on pSeries hypervisors. This prevents a pSeries L2 guest from
leveraging the in-kernel acceleration for H_PUT_TCE_INDIRECT and
H_STUFF_TCE hcalls that results in slow startup times for large memory
guests.

Fix this by enabling the CAP_SPAPR_TCE_VFIO on the pSeries hosts as well
for the nested PAPR guests. With the patch, booting an L2 guest with
128G memory results in an average improvement of 11% in the startup
times.

Fixes: f431a8cde7f1 ("powerpc/iommu: Reimplement the iommu_table_group_ops for pSeries")
Cc: stable@vger.kernel.org
Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
---
Changes since v1:
    * Addressed review comments from Ritesh
    * v1: https://lore.kernel.org/all/20250109132053.158436-1-amachhiw@linux.ibm.com/

 arch/powerpc/kvm/powerpc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index ce1d91eed231..a7138eb18d59 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -543,26 +543,23 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		r = !hv_enabled;
 		break;
 #ifdef CONFIG_KVM_MPIC
 	case KVM_CAP_IRQ_MPIC:
 		r = 1;
 		break;
 #endif

 #ifdef CONFIG_PPC_BOOK3S_64
 	case KVM_CAP_SPAPR_TCE:
+		fallthrough;
 	case KVM_CAP_SPAPR_TCE_64:
-		r = 1;
-		break;
 	case KVM_CAP_SPAPR_TCE_VFIO:
-		r = !!cpu_has_feature(CPU_FTR_HVMODE);
-		break;
 	case KVM_CAP_PPC_RTAS:
 	case KVM_CAP_PPC_FIXUP_HCALL:
 	case KVM_CAP_PPC_ENABLE_HCALL:
 #ifdef CONFIG_KVM_XICS
 	case KVM_CAP_IRQ_XICS:
 #endif
 	case KVM_CAP_PPC_GET_CPU_CHAR:
 		r = 1;
 		break;
 #ifdef CONFIG_KVM_XIVE

base-commit: 6d61a53dd6f55405ebcaea6ee38d1ab5a8856c2c
-- 
2.48.1


