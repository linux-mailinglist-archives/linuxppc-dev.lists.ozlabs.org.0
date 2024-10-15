Return-Path: <linuxppc-dev+bounces-2270-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1520A99E03D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 10:04:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSRTC6hsFz2yGM;
	Tue, 15 Oct 2024 19:04:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728976787;
	cv=none; b=aHfh7rgz9y09THHNg1LByVapU0u+COvEzc3LN8K4g0LtWbkqru43EG7+6RV+pWcq6GUWO0iQOH1iddm6E/RTOuhl08yCzMz8UFjnt+Y3WKnYdxGjywKBJMstxFdIr4wPpghPPn+aKU4NZBJaiY/dxmEUycqa1u14s+L9vQt4WFV8jdk8y9TKXx6g80e8jsy5MgLVIY94tlUH1JDdE+/+PphzaHPNzWu6e2wvxq8nf25vfK+JBUxdwQu3A5M5d95badj1UdxJydAV7OwqoKEsv02uGqu5Ba48LF4CrTwscKrbaxX5JtXzr+/iPcIpPG0kYExewkQp28iwGSRUwgfjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728976787; c=relaxed/relaxed;
	bh=DMi9YO3e7Eu+djS8lokJU70DHc6dVgZju7R3SqDF/Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gneigsBZxEy3qPqEn9MEoIhBrUkj4/GTK79j0W1ckqjDQSsXoHOFGjT1/WJb9+ZJ+X3YOsjdYssAo4vTLpXQXTFf9LReGItuByl3VrNmOixv+IBzx3fV6b+kIFrAssjs8dLAJqoJP3YRV+yxggZXJ85Hh+39z6aLXmBGicffeb9uU/9bvAANe9wR6gjeDFd9pJqJ4OkdmpDHrNX4iCfJekkNYVLkFOK0ob1emto0GlTybUXxTJh5C/f0HuszdfgE77kIsa2alCEYx3LdAkEq3unohf78KIKnxtMeB6hLQzkLK38tx9FR4kbVa+1SmImiIx/hbveYdExxzCr5pkolOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oRl8OF+H; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oRl8OF+H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSQTZ0h65z2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 18:19:45 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F6nHpr015833;
	Tue, 15 Oct 2024 07:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=DMi9YO3e7Eu+djS8lokJU70DHc6dVgZju7R3SqDF/
	Hw=; b=oRl8OF+HscHph5F066m43FZmZA+a8Erjm7kdJ4p0ej1dhFozLvXXLqZ+F
	e4iiLsI/VsOzumTF3YCo08hBxzGH4mzEZji4MIuPn/hyenIY4lyaCgOdbTxWQURr
	uvo8piSRGA/M7YNFWP1iWPhhApfIQn+ZoJ1i986cBj/cE3bqbbjI2r50rOsSMzE3
	5jpTmArfcukQNMvyLBHy8ypd8zk1m/ZOQccvB4gGf0QwXFnSatMEE2CpsIRhBbLx
	2QuRv5qFk3wPFpNoR5Lw8wrWKI9zD0S4CXKZ0ybhI9x8+DvaBp79ejpSjmqDbaoF
	NQmBTdCvcVPwbKjlm0m1rRd9O/lCw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 429kf7r4xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 07:19:33 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49F7I1jO011094;
	Tue, 15 Oct 2024 07:19:33 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 429kf7r4wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 07:19:33 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49F71Hsx006671;
	Tue, 15 Oct 2024 07:19:06 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4283ertmqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 07:19:06 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49F7J5FJ56164768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Oct 2024 07:19:05 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4479320043;
	Tue, 15 Oct 2024 07:19:05 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B6DF20040;
	Tue, 15 Oct 2024 07:19:03 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.in.ibm.com (unknown [9.204.206.66])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 15 Oct 2024 07:19:02 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: PPC: Book3S HV: Reset LPCR_MER before running a vCPU to avoid spurious interrupts
Date: Tue, 15 Oct 2024 12:48:29 +0530
Message-ID: <20241015071831.229313-1-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.46.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _eKUh-zxI8-ZbJpD8Onr0EPqEjuFAfWj
X-Proofpoint-GUID: 77n-MqbNxLD2HzfaLJDPoIRFwa7ISm46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=687
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150047
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Reset LPCR_MER bit before running a vCPU to ensure that it is not set if
there are no pending interrupts. Running a vCPU with LPCR_MER bit set
and no pending interrupts results in L2 vCPU getting an infinite flood
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
1. A NMI is sent to a running vCPU that had LPCR_MER bit set.
2. In the NMI path, all registers are refreshed, i.e, H_GUEST_GET_STATE
   is called for all the registers.
3. When H_GUEST_GET_STATE is called for lpcr, the vcpu->arch.vcore->lpcr
   of that vCPU at L1 level gets updated with LPCR_MER set to 1, and this
   new value is always used whenever that vCPU runs, regardless of whether
   there was a pending interrupt.
4. Since LPCR_MER is set, the vCPU in L2 always jumps to the external
   interrupt handler, and this cycle never ends.

Fix the spurious flood by making sure LPCR_MER is always reset before
running a vCPU.

Fixes: ec0f6639fa88 ("KVM: PPC: Book3S HV nestedv2: Ensure LPCR_MER bit is passed to the L0")
Cc: stable@vger.kernel.org # v6.8+
Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 8f7d7e37bc8c..dca7cc301415 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -98,6 +98,13 @@
 /* Used to indicate that a guest passthrough interrupt needs to be handled */
 #define RESUME_PASSTHROUGH	(RESUME_GUEST | RESUME_FLAG_ARCH2)
 
+/* Clear LPCR_MER bit - If we run a L2 vCPU with LPCR_MER bit set but no pending external
+ * interrupts, we end up getting a flood of spurious interrupts in L2 KVM guests. To avoid
+ * that, reset LPCR_MER and let the check for pending interrupts in kvmhv_run_single_vcpu()
+ * set LPCR_MER if there are pending interrupts.
+ */
+#define kvmppc_reset_lpcr_mer(vcpu) (vcpu->arch.vcore->lpcr &= ~LPCR_MER)
+
 /* Used as a "null" value for timebase values */
 #define TB_NIL	(~(u64)0)
 
@@ -5091,7 +5098,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 		accumulate_time(vcpu, &vcpu->arch.guest_entry);
 		if (cpu_has_feature(CPU_FTR_ARCH_300))
 			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
-						  vcpu->arch.vcore->lpcr);
+						  kvmppc_reset_lpcr_mer(vcpu));
 		else
 			r = kvmppc_run_vcpu(vcpu);
 
-- 
2.46.2


