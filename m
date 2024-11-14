Return-Path: <linuxppc-dev+bounces-3171-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF479C84F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 09:41:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XptsG0M08z2yst;
	Thu, 14 Nov 2024 19:40:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731573649;
	cv=none; b=VBOHUkjsKL/DZOkmM5pdBDiNozRy2XRVdqdD4KLD/vkDx4VdKLNLDBUucVcBIvITRH/WD4x01uMM4QskvNpK8cBGcyBDl5WzDjZapJ6HTtRIkpjAtbrVVWyiIIfAd3xKjtAl0uUB7jTMDMl3Qk9lx00UjW5eo+ZAnjRz2GUiXjff/+Xmr08DE7pCl0ZgfMyrtMUNaSuPFtEH9KOzxqpnuNIkOE6vxaZTSSjWjerbqjJsqBWVRnqb38dzpjvroFw0yrC9Pc5ddhepKGYdTBAE+DKBH9L2ag9G1kIr2VtoUtIfoNbsLe0EO5674s0g6hvi5wNipgpVMXIDTYsNNTm4LA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731573649; c=relaxed/relaxed;
	bh=Nts+ViAU3rrk8ZSLjBQCOLQxx67frAOELXyU/nk2O9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNYzcQEnpQJmcNmSccPEqEnrOIoKsSs+JCWzchD2UuXcflzmL8Gcu+3UWpbqCa5B9hqiVDlXKX2xzE6gDzc+iWXQFal9XubGy4Sw0BO/0M94pIW2eWGmYS7R1Iiq+t08vbPVK1kugcMtOqkSmNs12uFCNWpCqQFYrTUVJ6JVDp0NQanfPScuGXrtRk3j3Ajj5Xyx8kVGn+YSDS6YsdMhBsxm8zuGp6jTljpCt+KqfYTHobdeSbliOHrypHRdQVIZfRoveR148YYGTNKM4NqkrgnntgSy1V8aJAaOsaAkciVZ2B+rtpz4tRuk50fxooK+K7ZljWwTUsRdofm3fHvk+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dl/wdgv4; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dl/wdgv4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XptsD6RJqz2yGs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 19:40:48 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE7eKHZ012480;
	Thu, 14 Nov 2024 08:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Nts+ViAU3rrk8ZSLj
	BQCOLQxx67frAOELXyU/nk2O9k=; b=Dl/wdgv4kx/Uc7pzYNOhl+UpSa/xl+bIW
	VfqAOUzziaW/Mq4hxzSXrUEhjgeRNkeCRytJ8BeDOm94GrcMuauCqVLLKpQfyDuy
	NQhgH+347nsr9nUr61iXQosu/SGrU+iPDL3UI7WQsnSG0bIdPKLaR2gU1Jf4OhMr
	pU8nj/aRAiE1kc/ikjPD13EmaJJACIcNWz/4X9VaCinmhdgafRkMG5u1eewwHq7i
	p+9To/O3OBcbPs43z9oZ3GFAMPHnfP+LUUT0A0H49/oL+kaafI8U9jrJ+GPLMFFr
	j78vKFSJMaxFZ2sUcTI98yqM+2tC4ZT6oXbD3lCmjn7F+TwUyp3mQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42wd0ygefw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 08:40:40 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE1ssGT006674;
	Thu, 14 Nov 2024 08:40:39 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42tm9jfuwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 08:40:39 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AE8eYZI56295898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Nov 2024 08:40:34 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5548920040;
	Thu, 14 Nov 2024 08:40:34 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E13BC2004B;
	Thu, 14 Nov 2024 08:40:31 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.39.126])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Nov 2024 08:40:31 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, maddy@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, disgoel@linux.ibm.com,
        hbathini@linux.ibm.com, adubey@linux.ibm.com, gautam@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Kajol Jain <kjain@Linux.ibm.com>
Subject: [PATCH 3/4] powerpc/kvm: Add vpa latency counters to kvm_vcpu_arch
Date: Thu, 14 Nov 2024 14:10:12 +0530
Message-ID: <20241114084013.1140010-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241114084013.1140010-1-kjain@linux.ibm.com>
References: <20241114084013.1140010-1-kjain@linux.ibm.com>
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
X-Proofpoint-GUID: Qk-A4vCrCdNs7waXlP9rZhuaBtpuy9tJ
X-Proofpoint-ORIG-GUID: Qk-A4vCrCdNs7waXlP9rZhuaBtpuy9tJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140065
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Commit e1f288d2f9c69 ("KVM: PPC: Book3S HV nestedv2: Add support
for reading VPA counters for pseries guests") introduced support for new
Virtual Process Area(VPA) based software counters. These counters are
useful when observing context switch latency of L1 <-> L2. It also
added access to counters in lppaca, which is good enough to understand
latency details per-cpu level. But to extend and aggregate
per-process level(qemu) or per-pid/tid level(vcpu), these
counters also needs to be added as part of kvm_vcpu_arch struct.
Additional code added to update these new kvm_vcpu_arch variables
in do_trace_nested_cs_time function.

Signed-off-by: Kajol Jain <kjain@Linux.ibm.com>
Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_host.h | 5 +++++
 arch/powerpc/kvm/book3s_hv.c        | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 37e581c5b201..6e1108f8fce6 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -871,6 +871,11 @@ struct kvm_vcpu_arch {
 	struct kvmhv_tb_accumulator cede_time;	/* time napping inside guest */
 #endif
 #endif /* CONFIG_KVM_BOOK3S_HV_EXIT_TIMING */
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	u64 l1_to_l2_cs;
+	u64 l2_to_l1_cs;
+	u64 l2_runtime_agg;
+#endif
 };
 
 #define VCPU_FPR(vcpu, i)	(vcpu)->arch.fp.fpr[i][TS_FPROFFSET]
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index bc45cf09debc..b5bdb981c3e3 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4191,6 +4191,9 @@ static void do_trace_nested_cs_time(struct kvm_vcpu *vcpu)
 	*l1_to_l2_cs_ptr = l1_to_l2_ns;
 	*l2_to_l1_cs_ptr = l2_to_l1_ns;
 	*l2_runtime_agg_ptr = l2_runtime_ns;
+	vcpu->arch.l1_to_l2_cs = l1_to_l2_ns;
+	vcpu->arch.l2_to_l1_cs = l2_to_l1_ns;
+	vcpu->arch.l2_runtime_agg = l2_runtime_ns;
 }
 
 u64 kvmhv_get_l1_to_l2_cs_time(void)
-- 
2.43.5


