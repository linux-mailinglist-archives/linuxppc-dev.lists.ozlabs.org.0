Return-Path: <linuxppc-dev+bounces-6362-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98069A3D19E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2025 08:01:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yz40r3vwPz2xsW;
	Thu, 20 Feb 2025 18:01:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740034860;
	cv=none; b=fYb+jrN34Z6TJ4HYT8ibSypjeglVUhj9um/xxoYMHpHUPTUshl9jBiUXvSF0EzKYUknU0/4h19BYCfmAOWfnFSlQrvEJXhNuXC3iE0rTteNRg+TbFXFINDuCIisDuCSgc0ACohc0XdoGmPzvvclq+Vkd3PihxX2Igy+N3pBXgg6GVvJj2M6BpnjwzyNrBi3/Kb7gHHqYA+GL69RUV2uulILknLt5NF+t43xAfQh09hj31fsLb0K42lgWhMY5M8FlVDd8vjc4hfw12KEutgpebowqlT8fP/F8qpExML6yz6P9u02lVyWs8qwoVNvyNA27tkg9DOpO9tgWlxsrc0eKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740034860; c=relaxed/relaxed;
	bh=lPt69rKuvv9+NCGD8OAkzDm7GM0h21bKMRLPsWMDjVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JirdN5EufuLvXT6pxUfwWjVtwiP4ORk/2nWZFPHbVPGlGfXomFvOTb1dNrqO1leQLbYkU6E74qEDLuLDbjATlrXUuL1YYEUtBa6/oaNaxawkZYtGGv3h36WjDDeg3vn17BHxfyRQC1wG9Rij03vI60KPDfNJV+QmSsRPB3xMcMnpjcIg011RFdlaAeTc3IHSIlqOD/L5ib/pWViWqoZ+Ogni7R6024o6XOrzyYhFt+qzLPZzmBUqHP/nFGFglZh4sPLy5JsapWIdmY38parB1q2+kRID8Jy89Wlc5c7IHfBvXv6vjD/f8fBGCW0wmWB1NuztMb3dXvo3mEp53K3cfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HsefP4gf; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HsefP4gf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yz40q1jmtz2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2025 18:00:58 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K2BvTY002825;
	Thu, 20 Feb 2025 07:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=lPt69rKuvv9+NCGD8OAkzDm7GM0h21bKMRLPsWMDj
	VY=; b=HsefP4gf6il1DjGFBZin6LCuxk181MkgHZByNum4534Vqothh0w3HSQ7Z
	xGbrXZ+4yrgybdJ4HBJNbTE5h7Ebe4hUcOznSIIDaNhJ82XAdhhzAjp7ZgF22Clt
	p9NfHCUucWzrfpCfEzwe/HEoWMwszxapSJHil4ZckinlX67/vxpcd8I3+/HVIxfv
	SPBBfXs9b5n9VUZ/F1Owo4PvZbAQbq9LmJdJL5LaQANw7eio79vy2LxNANCZ9ZbN
	lmTv5vz2JN2Qiw36HtfsArHlu+JayE/d9wPUusDTcL+EFWnstkdrQivoYgcgvJ9y
	9UYBRuzUgC5BHJUVklegU3pdaBkRg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44wb0nwyda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 07:00:38 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51K6xogn020491;
	Thu, 20 Feb 2025 07:00:37 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44wb0nwyd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 07:00:37 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51K4PuuY029303;
	Thu, 20 Feb 2025 07:00:36 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44w024gj84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 07:00:36 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51K70WMt22676004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Feb 2025 07:00:32 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4E372004F;
	Thu, 20 Feb 2025 07:00:32 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 482B72004B;
	Thu, 20 Feb 2025 07:00:29 +0000 (GMT)
Received: from li-e7e2bd4c-2dae-11b2-a85c-bfd29497117c.ibm.com.com (unknown [9.39.28.11])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 20 Feb 2025 07:00:29 +0000 (GMT)
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
        stable@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v3] KVM: PPC: Enable CAP_SPAPR_TCE_VFIO on pSeries KVM guests
Date: Thu, 20 Feb 2025 12:30:02 +0530
Message-ID: <20250220070002.1478849-1-amachhiw@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 91L33-gR5hBeTyVHntnM3867vAk8s8XE
X-Proofpoint-GUID: HWCx8eFMycYN1YG9S8kraIezKXqDnxey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_02,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=939
 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200049
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

Support for VFIO on pSeries was restored in commit f431a8cde7f1
("powerpc/iommu: Reimplement the iommu_table_group_ops for pSeries"),
making it possible to re-enable this capability on pSeries hosts.

This change enables KVM_CAP_SPAPR_TCE_VFIO for nested PAPR guests on
pSeries, while maintaining the existing behavior on PowerNV. Booting an
L2 guest with 128GB of memory shows an average 11% improvement in
startup time.

Fixes: f431a8cde7f1 ("powerpc/iommu: Reimplement the iommu_table_group_ops for pSeries")
Cc: stable@vger.kernel.org
Reviewed-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
---
Changes since v2:
    * Updated the patch description
    * v2: https://lore.kernel.org/all/20250129094033.2265211-1-amachhiw@linux.ibm.com/
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

base-commit: 6537cfb395f352782918d8ee7b7f10ba2cc3cbf2
-- 
2.48.1


