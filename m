Return-Path: <linuxppc-dev+bounces-2629-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B70F9B2AE9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 10:04:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcSBh61m9z2yGv;
	Mon, 28 Oct 2024 20:04:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730106284;
	cv=none; b=ALK6B4Za7mjBzFFaH1FJixC6J/kYEmHKCK5Vk54qfkTn/t/aGQHV1iMb2PaQ7dWglmAWTM0jByRUvAYwbR8n7btmHxuNjf+9md1FQ4U3swdxqgft0xdy1YDQw3IlulUWOhlGceQQtRZ9qGhHoNOdWywY4PqcQPnKqIFLJ6pkERZN2mlj4JZV6GMyd3mO+Q33z8BDQGMjRNFVbzqIP7KARoDVcazwreP0PXQzr7JcJF1QVyEAcYPvRR9x0yQI5DXF+8qzRmbKDWdbbVQ3foundCAypLDAPI28vDpMQkWmnn0DzNwf711wEyyaMdc2bsSK+O+Bjh95vepSrbje8vlAUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730106284; c=relaxed/relaxed;
	bh=t2Ci5kao+4+ddykeyTAEKEL8LLe1ptoQ/ZFa4/xPrt8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LxtREa1XJAi4q26GEVdNUTI1FT+wjEjQaccEv2AThVglRqUtcTfP9+H8ZYZjYacjQSEtKYTtN7R5ggU7PyZ2Kw2vDA4QJElAjrojmKCZ9e5d5JkDGbIykXSS0zwCcQT+tgaX4FMTLEpJmgtLBgpuOWq0RWeKiYBU75ORlwDdquQyXE6bpAWCpJU27vIgdrfHfxSkxIAVNNL4T4+1yaMmsKSBZXNGubv4gZqGC/ZWdaF68IUuBrDH3aXe8hV5hZxmdtF6t17Q9veHM0PlHQui2cSlM62I2yGBRkf6yCrF4YhNn7UD11Qbb9gchPEX4RNdGURFuzdAjWNJdImgE2/Y3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VcLW9I7G; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VcLW9I7G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcSBg49b6z2xPf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 20:04:43 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49S4nlQ0012398;
	Mon, 28 Oct 2024 09:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=t2Ci5kao+4+ddykeyTAEKEL8LLe1ptoQ/ZFa4/xPr
	t8=; b=VcLW9I7G0cv4k6lNT7SOX0XTQsVJeu2ZkujBj8xAIl169PAUVAuFNp9wk
	N0csdA+YZD2BQe9OtFW2YmP9CD3SBFTsjPbsl3Z9bQkComOCgSsTK9gB2YGhv9Aw
	A5RG1DA0bKZ0V8y+Ceyl0jLsqHJYw0ya4gxkYnhdxro+juIPyi5hLSq/cFvHmfBz
	SVFR8z+FinR6VY6RbVJQ3X/BajSoENbnFSwIq+ZFK9S6Pd0h0QEWNQwYS0iREUj8
	pGEU+2bXE3B1oN6g7mP2IWR0vCwirEjxuGV0SdhZhJ2tZUIJ5qjuabXHTPKObaZG
	TMMBtcnDDLnH5jmxL5/6fDBcxyiDg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42j3x498ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 09:04:27 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49S94Q8E021773;
	Mon, 28 Oct 2024 09:04:26 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42j3x498hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 09:04:26 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49S7JmlZ028181;
	Mon, 28 Oct 2024 09:04:25 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42hb4xnkjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 09:04:25 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49S94LQG53412288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 09:04:21 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4097F20043;
	Mon, 28 Oct 2024 09:04:21 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A4A42004D;
	Mon, 28 Oct 2024 09:04:19 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com.com (unknown [9.39.18.192])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Oct 2024 09:04:19 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, maddy@linux.ibm.com
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] KVM: PPC: Book3S HV: Mask off LPCR_MER for a vCPU before running it to avoid spurious interrupts
Date: Mon, 28 Oct 2024 14:34:09 +0530
Message-ID: <20241028090411.34625-1-gautam@linux.ibm.com>
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
X-Proofpoint-GUID: BZMeBVHIyD5nBrAPX4cdDejDlkm9YMrJ
X-Proofpoint-ORIG-GUID: _0AiW0j22I7z42wojGI2WOkXkmCtfxgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 mlxscore=0 suspectscore=0 clxscore=1015 mlxlogscore=676 malwarescore=0
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410280073
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Running a L2 vCPU (see [1] for terminology) with LPCR_MER bit set and no
pending interrupts results in that L2 vCPU getting an infinite flood of
spurious interrupts. The 'if check' in kvmhv_run_single_vcpu() sets the
LPCR_MER bit if there are pending interrupts.

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
3. When H_GUEST_GET_STATE is called for LPCR, the vcpu->arch.vcore->lpcr
   of that vCPU at L1 level gets updated with LPCR_MER set to 1, and this
   new value is always used whenever that vCPU runs, regardless of whether
   there was a pending interrupt.
4. Since LPCR_MER is set, the vCPU in L2 always jumps to the external
   interrupt handler, and this cycle never ends.

Fix the spurious flood by masking off the LPCR_MER bit before running a
L2 vCPU to ensure that it is not set if there are no pending interrupts.

[1] Terminology:
1. L0 : PAPR hypervisor running in HV mode
2. L1 : Linux guest (logical partition) running on top of L0
3. L2 : KVM guest running on top of L1

Fixes: ec0f6639fa88 ("KVM: PPC: Book3S HV nestedv2: Ensure LPCR_MER bit is passed to the L0")
Cc: stable@vger.kernel.org # v6.8+
Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
v1 -> v2:
1. Removed the macro which was silently clearing LPCR_MER bit from vcore->lpcr
and instead just masked it off while sending it to kvmhv_run_single_vcpu().
Added an inline comment describing the reason to avoid anyone tipping
it over. (Suggested by Ritesh in an internal review)

v2 -> v3:
1. Moved the masking of LPCR_MER from kvmppc_vcpu_run_hv() to
kvmhv_run_single_vcpu() (Suggested by Michael Ellerman)

 arch/powerpc/kvm/book3s_hv.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 8f7d7e37bc8c..0ed5c5c7a350 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4892,6 +4892,18 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 							   BOOK3S_INTERRUPT_EXTERNAL, 0);
 			else
 				lpcr |= LPCR_MER;
+		} else {
+			/*
+			 * L1's copy of L2's LPCR (vcpu->arch.vcore->lpcr) can get its MER bit
+			 * unexpectedly set - for e.g. during NMI handling when all register
+			 * states are synchronized from L0 to L1. L1 needs to inform L0 about
+			 * MER=1 only when there are pending external interrupts.
+			 * In the above if check, MER bit is set if there are pending
+			 * external interrupts. Hence, explicity mask off MER bit
+			 * here as otherwise it may generate spurious interrupts in L2 KVM
+			 * causing an endless loop, which results in L2 guest getting hung.
+			 */
+			lpcr &= ~LPCR_MER;
 		}
 	} else if (vcpu->arch.pending_exceptions ||
 		   vcpu->arch.doorbell_request ||
-- 
2.47.0


