Return-Path: <linuxppc-dev+bounces-2552-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF929AEE32
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 19:34:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZCj11Rfsz3bc2;
	Fri, 25 Oct 2024 04:34:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729791285;
	cv=none; b=dYLmwrBKsTBnXtkW7NSAZePm3VbisnapQEzxx59tkFet5DJIxu0hMW9mVxHW5pPesLeprp89wOgQ6ODVgdvIeF5QZe+iT3YJWOVkKc+c+XY2L7zQuPO1CmPIkf+Hzd6h//FSbdxgT2qHtG1o7pSVG5/A4pZYjT3OSXZues3i9fmZVfGRMoXVNZSC9jGJCM2EbJJ1lJEGMdIA/eM8qaYr/in1QWQd7JYBqsWB4CMe+qb+/EfbnALDcyUtPznYOhHE4wqec8BI+pT/2ia0S833/hkhAjn/0TKEqb6kbJ2ZRuWFvyfd0ukSob0z9annDUbTAM6HxcJIadJG2lggBKx89g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729791285; c=relaxed/relaxed;
	bh=bkrHZtFIVPKjyk0yZqzq4mDtLNuAwloD58YnxqpXYBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XS3XKU57Td0Udbk5SxLP/FjRg7wTb6z9z2d8ZkT3XCJzzajmRqQGmHtFNs0m5H0ECyHJ6ta5Pwcy4JqhdfHzlgnOfyZKpXQTf/Im2BDzjHRGk7ttI/vGX4ZrQRcAf2xjL0QtIp8zEWcfsQ3YUq04D0hSMtWB53FHruOkbeEnSqDUfnN7n33QC8AtvLHzrPh/koOzuUZIiHqD9HImPmfs2rhqtHYfmt8vMG+Qz0vWWHCvy3+RZAYEaYRXQzTa+pUt+LjNvuuAt43Yjrz2uGUaRkclZ7KzCNRMS0lyjpwT89wJ5930ObwPRT2ULAT17bIeurxh7UMU9JACs/5ofb/M3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l1UO1Zlj; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l1UO1Zlj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZChz6ktbz3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 04:34:43 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OEV4R4016737;
	Thu, 24 Oct 2024 17:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=bkrHZtFIVPKjyk0yZqzq4mDtLNuAwloD58YnxqpXY
	Bg=; b=l1UO1ZljGrIJvBklEaU5varjZBc+cs7eG4C9xpGcttI5R4XEpqJHELhX0
	11TeDnBrNLpcG0i1noPpnvhTfyp8miuThVEjxP+E9kJmxpwV/CwyKSvTOzUmOfSf
	J9i1xP9tDKN86U9ZXsVVEynqcpPSGPMFdCBDZiTE6Yw58dbpbbR3QhUzuatvAqcG
	fr8MoRmOYNdaarE7oxsJKyJAd7IMSfnv0+T/xlpdBpGShX6ROqvdHJxrZVaHQx/2
	2l2fyVC7UKE142pIooYFkbsUue8m/q2Sqa1nFuw9MCLjA5C7EKGKFItbgRMnoRSr
	IA3Wc3t9dB5G7RFG/UKbO96gHV4sg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42emajsxu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 17:34:32 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49OHYV42015696;
	Thu, 24 Oct 2024 17:34:31 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42emajsxu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 17:34:31 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49OEVhhm012603;
	Thu, 24 Oct 2024 17:34:31 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42emhfhmm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 17:34:30 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49OHYToL34996514
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 17:34:29 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42CAA20043;
	Thu, 24 Oct 2024 17:34:29 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3A4420040;
	Thu, 24 Oct 2024 17:34:27 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com.com (unknown [9.124.210.16])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 24 Oct 2024 17:34:27 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] KVM: PPC: Book3S HV: Mask off LPCR_MER for a vCPU before running it to avoid spurious interrupts
Date: Thu, 24 Oct 2024 23:04:14 +0530
Message-ID: <20241024173417.95395-1-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
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
X-Proofpoint-ORIG-GUID: rPSVTr5sSj3X-4dvbPrDDS4viP9J7qZZ
X-Proofpoint-GUID: Lnn7aZiXdWYvhNRbNr-4w1job6Z0k7rX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=624 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410240143
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Mask off the LPCR_MER bit before running a vCPU to ensure that it is not
set if there are no pending interrupts. Running a vCPU with LPCR_MER bit
set and no pending interrupts results in L2 vCPU getting an infinite flood
of spurious interrupts. The 'if check' in kvmhv_run_single_vcpu() sets
the LPCR_MER bit if there are pending interrupts.

The spurious flood problem can be observed in 2 cases:
1. Crashing the guest while interrupt heavy workload is running
  a. Start a L2 guest and run an interrupt heavy workload (eg: ipistorm)
  b. While the workload is running, crash the guest (make sure kdump
     is configured)
  c. Any one of the vCPUs of the guest will start getting an infinite
     flood of spurious interrupts.

2. Running LTP stress tests in multiple guests at the same time
   a. Start 4 L2 guests.
   b. Start running LTP stress tests on all 4 guests at same time.
   c. In some time, any one/more of the vCPUs of any of the guests will
      start getting an infinite flood of spurious interrupts.

The root cause of both the above issues is the same:
1. A NMI is sent to a running vCPU that has LPCR_MER bit set.
2. In the NMI path, all registers are refreshed, i.e, H_GUEST_GET_STATE
   is called for all the registers.
3. When H_GUEST_GET_STATE is called for lpcr, the vcpu->arch.vcore->lpcr
   of that vCPU at L1 level gets updated with LPCR_MER set to 1, and this
   new value is always used whenever that vCPU runs, regardless of whether
   there was a pending interrupt.
4. Since LPCR_MER is set, the vCPU in L2 always jumps to the external
   interrupt handler, and this cycle never ends.

Fix the spurious flood by making sure a vCPU's LPCR_MER is always masked
before running a vCPU.

Fixes: ec0f6639fa88 ("KVM: PPC: Book3S HV nestedv2: Ensure LPCR_MER bit is passed to the L0")
Cc: stable@vger.kernel.org # v6.8+
Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
V1 -> V2:
1. Mask off the LPCR_MER in vcpu->arch.vcore->lpcr instead of resetting
it so that we avoid grabbing vcpu->arch.vcore->lock. (Suggested by
Ritesh in an internal review)

 arch/powerpc/kvm/book3s_hv.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 8f7d7e37bc8c..b8701b5dde50 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5089,9 +5089,19 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 
 	do {
 		accumulate_time(vcpu, &vcpu->arch.guest_entry);
+		/*
+		 * L1's copy of L2's lpcr (vcpu->arch.vcore->lpcr) can get its MER bit
+		 * unexpectedly set - for e.g. during NMI handling when all register
+		 * states are synchronized from L0 to L1. L1 needs to inform L0 about
+		 * MER=1 only when there are pending external interrupts.
+		 * kvmhv_run_single_vcpu() anyway sets MER bit if there are pending
+		 * external interrupts. Hence, mask off MER bit when passing vcore->lpcr
+		 * here as otherwise it may generate spurious interrupts in L2 KVM
+		 * causing an endless loop, which results in L2 guest getting hung.
+		 */
 		if (cpu_has_feature(CPU_FTR_ARCH_300))
 			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
-						  vcpu->arch.vcore->lpcr);
+						  vcpu->arch.vcore->lpcr & ~LPCR_MER);
 		else
 			r = kvmppc_run_vcpu(vcpu);
 
-- 
2.47.0


