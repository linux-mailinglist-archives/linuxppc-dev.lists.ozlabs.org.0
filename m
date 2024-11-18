Return-Path: <linuxppc-dev+bounces-3411-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A359D0FE2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 12:42:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsQhH6Ysgz30gn;
	Mon, 18 Nov 2024 22:41:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731930111;
	cv=none; b=P/8i/I2Jhu1dzUkyTmP1GRLBxgD5VV2Umlp/ilafL8XM/AtPRfykuUnhwpCNQyvGr/yquoP4CZLRyOtf19l9Z2z+6iGTm43kXwMq2+eVy89Bz3WFWP7Pg2pU4jsImmYB0aRTfvIRt8TmzLHjbOG4p3j6ZIE2L/3gtoeTUbaAQbhvnJWbntvEPUILq/2jts16qGrngPFsJLICnMD4hjFcMx6tk9HUFhTE6/ezMwtzqoGPdfeljMwsaFI0NXx0DteBoREEp9DBIRWfBQZotcg+cdQWafeL0yXdr3/7zOFv6bxFt7O4Kzhh+NLAHmLc4oI1XYWoCX8aC5NztQRKS4vA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731930111; c=relaxed/relaxed;
	bh=RXuRG5xyNCHlIqEvVSmZoIl1pS6WmakUVIg1aZ5hNUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/6/o4uOwGMRTlx+OBjt7KNIrgj2wQl0i9uEzLb4xakoSRjN1qfiAAKgeEkExTfGb/kFzIVI8Uh95zXehtLzEkMu9EfEgGetII5a12eQBmXbbwMxOwVgwwVXff1IPlAxBSrYsplNLM1YA8uCsy3HBpr1Yl93USKKNftTRXP8/tIJ/89CS+oqmoJCLAzmWH4ZUHn7WM+FmdVvi3MIQmLbvR5RoQsPh33pT9qWMdaPY42dbv3lMvDPmcrDIqSylt6JgTCnO8mqgbDj4F4zkmDPG59y0SvjKl4Yps3INzJ2tcThnXwOpxcudGlWCsZJZWlChNwxYBABifETixCpFvkzYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nnz0yyww; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nnz0yyww;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsQh72xK2z30MY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 22:41:43 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5fh2L008868;
	Mon, 18 Nov 2024 11:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=RXuRG5xyNCHlIqEvV
	SmZoIl1pS6WmakUVIg1aZ5hNUw=; b=nnz0yyww/F5A1TlwNPnSbVQy4aHMPTX2d
	gvu3qclm0zT0ACi0DbZ5UIGPhBbrRkqsHp8t5q/OboK9yZCWK/wNR7M2FqERM48m
	JiVOTrOGaznvt1+4OUQet7ZALV/BOYH8FUlpe/45B8c5xB+ZGzPvfdZETrlZu+Lx
	T5vQVJC6X6DSWlFwb8ci+C7hB1rLmZB+qb7vVfIEMaQhvoCwyk5a0sWth09h17p/
	pTtwFQVYz/d9G7mc9KPCEHtGP45YkE2FHoRXzXgORJxxS5VzxKdXgm7tt5vVIxwZ
	SnFiG+W17Q9m0wP1fMDCZmeN0+tL0Gcpn5ZFiJJ484KOLsBzZUgpw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42xk2vskuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 11:41:36 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI1ox3b030682;
	Mon, 18 Nov 2024 11:41:35 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 42y5qsajqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 11:41:35 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AIBfVTM50790840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Nov 2024 11:41:31 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 768B820043;
	Mon, 18 Nov 2024 11:41:31 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14F5620040;
	Mon, 18 Nov 2024 11:41:29 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.96.153])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 18 Nov 2024 11:41:28 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, maddy@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, disgoel@linux.ibm.com,
        hbathini@linux.ibm.com, adubey@linux.ibm.com, gautam@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] powerpc/perf: Add per-task/process monitoring to vpa_pmu driver
Date: Mon, 18 Nov 2024 17:11:14 +0530
Message-ID: <20241118114114.208964-4-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241118114114.208964-1-kjain@linux.ibm.com>
References: <20241118114114.208964-1-kjain@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: uXaG0UGimiCFI3dngSYvbYvBAehKy3zV
X-Proofpoint-GUID: uXaG0UGimiCFI3dngSYvbYvBAehKy3zV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 spamscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180096
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Enhance the vpa_pmu driver with a feature to observe context switch
latency event for both per-task (tid) and per-pid (pid) option.
Couple of new helper functions are added to hide the abstraction of
reading the context switch latency counter from kvm_vcpu_arch struct
and these helper functions are defined in the "kvm/book3s_hv.c".

"PERF_ATTACH_TASK" flag is used to decide whether to read the counter
values from lppaca or kvm_vcpu_arch struct.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_book3s_64.h |  3 ++
 arch/powerpc/kvm/book3s_hv.c             | 45 ++++++++++++++++++++++++
 arch/powerpc/perf/vpa-pmu.c              | 15 ++++++--
 3 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index f620e3126d68..b936e174eefd 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -691,6 +691,9 @@ void kvmhv_set_l2_counters_status(int cpu, bool status);
 u64 kvmhv_get_l1_to_l2_cs_time(void);
 u64 kvmhv_get_l2_to_l1_cs_time(void);
 u64 kvmhv_get_l2_runtime_agg(void);
+u64 kvmhv_get_l1_to_l2_cs_time_vcpu(void);
+u64 kvmhv_get_l2_to_l1_cs_time_vcpu(void);
+u64 kvmhv_get_l2_runtime_agg_vcpu(void);
 
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 4284437fedeb..ddc380982233 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4214,6 +4214,51 @@ u64 kvmhv_get_l2_runtime_agg(void)
 }
 EXPORT_SYMBOL(kvmhv_get_l2_runtime_agg);
 
+u64 kvmhv_get_l1_to_l2_cs_time_vcpu(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vcpu_arch *arch;
+
+	vcpu = local_paca->kvm_hstate.kvm_vcpu;
+	if (vcpu) {
+		arch = &vcpu->arch;
+		return arch->l1_to_l2_cs;
+	} else {
+		return 0;
+	}
+}
+EXPORT_SYMBOL(kvmhv_get_l1_to_l2_cs_time_vcpu);
+
+u64 kvmhv_get_l2_to_l1_cs_time_vcpu(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vcpu_arch *arch;
+
+	vcpu = local_paca->kvm_hstate.kvm_vcpu;
+	if (vcpu) {
+		arch = &vcpu->arch;
+		return arch->l2_to_l1_cs;
+	} else {
+		return 0;
+	}
+}
+EXPORT_SYMBOL(kvmhv_get_l2_to_l1_cs_time_vcpu);
+
+u64 kvmhv_get_l2_runtime_agg_vcpu(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vcpu_arch *arch;
+
+	vcpu = local_paca->kvm_hstate.kvm_vcpu;
+	if (vcpu) {
+		arch = &vcpu->arch;
+		return arch->l2_runtime_agg;
+	} else {
+		return 0;
+	}
+}
+EXPORT_SYMBOL(kvmhv_get_l2_runtime_agg_vcpu);
+
 #else
 int kvmhv_get_l2_counters_status(void)
 {
diff --git a/arch/powerpc/perf/vpa-pmu.c b/arch/powerpc/perf/vpa-pmu.c
index 2c785eee2f71..601de245392c 100644
--- a/arch/powerpc/perf/vpa-pmu.c
+++ b/arch/powerpc/perf/vpa-pmu.c
@@ -97,13 +97,22 @@ static unsigned long get_counter_data(struct perf_event *event)
 
 	switch (config) {
 	case L1_TO_L2_CS_LAT:
-		data = kvmhv_get_l1_to_l2_cs_time();
+		if (event->attach_state & PERF_ATTACH_TASK)
+			data = kvmhv_get_l1_to_l2_cs_time_vcpu();
+		else
+			data = kvmhv_get_l1_to_l2_cs_time();
 		break;
 	case L2_TO_L1_CS_LAT:
-		data = kvmhv_get_l2_to_l1_cs_time();
+		if (event->attach_state & PERF_ATTACH_TASK)
+			data = kvmhv_get_l2_to_l1_cs_time_vcpu();
+		else
+			data = kvmhv_get_l2_to_l1_cs_time();
 		break;
 	case L2_RUNTIME_AGG:
-		data = kvmhv_get_l2_runtime_agg();
+		if (event->attach_state & PERF_ATTACH_TASK)
+			data = kvmhv_get_l2_runtime_agg_vcpu();
+		else
+			data = kvmhv_get_l2_runtime_agg();
 		break;
 	default:
 		data = 0;
-- 
2.43.5


