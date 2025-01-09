Return-Path: <linuxppc-dev+bounces-4908-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 090D1A07731
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 14:21:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTQRX2BSSz2ydW;
	Fri, 10 Jan 2025 00:21:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736428904;
	cv=none; b=VrO4RYK4HtTrTXbHig3mA9nCHuUMJisxTxPngWtM6KoO9SN0dShjHufkRNeTaLQo5tiZMMWVHLHRttPajv95gDpqQJlt8144fIyB6cEv3Lhe6yYE3EYgJcEPCZoyiJsmWtjwX/2IG8MBeEuimgMi2Wig659++Lf5RK/4fLjuvkqbEVhbev/VCRqneIL2qPI7J1mGz6NQrrF+oFg/c31ae9BB/0xyTAPkWZyz3CnwiWBX2NGHhjTAizvpbBLMcwXFjqkwYgYKE8q7BNL7uzqncizj8M9DjEFrPkNDeWde0onyibC4T6fssofSs7QCsbGl46FPyf15ZOH9NHrNbVyGGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736428904; c=relaxed/relaxed;
	bh=PIYv3HT1t7t/RxD2CzYvxMvKNpNRTsobx9e1PcdHI4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cDYLKrKvoKyPlfwipKlB/SOUzXbqTS95cHIKlrWL0KrDFmz0wIAzxFs2LagBHNRsNjdO/aP9bP0IMSUN1iRysiN7RoJfP1qVHFXv56HgDDScK+3TcAjrS+5bVHv0EFotbmbHEfjeWmVo0IrLZPDsValK2zxRiB5zd6Cbo4Upvq/ROOcPqD/TPAzXkp6T4mc4mWsuwq5jNEZpnaajhfGkcnH3j/66yJcg9kCGawM4cQ8Nc8FipAg8SsgWLDa6WoM0G+7P5iBpGW4u/EVb/yh4Red3Ub7yzXPw5pYqEWCTqRn0pbgVWkWDNtoTA9LONzOwt8oRImLWhKehEK5qTqj3pg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O41+eNVw; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O41+eNVw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTQRV4WYDz2y8V
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 00:21:42 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5090abXX000770;
	Thu, 9 Jan 2025 13:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=PIYv3HT1t7t/RxD2CzYvxMvKNpNRTsobx9e1PcdHI
	4Q=; b=O41+eNVwrjnbtCpkyRE2aGtUtngxpY51WzYFvlZQgEYCEIM/sAyJJ5TfD
	JWKJGeUodawGaNpBvTJzaOnJJyvJAsskDLBsYFYfxaFd0GvARVTImtEEkTzTa/Xw
	yHRC0Z2VsxEait13k/A9XLOmmzPzKyOVQ7IOpbEEv3Yx8x//d74jJxXzo4NYXFci
	3/f0DxUbfIyRgwT/GOz6KCJb947Na1pnZIT4lyihZ5hdCxD/gLDqQdJVh2punLkG
	5DCZP5lxiC340r1RFlJND+sQlHYdFDUk1HUdQvfG3LRpFKElM3uPH6olsUsh6VSf
	7tyZya6e6NQfybnRbd0/tdx6doxQA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441tu5n7e1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 13:21:26 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 509DFhi6008704;
	Thu, 9 Jan 2025 13:21:25 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441tu5n7dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 13:21:25 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 509BNhsI003601;
	Thu, 9 Jan 2025 13:21:25 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yfatdedn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 13:21:24 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 509DLLnI15073628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 13:21:21 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4637A20043;
	Thu,  9 Jan 2025 13:21:21 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CE5320040;
	Thu,  9 Jan 2025 13:21:18 +0000 (GMT)
Received: from li-e7e2bd4c-2dae-11b2-a85c-bfd29497117c.ibm.com.com (unknown [9.124.223.189])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jan 2025 13:21:18 +0000 (GMT)
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
Subject: [PATCH] KVM: PPC: Enable CAP_SPAPR_TCE_VFIO on pSeries KVM guests
Date: Thu,  9 Jan 2025 18:50:53 +0530
Message-ID: <20250109132053.158436-1-amachhiw@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
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
X-Proofpoint-GUID: hvpgz_N-ryofrwSI8xwElybReki8Q0Ff
X-Proofpoint-ORIG-GUID: GT_WvY8RHmULRGyFL4N4ZliWEMN7eZqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 mlxlogscore=808 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090104
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Currently, on book3s-hv, the capability KVM_CAP_SPAPR_TCE_VFIO is only
available for KVM Guests running on PowerNV and not for the KVM guests
running on pSeries hypervisors. This prevents a pSeries hypervisor from
leveraging the in-kernel acceleration for H_PUT_TCE_INDIRECT and
H_STUFF_TCE hcalls that results in slow startup times for large memory
guests.

Fix this by enabling the CAP_SPAPR_TCE_VFIO on the pSeries hosts for the
nested PAPR guests.

Fixes: f431a8cde7f1 ("powerpc/iommu: Reimplement the iommu_table_group_ops for pSeries")
Cc: stable@vger.kernel.org
Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
---
 arch/powerpc/kvm/powerpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index ce1d91eed231..9c479c7381e4 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -554,7 +554,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		r = 1;
 		break;
 	case KVM_CAP_SPAPR_TCE_VFIO:
-		r = !!cpu_has_feature(CPU_FTR_HVMODE);
+		r = !!cpu_has_feature(CPU_FTR_HVMODE) || is_kvmppc_hv_enabled(kvm);
 		break;
 	case KVM_CAP_PPC_RTAS:
 	case KVM_CAP_PPC_FIXUP_HCALL:

base-commit: eea6e4b4dfb8859446177c32961c96726d0117be
-- 
2.47.1


