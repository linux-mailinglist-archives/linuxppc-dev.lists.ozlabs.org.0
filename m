Return-Path: <linuxppc-dev+bounces-3410-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 433809D0FE1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 12:42:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XsQhH4gVsz2yfm;
	Mon, 18 Nov 2024 22:41:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731930111;
	cv=none; b=V7iMQfZL6UdbSI1hlCFbQixDZJUzPIXfR/W+TNQOWYtPk9YEB85WLgzd+T2AhqDeQKBWHDNzcgrzAr5fuOWuqwf4ULIZgoqFEzQ3v1idMb+BvZIkLYDV07HxtSX+vawQyjeFC4EyZW4dSLgHpXcEw/61PRj8PP+/KVpVKJN9daDQhEc3V8XAIBY3I6SCOGdqE7KWfREn9MuxoBtub+nn24KgEkA5hb6A9h+/jSISJulPNkJ+cv2eO9/L2YdH/KG6o43MX3CAjj0nNSI6DwyfTz/nMH5afPTRQlV6pFBMRkWz/rza/oijeVeuLfgwBuertbmzvUJZRHeuX9VMOB4yWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731930111; c=relaxed/relaxed;
	bh=FoXnvSXv7yc0VJ+tOcQ2JahCSZ5P4DOIhi6BbuvkN0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VndATZ4/e3HPjSn0SQTLDrNnJ8ddUeCgSmFm4jCQantcC9dCot/iTN51kdeLgBYR8uI7IJl9s42sPhBLcm/alCf0g3l9TzuvBVHj/5EP2A72dbGacinf+d+VtXeVTYELY2gLxTftircVpo1XufMR7+V126NfEzX4NG7cqvIyaiikdCJMi81PNk6BZ3cOKPUmzWuYcFMmkvIVDXx4lmrEpYRpRZbd8CpRe3l4KhCroSn9nArjEyC2L+3fHq7rNTgzsZFPVcDIUZDyax4ysmrlVePt3HjLLHrdmD7+sYCWlhJYmxeRGEP2UacRR0BaVSdb7oJR89vGY/BO1RV07XSFWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FPGuCsqk; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FPGuCsqk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsQh53spyz30HH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 22:41:41 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI9gX2B029253;
	Mon, 18 Nov 2024 11:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=FoXnvSXv7yc0VJ+tO
	cQ2JahCSZ5P4DOIhi6BbuvkN0c=; b=FPGuCsqkUKtE+AvJehKtF5L5mypg6ZHhI
	FO9mvwlWyWn+9boabOazQ3ms7q8SmXnLTLO7ZzMdX3OxRFmpXHlh+j7JfGqgf5Bv
	FrwIy5vZ3Twg+EwxBkQ5lKZIVh7g6eeg4wdsNitg1c7Fss/vS/A33z9G7dZwtCZD
	wA9nZM2pbYc82UKCx7w7Uf4pMNsp4tGX/Jfg3edZ5WGr7nKfePterK1MjCc2hh+k
	w2FnwVgwKbo9B/g1jkOvrlsQkpWzOxPu8XBCiAu4St79VIllbWapc/Iu8B4ZpDSy
	dAWikapmswRTY3leOdRzhiDgNxDESxwcfHSrVA+UsPOMThqwZUXTg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42xk2vskud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 11:41:34 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIA07pq000576;
	Mon, 18 Nov 2024 11:41:33 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42y77kk781-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 11:41:33 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AIBfStD53936458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Nov 2024 11:41:28 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAD2B20043;
	Mon, 18 Nov 2024 11:41:28 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C01320040;
	Mon, 18 Nov 2024 11:41:23 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.96.153])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 18 Nov 2024 11:41:23 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, maddy@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, disgoel@linux.ibm.com,
        hbathini@linux.ibm.com, adubey@linux.ibm.com, gautam@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Kajol Jain <kjain@Linux.ibm.com>
Subject: [PATCH v2 3/4] powerpc/kvm: Add vpa latency counters to kvm_vcpu_arch
Date: Mon, 18 Nov 2024 17:11:13 +0530
Message-ID: <20241118114114.208964-3-kjain@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: NfAgXiN8f7FgSlRGs6-Orbm5Cm__yZsE
X-Proofpoint-GUID: NfAgXiN8f7FgSlRGs6-Orbm5Cm__yZsE
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
index e618533dfc4b..4284437fedeb 100644
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


